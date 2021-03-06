class pkgs::tor::install {

  if $operatingsystem == 'Gentoo' {

    package_use { $pkgs::tor::pkg_name:
      use    => [ 'seccomp' ],
      target => 'tor',
      ensure => present
    }
  } else {

    package { $pkgs::tor::pkg_name:
      ensure => installed,
    }
  }
}
