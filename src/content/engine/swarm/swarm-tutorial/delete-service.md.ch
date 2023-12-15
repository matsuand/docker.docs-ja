%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Remove the service from the swarm
keywords: tutorial, cluster management, swarm, service, get started
title: Delete the service running on the swarm
notoc: true
---
@y
---
description: Remove the service from the swarm
keywords: tutorial, cluster management, swarm, service, get started
title: Delete the service running on the swarm
notoc: true
---
@z

@x
The remaining steps in the tutorial don't use the `helloworld` service, so now
you can delete the service from the swarm.
@y
The remaining steps in the tutorial don't use the `helloworld` service, so now
you can delete the service from the swarm.
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
2.  Run `docker service rm helloworld` to remove the `helloworld` service.
@y
2.  Run `docker service rm helloworld` to remove the `helloworld` service.
@z

@x
    ```console
    $ docker service rm helloworld
@y
    ```console
    $ docker service rm helloworld
@z

@x
    helloworld
    ```
@y
    helloworld
    ```
@z

@x
3.  Run `docker service inspect <SERVICE-ID>` to verify that the swarm manager
    removed the service. The CLI returns a message that the service is not
    found:
@y
3.  Run `docker service inspect <SERVICE-ID>` to verify that the swarm manager
    removed the service. The CLI returns a message that the service is not
    found:
@z

@x
    ```console
    $ docker service inspect helloworld
    []
    Status: Error: no such service: helloworld, Code: 1
    ```
@y
    ```console
    $ docker service inspect helloworld
    []
    Status: Error: no such service: helloworld, Code: 1
    ```
@z

@x
4.  Even though the service no longer exists, the task containers take a few
    seconds to clean up. You can use `docker ps` on the nodes to verify when the
    tasks have been removed.
@y
4.  Even though the service no longer exists, the task containers take a few
    seconds to clean up. You can use `docker ps` on the nodes to verify when the
    tasks have been removed.
@z

@x
    ```console
    $ docker ps
@y
    ```console
    $ docker ps
@z

@x
    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS     NAMES
    db1651f50347        alpine:latest       "ping docker.com"        44 minutes ago      Up 46 seconds                 helloworld.5.9lkmos2beppihw95vdwxy1j3w
    43bf6e532a92        alpine:latest       "ping docker.com"        44 minutes ago      Up 46 seconds                 helloworld.3.a71i8rp6fua79ad43ycocl4t2
    5a0fb65d8fa7        alpine:latest       "ping docker.com"        44 minutes ago      Up 45 seconds                 helloworld.2.2jpgensh7d935qdc857pxulfr
    afb0ba67076f        alpine:latest       "ping docker.com"        44 minutes ago      Up 46 seconds                 helloworld.4.1c47o7tluz7drve4vkm2m5olx
    688172d3bfaa        alpine:latest       "ping docker.com"        45 minutes ago      Up About a minute             helloworld.1.74nbhb3fhud8jfrhigd7s29we
@y
    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS     NAMES
    db1651f50347        alpine:latest       "ping docker.com"        44 minutes ago      Up 46 seconds                 helloworld.5.9lkmos2beppihw95vdwxy1j3w
    43bf6e532a92        alpine:latest       "ping docker.com"        44 minutes ago      Up 46 seconds                 helloworld.3.a71i8rp6fua79ad43ycocl4t2
    5a0fb65d8fa7        alpine:latest       "ping docker.com"        44 minutes ago      Up 45 seconds                 helloworld.2.2jpgensh7d935qdc857pxulfr
    afb0ba67076f        alpine:latest       "ping docker.com"        44 minutes ago      Up 46 seconds                 helloworld.4.1c47o7tluz7drve4vkm2m5olx
    688172d3bfaa        alpine:latest       "ping docker.com"        45 minutes ago      Up About a minute             helloworld.1.74nbhb3fhud8jfrhigd7s29we
@z

@x
    $ docker ps
    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS     NAMES
@y
    $ docker ps
    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS     NAMES
@z

@x
    ```
@y
    ```
@z

@x
## Next steps
@y
## Next steps
@z

@x
Next, you'll set up a new service and apply a rolling update.
@y
Next, you'll set up a new service and apply a rolling update.
@z

@x
{{< button text="Apply rolling updates" url="rolling-update.md" >}}
@y
{{< button text="Apply rolling updates" url="rolling-update.md" >}}
@z
