# Class mysql
#
# This class installs the mysql client, used to connect to mysql servers
#
# Author: Oliver Leach
# Date  : 5th March 2013
#
# Actions:
#    Ensures the mysql package is installed 
#
# Requires:
#   Centos - other operating systems are not yet supported by this manifest
#
# Sample Usage:
#  include mysql
#

class mysql {

    case $operatingsystem {

        centos: {
            package { 'mysql': ensure => present, }
        }
    }

    default: {

        $supported = false
 
        notify { "${module_name} is unsupported":

            message => "The ${module_name} module is not supported on ${::operatingsystem}",

        }
    }
}
