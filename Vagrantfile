# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    config.vm.synced_folder "./www", "/var/www"

    config.vm.define "backend" do |app|
        app.vm.provider :docker do |d|
            d.name = "backend"
            d.build_dir = "./docker/php"
            d.expose = [ 9000 ]
            d.remains_running = true
        end
    end

    config.vm.define "web" do |app|
        app.vm.provider :docker do |d|
            d.name = "web"
            d.build_dir = "./docker/nginx"
            d.ports = [ "8080:80" ]
            d.link "backend:backend"
            d.remains_running = true
        end
    end

    config.vm.define "data" do |app|
        app.vm.provider :docker do |d|
            d.name = "data"
            d.build_dir = "./docker/data"
            d.remains_running = false
        end
    end

    config.vm.define "db" do |app|
        app.vm.provider :docker do |d|
            d.name = "db"
            d.build_dir = "./docker/mariadb"
            d.create_args = ["--volumes-from=data"]
            d.ports = [ "33306:3306" ]
            d.env = {
                DB: "pando",
                USER: "appuser",
                PASSWORD: "secret"
            }
            d.remains_running = true
        end
    end
end
