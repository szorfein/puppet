class tor {
  $pkg = $operatingsystem ? {
    gentoo  => 'net-vpn/tor',
    default => 'tor',
  }

  package { 'tor':
    ensure => installed,
    name   => $pkg,
  }

  service { 'tor':
    ensure => running,
    enable => true,
  }
}
