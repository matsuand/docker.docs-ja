%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker Engine 18.01 release notes
toc_min: 1
toc_max: 2
skip_read_time: true
---
@y
---
title: Docker Engine 18.01 release notes
toc_min: 1
toc_max: 2
skip_read_time: true
---
@z

@x
## 18.01.0-ce
2018-01-10
@y
## 18.01.0-ce
2018-01-10
@z

@x
### Builder
@y
### Builder
@z

@x
* Fix files not being deleted if user-namespaces are enabled [moby/moby#35822](https://github.com/moby/moby/pull/35822)
- Add support for expanding environment-variables in `docker commit --change ...` [moby/moby#35582](https://github.com/moby/moby/pull/35582)
@y
* Fix files not being deleted if user-namespaces are enabled [moby/moby#35822](https://github.com/moby/moby/pull/35822)
- Add support for expanding environment-variables in `docker commit --change ...` [moby/moby#35582](https://github.com/moby/moby/pull/35582)
@z

@x
### Client
@y
### Client
@z

@x
* Return errors from client in stack deploy configs [docker/cli#757](https://github.com/docker/cli/pull/757)
- Fix description of filter flag in prune commands [docker/cli#774](https://github.com/docker/cli/pull/774)
+ Add "pid" to unsupported options list [docker/cli#768](https://github.com/docker/cli/pull/768)
+ Add support for experimental Cli configuration [docker/cli#758](https://github.com/docker/cli/pull/758)
+ Add support for generic resources to bash completion [docker/cli#749](https://github.com/docker/cli/pull/749)
- Fix error in zsh completion script for docker exec [docker/cli#751](https://github.com/docker/cli/pull/751)
+ Add a debug message when client closes websocket attach connection [moby/moby#35720](https://github.com/moby/moby/pull/35720)
- Fix bash completion for `"docker swarm"` [docker/cli#772](https://github.com/docker/cli/pull/772)
@y
* Return errors from client in stack deploy configs [docker/cli#757](https://github.com/docker/cli/pull/757)
- Fix description of filter flag in prune commands [docker/cli#774](https://github.com/docker/cli/pull/774)
+ Add "pid" to unsupported options list [docker/cli#768](https://github.com/docker/cli/pull/768)
+ Add support for experimental Cli configuration [docker/cli#758](https://github.com/docker/cli/pull/758)
+ Add support for generic resources to bash completion [docker/cli#749](https://github.com/docker/cli/pull/749)
- Fix error in zsh completion script for docker exec [docker/cli#751](https://github.com/docker/cli/pull/751)
+ Add a debug message when client closes websocket attach connection [moby/moby#35720](https://github.com/moby/moby/pull/35720)
- Fix bash completion for `"docker swarm"` [docker/cli#772](https://github.com/docker/cli/pull/772)
@z

@x
### Documentation
* Correct references to `--publish` long syntax in docs [docker/cli#746](https://github.com/docker/cli/pull/746)
* Corrected descriptions for MAC_ADMIN and MAC_OVERRIDE [docker/cli#761](https://github.com/docker/cli/pull/761)
* Updated developer doc to explain external CLI [moby/moby#35681](https://github.com/moby/moby/pull/35681)
- Fix `"on-failure"` restart policy being documented as "failure" [docker/cli#754](https://github.com/docker/cli/pull/754)
- Fix anchors to "Storage driver options" [docker/cli#748](https://github.com/docker/cli/pull/748)
@y
### Documentation
* Correct references to `--publish` long syntax in docs [docker/cli#746](https://github.com/docker/cli/pull/746)
* Corrected descriptions for MAC_ADMIN and MAC_OVERRIDE [docker/cli#761](https://github.com/docker/cli/pull/761)
* Updated developer doc to explain external CLI [moby/moby#35681](https://github.com/moby/moby/pull/35681)
- Fix `"on-failure"` restart policy being documented as "failure" [docker/cli#754](https://github.com/docker/cli/pull/754)
- Fix anchors to "Storage driver options" [docker/cli#748](https://github.com/docker/cli/pull/748)
@z

@x
### Experimental
@y
### Experimental
@z

@x
+ Add kubernetes support to `docker stack` command [docker/cli#721](https://github.com/docker/cli/pull/721)
* Don't append the container id to custom directory checkpoints. [moby/moby#35694](https://github.com/moby/moby/pull/35694)
@y
+ Add kubernetes support to `docker stack` command [docker/cli#721](https://github.com/docker/cli/pull/721)
* Don't append the container id to custom directory checkpoints. [moby/moby#35694](https://github.com/moby/moby/pull/35694)
@z

@x
### Logging
@y
### Logging
@z

@x
* Fix daemon crash when using the GELF log driver over TCP when the GELF server goes down [moby/moby#35765](https://github.com/moby/moby/pull/35765)
- Fix awslogs batch size calculation for large logs [moby/moby#35726](https://github.com/moby/moby/pull/35726)
@y
* Fix daemon crash when using the GELF log driver over TCP when the GELF server goes down [moby/moby#35765](https://github.com/moby/moby/pull/35765)
- Fix awslogs batch size calculation for large logs [moby/moby#35726](https://github.com/moby/moby/pull/35726)
@z

@x
### Networking
@y
### Networking
@z

@x
- Windows: Fix to allow docker service to start on Windows VM [docker/libnetwork#1916](https://github.com/docker/libnetwork/pull/1916)
- Fix for docker intercepting DNS requests on ICS network [docker/libnetwork#2014](https://github.com/docker/libnetwork/pull/2014)
+ Windows: Added a new network creation driver option [docker/libnetwork#2021](https://github.com/docker/libnetwork/pull/2021)
@y
- Windows: Fix to allow docker service to start on Windows VM [docker/libnetwork#1916](https://github.com/docker/libnetwork/pull/1916)
- Fix for docker intercepting DNS requests on ICS network [docker/libnetwork#2014](https://github.com/docker/libnetwork/pull/2014)
+ Windows: Added a new network creation driver option [docker/libnetwork#2021](https://github.com/docker/libnetwork/pull/2021)
@z

@x
### Runtime
@y
### Runtime
@z

@x
* Validate Mount-specs on container start to prevent missing host-path [moby/moby#35833](https://github.com/moby/moby/pull/35833)
- Fix overlay2 storage driver inside a user namespace [moby/moby#35794](https://github.com/moby/moby/pull/35794)
* Zfs: fix busy error on container stop [moby/moby#35674](https://github.com/moby/moby/pull/35674)
- Fix health checks not using the container's working directory [moby/moby#35845](https://github.com/moby/moby/pull/35845)
- Fix VFS graph driver failure to initialize because of failure to setup fs quota [moby/moby#35827](https://github.com/moby/moby/pull/35827)
- Fix containerd events being processed twice [moby/moby#35896](https://github.com/moby/moby/pull/35896)
@y
* Validate Mount-specs on container start to prevent missing host-path [moby/moby#35833](https://github.com/moby/moby/pull/35833)
- Fix overlay2 storage driver inside a user namespace [moby/moby#35794](https://github.com/moby/moby/pull/35794)
* Zfs: fix busy error on container stop [moby/moby#35674](https://github.com/moby/moby/pull/35674)
- Fix health checks not using the container's working directory [moby/moby#35845](https://github.com/moby/moby/pull/35845)
- Fix VFS graph driver failure to initialize because of failure to setup fs quota [moby/moby#35827](https://github.com/moby/moby/pull/35827)
- Fix containerd events being processed twice [moby/moby#35896](https://github.com/moby/moby/pull/35896)
@z

@x
### Swarm mode
@y
### Swarm mode
@z

@x
- Fix published ports not being updated if a service has the same number of host-mode published ports with Published Port 0 [docker/swarmkit#2376](https://github.com/docker/swarmkit/pull/2376)
* Make the task termination order deterministic [docker/swarmkit#2265](https://github.com/docker/swarmkit/pull/2265)
@y
- Fix published ports not being updated if a service has the same number of host-mode published ports with Published Port 0 [docker/swarmkit#2376](https://github.com/docker/swarmkit/pull/2376)
* Make the task termination order deterministic [docker/swarmkit#2265](https://github.com/docker/swarmkit/pull/2265)
@z
