class pkgs::entropy::install {

  if $operatingsystem == 'Gentoo' {

    # only work on amd64 mips x86
    if $facts['os']['architecture'] == 'amd64' {

      file { '/etc/portage/package.accept_keywords/jitterentropy-rngd':
        ensure  => present,
        content => "app-crypt/jitterentropy-rngd\n"
      }

      package { 'jitterentropy-rngd':
        ensure => installed,
        name   => 'app-crypt/jitterentropy-rngd'
      }
    } else {

      package { 'haveged':
        ensure => installed,
        name   => 'sys-apps/haveged'
      }
    }
  } else {

    package { 'haveged':
      ensure => installed,
    }
  }
}
