class wifi::install {

  if $wifi::enable {
    if $wifi::client == 'iwd' {
      include pkgs::iwd
    } elsif $wifi::client == 'wpa_supplicant' {
      include pkgs::wpa_supplicant
    }
  } else {

    $iwd_name = $operatingsystem ? {
      gentoo  => 'net-wireless/iwd',
      default => 'iwd'
    }

    package { 'iwd':
      ensure => absent,
      name   => $iwd_name
    }

    $wpa_name = $operatingsystem ? {
      gentoo  => 'net-wireless/wpa_supplicant',
      default => 'wpa_supplicant'
    }

    package { 'wpa_supplicant':
      ensure => absent,
      name   => $wpa_name
    }
  }
}
