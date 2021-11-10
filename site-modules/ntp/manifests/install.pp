class ntp::install {

  include tor

  if $ntp::use_tor {
    file_line { 'add-secure-time-sync-tor':
      path   => '/etc/tor/torrc',
      line   => 'SocksPort 9055',
      notify => Service['tor'],
    }

  } else {

    file_line { 'delete-secure-time-sync-tor':
      ensure            => absent,
      path              => '/etc/tor/torrc',
      match             => '^SocksPort\ 9055',
      match_for_absence => true,
      notify            => Service['tor'],
    }
  }

  file { '/usr/local/bin/secure-time-sync':
    source => 'puppet://modules/ntp/secure-time-sync.sh',
    mode   => '0744',
  }
}
