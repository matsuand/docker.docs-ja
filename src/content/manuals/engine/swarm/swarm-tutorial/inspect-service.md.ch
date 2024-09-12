%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Inspect the application
keywords: tutorial, cluster management, swarm mode, get started
title: Inspect a service on the swarm
weight: 40
notoc: true
---
@y
---
description: Inspect the application
keywords: tutorial, cluster management, swarm mode, get started
title: Inspect a service on the swarm
weight: 40
notoc: true
---
@z

@x
When you have [deployed a service](deploy-service.md) to your swarm, you can use
the Docker CLI to see details about the service running in the swarm.
@y
When you have [deployed a service](deploy-service.md) to your swarm, you can use
the Docker CLI to see details about the service running in the swarm.
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
2.  Run `docker service inspect --pretty <SERVICE-ID>` to display the details
    about a service in an easily readable format.
@y
2.  Run `docker service inspect --pretty <SERVICE-ID>` to display the details
    about a service in an easily readable format.
@z

@x
    To see the details on the `helloworld` service:
@y
    To see the details on the `helloworld` service:
@z

@x
    ```console
    [manager1]$ docker service inspect --pretty helloworld
@y
    ```console
    [manager1]$ docker service inspect --pretty helloworld
@z

@x
    ID:		9uk4639qpg7npwf3fn2aasksr
    Name:		helloworld
    Service Mode:	REPLICATED
     Replicas:		1
    Placement:
    UpdateConfig:
     Parallelism:	1
    ContainerSpec:
     Image:		alpine
     Args:	ping docker.com
    Resources:
    Endpoint Mode:  vip
    ```
@y
    ID:		9uk4639qpg7npwf3fn2aasksr
    Name:		helloworld
    Service Mode:	REPLICATED
     Replicas:		1
    Placement:
    UpdateConfig:
     Parallelism:	1
    ContainerSpec:
     Image:		alpine
     Args:	ping docker.com
    Resources:
    Endpoint Mode:  vip
    ```
@z

@x
    >**Tip**
    >
    > To return the service details in json format, run the same command
    without the `--pretty` flag.
@y
    >**Tip**
    >
    > To return the service details in json format, run the same command
    without the `--pretty` flag.
@z

@x
    ```console
    [manager1]$ docker service inspect helloworld
    [
    {
        "ID": "9uk4639qpg7npwf3fn2aasksr",
        "Version": {
            "Index": 418
        },
        "CreatedAt": "2016-06-16T21:57:11.622222327Z",
        "UpdatedAt": "2016-06-16T21:57:11.622222327Z",
        "Spec": {
            "Name": "helloworld",
            "TaskTemplate": {
                "ContainerSpec": {
                    "Image": "alpine",
                    "Args": [
                        "ping",
                        "docker.com"
                    ]
                },
                "Resources": {
                    "Limits": {},
                    "Reservations": {}
                },
                "RestartPolicy": {
                    "Condition": "any",
                    "MaxAttempts": 0
                },
                "Placement": {}
            },
            "Mode": {
                "Replicated": {
                    "Replicas": 1
                }
            },
            "UpdateConfig": {
                "Parallelism": 1
            },
            "EndpointSpec": {
                "Mode": "vip"
            }
        },
        "Endpoint": {
            "Spec": {}
        }
    }
    ]
    ```
@y
    ```console
    [manager1]$ docker service inspect helloworld
    [
    {
        "ID": "9uk4639qpg7npwf3fn2aasksr",
        "Version": {
            "Index": 418
        },
        "CreatedAt": "2016-06-16T21:57:11.622222327Z",
        "UpdatedAt": "2016-06-16T21:57:11.622222327Z",
        "Spec": {
            "Name": "helloworld",
            "TaskTemplate": {
                "ContainerSpec": {
                    "Image": "alpine",
                    "Args": [
                        "ping",
                        "docker.com"
                    ]
                },
                "Resources": {
                    "Limits": {},
                    "Reservations": {}
                },
                "RestartPolicy": {
                    "Condition": "any",
                    "MaxAttempts": 0
                },
                "Placement": {}
            },
            "Mode": {
                "Replicated": {
                    "Replicas": 1
                }
            },
            "UpdateConfig": {
                "Parallelism": 1
            },
            "EndpointSpec": {
                "Mode": "vip"
            }
        },
        "Endpoint": {
            "Spec": {}
        }
    }
    ]
    ```
@z

@x
3.  Run `docker service ps <SERVICE-ID>` to see which nodes are running the
    service:
@y
3.  Run `docker service ps <SERVICE-ID>` to see which nodes are running the
    service:
@z

@x
    ```console
    [manager1]$ docker service ps helloworld
@y
    ```console
    [manager1]$ docker service ps helloworld
@z

@x
    NAME                                    IMAGE   NODE     DESIRED STATE  CURRENT STATE           ERROR               PORTS
    helloworld.1.8p1vev3fq5zm0mi8g0as41w35  alpine  worker2  Running        Running 3 minutes
    ```
@y
    NAME                                    IMAGE   NODE     DESIRED STATE  CURRENT STATE           ERROR               PORTS
    helloworld.1.8p1vev3fq5zm0mi8g0as41w35  alpine  worker2  Running        Running 3 minutes
    ```
@z

@x
    In this case, the one instance of the `helloworld` service is running on the
    `worker2` node. You may see the service running on your manager node. By
    default, manager nodes in a swarm can execute tasks just like worker nodes.
@y
    In this case, the one instance of the `helloworld` service is running on the
    `worker2` node. You may see the service running on your manager node. By
    default, manager nodes in a swarm can execute tasks just like worker nodes.
@z

@x
    Swarm also shows you the `DESIRED STATE` and `CURRENT STATE` of the service
    task so you can see if tasks are running according to the service
    definition.
@y
    Swarm also shows you the `DESIRED STATE` and `CURRENT STATE` of the service
    task so you can see if tasks are running according to the service
    definition.
@z

@x
4.  Run `docker ps` on the node where the task is running to see details about
    the container for the task.
@y
4.  Run `docker ps` on the node where the task is running to see details about
    the container for the task.
@z

@x
    >**Tip**
    >
    > If `helloworld` is running on a node other than your manager node,
    you must ssh to that node.
@y
    >**Tip**
    >
    > If `helloworld` is running on a node other than your manager node,
    you must ssh to that node.
@z

@x
    ```console
    [worker2]$ docker ps
@y
    ```console
    [worker2]$ docker ps
@z

@x
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    e609dde94e47        alpine:latest       "ping docker.com"   3 minutes ago       Up 3 minutes                            helloworld.1.8p1vev3fq5zm0mi8g0as41w35
    ```
@y
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    e609dde94e47        alpine:latest       "ping docker.com"   3 minutes ago       Up 3 minutes                            helloworld.1.8p1vev3fq5zm0mi8g0as41w35
    ```
@z

@x
## Next steps
@y
## Next steps
@z

@x
Next, you'll change the scale for the service running in the swarm.
@y
Next, you'll change the scale for the service running in the swarm.
@z

@x
{{< button text="Change the scale" url="scale-service.md" >}}
@y
{{< button text="Change the scale" url="scale-service.md" >}}
@z
