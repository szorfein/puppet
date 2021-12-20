class pkgs::macchanger::install {

  package { 'macchanger':
    ensure => installed,
    name   => $pkgs::macchanger::pkg_name
  }
}
