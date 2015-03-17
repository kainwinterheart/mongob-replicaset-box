# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    box_url = "http://127.0.0.1:9028/js/squeeze_x64.box"

    mongos_external_port = 27926

    testMDB1ip = "10.8.1.5"
    testMDB2ip = "10.8.1.6"
    testMDB3ip = "10.8.1.7"
    testMDB4ip = "10.8.1.8"
    testMDB5ip = "10.8.1.9"
    testMDB6ip = "10.8.1.10"
    testMDB7ip = "10.8.1.11"

    hostsfile_attrs = [
        {
            "ip" => testMDB1ip,
            "host" => "testMDB1"
        },
        {
            "ip" => testMDB2ip,
            "host" => "testMDB2"
        },
        {
            "ip" => testMDB3ip,
            "host" => "testMDB3"
        },
        {
            "ip" => testMDB4ip,
            "host" => "testMDB4"
        },
        {
            "ip" => testMDB5ip,
            "host" => "testMDB5"
        },
        {
            "ip" => testMDB6ip,
            "host" => "testMDB6"
        },
        {
            "ip" => testMDB7ip,
            "host" => "testMDB7"
        }
    ]

    config.vm.define "sh0-master" do |config|

        config.vm.box = "debian6"
        config.vm.hostname = "testMDB1"
        config.vm.box_url = box_url

        config.vm.network "private_network", ip: testMDB1ip

        config.vm.provision :chef_solo do |chef|

            chef.cookbooks_path = "cookbooks"
            chef.data_bags_path = "data_bags"
            chef.roles_path = "roles"

            chef.node_name = config.vm.hostname

            chef.add_role "mongodb_shard"

            chef.json = {
                "hostsfile-attrs" => hostsfile_attrs
            }
        end
    end

    config.vm.define "sh1-master" do |config|

        config.vm.box = "debian6"
        config.vm.hostname = "testMDB2"
        config.vm.box_url = box_url

        config.vm.network "private_network", ip: testMDB2ip

        config.vm.provision :chef_solo do |chef|

            chef.cookbooks_path = "cookbooks"
            chef.data_bags_path = "data_bags"
            chef.roles_path = "roles"

            chef.node_name = config.vm.hostname

            chef.add_role "mongodb_shard"

            chef.json = {
                "hostsfile-attrs" => hostsfile_attrs
            }
        end
    end

    config.vm.define "sh2-master" do |config|

        config.vm.box = "debian6"
        config.vm.hostname = "testMDB3"
        config.vm.box_url = box_url

        config.vm.network "private_network", ip: testMDB3ip

        config.vm.provision :chef_solo do |chef|

            chef.cookbooks_path = "cookbooks"
            chef.data_bags_path = "data_bags"
            chef.roles_path = "roles"

            chef.node_name = config.vm.hostname

            chef.add_role "mongodb_shard"

            chef.json = {
                "hostsfile-attrs" => hostsfile_attrs
            }
        end
    end

    config.vm.define "configserver" do |config|

        config.vm.box = "debian6"
        config.vm.hostname = "testMDB4"
        config.vm.box_url = box_url

        config.vm.network "private_network", ip: testMDB4ip

        config.vm.provision :chef_solo do |chef|

            chef.cookbooks_path = "cookbooks"
            chef.data_bags_path = "data_bags"
            chef.roles_path = "roles"

            chef.node_name = config.vm.hostname

            chef.add_role "mongodb_configserver"

            chef.json = {
                "hostsfile-attrs" => hostsfile_attrs
            }
        end
    end

    config.vm.define "mongos" do |config|

        config.vm.box = "debian6"
        config.vm.hostname = "testMDB5"
        config.vm.box_url = box_url

        config.vm.network "private_network", ip: testMDB5ip
        config.vm.network "forwarded_port", guest: 27017, host: mongos_external_port

        config.vm.provision :chef_solo do |chef|

            chef.cookbooks_path = "cookbooks"
            chef.data_bags_path = "data_bags"
            chef.roles_path = "roles"

            chef.node_name = config.vm.hostname

            chef.add_role "mongos"

            chef.json = {
                "hostsfile-attrs" => hostsfile_attrs
            }
        end
    end

    config.vm.define "sh3-master" do |config|

        config.vm.box = "debian6"
        config.vm.hostname = "testMDB6"
        config.vm.box_url = box_url

        config.vm.network "private_network", ip: testMDB6ip

        config.vm.provision :chef_solo do |chef|

            chef.cookbooks_path = "cookbooks"
            chef.data_bags_path = "data_bags"
            chef.roles_path = "roles"

            chef.node_name = config.vm.hostname

            chef.add_role "mongodb_shard"

            chef.json = {
                "hostsfile-attrs" => hostsfile_attrs
            }
        end
    end

    config.vm.define "sh4-master" do |config|

        config.vm.box = "debian6"
        config.vm.hostname = "testMDB7"
        config.vm.box_url = box_url

        config.vm.network "private_network", ip: testMDB7ip

        config.vm.provision :chef_solo do |chef|

            chef.cookbooks_path = "cookbooks"
            chef.data_bags_path = "data_bags"
            chef.roles_path = "roles"

            chef.node_name = config.vm.hostname

            chef.add_role "mongodb_shard"

            chef.json = {
                "hostsfile-attrs" => hostsfile_attrs
            }
        end
    end

end
