class autodocs {
    
    exec { 'composer install':
      command => 'php composer.phar install',
      cwd => '/vagrant',
    }
    
    exec {"npm install":
        command => "npm install",
        cwd => "/vagrant/mabi/autodocs/iodocs",
        require => Exec['composer install'],
    }
    
    file { '/vagrant/mabi/autodocs/iodocs/config.json':
        ensure => file,
        source => 'puppet:///modules/autodocs/config.json',
        require => Exec['composer install'],
    }
    
    file { '/vagrant/mabi/autodocs/iodocs/public/data/apiconfig.json':
        ensure => file,
        source => 'puppet:///modules/autodocs/apiconfig.json',
        require => Exec['composer install'],
    }
    
    exec {"start docs":
      command => "/bin/bash ./startDocServer.sh",
      cwd => "/vagrant/Config",
      require => [
        File['/vagrant/mabi/autodocs/iodocs/public/data/apiconfig.json'],
        File['/vagrant/mabi/autodocs/iodocs/config.json'],
        Exec['npm install'],
      ],
    }
    
}