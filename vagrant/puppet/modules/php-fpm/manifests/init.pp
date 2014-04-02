class php-fpm {
    $php = ["php5-fpm", "php5-cli", "php5-curl", "php-apc", "php-pear", "php5-dev"]

    package { $php:
        ensure => present,
        notify => Service['php5-fpm'],
    }

    service { 'php5-fpm':
        ensure => running,
        require => [
            Package['php5-fpm'],
            Exec['pecl install mongo'],
            File['/etc/php5/fpm/conf.d/mongo.ini'],
            File['/etc/php5/fpm/conf.d/apc.ini'],
        ],
    }

    exec { 'pecl install mongo':
        command => 'pecl install mongo',
        logoutput => "on_failure",
        require => Package[$php],
        unless => "/usr/bin/php -m | grep mongo",
    }

    file { '/etc/php5/fpm/conf.d/mongo.ini':
        ensure => file,
        source => 'puppet:///modules/php-fpm/mongo.ini',
        require => [
            Package[$php],
            Exec['pecl install mongo'],
        ],
    }

    file { '/etc/php5/fpm/conf.d/apc.ini':
        ensure => file,
        source => 'puppet:///modules/php-fpm/apc.ini',
        require => Package[$php],
    }
}