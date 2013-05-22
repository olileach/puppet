# epel

Manages epel repo configuration via Puppet

## Usage

### Install epel with default repo files

```
    class { 'epel': }
```

### epel repo configuration
* Edit the repos that are made available in init.pp
* Repos are variable driven. I.e., the correct repo gets deployed based on a os_maj_release version
* The os_maj_version ruby script can be found in ..epel/lib/facter
* The os_maj_version ruby script removes the dependancy of have lsb tools installed.

