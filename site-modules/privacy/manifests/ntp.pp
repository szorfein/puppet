class privacy::ntp {

  include cron
  include tor

  if $ntp_with_tor {
    file_line { 'add-secure-time-sync-tor':
      path   => '/etc/tor/torrc',
      line   => 'SocksPort 9055',
      notify => Service['tor'],
    }

    $script = '/usr/local/bin/secure-time-sync --with-tor'
  } else {

    file_line { 'delete-secure-time-sync-tor':
      ensure             => absent,
      path               => '/etc/tor/torrc',
      match              => '^SocksPort\ 9055',
      match__for_absence => true,
      notify             => Service['tor'],
    }

    $script = '/usr/local/bin/secure-time-sync'
  }

  cron { 'secure-time-sync':
    command => $script,
    hour    => '*',
    minute  => '*/30',
  }

  file { '/usr/local/bin/secure-time-sync':
    source => 'puppet://modules/privacy/secure-time-sync.sh',
    mode   => '0744',
  }
}
