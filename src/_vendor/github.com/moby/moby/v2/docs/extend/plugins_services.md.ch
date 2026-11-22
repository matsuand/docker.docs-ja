%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
keywords: "API, Usage, plugins, documentation, developer"
title: Plugins and Services
@y
keywords: "API, Usage, plugins, documentation, developer"
title: Plugins and Services
@z

@x
# Using Volume and Network plugins in Docker services
@y
# Using Volume and Network plugins in Docker services
@z

@x
In swarm mode, it is possible to create a service that allows for attaching
to networks or mounting volumes that are backed by plugins. Swarm schedules
services based on plugin availability on a node.
@y
In swarm mode, it is possible to create a service that allows for attaching
to networks or mounting volumes that are backed by plugins. Swarm schedules
services based on plugin availability on a node.
@z

@x
### Volume plugins
@y
### Volume plugins
@z

@x
In this example, a volume plugin is installed on a swarm worker and a volume
is created using the plugin. In the manager, a service is created with the
relevant mount options. It can be observed that the service is scheduled to
run on the worker node with the said volume plugin and volume. Note that,
node1 is the manager and node2 is the worker.
@y
In this example, a volume plugin is installed on a swarm worker and a volume
is created using the plugin. In the manager, a service is created with the
relevant mount options. It can be observed that the service is scheduled to
run on the worker node with the said volume plugin and volume. Note that,
node1 is the manager and node2 is the worker.
@z

@x
1.  Prepare manager. In node 1:
@y
1.  Prepare manager. In node 1:
@z

% snip command...

@x
2. Join swarm, install plugin and create volume on worker. In node 2:
@y
2. Join swarm, install plugin and create volume on worker. In node 2:
@z

% snip commands...

@x
3. Create a service using the plugin and volume. In node1:
@y
3. Create a service using the plugin and volume. In node1:
@z

% snip command...

@x
    `docker service ls` shows service 1 instance of service running.
@y
    `docker service ls` shows service 1 instance of service running.
@z

@x
4. Observe the task getting scheduled in node 2:
@y
4. Observe the task getting scheduled in node 2:
@z

% snip command...

@x
### Network plugins
@y
### Network plugins
@z

@x
In this example, a global scope network plugin is installed on both the
swarm manager and worker. A service is created with replicated instances
using the installed plugin. We will observe how the availability of the
plugin determines network creation and container scheduling.
@y
In this example, a global scope network plugin is installed on both the
swarm manager and worker. A service is created with replicated instances
using the installed plugin. We will observe how the availability of the
plugin determines network creation and container scheduling.
@z

@x
Note that node1 is the manager and node2 is the worker.
@y
Note that node1 is the manager and node2 is the worker.
@z

@x
1. Install a global scoped network plugin on both manager and worker. On node1
   and node2:
@y
1. Install a global scoped network plugin on both manager and worker. On node1
   and node2:
@z

% snip command...

@x
2. Create a network using plugin on manager. On node1:
@y
2. Create a network using plugin on manager. On node1:
@z

% snip command...

@x
3. Create a service on the manager and have replicas set to 8. Observe that
containers get scheduled on both manager and worker.
@y
3. Create a service on the manager and have replicas set to 8. Observe that
containers get scheduled on both manager and worker.
@z

@x
    On node 1:
@y
    On node 1:
@z

% snip command...

@x
    On node 2:
@y
    On node 2:
@z

% snip command...

@x
4. Scale down the number of instances. On node1:
@y
4. Scale down the number of instances. On node1:
@z

% snip command...

@x
5. Disable and uninstall the plugin on the worker. On node2:
@y
5. Disable and uninstall the plugin on the worker. On node2:
@z

% snip command...

@x
6. Scale up the number of instances again. Observe that all containers are
scheduled on the master and not on the worker, because the plugin is not available on the worker anymore.
@y
6. Scale up the number of instances again. Observe that all containers are
scheduled on the master and not on the worker, because the plugin is not available on the worker anymore.
@z

@x
    On node 1:
@y
    On node 1:
@z

% snip commands...

@x
    On node 2:
@y
    On node 2:
@z

% snip command...
