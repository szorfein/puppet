class profile::core_dump {

  # ulimit
  file_line { 'limit-hard-core':
    path => '/etc/security/limits.conf',
    line => '* hard core 0',
  }

  # sysctl
  if find_file('/etc/sysctl.d') {
    file { '/etc/sysctl.d/kernel.core_pattern.conf':
      ensure  => present,
      content => "kernel.core_pattern=|/bin/false\n"
    }
  } else {
    file_line { 'sysctl-hard-core':
      path => '/etc/sysctl.conf',
      line => "kernel.core_pattern=|/bin/false\n"
    }
  }

  # if systemd
  if find_file('/etc/systemd/coredump.conf.d') {

    file { '/etc/systemd/coredump.conf.d/disable.conf':
      ensure  => present,
      content => "[Coredump]\nStorage=none\n"
    }
  }
}
