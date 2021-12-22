class pkgs::pam (
  Array[String, 1] $pkgs_name = [ 'pam', 'libpwquality' ]
) {
  contain pkgs::pam::install
}
