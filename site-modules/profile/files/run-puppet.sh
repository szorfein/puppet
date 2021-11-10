#!/usr/bin/env sh

set -o errexit

WORKDIR="/etc/puppetlabs/code/environments/production"

die() { echo "[-] $1"; return 1; }

[ -d "$WORKDIR" ] || die "No directory $WORKDIR found."
[ "$(id -u)" -eq 0 ] || die "Please run as root."

cd "$WORKDIR"
git pull
puppet apply --environment production manifests/
