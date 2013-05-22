# resolver

Manage resolver configuration via Puppet

## Usage

### Install resolver with specified parameters

```
    class { 'resolver': }
```

### Example node classification configuration

```
 ...   
 import "resolver"

    case $domain {

    "tcl-oob.net": {

        resolv_conf { "cressex lab UK":

            domainname => "tcl-oob.net",
            searchpath => ['tcl-oob.net', 'tcllab.co.uk'],
            nameservers => ['10.33.22.100', '10.33.22.101'],
        }
    }
    ...
```
