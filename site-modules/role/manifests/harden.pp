class role::harden {
  include profile::core_dump
  include profile::restrict_xorg
  include profile::sysctl
}
