class autodocs {
    
    exec { 'composer install':
      command => 'php composer.phar install',
      environment => 'COMPOSER_HOME=/var/www/mabiSkeletonApi',
      cwd => '/var/www/mabiSkeletonApi',
    }
    
    exec {"npm install":
        command => "npm install",
        cwd => "/var/www/mabiSkeletonApi/mabi/autodocs/iodocs",
        require => Exec['composer install'],
    }
    
    file { '/var/www/mabiSkeletonApi/mabi/autodocs/iodocs/config.json':
        ensure => file,
        source => 'puppet:///modules/autodocs/config.json',
        require => Exec['composer install'],
    }
    
    file { '/var/www/mabiSkeletonApi/mabi/autodocs/iodocs/public/data/apiconfig.json':
        ensure => file,
        source => 'puppet:///modules/autodocs/apiconfig.json',
        require => Exec['composer install'],
    }
    
    exec {"start docs":
      command => "/bin/bash ./startDocServer.sh",
      cwd => "/var/www/mabiSkeletonApi/Config",
      require => [
        File['/var/www/mabiSkeletonApi/mabi/autodocs/iodocs/public/data/apiconfig.json'],
        File['/var/www/mabiSkeletonApi/mabi/autodocs/iodocs/config.json'],
        Exec['npm install'],
      ],
    }
    
}