class pkgs::macchanger::install {

  $pkg = $operatingsystem ? {
    gentoo  => 'net-analyzer/macchanger',
    default => 'macchanger'
  }

  package { 'macchanger':
    ensure => installed,
    name   => $pkg
  }
}
