%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Docker Engine Swarm mode overview
keywords: docker, container, cluster, swarm, docker engine
title: Swarm mode
@y
description: Docker Engine Swarm mode overview
keywords: docker, container, cluster, swarm, docker engine
title: Swarm mode
@z

@x
{{< include "swarm-mode.md" >}}
@y
{{< include "swarm-mode.md" >}}
@z

@x
Current versions of Docker include Swarm mode for natively managing a cluster
of Docker Engines called a swarm. Use the Docker CLI to create a swarm, deploy
application services to a swarm, and manage swarm behavior.
@y
Current versions of Docker include Swarm mode for natively managing a cluster
of Docker Engines called a swarm. Use the Docker CLI to create a swarm, deploy
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
### Cluster management integrated with Docker Engine
@y
### Cluster management integrated with Docker Engine
@z

@x
Use the Docker Engine CLI to create a swarm of Docker Engines where you can deploy application
services. You don't need additional orchestration software to create or manage
a swarm.
@y
Use the Docker Engine CLI to create a swarm of Docker Engines where you can deploy application
services. You don't need additional orchestration software to create or manage
a swarm.
@z

@x
### Decentralized design
@y
### Decentralized design
@z

@x
Instead of handling differentiation between node roles at deployment time, the Docker Engine handles any specialization at runtime. You can deploy both kinds of nodes, managers and workers, using the
Docker Engine. This means you can build an entire swarm from a single disk
image.
@y
Instead of handling differentiation between node roles at deployment time, the Docker Engine handles any specialization at runtime. You can deploy both kinds of nodes, managers and workers, using the
Docker Engine. This means you can build an entire swarm from a single disk
image.
@z

@x
### Declarative service model
@y
### Declarative service model
@z

@x
Docker Engine uses a declarative approach to
let you define the desired state of the various services in your application
stack. For example, you might describe an application comprised of a web front
end service with message queueing services and a database backend.
@y
Docker Engine uses a declarative approach to
let you define the desired state of the various services in your application
stack. For example, you might describe an application comprised of a web front
end service with message queueing services and a database backend.
@z

@x
### Scaling 
@y
### Scaling 
@z

@x
For each service, you can declare the number of tasks you want to
run. When you scale up or down, the swarm manager automatically adapts by
adding or removing tasks to maintain the desired state.
@y
For each service, you can declare the number of tasks you want to
run. When you scale up or down, the swarm manager automatically adapts by
adding or removing tasks to maintain the desired state.
@z

@x
### Desired state reconciliation
@y
### Desired state reconciliation
@z

@x
The swarm manager node constantly monitors
the cluster state and reconciles any differences between the actual state and your
expressed desired state. For example, if you set up a service to run 10
replicas of a container, and a worker machine hosting two of those replicas
crashes, the manager creates two new replicas to replace the replicas that
crashed. The swarm manager assigns the new replicas to workers that are
running and available.
@y
The swarm manager node constantly monitors
the cluster state and reconciles any differences between the actual state and your
expressed desired state. For example, if you set up a service to run 10
replicas of a container, and a worker machine hosting two of those replicas
crashes, the manager creates two new replicas to replace the replicas that
crashed. The swarm manager assigns the new replicas to workers that are
running and available.
@z

@x
### Multi-host networking
@y
### Multi-host networking
@z

@x
You can specify an overlay network for your
services. The swarm manager automatically assigns addresses to the containers
on the overlay network when it initializes or updates the application.
@y
You can specify an overlay network for your
services. The swarm manager automatically assigns addresses to the containers
on the overlay network when it initializes or updates the application.
@z

@x
### Service discovery
@y
### Service discovery
@z

@x
Swarm manager nodes assign each service in the swarm a
unique DNS name and load balance running containers. You can query every
container running in the swarm through a DNS server embedded in the swarm.
@y
Swarm manager nodes assign each service in the swarm a
unique DNS name and load balance running containers. You can query every
container running in the swarm through a DNS server embedded in the swarm.
@z

@x
### Load balancing
@y
### Load balancing
@z

@x
You can expose the ports for services to an
external load balancer. Internally, the swarm lets you specify how to distribute
service containers between nodes.
@y
You can expose the ports for services to an
external load balancer. Internally, the swarm lets you specify how to distribute
service containers between nodes.
@z

@x
### Secure by default
@y
### Secure by default
@z

@x
Each node in the swarm enforces TLS mutual
authentication and encryption to secure communications between itself and all
other nodes. You have the option to use self-signed root certificates or
certificates from a custom root CA.
@y
Each node in the swarm enforces TLS mutual
authentication and encryption to secure communications between itself and all
other nodes. You have the option to use self-signed root certificates or
certificates from a custom root CA.
@z

@x
### Rolling updates
@y
### Rolling updates
@z

@x
At rollout time you can apply service updates to nodes
incrementally. The swarm manager lets you control the delay between service
deployment to different sets of nodes. If anything goes wrong, you can
roll back to a previous version of the service.
@y
At rollout time you can apply service updates to nodes
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
* Learn Swarm mode [key concepts](key-concepts.md).
* Get started with the [Swarm mode tutorial](swarm-tutorial/index.md).
* Explore Swarm mode CLI commands
  * [swarm init](/reference/cli/docker/swarm/init.md)
  * [swarm join](/reference/cli/docker/swarm/join.md)
  * [service create](/reference/cli/docker/service/create.md)
  * [service inspect](/reference/cli/docker/service/inspect.md)
  * [service ls](/reference/cli/docker/service/ls.md)
  * [service rm](/reference/cli/docker/service/rm.md)
  * [service scale](/reference/cli/docker/service/scale.md)
  * [service ps](/reference/cli/docker/service/ps.md)
  * [service update](/reference/cli/docker/service/update.md)
@y
* Learn Swarm mode [key concepts](key-concepts.md).
* Get started with the [Swarm mode tutorial](swarm-tutorial/index.md).
* Explore Swarm mode CLI commands
  * [swarm init](reference/cli/docker/swarm/init.md)
  * [swarm join](reference/cli/docker/swarm/join.md)
  * [service create](reference/cli/docker/service/create.md)
  * [service inspect](reference/cli/docker/service/inspect.md)
  * [service ls](reference/cli/docker/service/ls.md)
  * [service rm](reference/cli/docker/service/rm.md)
  * [service scale](reference/cli/docker/service/scale.md)
  * [service ps](reference/cli/docker/service/ps.md)
  * [service update](reference/cli/docker/service/update.md)
@z
