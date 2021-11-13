class role::harden {
  include profile::blacklist_mods
  include profile::core_dump
  include profile::hidepid
  include profile::permission
  include profile::restrict_xorg
  include profile::sysctl
}
