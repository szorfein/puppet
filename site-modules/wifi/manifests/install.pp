class wifi::install {

  if $wifi::enable and $wifi::use_iwd {
    include pkgs::iwd
  }
}
