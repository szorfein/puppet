if lookup('use_tor', Boolean) {

  file_line { 'secure-time-sync-tor':
    path  => '/etc/tor/torrc',
    line  => 'SocksPort 9055',
  }
} else {

  file_line { 'secure-time-sync-tor':
    path              => '/etc/tor/torrc',
    match             => '^SocksPort\ 9055',
    match_for_absence => true,
  }
}

file { '/usr/local/bin/secure-time-sync':
  source => '/etc/puppetlabs/code/environments/production/files/secure-time-sync',
  mode   => '0744',
}
