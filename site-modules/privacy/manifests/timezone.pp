class privacy::timezone {

  if $privacy::generic_timezone {
    
    # if systemd
    if find_file('/bin/systemctl') or find_file('/usr/bin/systemctl') {

      file { '/etc/localtime':
        ensure => link,
        target => '/usr/share/zoneinfo/UTC'
      }
    }

    file { '/etc/timezone':
      ensure  => present,
      content => "UTC\n"
    }
  }
}
