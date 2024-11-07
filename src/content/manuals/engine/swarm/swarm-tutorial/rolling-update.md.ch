%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Apply rolling updates to a service on the swarm
keywords: tutorial, cluster management, swarm, service, rolling-update
title: Apply rolling updates to a service
weight: 70
notoc: true
---
@y
---
description: Apply rolling updates to a service on the swarm
keywords: tutorial, cluster management, swarm, service, rolling-update
title: Apply rolling updates to a service
weight: 70
notoc: true
---
@z

@x
In a previous step of the tutorial, you [scaled](scale-service.md) the number of
instances of a service. In this part of the tutorial, you deploy a service based
on the Redis 7.4.0 container tag. Then you upgrade the service to use the
Redis 7.4.1 container image using rolling updates.
@y
In a previous step of the tutorial, you [scaled](scale-service.md) the number of
instances of a service. In this part of the tutorial, you deploy a service based
on the Redis 7.4.0 container tag. Then you upgrade the service to use the
Redis 7.4.1 container image using rolling updates.
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
2.  Deploy your Redis tag to the swarm and configure the swarm with a 10 second
    update delay. Note that the following example shows an older Redis tag:
@y
2.  Deploy your Redis tag to the swarm and configure the swarm with a 10 second
    update delay. Note that the following example shows an older Redis tag:
@z

@x
    ```console
    $ docker service create \
      --replicas 3 \
      --name redis \
      --update-delay 10s \
      redis:7.4.0
@y
    ```console
    $ docker service create \
      --replicas 3 \
      --name redis \
      --update-delay 10s \
      redis:7.4.0
@z

@x
    0u6a4s31ybk7yw2wyvtikmu50
    ```
@y
    0u6a4s31ybk7yw2wyvtikmu50
    ```
@z

@x
    You configure the rolling update policy at service deployment time.
@y
    You configure the rolling update policy at service deployment time.
@z

@x
    The `--update-delay` flag configures the time delay between updates to a
    service task or sets of tasks. You can describe the time `T` as a
    combination of the number of seconds `Ts`, minutes `Tm`, or hours `Th`. So
    `10m30s` indicates a 10 minute 30 second delay.
@y
    The `--update-delay` flag configures the time delay between updates to a
    service task or sets of tasks. You can describe the time `T` as a
    combination of the number of seconds `Ts`, minutes `Tm`, or hours `Th`. So
    `10m30s` indicates a 10 minute 30 second delay.
@z

@x
    By default the scheduler updates 1 task at a time. You can pass the
    `--update-parallelism` flag to configure the maximum number of service tasks
    that the scheduler updates simultaneously.
@y
    By default the scheduler updates 1 task at a time. You can pass the
    `--update-parallelism` flag to configure the maximum number of service tasks
    that the scheduler updates simultaneously.
@z

@x
    By default, when an update to an individual task returns a state of
    `RUNNING`, the scheduler schedules another task to update until all tasks
    are updated. If at any time during an update a task returns `FAILED`, the
    scheduler pauses the update. You can control the behavior using the
    `--update-failure-action` flag for `docker service create` or
    `docker service update`.
@y
    By default, when an update to an individual task returns a state of
    `RUNNING`, the scheduler schedules another task to update until all tasks
    are updated. If at any time during an update a task returns `FAILED`, the
    scheduler pauses the update. You can control the behavior using the
    `--update-failure-action` flag for `docker service create` or
    `docker service update`.
@z

@x
3.  Inspect the `redis` service:
@y
3.  Inspect the `redis` service:
@z

@x
    ```console
    $ docker service inspect --pretty redis
@y
    ```console
    $ docker service inspect --pretty redis
@z

@x
    ID:             0u6a4s31ybk7yw2wyvtikmu50
    Name:           redis
    Service Mode:   Replicated
     Replicas:      3
    Placement:
     Strategy:	    Spread
    UpdateConfig:
     Parallelism:   1
     Delay:         10s
    ContainerSpec:
     Image:         redis:7.4.0
    Resources:
    Endpoint Mode:  vip
    ```
@y
    ID:             0u6a4s31ybk7yw2wyvtikmu50
    Name:           redis
    Service Mode:   Replicated
     Replicas:      3
    Placement:
     Strategy:	    Spread
    UpdateConfig:
     Parallelism:   1
     Delay:         10s
    ContainerSpec:
     Image:         redis:7.4.0
    Resources:
    Endpoint Mode:  vip
    ```
@z

@x
4.  Now you can update the container image for `redis`. The swarm  manager
    applies the update to nodes according to the `UpdateConfig` policy:
@y
4.  Now you can update the container image for `redis`. The swarm  manager
    applies the update to nodes according to the `UpdateConfig` policy:
@z

@x
    ```console
    $ docker service update --image redis:7.4.1 redis
    redis
    ```
@y
    ```console
    $ docker service update --image redis:7.4.1 redis
    redis
    ```
@z

@x
    The scheduler applies rolling updates as follows by default:
@y
    The scheduler applies rolling updates as follows by default:
@z

@x
    * Stop the first task.
    * Schedule update for the stopped task.
    * Start the container for the updated task.
    * If the update to a task returns `RUNNING`, wait for the
      specified delay period then start the next task.
    * If, at any time during the update, a task returns `FAILED`, pause the
      update.
@y
    * Stop the first task.
    * Schedule update for the stopped task.
    * Start the container for the updated task.
    * If the update to a task returns `RUNNING`, wait for the
      specified delay period then start the next task.
    * If, at any time during the update, a task returns `FAILED`, pause the
      update.
