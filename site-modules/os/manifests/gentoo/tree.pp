class os::gentoo::tree {

  notice('Verifying /etc/portage')

  file { '/etc/portage/package.use':
    ensure => directory,
    owner  => 'root',
    mode   => '0744',
  }

  file { '/etc/portage/package.accept_keywords':
    ensure => directory,
    owner  => 'root',
    mode   => '0744',
  }

  file { '/etc/portage/package.use/zzz_via_autounmask':
    ensure => present,
    owner  => 'root',
    mode   => '0644',
  }

  file { '/etc/portage/package.accept_keywords/zzz_via_autounmask':
    ensure => present,
    owner  => 'root',
    mode   => '0644',
  }
}
