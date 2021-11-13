class profile::restrict_xorg {
  
  if find_file('/etc/X11') {
    file { '/etc/X11/Xwrapper.config':
      ensure  => present,
      content => "needs_root_rights = no\n"
    }
  }
}
