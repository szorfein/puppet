class ntp ( Boolean $use_tor ) {

  contain ntp::install
  contain ntp::service
}
