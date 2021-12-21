class privacy (
  Boolean $generic_machine_id = false,
  Boolean $generic_timezone = false,
  Boolean $spoof_mac_ethernet = false,
) {
  contain privacy::machine_id
  contain privacy::timezone
  contain privacy::spoof_mac
}
