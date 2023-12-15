%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Drain nodes on the swarm
keywords: tutorial, cluster management, swarm, service, drain, get started
title: Drain a node on the swarm
notoc: true
---
@y
---
description: Drain nodes on the swarm
keywords: tutorial, cluster management, swarm, service, drain, get started
title: Drain a node on the swarm
notoc: true
---
@z

@x
In earlier steps of the tutorial, all the nodes have been running with `Active`
availability. The swarm manager can assign tasks to any `Active` node, so up to
now all nodes have been available to receive tasks.
@y
In earlier steps of the tutorial, all the nodes have been running with `Active`
availability. The swarm manager can assign tasks to any `Active` node, so up to
now all nodes have been available to receive tasks.
@z

@x
Sometimes, such as planned maintenance times, you need to set a node to `Drain`
availability. `Drain` availability  prevents a node from receiving new tasks
from the swarm manager. It also means the manager stops tasks running on the
node and launches replica tasks on a node with `Active` availability.
@y
Sometimes, such as planned maintenance times, you need to set a node to `Drain`
availability. `Drain` availability  prevents a node from receiving new tasks
from the swarm manager. It also means the manager stops tasks running on the
node and launches replica tasks on a node with `Active` availability.
@z

@x
> **Important**: 
>
> Setting a node to `Drain` does not remove standalone containers from that node,
> such as those created with `docker run`, `docker compose up`, or the Docker Engine
> API. A node's status, including `Drain`, only affects the node's ability to schedule
> swarm service workloads.
{ .important }
@y
> **Important**: 
>
> Setting a node to `Drain` does not remove standalone containers from that node,
> such as those created with `docker run`, `docker compose up`, or the Docker Engine
> API. A node's status, including `Drain`, only affects the node's ability to schedule
> swarm service workloads.
{ .important }
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
2.  Verify that all your nodes are actively available.
@y
2.  Verify that all your nodes are actively available.
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
    1bcef6utixb0l0ca7gxuivsj0    worker2   Ready   Active
    38ciaotwjuritcdtn9npbnkuz    worker1   Ready   Active
    e216jshn25ckzbvmwlnh5jr3g *  manager1  Ready   Active        Leader
    ```
@y
    ID                           HOSTNAME  STATUS  AVAILABILITY  MANAGER STATUS
    1bcef6utixb0l0ca7gxuivsj0    worker2   Ready   Active
    38ciaotwjuritcdtn9npbnkuz    worker1   Ready   Active
    e216jshn25ckzbvmwlnh5jr3g *  manager1  Ready   Active        Leader
    ```
@z

@x
3.  If you aren't still running the `redis` service from the
    [rolling update](rolling-update.md) tutorial, start it now:
@y
3.  If you aren't still running the `redis` service from the
    [rolling update](rolling-update.md) tutorial, start it now:
@z

@x
    ```console
    $ docker service create --replicas 3 --name redis --update-delay 10s redis:3.0.6
@y
    ```console
    $ docker service create --replicas 3 --name redis --update-delay 10s redis:3.0.6
@z

@x
    c5uo6kdmzpon37mgj9mwglcfw
    ```
@y
    c5uo6kdmzpon37mgj9mwglcfw
    ```
@z

@x
4.  Run `docker service ps redis` to see how the swarm manager assigned the
tasks to different nodes:
@y
4.  Run `docker service ps redis` to see how the swarm manager assigned the
tasks to different nodes:
@z

@x
    ```console
    $ docker service ps redis
@y
    ```console
    $ docker service ps redis
@z

@x
    NAME                               IMAGE        NODE     DESIRED STATE  CURRENT STATE
    redis.1.7q92v0nr1hcgts2amcjyqg3pq  redis:3.0.6  manager1 Running        Running 26 seconds
    redis.2.7h2l8h3q3wqy5f66hlv9ddmi6  redis:3.0.6  worker1  Running        Running 26 seconds
    redis.3.9bg7cezvedmkgg6c8yzvbhwsd  redis:3.0.6  worker2  Running        Running 26 seconds
    ```
@y
    NAME                               IMAGE        NODE     DESIRED STATE  CURRENT STATE
    redis.1.7q92v0nr1hcgts2amcjyqg3pq  redis:3.0.6  manager1 Running        Running 26 seconds
    redis.2.7h2l8h3q3wqy5f66hlv9ddmi6  redis:3.0.6  worker1  Running        Running 26 seconds
    redis.3.9bg7cezvedmkgg6c8yzvbhwsd  redis:3.0.6  worker2  Running        Running 26 seconds
    ```
@z

@x
    In this case the swarm manager distributed one task to each node. You may
    see the tasks distributed differently among the nodes in your environment.
@y
    In this case the swarm manager distributed one task to each node. You may
    see the tasks distributed differently among the nodes in your environment.
@z

