%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Key features and use cases of Docker Compose
keywords: documentation, docs, docker, compose, orchestration, containers, uses, features
title: Key features and use cases of Docker Compose
---
@y
---
description: Key features and use cases of Docker Compose
keywords: documentation, docs, docker, compose, orchestration, containers, uses, features
title: Key features and use cases of Docker Compose
---
@z

@x
Using Compose is essentially a three-step process:
@y
Using Compose is essentially a three-step process:
@z

@x
1. Define your app's environment with a `Dockerfile` so it can be reproduced
anywhere.
@y
1. Define your app's environment with a `Dockerfile` so it can be reproduced
anywhere.
@z

@x
2. Define the services that make up your app in a `compose.yaml` file
so they can be run together in an isolated environment.
@y
2. Define the services that make up your app in a `compose.yaml` file
so they can be run together in an isolated environment.
@z

@x
3. Run `docker compose up` and the Docker compose command starts and runs your entire app.
@y
3. Run `docker compose up` and the Docker compose command starts and runs your entire app.
@z

@x
A `compose.yaml` looks like this:
@y
A `compose.yaml` looks like this:
@z

@x
```yaml
services:
  web:
    build: .
    ports:
      - "8000:5000"
    volumes:
      - .:/code
      - logvolume01:/var/log
    depends_on:
      - redis
  redis:
    image: redis
volumes:
  logvolume01: {}
```
@y
```yaml
services:
  web:
    build: .
    ports:
      - "8000:5000"
    volumes:
      - .:/code
      - logvolume01:/var/log
    depends_on:
      - redis
  redis:
    image: redis
volumes:
  logvolume01: {}
```
@z

@x
For more information about the Compose file, see the
[Compose file reference](compose-file/index.md).
@y
For more information about the Compose file, see the
[Compose file reference](compose-file/index.md).
@z

@x
## Key features of Docker Compose
@y
## Key features of Docker Compose
@z

@x
### Have multiple isolated environments on a single host
@y
### Have multiple isolated environments on a single host
@z

@x
Compose uses a project name to isolate environments from each other. You can make use of this project name in several different contexts:
@y
Compose uses a project name to isolate environments from each other. You can make use of this project name in several different contexts:
@z

@x
* On a dev host, to create multiple copies of a single environment, such as when you want to run a stable copy for each feature branch of a project
* On a CI server, to keep builds from interfering with each other, you can set
  the project name to a unique build number
* On a shared host or dev host, to prevent different projects, which may use the
  same service names, from interfering with each other
@y
* On a dev host, to create multiple copies of a single environment, such as when you want to run a stable copy for each feature branch of a project
* On a CI server, to keep builds from interfering with each other, you can set
  the project name to a unique build number
* On a shared host or dev host, to prevent different projects, which may use the
  same service names, from interfering with each other
@z

