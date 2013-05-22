#   class lsb
#
#   This class installs the lsb package. http://en.wikipedia.org/wiki/Linux_Standard_Base
#
#   Author  : Oliver Leach
#   Date    : 5th March 2013
#
#   Actions:
#    Names the lsb package according to the operatingsystem value and installs the package
#
#   Requires:
#    debain, centos or suse. Ubuntu is not yet supported
#
#   SAmpe Usage
#    include lsb
#

class lsb {

    case $operatingsystem {

        debian: { include lsb::debian }
        centos: { include lsb::centos }
        suse:   { include lsb::suse   }

        default: {

            $supported = false
            
            notify { "${module_name} is unsupported":

                message => "The ${module_name} module is not supported on ${::operatingsystem}",

            }
        }
    }
}
