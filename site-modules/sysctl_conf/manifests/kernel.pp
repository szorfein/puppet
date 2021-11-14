class sysctl_conf::kernel {
  sysctl { 'kernel.kptr_restrict': value  => '2' }
  sysctl { 'kernel.dmesg_restrict': value => '1' }
  sysctl { 'kernel.printk': value         => '3 3 3 3' }

  if find_file('/proc/sys/kernel/unprivileged_bpf_disabled') {
    sysctl { 'kernel.unprivileged_bpf_disabled': value => '1' }
  }

  sysctl { 'net.core.bpf_jit_harden': value => '2' }
  sysctl { 'dev.tty.ldisc_autoload': value  => '0' }

  if find_file('/proc/sys/vm/unprivileged_userfaultfd') {
    sysctl { 'vm.unprivileged_userfaultfd': value => '0' }
  }

  if find_file('/proc/sys/kernel/kexec_load_disabled') {
    sysctl { 'kernel.kexec_load_disabled': value => '1' }
  }

  if find_file('/proc/sys/kernel/sysrq') {
    sysctl { 'kernel.sysrq': value => '4' }
  }

  if find_file('/proc/sys/kernel/unpriviliged_userns_clone') {
    sysctl { 'kernel.unprivileged_userns_clone': value => '0' }
  }

  sysctl { 'user.max_user_namespaces': value   => '0' }
  sysctl { 'kernel.perf_event_paranoid': value => '3' }
}