@x
5.  Run `docker node update --availability drain <NODE-ID>` to drain a node that
had a task assigned to it:
@y
5.  Run `docker node update --availability drain <NODE-ID>` to drain a node that
had a task assigned to it:
@z

@x
    ```console
    $ docker node update --availability drain worker1
@y
    ```console
    $ docker node update --availability drain worker1
@z

@x
    worker1
    ```
@y
    worker1
    ```
@z

@x
6.  Inspect the node to check its availability:
@y
6.  Inspect the node to check its availability:
@z

@x
    ```console
    $ docker node inspect --pretty worker1
@y
    ```console
    $ docker node inspect --pretty worker1
@z

@x
    ID:			38ciaotwjuritcdtn9npbnkuz
    Hostname:		worker1
    Status:
     State:			Ready
     Availability:		Drain
    ...snip...
    ```
@y
    ID:			38ciaotwjuritcdtn9npbnkuz
    Hostname:		worker1
    Status:
     State:			Ready
     Availability:		Drain
    ...snip...
    ```
@z

@x
    The drained node shows `Drain` for `Availability`.
@y
    The drained node shows `Drain` for `Availability`.
@z

@x
7.  Run `docker service ps redis` to see how the swarm manager updated the
task assignments for the `redis` service:
@y
7.  Run `docker service ps redis` to see how the swarm manager updated the
task assignments for the `redis` service:
@z

@x
    ```console
    $ docker service ps redis
@y
    ```console
    $ docker service ps redis
@z

@x
    NAME                                    IMAGE        NODE      DESIRED STATE  CURRENT STATE           ERROR
    redis.1.7q92v0nr1hcgts2amcjyqg3pq       redis:3.0.6  manager1  Running        Running 4 minutes
    redis.2.b4hovzed7id8irg1to42egue8       redis:3.0.6  worker2   Running        Running About a minute
     \_ redis.2.7h2l8h3q3wqy5f66hlv9ddmi6   redis:3.0.6  worker1   Shutdown       Shutdown 2 minutes ago
    redis.3.9bg7cezvedmkgg6c8yzvbhwsd       redis:3.0.6  worker2   Running        Running 4 minutes
    ```
@y
    NAME                                    IMAGE        NODE      DESIRED STATE  CURRENT STATE           ERROR
    redis.1.7q92v0nr1hcgts2amcjyqg3pq       redis:3.0.6  manager1  Running        Running 4 minutes
    redis.2.b4hovzed7id8irg1to42egue8       redis:3.0.6  worker2   Running        Running About a minute
     \_ redis.2.7h2l8h3q3wqy5f66hlv9ddmi6   redis:3.0.6  worker1   Shutdown       Shutdown 2 minutes ago
    redis.3.9bg7cezvedmkgg6c8yzvbhwsd       redis:3.0.6  worker2   Running        Running 4 minutes
    ```
@z

@x
    The swarm manager maintains the desired state by ending the task on a node
    with `Drain` availability and creating a new task on a node with `Active`
    availability.
@y
    The swarm manager maintains the desired state by ending the task on a node
    with `Drain` availability and creating a new task on a node with `Active`
    availability.
@z

@x
8.  Run  `docker node update --availability active <NODE-ID>` to return the
drained node to an active state:
@y
8.  Run  `docker node update --availability active <NODE-ID>` to return the
drained node to an active state:
@z

@x
    ```console
    $ docker node update --availability active worker1
@y
    ```console
    $ docker node update --availability active worker1
@z

@x
    worker1
    ```
@y
    worker1
    ```
@z

@x
9.  Inspect the node to see the updated state:
@y
9.  Inspect the node to see the updated state:
@z

@x
    ```console
    $ docker node inspect --pretty worker1
@y
    ```console
    $ docker node inspect --pretty worker1
@z

@x
    ID:			38ciaotwjuritcdtn9npbnkuz
    Hostname:		worker1
    Status:
     State:			Ready
     Availability:		Active
    ...snip...
    ```
@y
    ID:			38ciaotwjuritcdtn9npbnkuz
    Hostname:		worker1
    Status:
     State:			Ready
     Availability:		Active
    ...snip...
    ```
@z

@x
    When you set the node back to `Active` availability, it can receive new tasks:
@y
    When you set the node back to `Active` availability, it can receive new tasks:
@z

@x
    * during a service update to scale up
    * during a rolling update
    * when you set another node to `Drain` availability
    * when a task fails on another active node
@y
    * during a service update to scale up
    * during a rolling update
    * when you set another node to `Drain` availability
    * when a task fails on another active node
@z

@x
## Next steps
@y
## Next steps
@z

@x
Next, you'll learn how to use a Swarm mode routing mesh
@y
Next, you'll learn how to use a Swarm mode routing mesh
@z

@x
{{< button text="Use a Swarm mode routing mesh" url="../ingress.md" >}}
@y
{{< button text="Use a Swarm mode routing mesh" url="../ingress.md" >}}
@z
