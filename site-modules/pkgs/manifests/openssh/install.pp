class pkgs::openssh::install {

  package { 'openssh':
    ensure => installed,
    name   => $pkgs::openssh::pkg_name
  }
}
