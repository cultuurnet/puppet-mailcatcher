# == Class mailcatcher::install
#
# This class is called from mailcatcher for install.
#
class mailcatcher::install {

  package { $::mailcatcher::package_name:
    ensure => present,
  }

}
