class wifi::config {

  if $wifi::enable {
    if $wifi::client == 'iwd' {

      file { '/etc/iwd/main.conf':
        ensure  => file,
        content => file('wifi/iwd.conf.erb'),
        notify  => Service['iwd']
      }
    }
  }
}
