# Class mysqliserver
#
# This class installs the mysql client, mysqlserver and mysqltunner and ensure service are running
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
#  include mysqlserver
#

class mysqlserver {

    case $operatingsystem {

        centos: {
            package { 'mysql'       : ensure => present, }
            package { 'mysql-server': ensure => present, }
            package { 'mysqltuner'  : ensure => present, 
                require => Package['mysql-server'],
            }

            service { 'mysqld'      : ensure => running, 
                enable  => true, 
                require => Package['mysql-server'],
            }
        }
    
        default: {

            $supported = false
 
            notify { "${module_name} is unsupported":
                message => "The ${module_name} module is not supported on ${::operatingsystem}",

            }
        }
    }
}
