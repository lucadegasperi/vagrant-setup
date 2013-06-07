#
# APT
#

class { 'apt':
  force_aptget_update => true,
}

#
# PHP
#

class { 'php':
  service => 'nginx',
  service_autorestart => true,
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

nginx::vhost { 'vagrant-setup.local':
  docroot => '/vagrant',
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
  mysql_host        => '127.0.0.1',
}


#
# Redis
#

class { 'redis': }

#
# Stop apache from running since we are using nginx
#

class { 'apache':
  disable => true
}