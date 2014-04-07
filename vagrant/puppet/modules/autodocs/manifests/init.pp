class autodocs {
    
    exec {"npm install":
        command => "npm install",
        cwd => "/var/www/${app_dir}/mabi/autodocs/iodocs",
    }
    
    file { "/var/www/${app_dir}/mabi/autodocs/iodocs/config.json":
        ensure => file,
        source => 'puppet:///modules/autodocs/config.json',
    }
    
    file { "/var/www/${app_dir}/mabi/autodocs/iodocs/public/data/apiconfig.json":
        ensure => file,
        content => template("autodocs/apiconfig.json.erb"),
    }
    
    exec {"start docs":
      command => "/bin/bash ./startDocServer.sh",
      cwd => "/var/www/${app_dir}/Config",
      require => [
        File["/var/www/${app_dir}/mabi/autodocs/iodocs/public/data/apiconfig.json"],
        File["/var/www/${app_dir}/mabi/autodocs/iodocs/config.json"],
        Exec['npm install'],
      ],
    }
    
}