%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Scale the service running in the swarm
keywords: tutorial, cluster management, swarm mode, scale
title: Scale the service in the swarm
notoc: true
---
@y
---
description: Scale the service running in the swarm
keywords: tutorial, cluster management, swarm mode, scale
title: Scale the service in the swarm
notoc: true
---
@z

@x
Once you have [deployed a service](deploy-service.md) to a swarm, you are ready
to use the Docker CLI to scale the number of containers in
the service. Containers running in a service are called "tasks."
@y
Once you have [deployed a service](deploy-service.md) to a swarm, you are ready
to use the Docker CLI to scale the number of containers in
the service. Containers running in a service are called "tasks."
@z

@x
1.  If you haven't already, open a terminal and ssh into the machine where you
    run your manager node. For example, the tutorial uses a machine named
    `manager1`.
@y
1.  If you haven't already, open a terminal and ssh into the machine where you
    run your manager node. For example, the tutorial uses a machine named
    `manager1`.
@z

@x
2.  Run the following command to change the desired state of the
    service running in the swarm:
@y
2.  Run the following command to change the desired state of the
    service running in the swarm:
@z

@x
    ```console
    $ docker service scale <SERVICE-ID>=<NUMBER-OF-TASKS>
    ```
@y
    ```console
    $ docker service scale <SERVICE-ID>=<NUMBER-OF-TASKS>
    ```
@z

@x
    For example:
@y
    For example:
@z

@x
    ```console
    $ docker service scale helloworld=5
@y
    ```console
    $ docker service scale helloworld=5
@z

@x
    helloworld scaled to 5
    ```
@y
    helloworld scaled to 5
    ```
@z

@x
3.  Run `docker service ps <SERVICE-ID>` to see the updated task list:
@y
3.  Run `docker service ps <SERVICE-ID>` to see the updated task list:
@z

@x
    ```console
    $ docker service ps helloworld
@y
    ```console
    $ docker service ps helloworld
@z

@x
    NAME                                    IMAGE   NODE      DESIRED STATE  CURRENT STATE
    helloworld.1.8p1vev3fq5zm0mi8g0as41w35  alpine  worker2   Running        Running 7 minutes
    helloworld.2.c7a7tcdq5s0uk3qr88mf8xco6  alpine  worker1   Running        Running 24 seconds
    helloworld.3.6crl09vdcalvtfehfh69ogfb1  alpine  worker1   Running        Running 24 seconds
    helloworld.4.auky6trawmdlcne8ad8phb0f1  alpine  manager1  Running        Running 24 seconds
    helloworld.5.ba19kca06l18zujfwxyc5lkyn  alpine  worker2   Running        Running 24 seconds
    ```
@y
    NAME                                    IMAGE   NODE      DESIRED STATE  CURRENT STATE
    helloworld.1.8p1vev3fq5zm0mi8g0as41w35  alpine  worker2   Running        Running 7 minutes
    helloworld.2.c7a7tcdq5s0uk3qr88mf8xco6  alpine  worker1   Running        Running 24 seconds
    helloworld.3.6crl09vdcalvtfehfh69ogfb1  alpine  worker1   Running        Running 24 seconds
    helloworld.4.auky6trawmdlcne8ad8phb0f1  alpine  manager1  Running        Running 24 seconds
    helloworld.5.ba19kca06l18zujfwxyc5lkyn  alpine  worker2   Running        Running 24 seconds
    ```
@z

@x
    You can see that swarm has created 4 new tasks to scale to a total of 5
    running instances of Alpine Linux. The tasks are distributed between the
    three nodes of the swarm. One is running on `manager1`.
@y
    You can see that swarm has created 4 new tasks to scale to a total of 5
    running instances of Alpine Linux. The tasks are distributed between the
    three nodes of the swarm. One is running on `manager1`.
@z

@x
4.  Run `docker ps` to see the containers running on the node where you're
    connected. The following example shows the tasks running on `manager1`:
@y
4.  Run `docker ps` to see the containers running on the node where you're
    connected. The following example shows the tasks running on `manager1`:
@z

@x
    ```console
    $ docker ps
@y
    ```console
    $ docker ps
@z

@x
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    528d68040f95        alpine:latest       "ping docker.com"   About a minute ago   Up About a minute                       helloworld.4.auky6trawmdlcne8ad8phb0f1
    ```
@y
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    528d68040f95        alpine:latest       "ping docker.com"   About a minute ago   Up About a minute                       helloworld.4.auky6trawmdlcne8ad8phb0f1
    ```
@z

@x
    If you want to see the containers running on other nodes, ssh into
    those nodes and run the `docker ps` command.
@y
    If you want to see the containers running on other nodes, ssh into
    those nodes and run the `docker ps` command.
@z

@x
## What's next?
@y
## What's next?
@z

@x
At this point in the tutorial, you're finished with the `helloworld` service.
The next step shows how to [delete the service](delete-service.md).
@y
At this point in the tutorial, you're finished with the `helloworld` service.
The next step shows how to [delete the service](delete-service.md).
@z
