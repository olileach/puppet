# Class wget
#
# This class installs man
#
# Author: Oliver Leach
# Date  : 7th March 2013
#
# Actions:
#   Installs the wget package
#
# Requires:
#   Centos - other operating systems are not supported by this manifest
#
# Sample Usage:
#  include wget
#

class wget {

    case $operatingsystem {

        centos: {
    
            package { "wget": ensure => "installed" }

        }

        default: {

            $supported = false
            notify { "${module_name} is unsupported":
                message => "The ${module_name} module is not supported on ${::operatingsystem}",
            }
        }
    }
}
