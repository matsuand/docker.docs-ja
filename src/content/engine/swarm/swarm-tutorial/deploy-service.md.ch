%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Deploy a service to the swarm
keywords: tutorial, cluster management, swarm mode, get started
title: Deploy a service to the swarm
notoc: true
---
@y
---
description: Deploy a service to the swarm
keywords: tutorial, cluster management, swarm mode, get started
title: Deploy a service to the swarm
notoc: true
---
@z

@x
After you [create a swarm](create-swarm.md), you can deploy a service to the
swarm. For this tutorial, you also [added worker nodes](add-nodes.md), but that
is not a requirement to deploy a service.
@y
After you [create a swarm](create-swarm.md), you can deploy a service to the
swarm. For this tutorial, you also [added worker nodes](add-nodes.md), but that
is not a requirement to deploy a service.
@z

@x
1.  Open a terminal and ssh into the machine where you run your manager node.
    For example, the tutorial uses a machine named `manager1`.
@y
1.  Open a terminal and ssh into the machine where you run your manager node.
    For example, the tutorial uses a machine named `manager1`.
@z

@x
2.  Run the following command:
@y
2.  Run the following command:
@z

@x
    ```console
    $ docker service create --replicas 1 --name helloworld alpine ping docker.com
@y
    ```console
    $ docker service create --replicas 1 --name helloworld alpine ping docker.com
@z

@x
    9uk4639qpg7npwf3fn2aasksr
    ```
@y
    9uk4639qpg7npwf3fn2aasksr
    ```
@z

@x
    * The `docker service create` command creates the service.
    * The `--name` flag names the service `helloworld`.
    * The `--replicas` flag specifies the desired state of 1 running instance.
    * The arguments `alpine ping docker.com` define the service as an Alpine
    Linux container that executes the command `ping docker.com`.
@y
    * The `docker service create` command creates the service.
    * The `--name` flag names the service `helloworld`.
    * The `--replicas` flag specifies the desired state of 1 running instance.
    * The arguments `alpine ping docker.com` define the service as an Alpine
    Linux container that executes the command `ping docker.com`.
@z

@x
3.  Run `docker service ls` to see the list of running services:
@y
3.  Run `docker service ls` to see the list of running services:
@z

@x
    ```console
    $ docker service ls
@y
    ```console
    $ docker service ls
@z

@x
    ID            NAME        SCALE  IMAGE   COMMAND
    9uk4639qpg7n  helloworld  1/1    alpine  ping docker.com
    ```
@y
    ID            NAME        SCALE  IMAGE   COMMAND
    9uk4639qpg7n  helloworld  1/1    alpine  ping docker.com
    ```
@z

@x
## Next steps
@y
## Next steps
@z

@x
Now you're ready to inspect the service.
@y
Now you're ready to inspect the service.
@z

@x
{{< button text="Inspect the service" url="inspect-service.md" >}}
@y
{{< button text="Inspect the service" url="inspect-service.md" >}}
@z
