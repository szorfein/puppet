class profile::permission {

  $dirs = [ '/boot', '/usr/src', '/lib/modules', '/usr/lib/modules' ]

  $dirs.each |String $dir| {
    file { $dir:
      ensure => 'directory',
      mode   => '0700',
    }
  }
}
