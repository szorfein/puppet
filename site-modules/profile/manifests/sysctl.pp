class profile::sysctl {

  if lookup('harden_sysctl', Boolean) {
    notice('Adding Hardening rules for sysctl')

    file { '/etc/sysctl.d':
      ensure => directory,
      owner  => 'root',
      mode   => '0755',
    }

    file { '/etc/sysctl.d/kernel.conf':
      ensure => present,
      source => 'puppet://modules/profile/sysctl-kernel.conf',
      mode   => '0644',
    }

    file { '/etc/sysctl.d/network.conf':
      ensure => present,
      source => 'puppet://modules/profile/sysctl-network.conf',
      mode   => '0644',
    }

    file { '/etc/sysctl.d/userspace.conf':
      ensure => present,
      source => 'puppet://modules/profile/sysctl-userspace.conf',
      mode   => '0644',
    }
  } else {
    notice('Removing Hardening rules for sysctl')

    file { '/etc/sysctl.d/kernel.conf': ensure => absent }
    file { '/etc/sysctl.d/network.conf': ensure => absent }
    file { '/etc/sysctl.d/userspace.conf': ensure => absent }
  }
}
