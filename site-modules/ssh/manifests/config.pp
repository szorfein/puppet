class ssh::config {

  file { '/etc/ssh/ssh_config':
    ensure  => file,
    content => epp('ssh/ssh_config.epp'),
    mode    => '0644'
  }
}
