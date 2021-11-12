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
The configuration is made into `data/common.yaml`, you may change for example the `ntp::use_tor`

```yaml
---
  ntp::use_tor: false
```

Will use only `https`, if `tor` is `true`, it use address like `http://dds6qkxpwdeubwucdiaord2xgbbeyds25rbsgr73tbfpqpt4a6vjwsyd.onion` or `https://3g2upl4pq6kufc4m.onion`.

## First launch

    sudo puppet apply /etc/puppetlabs/code/environments/production/manifests

## Scripts added

+ `/usr/local/bin/run-puppet`: update the repo and apply new change.
+ `/usr/local/bin/secure-time-sync`: update localtime securely [src](https://gitlab.com/madaidan/secure-time-sync/).
