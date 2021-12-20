class wifi::config {

  if $wifi::client == 'iwd' {

    if find_file('/etc/systemd/resolved.conf') {
      $dns = 'systemd'
    } else {
      $dns = 'resolvconf'
    }

    file { '/etc/iwd/main.conf':
      ensure  => file,
      content => epp('wifi/iwd.conf.epp', {
        'dns' => $dns,
      }),
      notify  => Service['iwd']
    }

  } elsif $wifi::client == 'wpa_supplicant' {

    $conf = '/etc/wpa_supplicant/wpa_supplicant.conf'

    file { $conf:
      ensure => present,
      mode   => '0600'
    }

    if $wifi::spoof_mac {

      file_line { 'mac_addr':
        path  => $conf,
        line  => 'mac_addr=1',
        match => '^mac_addr'
      }

      file_line { 'preassoc_mac_addr':
        path  => $conf,
        line  => 'preassoc_mac_addr=1',
        match => '^preassoc_mac_addr'
      }

      file_line { 'gas_rand_mac_addr':
        path   => $conf,
        line   => 'gas_rand_mac_addr=1',
        match  => '^gas_rand_mac_addr',
        notify => Service['wpa_supplicant']
      }
    } else {

      file_line { 'remove_mac_addr':
        ensure            => absent,
        path              => $conf,
        match             => '^mac_addr=1',
        match_for_absence => true
      }

      file_line { 'remove_preassoc_mac_addr':
        ensure            => absent,
        path              => $conf,
        match             => '^preassoc_mac_addr=1',
        match_for_absence => true
      }

      file_line { 'remove_gas_rand_mac_addr':
        ensure            => absent,
        path              => $conf,
        match             => '^gas_rand_mac_addr=1',
        match_for_absence => true,
        notify            => Service['wpa_supplicant']
      }
    }
  }
}
