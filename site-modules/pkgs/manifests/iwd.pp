class pkgs::iwd (
  String $pkg_name = 'iwd'
) {
  contain pkgs::iwd::install
  contain pkgs::iwd::service
}
