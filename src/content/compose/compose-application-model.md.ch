%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: How Compose works
description: Understand how Compose works and the Compose application model with an illustrative example 
keywords: compose, docker compose, compose specification, compose model 
aliases:
- /compose/compose-file/02-model/
- /compose/compose-yaml-file/
---
@y
---
title: Compose はどのように動作するか
description: Understand how Compose works and the Compose application model with an illustrative example 
keywords: compose, docker compose, compose specification, compose model 
aliases:
- /compose/compose-file/02-model/
- /compose/compose-yaml-file/
---
@z

@x
With Docker Compose you use a YAML configuration file, known as the [Compose file](#the-compose-file), to configure your application’s services, and then you create and start all the services from your configuration with the [Compose CLI](#cli). 
@y
With Docker Compose you use a YAML configuration file, known as the [Compose file](#the-compose-file), to configure your application’s services, and then you create and start all the services from your configuration with the [Compose CLI](#cli). 
@z

@x
The Compose file, or `compose.yaml` file, follows the rules provided by the [Compose Specification](compose-file/_index.md) in how to define multi-container applications. This is the Docker Compose implementation of the formal [Compose Specification](https://github.com/compose-spec/compose-spec). 
@y
The Compose file, or `compose.yaml` file, follows the rules provided by the [Compose Specification](compose-file/_index.md) in how to define multi-container applications. This is the Docker Compose implementation of the formal [Compose Specification](https://github.com/compose-spec/compose-spec). 
@z

@x
{{< accordion title="The Compose application model" >}}
@y
{{< accordion title="The Compose application model" >}}
@z

@x
Computing components of an application are defined as [services](compose-file/05-services.md). A service is an abstract concept implemented on platforms by running the same container image, and configuration, one or more times.
@y
Computing components of an application are defined as [services](compose-file/05-services.md). A service is an abstract concept implemented on platforms by running the same container image, and configuration, one or more times.
@z

@x
Services communicate with each other through [networks](compose-file/06-networks.md). In the Compose Specification, a network is a platform capability abstraction to establish an IP route between containers within services connected together.
@y
Services communicate with each other through [networks](compose-file/06-networks.md). In the Compose Specification, a network is a platform capability abstraction to establish an IP route between containers within services connected together.
@z

@x
Services store and share persistent data into [volumes](compose-file/07-volumes.md). The Specification describes such a persistent data as a high-level filesystem mount with global options. 
@y
Services store and share persistent data into [volumes](compose-file/07-volumes.md). The Specification describes such a persistent data as a high-level filesystem mount with global options. 
@z

@x
Some services require configuration data that is dependent on the runtime or platform. For this, the Specification defines a dedicated [configs](compose-file/08-configs.md) concept. From a service container point of view, configs are comparable to volumes, in that they are files mounted into the container. But the actual definition involves distinct platform resources and services, which are abstracted by this type.
@y
Some services require configuration data that is dependent on the runtime or platform. For this, the Specification defines a dedicated [configs](compose-file/08-configs.md) concept. From a service container point of view, configs are comparable to volumes, in that they are files mounted into the container. But the actual definition involves distinct platform resources and services, which are abstracted by this type.
@z

@x
A [secret](compose-file/09-secrets.md) is a specific flavor of configuration data for sensitive data that should not be exposed without security considerations. Secrets are made available to services as files mounted into their containers, but the platform-specific resources to provide sensitive data are specific enough to deserve a distinct concept and definition within the Compose specification.
@y
A [secret](compose-file/09-secrets.md) is a specific flavor of configuration data for sensitive data that should not be exposed without security considerations. Secrets are made available to services as files mounted into their containers, but the platform-specific resources to provide sensitive data are specific enough to deserve a distinct concept and definition within the Compose specification.
@z

@x
>**Note**
>
> With volumes, configs and secrets you can have a simple declaration at the top-level and then add more platform-specific information at the service level.
@y
>**Note**
>
> With volumes, configs and secrets you can have a simple declaration at the top-level and then add more platform-specific information at the service level.
@z

@x
A project is an individual deployment of an application specification on a platform. A project's name, set with the top-level [`name`](compose-file/04-version-and-name.md) attribute, is used to group
resources together and isolate them from other applications or other installation of the same Compose-specified application with distinct parameters. If you are creating resources on a platform, you must prefix resource names by project and
set the label `com.docker.compose.project`.
@y
A project is an individual deployment of an application specification on a platform. A project's name, set with the top-level [`name`](compose-file/04-version-and-name.md) attribute, is used to group
resources together and isolate them from other applications or other installation of the same Compose-specified application with distinct parameters. If you are creating resources on a platform, you must prefix resource names by project and
set the label `com.docker.compose.project`.
@z

@x
Compose offers a way for you to set a custom project name and override this name, so that the same `compose.yaml` file can be deployed twice on the same infrastructure, without changes, by just passing a distinct name.
@y
Compose offers a way for you to set a custom project name and override this name, so that the same `compose.yaml` file can be deployed twice on the same infrastructure, without changes, by just passing a distinct name.
@z

@x
{{< /accordion >}} 
@y
{{< /accordion >}} 
@z

@x
## The Compose file
@y
## The Compose file
@z

@x
The default path for a Compose file is `compose.yaml` (preferred) or `compose.yml` that is placed in the working directory.
Compose also supports `docker-compose.yaml` and `docker-compose.yml` for backwards compatibility of earlier versions.
If both files exist, Compose prefers the canonical `compose.yaml`.
@y
The default path for a Compose file is `compose.yaml` (preferred) or `compose.yml` that is placed in the working directory.
Compose also supports `docker-compose.yaml` and `docker-compose.yml` for backwards compatibility of earlier versions.
If both files exist, Compose prefers the canonical `compose.yaml`.
@z

@x
You can use [fragments](compose-file/10-fragments.md) and [extensions](compose-file/11-extension.md) to keep your Compose file efficient and easy to maintain.
@y
You can use [fragments](compose-file/10-fragments.md) and [extensions](compose-file/11-extension.md) to keep your Compose file efficient and easy to maintain.
@z

@x
Multiple Compose files can be [merged](13-merge.md) together to define the application model. The combination of YAML files is implemented by appending or overriding YAML elements based on the Compose file order you set. 
Simple attributes and maps get overridden by the highest order Compose file, lists get merged by appending. Relative
paths are resolved based on the first Compose file's parent folder, whenever complimentary files being
merged are hosted in other folders. As some Compose file elements can both be expressed as single strings or complex objects, merges apply to
the expanded form. For more information, see [Working with multiple Compose files](multiple-compose-files/_index.md)
@y
Multiple Compose files can be [merged](13-merge.md) together to define the application model. The combination of YAML files is implemented by appending or overriding YAML elements based on the Compose file order you set. 
Simple attributes and maps get overridden by the highest order Compose file, lists get merged by appending. Relative
paths are resolved based on the first Compose file's parent folder, whenever complimentary files being
merged are hosted in other folders. As some Compose file elements can both be expressed as single strings or complex objects, merges apply to
the expanded form. For more information, see [Working with multiple Compose files](multiple-compose-files/_index.md)
@z

@x
If you want to reuse other Compose files, or factor out parts of your application model into separate Compose files, you can also use [`include`](compose-file/14-include.md). This is useful if your Compose application is dependent on another application which is managed by a different team, or needs to be shared with others.
@y
If you want to reuse other Compose files, or factor out parts of your application model into separate Compose files, you can also use [`include`](compose-file/14-include.md). This is useful if your Compose application is dependent on another application which is managed by a different team, or needs to be shared with others.
@z

@x
## CLI
@y
## CLI
@z

@x
The Docker CLI lets you to interact with your Docker Compose applications through the `docker compose` command, and its subcommands. Using the CLI, you can manage the lifecycle of your multi-container applications defined in the `compose.yaml` file. The CLI commands enable you to start, stop, and configure your applications effortlessly.
@y
The Docker CLI lets you to interact with your Docker Compose applications through the `docker compose` command, and its subcommands. Using the CLI, you can manage the lifecycle of your multi-container applications defined in the `compose.yaml` file. The CLI commands enable you to start, stop, and configure your applications effortlessly.
@z

@x
### Key commands 
@y
### Key commands 
@z

@x
To start all the services defined in your `compose.yaml` file:
@y
To start all the services defined in your `compose.yaml` file:
@z

@x
```console
$ docker compose up
```
@y
```console
$ docker compose up
```
@z

@x
To stop and remove the running services:
@y
To stop and remove the running services:
@z

@x
```console
$ docker compose down 
```
@y
```console
$ docker compose down 
```
@z

@x
If you want to monitor the output of your running containers and debug issues, you can view the logs with: 
@y
If you want to monitor the output of your running containers and debug issues, you can view the logs with: 
@z

@x
```console
$ docker compose logs
```
@y
```console
$ docker compose logs
```
@z

@x
To lists all the services along with their current status:
@y
To lists all the services along with their current status:
@z

@x
```console
$ docker compose ps
```
@y
```console
$ docker compose ps
```
@z

@x
For a full list of all the Compose CLI commands, see the [reference documentation](../reference/cli/docker/compose/_index.md).
@y
For a full list of all the Compose CLI commands, see the [reference documentation](../reference/cli/docker/compose/_index.md).
@z

@x
## Illustrative example
@y
## Illustrative example
@z

@x
The following example illustrates the Compose concepts outlined above. The example is non-normative.
@y
The following example illustrates the Compose concepts outlined above. The example is non-normative.
@z

@x
Consider an application split into a frontend web application and a backend service.
@y
Consider an application split into a frontend web application and a backend service.
@z

@x
The frontend is configured at runtime with an HTTP configuration file managed by infrastructure, providing an external domain name, and an HTTPS server certificate injected by the platform's secured secret store.
@y
The frontend is configured at runtime with an HTTP configuration file managed by infrastructure, providing an external domain name, and an HTTPS server certificate injected by the platform's secured secret store.
@z

@x
The backend stores data in a persistent volume.
@y
The backend stores data in a persistent volume.
@z

@x
Both services communicate with each other on an isolated back-tier network, while the frontend is also connected to a front-tier network and exposes port 443 for external usage.
@y
Both services communicate with each other on an isolated back-tier network, while the frontend is also connected to a front-tier network and exposes port 443 for external usage.
@z

@x
![Compose application example](images/compose-application.webp)
@y
![Compose application example](images/compose-application.webp)
@z

@x
The example application is composed of the following parts:
@y
The example application is composed of the following parts:
@z

@x
- 2 services, backed by Docker images: `webapp` and `database`
- 1 secret (HTTPS certificate), injected into the frontend
- 1 configuration (HTTP), injected into the frontend
- 1 persistent volume, attached to the backend
- 2 networks
@y
- 2 services, backed by Docker images: `webapp` and `database`
- 1 secret (HTTPS certificate), injected into the frontend
- 1 configuration (HTTP), injected into the frontend
- 1 persistent volume, attached to the backend
- 2 networks
@z

@x
```yml
services:
  frontend:
    image: example/webapp
    ports:
      - "443:8043"
    networks:
      - front-tier
      - back-tier
    configs:
      - httpd-config
    secrets:
      - server-certificate
@y
```yml
services:
  frontend:
    image: example/webapp
    ports:
      - "443:8043"
    networks:
      - front-tier
      - back-tier
    configs:
      - httpd-config
    secrets:
      - server-certificate
@z

@x
  backend:
    image: example/database
    volumes:
      - db-data:/etc/data
    networks:
      - back-tier
@y
  backend:
    image: example/database
    volumes:
      - db-data:/etc/data
    networks:
      - back-tier
@z

@x
volumes:
  db-data:
    driver: flocker
    driver_opts:
      size: "10GiB"
@y
volumes:
  db-data:
    driver: flocker
    driver_opts:
      size: "10GiB"
@z

@x
configs:
  httpd-config:
    external: true
@y
configs:
  httpd-config:
    external: true
@z

@x
secrets:
  server-certificate:
    external: true
@y
secrets:
  server-certificate:
    external: true
@z

@x
networks:
  # The presence of these objects is sufficient to define them
  front-tier: {}
  back-tier: {}
```
@y
networks:
  # The presence of these objects is sufficient to define them
  front-tier: {}
  back-tier: {}
```
@z

@x
The `docker compose up` command starts the `frontend` and `backend` services, create the necessary networks and volumes, and injects the configuration and secret into the frontend service.
@y
The `docker compose up` command starts the `frontend` and `backend` services, create the necessary networks and volumes, and injects the configuration and secret into the frontend service.
@z

@x
`docker compose ps` provides a snapshot of the current state of your services, making it easy to see which containers are running, their status, and the ports they are using:
@y
`docker compose ps` provides a snapshot of the current state of your services, making it easy to see which containers are running, their status, and the ports they are using:
@z

@x
```text
$ docker compose ps
@y
```text
$ docker compose ps
@z

@x
NAME                IMAGE                COMMAND                  SERVICE             CREATED             STATUS              PORTS
example-frontend-1  example/webapp       "nginx -g 'daemon of…"   frontend            2 minutes ago       Up 2 minutes        0.0.0.0:443->8043/tcp
example-backend-1   example/database     "docker-entrypoint.s…"   backend             2 minutes ago       Up 2 minutes
```
@y
NAME                IMAGE                COMMAND                  SERVICE             CREATED             STATUS              PORTS
example-frontend-1  example/webapp       "nginx -g 'daemon of…"   frontend            2 minutes ago       Up 2 minutes        0.0.0.0:443->8043/tcp
example-backend-1   example/database     "docker-entrypoint.s…"   backend             2 minutes ago       Up 2 minutes
```
@z

@x
## What's next 
@y
## What's next 
@z

@x
- [Quickstart](gettingstarted.md)
- [Explore some sample applications](samples-for-compose.md)
- [Familiarize yourself with the Compose Specification](compose-file/_index.md)
@y
- [Quickstart](gettingstarted.md)
- [Explore some sample applications](samples-for-compose.md)
- [Familiarize yourself with the Compose Specification](compose-file/_index.md)
@z
