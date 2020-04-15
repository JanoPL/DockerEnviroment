## Docker environment for php framework
#### 1. Overview
<b>Warning: <i>An environment created for testing purposes</i></b>
 
PHP environment for frameworks based on docker for different versions of PHP and database version
For web server environment there is functionality to handle with acl for files in container so you don't need to change
in OS acl.

#### 2. Configuration
- Docker 
    - the env.example file contains all the settings for build environment

- PHP
   - The config file for application it's under php-fpm directory    
   - PHP extension: it's using script from https://github.com/mlocati/docker-php-extension-installer
   
#### 3. Build
To build image use docker-compose

- Before build image i recommend to setup project directory with php framework and configure nginx config file or apache vhost config file. Config for apache it's in ```config/apache.conf```, for nginx it's in ```nginx/root/etc/nginx/nginx.conf``` 
```shell script
docker-compose build -f docker-compose.yml build 
```
there is additional files to override original docker-compose file 

- ```docker-compose.apache.yml``` for apache web server, default is nginx web server
- ```docker-compose.dbmanagment.yml``` contains tools for DB such as phpMyAdmin, Adminer
- ```docker-compose.redismanagment.yml``` contains web tools to management redis DB from web browser
 