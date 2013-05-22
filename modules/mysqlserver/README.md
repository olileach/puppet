# mysqlserver

Installs mysqlserver, mysql client and mysqltuner via Puppet

## Usage

### Install sudo with default sudoers

```
    class { 'mysqlserver': }
```

###
* Installs and ensures the following packages are available

    mysqlserver
    mysql
    mysqltuner
