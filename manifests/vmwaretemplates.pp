class vmwaretemplates {

    case  $vmwaretemplate {

        'centos_6_3_minimal_v1': {

            include 'vim'
            include 'vmtools'
            include 'sudo'
            include 'epel'
            include 'lsb'
            include 'man'
            include 'wget'
            include 'dos2unix'


            class { "ntp":
                servers    => [ 'ntp.tcllab.co.uk' ],
            }

            class { "admember":

                domainname  => [ 'TCL-OOB' ],
                dnsdomain   => [ 'tcl-oob.net' ],
            }
        }
    }
}
