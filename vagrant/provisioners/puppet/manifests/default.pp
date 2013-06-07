stage { 'first':
  before => Stage['main'],
}

#
# APT
#

class { 'apt':
  force_aptget_update => true,
  stage => first,
}

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

#php::module { 'xdebug': }

php::module { 'apc':
  module_prefix => 'php-',
}

#
# Nginx
#

class { 'nginx': }

nginx::vhost { 'vagrant-setup.local':
  docroot => '/vagrant/public',
  serveraliases => 'vagrant-setup.local',
  template => '/vagrant/vagrant/templates/vhost.conf.erb',
}


#
# MySQL
#

class { 'mysql':
  root_password => 'secret',
}

mysql::grant { 'development-grant':
  mysql_privileges  => 'ALL',
  mysql_password    => 'development',
  mysql_db          => 'development',
  mysql_user        => 'development',
  mysql_host        => 'localhost',
}


#
# Redis
#

class { 'redis': }

#
# Stop apache from running since we are using nginx
#

class { 'apache':
  disable => true,
}