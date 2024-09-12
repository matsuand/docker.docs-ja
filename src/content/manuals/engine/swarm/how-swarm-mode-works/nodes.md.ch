%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: How swarm nodes work
keywords: docker, container, cluster, swarm mode, node
title: How nodes work
@y
description: How swarm nodes work
keywords: docker, container, cluster, swarm mode, node
title: How nodes work
@z

@x
Swarm mode lets you create a
cluster of one or more Docker Engines called a swarm. A swarm consists
of one or more nodes: physical or virtual machines running Docker
Engine.
@y
Swarm mode lets you create a
cluster of one or more Docker Engines called a swarm. A swarm consists
of one or more nodes: physical or virtual machines running Docker
Engine.
@z

@x
There are two types of nodes: [managers](#manager-nodes) and
[workers](#worker-nodes).
@y
There are two types of nodes: [managers](#manager-nodes) and
[workers](#worker-nodes).
@z

@x
![Swarm mode cluster](/engine/swarm/images/swarm-diagram.webp)
@y
![Swarm mode cluster](__SUBDIR__/engine/swarm/images/swarm-diagram.webp)
@z

@x
If you haven't already, read through the
[Swarm mode overview](../index.md) and
[key concepts](../key-concepts.md).
@y
If you haven't already, read through the
[Swarm mode overview](../index.md) and
[key concepts](../key-concepts.md).
@z

@x
## Manager nodes
@y
## Manager nodes
@z

@x
Manager nodes handle cluster management tasks:
@y
Manager nodes handle cluster management tasks:
@z

@x
* Maintaining cluster state
* Scheduling services
* Serving Swarm mode [HTTP API endpoints](/reference/api/engine/_index.md)
@y
* Maintaining cluster state
* Scheduling services
* Serving Swarm mode [HTTP API endpoints](reference/api/engine/_index.md)
@z

@x
Using a [Raft](https://raft.github.io/raft.pdf) implementation, the managers
maintain a consistent internal state of the entire swarm and all the services
running on it. For testing purposes it is OK to run a swarm with a single
manager. If the manager in a single-manager swarm fails, your services
continue to run, but you need to create a new cluster to recover.
@y
Using a [Raft](https://raft.github.io/raft.pdf) implementation, the managers
maintain a consistent internal state of the entire swarm and all the services
running on it. For testing purposes it is OK to run a swarm with a single
manager. If the manager in a single-manager swarm fails, your services
continue to run, but you need to create a new cluster to recover.
@z

@x
To take advantage of Swarm mode's fault-tolerance features, we recommend
you implement an odd number of nodes according to your organization's
high-availability requirements. When you have multiple managers you can recover
from the failure of a manager node without downtime.
@y
To take advantage of Swarm mode's fault-tolerance features, we recommend
you implement an odd number of nodes according to your organization's
high-availability requirements. When you have multiple managers you can recover
from the failure of a manager node without downtime.
@z

@x
* A three-manager swarm tolerates a maximum loss of one manager.
* A five-manager swarm tolerates a maximum simultaneous loss of two
manager nodes.
* An odd number `N` of manager nodes in the cluster tolerates the loss of at most `(N-1)/2` managers.
Docker recommends a maximum of seven manager nodes for a swarm.
@y
* A three-manager swarm tolerates a maximum loss of one manager.
* A five-manager swarm tolerates a maximum simultaneous loss of two
manager nodes.
* An odd number `N` of manager nodes in the cluster tolerates the loss of at most `(N-1)/2` managers.
Docker recommends a maximum of seven manager nodes for a swarm.
@z

@x
    >**Important**
    >
    > Adding more managers does NOT mean increased
    > scalability or higher performance. In general, the opposite is true.
@y
    >**Important**
    >
    > Adding more managers does NOT mean increased
    > scalability or higher performance. In general, the opposite is true.
@z

@x
## Worker nodes
@y
## Worker nodes
@z

@x
Worker nodes are also instances of Docker Engine whose sole purpose is to
execute containers. Worker nodes don't participate in the Raft distributed
state, make scheduling decisions, or serve the swarm mode HTTP API.
@y
Worker nodes are also instances of Docker Engine whose sole purpose is to
execute containers. Worker nodes don't participate in the Raft distributed
state, make scheduling decisions, or serve the swarm mode HTTP API.
@z

@x
You can create a swarm of one manager node, but you cannot have a worker node
without at least one manager node. By default, all managers are also workers.
In a single manager node cluster, you can run commands like `docker service
create` and the scheduler places all tasks on the local engine.
@y
You can create a swarm of one manager node, but you cannot have a worker node
without at least one manager node. By default, all managers are also workers.
In a single manager node cluster, you can run commands like `docker service
create` and the scheduler places all tasks on the local engine.
@z

@x
To prevent the scheduler from placing tasks on a manager node in a multi-node
swarm, set the availability for the manager node to `Drain`. The scheduler
gracefully stops tasks on nodes in `Drain` mode and schedules the tasks on an
`Active` node. The scheduler does not assign new tasks to nodes with `Drain`
availability.
@y
To prevent the scheduler from placing tasks on a manager node in a multi-node
swarm, set the availability for the manager node to `Drain`. The scheduler
gracefully stops tasks on nodes in `Drain` mode and schedules the tasks on an
`Active` node. The scheduler does not assign new tasks to nodes with `Drain`
availability.
@z

@x
Refer to the [`docker node update`](/reference/cli/docker/node/update.md)
command line reference to see how to change node availability.
@y
Refer to the [`docker node update`](reference/cli/docker/node/update.md)
command line reference to see how to change node availability.
@z

@x
## Change roles
@y
## Change roles
@z

@x
You can promote a worker node to be a manager by running `docker node promote`.
For example, you may want to promote a worker node when you
take a manager node offline for maintenance. See [node promote](/reference/cli/docker/node/promote.md).
@y
You can promote a worker node to be a manager by running `docker node promote`.
For example, you may want to promote a worker node when you
take a manager node offline for maintenance. See [node promote](reference/cli/docker/node/promote.md).
@z

@x
You can also demote a manager node to a worker node. See
[node demote](/reference/cli/docker/node/demote.md).
@y
You can also demote a manager node to a worker node. See
[node demote](reference/cli/docker/node/demote.md).
@z

@x
## Learn more
@y
## Learn more
@z

@x
* Read about how Swarm mode [services](services.md) work.
* Learn how [PKI](pki.md) works in Swarm mode.
@y
* Read about how Swarm mode [services](services.md) work.
* Learn how [PKI](pki.md) works in Swarm mode.
@z
