class wifi::install {

  if $wifi::enable {
    if $wifi::client == 'iwd' {
      include pkgs::iwd
    }
  }
}
