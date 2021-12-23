class privacy::hostname {

  if $privacy::generic_hostname {

    notice('Applying a generic host...')

    file { '/etc/hostname':
      ensure  => file,
      content => "host\n",
    }

    file_line { 'hostname-ipv4':
      path  => '/etc/hosts',
      match => '^127.0.0.1',
      line  => '127.0.0.1 localhost host'
    }

    file_line { 'hostname-ipv6':
      path  => '/etc/hosts',
      match => '^::1',
      line  => '::1 localhost host'
    }
  }
}
