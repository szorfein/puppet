class ntp::service {

  include cron

  $script = '/usr/local/bin/secure-time-sync'

  if $ntp::use_tor {
    $script = '/usr/local/bin/secure-time-sync --with-tor'
  }

  cron { 'secure-time-sync':
    command => $script,
    hour    => '*',
    minute  => '*/30',
  }
}
