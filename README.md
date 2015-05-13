LEMP
================

A Linux, nginx, mariadb, php vagrant/docker environment for running Symfony2 applications.

To use
======
1. Clone this repo to your local machine
2. Copy (or symlink) your Symfony2 project into ```lemp/www```
3. Run vagrant up --no-parallel to start the entire stack or vagrant up %name% to start a specific container listed below:
  - ```backend``` (php)
  - ```data``` (database storage)
  - ```db``` (mariadb)
  - ```web``` (nginx)
  
If you want to run commands such as phpunit or composer, you must first:
```docker exec -i -t backend bash```
and then ```cd /var/www``` and run your commands
