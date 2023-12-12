%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Engine swarm mode overview
keywords: docker, container, cluster, swarm
title: Swarm mode overview
aliases:
- /api/swarm-api/
- /engine/userguide/networking/overlay-standalone-swarm/
- /network/overlay-standalone.swarm/
- /release-notes/docker-swarm/
- /swarm/
- /swarm/api/
- /swarm/configure-tls/
- /swarm/discovery/
- /swarm/get-swarm/
- /swarm/install-manual/
- /swarm/install-w-machine/
- /swarm/multi-host-networking/
- /swarm/multi-manager-setup/
- /swarm/networking/
- /swarm/overview/
- /swarm/plan-for-production/
- /swarm/provision-with-machine/
- /swarm/reference/
- /swarm/reference/create/
- /swarm/reference/help/
- /swarm/reference/join/
- /swarm/reference/list/
- /swarm/reference/manage/
- /swarm/reference/swarm/
- /swarm/release-notes/
- /swarm/scheduler/
- /swarm/scheduler/filter/
- /swarm/scheduler/rescheduling/
- /swarm/scheduler/strategy/
- /swarm/secure-swarm-tls/
- /swarm/status-code-comparison-to-docker/
- /swarm/swarm-api/
- /swarm/swarm_at_scale/
- /swarm/swarm_at_scale/02-deploy-infra/
- /swarm/swarm_at_scale/03-create-cluster/
- /swarm/swarm_at_scale/04-deploy-app/
- /swarm/swarm_at_scale/about/
- /swarm/swarm_at_scale/deploy-app/
- /swarm/swarm_at_scale/deploy-infra/
- /swarm/swarm_at_scale/troubleshoot/
---
@y
---
description: Docker Engine swarm mode overview
keywords: docker, container, cluster, swarm
title: Swarm mode overview
aliases:
- /api/swarm-api/
- /engine/userguide/networking/overlay-standalone-swarm/
- /network/overlay-standalone.swarm/
- /release-notes/docker-swarm/
- /swarm/
- /swarm/api/
- /swarm/configure-tls/
- /swarm/discovery/
- /swarm/get-swarm/
- /swarm/install-manual/
- /swarm/install-w-machine/
- /swarm/multi-host-networking/
- /swarm/multi-manager-setup/
- /swarm/networking/
- /swarm/overview/
- /swarm/plan-for-production/
- /swarm/provision-with-machine/
- /swarm/reference/
- /swarm/reference/create/
- /swarm/reference/help/
- /swarm/reference/join/
- /swarm/reference/list/
- /swarm/reference/manage/
- /swarm/reference/swarm/
- /swarm/release-notes/
- /swarm/scheduler/
- /swarm/scheduler/filter/
- /swarm/scheduler/rescheduling/
- /swarm/scheduler/strategy/
- /swarm/secure-swarm-tls/
- /swarm/status-code-comparison-to-docker/
- /swarm/swarm-api/
- /swarm/swarm_at_scale/
- /swarm/swarm_at_scale/02-deploy-infra/
- /swarm/swarm_at_scale/03-create-cluster/
- /swarm/swarm_at_scale/04-deploy-app/
- /swarm/swarm_at_scale/about/
- /swarm/swarm_at_scale/deploy-app/
- /swarm/swarm_at_scale/deploy-infra/
- /swarm/swarm_at_scale/troubleshoot/
---
@z

@x
{{< include "swarm-mode.md" >}}
@y
{{< include "swarm-mode.md" >}}
@z

@x
To use Docker in swarm mode, install Docker. See
[installation instructions](../../get-docker.md) for all operating systems and platforms.
@y
To use Docker in swarm mode, install Docker. See
[installation instructions](../../get-docker.md) for all operating systems and platforms.
@z

@x
Current versions of Docker include *swarm mode* for natively managing a cluster
of Docker Engines called a *swarm*. Use the Docker CLI to create a swarm, deploy
application services to a swarm, and manage swarm behavior.
@y
Current versions of Docker include *swarm mode* for natively managing a cluster
of Docker Engines called a *swarm*. Use the Docker CLI to create a swarm, deploy
application services to a swarm, and manage swarm behavior.
@z

