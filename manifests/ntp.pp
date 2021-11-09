if lookup('use_tor', Boolean) {

  file_line { 'add-secure-time-sync-tor':
    path   => '/etc/tor/torrc',
    line   => 'SocksPort 9055',
    notify => Service['tor'],
  }

  service { 'tor':
    ensure     => running,
    enable     => true,
  }
} else {

  file_line { 'delete-secure-time-sync-tor':
    ensure            => absent,
    path              => '/etc/tor/torrc',
    match             => '^SocksPort\ 9055',
    match_for_absence => true,
  }
}

file { '/usr/local/bin/secure-time-sync':
  source => '/etc/puppetlabs/code/environments/production/files/secure-time-sync.sh',
  mode   => '0744',
}
