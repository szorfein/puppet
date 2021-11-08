$cron = $operatingsystem ? {
  gentoo  => 'virtual/cron',
  default => cronie
}

package { 'cron':
  ensure => installed,
  name   => $cron,
}

file { '/usr/local/bin/run-puppet':
  ensure => present,
  source => '/etc/puppetlabs/code/environments/production/files/run-puppet.sh',
  mode   => '0744',
}

cron { 'run-puppet':
  command => "/usr/local/bin/run-puppet",
  hour    => 2,
  minute  => '*/15',
}
