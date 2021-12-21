class wifi (
  Enum['iwd', 'wpa_supplicant'] $client = 'iwd',
  Boolean $spoof_mac = false
) {
  contain wifi::install
  contain wifi::config
}
