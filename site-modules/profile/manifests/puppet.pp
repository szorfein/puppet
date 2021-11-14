class profile::puppet {

  include pkgs::cron

  file { '/usr/local/bin/run-puppet':
    ensure  => present,
    content => file('profile/run-puppet.sh'),
    mode    => '0744',
  }

  cron { 'run-puppet':
    command => "/usr/local/bin/run-puppet",
    hour    => '*',
    minute  => '*/30',
  }
}
