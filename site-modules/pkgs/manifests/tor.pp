class pkgs::tor {
  contain pkgs::tor::install
  contain pkgs::tor::service
}
