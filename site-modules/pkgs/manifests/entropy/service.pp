class pkgs::entropy::service {

  if $operatingsystem == 'Gentoo' {
    unless $facts['os']['architecture'] == 'amd64' {

      # if systemd
      if find_file('/bin/systemctl') {

        service { 'haveged':
          ensure   => running,
          enable   => true,
          provider => 'systemd'
        }
      } else {

        service { 'haveged':
          ensure => running,
          enable => true
        }
      }
    }
  } else {

    service { 'haveged':
      ensure => running,
      enable => true
    }
  }
}
