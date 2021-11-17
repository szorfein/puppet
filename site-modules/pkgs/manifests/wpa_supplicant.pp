class pkgs::wpa_supplicant {
  contain pkgs::wpa_supplicant::install
  contain pkgs::wpa_supplicant::service
}
