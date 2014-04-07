class redis-server {
    package {"redis-server":
        ensure => "present",
    }
    
    service {"redis-server":
        ensure => running,
        require => Package['redis-server'],
    }
}