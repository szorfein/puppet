class pkgs::wpa_supplicant::install {

  $pkg = $operatingsystem ? {
    gentoo  => 'net-wireless/wpa_supplicant',
    default => 'wpa_supplicant'
  }

  package { 'wpa_supplicant':
    ensure => installed,
    name   => $pkg
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
