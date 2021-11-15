class wifi::config {

  if $wifi::enable {
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
    }
  }
}
