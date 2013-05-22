#   class: lab::suse
#
#   This module is required as part of the lsb class module.
#
#   Oliver Leach
#   01-05-2013
#
#


class lsb::suse inherits lsb::base {
  Package['lsb']{
    name => 'lsb',
  }
}
