#!/usr/bin/env sh

set -o errexit

WORKDIR="/etc/puppetlabs/code/environments/main"

die() { echo "[-] $1"; exit 1; }

[ -d "$WORKDIR" ] || die "No directory $WORKDIR found."
[ "$(id -u)" -eq 0 ] || die "Please run as root."

r10k deploy environment --puppetfile
puppet apply --environment main "$WORKDIR"/manifests/
