# puppet
My whole system managed by [Puppet](https://puppet.com/).

## Dependencies

    puppet git r10k curl

## Clone and install this repository

    curl -s https://raw.githubusercontent.com/szorfein/puppet/main/files/install.sh | sudo sh

## Configuration
The configuration can be made into `data/common.yaml`. You can also create a config for your target PC with:

    $ facter dmi.board.product
    W51XTU

    touch data/board/W51XTU.yaml

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
