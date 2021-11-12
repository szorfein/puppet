class profile::puppet {

  include pkgs::cron

  $dir = '/etc/puppetlabs/code/environments/production/site-modules/profile/files'

  file { '/usr/local/bin/run-puppet':
    ensure => present,
    source => "${dir}/run-puppet.sh",
    mode   => '0744',
  }

  cron { 'run-puppet':
    command => "/usr/local/bin/run-puppet",
    hour    => '*',
    minute  => '*/30',
  }
}
