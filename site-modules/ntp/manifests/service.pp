class ntp::service {

  include pkgs::cron

  if $ntp::use_tor {
    $script = '/usr/local/bin/secure-time-sync --use-tor'
  } else {
    $script = '/usr/local/bin/secure-time-sync'
  }

  cron { 'secure-time-sync':
    command => "${script}",
    hour    => '*/1',
  }
}
