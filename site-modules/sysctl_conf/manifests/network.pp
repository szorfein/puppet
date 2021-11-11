class sysctl_conf::network {
  sysctl { 'net.ipv4.tcp_syncookies': value                   => '1' }
  sysctl { 'net.ipv4.tcp_rfc1337': value                      => '1' }
  sysctl { 'net.ipv4.conf.all.rp_filter': value               => '1' }
  sysctl { 'net.ipv4.conf.default.rp_filter': value           => '1' }
  sysctl { 'net.ipv4.conf.all.accept_redirects': value        => '0' }
  sysctl { 'net.ipv4.conf.default.accept_redirects': value    => '0' }
  sysctl { 'net.ipv4.conf.all.secure_redirects': value        => '0' }
  sysctl { 'net.ipv4.conf.default.secure_redirects': value    => '0' }
  sysctl { 'net.ipv6.conf.all.accept_redirects': value        => '0' }
  sysctl { 'net.ipv6.conf.default.accept_redirects': value    => '0' }
  sysctl { 'net.ipv4.conf.all.send_redirects': value          => '0' }
  sysctl { 'net.ipv4.conf.default.send_redirects': value      => '0' }
  sysctl { 'net.ipv4.icmp_echo_ignore_all': value             => '1' }
  sysctl { 'net.ipv4.conf.all.accept_source_route': value     => '0' }
  sysctl { 'net.ipv4.conf.default.accept_source_route': value => '0' }
  sysctl { 'net.ipv6.conf.all.accept_source_route': value     => '0' }
  sysctl { 'net.ipv6.conf.default.accept_source_route': value => '0' }
  sysctl { 'net.ipv6.conf.all.accept_ra': value               => '0' }
  sysctl { 'net.ipv6.conf.default.accept_ra': value           => '0' }
  sysctl { 'net.ipv4.tcp_sack': value                         => '0' }
  sysctl { 'net.ipv4.tcp_dsack': value                        => '0' }
  sysctl { 'net.ipv4.tcp_fack': value                         => '0' }
  sysctl { 'net.ipv4.tcp_timestamps': value                   => '0' }
}
