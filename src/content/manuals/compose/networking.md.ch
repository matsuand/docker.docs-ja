%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

@x
description: How Docker Compose sets up networking between containers
keywords: documentation, docs, docker, compose, orchestration, containers, networking
title: Networking in Compose
@y
description: How Docker Compose sets up networking between containers
keywords: documentation, docs, docker, compose, orchestration, containers, networking
title: Networking in Compose
@z

@x
{{< include "compose-eol.md" >}}
@y
{{< include "compose-eol.md" >}}
@z

@x
By default Compose sets up a single
[network](/reference/cli/docker/network/create.md) for your app. Each
container for a service joins the default network and is both reachable by
other containers on that network, and discoverable by the service's name.
@y
By default Compose sets up a single
[network](reference/cli/docker/network/create.md) for your app. Each
container for a service joins the default network and is both reachable by
other containers on that network, and discoverable by the service's name.
@z

@x
> [!NOTE]
>
> Your app's network is given a name based on the "project name",
> which is based on the name of the directory it lives in. You can override the
> project name with either the [`--project-name` flag](reference/_index.md)
> or the [`COMPOSE_PROJECT_NAME` environment variable](environment-variables/envvars.md#compose_project_name).
@y
> [!NOTE]
>
> Your app's network is given a name based on the "project name",
> which is based on the name of the directory it lives in. You can override the
> project name with either the [`--project-name` flag](reference/_index.md)
> or the [`COMPOSE_PROJECT_NAME` environment variable](environment-variables/envvars.md#compose_project_name).
@z

@x
For example, suppose your app is in a directory called `myapp`, and your `compose.yml` looks like this:
@y
For example, suppose your app is in a directory called `myapp`, and your `compose.yml` looks like this:
@z

% snip code...

@x
When you run `docker compose up`, the following happens:
@y
When you run `docker compose up`, the following happens:
@z

@x
1.  A network called `myapp_default` is created.
2.  A container is created using `web`'s configuration. It joins the network
    `myapp_default` under the name `web`.
3.  A container is created using `db`'s configuration. It joins the network
    `myapp_default` under the name `db`.
@y
1.  A network called `myapp_default` is created.
2.  A container is created using `web`'s configuration. It joins the network
    `myapp_default` under the name `web`.
3.  A container is created using `db`'s configuration. It joins the network
    `myapp_default` under the name `db`.
@z

@x
Each container can now look up the service name `web` or `db` and
get back the appropriate container's IP address. For example, `web`'s
application code could connect to the URL `postgres://db:5432` and start
using the Postgres database.
@y
Each container can now look up the service name `web` or `db` and
get back the appropriate container's IP address. For example, `web`'s
application code could connect to the URL `postgres://db:5432` and start
using the Postgres database.
@z

@x
It is important to note the distinction between `HOST_PORT` and `CONTAINER_PORT`.
In the above example, for `db`, the `HOST_PORT` is `8001` and the container port is
`5432` (postgres default). Networked service-to-service
communication uses the `CONTAINER_PORT`. When `HOST_PORT` is defined,
the service is accessible outside the swarm as well.
@y
It is important to note the distinction between `HOST_PORT` and `CONTAINER_PORT`.
In the above example, for `db`, the `HOST_PORT` is `8001` and the container port is
`5432` (postgres default). Networked service-to-service
communication uses the `CONTAINER_PORT`. When `HOST_PORT` is defined,
the service is accessible outside the swarm as well.
@z

@x
Within the `web` container, your connection string to `db` would look like
`postgres://db:5432`, and from the host machine, the connection string would
look like `postgres://{DOCKER_IP}:8001` for example `postgres://localhost:8001` if your container is running locally.
@y
Within the `web` container, your connection string to `db` would look like
`postgres://db:5432`, and from the host machine, the connection string would
look like `postgres://{DOCKER_IP}:8001` for example `postgres://localhost:8001` if your container is running locally.
@z

@x
## Update containers on the network
@y
## Update containers on the network
@z

@x
If you make a configuration change to a service and run `docker compose up` to update it, the old container is removed and the new one joins the network under a different IP address but the same name. Running containers can look up that name and connect to the new address, but the old address stops working.
@y
If you make a configuration change to a service and run `docker compose up` to update it, the old container is removed and the new one joins the network under a different IP address but the same name. Running containers can look up that name and connect to the new address, but the old address stops working.
@z

@x
If any containers have connections open to the old container, they are closed. It is a container's responsibility to detect this condition, look up the name again and reconnect.
@y
If any containers have connections open to the old container, they are closed. It is a container's responsibility to detect this condition, look up the name again and reconnect.
@z

@x
> [!TIP]
>
> Reference containers by name, not IP, whenever possible. Otherwise you’ll need to constantly update the IP address you use.
@y
> [!TIP]
>
> Reference containers by name, not IP, whenever possible. Otherwise you’ll need to constantly update the IP address you use.
@z

@x
## Link containers
@y
## Link containers
@z

@x
Links allow you to define extra aliases by which a service is reachable from another service. They are not required to enable services to communicate. By default, any service can reach any other service at that service's name. In the following example, `db` is reachable from `web` at the hostnames `db` and `database`:
@y
Links allow you to define extra aliases by which a service is reachable from another service. They are not required to enable services to communicate. By default, any service can reach any other service at that service's name. In the following example, `db` is reachable from `web` at the hostnames `db` and `database`:
@z

% snip code...

@x
See the [links reference](/reference/compose-file/services.md#links) for more information.
@y
See the [links reference](reference/compose-file/services.md#links) for more information.
@z

@x
## Multi-host networking
@y
## Multi-host networking
@z

@x
When deploying a Compose application on a Docker Engine with [Swarm mode enabled](/manuals/engine/swarm/_index.md),
you can make use of the built-in `overlay` driver to enable multi-host communication.
@y
When deploying a Compose application on a Docker Engine with [Swarm mode enabled](manuals/engine/swarm/_index.md),
you can make use of the built-in `overlay` driver to enable multi-host communication.
@z

@x
Overlay networks are always created as `attachable`. You can optionally set the [`attachable`](/reference/compose-file/networks.md#attachable) property to `false`.
@y
Overlay networks are always created as `attachable`. You can optionally set the [`attachable`](reference/compose-file/networks.md#attachable) property to `false`.
@z

@x
Consult the [Swarm mode section](/manuals/engine/swarm/_index.md), to see how to set up
a Swarm cluster, and the [Getting started with multi-host networking](/manuals/engine/network/tutorials/overlay.md)
to learn about multi-host overlay networks.
@y
Consult the [Swarm mode section](manuals/engine/swarm/_index.md), to see how to set up
a Swarm cluster, and the [Getting started with multi-host networking](manuals/engine/network/tutorials/overlay.md)
to learn about multi-host overlay networks.
@z

@x
## Specify custom networks
@y
## Specify custom networks
@z

@x
Instead of just using the default app network, you can specify your own networks with the top-level `networks` key. This lets you create more complex topologies and specify [custom network drivers](/engine/extend/plugins_network/) and options. You can also use it to connect services to externally-created networks which aren't managed by Compose.
@y
Instead of just using the default app network, you can specify your own networks with the top-level `networks` key. This lets you create more complex topologies and specify [custom network drivers](__SUBDIR__/engine/extend/plugins_network/) and options. You can also use it to connect services to externally-created networks which aren't managed by Compose.
@z

@x
Each service can specify what networks to connect to with the service-level `networks` key, which is a list of names referencing entries under the top-level `networks` key.
@y
Each service can specify what networks to connect to with the service-level `networks` key, which is a list of names referencing entries under the top-level `networks` key.
@z

@x
The following example shows a Compose file which defines two custom networks. The `proxy` service is isolated from the `db` service, because they do not share a network in common. Only `app` can talk to both.
@y
The following example shows a Compose file which defines two custom networks. The `proxy` service is isolated from the `db` service, because they do not share a network in common. Only `app` can talk to both.
@z

% snip code...

@x
Networks can be configured with static IP addresses by setting the [ipv4_address and/or ipv6_address](/reference/compose-file/services.md#ipv4_address-ipv6_address) for each attached network.
@y
Networks can be configured with static IP addresses by setting the [ipv4_address and/or ipv6_address](reference/compose-file/services.md#ipv4_address-ipv6_address) for each attached network.
@z

@x
Networks can also be given a [custom name](/reference/compose-file/networks.md#name):
@y
Networks can also be given a [custom name](reference/compose-file/networks.md#name):
@z

% snip code...

@x
## Configure the default network
@y
## Configure the default network
@z

@x
Instead of, or as well as, specifying your own networks, you can also change the settings of the app-wide default network by defining an entry under `networks` named `default`:
@y
Instead of, or as well as, specifying your own networks, you can also change the settings of the app-wide default network by defining an entry under `networks` named `default`:
@z

% snip code...

@x
## Use a pre-existing network
@y
## Use a pre-existing network
@z

@x
If you want your containers to join a pre-existing network, use the [`external` option](/reference/compose-file/networks.md#external)
@y
If you want your containers to join a pre-existing network, use the [`external` option](reference/compose-file/networks.md#external)
@z

% snip code...

@x
Instead of attempting to create a network called `[projectname]_default`, Compose looks for a network called `my-pre-existing-network` and connects your app's containers to it.
@y
Instead of attempting to create a network called `[projectname]_default`, Compose looks for a network called `my-pre-existing-network` and connects your app's containers to it.
@z

@x
## Further reference information 
@y
## Further reference information 
@z

@x
For full details of the network configuration options available, see the following references:
@y
For full details of the network configuration options available, see the following references:
@z

@x
- [Top-level `networks` element](/reference/compose-file/networks.md)
- [Service-level `networks` attribute](/reference/compose-file/services.md#networks)
@y
- [Top-level `networks` element](reference/compose-file/networks.md)
- [Service-level `networks` attribute](reference/compose-file/services.md#networks)
@z
