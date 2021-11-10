class cron::service {

  service { 'cronie':
    ensure   => running,
    enable   => true,
    provider => lookup('service_provider', String)
  }
}
