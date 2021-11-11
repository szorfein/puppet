class sysctl_conf::install {

  if $operatingsystem == 'Gentoo' {
    file { '/sbin/sysctl':
      ensure => 'link',
      target => '/usr/sbin/sysctl'
    }
  }
}
