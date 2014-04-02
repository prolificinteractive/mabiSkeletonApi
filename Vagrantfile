Vagrant.configure('2') do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Name the box, handy for multiple Environments and projects
  config.vm.define :mabiSkeletonApi do |t|
  end

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  config.vm.network "forwarded_port", guest: 80, host: 3333
  config.vm.network "forwarded_port", guest: 3000, host: 3334

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  # config.vm.share_folder "v-data", "/vagrant_data", "../data"

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  config.vm.provision :puppet, :module_path => "vagrant/puppet/modules" do |puppet|
    puppet.manifests_path = "vagrant/puppet/manifests"
    puppet.manifest_file  = "base.pp"
  end
  
end

