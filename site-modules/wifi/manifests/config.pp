class wifi::config {

  if $wifi::enable {
    if $wifi::client == 'iwd' {

      file { '/etc/iwd/main.conf':
        ensure  => file,
        content => epp('wifi/iwd.conf.epp'),
        notify  => Service['iwd']
      }
    }
  }
}
