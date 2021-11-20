class ssh::service {

  # if systemd
  if find_file('/bin/systemctl') {
    service { 'sshd':
      ensure   => running,
      enable   => true,
      provider => 'systemd'
    }
  } else {
    service { 'sshd':
      ensure => running,
      enable => true
    }
  }
}
