#   class: lab::centos
#
#   This module is required as part of the lsb class module.
#
#   Oliver Leach
#   01-05-2013
#
#

class lsb::centos inherits lsb::base {
  Package['lsb']{
    name => 'redhat-lsb',
  }
}
