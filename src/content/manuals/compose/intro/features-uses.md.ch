%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Discover the benefits and typical use cases of Docker Compose for containerized application development and deployment
keywords: docker compose, compose use cases, compose benefits, container orchestration, development environments, testing containers, yaml file
title: Why use Compose?
@y
description: Discover the benefits and typical use cases of Docker Compose for containerized application development and deployment
keywords: docker compose, compose use cases, compose benefits, container orchestration, development environments, testing containers, yaml file
title: Why use Compose?
@z

@x
## Key benefits of Docker Compose
@y
## Key benefits of Docker Compose
@z

@x
Using Docker Compose offers several benefits that streamline the development, deployment, and management of containerized applications:
@y
Using Docker Compose offers several benefits that streamline the development, deployment, and management of containerized applications:
@z

@x
- Simplified control: Define and manage multi-container apps in one YAML file, streamlining orchestration and replication.
@y
- Simplified control: Define and manage multi-container apps in one YAML file, streamlining orchestration and replication.
@z

@x
- Efficient collaboration: Shareable YAML files support smooth collaboration between developers and operations, improving workflows and issue resolution, leading to increased overall efficiency.
@y
- Efficient collaboration: Shareable YAML files support smooth collaboration between developers and operations, improving workflows and issue resolution, leading to increased overall efficiency.
@z

@x
- Rapid application development: Compose caches the configuration used to create a container. When you restart a service that has not changed, Compose re-uses the existing containers. Re-using containers means that you can make changes to your environment very quickly.
@y
- Rapid application development: Compose caches the configuration used to create a container. When you restart a service that has not changed, Compose re-uses the existing containers. Re-using containers means that you can make changes to your environment very quickly.
@z

@x
- Portability across environments: Compose supports variables in the Compose file. You can use these variables to customize your composition for different environments, or different users.
@y
- Portability across environments: Compose supports variables in the Compose file. You can use these variables to customize your composition for different environments, or different users.
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
The [Compose file](/reference/compose-file/_index.md) provides a way to document and configure
all of the application's service dependencies (databases, queues, caches,
web service APIs, etc). Using the Compose command line tool you can create
and start one or more containers for each dependency with a single command
(`docker compose up`).
@y
The [Compose file](reference/compose-file/_index.md) provides a way to document and configure
all of the application's service dependencies (databases, queues, caches,
web service APIs, etc). Using the Compose command line tool you can create
and start one or more containers for each dependency with a single command
(`docker compose up`).
@z

@x
Together, these features provide a convenient way for you to get
started on a project. Compose can reduce a multi-page "developer getting
started guide" to a single machine-readable Compose file and a few commands.
@y
Together, these features provide a convenient way for you to get
started on a project. Compose can reduce a multi-page "developer getting
started guide" to a single machine-readable Compose file and a few commands.
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
and destroy isolated testing environments for your test suite. By defining the full environment in a [Compose file](/reference/compose-file/_index.md), you can create and destroy these environments in just a few commands:
@y
An important part of any Continuous Deployment or Continuous Integration process
is the automated test suite. Automated end-to-end testing requires an
environment in which to run tests. Compose provides a convenient way to create
and destroy isolated testing environments for your test suite. By defining the full environment in a [Compose file](reference/compose-file/_index.md), you can create and destroy these environments in just a few commands:
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
[Compose in production](/manuals/compose/how-tos/production.md).
@y
For details on using production-oriented features, see
[Compose in production](manuals/compose/how-tos/production.md).
@z

@x
## What's next?
@y
## What's next?
@z

@x
- [Learn about the history of Compose](history.md)
- [Understand how Compose works](compose-application-model.md)
- [Try the Quickstart guide](../gettingstarted.md)
@y
- [Learn about the history of Compose](history.md)
- [Understand how Compose works](compose-application-model.md)
- [Try the Quickstart guide](../gettingstarted.md)
@z
