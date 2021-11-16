class privacy (
  Boolean $generic_machine_id = false,
  Boolean $generic_timezone = false,
) {
  contain privacy::machine_id
  contain privacy::timezone
}
