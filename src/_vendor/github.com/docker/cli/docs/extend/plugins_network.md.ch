%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker network driver plugins
description: "Network driver plugins."
keywords: "Examples, Usage, plugins, docker, documentation, user guide"
---
@y
---
title: Docker network driver plugins
description: "Network driver plugins."
keywords: "Examples, Usage, plugins, docker, documentation, user guide"
---
@z

@x
This document describes Docker Engine network driver plugins generally
available in Docker Engine. To view information on plugins
managed by Docker Engine, refer to [Docker Engine plugin system](_index.md).
@y
This document describes Docker Engine network driver plugins generally
available in Docker Engine. To view information on plugins
managed by Docker Engine, refer to [Docker Engine plugin system](_index.md).
@z

@x
Docker Engine network plugins enable Engine deployments to be extended to
support a wide range of networking technologies, such as VXLAN, IPVLAN, MACVLAN
or something completely different. Network driver plugins are supported via the
LibNetwork project. Each plugin is implemented as a "remote driver" for
LibNetwork, which shares plugin infrastructure with Engine. Effectively, network
driver plugins are activated in the same way as other plugins, and use the same
kind of protocol.
@y
Docker Engine network plugins enable Engine deployments to be extended to
support a wide range of networking technologies, such as VXLAN, IPVLAN, MACVLAN
or something completely different. Network driver plugins are supported via the
LibNetwork project. Each plugin is implemented as a "remote driver" for
LibNetwork, which shares plugin infrastructure with Engine. Effectively, network
driver plugins are activated in the same way as other plugins, and use the same
kind of protocol.
@z

@x
## Network plugins and Swarm mode
@y
## Network plugins and Swarm mode
@z

@x
[Legacy plugins](legacy_plugins.md) do not work in Swarm mode. However,
plugins written using the [v2 plugin system](_index.md) do work in Swarm mode, as
long as they are installed on each Swarm worker node.
@y
[Legacy plugins](legacy_plugins.md) do not work in Swarm mode. However,
plugins written using the [v2 plugin system](_index.md) do work in Swarm mode, as
long as they are installed on each Swarm worker node.
@z

@x
## Use network driver plugins
@y
## Use network driver plugins
@z

@x
The means of installing and running a network driver plugin depend on the
particular plugin. So, be sure to install your plugin according to the
instructions obtained from the plugin developer.
@y
The means of installing and running a network driver plugin depend on the
particular plugin. So, be sure to install your plugin according to the
instructions obtained from the plugin developer.
@z

@x
Once running however, network driver plugins are used just like the built-in
network drivers: by being mentioned as a driver in network-oriented Docker
commands. For example,
@y
Once running however, network driver plugins are used just like the built-in
network drivers: by being mentioned as a driver in network-oriented Docker
commands. For example,
@z

@x
```console
$ docker network create --driver weave mynet
```
@y
```console
$ docker network create --driver weave mynet
```
@z

@x
Some network driver plugins are listed in [plugins](legacy_plugins.md)
@y
Some network driver plugins are listed in [plugins](legacy_plugins.md)
@z

@x
The `mynet` network is now owned by `weave`, so subsequent commands
referring to that network will be sent to the plugin,
@y
The `mynet` network is now owned by `weave`, so subsequent commands
referring to that network will be sent to the plugin,
@z

@x
```console
$ docker run --network=mynet busybox top
```
@y
```console
$ docker run --network=mynet busybox top
```
@z

@x
## Find network plugins
@y
## Find network plugins
@z

@x
Network plugins are written by third parties, and are published by those
third parties, either on
[Docker Hub](https://hub.docker.com/search?q=&type=plugin)
or on the third party's site.
@y
Network plugins are written by third parties, and are published by those
third parties, either on
[Docker Hub](https://hub.docker.com/search?q=&type=plugin)
or on the third party's site.
@z

@x
## Write a network plugin
@y
## Write a network plugin
@z

@x
Network plugins implement the [Docker plugin API](plugin_api.md) and the network
plugin protocol
@y
Network plugins implement the [Docker plugin API](plugin_api.md) and the network
plugin protocol
@z

@x
## Network plugin protocol
@y
## Network plugin protocol
@z

@x
The network driver protocol, in addition to the plugin activation call, is
documented as part of libnetwork:
[https://github.com/moby/moby/blob/master/libnetwork/docs/remote.md](https://github.com/moby/moby/blob/master/libnetwork/docs/remote.md).
@y
The network driver protocol, in addition to the plugin activation call, is
documented as part of libnetwork:
[https://github.com/moby/moby/blob/master/libnetwork/docs/remote.md](https://github.com/moby/moby/blob/master/libnetwork/docs/remote.md).
@z

@x
## Related Information
@y
## Related Information
@z

@x
To interact with the Docker maintainers and other interested users, see the IRC channel `#docker-network`.
@y
To interact with the Docker maintainers and other interested users, see the IRC channel `#docker-network`.
@z

@x
- [Docker networks feature overview](https://docs.docker.com/engine/userguide/networking/)
- The [LibNetwork](https://github.com/docker/libnetwork) project
@y
- [Docker networks feature overview](https://docs.docker.com/engine/userguide/networking/)
- The [LibNetwork](https://github.com/docker/libnetwork) project
@z
