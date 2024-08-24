%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: Manager administration guide
keywords: docker, container, swarm, manager, raft
title: Administer and maintain a swarm of Docker Engines
@y
description: Manager administration guide
keywords: docker, container, swarm, manager, raft
title: Administer and maintain a swarm of Docker Engines
@z

@x
When you run a swarm of Docker Engines, manager nodes are the key components
for managing the swarm and storing the swarm state. It is important to
understand some key features of manager nodes to properly deploy and
maintain the swarm.
@y
When you run a swarm of Docker Engines, manager nodes are the key components
for managing the swarm and storing the swarm state. It is important to
understand some key features of manager nodes to properly deploy and
maintain the swarm.
@z

@x
Refer to [How nodes work](how-swarm-mode-works/nodes.md)
for a brief overview of Docker Swarm mode and the difference between manager and
worker nodes.
@y
Refer to [How nodes work](how-swarm-mode-works/nodes.md)
for a brief overview of Docker Swarm mode and the difference between manager and
worker nodes.
@z

@x
## Operate manager nodes in a swarm
@y
## Operate manager nodes in a swarm
@z

@x
Swarm manager nodes use the [Raft Consensus Algorithm](raft.md) to manage the
swarm state. You only need to understand some general concepts of Raft in
order to manage a swarm.
@y
Swarm manager nodes use the [Raft Consensus Algorithm](raft.md) to manage the
swarm state. You only need to understand some general concepts of Raft in
order to manage a swarm.
@z

@x
There is no limit on the number of manager nodes. The decision about how many
manager nodes to implement is a trade-off between performance and
fault-tolerance. Adding manager nodes to a swarm makes the swarm more
fault-tolerant. However, additional manager nodes reduce write performance
because more nodes must acknowledge proposals to update the swarm state.
This means more network round-trip traffic.
@y
There is no limit on the number of manager nodes. The decision about how many
manager nodes to implement is a trade-off between performance and
fault-tolerance. Adding manager nodes to a swarm makes the swarm more
fault-tolerant. However, additional manager nodes reduce write performance
because more nodes must acknowledge proposals to update the swarm state.
This means more network round-trip traffic.
@z

@x
Raft requires a majority of managers, also called the quorum, to agree on
proposed updates to the swarm, such as node additions or removals. Membership
operations are subject to the same constraints as state replication.
@y
Raft requires a majority of managers, also called the quorum, to agree on
proposed updates to the swarm, such as node additions or removals. Membership
operations are subject to the same constraints as state replication.
@z

@x
### Maintain the quorum of managers
@y
### Maintain the quorum of managers
@z

@x
If the swarm loses the quorum of managers, the swarm cannot perform management
tasks. If your swarm has multiple managers, always have more than two.
To maintain quorum, a majority of managers must be available. An odd number of
managers is recommended, because the next even number does not make the quorum
easier to keep. For instance, whether you have 3 or 4 managers, you can still
only lose 1 manager and maintain the quorum. If you have 5 or 6 managers, you
can still only lose two.
@y
If the swarm loses the quorum of managers, the swarm cannot perform management
tasks. If your swarm has multiple managers, always have more than two.
To maintain quorum, a majority of managers must be available. An odd number of
managers is recommended, because the next even number does not make the quorum
easier to keep. For instance, whether you have 3 or 4 managers, you can still
only lose 1 manager and maintain the quorum. If you have 5 or 6 managers, you
can still only lose two.
@z

@x
Even if a swarm loses the quorum of managers, swarm tasks on existing worker
nodes continue to run. However, swarm nodes cannot be added, updated, or
removed, and new or existing tasks cannot be started, stopped, moved, or
updated.
@y
Even if a swarm loses the quorum of managers, swarm tasks on existing worker
nodes continue to run. However, swarm nodes cannot be added, updated, or
removed, and new or existing tasks cannot be started, stopped, moved, or
updated.
@z

