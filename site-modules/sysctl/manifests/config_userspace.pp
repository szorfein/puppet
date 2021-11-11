class sysctl::config_userspace {
  sysctl { 'kernel.yama.ptrace_scope': value => '2' }
  sysctl { 'vm.mmap_rnd_bits': value         => '32' }
  sysctl { 'vm.mmap_rnd_compat_bits': value  => '16' }
  sysctl { 'fs.protected_symlinks': value    => '1' }
  sysctl { 'fs.protected_hardlinks': value   => '1' }
  sysctl { 'fs.protected_fifos': value       => '2' }
  sysctl { 'fs.protected_regular': value     => '2' }
  sysctl { 'fs.suid_dumpable': value         => '0' }
}
