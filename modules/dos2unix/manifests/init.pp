# Class dos2unix
#
# This class installs vim-enhanced and configures a vimrc global file
#
# Author: Oliver Leach
# Date  : 8th March 2013
#
# Actions:
#   Ensures dos2unix package is installed
#
# Requires:
#   Centos - other operating systems are not currently supported by this module
#
# Sample Usage:
#  include dos2unix
#

class dos2unix {

    case $::operatingsystem {

        centos: {
    
            package { "dos2unix"    : ensure => present, }

        }

        default: {

            $supported = false
            notify { "${module_name} is unsupported":
                message => "The ${module_name} module is not supported on ${::operatingsystem}",
            }
        }
    }
}
