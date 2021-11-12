class pkgs::cron::install {

  if $operatingsystem == 'Gentoo' {
    include gentoo
  }

  $pkg = $operatingsystem ? {
    gentoo  => 'sys-process/cronie',
    default => 'cronie'
  }

  package { 'cronie':
    ensure   => installed,
    name => $pkg
  }
}
