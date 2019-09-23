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
  $package_name = $::mailcatcher::params::package_name,
  $manage_repo  = $::mailcatcher::params::manage_repo,
  $service_name = $::mailcatcher::params::service_name,
  $http_ip      = $::mailcatcher::params::http_ip,
  $http_port    = $::mailcatcher::params::http_port,
  $smtp_ip      = $::mailcatcher::params::smtp_ip,
  $smtp_port    = $::mailcatcher::params::smtp_port
) inherits ::mailcatcher::params {

  if $manage_repo {
    contain ::mailcatcher::repo
  }

  contain ::mailcatcher::install
  contain ::mailcatcher::config
  contain ::mailcatcher::service
}
