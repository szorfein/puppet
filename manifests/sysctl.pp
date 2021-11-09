if lookup('harden_sysctl', Boolean) {
  notice('Adding Hardening rules for sysctl')

  file { '/etc/sysctl.d':
    ensure => directory,
    owner  => 'root',
    mode   => '0755',
  }

  file { '/etc/sysctl.d/kernel.conf':
    ensure => present,
    source => '/etc/puppetlabs/code/environments/production/files/sysctl-kernel.conf',
    mode   => '0644',
  }

  file { '/etc/sysctl.d/network.conf':
    ensure => present,
    source => '/etc/puppetlabs/code/environments/production/files/sysctl-network.conf',
    mode   => '0644',
  }

  file { '/etc/sysctl.d/userspace.conf':
    ensure => present,
    source => '/etc/puppetlabs/code/environments/production/files/sysctl-userspace.conf',
    mode   => '0644',
  }
} else {
  notice('Removing Hardening rules for sysctl')

  file { '/etc/sysctl.d/kernel.conf': ensure => absent }
  file { '/etc/sysctl.d/network.conf': ensure => absent }
  file { '/etc/sysctl.d/userspace.conf': ensure => absent }
}
