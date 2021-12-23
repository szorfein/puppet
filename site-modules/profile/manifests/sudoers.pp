class profile::sudoers {

  notice('Configuring sudo...')

  if find_file('/etc/sudoers.d/zfs') {
    file { '/etc/sudoers.d/zfs':
      mode => '0440'
    }
  }

  if find_file('/etc/sudoers.d/dots') {
    file { '/etc/sudoers.d/dots':
      mode => '0440'
    }
  }

  # Default don't touch my system...
  class { 'sudo':
    purge               => false,
    config_file_replace => false,
    ldap_enable         => false,
  }

  sudo::conf { 'reset_env':
    content  => "Defaults env_reset\nDefaults editor=/usr/bin/vi, !env_editor",
    priority => 0
  }

  sudo::conf { 'secure_path':
    content  => 'Defaults secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"',
    priority => 1,
  }
}
