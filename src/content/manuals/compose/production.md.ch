%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Guide to using Docker Compose in production
keywords: compose, orchestration, containers, production
title: Compose in production
@y
description: Guide to using Docker Compose in production
keywords: compose, orchestration, containers, production
title: Compose in production
@z

@x
When you define your app with Compose in development, you can use this
definition to run your application in different environments such as CI,
staging, and production.
@y
When you define your app with Compose in development, you can use this
definition to run your application in different environments such as CI,
staging, and production.
@z

@x
The easiest way to deploy an application is to run it on a single server,
similar to how you would run your development environment. If you want to scale
up your application, you can run Compose apps on a Swarm cluster.
@y
The easiest way to deploy an application is to run it on a single server,
similar to how you would run your development environment. If you want to scale
up your application, you can run Compose apps on a Swarm cluster.
@z

@x
### Modify your Compose file for production
@y
### Modify your Compose file for production
@z

@x
You may need to make changes to your app configuration to make it ready for
production. These changes might include:
@y
You may need to make changes to your app configuration to make it ready for
production. These changes might include:
@z

@x
- Removing any volume bindings for application code, so that code stays inside
  the container and can't be changed from outside
- Binding to different ports on the host
- Setting environment variables differently, such as reducing the verbosity of
  logging, or to specify settings for external services such as an email server
- Specifying a restart policy like [`restart: always`](/reference/compose-file/services.md#restart)to avoid downtime
- Adding extra services such as a log aggregator
@y
- Removing any volume bindings for application code, so that code stays inside
  the container and can't be changed from outside
- Binding to different ports on the host
- Setting environment variables differently, such as reducing the verbosity of
  logging, or to specify settings for external services such as an email server
- Specifying a restart policy like [`restart: always`](reference/compose-file/services.md#restart)to avoid downtime
- Adding extra services such as a log aggregator
@z

@x
For this reason, consider defining an additional Compose file, for example
`production.yml`, which specifies production-appropriate
configuration. This configuration file only needs to include the changes you want to make from the original Compose file. The additional Compose file
is then applied over the original `compose.yml` to create a new configuration.
@y
For this reason, consider defining an additional Compose file, for example
`production.yml`, which specifies production-appropriate
configuration. This configuration file only needs to include the changes you want to make from the original Compose file. The additional Compose file
is then applied over the original `compose.yml` to create a new configuration.
@z

@x
Once you have a second configuration file, you can use it with the
`-f` option:
@y
Once you have a second configuration file, you can use it with the
`-f` option:
@z

@x
```console
$ docker compose -f compose.yml -f production.yml up -d
```
@y
```console
$ docker compose -f compose.yml -f production.yml up -d
```
@z

@x
See [Using multiple compose files](multiple-compose-files/_index.md) for a more complete example, and other options.
@y
See [Using multiple compose files](multiple-compose-files/_index.md) for a more complete example, and other options.
@z

@x
### Deploying changes
@y
### Deploying changes
@z

@x
When you make changes to your app code, remember to rebuild your image and
recreate your app's containers. To redeploy a service called
`web`, use:
@y
When you make changes to your app code, remember to rebuild your image and
recreate your app's containers. To redeploy a service called
`web`, use:
@z

@x
```console
$ docker compose build web
$ docker compose up --no-deps -d web
```
@y
```console
$ docker compose build web
$ docker compose up --no-deps -d web
```
@z

@x
This first command rebuilds the image for `web` and then stops, destroys, and recreates
just the `web` service. The `--no-deps` flag prevents Compose from also
recreating any services which `web` depends on.
@y
This first command rebuilds the image for `web` and then stops, destroys, and recreates
just the `web` service. The `--no-deps` flag prevents Compose from also
recreating any services which `web` depends on.
@z

@x
### Running Compose on a single server
@y
### Running Compose on a single server
@z

@x
You can use Compose to deploy an app to a remote Docker host by setting the
`DOCKER_HOST`, `DOCKER_TLS_VERIFY`, and `DOCKER_CERT_PATH` environment variables
appropriately. For more information, see [pre-defined environment variables](environment-variables/envvars.md).
@y
You can use Compose to deploy an app to a remote Docker host by setting the
`DOCKER_HOST`, `DOCKER_TLS_VERIFY`, and `DOCKER_CERT_PATH` environment variables
appropriately. For more information, see [pre-defined environment variables](environment-variables/envvars.md).
@z

@x
Once you've set up your environment variables, all the normal `docker compose`
commands work with no further configuration.
@y
Once you've set up your environment variables, all the normal `docker compose`
commands work with no further configuration.
@z
