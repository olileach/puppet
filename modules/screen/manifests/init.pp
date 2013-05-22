# Class scneen
#
# This class installs screen
#
# Author: Oliver Leach
# Date  : 8th March 2013
#
# Actions:
#   Ensures screen package is installed
#
# Requires:
#   Centos - other operating systems are not currently supported by this module
#
# Sample Usage:
#  include screen
#

class screen {

    case $::operatingsystem {

        centos: {
    
            package { "screen"    : ensure => present, }

        }

        default: {

            $supported = false
            notify { "${module_name} is unsupported":
                message => "The ${module_name} module is not supported on ${::operatingsystem}",
            }
        }
    }
}
