#!/usr/bin/env sh

set -o errexit

cd /etc/puppetlabs/code/environments/production && git pull

/opt/puppetlabs/bin/puppet apply manifests/
