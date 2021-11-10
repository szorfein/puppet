class tor::service {
  service { 'tor':
    ensure   => running,
    enable   => true,
    provider => lookup('service_provider', String)
  }
}
