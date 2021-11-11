class sysctl_conf::install {

  if $operatingsystem == 'Gentoo' {
    file { '/usr/sbin/sysctl':
      ensure => 'link',
      target => '/sbin/sysctl'
    }
  }
}
