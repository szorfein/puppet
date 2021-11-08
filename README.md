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

## Start Puppet

    sudo puppet apply /etc/puppetlabs/code/environments/production/manifests

