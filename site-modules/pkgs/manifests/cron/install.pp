class pkgs::cron::install {

  package { 'cronie':
    ensure   => installed,
    name => $pkgs::cron::pkg_name
  }
}
