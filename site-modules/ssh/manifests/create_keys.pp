class ssh::create_keys {

  # ssh_host_rsa_key
  if find_file('/usr/bin/ssh-keygen') {
    exec { 'Creating_ssh_rsa_key':
      command => '/usr/bin/ssh-keygen -t rsa -b 4096 -f /etc/ssh/ssh_host_rsa_key -N "" < /dev/null',
      creates => '/etc/ssh/ssh_host_rsa_key'
    }
  }

  # ssh_host_ed25519_key
  if find_file('/usr/bin/ssh-keygen') {
    exec { 'Creating_ssh_ed25519_key':
      command => '/usr/bin/ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N "" < /dev/null',
      creates => '/etc/ssh/ssh_host_ed25519_key'
    }
  }
}
