# Class admember
#
# This class configures the node ready for ad membership
#
# Author: Oliver Leach
# Date  : 5th March 2013
#
# Actions:
#   Installs winbind and samba
#
# Requires:
#   Centos - other operating systems are not currently supported by this module
#
# Sample Usage:
#  include admember
#

class admember ($domainname, $dnsdomain){

    include 'stdlib'

    $u_dnsdomain = upcase($dnsdomain)
    $l_dnsdomain = downcase($dnsdomain)
    $u_domainname = upcase($domainname)

    $adpackages = [ "samba-winbind", "samba-common", "samba", "pam_krb5", "authconfig" ]

        package { $adpackages: ensure => "installed" }

    file { "/home/${u_domainname}/":
        ensure => "directory",
        owner  => "root",
        group  => "root",
        mode   => 0777,
    }

     exec { "set allow_polyinstantiation":
        command => "/usr/sbin/setsebool -P allow_polyinstantiation 1",
        unless => "/usr/sbin/getsebool allow_polyinstantiation |grep on > /dev/null 2>&1"

    }

    
     exec { "authconfig":
        
        command => "/usr/sbin/authconfig --disablecache --enablewinbind --enablewinbindauth --smbsecurity=ads --smbworkgroup=$u_domainname --smbrealm=$u_dnsdomain --enablewinbindusedefaultdomain  --winbindtemplatehomedir=/home/$u_domainname/%U --winbindtemplateshell=/bin/bash --enablekrb5 --krb5realm=$u_dnsdomain --enablekrb5kdcdns --enablekrb5realmdns --enablelocauthorize --enablemkhomedir --enablepamaccess --updateall"
        #unless => "/usr/sbin/getsebool allow_polyinstantiation |grep on > /dev/null 2>&1"

    }

    file { '/etc/krb5.conf':
        owner => root,
        group => root,
        mode => '0644',
        content => template('admember/krb5.conf.erb'),
    }

#    file { '/etc/samba/smb.conf':
#        owner => root,
#        group => root,
#        mode => '0644',
#        content => template('admember/smb.conf.erb'),
#    }
}
