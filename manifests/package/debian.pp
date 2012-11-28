# Class: nginx::package::debian
#
# This module manages NGINX package installation on debian based systems
#
# Parameters:
#
# There are no default parameters for this class.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# This class file is not called directly
class nginx::package::debian {
  exec { 'add_latest_nginx_pkg':
    command => '/usr/bin/add-apt-repository ppa:nginx/stable',
  }
  exec {'update_apt_for_ngnix_pkg':
    command => '/usr/bin/apt-get update',
    require => Exec['add_latest_nginx_pkg'],
  }
  package { 'nginx':
    ensure => present,
    require => Exec['update_apt_for_ngnix_pkg'],
  }
}
