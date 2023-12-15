%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Add nodes to the swarm
keywords: tutorial, cluster management, swarm, get started
title: Add nodes to the swarm
notoc: true
---
@y
---
description: Add nodes to the swarm
keywords: tutorial, cluster management, swarm, get started
title: Add nodes to the swarm
notoc: true
---
@z

@x
Once you've [created a swarm](create-swarm.md) with a manager node, you're ready
to add worker nodes.
@y
Once you've [created a swarm](create-swarm.md) with a manager node, you're ready
to add worker nodes.
@z

@x
1.  Open a terminal and ssh into the machine where you want to run a worker node.
    This tutorial uses the name `worker1`.
@y
1.  Open a terminal and ssh into the machine where you want to run a worker node.
    This tutorial uses the name `worker1`.
@z

@x
2.  Run the command produced by the `docker swarm init` output from the
    [Create a swarm](create-swarm.md) tutorial step to create a worker node
    joined to the existing swarm:
@y
2.  Run the command produced by the `docker swarm init` output from the
    [Create a swarm](create-swarm.md) tutorial step to create a worker node
    joined to the existing swarm:
@z

@x
    ```console
    $ docker swarm join \
      --token  SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
      192.168.99.100:2377
@y
    ```console
    $ docker swarm join \
      --token  SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
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
    If you don't have the command available, you can run the following command
    on a manager node to retrieve the join command for a worker:
@y
    If you don't have the command available, you can run the following command
    on a manager node to retrieve the join command for a worker:
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
3.  Open a terminal and ssh into the machine where you want to run a second
    worker node. This tutorial uses the name `worker2`.
@y
3.  Open a terminal and ssh into the machine where you want to run a second
    worker node. This tutorial uses the name `worker2`.
@z

@x
4.  Run the command produced by the `docker swarm init` output from the
    [Create a swarm](create-swarm.md) tutorial step to create a second worker
    node joined to the existing swarm:
@y
4.  Run the command produced by the `docker swarm init` output from the
    [Create a swarm](create-swarm.md) tutorial step to create a second worker
    node joined to the existing swarm:
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
5.  Open a terminal and ssh into the machine where the manager node runs and
    run the `docker node ls` command to see the worker nodes:
@y
5.  Open a terminal and ssh into the machine where the manager node runs and
    run the `docker node ls` command to see the worker nodes:
@z

@x
    ```console
    $ docker node ls
    ID                           HOSTNAME  STATUS  AVAILABILITY  MANAGER STATUS
    03g1y59jwfg7cf99w4lt0f662    worker2   Ready   Active
    9j68exjopxe7wfl6yuxml7a7j    worker1   Ready   Active
    dxn1zf6l61qsb1josjja83ngz *  manager1  Ready   Active        Leader
    ```
@y
    ```console
    $ docker node ls
    ID                           HOSTNAME  STATUS  AVAILABILITY  MANAGER STATUS
    03g1y59jwfg7cf99w4lt0f662    worker2   Ready   Active
    9j68exjopxe7wfl6yuxml7a7j    worker1   Ready   Active
    dxn1zf6l61qsb1josjja83ngz *  manager1  Ready   Active        Leader
    ```
@z

@x
    The `MANAGER` column identifies the manager nodes in the swarm. The empty
    status in this column for `worker1` and `worker2` identifies them as worker nodes.
@y
    The `MANAGER` column identifies the manager nodes in the swarm. The empty
    status in this column for `worker1` and `worker2` identifies them as worker nodes.
@z

@x
    Swarm management commands like `docker node ls` only work on manager nodes.
@y
    Swarm management commands like `docker node ls` only work on manager nodes.
@z

@x
## What's next?
@y
## What's next?
@z

@x
Now your swarm consists of a manager and two worker nodes. Next, you'll deploy a service.
@y
Now your swarm consists of a manager and two worker nodes. Next, you'll deploy a service.
@z

@x
{{< button text="Deploy a service" url="deploy-service.md" >}}
@y
{{< button text="Deploy a service" url="deploy-service.md" >}}
@z
