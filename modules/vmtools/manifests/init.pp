# Class vmtools
#
# This class installs vmtools
#
# Author: Oliver Leach
# Date  : 5th March 2013
#
# Actions:
#   Configure the vmware repositories and imports GPG keys. It also ensurse vmware-tools-esx-nox is installed
#
# Reqiures:
#   redhat family OS, which includes CentOS
#
# Sample Usage:
#  include vmtools
#
class vmtools {

  if $::osfamily == 'RedHat' and $::operatingsystem != 'Fedora' {

    yumrepo { 'vmware-tools-repo':
      baseurl        => "http://packages.vmware.com/tools/esx/5.0u1/rhel${::os_maj_version}/${::architecture}",
      enabled        => '1',
      gpgcheck       => '1',
      descr          => "VMware tools package for ESX 5.0 update 1"
    }

    exec { "install GPG-DSA keys":
        command => "/bin/rpm --import http://packages.vmware.com/tools/keys/VMWARE-PACKAGING-GPG-DSA-KEY.pub",
            unless  => "/bin/rpm -q gpg-pubkey --qf '%{name}-%{version}-%{release} --> %{summary}\n' |/bin/grep VMware  > /dev/null 2>&1"
    }

    exec { "install GPG-RSA keys":
        command => "/bin/rpm --import http://packages.vmware.com/tools/keys/VMWARE-PACKAGING-GPG-RSA-KEY.pub",
            unless  => "/bin/rpm -q gpg-pubkey --qf '%{name}-%{version}-%{release} --> %{summary}\n' |/bin/grep VMware  > /dev/null 2>&1"
    }

    package { "vmware-tools-esx-nox"    :   ensure => "installed" }

  } else {
      notice ("Your operating system ${::operatingsystem} is not supported vmtools to run with this puppet manifest")
  }
}
