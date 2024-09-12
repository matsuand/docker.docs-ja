%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Initialize the swarm
keywords: tutorial, cluster management, swarm mode, get started, docker engine
title: Create a swarm
weight: 10
notoc: true
---
@y
---
description: Initialize the swarm
keywords: tutorial, cluster management, swarm mode, get started, docker engine
title: Create a swarm
weight: 10
notoc: true
---
@z

@x
After you complete the [tutorial setup](index.md) steps, you're ready
to create a swarm. Make sure the Docker Engine daemon is started on the host
machines.
@y
After you complete the [tutorial setup](index.md) steps, you're ready
to create a swarm. Make sure the Docker Engine daemon is started on the host
machines.
@z

@x
1.  Open a terminal and ssh into the machine where you want to run your manager
    node. This tutorial uses a machine named `manager1`. 
@y
1.  Open a terminal and ssh into the machine where you want to run your manager
    node. This tutorial uses a machine named `manager1`. 
@z

@x
2.  Run the following command to create a new swarm:
@y
2.  Run the following command to create a new swarm:
@z

@x
    ```console
    $ docker swarm init --advertise-addr <MANAGER-IP>
    ```
@y
    ```console
    $ docker swarm init --advertise-addr <MANAGER-IP>
    ```
@z

@x
    In the tutorial, the following command creates a swarm on the `manager1`
    machine:
@y
    In the tutorial, the following command creates a swarm on the `manager1`
    machine:
@z

@x
    ```console
    $ docker swarm init --advertise-addr 192.168.99.100
    Swarm initialized: current node (dxn1zf6l61qsb1josjja83ngz) is now a manager.
@y
    ```console
    $ docker swarm init --advertise-addr 192.168.99.100
    Swarm initialized: current node (dxn1zf6l61qsb1josjja83ngz) is now a manager.
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
@y
        docker swarm join \
        --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
        192.168.99.100:2377
@z

@x
    To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
    ```
@y
    To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
    ```
@z

@x
    The `--advertise-addr` flag configures the manager node to publish its
    address as `192.168.99.100`. The other nodes in the swarm must be able
    to access the manager at the IP address.
@y
    The `--advertise-addr` flag configures the manager node to publish its
    address as `192.168.99.100`. The other nodes in the swarm must be able
    to access the manager at the IP address.
@z

@x
    The output includes the commands to join new nodes to the swarm. Nodes will
    join as managers or workers depending on the value for the `--token`
    flag.
@y
    The output includes the commands to join new nodes to the swarm. Nodes will
    join as managers or workers depending on the value for the `--token`
    flag.
@z

@x
3.  Run `docker info` to view the current state of the swarm:
@y
3.  Run `docker info` to view the current state of the swarm:
@z

@x
    ```console
    $ docker info
@y
    ```console
    $ docker info
@z

@x
    Containers: 2
    Running: 0
    Paused: 0
    Stopped: 2
      ...snip...
    Swarm: active
      NodeID: dxn1zf6l61qsb1josjja83ngz
      Is Manager: true
      Managers: 1
      Nodes: 1
      ...snip...
    ```
@y
    Containers: 2
    Running: 0
    Paused: 0
    Stopped: 2
      ...snip...
    Swarm: active
      NodeID: dxn1zf6l61qsb1josjja83ngz
      Is Manager: true
      Managers: 1
      Nodes: 1
      ...snip...
    ```
@z

@x
4.  Run the `docker node ls` command to view information about nodes:
@y
4.  Run the `docker node ls` command to view information about nodes:
@z

@x
    ```console
    $ docker node ls
@y
    ```console
    $ docker node ls
@z

@x
    ID                           HOSTNAME  STATUS  AVAILABILITY  MANAGER STATUS
    dxn1zf6l61qsb1josjja83ngz *  manager1  Ready   Active        Leader
@y
    ID                           HOSTNAME  STATUS  AVAILABILITY  MANAGER STATUS
    dxn1zf6l61qsb1josjja83ngz *  manager1  Ready   Active        Leader
@z

@x
    ```
@y
    ```
@z

@x
    The `*` next to the node ID indicates that you're currently connected on
    this node.
@y
    The `*` next to the node ID indicates that you're currently connected on
    this node.
@z

@x
    Docker Engine Swarm mode automatically names the node with the machine host
    name. The tutorial covers other columns in later steps.
@y
    Docker Engine Swarm mode automatically names the node with the machine host
    name. The tutorial covers other columns in later steps.
@z

@x
## Next steps
@y
## Next steps
@z

@x
Next, you'll add two more nodes to the cluster. 
@y
Next, you'll add two more nodes to the cluster. 
@z

@x
{{< button text="Add two more nodes" url="add-nodes.md" >}}
@y
{{< button text="Add two more nodes" url="add-nodes.md" >}}
@z
