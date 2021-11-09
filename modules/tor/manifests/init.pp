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
    start  => true,
    enable => true,
  }
}
