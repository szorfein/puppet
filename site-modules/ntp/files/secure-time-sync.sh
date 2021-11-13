#!/bin/bash

#    Secure Time Synchronization
#    Copyright (C) 2019  madaidan
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

set -o errexit

die() { echo "ERROR: $1"; exit 1; }

# Exits if the script isn't running as root.
[ "$(id -u)" -eq 0 ] || die "This program needs to be run as root."

while [ "$#" -gt 0 ] ; do
    case "$1" in
      --use-tor)
        use_tor="true"
        break
        ;;
      -- | -* | *)
        die "${0} -> Invalid option '$1'"
        ;;
    esac
done

# Select a random website out of the pool.
select_pool() {
  # Use the onion service if the "--use-tor" flag was set.
  if [ "${use_tor}" = "true" ]; then
    #POOL[1]="http://expyuzz4wqqyqhjn.onion"
    POOL[1]="http://2gzyxa5ihm7nsggfxnu52rck2vv4rvmdlkiu3zzui5du4xyclen53wid.onion"
  else
    POOL[1]="https://www.torproject.org"
  fi

  # Tails website.
  POOL[2]="https://tails.boum.org"

  # Whonix website.
  if [ "${use_tor}" = "true" ]; then
    POOL[3]="http://dds6qkxpwdeubwucdiaord2xgbbeyds25rbsgr73tbfpqpt4a6vjwsyd.onion"
  else
    POOL[3]="https://www.whonix.org"
  fi

  # DuckDuckGo.
  if [ "${use_tor}" = "true" ]; then
    #POOL[4]="https://3g2upl4pq6kufc4m.onion"
    POOL[4]="https://duckduckgogg42xjoc72x3sjasowoarfbgcmvfimaftt6twagswzczad.onion"
  else
    POOL[4]="https://duckduckgo.com"
  fi

  # EFF.
  POOL[5]="https://www.eff.org"

  # The last one doesn't get selected. Without the following line, POOL[5] would never be selected.
  POOL[6]=""

  rand=$[$RANDOM % ${#POOL[@]}]
  SELECTED_POOL="${POOL[$rand]}"

  # If nothing was selected, run select_pool again.
  if [ "${SELECTED_POOL}" = "" ]; then
    select_pool
  fi
}

select_pool

if [ "${use_tor}" = "true" ]; then
  # Configure curl to use a socks proxy at localhost on port 9050. This is the default Tor socksport.
  SECURE_CURL="curl -sI --socks5-hostname localhost:9055"
else
  # Protects against https downgrade attacks when not using Tor.
  SECURE_CURL="curl -sI --tlsv1.2 --proto =https"
fi

if ! ${SECURE_CURL} -s ${SELECTED_POOL} &>/dev/null; then
  die "Could not connect to the website."
fi

# Extract the current time from the http header when connecting to one of the websites in the pool.
NEW_TIME=$(${SECURE_CURL} ${SELECTED_POOL} 2>&1 | grep -i "Date" | sed -e 's/Date: //' | sed -e 's/date: //')

# Output the extracted time and selected pool for debugging.
if [ "${DEBUG_TS}" = "1" ]; then
  echo "${SELECTED_POOL}"
  echo "${NEW_TIME}"
fi

# Set the time to the value we just extracted.
date -s "${NEW_TIME}"
