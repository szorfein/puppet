# puppet
My whole system managed by [Puppet](https://puppet.com/).

## Dependencies

    puppet git

## Clone and install this repository

    curl -s https://raw.githubusercontent.com/szorfein/puppet/main/install.sh | sudo sh

Or manually:

    cd /etc/puppetlabs/code/environments
    sudo mv production production.backup
    sudo git clone https://github.com/szorfein/puppet production

## First launch

    sudo puppet apply /etc/puppetlabs/code/environments/production/manifests

## Scripts added

+ `/usr/local/bin/run-puppet`: update the repo and apply new change.
+ `/usr/local/bin/secure-time-sync`: update localtime securely [src](https://gitlab.com/madaidan/secure-time-sync/).
