# Compro Docker #
A simple docker container that can be run from the root of a Drupal site to produce a quick local dev environment.

## Details ##
Uses Docker's official Drupal Dockerfile minus downloading the latest version of Drupal.

## Requirements ##
* [Docker](https://docs.docker.com/linux/step_one/)
* [Docker Compose](https://docs.docker.com/compose/install/)

## Usage ##
Add the Dockerfile and docker-compose.yml to a Drupal site root, then start compose:
```
docker-compose up
```

## Restrictions ##
Drush, git, and things like Grunt are not available as of yet with this setup. They can still be run locally and should work well. Drush hasn't been thoroughly tested so things like sql-sync may not work.
