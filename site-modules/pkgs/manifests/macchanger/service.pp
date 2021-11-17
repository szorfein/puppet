class pkgs::macchanger::service {

  # if systemd
  if find_file('/etc/systemd/system') {

    file { '/etc/systemd/system/macspoof@.service':
      content => file('pkgs/macspoof.service'),
      ensure  => present,
      mode    => '0744'
    }
  }
}
