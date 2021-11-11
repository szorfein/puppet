class ntp::service {

  include cron

  if $ntp::use_tor {
    $script = '/usr/local/bin/secure-time-sync --with-tor'
  } else {
    $script = '/usr/local/bin/secure-time-sync'
  }

  cron { 'secure-time-sync':
    command => $script,
    hour    => '*/2',
  }
}
