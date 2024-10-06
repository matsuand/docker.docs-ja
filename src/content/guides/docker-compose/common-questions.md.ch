%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Common challenges and questions
description: Explore common challenges and questions related to Docker Compose.
weight: 30
---
@y
---
title: Common challenges and questions
description: Explore common challenges and questions related to Docker Compose.
weight: 30
---
@z

@x
<!-- vale Docker.HeadingLength = NO -->
@y
<!-- vale Docker.HeadingLength = NO -->
@z

@x
### Do I need to maintain a separate Compose file for my development, testing, and staging environments?
@y
### Do I need to maintain a separate Compose file for my development, testing, and staging environments?
@z

@x
You don't necessarily need to maintain entirely separate Compose files for your
development, testing, and staging environments. You can define all your
services in a single Compose file (`compose.yaml`). You can use profiles to
group service configurations specific to each environment (`dev`, `test`,
`staging`).
@y
You don't necessarily need to maintain entirely separate Compose files for your
development, testing, and staging environments. You can define all your
services in a single Compose file (`compose.yaml`). You can use profiles to
group service configurations specific to each environment (`dev`, `test`,
`staging`).
@z

@x
When you need to spin up an environment, you can activate the corresponding
profiles. For example, to set up the development environment:
@y
When you need to spin up an environment, you can activate the corresponding
profiles. For example, to set up the development environment:
@z

@x
```console
$ docker compose --profile dev up
```
@y
```console
$ docker compose --profile dev up
```
@z

@x
This command starts only the services associated with the `dev` profile,
leaving the rest inactive.
@y
This command starts only the services associated with the `dev` profile,
leaving the rest inactive.
@z

@x
For more information on using profiles, see [Using profiles with
Compose](/compose/how-tos/profiles/).
@y
For more information on using profiles, see [Using profiles with
Compose](/compose/how-tos/profiles/).
@z

@x
### How can I enforce the database service to start up before the frontend service?
@y
### How can I enforce the database service to start up before the frontend service?
@z

@x
Docker Compose ensures services start in a specific order by using the
`depends_on` property. This tells Compose to start the database service before
even attempting to launch the frontend service. This is crucial since
applications often rely on databases being ready for connections.
@y
Docker Compose ensures services start in a specific order by using the
`depends_on` property. This tells Compose to start the database service before
even attempting to launch the frontend service. This is crucial since
applications often rely on databases being ready for connections.
@z

@x
However, `depends_on` only guarantees the order, not that the database is fully
initialized. For a more robust approach, especially if your application relies
on a prepared database (e.g., after migrations), consider [health
checks](/reference/compose-file/services.md#healthcheck). Here, you can
configure the frontend to wait until the database passes its health check
before starting. This ensures the database is not only up but also ready to
handle requests.
@y
However, `depends_on` only guarantees the order, not that the database is fully
initialized. For a more robust approach, especially if your application relies
on a prepared database (e.g., after migrations), consider [health
checks](/reference/compose-file/services.md#healthcheck). Here, you can
configure the frontend to wait until the database passes its health check
before starting. This ensures the database is not only up but also ready to
handle requests.
@z

@x
For more information on setting the startup order of your services, see
[Control startup and shutdown order in Compose](/compose/how-tos/startup-order/).
@y
For more information on setting the startup order of your services, see
[Control startup and shutdown order in Compose](/compose/how-tos/startup-order/).
@z

@x
### Can I use Compose to build a Docker image?
@y
### Can I use Compose to build a Docker image?
@z

@x
Yes, you can use Docker Compose to build Docker images. Docker Compose is a
tool for defining and running multi-container applications. Even if your
application isn't a multi-container application, Docker Compose can make it
easier to run by defining all the `docker run` options in a file.
@y
Yes, you can use Docker Compose to build Docker images. Docker Compose is a
tool for defining and running multi-container applications. Even if your
application isn't a multi-container application, Docker Compose can make it
easier to run by defining all the `docker run` options in a file.
@z

@x
To use Compose, you need a `compose.yaml` file. In this file, you can specify
the build context and Dockerfile for each service. When you run the command
`docker compose up --build`, Docker Compose will build the images for each
service and then start the containers.
@y
To use Compose, you need a `compose.yaml` file. In this file, you can specify
the build context and Dockerfile for each service. When you run the command
`docker compose up --build`, Docker Compose will build the images for each
service and then start the containers.
@z

@x
For more information on building Docker images using Compose, see the [Compose
Build Specification](/compose/compose-file/build/).
@y
For more information on building Docker images using Compose, see the [Compose
Build Specification](/compose/compose-file/build/).
@z

@x
### What is the difference between Docker Compose and Dockerfile?
@y
### What is the difference between Docker Compose and Dockerfile?
@z

@x
A Dockerfile provides instructions to build a container image while a Compose
file defines your running containers. Quite often, a Compose file references a
Dockerfile to build an image to use for a particular service.
@y
A Dockerfile provides instructions to build a container image while a Compose
file defines your running containers. Quite often, a Compose file references a
Dockerfile to build an image to use for a particular service.
@z

@x
### What is the difference between the `docker compose up` and `docker compose run` commands?
@y
### What is the difference between the `docker compose up` and `docker compose run` commands?
@z

@x
The `docker compose up` command creates and starts all your services. It's
perfect for launching your development environment or running the entire
application. The `docker compose run` command focuses on individual services.
It starts a specified service along with its dependencies, allowing you to run
tests or perform one-off tasks within that container.
@y
The `docker compose up` command creates and starts all your services. It's
perfect for launching your development environment or running the entire
application. The `docker compose run` command focuses on individual services.
It starts a specified service along with its dependencies, allowing you to run
tests or perform one-off tasks within that container.
@z

@x
<div id="compose-lp-survey-anchor"></div>
@y
<div id="compose-lp-survey-anchor"></div>
@z
