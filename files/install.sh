#!/usr/bin/env sh

set -o errexit

WORKDIR="/etc/puppetlabs/code/environments"
DEPS="puppet git r10k curl"
DEPS_LACKED=""

die() { echo "[-] $1"; exit 1; }

search_dep() {
  echo "Searching dependencies..."

  for dep in $DEPS; do
    if ! hash "$dep" 2>/dev/null ; then
      DEPS_LACKED="$dep $DEPS_LACKED"
    fi
  done

  [ -z "$DEPS_LACKED" ] && return 0
  return 1
}

installing_dep() {
  if [ -f /etc/gentoo-release ] ; then

    [ -d /etc/portage/package.accept_keywords ] \
      || mkdir -p /etc/portage/package.accept_keywords

    GENTOO_DEPS=""
    for dep in $DEPS_LACKED; do
      if [ "$dep" == "git" ] ; then
        GENTOO_DEPS="dev-vcs/git $GENTOO_DEPS"
      else
        GENTOO_DEPS="$dep $GENTOO_DEPS"
      fi
    done

    # masked by ~amd64 keyword...
    echo "app-admin/r10k" > /etc/portage/package.accept_keywords/r10k
    echo "dev-ruby/colored2" >> /etc/portage/package.accept_keywords/r10k
    echo "dev-ruby/cri" >> /etc/portage/package.accept_keywords/r10k
    echo "dev-ruby/puppet_forge" >> /etc/portage/package.accept_keywords/r10k
    echo "dev-ruby/faraday" >> /etc/portage/package.accept_keywords/r10k
    echo "dev-ruby/faraday_middleware" >> /etc/portage/package.accept_keywords/r10k
    echo "dev-ruby/simple_oauth" >> /etc/portage/package.accept_keywords/r10k
    echo "dev-ruby/rash_alt" >> /etc/portage/package.accept_keywords/r10k
    echo "dev-ruby/multipart-post" >> /etc/portage/package.accept_keywords/r10k

    chmod 644 /etc/portage/package.accept_keywords/r10k

    echo "Installing $GENTOO_DEPS for Gentoo..."
    emerge -av $GENTOO_DEPS
  else
    echo "Don't known how install $DEPS_LACKED for you system."
    echo "Please, ensure they are installed."
  fi
}

installing_puppet_repo() {
  echo "Installing my Puppet repository..."

  [ -d /etc/puppetlabs/r10k ] || mkdir -p /etc/puppetlabs/r10k
  curl -sSL -o /etc/puppetlabs/r10k/r10k.yaml https://raw.githubusercontent.com/szorfein/puppet/main/files/r10k.yaml

  r10k deploy environment --puppetfile

  echo "Install done"
}

main() {
  [ -d /etc/puppetlabs ] || die "directory /etc/puppetlabs no found"
  [ "$(id -u)" -eq 0 ] || die "Please run as root"

  if ! search_dep ; then
    installing_dep
  fi

  installing_puppet_repo
}

main
