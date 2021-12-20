class pkgs::macchanger (
  String $pkg_name = 'macchanger'
) {
  contain pkgs::macchanger::install
  contain pkgs::macchanger::service
}
