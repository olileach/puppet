# Class man
#
# This class installs man
#
# Author: Oliver Leach
# Date  : 5th March 2013
#
# Actions:
#   Installs the man package
#
# Requires:
#   Centos - other operating systems are not supported by this manifest
#
# Sample Usage:
#  include man
#

class man {

    case $operatingsystem {

        centos: {
    
            package { "man": ensure => "installed" }

        }

        default: {

            $supported = false
            notify { "${module_name} is unsupported":
                message => "The ${module_name} module is not supported on ${::operatingsystem}",
            }
        }
    }
}
