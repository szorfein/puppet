class pkgs::tor::install {

  if $operatingsystem == 'Gentoo' {
    include gentoo

    package_use { 'net-vpn/tor':
      use    => [ 'seccomp' ],
      target => 'tor',
      ensure => present
    }
  } else {

    package { 'tor':
      ensure => installed,
    }
  }
}
