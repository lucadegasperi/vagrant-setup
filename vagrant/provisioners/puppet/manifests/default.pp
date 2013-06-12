#
# APT
#

class { 'apt':
  force_aptget_update => true,
}

#
# Apache
#

# class { 'apache': }

apache::module { 'php5':
  install_package => true,
}

apache::vhost { 'vagrant-setup.local':
  docroot             => '/vagrant/public',
  server_name         => 'vagrant-setup.local',
  serveraliases       => 'vagrant-setup.local',
}

#
# PHP
#

class { 'php54': }

class { 'php':
  before => Apache::Module['php5'],
}

#
# PHP Modules
#

php::module { 'gd': }

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
# .bashrc
#

file { '/home/vagrant/.bashrc':
  ensure => 'present',
  content => 'cd /vagrant',
}

#
# Laravel
#

class { 'laravel': }