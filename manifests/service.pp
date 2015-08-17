# == Class: consul_template::service
#
# Creates an init script and starts the service.
#
class consul_template::service {
  file { '/etc/init.d/consul-template':
    ensure => 'link',
    target => '/lib/init/upstart-job',
  } ->
  file { '/nail/etc/init/consul-template.conf':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
  } ->
  file { '/etc/init/consul-template.conf':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
    source => 'puppet:///modules/consul_template/upstart.conf',
  } ->
  service { 'consul-template':
    ensure  => 'running',
    enable  => true,
    require => File['/etc/init.d/consul-template'],
  }
}
