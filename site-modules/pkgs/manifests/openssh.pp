class pkgs::openssh (
  String $pkg_name = 'openssh'
) {
  contain pkgs::openssh::install
}
