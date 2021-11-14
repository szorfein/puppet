class pkgs::entropy {
  contain pkgs::entropy::install
  contain pkgs::entropy::config
  contain pkgs::entropy::service
}
