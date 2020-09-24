# Class: mailcatcher
# ===========================
#
# Full description of class mailcatcher here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class mailcatcher (
  String                     $package_name   = $mailcatcher::params::package_name,
  Boolean                    $manage_repo    = $mailcatcher::params::manage_repo,
  String                     $service_name   = $mailcatcher::params::service_name,
  Boolean                    $service_enable = $mailcatcher::params::service_enable,
  Enum['running', 'stopped'] $service_ensure = $mailcatcher::params::service_ensure,
  Stdlib::Ipv4               $http_ip        = $mailcatcher::params::http_ip,
  Integer                    $http_port      = $mailcatcher::params::http_port,
  Stdlib::Ipv4               $smtp_ip        = $mailcatcher::params::smtp_ip,
  Integer                    $smtp_port      = $mailcatcher::params::smtp_port
) inherits mailcatcher::params {

  if $manage_repo {
    contain mailcatcher::repo

    Class['mailcatcher::repo'] -> Class['mailcatcher::install']
  }

  contain mailcatcher::install
  contain mailcatcher::config
  contain mailcatcher::service

  Class['mailcatcher::install'] -> Class['mailcatcher::config'] ~> Class['mailcatcher::service']
}
