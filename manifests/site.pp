# Load config by os first
if $operatingsystem == 'Gentoo' {
  include gentoo
}

include(lookup('classes', Array[String], 'unique'))
