class privacy::spoof_mac {

  include pkgs::macchanger

  $facts['networking']['interfaces'].each |$key, $value| {
    if $key =~ /^e/ {

      if $privacy::mac_spoof_ethernet_cards {

        if find_file('/etc/systemd/system/macspoof@.service') {

          notice("Enabling macspoof for $key.")
          service { "macspoof@${key}":
            enable   => true,
            provider => 'systemd'
          }
        }
      } else {

        if find_file('/etc/systemd/system/macspoof@.service') {

          notice("Disabling macspoof for $key.")
          service { "macspoof@${key}":
            enable   => false,
            provider => 'systemd'
          }
        }
      }
    }
  }
}
