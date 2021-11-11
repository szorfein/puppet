class sysctl_conf::install {

  # The module thias/sysctl need /sbin/sysctl
  if $operatingsystem == 'Gentoo' {
    file { '/sbin/sysctl':
      ensure => 'link',
      target => '/usr/sbin/sysctl'
    }
  }
}
