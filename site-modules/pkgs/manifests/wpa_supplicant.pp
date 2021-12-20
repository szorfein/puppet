class pkgs::wpa_supplicant (
  String $pkg_name = 'wpa_supplicant'
) {
  contain pkgs::wpa_supplicant::install
  contain pkgs::wpa_supplicant::service
}
