class pkgs::pam::install {

  if $operatingsystem == 'Gentoo' {

    package_use { 'sys-auth/pambase':
      use    => [ 'pwquality', 'sha512' ],
      target => 'pam',
      ensure => present
    }
  } else {

    package { $pkgs::pam::pkgs_name:
      ensure => installed
    }
  }
}
