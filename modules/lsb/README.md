# lsb

Installs lsb tools for specific operating systems via Puppet

## Usage

### Install lsb

```
    class { 'lsb': }
```

### Basic module requirements

* Determines correct lsb package name for operating system
* Sepfici operating system is specified in class determined pp file
