class tor::install {

  if $operatingsystem == 'Gentoo' {
    include gentoo
  }

  $pkg = $operatingsystem ? {
    gentoo  => 'net-vpn/tor',
    default => 'tor'
  }

  package { 'tor':
    ensure => installed,
    name   => $pkg
  }
}
