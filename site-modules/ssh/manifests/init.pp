class ssh {
  contain ssh::install
  contain ssh::config
  contain ssh::create_keys
  contain ssh::service
}
