class tor::service {

  $systemctl = '/bin/systemctl'

  if find_file($systemctl) {

    service { 'tor':
      ensure   => running,
      enable   => true,
      provider => 'systemd'
    }
  } else {

    service { 'tor':
      ensure => running,
      enable => true,
    }
  }
}
