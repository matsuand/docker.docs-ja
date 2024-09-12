%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Add worker and manager nodes to a swarm
keywords: guide, swarm mode, node
title: Join nodes to a swarm
@y
description: Add worker and manager nodes to a swarm
keywords: guide, swarm mode, node
title: Join nodes to a swarm
@z

@x
When you first create a swarm, you place a single Docker Engine into
Swarm mode. To take full advantage of Swarm mode you can add nodes to the swarm:
@y
When you first create a swarm, you place a single Docker Engine into
Swarm mode. To take full advantage of Swarm mode you can add nodes to the swarm:
@z

@x
* Adding worker nodes increases capacity. When you deploy a service to a swarm,
the engine schedules tasks on available nodes whether they are worker nodes or
manager nodes. When you add workers to your swarm, you increase the scale of
the swarm to handle tasks without affecting the manager raft consensus.
* Manager nodes increase fault-tolerance. Manager nodes perform the
orchestration and cluster management functions for the swarm. Among manager
nodes, a single leader node conducts orchestration tasks. If a leader node
goes down, the remaining manager nodes elect a new leader and resume
orchestration and maintenance of the swarm state. By default, manager nodes
also run tasks.
@y
* Adding worker nodes increases capacity. When you deploy a service to a swarm,
the engine schedules tasks on available nodes whether they are worker nodes or
manager nodes. When you add workers to your swarm, you increase the scale of
the swarm to handle tasks without affecting the manager raft consensus.
* Manager nodes increase fault-tolerance. Manager nodes perform the
orchestration and cluster management functions for the swarm. Among manager
nodes, a single leader node conducts orchestration tasks. If a leader node
goes down, the remaining manager nodes elect a new leader and resume
orchestration and maintenance of the swarm state. By default, manager nodes
also run tasks.
@z

@x
Docker Engine joins the swarm depending on the **join-token** you provide to
the `docker swarm join` command. The node only uses the token at join time. If
you subsequently rotate the token, it doesn't affect existing swarm nodes. Refer
to [Run Docker Engine in swarm mode](swarm-mode.md#view-the-join-command-or-update-a-swarm-join-token).
@y
Docker Engine joins the swarm depending on the **join-token** you provide to
the `docker swarm join` command. The node only uses the token at join time. If
you subsequently rotate the token, it doesn't affect existing swarm nodes. Refer
to [Run Docker Engine in swarm mode](swarm-mode.md#view-the-join-command-or-update-a-swarm-join-token).
@z

@x
## Join as a worker node
@y
## Join as a worker node
@z

@x
To retrieve the join command including the join token for worker nodes, run the
following command on a manager node:
@y
To retrieve the join command including the join token for worker nodes, run the
following command on a manager node:
@z

@x
```console
$ docker swarm join-token worker
@y
```console
$ docker swarm join-token worker
@z

@x
To add a worker to this swarm, run the following command:
@y
To add a worker to this swarm, run the following command:
@z

@x
    docker swarm join \
    --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
    192.168.99.100:2377
```
@y
    docker swarm join \
    --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
    192.168.99.100:2377
```
@z

@x
Run the command from the output on the worker to join the swarm:
@y
Run the command from the output on the worker to join the swarm:
@z

@x
```console
$ docker swarm join \
  --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
  192.168.99.100:2377
@y
```console
$ docker swarm join \
  --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
  192.168.99.100:2377
@z

@x
This node joined a swarm as a worker.
```
@y
This node joined a swarm as a worker.
```
@z

@x
The `docker swarm join` command does the following:
@y
The `docker swarm join` command does the following:
@z

@x
* Switches Docker Engine on the current node into Swarm mode.
* Requests a TLS certificate from the manager.
* Names the node with the machine hostname.
* Joins the current node to the swarm at the manager listen address based upon the swarm token.
* Sets the current node to `Active` availability, meaning it can receive tasks
from the scheduler.
* Extends the `ingress` overlay network to the current node.
@y
* Switches Docker Engine on the current node into Swarm mode.
* Requests a TLS certificate from the manager.
* Names the node with the machine hostname.
* Joins the current node to the swarm at the manager listen address based upon the swarm token.
* Sets the current node to `Active` availability, meaning it can receive tasks
from the scheduler.
* Extends the `ingress` overlay network to the current node.
@z

@x
## Join as a manager node
@y
## Join as a manager node
@z

@x
When you run `docker swarm join` and pass the manager token, Docker Engine
switches into Swarm mode the same as for workers. Manager nodes also participate
in the raft consensus. The new nodes should be `Reachable`, but the existing
manager remains the swarm `Leader`.
@y
When you run `docker swarm join` and pass the manager token, Docker Engine
switches into Swarm mode the same as for workers. Manager nodes also participate
in the raft consensus. The new nodes should be `Reachable`, but the existing
manager remains the swarm `Leader`.
@z

@x
Docker recommends three or five manager nodes per cluster to implement high
availability. Because Swarm-mode manager nodes share data using Raft, there
must be an odd number of managers. The swarm can continue to function after as
long as a quorum of more than half of the manager nodes are available.
@y
Docker recommends three or five manager nodes per cluster to implement high
availability. Because Swarm-mode manager nodes share data using Raft, there
must be an odd number of managers. The swarm can continue to function after as
long as a quorum of more than half of the manager nodes are available.
@z

@x
For more detail about swarm managers and administering a swarm, see
[Administer and maintain a swarm of Docker Engines](admin_guide.md).
@y
For more detail about swarm managers and administering a swarm, see
[Administer and maintain a swarm of Docker Engines](admin_guide.md).
@z

@x
To retrieve the join command including the join token for manager nodes, run the
following command on a manager node:
@y
To retrieve the join command including the join token for manager nodes, run the
following command on a manager node:
@z

@x
```console
$ docker swarm join-token manager
@y
```console
$ docker swarm join-token manager
@z

@x
To add a manager to this swarm, run the following command:
@y
To add a manager to this swarm, run the following command:
@z

@x
    docker swarm join \
    --token SWMTKN-1-61ztec5kyafptydic6jfc1i33t37flcl4nuipzcusor96k7kby-5vy9t8u35tuqm7vh67lrz9xp6 \
    192.168.99.100:2377
```
@y
    docker swarm join \
    --token SWMTKN-1-61ztec5kyafptydic6jfc1i33t37flcl4nuipzcusor96k7kby-5vy9t8u35tuqm7vh67lrz9xp6 \
    192.168.99.100:2377
```
@z

@x
Run the command from the output on the new manager node to join it to the swarm:
@y
Run the command from the output on the new manager node to join it to the swarm:
@z

@x
```console
$ docker swarm join \
  --token SWMTKN-1-61ztec5kyafptydic6jfc1i33t37flcl4nuipzcusor96k7kby-5vy9t8u35tuqm7vh67lrz9xp6 \
  192.168.99.100:2377
@y
```console
$ docker swarm join \
  --token SWMTKN-1-61ztec5kyafptydic6jfc1i33t37flcl4nuipzcusor96k7kby-5vy9t8u35tuqm7vh67lrz9xp6 \
  192.168.99.100:2377
@z

@x
This node joined a swarm as a manager.
```
@y
This node joined a swarm as a manager.
```
@z

@x
## Learn More
@y
## Learn More
@z

@x
* `swarm join` [command line reference](/reference/cli/docker/swarm/join.md)
* [Swarm mode tutorial](swarm-tutorial/index.md)
@y
* `swarm join` [command line reference](reference/cli/docker/swarm/join.md)
* [Swarm mode tutorial](swarm-tutorial/index.md)
@z
