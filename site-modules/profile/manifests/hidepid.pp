class profile::hidepid {

  group { 'proc':
    ensure => present
  }

  file_line { 'fstab-hidepid':
    ensure => present,
    path   => '/etc/fstab',
    line   => 'proc /proc proc nosuid,nodev,noexec,hidepid=2,gid=proc 0 0',
    match  => '^proc'
  }

  # if systemd
  if find_file('/etc/systemd/system/systemd-logind.service.d') {

    file { '/etc/systemd/system/systemd-logind.service.d/hidepid.conf':
      ensure  => present,
      content => "[Service]\nSupplementaryGroups=proc\n"
    }
  }
}
