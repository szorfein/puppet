class wifi::install {

  if $wifi::client == 'iwd' {
    include pkgs::iwd
  } elsif $wifi::client == 'wpa_supplicant' {
    include pkgs::wpa_supplicant
  }
}
