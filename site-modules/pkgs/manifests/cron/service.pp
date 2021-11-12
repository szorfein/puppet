class pkgs::cron::service {

  $systemctl = '/bin/systemctl'

  if find_file($systemctl) {

    service { 'cronie':
      ensure   => running,
      enable   => true,
      provider => 'systemd'
    }
  } else {

    service { 'cronie':
      ensure   => running,
      enable   => true
    }
  }
}
