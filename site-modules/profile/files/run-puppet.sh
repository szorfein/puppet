#!/usr/bin/env sh

set -o errexit

BRANCH=""

die() { echo "[-] $1"; exit 1; }

case "$1" in
  dev) BRANCH="develop" ;;
  *) BRANCH="main" ;;
esac

WORKDIR="/etc/puppetlabs/code/environments/$BRANCH"

echo "Calling branch $BRANCH"

[ -d "$WORKDIR" ] || die "No directory $WORKDIR found."
[ "$(id -u)" -eq 0 ] || die "Please run as root."

r10k deploy environment --puppetfile
puppet apply --environment main "$WORKDIR"/manifests/
