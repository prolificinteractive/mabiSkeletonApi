class nginx {
    package { 'nginx':
	    ensure => present,
    }

    service { 'nginx':
    	ensure => running,
    	require => Package['nginx'],
    }

    file { 'vagrant-nginx':
        path => '/etc/nginx/sites-available/default-conf',
        ensure => file,
        require => Package['nginx'],
        source => 'puppet:///modules/nginx/default-conf',
    }

    file { 'default-nginx-disable':
        path => '/etc/nginx/sites-enabled/default',
        ensure => absent,
        require => Package['nginx'],
    }

    file { 'vagrant-nginx-enable':
        path => '/etc/nginx/sites-enabled/default-conf',
        target => '/etc/nginx/sites-available/default-conf',
        ensure => link,
        notify => Service['nginx'],
        require => [
            File['vagrant-nginx'],
            File['default-nginx-disable'],
        ],
    }
}