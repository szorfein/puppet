class pkgs::iwd::service {

  if find_file('/bin/systemctl') {

    service { 'iwd':
      ensure   => running,
      enable   => true,
      provider => 'systemd'
    }
  } else {

    service { 'iwd':
      ensure   => running,
      enable   => true,
    }
  }
}
