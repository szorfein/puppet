# Reference

## Table of Contents

### Classes

#### Public Classes

* [`ntp`](#ntp): Install and use the script [secure-time-sync](https://gitlab.com/madaidan/secure-time-sync/) in a cron job to update the locale time with HTTPS or TOR.
* [`privacy`](#privacy): Reduces the information your computer can share.
* [`wifi`](#wifi): Install and configure the wifi.

#### Private Classes

* `pkgs`: Install and configure packages when needed.
* `pkgs::cron`: Install package `cronie`.
* `pkgs::entropy`: Install [jitterentropy-rngd](https://github.com/smuellerDD/jitterentropy-rngd) or [haveged](http://www.issihosts.com/haveged/), depend of os.family.
* `pkgs::iwd`
* `pkgs::macchanger`
* `pkgs::openssh`
* `pkgs::tor`
* `pkgs::wpa_supplicant`

## Classes

### <a name="ntp"></a>`ntp`

Use [secure-time-sync](https://gitlab.com/madaidan/secure-time-sync/) to update the locale time with HTTPS or TOR.

#### Parameters

The following parameters are available in the `ntp` class:

* [`ntp::use_tor`](#use_tor)

##### <a name="use_tor"></a>`use_tor`

Data type: `Boolean`

If you use TOR, it use onion address for [torproject.org](http://2gzyxa5ihm7nsggfxnu52rck2vv4rvmdlkiu3zzui5du4xyclen53wid.onion) or [tails.boom.org](http://dds6qkxpwdeubwucdiaord2xgbbeyds25rbsgr73tbfpqpt4a6vjwsyd.onion).

Default value: `'false'`

### <a name="privacy"></a>`privacy`

Reduces the information your computer can share.

#### Parameters

The following parameters are available in the `privacy` class:

* [`privacy::generic_hostname`](#generic_hostname)
* [`privacy::generic_locale`](#generic_locale)
* [`privacy::generic_machine_id`](#generic_machine_id)
* [`privacy::generic_timezone`](#generic_timezone)
* [`privacy::spoof_mac_ethernet`](#spoof_mac_ethernet)

##### <a name="generic_hostname"></a>`generic_hostname`

Data type: `Boolean`

If true, use a generic value for the file `/etc/hostname` and `/etc/hosts`.

Default value: `'false'`

##### <a name="generic_locale"></a>`generic_locale`

Data type: `Boolean`

If true, set locale and lang to `US` in `/etc/locale.gen` and `/etc/locale.conf`.

Default value: `'false'`

##### <a name="generic_machine_id"></a>`generic_machine_id`

Data type: `Boolean`

If true, create a generic value for the file `/etc/machine-id` and `/var/lib/dbus/machine-id` if exist.

Default value: `'false'`

##### <a name="generic_timezone"></a>`generic_timezone`

Data type: `Boolean`

If true, change the file `/etc/localtime` to use a generic timezone like `UTC`.

Default value: `'false'`

##### <a name="spoof_mac_ethernet"></a>`spoof_mac_ethernet`

Data type: `Boolean`

Install and use the package `macchanger` to change your mac address for ethernet cards.

Default value: `'false'`

### <a name="wifi"></a>`wifi`

Install and configure the wifi.

#### Parameters

The following parameters are available in the `wifi` class:

* [`wifi::client`](#client)
* [`wifi::spoof_mac`](#spoof_mac)

##### <a name="client"></a>`client`

Data type: `Enum['iwd', 'wpa_supplicant']`

Install and configure the package `iwd` or `wpa_supplicant`.

Default value: `'iwd'`

##### <a name="spoof_mac"></a>`spoof_mac`

Data type: `Boolean`

If true, configure the client (`iwd` or `wpa_supplicant`) to spoof the MAC address.

Default value: `'false'`
