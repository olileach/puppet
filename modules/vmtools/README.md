# vmtools

Manage vmtools installation via Puppet

## Usage

### Install vmtools

```
    class { 'vmtools': }
```


### Additional notes
* Installs the vmware repos required for vmware tools yum installation
* It is recommended that this module is used for systems that does not have startx running.

