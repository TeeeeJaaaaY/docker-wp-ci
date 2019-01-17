# Docker WordPress CI

## Installing Docker

* Request access to [the Docker team](https://hub.docker.com/u/forgeuk/).
* [Download Docker](https://docs.docker.com/docker-for-mac/)
* `docker login --username=<username>`

## Pushing Changes

* `docker build -t forgeuk/wordpress-ci .`
* `docker push forgeuk/wordpress-ci`
