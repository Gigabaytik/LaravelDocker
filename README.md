# Laravel Docker Wrapper

Docker-compose wrapper for local Laravel project development.

## Overview

### Components
* nginx - stable
* mysql - 5.7
* php - 7.4

#### php container
Installed php extensions: xml, tokenizer, openssl, mbstring, json, fileinfo, ctype, 
 bcmath, exif, mysqli, pdo_mysql, gd, zip, imagick, redis, xdebug.

Installed utils: curl, zip, unzip, git.

## Use
* Clone laravel project into `src` dir. Do not forget to add `.gitkeep` to `.gitignore`:

  	git clone git@github.com:someone/expamle.git src

* Paste `.env` file into `src` dir. Do not forget to set credentials from `docker-compose.yml`;

* Command for building docker environment:

  	docker-compose build
  	
* Command for launching docker environment:

  	docker-compose up -d

* Command for installation laravel project:

  	docker-compose exec local_php bash -c "deploy"

* Command for building and watch assets:

  	docker-compose exec local_php npm run watch

* Command for stopping docker containers:

  	docker-compose down

* Do not forget to move to `src` dir before committing project changes.
