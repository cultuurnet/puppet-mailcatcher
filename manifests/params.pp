# == Class mailcatcher::params
#
# This class is meant to be called from mailcatcher.
# It sets variables according to platform.
#
class mailcatcher::params {
  case $::operatingsystem {
    'Ubuntu': {
      $package_name = 'mailcatcher'
      $manage_repo  = false
      $service_name = 'mailcatcher'
      $http_ip      = '0.0.0.0'
      $http_port    = '1080'
      $smtp_ip      = '127.0.0.1'
      $smtp_port    = '1025'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
