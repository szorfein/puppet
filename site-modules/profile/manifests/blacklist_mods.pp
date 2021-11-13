class profile::blacklist_mods {

  $file_path = '/etc/modprobe.d/blacklist.conf'

  file { $file_path:
    ensure => present,
  }

  $mods_false = [
    'dccp', 'sctp', 'rds', 'tipc', 'n-hdlc', 'ax25', 'netrom', 'x25',
    'rose', 'decnet', 'econet', 'af_802154', 'ipx', 'appletalk', 'psnap',
    'p8023', 'p8022', 'can', 'atm', 'cramfs', 'freevxfs', 'jffs2', 'hfs',
    'hfsplus', 'squashfs', 'vivid', 'bluetooth', 'btusb', 'uvcvideo'
  ]

  $mods_true = [
    'cifs', 'nfs' ,'nfsv3', 'nfsv4', 'gfs2'
  ]

  $mods_false.each |String $mod| {
    file_line { "blacklist-${mod}":
      ensure => present,
      match  => "^install\ ${mod}\ /bin/false",
      path   => $file_path,
    }
  }

  $mods_true.each |String $mod| {
    file_line { "blacklist-${mod}":
      ensure => present,
      match  => "^install\ ${mod}\ /bin/true",
      path   => $file_path,
    }
  }
}
