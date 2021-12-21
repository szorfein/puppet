# Reference

## Table of Contents

### Classes

#### Public Classes

* [`ntp`](#ntp): Install and use the script [secure-time-sync](https://gitlab.com/madaidan/secure-time-sync/) in a cron job to update the locale time with HTTPS or TOR.
* [`privacy`](#privacy): Reduces the information your computer can share.

## Classes

### <a name="ntp"></a>`ntp`

Use [secure-time-sync](https://gitlab.com/madaidan/secure-time-sync/) to update the locale time with HTTPS or TOR.

#### Parameters

The following parameters are available in the `ntp` class:

* [`ntp::use_tor`](#use_tor)

##### <a name="use_tor"></a>`use_tor`

Data type: `Boolean`

If you use TOR, it use onion address for [torproject.org](http://2gzyxa5ihm7nsggfxnu52rck2vv4rvmdlkiu3zzui5du4xyclen53wid.onion") or [tails.boom.org](http://dds6qkxpwdeubwucdiaord2xgbbeyds25rbsgr73tbfpqpt4a6vjwsyd.onion").

Default value: `'false'`

### <a name="privacy"></a>`privacy`

Reduces the information your computer can share.

#### Parameters

The following parameters are available in the `privacy` class:

* [`privacy::generic_machine_id`](#generic_machine_id)
* [`privacy::generic_timezone`](#generic_timezone)
* [`privacy::spoof_mac_ethernet`](#spoof_mac_ethernet)

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
