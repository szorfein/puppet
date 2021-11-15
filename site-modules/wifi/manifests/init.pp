class wifi (
  Boolean $enable = false,
  Enum['iwd', 'wpa_supplicant'] $client = 'iwd',
  Boolean $spoof_mac = false
) {
  contain wifi::install
  contain wifi::config
}
