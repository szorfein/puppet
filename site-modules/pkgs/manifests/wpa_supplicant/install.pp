class pkgs::wpa_supplicant::install {

  package { 'wpa_supplicant':
    ensure => installed,
    name   => $pkgs::wpa_supplicant::pkg_name
  }

  $pkg_drop = $operatingsystem ? {
    gentoo  => 'net-wireless/iwd',
    default => 'iwd'
  }

  package { 'iwd':
    ensure => absent,
    name   => $pkg_drop
  }
}
