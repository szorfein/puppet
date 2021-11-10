class tor::install {

  $pkg = $operatingsystem ? {
    gentoo  => 'net-vpn/tor',
    default => 'tor'
  }

  package { 'tor':
    ensure => installed,
    name   => $pkg
  }
}
