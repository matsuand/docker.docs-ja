%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
@x
---
description: Engine
keywords: Engine
title: Docker Engine overview
grid:
- title: Install Docker Engine
  description: Learn how to install the open source Docker Engine for your distribution.
  icon: download
  link: /engine/install
- title: Storage
  description: Use persistent data with Docker containers.
  icon: database
  link: /storage
- title: Networking
  description: Manage network connections between containers.
  icon: network_node
  link: /network
- title: Container logs
  description: Learn how to view and read container logs.
  icon: feed
  link: /config/containers/logging/
- title: Prune
  description: Tidy up unused resources.
  icon: cut
  link: /config/pruning
- title: Configure the daemon
  description: Delve into the configuration options of the Docker daemon.
  icon: tune
  link: /config/daemon
- title: Rootless mode
  description: Run Docker without root privileges.
  icon: security
  link: /engine/security/rootless
- title: Deprecated features
  description: Find out what features of Docker Engine you should stop using.
  icon: folder_delete
  link: /engine/deprecated/
- title: Release notes
  description: Read the release notes for the latest version.
  icon: note_add
  link: /engine/release-notes
aliases:
- /edge/
- /engine/ce-ee-node-activate/
- /engine/misc/
- /linux/
- /manuals/
---
@y
---
description: Engine
keywords: Engine
title: Docker Engine overview
grid:
- title: Install Docker Engine
  description: Learn how to install the open source Docker Engine for your distribution.
  icon: download
  link: __SUBDIR__/engine/install
- title: Storage
  description: Use persistent data with Docker containers.
  icon: database
  link: __SUBDIR__/storage
- title: Networking
  description: Manage network connections between containers.
  icon: network_node
  link: __SUBDIR__/network
- title: Container logs
  description: Learn how to view and read container logs.
  icon: feed
  link: __SUBDIR__/config/containers/logging/
- title: Prune
  description: Tidy up unused resources.
  icon: cut
  link: __SUBDIR__/config/pruning
- title: Configure the daemon
  description: Delve into the configuration options of the Docker daemon.
  icon: tune
  link: __SUBDIR__/config/daemon
- title: Rootless mode
  description: Run Docker without root privileges.
  icon: security
  link: __SUBDIR__/engine/security/rootless
- title: Deprecated features
  description: Find out what features of Docker Engine you should stop using.
  icon: folder_delete
  link: __SUBDIR__/engine/deprecated/
- title: Release notes
  description: Read the release notes for the latest version.
  icon: note_add
  link: __SUBDIR__/engine/release-notes
aliases:
- /edge/
- /engine/ce-ee-node-activate/
- /engine/misc/
- /linux/
- /manuals/
---
@z

@x
Docker Engine is an open source containerization technology for building and
containerizing your applications. Docker Engine acts as a client-server
application with:
@y
Docker Engine is an open source containerization technology for building and
containerizing your applications. Docker Engine acts as a client-server
application with:
@z

@x
- A server with a long-running daemon process
  [`dockerd`](/engine/reference/commandline/dockerd).
- APIs which specify interfaces that programs can use to talk to and instruct
  the Docker daemon.
- A command line interface (CLI) client
  [`docker`](/engine/reference/commandline/cli/).
@y
- A server with a long-running daemon process
  [`dockerd`](/engine/reference/commandline/dockerd).
- APIs which specify interfaces that programs can use to talk to and instruct
  the Docker daemon.
- A command line interface (CLI) client
  [`docker`](/engine/reference/commandline/cli/).
@z

@x
The CLI uses [Docker APIs](api/index.md) to control or interact with the Docker
daemon through scripting or direct CLI commands. Many other Docker applications
use the underlying API and CLI. The daemon creates and manage Docker objects,
such as images, containers, networks, and volumes.
@y
The CLI uses [Docker APIs](api/index.md) to control or interact with the Docker
daemon through scripting or direct CLI commands. Many other Docker applications
use the underlying API and CLI. The daemon creates and manage Docker objects,
such as images, containers, networks, and volumes.
@z

@x
For more details, see
[Docker Architecture](../get-started/overview.md#docker-architecture).
@y
For more details, see
[Docker Architecture](../get-started/overview.md#docker-architecture).
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z

@x
## Licensing
@y
## Licensing
@z

@x
The Docker Engine is licensed under the Apache License, Version 2.0. See
[LICENSE](https://github.com/moby/moby/blob/master/LICENSE) for the full license
text.
@y
The Docker Engine is licensed under the Apache License, Version 2.0. See
[LICENSE](https://github.com/moby/moby/blob/master/LICENSE) for the full license
text.
@z
