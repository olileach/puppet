#   class: lab::debian
#
#   This module is required as part of the lsb class module.
#
#   Oliver Leach
#   01-05-2013
#
#

class lsb::debian inherits lsb::base {
  Package['lsb']{
    name => 'lsb-release',
    require => undef,
  }
}
