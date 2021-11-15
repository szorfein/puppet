class pkgs::iwd::install {

  $pkg = $operatingsystem ? {
    gentoo  => 'net-wireless/iwd',
    default => 'iwd'
  }

  package { 'iwd':
    ensure => installed,
    name   => $pkg
  }

  $pkg_drop = $operatingsystem ? {
    gentoo  => 'net-wireless/wpa_supplicant',
    default => 'wpa_supplicant'
  }

  package { 'wpa_supplicant':
    ensure => absent,
    name   => $pkg_drop
  }
}