@x
See [Recovering from losing the quorum](#recover-from-losing-the-quorum) for
troubleshooting steps if you do lose the quorum of managers.
@y
See [Recovering from losing the quorum](#recover-from-losing-the-quorum) for
troubleshooting steps if you do lose the quorum of managers.
@z

@x
## Configure the manager to advertise on a static IP address
@y
## Configure the manager to advertise on a static IP address
@z

@x
When initiating a swarm, you must specify the `--advertise-addr` flag to
advertise your address to other manager nodes in the swarm. For more
information, see [Run Docker Engine in swarm mode](swarm-mode.md#configure-the-advertise-address). Because manager nodes are
meant to be a stable component of the infrastructure, you should use a *fixed
IP address* for the advertise address to prevent the swarm from becoming
unstable on machine reboot.
@y
When initiating a swarm, you must specify the `--advertise-addr` flag to
advertise your address to other manager nodes in the swarm. For more
information, see [Run Docker Engine in swarm mode](swarm-mode.md#configure-the-advertise-address). Because manager nodes are
meant to be a stable component of the infrastructure, you should use a *fixed
IP address* for the advertise address to prevent the swarm from becoming
unstable on machine reboot.
@z

@x
If the whole swarm restarts and every manager node subsequently gets a new IP
address, there is no way for any node to contact an existing manager. Therefore
the swarm is hung while nodes try to contact one another at their old IP addresses.
@y
If the whole swarm restarts and every manager node subsequently gets a new IP
address, there is no way for any node to contact an existing manager. Therefore
the swarm is hung while nodes try to contact one another at their old IP addresses.
@z

@x
Dynamic IP addresses are OK for worker nodes.
@y
Dynamic IP addresses are OK for worker nodes.
@z

@x
## Add manager nodes for fault tolerance
@y
## Add manager nodes for fault tolerance
@z

@x
You should maintain an odd number of managers in the swarm to support manager
node failures. Having an odd number of managers ensures that during a network
partition, there is a higher chance that the quorum remains available to process
requests if the network is partitioned into two sets. Keeping the quorum is not
guaranteed if you encounter more than two network partitions.
@y
You should maintain an odd number of managers in the swarm to support manager
node failures. Having an odd number of managers ensures that during a network
partition, there is a higher chance that the quorum remains available to process
requests if the network is partitioned into two sets. Keeping the quorum is not
guaranteed if you encounter more than two network partitions.
@z

@x
| Swarm Size |  Majority  |  Fault Tolerance  |
|:------------:|:----------:|:-----------------:|
|      1       |     1      |         0         |
|      2       |     2      |         0         |
|    **3**     |     2      |       **1**       |
|      4       |     3      |         1         |
|    **5**     |     3      |       **2**       |
|      6       |     4      |         2         |
|    **7**     |     4      |       **3**       |
|      8       |     5      |         3         |
|    **9**     |     5      |       **4**       |
@y
| Swarm Size |  Majority  |  Fault Tolerance  |
|:------------:|:----------:|:-----------------:|
|      1       |     1      |         0         |
|      2       |     2      |         0         |
|    **3**     |     2      |       **1**       |
|      4       |     3      |         1         |
|    **5**     |     3      |       **2**       |
|      6       |     4      |         2         |
|    **7**     |     4      |       **3**       |
|      8       |     5      |         3         |
|    **9**     |     5      |       **4**       |
@z

@x
For example, in a swarm with *5 nodes*, if you lose *3 nodes*, you don't have a
quorum. Therefore you can't add or remove nodes until you recover one of the
unavailable manager nodes or recover the swarm with disaster recovery
commands. See [Recover from disaster](#recover-from-disaster).
@y
For example, in a swarm with *5 nodes*, if you lose *3 nodes*, you don't have a
quorum. Therefore you can't add or remove nodes until you recover one of the
unavailable manager nodes or recover the swarm with disaster recovery
commands. See [Recover from disaster](#recover-from-disaster).
@z

@x
While it is possible to scale a swarm down to a single manager node, it is
impossible to demote the last manager node. This ensures you maintain access to
the swarm and that the swarm can still process requests. Scaling down to a
single manager is an unsafe operation and is not recommended. If
the last node leaves the swarm unexpectedly during the demote operation, the
swarm becomes unavailable until you reboot the node or restart with
`--force-new-cluster`.
@y
While it is possible to scale a swarm down to a single manager node, it is
impossible to demote the last manager node. This ensures you maintain access to
the swarm and that the swarm can still process requests. Scaling down to a
single manager is an unsafe operation and is not recommended. If
the last node leaves the swarm unexpectedly during the demote operation, the
swarm becomes unavailable until you reboot the node or restart with
`--force-new-cluster`.
@z

@x
You manage swarm membership with the `docker swarm` and `docker node`
subsystems. Refer to [Add nodes to a swarm](join-nodes.md) for more information
on how to add worker nodes and promote a worker node to be a manager.
@y
You manage swarm membership with the `docker swarm` and `docker node`
subsystems. Refer to [Add nodes to a swarm](join-nodes.md) for more information
on how to add worker nodes and promote a worker node to be a manager.
@z

@x
### Distribute manager nodes
@y
### Distribute manager nodes
@z

@x
In addition to maintaining an odd number of manager nodes, pay attention to
datacenter topology when placing managers. For optimal fault-tolerance, distribute
manager nodes across a minimum of 3 availability-zones to support failures of an
entire set of machines or common maintenance scenarios. If you suffer a failure
in any of those zones, the swarm should maintain the quorum of manager nodes
available to process requests and rebalance workloads.
@y
In addition to maintaining an odd number of manager nodes, pay attention to
datacenter topology when placing managers. For optimal fault-tolerance, distribute
manager nodes across a minimum of 3 availability-zones to support failures of an
entire set of machines or common maintenance scenarios. If you suffer a failure
in any of those zones, the swarm should maintain the quorum of manager nodes
available to process requests and rebalance workloads.
@z

@x
| Swarm manager nodes |  Repartition (on 3 Availability zones) |
|:-------------------:|:--------------------------------------:|
| 3                   |                  1-1-1                 |
| 5                   |                  2-2-1                 |
| 7                   |                  3-2-2                 |
| 9                   |                  3-3-3                 |
@y
| Swarm manager nodes |  Repartition (on 3 Availability zones) |
|:-------------------:|:--------------------------------------:|
| 3                   |                  1-1-1                 |
| 5                   |                  2-2-1                 |
| 7                   |                  3-2-2                 |
| 9                   |                  3-3-3                 |
@z

@x
### Run manager-only nodes
@y
### Run manager-only nodes
@z

@x
By default manager nodes also act as a worker nodes. This means the scheduler
can assign tasks to a manager node. For small and non-critical swarms
assigning tasks to managers is relatively low-risk as long as you schedule
services using resource constraints for cpu and memory.
@y
By default manager nodes also act as a worker nodes. This means the scheduler
can assign tasks to a manager node. For small and non-critical swarms
assigning tasks to managers is relatively low-risk as long as you schedule
services using resource constraints for cpu and memory.
@z

@x
However, because manager nodes use the Raft consensus algorithm to replicate data
in a consistent way, they are sensitive to resource starvation. You should
isolate managers in your swarm from processes that might block swarm
operations like swarm heartbeat or leader elections.
@y
However, because manager nodes use the Raft consensus algorithm to replicate data
in a consistent way, they are sensitive to resource starvation. You should
isolate managers in your swarm from processes that might block swarm
operations like swarm heartbeat or leader elections.
@z

@x
To avoid interference with manager node operation, you can drain manager nodes
to make them unavailable as worker nodes:
@y
To avoid interference with manager node operation, you can drain manager nodes
to make them unavailable as worker nodes:
@z

@x
```console
$ docker node update --availability drain <NODE>
```
@y
```console
$ docker node update --availability drain <NODE>
```
@z

@x
When you drain a node, the scheduler reassigns any tasks running on the node to
other available worker nodes in the swarm. It also prevents the scheduler from
assigning tasks to the node.
@y
When you drain a node, the scheduler reassigns any tasks running on the node to
other available worker nodes in the swarm. It also prevents the scheduler from
assigning tasks to the node.
@z

@x
## Add worker nodes for load balancing
@y
## Add worker nodes for load balancing
@z

@x
[Add nodes to the swarm](join-nodes.md) to balance your swarm's
load. Replicated service tasks are distributed across the swarm as evenly as
possible over time, as long as the worker nodes are matched to the requirements
of the services. When limiting a service to run on only specific types of nodes,
such as nodes with a specific number of CPUs or amount of memory, remember that
worker nodes that do not meet these requirements cannot run these tasks.
@y
[Add nodes to the swarm](join-nodes.md) to balance your swarm's
load. Replicated service tasks are distributed across the swarm as evenly as
possible over time, as long as the worker nodes are matched to the requirements
of the services. When limiting a service to run on only specific types of nodes,
such as nodes with a specific number of CPUs or amount of memory, remember that
worker nodes that do not meet these requirements cannot run these tasks.
@z

@x
## Monitor swarm health
@y
## Monitor swarm health
@z

@x
You can monitor the health of manager nodes by querying the docker `nodes` API
in JSON format through the `/nodes` HTTP endpoint. Refer to the
[nodes API documentation](/reference/api/engine/v1.25/#tag/Node)
for more information.
@y
You can monitor the health of manager nodes by querying the docker `nodes` API
in JSON format through the `/nodes` HTTP endpoint. Refer to the
[nodes API documentation](__SUBDIR__/reference/api/engine/v1.25/#tag/Node)
for more information.
@z

@x
From the command line, run `docker node inspect <id-node>` to query the nodes.
For instance, to query the reachability of the node as a manager:
@y
From the command line, run `docker node inspect <id-node>` to query the nodes.
For instance, to query the reachability of the node as a manager:
@z

@x
```console
$ docker node inspect manager1 --format "{{ .ManagerStatus.Reachability }}"
reachable
```
@y
```console
$ docker node inspect manager1 --format "{{ .ManagerStatus.Reachability }}"
reachable
```
@z

@x
To query the status of the node as a worker that accept tasks:
@y
To query the status of the node as a worker that accept tasks:
@z

@x
```console
$ docker node inspect manager1 --format "{{ .Status.State }}"
ready
```
@y
```console
$ docker node inspect manager1 --format "{{ .Status.State }}"
ready
```
@z

@x
From those commands, we can see that `manager1` is both at the status
`reachable` as a manager and `ready` as a worker.
@y
From those commands, we can see that `manager1` is both at the status
`reachable` as a manager and `ready` as a worker.
@z

@x
An `unreachable` health status means that this particular manager node is unreachable
from other manager nodes. In this case you need to take action to restore the unreachable
manager:
@y
An `unreachable` health status means that this particular manager node is unreachable
from other manager nodes. In this case you need to take action to restore the unreachable
manager:
@z

@x
- Restart the daemon and see if the manager comes back as reachable.
- Reboot the machine.
- If neither restarting nor rebooting works, you should add another manager node or promote a worker to be a manager node. You also need to cleanly remove the failed node entry from the manager set with `docker node demote <NODE>` and `docker node rm <id-node>`.
@y
- Restart the daemon and see if the manager comes back as reachable.
- Reboot the machine.
- If neither restarting nor rebooting works, you should add another manager node or promote a worker to be a manager node. You also need to cleanly remove the failed node entry from the manager set with `docker node demote <NODE>` and `docker node rm <id-node>`.
@z

@x
Alternatively you can also get an overview of the swarm health from a manager
node with `docker node ls`:
@y
Alternatively you can also get an overview of the swarm health from a manager
node with `docker node ls`:
@z

@x
```console
$ docker node ls
ID                           HOSTNAME  MEMBERSHIP  STATUS  AVAILABILITY  MANAGER STATUS
1mhtdwhvsgr3c26xxbnzdc3yp    node05    Accepted    Ready   Active
516pacagkqp2xc3fk9t1dhjor    node02    Accepted    Ready   Active        Reachable
9ifojw8of78kkusuc4a6c23fx *  node01    Accepted    Ready   Active        Leader
ax11wdpwrrb6db3mfjydscgk7    node04    Accepted    Ready   Active
bb1nrq2cswhtbg4mrsqnlx1ck    node03    Accepted    Ready   Active        Reachable
di9wxgz8dtuh9d2hn089ecqkf    node06    Accepted    Ready   Active
```
@y
```console
$ docker node ls
ID                           HOSTNAME  MEMBERSHIP  STATUS  AVAILABILITY  MANAGER STATUS
1mhtdwhvsgr3c26xxbnzdc3yp    node05    Accepted    Ready   Active
516pacagkqp2xc3fk9t1dhjor    node02    Accepted    Ready   Active        Reachable
9ifojw8of78kkusuc4a6c23fx *  node01    Accepted    Ready   Active        Leader
ax11wdpwrrb6db3mfjydscgk7    node04    Accepted    Ready   Active
bb1nrq2cswhtbg4mrsqnlx1ck    node03    Accepted    Ready   Active        Reachable
di9wxgz8dtuh9d2hn089ecqkf    node06    Accepted    Ready   Active
```
@z

@x
## Troubleshoot a manager node
@y
## Troubleshoot a manager node
@z

@x
You should never restart a manager node by copying the `raft` directory from another node. The data directory is unique to a node ID. A node can only use a node ID once to join the swarm. The node ID space should be globally unique.
@y
You should never restart a manager node by copying the `raft` directory from another node. The data directory is unique to a node ID. A node can only use a node ID once to join the swarm. The node ID space should be globally unique.
@z

@x
To cleanly re-join a manager node to a cluster:
@y
To cleanly re-join a manager node to a cluster:
@z

@x
1. Demote the node to a worker using `docker node demote <NODE>`.
2. Remove the node from the swarm using `docker node rm <NODE>`.
3. Re-join the node to the swarm with a fresh state using `docker swarm join`.
@y
1. Demote the node to a worker using `docker node demote <NODE>`.
2. Remove the node from the swarm using `docker node rm <NODE>`.
3. Re-join the node to the swarm with a fresh state using `docker swarm join`.
@z

@x
For more information on joining a manager node to a swarm, refer to
[Join nodes to a swarm](join-nodes.md).
@y
For more information on joining a manager node to a swarm, refer to
[Join nodes to a swarm](join-nodes.md).
@z

@x
## Forcibly remove a node
@y
## Forcibly remove a node
@z

@x
In most cases, you should shut down a node before removing it from a swarm with
the `docker node rm` command. If a node becomes unreachable, unresponsive, or
compromised you can forcefully remove the node without shutting it down by
passing the `--force` flag. For instance, if `node9` becomes compromised:
@y
In most cases, you should shut down a node before removing it from a swarm with
the `docker node rm` command. If a node becomes unreachable, unresponsive, or
compromised you can forcefully remove the node without shutting it down by
passing the `--force` flag. For instance, if `node9` becomes compromised:
@z

@x
```none
$ docker node rm node9
@y
```none
$ docker node rm node9
@z

@x
Error response from daemon: rpc error: code = 9 desc = node node9 is not down and can't be removed
@y
Error response from daemon: rpc error: code = 9 desc = node node9 is not down and can't be removed
@z

@x
$ docker node rm --force node9
@y
$ docker node rm --force node9
@z

@x
Node node9 removed from swarm
```
@y
Node node9 removed from swarm
```
@z

@x
Before you forcefully remove a manager node, you must first demote it to the
worker role. Make sure that you always have an odd number of manager nodes if
you demote or remove a manager.
@y
Before you forcefully remove a manager node, you must first demote it to the
worker role. Make sure that you always have an odd number of manager nodes if
you demote or remove a manager.
@z

@x
## Back up the swarm
@y
## Back up the swarm
@z

@x
Docker manager nodes store the swarm state and manager logs in the
`/var/lib/docker/swarm/` directory. This data includes the keys used to encrypt
the Raft logs. Without these keys, you cannot restore the swarm.
@y
Docker manager nodes store the swarm state and manager logs in the
`/var/lib/docker/swarm/` directory. This data includes the keys used to encrypt
the Raft logs. Without these keys, you cannot restore the swarm.
@z

@x
You can back up the swarm using any manager. Use the following procedure.
@y
You can back up the swarm using any manager. Use the following procedure.
@z

@x
1.  If the swarm has auto-lock enabled, you need the unlock key
    to restore the swarm from backup. Retrieve the unlock key if necessary and
    store it in a safe location. If you are unsure, read
    [Lock your swarm to protect its encryption key](swarm_manager_locking.md).
@y
1.  If the swarm has auto-lock enabled, you need the unlock key
    to restore the swarm from backup. Retrieve the unlock key if necessary and
    store it in a safe location. If you are unsure, read
    [Lock your swarm to protect its encryption key](swarm_manager_locking.md).
@z

@x
2.  Stop Docker on the manager before backing up the data, so that no data is
    being changed during the backup. It is possible to take a backup while the
    manager is running (a "hot" backup), but this is not recommended and your
    results are less predictable when restoring. While the manager is down,
    other nodes continue generating swarm data that is not part of this backup.
@y
2.  Stop Docker on the manager before backing up the data, so that no data is
    being changed during the backup. It is possible to take a backup while the
    manager is running (a "hot" backup), but this is not recommended and your
    results are less predictable when restoring. While the manager is down,
    other nodes continue generating swarm data that is not part of this backup.
@z

@x
    > [!NOTE]
    > 
    > Be sure to maintain the quorum of swarm managers. During the
    > time that a manager is shut down, your swarm is more vulnerable to
    > losing the quorum if further nodes are lost. The number of managers you
    > run is a trade-off. If you regularly take down managers to do backups,
    > consider running a five manager swarm, so that you can lose an additional
    > manager while the backup is running, without disrupting your services.
@y
    > [!NOTE]
    > 
    > Be sure to maintain the quorum of swarm managers. During the
    > time that a manager is shut down, your swarm is more vulnerable to
    > losing the quorum if further nodes are lost. The number of managers you
    > run is a trade-off. If you regularly take down managers to do backups,
    > consider running a five manager swarm, so that you can lose an additional
    > manager while the backup is running, without disrupting your services.
@z

@x
3.  Back up the entire `/var/lib/docker/swarm` directory.
@y
3.  Back up the entire `/var/lib/docker/swarm` directory.
@z

@x
4.  Restart the manager.
@y
4.  Restart the manager.
@z

@x
To restore, see [Restore from a backup](#restore-from-a-backup). 
@y
To restore, see [Restore from a backup](#restore-from-a-backup). 
@z

@x
## Recover from disaster
@y
## Recover from disaster
@z

@x
### Restore from a backup
@y
### Restore from a backup
@z

@x
After backing up the swarm as described in
[Back up the swarm](#back-up-the-swarm), use the following procedure to
restore the data to a new swarm.
@y
After backing up the swarm as described in
[Back up the swarm](#back-up-the-swarm), use the following procedure to
restore the data to a new swarm.
@z

@x
1.  Shut down Docker on the target host machine for the restored swarm.
@y
1.  Shut down Docker on the target host machine for the restored swarm.
@z

@x
2.  Remove the contents of the `/var/lib/docker/swarm` directory on the new
    swarm.
@y
2.  Remove the contents of the `/var/lib/docker/swarm` directory on the new
    swarm.
@z

@x
3.  Restore the `/var/lib/docker/swarm` directory with the contents of the
    backup.
@y
3.  Restore the `/var/lib/docker/swarm` directory with the contents of the
    backup.
@z

@x
    > [!NOTE]
    > 
    > The new node uses the same encryption key for on-disk
    > storage as the old one. It is not possible to change the on-disk storage
    > encryption keys at this time.
    >
    > In the case of a swarm with auto-lock enabled, the unlock key is also the
    > same as on the old swarm, and the unlock key is needed to restore the
    > swarm.
@y
    > [!NOTE]
    > 
    > The new node uses the same encryption key for on-disk
    > storage as the old one. It is not possible to change the on-disk storage
    > encryption keys at this time.
    >
    > In the case of a swarm with auto-lock enabled, the unlock key is also the
    > same as on the old swarm, and the unlock key is needed to restore the
    > swarm.
@z

@x
4.  Start Docker on the new node. Unlock the swarm if necessary. Re-initialize
    the swarm using the following command, so that this node does not attempt
    to connect to nodes that were part of the old swarm, and presumably no
    longer exist.
@y
4.  Start Docker on the new node. Unlock the swarm if necessary. Re-initialize
    the swarm using the following command, so that this node does not attempt
    to connect to nodes that were part of the old swarm, and presumably no
    longer exist.
@z

@x
    ```console
    $ docker swarm init --force-new-cluster
    ```
@y
    ```console
    $ docker swarm init --force-new-cluster
    ```
@z

@x
5.  Verify that the state of the swarm is as expected. This may include
    application-specific tests or simply checking the output of
    `docker service ls` to be sure that all expected services are present.
@y
5.  Verify that the state of the swarm is as expected. This may include
    application-specific tests or simply checking the output of
    `docker service ls` to be sure that all expected services are present.
@z

@x
6.  If you use auto-lock,
    [rotate the unlock key](swarm_manager_locking.md#rotate-the-unlock-key).
@y
6.  If you use auto-lock,
    [rotate the unlock key](swarm_manager_locking.md#rotate-the-unlock-key).
@z

@x
7.  Add manager and worker nodes to bring your new swarm up to operating
    capacity.
@y
7.  Add manager and worker nodes to bring your new swarm up to operating
    capacity.
@z

@x
8.  Reinstate your previous backup regimen on the new swarm.
@y
8.  Reinstate your previous backup regimen on the new swarm.
@z

@x
### Recover from losing the quorum
@y
### Recover from losing the quorum
@z

@x
Swarm is resilient to failures and can recover from any number
of temporary node failures (machine reboots or crash with restart) or other
transient errors. However, a swarm cannot automatically recover if it loses a
quorum. Tasks on existing worker nodes continue to run, but administrative
tasks are not possible, including scaling or updating services and joining or
removing nodes from the swarm. The best way to recover is to bring the missing
manager nodes back online. If that is not possible, continue reading for some
options for recovering your swarm.
@y
Swarm is resilient to failures and can recover from any number
of temporary node failures (machine reboots or crash with restart) or other
transient errors. However, a swarm cannot automatically recover if it loses a
quorum. Tasks on existing worker nodes continue to run, but administrative
tasks are not possible, including scaling or updating services and joining or
removing nodes from the swarm. The best way to recover is to bring the missing
manager nodes back online. If that is not possible, continue reading for some
options for recovering your swarm.
@z

@x
In a swarm of `N` managers, a quorum (a majority) of manager nodes must always
be available. For example, in a swarm with five managers, a minimum of three must be
operational and in communication with each other. In other words, the swarm can
tolerate up to `(N-1)/2` permanent failures beyond which requests involving
swarm management cannot be processed. These types of failures include data
corruption or hardware failures.
@y
In a swarm of `N` managers, a quorum (a majority) of manager nodes must always
be available. For example, in a swarm with five managers, a minimum of three must be
operational and in communication with each other. In other words, the swarm can
tolerate up to `(N-1)/2` permanent failures beyond which requests involving
swarm management cannot be processed. These types of failures include data
corruption or hardware failures.
@z

@x
If you lose the quorum of managers, you cannot administer the swarm. If you have
lost the quorum and you attempt to perform any management operation on the swarm,
an error occurs:
@y
If you lose the quorum of managers, you cannot administer the swarm. If you have
lost the quorum and you attempt to perform any management operation on the swarm,
an error occurs:
@z

@x
```none
Error response from daemon: rpc error: code = 4 desc = context deadline exceeded
```
@y
```none
Error response from daemon: rpc error: code = 4 desc = context deadline exceeded
```
@z

@x
The best way to recover from losing the quorum is to bring the failed nodes back
online. If you can't do that, the only way to recover from this state is to use
the `--force-new-cluster` action from a manager node. This removes all managers
except the manager the command was run from. The quorum is achieved because
there is now only one manager. Promote nodes to be managers until you have the
desired number of managers.
@y
The best way to recover from losing the quorum is to bring the failed nodes back
online. If you can't do that, the only way to recover from this state is to use
the `--force-new-cluster` action from a manager node. This removes all managers
except the manager the command was run from. The quorum is achieved because
there is now only one manager. Promote nodes to be managers until you have the
desired number of managers.
@z

@x
From the node to recover, run:
@y
From the node to recover, run:
@z

@x
```console
$ docker swarm init --force-new-cluster --advertise-addr node01:2377
```
@y
```console
$ docker swarm init --force-new-cluster --advertise-addr node01:2377
```
@z

@x
When you run the `docker swarm init` command with the `--force-new-cluster`
flag, the Docker Engine where you run the command becomes the manager node of a
single-node swarm which is capable of managing and running services. The manager
has all the previous information about services and tasks, worker nodes are
still part of the swarm, and services are still running. You need to add or
re-add  manager nodes to achieve your previous task distribution and ensure that
you have enough managers to maintain high availability and prevent losing the
quorum.
@y
When you run the `docker swarm init` command with the `--force-new-cluster`
flag, the Docker Engine where you run the command becomes the manager node of a
single-node swarm which is capable of managing and running services. The manager
has all the previous information about services and tasks, worker nodes are
still part of the swarm, and services are still running. You need to add or
re-add  manager nodes to achieve your previous task distribution and ensure that
you have enough managers to maintain high availability and prevent losing the
quorum.
@z

@x
## Force the swarm to rebalance
@y
## Force the swarm to rebalance
@z

@x
Generally, you do not need to force the swarm to rebalance its tasks. When you
add a new node to a swarm, or a node reconnects to the swarm after a
period of unavailability, the swarm does not automatically give a workload to
the idle node. This is a design decision. If the swarm periodically shifted tasks
to different nodes for the sake of balance, the clients using those tasks would
be disrupted. The goal is to avoid disrupting running services for the sake of
balance across the swarm. When new tasks start, or when a node with running
tasks becomes unavailable, those tasks are given to less busy nodes. The goal
is eventual balance, with minimal disruption to the end user.
@y
Generally, you do not need to force the swarm to rebalance its tasks. When you
add a new node to a swarm, or a node reconnects to the swarm after a
period of unavailability, the swarm does not automatically give a workload to
the idle node. This is a design decision. If the swarm periodically shifted tasks
to different nodes for the sake of balance, the clients using those tasks would
be disrupted. The goal is to avoid disrupting running services for the sake of
balance across the swarm. When new tasks start, or when a node with running
tasks becomes unavailable, those tasks are given to less busy nodes. The goal
is eventual balance, with minimal disruption to the end user.
@z

@x
You can use the `--force` or `-f` flag with the `docker service update` command
to force the service to redistribute its tasks across the available worker nodes.
This causes the service tasks to restart. Client applications may be disrupted.
If you have configured it, your service uses a [rolling update](swarm-tutorial/rolling-update.md).
@y
You can use the `--force` or `-f` flag with the `docker service update` command
to force the service to redistribute its tasks across the available worker nodes.
This causes the service tasks to restart. Client applications may be disrupted.
If you have configured it, your service uses a [rolling update](swarm-tutorial/rolling-update.md).
@z

@x
If you use an earlier version and you want to achieve an even balance of load
across workers and don't mind disrupting running tasks, you can force your swarm
to re-balance by temporarily scaling the service upward. Use
`docker service inspect --pretty <servicename>` to see the configured scale
of a service. When you use `docker service scale`, the nodes with the lowest
number of tasks are targeted to receive the new workloads. There may be multiple
under-loaded nodes in your swarm. You may need to scale the service up by modest
increments a few times to achieve the balance you want across all the nodes.
@y
If you use an earlier version and you want to achieve an even balance of load
across workers and don't mind disrupting running tasks, you can force your swarm
to re-balance by temporarily scaling the service upward. Use
`docker service inspect --pretty <servicename>` to see the configured scale
of a service. When you use `docker service scale`, the nodes with the lowest
number of tasks are targeted to receive the new workloads. There may be multiple
under-loaded nodes in your swarm. You may need to scale the service up by modest
increments a few times to achieve the balance you want across all the nodes.
@z

@x
When the load is balanced to your satisfaction, you can scale the service back
down to the original scale. You can use `docker service ps` to assess the current
balance of your service across nodes.
@y
When the load is balanced to your satisfaction, you can scale the service back
down to the original scale. You can use `docker service ps` to assess the current
balance of your service across nodes.
@z

@x
See also
[`docker service scale`](../../reference/cli/docker/service/scale.md) and
[`docker service ps`](../../reference/cli/docker/service/ps.md).
@y
See also
[`docker service scale`](../../reference/cli/docker/service/scale.md) and
[`docker service ps`](../../reference/cli/docker/service/ps.md).
@z
