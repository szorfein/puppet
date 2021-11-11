# puppet
My whole system managed by [Puppet](https://puppet.com/).

## Dependencies

    puppet git

## Clone and install this repository

    curl -s https://raw.githubusercontent.com/szorfein/puppet/main/files/install.sh | sudo sh

Or manually:

    cd /etc/puppetlabs/code/environments
    sudo mv production production.backup
    sudo git clone https://github.com/szorfein/puppet production

## Configuration
The configuration is made into `data/common.yaml`, you may change for example the `service_provider`

```yaml
---
  service_provider: 'runnit'
```

The list of the service provider are [here](https://puppet.com/docs/puppet/7/types/service.html#service-attribute-provider).

## First launch

    sudo puppet apply /etc/puppetlabs/code/environments/production/manifests

## Scripts added

+ `/usr/local/bin/run-puppet`: update the repo and apply new change.
+ `/usr/local/bin/secure-time-sync`: update localtime securely [src](https://gitlab.com/madaidan/secure-time-sync/).
