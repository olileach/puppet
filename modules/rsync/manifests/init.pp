# Class rsync
#
# This class installs man
#
# Author: Oliver Leach
# Date  : 12th March 2013
#
# Actions:
#   Installs the rsync package
#
# Requires:
#   Centos - other operating systems are not supported by this manifest
#
# Sample Usage:
#  include rsync
#

class rsync {

    case $operatingsystem {

        centos: {
    
            package { "rsync": ensure => "installed" }

        }

        default: {

            $supported = false
            notify { "${module_name} is unsupported":
                message => "The ${module_name} module is not supported on ${::operatingsystem}",
            }
        }
    }
}
