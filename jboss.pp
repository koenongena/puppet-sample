jdk7::install7{ 'jdk1.7.0_45':
    version              => "7u45" , 
    fullVersion          => "jdk1.7.0_45",
    alternativesPriority => 18000, 
    x64                  => true,
    downloadDir          => "/install",
    urandomJavaFix       => false,
    sourcePath           => "puppet:///modules/jdk7/"
}

include jdk7

class { 'jdk7::urandomfix' :}

# class { 'apt':
  # always_apt_update    => true,
  # disable_keys         => undef,
  # proxy_host           => false,
  # proxy_port           => '8080',
  # purge_sources_list   => false,
  # purge_sources_list_d => false,
  # purge_preferences_d  => false,
  # update_timeout       => undef
# }

 # apt::source { 'percona':
   # location   => 'http://repo.percona.com/apt',
   # release    => 'stable',
   # repos      => 'main',
   # key        => '1C4CBDCDCD2EFD2A',
   # key_server => 'keys.gnupg.net',
   # include_src => true
 # }

 # include apt
 
 yumrepo { "percona":
  name    	=> "Percona",
  descr		=> "Percona Server",
  baseurl	=> "http://repo.percona.com/centos/\$releasever/os/\$basearch/",
  enabled 	=> 1,
  gpgcheck   => 0,
}

file { '/etc/init.d/mysqld':
   ensure => 'link',
   target => '/etc/init.d/mysql',
}

file { '/var/lib/mysql/localhost.localdomain.pid':
	target => '/var/lib/mysql/localhost.localdomain.pid'
}
 
class { 'mysql::server': 
  require 	=> [ Yumrepo["percona"], File['/etc/init.d/mysqld'] ],
  package_name => 'Percona-Server-server-56.x86_64',
  package_ensure => latest,
  service_name => 'mysql',
  override_options => { 'mysqld' => {
	 'max_connections' => '1024',
	 'bind_address' => '0.0.0.0',		
    	 'pidfile'     => '/var/lib/mysql/localhost.localdomain.pid',
	 } 
  },
  root_password    => 'strongpassword',
  databases => {
    'whatever' => {
	ensure => present,
	charset => 'utf8',
     }
  }
}

include '::mysql::server'

# class { 'mongodb':
  # init => 'sysv',
# }

# include mongodb

#include jboss
