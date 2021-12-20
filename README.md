# puppet
My whole system managed by [Puppet](https://puppet.com/).

## Dependencies

    puppet git r10k curl

## Clone and install this repository

    curl -s https://raw.githubusercontent.com/szorfein/puppet/main/files/install.sh | sudo sh

## Configuration
The configuration is made into `data/common.yaml`, you may change for example the `ntp::use_tor`

```yaml
---
  ntp::use_tor: false
```

Will use only `https`, if `use_tor` is `true`, it use `onion` address like `http://dds6qkxpwdeubwucdiaord2xgbbeyds25rbsgr73tbfpqpt4a6vjwsyd.onion`.

## First launch

    sudo puppet apply --environment main /etc/puppetlabs/code/environments/main/manifests

## Scripts added

+ `/usr/local/bin/run-puppet`: update the repo and apply new change.
+ `/usr/local/bin/secure-time-sync`: update localtime securely [src](https://gitlab.com/madaidan/secure-time-sync/).

#### Links

+ [Archlinux Security](https://wiki.archlinux.org/title/Security)
+ [Linux hardening](https://madaidans-insecurities.github.io/guides/linux-hardening.html)
+ [Privacy Tools](https://www.privacytools.io/)
+ [Secure Shell](https://stribika.github.io/2015/01/04/secure-secure-shell.html)
