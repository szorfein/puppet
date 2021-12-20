class pkgs::cron (
  String $pkg_name = 'cronie'
) {
  contain pkgs::cron::install
  contain pkgs::cron::service
}
