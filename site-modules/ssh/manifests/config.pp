class ssh::config {

  group { 'ssh_user':
    ensure => present
  }

  file { '/etc/ssh/sshd_config':
    ensure  => file,
    content => epp('ssh/sshd_config.epp'),
    mode    => '0600'
  }

  file { '/etc/ssh/ssh_config':
    ensure  => file,
    content => epp('ssh/ssh_config.epp'),
    mode    => '0644'
  }
}
