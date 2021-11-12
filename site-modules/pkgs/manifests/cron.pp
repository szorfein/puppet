class pkgs::cron {
  contain pkgs::cron::install
  contain pkgs::cron::service
}
