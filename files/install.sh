#!/usr/bin/env sh

set -o errexit

WORKDIR="/etc/puppetlabs/code/environments"

die() { echo "[-] $1"; return 1; }

[ -d /etc/puppetlabs ] || die "directory /etc/puppetlabs no found"
[ "$(id -u)" -eq 0 ] || die "Please run as root"

echo "Installing my Puppet dots..."

cd "$WORKDIR"
[ -d ./production ] && die "An existing directory $WORKDIR/production exist"
git clone https://github.com/szorfein/puppet production

# Installing modules
while read line; do
  sh -c "$line"
done < ./files/modules-list

echo "Install done."
