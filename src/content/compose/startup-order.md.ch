%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How to control service startup and shutdown order in Docker Compose
keywords: documentation, docs, docker, compose, startup, shutdown, order
title: Control startup and shutdown order in Compose
notoc: true
---
@y
---
description: How to control service startup and shutdown order in Docker Compose
keywords: documentation, docs, docker, compose, startup, shutdown, order
title: Control startup and shutdown order in Compose
notoc: true
---
@z

@x
{{< include "compose-eol.md" >}}
@y
{{< include "compose-eol.md" >}}
@z

@x
You can control the order of service startup and shutdown with the
[depends_on](compose-file/05-services.md#depends_on) attribute. Compose always starts and stops
containers in dependency order, where dependencies are determined by
`depends_on`, `links`, `volumes_from`, and `network_mode: "service:..."`.
@y
You can control the order of service startup and shutdown with the
[depends_on](compose-file/05-services.md#depends_on) attribute. Compose always starts and stops
containers in dependency order, where dependencies are determined by
`depends_on`, `links`, `volumes_from`, and `network_mode: "service:..."`.
@z

@x
A good example of when you might use this is an application which needs to access a database. If both services are started with `docker compose up`, there is a chance this will fail since the application service might start before the database service and won't find a database able to handle its SQL statements. 
@y
A good example of when you might use this is an application which needs to access a database. If both services are started with `docker compose up`, there is a chance this will fail since the application service might start before the database service and won't find a database able to handle its SQL statements. 
@z

@x
## Control startup
@y
## Control startup
@z

@x
On startup, Compose does not wait until a container is "ready", only until it's running. This can cause issues if, for example, you have a relational database system that needs to start its own services before being able to handle incoming connections.
@y
On startup, Compose does not wait until a container is "ready", only until it's running. This can cause issues if, for example, you have a relational database system that needs to start its own services before being able to handle incoming connections.
@z

@x
The solution for detecting the ready state of a service is  to use the `condition` attribute with one of the following options:
@y
The solution for detecting the ready state of a service is  to use the `condition` attribute with one of the following options:
@z

@x
- `service_started`
- `service_healthy`. This specifies that a dependency is expected to be “healthy”, which is defined with `healthcheck`, before starting a dependent service.
- `service_completed_successfully`. This specifies that a dependency is expected to run to successful completion before starting a dependent service.
@y
- `service_started`
- `service_healthy`. This specifies that a dependency is expected to be “healthy”, which is defined with `healthcheck`, before starting a dependent service.
- `service_completed_successfully`. This specifies that a dependency is expected to run to successful completion before starting a dependent service.
@z

@x
## Reference information 
@y
## Reference information 
@z

@x
- [`depends_on`](compose-file/05-services.md#depends_on)
- [`healthcheck`](compose-file/05-services.md#healthcheck)
@y
- [`depends_on`](compose-file/05-services.md#depends_on)
- [`healthcheck`](compose-file/05-services.md#healthcheck)
@z
