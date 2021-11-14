class gentoo::config {

  # https mirror: https://www.gentoo.org/downloads/mirrors/
  file_line { 'portage-https-mirror':
    path => '/etc/portage/make.conf',
    line => 'GENTOO_MIRRORS="https://gentoo.osuosl.org/ https://mirror.leaseweb.com/gentoo/ https://mirror.rackspace.com/gentoo/ https://ftp.belnet.be/pub/rsync.gentoo.org/gentoo/"'
  }
}
