#   class: lab::base
#
#   This module is required as part of the lsb class module.
#
#   Oliver Leach
#   01-05-2013
#
#

class lsb::base {

  package{'lsb': ensure => present }

}
