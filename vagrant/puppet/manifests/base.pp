Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

group { 'puppet':
	ensure => present,
}

class repos {
  exec {"get-mongo-key" :
    command => "apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10",
    unless  => "apt-key list| /bin/grep -c 10gen",
  }

  exec {"install-mongo-repo":
    command => "echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' >> /etc/apt/sources.list",
    unless  => "grep 'http://downloads-distro.mongodb.org/repo/ubuntu-upstart' -c /etc/apt/sources.list",
  }

  exec {"property commons":
    command => "apt-get update && apt-get -y install python-software-properties",
  }

  exec {"add node repo":
    command => "add-apt-repository ppa:chris-lea/node.js",
    require => Exec['property commons']
  }
}

class system-update {
  exec { 'apt-get update':
    command => 'apt-get update -y',
  }

  package { "build-essential":
    ensure => present,
    require => Exec['apt-get update'],
  }
}

class {'repos':} ->
class {'system-update':}

class {'git':
  require => Class['system-update']
}
class {'nginx':
  require => Class['system-update']
}
class {'mongo':
  require => Class['system-update']
}
class {'php-fpm':
  require => Class['system-update']
}
class {'nodejs':
  require => Class['system-update']
}
class {'redis-server':
  require => Class['system-update']
}
class {'autodocs':
  require => [
    Class['nodejs'],
    Class['php-fpm'],
    Class['git'],
    Class['nginx'],
    Class['redis-server'],
  ],
}