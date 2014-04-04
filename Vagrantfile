require 'yaml'

dir = File.dirname(File.expand_path(__FILE__))
confVals = YAML.load_file("#{dir}/vagrant/config.yaml")

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
  config.vm.network "forwarded_port", guest: 80, host: confVals['api']['port']
  config.vm.network "forwarded_port", guest: 3000, host: confVals['api']['docsPort']

  # Disable defalut shared folder and set it to what we want
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder ".", "/var/www/mabiSkeletonApi"
 
  # configure an ec2 instance 
  config.vm.provider :aws do |aws, override|
    override.vm.box = "ubuntu_aws"
    override.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"
    override.ssh.username = "#{confVals['aws']['username']}"
    override.ssh.private_key_path = "#{confVals['aws']['privateKeyPath']}"
    
    aws.keypair_name = "#{confVals['aws']['keypairName']}"
    aws.access_key_id = "#{confVals['aws']['accessKeyId']}"
    aws.secret_access_key = "#{confVals['aws']['secretAccessKey']}"
    aws.security_groups = "#{confVals['aws']['securityGroups']}"
    aws.instance_type = "#{confVals['aws']['instanceType']}"
    aws.ami = "#{confVals['aws']['amiId']}"
    aws.tags = {
      'Name' => "#{confVals['aws']['instanceName']}",
    }
  end
  
  # Enable shell provisioning to bootstrap puppet
  # This installs puppet if it is not already installed (good for aws)
  config.vm.provision :shell, :path => "vagrant/bootstrap.sh"

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  config.vm.provision :puppet, :module_path => "vagrant/puppet/modules" do |puppet|
    puppet.manifests_path = "vagrant/puppet/manifests"
    puppet.manifest_file  = "base.pp"
  end
  
end

