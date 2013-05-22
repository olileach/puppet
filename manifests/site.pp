# /etc/puppet/manifests/site.pp

import "vmwaretemplates"

node default {

    include "vmwaretemplates"

}

node "ukcrlcscin0015.tcl-oob.net" {

    class {'ntp'    : }
}
