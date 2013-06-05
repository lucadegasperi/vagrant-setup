#
# PHP
#

class { 'php':
  service => 'nginx',
}


#
# PHP Modules
#

php::module { 'gd': }

php::module { 'fpm': }

php::module { 'mysql': }

php::module { 'sqlite': }

php::module { 'mcrypt': }

php::module { 'curl': }

php::module { 'memcache': }

php::module { 'cli': }

php::module { 'apc':
  module_prefix => 'php-',
}

#
# Nginx
#

class { 'nginx': }

nginx::vhost { 'vagrant-setup.local':
  docroot => '/vagrant/documents',
  serveraliases => 'vagrant-setup.local',
  template => '/vagrant/templates/vhost.conf.erb',
}


#
# MySQL
#

class { 'mysql': }


#
# Redis
#

class { "redis": }