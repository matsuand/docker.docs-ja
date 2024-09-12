%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Swarm task states
description: Learn about tasks that are scheduled on your swarm.
keywords: swarm, task, service
aliases:
- /datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/troubleshoot-task-state/
---
@y
---
title: Swarm task states
description: Learn about tasks that are scheduled on your swarm.
keywords: swarm, task, service
aliases:
- /datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/troubleshoot-task-state/
---
@z

@x
Docker lets you create services, which can start tasks. A service is a
description of a desired state, and a task does the work. Work is scheduled on
swarm nodes in this sequence:
@y
Docker lets you create services, which can start tasks. A service is a
description of a desired state, and a task does the work. Work is scheduled on
swarm nodes in this sequence:
@z

@x
1.  Create a service by using `docker service create`.
2.  The request goes to a Docker manager node.
3.  The Docker manager node schedules the service to run on particular nodes.
4.  Each service can start multiple tasks.
5.  Each task has a life cycle, with states like `NEW`, `PENDING`, and `COMPLETE`.
@y
1.  Create a service by using `docker service create`.
2.  The request goes to a Docker manager node.
3.  The Docker manager node schedules the service to run on particular nodes.
4.  Each service can start multiple tasks.
5.  Each task has a life cycle, with states like `NEW`, `PENDING`, and `COMPLETE`.
@z

@x
Tasks are execution units that run once to completion. When a task stops, it
isn't executed again, but a new task may take its place.
@y
Tasks are execution units that run once to completion. When a task stops, it
isn't executed again, but a new task may take its place.
@z

@x
Tasks advance through a number of states until they complete or fail. Tasks are
initialized in the `NEW` state. The task progresses forward through a number of
states, and its state doesn't go backward. For example, a task never goes from
`COMPLETE` to `RUNNING`.
@y
Tasks advance through a number of states until they complete or fail. Tasks are
initialized in the `NEW` state. The task progresses forward through a number of
states, and its state doesn't go backward. For example, a task never goes from
`COMPLETE` to `RUNNING`.
@z

@x
Tasks go through the states in the following order:
@y
Tasks go through the states in the following order:
@z

@x
| Task state  | Description                                                                                                 |
| ----------- | ----------------------------------------------------------------------------------------------------------- |
| `NEW`       | The task was initialized.                                                                                   |
| `PENDING`   | Resources for the task were allocated.                                                                      |
| `ASSIGNED`  | Docker assigned the task to nodes.                                                                          |
| `ACCEPTED`  | The task was accepted by a worker node. If a worker node rejects the task, the state changes to `REJECTED`. |
| `READY`     | The worker node is ready to start the task                                                                  |
| `PREPARING` | Docker is preparing the task.                                                                               |
| `STARTING`  | Docker is starting the task.                                                                                |
| `RUNNING`   | The task is executing.                                                                                      |
| `COMPLETE`  | The task exited without an error code.                                                                      |
| `FAILED`    | The task exited with an error code.                                                                         |
| `SHUTDOWN`  | Docker requested the task to shut down.                                                                     |
| `REJECTED`  | The worker node rejected the task.                                                                          |
| `ORPHANED`  | The node was down for too long.                                                                             |
| `REMOVE`    | The task is not terminal but the associated service was removed or scaled down.                             |
@y
| Task state  | Description                                                                                                 |
| ----------- | ----------------------------------------------------------------------------------------------------------- |
| `NEW`       | The task was initialized.                                                                                   |
| `PENDING`   | Resources for the task were allocated.                                                                      |
| `ASSIGNED`  | Docker assigned the task to nodes.                                                                          |
| `ACCEPTED`  | The task was accepted by a worker node. If a worker node rejects the task, the state changes to `REJECTED`. |
| `READY`     | The worker node is ready to start the task                                                                  |
| `PREPARING` | Docker is preparing the task.                                                                               |
| `STARTING`  | Docker is starting the task.                                                                                |
| `RUNNING`   | The task is executing.                                                                                      |
| `COMPLETE`  | The task exited without an error code.                                                                      |
| `FAILED`    | The task exited with an error code.                                                                         |
| `SHUTDOWN`  | Docker requested the task to shut down.                                                                     |
| `REJECTED`  | The worker node rejected the task.                                                                          |
| `ORPHANED`  | The node was down for too long.                                                                             |
| `REMOVE`    | The task is not terminal but the associated service was removed or scaled down.                             |
@z

@x
## View task state
@y
## View task state
@z

@x
Run `docker service ps <service-name>` to get the state of a task. The
`CURRENT STATE` field shows the task's state and how long it's been
there.
@y
Run `docker service ps <service-name>` to get the state of a task. The
`CURRENT STATE` field shows the task's state and how long it's been
there.
@z

@x
```console
$ docker service ps webserver
ID             NAME              IMAGE    NODE        DESIRED STATE  CURRENT STATE            ERROR                              PORTS
owsz0yp6z375   webserver.1       nginx    UbuntuVM    Running        Running 44 seconds ago
j91iahr8s74p    \_ webserver.1   nginx    UbuntuVM    Shutdown       Failed 50 seconds ago    "No such container: webserver.…"
7dyaszg13mw2    \_ webserver.1   nginx    UbuntuVM    Shutdown       Failed 5 hours ago       "No such container: webserver.…"
```
@y
```console
$ docker service ps webserver
ID             NAME              IMAGE    NODE        DESIRED STATE  CURRENT STATE            ERROR                              PORTS
owsz0yp6z375   webserver.1       nginx    UbuntuVM    Running        Running 44 seconds ago
j91iahr8s74p    \_ webserver.1   nginx    UbuntuVM    Shutdown       Failed 50 seconds ago    "No such container: webserver.…"
7dyaszg13mw2    \_ webserver.1   nginx    UbuntuVM    Shutdown       Failed 5 hours ago       "No such container: webserver.…"
```
@z

@x
## Where to go next
@y
## Where to go next
@z

@x
- [Learn about swarm tasks](https://github.com/docker/swarmkit/blob/master/design/task_model.md)
@y
- [Learn about swarm tasks](https://github.com/docker/swarmkit/blob/master/design/task_model.md)
@z
