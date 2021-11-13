class profile::ulimit {

  file_line { 'limit-hard-core':
    path => '/etc/security/limits.conf',
    line => '* hard core 0',
  }
}
