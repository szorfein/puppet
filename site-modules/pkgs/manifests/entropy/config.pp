class pkgs::entropy::config {

  if $operatingsystem == 'Gentoo' {

    if $facts['os']['architecture'] == 'amd64' {

      file { '/usr/lib/modules-load.d/jitterentropy.conf':
        ensure  => present,
        content => "jitterentropy_rng\n"
      }
    }
  }
}
