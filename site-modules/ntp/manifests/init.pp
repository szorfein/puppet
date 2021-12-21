class ntp ( Boolean $use_tor = false ) {
  contain ntp::install
  contain ntp::service
}
