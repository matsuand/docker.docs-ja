%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リン クへの (no slash) 対応

@x
title: Defining and Running Multi-Container Applications with Docker Compose
summary: Simplify the process of defining, configuring, and running multi-container Docker applications to enable efficient development, testing, and deployment.
description: Learn how to use Docker Compose to define and run multi-container Docker applications.
@y
title: Defining and Running Multi-Container Applications with Docker Compose
summary: Simplify the process of defining, configuring, and running multi-container Docker applications to enable efficient development, testing, and deployment.
description: Learn how to use Docker Compose to define and run multi-container Docker applications.
@z

@x
{{< columns >}}
@y
{{< columns >}}
@z

@x
Developers face challenges with multi-container Docker applications, including
complex configuration, dependency management, and maintaining consistent
environments. Networking, resource allocation, data persistence, logging, and
monitoring add to the difficulty. Security concerns and troubleshooting issues
further complicate the process, requiring effective tools and practices for
efficient management.
@y
Developers face challenges with multi-container Docker applications, including
complex configuration, dependency management, and maintaining consistent
environments. Networking, resource allocation, data persistence, logging, and
monitoring add to the difficulty. Security concerns and troubleshooting issues
further complicate the process, requiring effective tools and practices for
efficient management.
@z

@x
Docker Compose solves the problem of managing multi-container Docker
applications by providing a simple way to define, configure, and run all the
containers needed for an application using a single YAML file. This approach
helps developers to easily set up, share, and maintain consistent development,
testing, and production environments, ensuring that complex applications can be
deployed with all their dependencies and services properly configured and
orchestrated.
@y
Docker Compose solves the problem of managing multi-container Docker
applications by providing a simple way to define, configure, and run all the
containers needed for an application using a single YAML file. This approach
helps developers to easily set up, share, and maintain consistent development,
testing, and production environments, ensuring that complex applications can be
deployed with all their dependencies and services properly configured and
orchestrated.
@z

@x
<!-- break -->
@y
<!-- break -->
@z

@x
## Who’s this for?
@y
## Who’s this for?
@z

@x
- Developers and DevOps engineers who need to define, manage, and orchestrate
  multi-container Docker applications efficiently across multiple environments.
- Development teams that want to increase productivity by streamlining
  development workflows and reducing setup time.
@y
- Developers and DevOps engineers who need to define, manage, and orchestrate
  multi-container Docker applications efficiently across multiple environments.
- Development teams that want to increase productivity by streamlining
  development workflows and reducing setup time.
@z

@x
## Tools integration
@y
## Tools integration
@z

@x
Works well with Docker CLI, CI/CD tools, and container orchestration tools.
@y
Works well with Docker CLI, CI/CD tools, and container orchestration tools.
@z

@x
{{< /columns >}}
@y
{{< /columns >}}
@z

@x
## Modules
@y
## Modules
@z

@x
{{< accordion large=true title=`Why Docker Compose?` icon=`play_circle` >}}
@y
{{< accordion large=true title=`Why Docker Compose?` icon=`play_circle` >}}
@z

@x
Docker Compose is an essential tool for defining and running multi-container
Docker applications. Docker Compose simplifies the Docker experience, making it
easier for developers to create, manage, and deploy applications by using YAML
files to configure application services.
@y
Docker Compose is an essential tool for defining and running multi-container
Docker applications. Docker Compose simplifies the Docker experience, making it
easier for developers to create, manage, and deploy applications by using YAML
files to configure application services.
@z

@x
Docker Compose provides several benefits:
@y
Docker Compose provides several benefits:
@z

@x
- Lets you define multi-container applications in a single YAML file.
- Ensures consistent environments across development, testing, and production.
- Manages the startup and linking of multiple containers effortlessly.
- Streamlines development workflows and reduces setup time.
- Ensures that each service runs in its own container, avoiding conflicts.
@y
- Lets you define multi-container applications in a single YAML file.
- Ensures consistent environments across development, testing, and production.
- Manages the startup and linking of multiple containers effortlessly.
- Streamlines development workflows and reduces setup time.
- Ensures that each service runs in its own container, avoiding conflicts.
@z

@x
{{< youtube-embed 2EqarOM2V4U >}}
@y
{{< youtube-embed 2EqarOM2V4U >}}
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z

@x
{{< accordion large=true title=`Demo: Set up and use Docker Compose` icon=`play_circle` >}}
@y
{{< accordion large=true title=`Demo: Set up and use Docker Compose` icon=`play_circle` >}}
@z

@x
{{< youtube-embed P5RBKmOLPH4 >}}
@y
{{< youtube-embed P5RBKmOLPH4 >}}
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z

@x
{{< accordion large=true title=`Common challenges and questions` icon=`quiz` >}}
@y
{{< accordion large=true title=`Common challenges and questions` icon=`quiz` >}}
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
services in a single Compose file (`compose.yml`). You can use profiles to
group service configurations specific to each environment (`dev`, `test`,
`staging`).
@y
You don't necessarily need to maintain entirely separate Compose files for your
development, testing, and staging environments. You can define all your
services in a single Compose file (`compose.yml`). You can use profiles to
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
Compose](/compose/profiles/).
@y
For more information on using profiles, see [Using profiles with
Compose](__SUBDIR__/compose/profiles/).
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
checks](reference/compose-file/services.md#healthcheck). Here, you can
configure the frontend to wait until the database passes its health check
before starting. This ensures the database is not only up but also ready to
handle requests.
@z

@x
For more information on setting the startup order of your services, see
[Control startup and shutdown order in Compose](/compose/startup-order/).
@y
For more information on setting the startup order of your services, see
[Control startup and shutdown order in Compose](__SUBDIR__/compose/startup-order/).
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
To use Compose, you need a `compose.yml` file. In this file, you can specify
the build context and Dockerfile for each service. When you run the command
`docker compose up --build`, Docker Compose will build the images for each
service and then start the containers.
@y
To use Compose, you need a `compose.yml` file. In this file, you can specify
the build context and Dockerfile for each service. When you run the command
`docker compose up --build`, Docker Compose will build the images for each
service and then start the containers.
@z

@x
For more information on building Docker images using Compose, see the [Compose
Build Specification](/compose/compose-file/build/).
@y
For more information on building Docker images using Compose, see the [Compose
Build Specification](__SUBDIR__/compose/compose-file/build/).
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
<!-- vale Docker.HeadingLength = YES -->
@y
<!-- vale Docker.HeadingLength = YES -->
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z

@x
{{< accordion large=true title=`Resources` icon=`link` >}}
@y
{{< accordion large=true title=`Resources` icon=`link` >}}
@z

@x
- [Overview of Docker Compose CLI](/compose/reference/)
- [Overview of Docker Compose](/compose/)
- [How Compose works](/compose/compose-application-model/)
- [Using profiles with Compose](/compose/profiles/)
- [Control startup and shutdown order with Compose](/compose/startup-order/)
- [Compose Build Specification](/compose/compose-file/build/)
@y
- [Overview of Docker Compose CLI](__SUBDIR__/compose/reference/)
- [Overview of Docker Compose](__SUBDIR__/compose/)
- [How Compose works](__SUBDIR__/compose/compose-application-model/)
- [Using profiles with Compose](__SUBDIR__/compose/profiles/)
- [Control startup and shutdown order with Compose](__SUBDIR__/compose/startup-order/)
- [Compose Build Specification](__SUBDIR__/compose/compose-file/build/)
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z
