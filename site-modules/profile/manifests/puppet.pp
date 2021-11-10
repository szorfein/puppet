class profile::puppet {

  include cron

  file { '/usr/local/bin/run-puppet':
    ensure => present,
    source => 'puppet://modules/profile/run-puppet.sh',
    mode   => '0744',
  }

  cron { 'run-puppet':
    command => "/usr/local/bin/run-puppet",
    hour    => '*',
    minute  => '*/15',
  }
}
