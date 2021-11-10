class cron::install {

  $pkg = $operatingsystem ? {
    gentoo  => 'sys-process/cronie',
    default => 'cronie'
  }

  package { 'cronie':
    ensure   => installed,
    name => $pkg
  }
}
