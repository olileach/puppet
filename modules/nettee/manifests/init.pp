# Class tee
#
# This class installs vim-enhanced and configures a vimrc global file
#
# Author: Oliver Leach
# Date  : 5th March 2013
#
# Actions:
#   Ensures vim-enhanced package is installed
#
# Requires:
#   Centos - other operating systems are not currently supported by this module
#
# Sample Usage:
#  include vim
#

class nettee {

    package { "nettee"    : ensure => present, }

}
