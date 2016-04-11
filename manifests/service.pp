# == Class mailcatcher::service
#
# This class is meant to be called from mailcatcher.
# It ensure the service is running.
#
class mailcatcher::service {

  service { $::mailcatcher::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
