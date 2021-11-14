class gentoo::config {

  # https mirror
  portage::makeconf { 'GENTOO_MIRRORS':
    content => [
      'https://gentoo.osuosl.org/',
      'https://mirror.leaseweb.com/gentoo/',
      'https://mirror.rackspace.com/gentoo/',
      'https://ftp.belnet.be/pub/rsync.gentoo.org/gentoo/'
    ],
    ensure => present
  }
}
