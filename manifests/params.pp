# == Class mailcatcher::params
#
# This class is meant to be called from mailcatcher.
# It sets variables according to platform.
#
class mailcatcher::params {
  case $::operatingsystem {
    'Ubuntu': {
      case $::operatingsystemrelease {
        '14.04', '16.04': {
          $package_name   = 'mailcatcher'
          $manage_repo    = true
          $service_name   = 'mailcatcher'
          $service_ensure = 'running'
          $service_enable = true
          $http_ip        = '0.0.0.0'
          $http_port      = 1080
          $smtp_ip        = '127.0.0.1'
          $smtp_port      = 1025
        }
        default: {
          fail("Ubuntu ${::operatingsystemrelease} not supported")
        }
      }
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
