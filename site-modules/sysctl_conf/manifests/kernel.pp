class sysctl_conf::kernel {
  sysctl { 'kernel.kptr_restrict': value             => '2' }
  sysctl { 'kernel.dmesg_restrict': value            => '1' }
  sysctl { 'kernel.printk': value                    => '3 3 3 3' }
  sysctl { 'kernel.unprivileged_bpf_disabled': value => '1' }
  sysctl { 'net.core.bpf_jit_harden': value          => '2' }
  sysctl { 'dev.tty.ldisc_autoload': value           => '0' }
  sysctl { 'vm.unprivileged_userfaultfd': value      => '0' }
  sysctl { 'kernel.kexec_load_disabled': value       => '1' }
  sysctl { 'kernel.sysrq': value                     => '4' }
  sysctl { 'kernel.unprivileged_userns_clone': value => '0' }
  sysctl { 'user.max_user_namespaces': value         => '0' }
  sysctl { 'kernel.perf_event_paranoid': value       => '3' }
  sysctl { 'kernel.core_pattern': value              => '|/bin/false' }
}
