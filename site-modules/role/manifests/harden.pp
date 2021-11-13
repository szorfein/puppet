class role::harden {
  include profile::blacklist_mods
  include profile::core_dump
  include profile::restrict_xorg
  include profile::sysctl
}
