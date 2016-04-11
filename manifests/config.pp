# == Class mailcatcher::config
#
# This class is called from mailcatcher for service config.
#
class mailcatcher::config (
  $http_ip   = $mailcatcher::http_ip,
  $http_port = $mailcatcher::http_port,
  $smtp_ip   = $mailcatcher::smtp_ip,
  $smtp_port = $mailcatcher::smtp_port
) {

  file { '/etc/default/mailcatcher':
    ensure  => 'file',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('mailcatcher/default/mailcatcher.erb')
  }
}
