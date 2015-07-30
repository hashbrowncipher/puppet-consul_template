# == Class: consul_template::package
#
# Installs the consul-template package.
#
class consul_template::package (
  $ensure = '0.10.0',
) {
  package { 'consul-template':
    ensure => $ensure,
  }
}
