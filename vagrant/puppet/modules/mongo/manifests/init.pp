class mongo {
    package {"mongodb-10gen":
        ensure => "present",
    }

    service {'mongodb':
        ensure => running,
        enable => true,
        require => Package['mongodb-10gen'],
    }

    exec {'test-mongo':
        command => 'mongo',
        require => Service['mongodb'],
        tries => 5,
        try_sleep => 60,
    }

    file { '/tmp/applications.json':
        ensure => file,
        source => 'puppet:///modules/mongo/applications.json',
    }

    exec { 'import applications':
        command => 'mongoimport -d mabi -c applications < /tmp/applications.json --jsonArray',
        logoutput => "on_failure",
        require => [
            Exec['test-mongo'],
            File["/tmp/applications.json"],
        ],
        onlyif => "mongo mabi --eval 'db.applications.count()' | grep ^0",
    }
}