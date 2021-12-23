class privacy::machine_id {

  if $privacy::generic_machine_id {
    notice('Adding generic machine-id')

    # use Whonix machine-id
    # https://github.com/Whonix/dist-base-files/blob/master/etc/machine-id

    file { '/etc/machine-id':
      ensure  => file,
      content => "b08dfa6083e7567a1921a715000001fb\n",
    }

    if find_file('/var/lib/dbus') {
      file { '/var/lib/dbus/machine-id':
        ensure  => file,
        content => "b08dfa6083e7567a1921a715000001fb\n",
      }
    }
  }
}
