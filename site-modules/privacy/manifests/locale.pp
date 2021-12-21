class privacy::locale {

  if $privacy::generic_locale {

    file { '/etc/locale.gen':
      ensure  => present,
      content => "en_US.UTF-8 UTF-8\n"
    }

    file { '/etc/locale.conf':
      ensure => present
    }

    file_line { 'us_locale':
      path  => '/etc/locale.conf',
      match => '^LANG=',
      line  => 'LANG=en_US.UTF-8'
    }
  }
}
