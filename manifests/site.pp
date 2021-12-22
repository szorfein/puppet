# Load config by os first
if $operatingsystem == 'Gentoo' {
  include os::gentoo
}

include(lookup('classes', Array[String], 'unique'))
