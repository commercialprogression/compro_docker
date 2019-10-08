# Compro Docker #
A simple docker configuration that can be run from the root of a Drupal project to produce a quick local dev environment.

## Details ##
Uses Docker's official Drupal Dockerfile minus downloading the latest version of Drupal.

## Requirements ##
* [Docker](https://docs.docker.com/linux/step_one/)
* [Docker Compose](https://docs.docker.com/compose/install/)

## Usage ##
Add the Dockerfile and docker-compose.yml to a Drupal project root, then start compose:
```
docker-compose up
```