@x
Docker Swarm mode is built into the Docker Engine. Do not confuse Docker Swarm mode
with [Docker Classic Swarm](https://github.com/docker/classicswarm)
which is no longer actively developed.
@y
Docker Swarm mode is built into the Docker Engine. Do not confuse Docker Swarm mode
with [Docker Classic Swarm](https://github.com/docker/classicswarm)
which is no longer actively developed.
@z

@x
## Feature highlights
@y
## Feature highlights
@z

@x
* **Cluster management integrated with Docker Engine:** Use the Docker Engine
CLI to create a swarm of Docker Engines where you can deploy application
services. You don't need additional orchestration software to create or manage
a swarm.
@y
* **Cluster management integrated with Docker Engine:** Use the Docker Engine
CLI to create a swarm of Docker Engines where you can deploy application
services. You don't need additional orchestration software to create or manage
a swarm.
@z

@x
* **Decentralized design:** Instead of handling differentiation between node
roles at deployment time, the Docker Engine handles any specialization at
runtime. You can deploy both kinds of nodes, managers and workers, using the
Docker Engine. This means you can build an entire swarm from a single disk
image.
@y
* **Decentralized design:** Instead of handling differentiation between node
roles at deployment time, the Docker Engine handles any specialization at
runtime. You can deploy both kinds of nodes, managers and workers, using the
Docker Engine. This means you can build an entire swarm from a single disk
image.
@z

@x
* **Declarative service model:** Docker Engine uses a declarative approach to
let you define the desired state of the various services in your application
stack. For example, you might describe an application comprised of a web front
end service with message queueing services and a database backend.
@y
* **Declarative service model:** Docker Engine uses a declarative approach to
let you define the desired state of the various services in your application
stack. For example, you might describe an application comprised of a web front
end service with message queueing services and a database backend.
@z

@x
* **Scaling:** For each service, you can declare the number of tasks you want to
run. When you scale up or down, the swarm manager automatically adapts by
adding or removing tasks to maintain the desired state.
@y
* **Scaling:** For each service, you can declare the number of tasks you want to
run. When you scale up or down, the swarm manager automatically adapts by
adding or removing tasks to maintain the desired state.
@z

@x
* **Desired state reconciliation:** The swarm manager node constantly monitors
the cluster state and reconciles any differences between the actual state and your
expressed desired state. For example, if you set up a service to run 10
replicas of a container, and a worker machine hosting two of those replicas
crashes, the manager creates two new replicas to replace the replicas that
crashed. The swarm manager assigns the new replicas to workers that are
running and available.
@y
* **Desired state reconciliation:** The swarm manager node constantly monitors
the cluster state and reconciles any differences between the actual state and your
expressed desired state. For example, if you set up a service to run 10
replicas of a container, and a worker machine hosting two of those replicas
crashes, the manager creates two new replicas to replace the replicas that
crashed. The swarm manager assigns the new replicas to workers that are
running and available.
@z

@x
* **Multi-host networking:** You can specify an overlay network for your
services. The swarm manager automatically assigns addresses to the containers
on the overlay network when it initializes or updates the application.
@y
* **Multi-host networking:** You can specify an overlay network for your
services. The swarm manager automatically assigns addresses to the containers
on the overlay network when it initializes or updates the application.
@z

@x
* **Service discovery:** Swarm manager nodes assign each service in the swarm a
unique DNS name and load balance running containers. You can query every
container running in the swarm through a DNS server embedded in the swarm.
@y
* **Service discovery:** Swarm manager nodes assign each service in the swarm a
unique DNS name and load balance running containers. You can query every
container running in the swarm through a DNS server embedded in the swarm.
@z

@x
* **Load balancing:** You can expose the ports for services to an
external load balancer. Internally, the swarm lets you specify how to distribute
service containers between nodes.
@y
* **Load balancing:** You can expose the ports for services to an
external load balancer. Internally, the swarm lets you specify how to distribute
service containers between nodes.
@z

@x
* **Secure by default:** Each node in the swarm enforces TLS mutual
authentication and encryption to secure communications between itself and all
other nodes. You have the option to use self-signed root certificates or
certificates from a custom root CA.
@y
* **Secure by default:** Each node in the swarm enforces TLS mutual
authentication and encryption to secure communications between itself and all
other nodes. You have the option to use self-signed root certificates or
certificates from a custom root CA.
@z

@x
* **Rolling updates:** At rollout time you can apply service updates to nodes
incrementally. The swarm manager lets you control the delay between service
deployment to different sets of nodes. If anything goes wrong, you can
roll back to a previous version of the service.
@y
* **Rolling updates:** At rollout time you can apply service updates to nodes
incrementally. The swarm manager lets you control the delay between service
deployment to different sets of nodes. If anything goes wrong, you can
roll back to a previous version of the service.
@z

@x
## What's next?
@y
## What's next?
@z

@x
### Swarm mode key concepts and tutorial
@y
### Swarm mode key concepts and tutorial
@z

@x
* Learn swarm mode [key concepts](key-concepts.md).
@y
* Learn swarm mode [key concepts](key-concepts.md).
@z

@x
* Get started with the [Swarm mode tutorial](swarm-tutorial/index.md).
@y
* Get started with the [Swarm mode tutorial](swarm-tutorial/index.md).
@z

@x
### Swarm mode CLI commands
@y
### Swarm mode CLI commands
@z

@x
Explore swarm mode CLI commands
@y
Explore swarm mode CLI commands
@z

@x
* [swarm init](../reference/commandline/swarm_init.md)
* [swarm join](../reference/commandline/swarm_join.md)
* [service create](../reference/commandline/service_create.md)
* [service inspect](../reference/commandline/service_inspect.md)
* [service ls](../reference/commandline/service_ls.md)
* [service rm](../reference/commandline/service_rm.md)
* [service scale](../reference/commandline/service_scale.md)
* [service ps](../reference/commandline/service_ps.md)
* [service update](../reference/commandline/service_update.md)
@y
* [swarm init](../reference/commandline/swarm_init.md)
* [swarm join](../reference/commandline/swarm_join.md)
* [service create](../reference/commandline/service_create.md)
* [service inspect](../reference/commandline/service_inspect.md)
* [service ls](../reference/commandline/service_ls.md)
* [service rm](../reference/commandline/service_rm.md)
* [service scale](../reference/commandline/service_scale.md)
* [service ps](../reference/commandline/service_ps.md)
* [service update](../reference/commandline/service_update.md)
@z
