# == Class mailcatcher::service
#
# This class is meant to be called from mailcatcher.
# It ensure the service is running.
#
class mailcatcher::service {

  service { $mailcatcher::service_name:
    ensure     => $mailcatcher::service_ensure,
    enable     => $mailcatcher::service_enable,
    hasstatus  => true,
    hasrestart => true
  }
}
