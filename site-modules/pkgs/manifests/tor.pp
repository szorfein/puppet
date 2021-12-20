class pkgs::tor (
  String $pkg_name = 'tor'
) {
  contain pkgs::tor::install
  contain pkgs::tor::service
}
