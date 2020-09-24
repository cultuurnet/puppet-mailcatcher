# == Class mailcatcher::config
#
# This class is called from mailcatcher for service config.
#
class mailcatcher::config (
  Stdlib::Ipv4 $http_ip   = $mailcatcher::http_ip,
  Integer      $http_port = $mailcatcher::http_port,
  Stdlib::Ipv4 $smtp_ip   = $mailcatcher::smtp_ip,
  Integer      $smtp_port = $mailcatcher::smtp_port
) {

  file { '/etc/default/mailcatcher':
    ensure  => 'file',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('mailcatcher/default/mailcatcher.erb')
  }
}
