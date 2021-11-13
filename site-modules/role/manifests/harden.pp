class role::harden {
  include profile::sysctl
  include profile::ulimit
}
