class pkgs::openssh::install {

  $pkg = $operatingsystem ? {
    gentoo  => 'net-misc/openssh',
    default => 'openssh'
  }

  package { 'openssh':
    ensure => installed,
    name   => $pkg
  }
}
