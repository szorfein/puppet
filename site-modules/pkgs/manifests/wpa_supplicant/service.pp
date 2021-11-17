class pkgs::wpa_supplicant::service {

  if find_file('/bin/systemctl') {

    service { 'wpa_supplicant':
      ensure   => running,
      enable   => true,
      provider => 'systemd'
    }
  } else {

    service { 'wpa_supplicant':
      ensure => running,
      enable => true,
    }
  }
}
