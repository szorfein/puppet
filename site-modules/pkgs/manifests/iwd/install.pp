class pkgs::iwd::install {

  package { 'iwd':
    ensure => installed,
    name   => $pkgs::iwd::pkg_name
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
