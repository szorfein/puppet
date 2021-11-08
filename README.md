# puppet
My whole system managed by [Puppet](https://puppet.com/).

## Dependencies

    puppet

## Clone this repository

    cd /etc/puppetlabs/code/environments
    sudo mv production production.backup
    sudo git clone https://github.com/szorfein/puppet production

## Start Puppet

    cd /etc/puppetlabs/code/environments/production
    sudo puppet apply manifests/

