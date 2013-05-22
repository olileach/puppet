# Class: resolver
#
# This class handles configuring /etc/resolv.conf
#
# Author: Oliver Leach
# Date  : 5th March 2013
#
# Actions:
#   Configured the /etc/resolv.conf file according to parameters set at node classification level
#
# Requires:
#   This module does not have any operating system requirements, but needs parameters
#   at node classifcation level. This means the module is portable between puppet
#   environments
#
# Sample Usage:
#   resolv_conf { "cressex dns config":
#       domainname  => "tcl-oob.net",
#       searchpath  => ['tcl-oob.net', 'tcllab.co.uk'],
#       nameservers => ['10.33.22.100'], ['10.33.22.101'],
#   }
#
# Parameters:
#   $domainname: The default domain
#   $searchpath: Array of domains to search
#   $nameservers: List of nameservers to search
#


class resolver ($domain_name=$::domainname,
                $search_path=$::searchpath,
                $name_servers=$::nameservers, ){

   if ($name_servers == undef) {
        fail('ensure at least the namesever parameter is defined')
    }

    case $::operatingsystem {

        centos: {
            $supported  = true
        }
        default: {

            $supported = false
                notify { "${module_name}_unsupported":
                    message => "The ${module_name} module is not supported on ${::operatingsystem}",
            }
        }
    }

    if ($supported == true) {
        file { '/etc/resolv.conf':
                owner   => root,
                group   => root,
                mode    => '0644',
                content => template('resolver/resolv.conf.erb'),
        }
    }
}
