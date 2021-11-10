class privacy::machine_id {

  if $privacy::generic_machine_id {
    file { '/etc/machine-id':
      ensure  => file,
      content => "b08dfa6083e7567a1921a715000001fb\n",
    }

    file { '/var/lib/dbus/machine-id':
      ensure  => file,
      content => "b08dfa6083e7567a1921a715000001fb\n",
    }
  }
}
