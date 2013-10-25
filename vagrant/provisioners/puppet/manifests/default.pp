Exec 
{
  path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
}

#
# APT
#

class { 'apt':
  force_aptget_update => true,
}

#
# git
#

class { 'git': }

#
# Curl
#

class { 'curl': }

#
# Apache
#

class { 'apache': }

apache::module { 'php5':
  install_package => true,
}

apache::vhost { 'vagrant-setup.local':
  docroot             => '/vagrant/public',
  server_name         => 'vagrant-setup.local',
  serveraliases       => 'vagrant-setup.local',
  directory => '/vagrant/public',
  directory_allow_override => 'All',
  directory_options => 'Indexes FollowSymLinks MultiViews',
  template => '/vagrant/vagrant/provisioners/puppet/templates/vhost.conf.erb',
}

#
# PHP
#

class { 'php55': }

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

php::module { 'xdebug': }

php::module { 'apc':
  module_prefix => 'php-',
}

class { 'composer': }

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
# Beanstalkd
#

class { 'beanstalkd': }


#
# .bashrc
#

file { '/home/vagrant/.bashrc':
  ensure => 'present',
  content => 'cd /vagrant',
}

#
#  you always need some ruby :(
#

class { 'ruby': }