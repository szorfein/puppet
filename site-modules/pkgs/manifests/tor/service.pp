class pkgs::tor::service {

  if find_file('/bin/systemctl') {

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
