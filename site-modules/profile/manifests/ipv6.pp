class profile::ipv6 {

  # sysctl
  if find_file('/etc/sysctl.d') {
    sysctl { 'net.ipv6.conf.all.use_tempaddr': value     => '2' }
    sysctl { 'net.ipv6.conf.default.use_tempaddr': value => '2' }
  }

  # if systemd
  if find_file('/etc/systemd/network') {
    file { '/etc/systemd/network/ipv6-privacy.conf':
      ensure  => present,
      content => "[Network]\nIPv6PrivacyExtensions=kernel\n"
    }
  }
}