@z

@x
5.  Run `docker service inspect --pretty redis` to see the new image in the
    desired state:
@y
5.  Run `docker service inspect --pretty redis` to see the new image in the
    desired state:
@z

@x
    ```console
    $ docker service inspect --pretty redis
@y
    ```console
    $ docker service inspect --pretty redis
@z

@x
    ID:             0u6a4s31ybk7yw2wyvtikmu50
    Name:           redis
    Service Mode:   Replicated
     Replicas:      3
    Placement:
     Strategy:	    Spread
    UpdateConfig:
     Parallelism:   1
     Delay:         10s
    ContainerSpec:
     Image:         redis:7.4.1
    Resources:
    Endpoint Mode:  vip
    ```
@y
    ID:             0u6a4s31ybk7yw2wyvtikmu50
    Name:           redis
    Service Mode:   Replicated
     Replicas:      3
    Placement:
     Strategy:	    Spread
    UpdateConfig:
     Parallelism:   1
     Delay:         10s
    ContainerSpec:
     Image:         redis:7.4.1
    Resources:
    Endpoint Mode:  vip
    ```
@z

@x
    The output of `service inspect` shows if your update paused due to failure:
@y
    The output of `service inspect` shows if your update paused due to failure:
@z

@x
    ```console
    $ docker service inspect --pretty redis
@y
    ```console
    $ docker service inspect --pretty redis
@z

@x
    ID:             0u6a4s31ybk7yw2wyvtikmu50
    Name:           redis
    ...snip...
    Update status:
     State:      paused
     Started:    11 seconds ago
     Message:    update paused due to failure or early termination of task 9p7ith557h8ndf0ui9s0q951b
    ...snip...
    ```
@y
    ID:             0u6a4s31ybk7yw2wyvtikmu50
    Name:           redis
    ...snip...
    Update status:
     State:      paused
     Started:    11 seconds ago
     Message:    update paused due to failure or early termination of task 9p7ith557h8ndf0ui9s0q951b
    ...snip...
    ```
@z

@x
    To restart a paused update run `docker service update <SERVICE-ID>`. For example:
@y
    To restart a paused update run `docker service update <SERVICE-ID>`. For example:
@z

@x
    ```console
    $ docker service update redis
    ```
@y
    ```console
    $ docker service update redis
    ```
@z

@x
    To avoid repeating certain update failures, you may need to reconfigure the
    service by passing flags to `docker service update`.
@y
    To avoid repeating certain update failures, you may need to reconfigure the
    service by passing flags to `docker service update`.
@z

@x
6.  Run `docker service ps <SERVICE-ID>` to watch the rolling update:
@y
6.  Run `docker service ps <SERVICE-ID>` to watch the rolling update:
@z

@x
    ```console
    $ docker service ps redis
@y
    ```console
    $ docker service ps redis
@z

@x
    NAME                                   IMAGE        NODE       DESIRED STATE  CURRENT STATE            ERROR
    redis.1.dos1zffgeofhagnve8w864fco      redis:7.4.1  worker1    Running        Running 37 seconds
     \_ redis.1.88rdo6pa52ki8oqx6dogf04fh  redis:7.4.0  worker2    Shutdown       Shutdown 56 seconds ago
    redis.2.9l3i4j85517skba5o7tn5m8g0      redis:7.4.1  worker2    Running        Running About a minute
     \_ redis.2.66k185wilg8ele7ntu8f6nj6i  redis:7.4.0  worker1    Shutdown       Shutdown 2 minutes ago
    redis.3.egiuiqpzrdbxks3wxgn8qib1g      redis:7.4.1  worker1    Running        Running 48 seconds
     \_ redis.3.ctzktfddb2tepkr45qcmqln04  redis:7.4.0  mmanager1  Shutdown       Shutdown 2 minutes ago
    ```
@y
    NAME                                   IMAGE        NODE       DESIRED STATE  CURRENT STATE            ERROR
    redis.1.dos1zffgeofhagnve8w864fco      redis:7.4.1  worker1    Running        Running 37 seconds
     \_ redis.1.88rdo6pa52ki8oqx6dogf04fh  redis:7.4.0  worker2    Shutdown       Shutdown 56 seconds ago
    redis.2.9l3i4j85517skba5o7tn5m8g0      redis:7.4.1  worker2    Running        Running About a minute
     \_ redis.2.66k185wilg8ele7ntu8f6nj6i  redis:7.4.0  worker1    Shutdown       Shutdown 2 minutes ago
    redis.3.egiuiqpzrdbxks3wxgn8qib1g      redis:7.4.1  worker1    Running        Running 48 seconds
     \_ redis.3.ctzktfddb2tepkr45qcmqln04  redis:7.4.0  mmanager1  Shutdown       Shutdown 2 minutes ago
    ```
@z

@x
    Before Swarm updates all of the tasks, you can see that some are running
    `redis:7.4.0` while others are running `redis:7.4.1`. The output above shows
    the state once the rolling updates are done.
@y
    Before Swarm updates all of the tasks, you can see that some are running
    `redis:7.4.0` while others are running `redis:7.4.1`. The output above shows
    the state once the rolling updates are done.
@z

@x
## Next steps
@y
## Next steps
@z

@x
Next, you'll learn how to drain a node in the swarm.
@y
Next, you'll learn how to drain a node in the swarm.
@z

@x
{{< button text="Drain a node" url="drain-node.md" >}}
@y
{{< button text="Drain a node" url="drain-node.md" >}}
@z