@x
The default project name is the base name of the project directory. You can set
a custom project name by using the
[`-p` command line option](reference/index.md) or the
[`COMPOSE_PROJECT_NAME` environment variable](environment-variables/envvars.md#compose_project_name).
@y
The default project name is the base name of the project directory. You can set
a custom project name by using the
[`-p` command line option](reference/index.md) or the
[`COMPOSE_PROJECT_NAME` environment variable](environment-variables/envvars.md#compose_project_name).
@z

@x
The default project directory is the base directory of the Compose file. A custom value
for it can be defined with the `--project-directory` command line option.
@y
The default project directory is the base directory of the Compose file. A custom value
for it can be defined with the `--project-directory` command line option.
@z

@x
### Preserves volume data when containers are created
@y
### Preserves volume data when containers are created
@z

@x
Compose preserves all volumes used by your services. When `docker compose up`
runs, if it finds any containers from previous runs, it copies the volumes from
the old container to the new container. This process ensures that any data
you've created in volumes isn't lost.
@y
Compose preserves all volumes used by your services. When `docker compose up`
runs, if it finds any containers from previous runs, it copies the volumes from
the old container to the new container. This process ensures that any data
you've created in volumes isn't lost.
@z

@x
If you use `docker compose` on a Windows machine, see
[Environment variables](environment-variables/envvars.md) and adjust the necessary environment
variables for your specific needs.
@y
If you use `docker compose` on a Windows machine, see
[Environment variables](environment-variables/envvars.md) and adjust the necessary environment
variables for your specific needs.
@z

@x
### Only recreate containers that have changed
@y
### Only recreate containers that have changed
@z

@x
Compose caches the configuration used to create a container. When you
restart a service that has not changed, Compose re-uses the existing
containers. Re-using containers means that you can make changes to your
environment very quickly.
@y
Compose caches the configuration used to create a container. When you
restart a service that has not changed, Compose re-uses the existing
containers. Re-using containers means that you can make changes to your
environment very quickly.
@z

@x
### Supports variables and moving a composition between environments
@y
### Supports variables and moving a composition between environments
@z

@x
Compose supports variables in the Compose file. You can use these variables
to customize your composition for different environments, or different users.
@y
Compose supports variables in the Compose file. You can use these variables
to customize your composition for different environments, or different users.
@z

@x
You can extend a Compose file using the `extends` field or by creating multiple
Compose files. For more details, see [Working with multiple Compose files](multiple-compose-files/index.md).
@y
You can extend a Compose file using the `extends` field or by creating multiple
Compose files. For more details, see [Working with multiple Compose files](multiple-compose-files/index.md).
@z

@x
## Common use cases of Docker Compose
@y
## Common use cases of Docker Compose
@z

@x
Compose can be used in many different ways. Some common use cases are outlined
below.
@y
Compose can be used in many different ways. Some common use cases are outlined
below.
@z

@x
### Development environments
@y
### Development environments
@z

@x
When you're developing software, the ability to run an application in an
isolated environment and interact with it is crucial. The Compose command
line tool can be used to create the environment and interact with it.
@y
When you're developing software, the ability to run an application in an
isolated environment and interact with it is crucial. The Compose command
line tool can be used to create the environment and interact with it.
@z

@x
The [Compose file](compose-file/index.md) provides a way to document and configure
all of the application's service dependencies (databases, queues, caches,
web service APIs, etc). Using the Compose command line tool you can create
and start one or more containers for each dependency with a single command
(`docker compose up`).
@y
The [Compose file](compose-file/index.md) provides a way to document and configure
all of the application's service dependencies (databases, queues, caches,
web service APIs, etc). Using the Compose command line tool you can create
and start one or more containers for each dependency with a single command
(`docker compose up`).
@z

@x
Together, these features provide a convenient way for developers to get
started on a project. Compose can reduce a multi-page "developer getting
started guide" to a single machine readable Compose file and a few commands.
@y
Together, these features provide a convenient way for developers to get
started on a project. Compose can reduce a multi-page "developer getting
started guide" to a single machine readable Compose file and a few commands.
@z

@x
### Automated testing environments
@y
### Automated testing environments
@z

@x
An important part of any Continuous Deployment or Continuous Integration process
is the automated test suite. Automated end-to-end testing requires an
environment in which to run tests. Compose provides a convenient way to create
and destroy isolated testing environments for your test suite. By defining the full environment in a [Compose file](compose-file/index.md), you can create and destroy these environments in just a few commands:
@y
An important part of any Continuous Deployment or Continuous Integration process
is the automated test suite. Automated end-to-end testing requires an
environment in which to run tests. Compose provides a convenient way to create
and destroy isolated testing environments for your test suite. By defining the full environment in a [Compose file](compose-file/index.md), you can create and destroy these environments in just a few commands:
@z

@x
```console
$ docker compose up -d
$ ./run_tests
$ docker compose down
```
@y
```console
$ docker compose up -d
$ ./run_tests
$ docker compose down
```
@z

@x
### Single host deployments
@y
### Single host deployments
@z

@x
Compose has traditionally been focused on development and testing workflows,
but with each release we're making progress on more production-oriented features.
@y
Compose has traditionally been focused on development and testing workflows,
but with each release we're making progress on more production-oriented features.
@z

@x
For details on using production-oriented features, see
[Compose in production](production.md).
@y
For details on using production-oriented features, see
[Compose in production](production.md).
@z
