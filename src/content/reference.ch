%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Reference documentation
description: This section includes the reference documentation for the Docker platform’s
  various APIs, CLIs, and file formats.
notoc: true
skip_read_time: true
grid_files:
- title: Dockerfile
  description: Defines the contents and startup behavior of a single container.
  icon: edit_document
  link: /engine/reference/builder/
- title: Compose file
  description: Defines a multi-container application.
  icon: polyline
  link: /compose/compose-file/
grid_clis:
- title: Docker CLI
  description: The main Docker CLI, includes all `docker` commands.
  icon: terminal
  link: /engine/reference/commandline/cli/
- title: Compose CLI
  description: The CLI for Docker Compose, for building and running multi-container
    applications.
  icon: subtitles
  link: /compose/reference/
- title: Daemon CLI (dockerd)
  description: Persistent process that manages containers.
  icon: developer_board
  link: /engine/reference/commandline/dockerd/
grid_apis:
- title: Engine API
  description: The main API for Docker, provides programmatic access to a daemon.
  icon: api
  link: /engine/api/
- title: Registry API
  description: Facilitates distribution of images to the engine.
  icon: storage
  link: /registry/spec/api/
- title: Docker Hub API
  description: API to interact with Docker Hub.
  icon: communities
  link: /docker-hub/api/latest/
- title: DVP Data API
  description: API for Docker Verified Publishers to fetch analytics data.
  icon: auto_graph
  link: /docker-hub/api/dvp/
grid_specs:
- title: Image specification
  description: Describes the various components of a Docker image.
  icon: contract
  link: /registry/spec/manifest-v2-2/
- title: Registry token authentication
  description: Outlines the Docker Registry authentication schemes.
  icon: key
  link: /registry/spec/auth/
aliases:
- /app/working-with-app/
- /engine/reference/commandline/app/
- /engine/reference/commandline/app_bundle/
- /engine/reference/commandline/app_completion/
- /engine/reference/commandline/app_init/
- /engine/reference/commandline/app_inspect/
- /engine/reference/commandline/app_install/
- /engine/reference/commandline/app_list/
- /engine/reference/commandline/app_merge/
- /engine/reference/commandline/app_pull/
- /engine/reference/commandline/app_push/
- /engine/reference/commandline/app_render/
- /engine/reference/commandline/app_split/
- /engine/reference/commandline/app_status/
- /engine/reference/commandline/app_uninstall/
- /engine/reference/commandline/app_upgrade/
- /engine/reference/commandline/app_validate/
- /engine/reference/commandline/app_validate/
- /engine/reference/commandline/app_version/
---
@y
---
title: Reference documentation
description: This section includes the reference documentation for the Docker platform’s
  various APIs, CLIs, and file formats.
notoc: true
skip_read_time: true
grid_files:
- title: Dockerfile
  description: Defines the contents and startup behavior of a single container.
  icon: edit_document
  link: /engine/reference/builder/
- title: Compose file
  description: Defines a multi-container application.
  icon: polyline
  link: /compose/compose-file/
grid_clis:
- title: Docker CLI
  description: The main Docker CLI, includes all `docker` commands.
  icon: terminal
  link: /engine/reference/commandline/cli/
- title: Compose CLI
  description: The CLI for Docker Compose, for building and running multi-container
    applications.
  icon: subtitles
  link: /compose/reference/
- title: Daemon CLI (dockerd)
  description: Persistent process that manages containers.
  icon: developer_board
  link: /engine/reference/commandline/dockerd/
grid_apis:
- title: Engine API
  description: The main API for Docker, provides programmatic access to a daemon.
  icon: api
  link: /engine/api/
- title: Registry API
  description: Facilitates distribution of images to the engine.
  icon: storage
  link: /registry/spec/api/
- title: Docker Hub API
  description: API to interact with Docker Hub.
  icon: communities
  link: /docker-hub/api/latest/
- title: DVP Data API
  description: API for Docker Verified Publishers to fetch analytics data.
  icon: auto_graph
  link: /docker-hub/api/dvp/
grid_specs:
- title: Image specification
  description: Describes the various components of a Docker image.
  icon: contract
  link: /registry/spec/manifest-v2-2/
- title: Registry token authentication
  description: Outlines the Docker Registry authentication schemes.
  icon: key
  link: /registry/spec/auth/
aliases:
- /app/working-with-app/
- /engine/reference/commandline/app/
- /engine/reference/commandline/app_bundle/
- /engine/reference/commandline/app_completion/
- /engine/reference/commandline/app_init/
- /engine/reference/commandline/app_inspect/
- /engine/reference/commandline/app_install/
- /engine/reference/commandline/app_list/
- /engine/reference/commandline/app_merge/
- /engine/reference/commandline/app_pull/
- /engine/reference/commandline/app_push/
- /engine/reference/commandline/app_render/
- /engine/reference/commandline/app_split/
- /engine/reference/commandline/app_status/
- /engine/reference/commandline/app_uninstall/
- /engine/reference/commandline/app_upgrade/
- /engine/reference/commandline/app_validate/
- /engine/reference/commandline/app_validate/
- /engine/reference/commandline/app_version/
---
@z

@x
This section includes the reference documentation for the Docker platform's
various APIs, CLIs, drivers and specifications, and file formats.
@y
This section includes the reference documentation for the Docker platform's
various APIs, CLIs, drivers and specifications, and file formats.
@z

@x
## File formats
@y
## File formats
@z

@x
{{< grid items="grid_files" >}}
@y
{{< grid items="grid_files" >}}
@z

@x
## Command-line interfaces (CLIs)
@y
## Command-line interfaces (CLIs)
@z

@x
{{< grid items="grid_clis" >}}
@y
{{< grid items="grid_clis" >}}
@z

@x
## Application programming interfaces (APIs)
@y
## Application programming interfaces (APIs)
@z

@x
{{< grid items="grid_apis" >}}
@y
{{< grid items="grid_apis" >}}
@z

@x
## Drivers and specifications
@y
## Drivers and specifications
@z

@x
{{< grid items="grid_specs" >}}
@y
{{< grid items="grid_specs" >}}
@z
