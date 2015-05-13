LEMP
================

A linux, nginx, mariadb, php vagrant/docker environment for running Symfony2 applications.

To use
======
1. Install Vagrant (and docker if you are on linux)
2. Clone this repo to your local machine
3. Copy (or symlink) your Symfony2 project into ```lemp/www```
4. Run ```vagrant up --no-parallel``` to start the entire stack or ```vagrant up %name%``` to start them individually where %name% is the name of a container below:
  - ```backend``` (php)
  - ```data``` (database storage)
  - ```db``` (mariadb, data container must be started first)
  - ```web``` (nginx)
  
If you want to run commands such as phpunit or composer, you must first:
```docker exec -i -t backend bash```
and then ```cd /var/www``` and run your commands
