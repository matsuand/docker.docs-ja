%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: Manage existing nodes in a swarm
keywords: guide, swarm mode, node
title: Manage nodes in a swarm
@y
description: Manage existing nodes in a swarm
keywords: guide, swarm mode, node
title: Manage nodes in a swarm
@z

@x
As part of the swarm management lifecycle, you may need to:
@y
As part of the swarm management lifecycle, you may need to:
@z

@x
* [List nodes in the swarm](#list-nodes)
* [Inspect an individual node](#inspect-an-individual-node)
* [Update a node](#update-a-node)
* [Leave the swarm](#leave-the-swarm)
@y
* [List nodes in the swarm](#list-nodes)
* [Inspect an individual node](#inspect-an-individual-node)
* [Update a node](#update-a-node)
* [Leave the swarm](#leave-the-swarm)
@z

@x
## List nodes
@y
## List nodes
@z

@x
To view a list of nodes in the swarm run `docker node ls` from a manager node:
@y
To view a list of nodes in the swarm run `docker node ls` from a manager node:
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
46aqrk4e473hjbt745z53cr3t    node-5    Ready   Active        Reachable
61pi3d91s0w3b90ijw3deeb2q    node-4    Ready   Active        Reachable
a5b2m3oghd48m8eu391pefq5u    node-3    Ready   Active
e7p8btxeu3ioshyuj6lxiv6g0    node-2    Ready   Active
ehkv3bcimagdese79dn78otj5 *  node-1    Ready   Active        Leader
```
@y
ID                           HOSTNAME  STATUS  AVAILABILITY  MANAGER STATUS
46aqrk4e473hjbt745z53cr3t    node-5    Ready   Active        Reachable
61pi3d91s0w3b90ijw3deeb2q    node-4    Ready   Active        Reachable
a5b2m3oghd48m8eu391pefq5u    node-3    Ready   Active
e7p8btxeu3ioshyuj6lxiv6g0    node-2    Ready   Active
ehkv3bcimagdese79dn78otj5 *  node-1    Ready   Active        Leader
```
@z

@x
The `AVAILABILITY` column shows whether or not the scheduler can assign tasks to
the node:
@y
The `AVAILABILITY` column shows whether or not the scheduler can assign tasks to
the node:
@z

@x
* `Active` means that the scheduler can assign tasks to the node.
* `Pause` means the scheduler doesn't assign new tasks to the node, but existing
  tasks remain running.
* `Drain` means the scheduler doesn't assign new tasks to the node. The
   scheduler shuts down any existing tasks and schedules them on an available
   node.
@y
* `Active` means that the scheduler can assign tasks to the node.
* `Pause` means the scheduler doesn't assign new tasks to the node, but existing
  tasks remain running.
* `Drain` means the scheduler doesn't assign new tasks to the node. The
   scheduler shuts down any existing tasks and schedules them on an available
   node.
@z

@x
The `MANAGER STATUS` column shows node participation in the Raft consensus:
@y
The `MANAGER STATUS` column shows node participation in the Raft consensus:
@z

@x
* No value indicates a worker node that does not participate in swarm
  management.
* `Leader` means the node is the primary manager node that makes all swarm
  management and orchestration decisions for the swarm.
* `Reachable` means the node is a manager node participating in the Raft
  consensus quorum. If the leader node becomes unavailable, the node is eligible for
  election as the new leader.
* `Unavailable` means the node is a manager that can't communicate with
  other managers. If a manager node becomes unavailable, you should either join a
  new manager node to the swarm or promote a worker node to be a
  manager.
@y
* No value indicates a worker node that does not participate in swarm
  management.
* `Leader` means the node is the primary manager node that makes all swarm
  management and orchestration decisions for the swarm.
* `Reachable` means the node is a manager node participating in the Raft
  consensus quorum. If the leader node becomes unavailable, the node is eligible for
  election as the new leader.
* `Unavailable` means the node is a manager that can't communicate with
  other managers. If a manager node becomes unavailable, you should either join a
  new manager node to the swarm or promote a worker node to be a
  manager.
@z

@x
For more information on swarm administration refer to the [Swarm administration guide](admin_guide.md).
@y
For more information on swarm administration refer to the [Swarm administration guide](admin_guide.md).
@z

@x
## Inspect an individual node
@y
## Inspect an individual node
@z

@x
You can run `docker node inspect <NODE-ID>` on a manager node to view the
details for an individual node. The output defaults to JSON format, but you can
pass the `--pretty` flag to print the results in human-readable format. For example:
@y
You can run `docker node inspect <NODE-ID>` on a manager node to view the
details for an individual node. The output defaults to JSON format, but you can
pass the `--pretty` flag to print the results in human-readable format. For example:
@z

@x
```console
$ docker node inspect self --pretty
@y
```console
$ docker node inspect self --pretty
@z

@x
ID:                     ehkv3bcimagdese79dn78otj5
Hostname:               node-1
Joined at:              2016-06-16 22:52:44.9910662 +0000 utc
Status:
 State:                 Ready
 Availability:          Active
Manager Status:
 Address:               172.17.0.2:2377
 Raft Status:           Reachable
 Leader:                Yes
Platform:
 Operating System:      linux
 Architecture:          x86_64
Resources:
 CPUs:                  2
 Memory:                1.954 GiB
Plugins:
  Network:              overlay, host, bridge, overlay, null
  Volume:               local
Engine Version:         1.12.0-dev
```
@y
ID:                     ehkv3bcimagdese79dn78otj5
Hostname:               node-1
Joined at:              2016-06-16 22:52:44.9910662 +0000 utc
Status:
 State:                 Ready
 Availability:          Active
Manager Status:
 Address:               172.17.0.2:2377
 Raft Status:           Reachable
 Leader:                Yes
Platform:
 Operating System:      linux
 Architecture:          x86_64
Resources:
 CPUs:                  2
 Memory:                1.954 GiB
Plugins:
  Network:              overlay, host, bridge, overlay, null
  Volume:               local
Engine Version:         1.12.0-dev
```
@z

@x
## Update a node
@y
## Update a node
@z

@x
You can modify node attributes to:
@y
You can modify node attributes to:
@z

@x
* [Change node availability](#change-node-availability)
* [Add or remove label metadata](#add-or-remove-label-metadata)
* [Change a node role](#promote-or-demote-a-node)
@y
* [Change node availability](#change-node-availability)
* [Add or remove label metadata](#add-or-remove-label-metadata)
* [Change a node role](#promote-or-demote-a-node)
@z

@x
### Change node availability
@y
### Change node availability
@z

@x
Changing node availability lets you:
@y
Changing node availability lets you:
@z

@x
* Drain a manager node so that it only performs swarm management tasks and is
  unavailable for task assignment.
* Drain a node so you can take it down for maintenance.
* Pause a node so it can't receive new tasks.
* Restore unavailable or paused nodes availability status.
@y
* Drain a manager node so that it only performs swarm management tasks and is
  unavailable for task assignment.
* Drain a node so you can take it down for maintenance.
* Pause a node so it can't receive new tasks.
* Restore unavailable or paused nodes availability status.
@z

@x
For example, to change a manager node to `Drain` availability:
@y
For example, to change a manager node to `Drain` availability:
@z

@x
```console
$ docker node update --availability drain node-1
@y
```console
$ docker node update --availability drain node-1
@z

@x
node-1
```
@y
node-1
```
@z

@x
See [list nodes](#list-nodes) for descriptions of the different availability
options.
@y
See [list nodes](#list-nodes) for descriptions of the different availability
options.
@z

@x
### Add or remove label metadata
@y
### Add or remove label metadata
@z

@x
Node labels provide a flexible method of node organization. You can also use
node labels in service constraints. Apply constraints when you create a service
to limit the nodes where the scheduler assigns tasks for the service.
@y
Node labels provide a flexible method of node organization. You can also use
node labels in service constraints. Apply constraints when you create a service
to limit the nodes where the scheduler assigns tasks for the service.
@z

@x
Run `docker node update --label-add` on a manager node to add label metadata to
a node. The `--label-add` flag supports either a `<key>` or a `<key>=<value>`
pair.
@y
Run `docker node update --label-add` on a manager node to add label metadata to
a node. The `--label-add` flag supports either a `<key>` or a `<key>=<value>`
pair.
@z

@x
Pass the `--label-add` flag once for each node label you want to add:
@y
Pass the `--label-add` flag once for each node label you want to add:
@z

@x
```console
$ docker node update --label-add foo --label-add bar=baz node-1
@y
```console
$ docker node update --label-add foo --label-add bar=baz node-1
@z

@x
node-1
```
@y
node-1
```
@z

@x
The labels you set for nodes using `docker node update` apply only to the node
entity within the swarm. Do not confuse them with the Docker daemon labels for
[dockerd](/engine/manage-resources/labels.md).
@y
The labels you set for nodes using `docker node update` apply only to the node
entity within the swarm. Do not confuse them with the Docker daemon labels for
[dockerd](engine/manage-resources/labels.md).
@z

@x
Therefore, node labels can be used to limit critical tasks to nodes that meet
certain requirements. For example, schedule only on machines where special
workloads should be run, such as machines that meet [PCI-SS
compliance](https://www.pcisecuritystandards.org/).
@y
Therefore, node labels can be used to limit critical tasks to nodes that meet
certain requirements. For example, schedule only on machines where special
workloads should be run, such as machines that meet [PCI-SS
compliance](https://www.pcisecuritystandards.org/).
@z

@x
A compromised worker could not compromise these special workloads because it
cannot change node labels.
@y
A compromised worker could not compromise these special workloads because it
cannot change node labels.
@z

@x
Engine labels, however, are still useful because some features that do not
affect secure orchestration of containers might be better off set in a
decentralized manner. For instance, an engine could have a label to indicate
that it has a certain type of disk device, which may not be relevant to security
directly. These labels are more easily "trusted" by the swarm orchestrator.
@y
Engine labels, however, are still useful because some features that do not
affect secure orchestration of containers might be better off set in a
decentralized manner. For instance, an engine could have a label to indicate
that it has a certain type of disk device, which may not be relevant to security
directly. These labels are more easily "trusted" by the swarm orchestrator.
@z

@x
Refer to the `docker service create` [CLI reference](../../reference/cli/docker/service/create.md)
for more information about service constraints.
@y
Refer to the `docker service create` [CLI reference](../../reference/cli/docker/service/create.md)
for more information about service constraints.
@z

@x
### Promote or demote a node
@y
### Promote or demote a node
@z

@x
You can promote a worker node to the manager role. This is useful when a
manager node becomes unavailable or if you want to take a manager offline for
maintenance. Similarly, you can demote a manager node to the worker role.
@y
You can promote a worker node to the manager role. This is useful when a
manager node becomes unavailable or if you want to take a manager offline for
maintenance. Similarly, you can demote a manager node to the worker role.
@z

@x
> [!NOTE]
>
> Regardless of your reason to promote or demote
> a node, you must always maintain a quorum of manager nodes in the
> swarm. For more information refer to the [Swarm administration guide](admin_guide.md).
@y
> [!NOTE]
>
> Regardless of your reason to promote or demote
> a node, you must always maintain a quorum of manager nodes in the
> swarm. For more information refer to the [Swarm administration guide](admin_guide.md).
@z

@x
To promote a node or set of nodes, run `docker node promote` from a manager
node:
@y
To promote a node or set of nodes, run `docker node promote` from a manager
node:
@z

@x
```console
$ docker node promote node-3 node-2
@y
```console
$ docker node promote node-3 node-2
@z

@x
Node node-3 promoted to a manager in the swarm.
Node node-2 promoted to a manager in the swarm.
```
@y
Node node-3 promoted to a manager in the swarm.
Node node-2 promoted to a manager in the swarm.
```
@z

@x
To demote a node or set of nodes, run `docker node demote` from a manager node:
@y
To demote a node or set of nodes, run `docker node demote` from a manager node:
@z

@x
```console
$ docker node demote node-3 node-2
@y
```console
$ docker node demote node-3 node-2
@z

@x
Manager node-3 demoted in the swarm.
Manager node-2 demoted in the swarm.
```
@y
Manager node-3 demoted in the swarm.
Manager node-2 demoted in the swarm.
```
@z

@x
`docker node promote` and `docker node demote` are convenience commands for
`docker node update --role manager` and `docker node update --role worker`
respectively.
@y
`docker node promote` and `docker node demote` are convenience commands for
`docker node update --role manager` and `docker node update --role worker`
respectively.
@z

@x
## Install plugins on swarm nodes
@y
## Install plugins on swarm nodes
@z

@x
If your swarm service relies on one or more
[plugins](/engine/extend/plugin_api/), these plugins need to be available on
every node where the service could potentially be deployed. You can manually
install the plugin on each node or script the installation. You can also deploy
the plugin in a similar way as a global service using the Docker API, by specifying
a `PluginSpec` instead of a `ContainerSpec`.
@y
If your swarm service relies on one or more
[plugins](__SUBDIR__/engine/extend/plugin_api/), these plugins need to be available on
every node where the service could potentially be deployed. You can manually
install the plugin on each node or script the installation. You can also deploy
the plugin in a similar way as a global service using the Docker API, by specifying
a `PluginSpec` instead of a `ContainerSpec`.
@z

@x
> [!NOTE]
>
> There is currently no way to deploy a plugin to a swarm using the
> Docker CLI or Docker Compose. In addition, it is not possible to install
> plugins from a private repository.
@y
> [!NOTE]
>
> There is currently no way to deploy a plugin to a swarm using the
> Docker CLI or Docker Compose. In addition, it is not possible to install
> plugins from a private repository.
@z

@x
The [`PluginSpec`](/engine/extend/plugin_api/#json-specification)
is defined by the plugin developer. To add the plugin to all Docker nodes, use
the [`service/create`](/reference/api/engine/v1.31/#operation/ServiceCreate) API, passing
the `PluginSpec` JSON defined in the `TaskTemplate`.
@y
The [`PluginSpec`](/engine/extend/plugin_api/#json-specification)
is defined by the plugin developer. To add the plugin to all Docker nodes, use
the [`service/create`](__SUBDIR__/reference/api/engine/v1.31/#operation/ServiceCreate) API, passing
the `PluginSpec` JSON defined in the `TaskTemplate`.
@z

@x
## Leave the swarm
@y
## Leave the swarm
@z

@x
Run the `docker swarm leave` command on a node to remove it from the swarm.
@y
Run the `docker swarm leave` command on a node to remove it from the swarm.
@z

@x
For example to leave the swarm on a worker node:
@y
For example to leave the swarm on a worker node:
@z

@x
```console
$ docker swarm leave
@y
```console
$ docker swarm leave
@z

@x
Node left the swarm.
```
@y
Node left the swarm.
```
@z

@x
When a node leaves the swarm, Docker Engine stops running in Swarm
mode. The orchestrator no longer schedules tasks to the node.
@y
When a node leaves the swarm, Docker Engine stops running in Swarm
mode. The orchestrator no longer schedules tasks to the node.
@z

@x
If the node is a manager node, you receive a warning about maintaining the
quorum. To override the warning, pass the `--force` flag. If the last manager
node leaves the swarm, the swarm becomes unavailable requiring you to take
disaster recovery measures.
@y
If the node is a manager node, you receive a warning about maintaining the
quorum. To override the warning, pass the `--force` flag. If the last manager
node leaves the swarm, the swarm becomes unavailable requiring you to take
disaster recovery measures.
@z

@x
For information about maintaining a quorum and disaster recovery, refer to the
[Swarm administration guide](admin_guide.md).
@y
For information about maintaining a quorum and disaster recovery, refer to the
[Swarm administration guide](admin_guide.md).
@z

@x
After a node leaves the swarm, you can run `docker node rm` on a
manager node to remove the node from the node list.
@y
After a node leaves the swarm, you can run `docker node rm` on a
manager node to remove the node from the node list.
@z

@x
For instance:
@y
For instance:
@z

@x
```console
$ docker node rm node-2
```
@y
```console
$ docker node rm node-2
```
@z

@x
## Learn more
@y
## Learn more
@z

@x
* [Swarm administration guide](admin_guide.md)
* [Docker Engine command line reference](../../reference/cli/docker/)
* [Swarm mode tutorial](swarm-tutorial/index.md)
@y
* [Swarm administration guide](admin_guide.md)
* [Docker Engine command line reference](../../reference/cli/docker/)
* [Swarm mode tutorial](swarm-tutorial/index.md)
@z
