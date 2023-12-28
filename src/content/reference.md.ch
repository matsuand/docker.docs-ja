%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Reference documentation
description: This section includes the reference documentation for the Docker platform’s
  various APIs, CLIs, and file formats.
notoc: true
skip_read_time: true
@y
---
title: リファレンスドキュメント
description: 本節はは Docker プラットフォームに API、CLI、ドライバー仕様、ファイルフォーマットについてのさまざまなリファレンスドキュメントを示すものです。
notoc: true
skip_read_time: true
@z

@x
grid_files:
- title: Dockerfile
  description: Defines the contents and startup behavior of a single container.
  icon: edit_document
  link: /engine/reference/builder/
@y
grid_files:
- title: Dockerfile
  description: Defines the contents and startup behavior of a single container.
  icon: edit_document
  link: __SUBDIR__/engine/reference/builder/
@z

@x
- title: Compose file
  description: Defines a multi-container application.
  icon: polyline
  link: /compose/compose-file/
@y
- title: Compose ファイル
  description: Defines a multi-container application.
  icon: polyline
  link: __SUBDIR__/compose/compose-file/
@z

@x
grid_clis:
- title: Docker CLI
  description: The main Docker CLI, includes all `docker` commands.
  icon: terminal
  link: /engine/reference/commandline/cli/
@y
grid_clis:
- title: Docker CLI
  description: The main Docker CLI, includes all `docker` commands.
  icon: terminal
  link: __SUBDIR__/engine/reference/commandline/cli/
@z

@x
- title: Compose CLI
  description: The CLI for Docker Compose, for building and running multi-container
    applications.
  icon: subtitles
  link: /compose/reference/
@y
- title: Compose CLI
  description: The CLI for Docker Compose, for building and running multi-container
    applications.
  icon: subtitles
  link: __SUBDIR__/compose/reference/
@z

@x
- title: Daemon CLI (dockerd)
  description: Persistent process that manages containers.
  icon: developer_board
  link: /engine/reference/commandline/dockerd/
@y
- title: Daemon CLI (dockerd)
  description: Persistent process that manages containers.
  icon: developer_board
  link: __SUBDIR__/engine/reference/commandline/dockerd/
@z

@x
grid_apis:
- title: Engine API
  description: The main API for Docker, provides programmatic access to a daemon.
  icon: api
  link: /engine/api/
@y
grid_apis:
- title: Engine API
  description: The main API for Docker, provides programmatic access to a daemon.
  icon: api
  link: __SUBDIR__/engine/api/
@z

@x
- title: Registry API
  description: Facilitates distribution of images to the engine.
  icon: storage
  link: /registry/spec/api/
@y
- title: Registry API
  description: Facilitates distribution of images to the engine.
  icon: storage
  link: __SUBDIR__/registry/spec/api/
@z

@x
- title: Docker Hub API
  description: API to interact with Docker Hub.
  icon: communities
  link: /docker-hub/api/latest/
@y
- title: Docker Hub API
  description: API to interact with Docker Hub.
  icon: communities
  link: __SUBDIR__/docker-hub/api/latest/
@z

@x
- title: DVP Data API
  description: API for Docker Verified Publishers to fetch analytics data.
  icon: auto_graph
  link: /docker-hub/api/dvp/
@y
- title: DVP Data API
  description: API for Docker Verified Publishers to fetch analytics data.
  icon: auto_graph
  link: __SUBDIR__/docker-hub/api/dvp/
@z

@x
grid_specs:
- title: Image specification
  description: Describes the various components of a Docker image.
  icon: contract
  link: /registry/spec/manifest-v2-2/
@y
grid_specs:
- title: イメージ仕様
  description: Describes the various components of a Docker image.
  icon: contract
  link: __SUBDIR__/registry/spec/manifest-v2-2/
@z

@x
- title: Registry token authentication
  description: Outlines the Docker Registry authentication schemes.
  icon: key
  link: /registry/spec/auth/
@y
- title: Registry token authentication
  description: Outlines the Docker Registry authentication schemes.
  icon: key
  link: __SUBDIR__/registry/spec/auth/
@z

@x
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
本節はは Docker プラットフォームに API、CLI、ドライバー仕様、ファイルフォーマットについてのさまざまなリファレンスドキュメントを示すものです。
@z

@x
## File formats
@y
## ファイルフォーマット {#file-formats}
@z

@x
{{< grid items="grid_files" >}}
@y
{{< grid items="grid_files" >}}
@z

@x
## Command-line interfaces (CLIs)
@y
## コマンドラインインターフェース (Command-line Interface; CLI) {#command-line-interfaces-clis}
@z

@x
{{< grid items="grid_clis" >}}
@y
{{< grid items="grid_clis" >}}
@z

@x
## Application programming interfaces (APIs)
@y
## アプリケーションプログラミングインターフェース (API) {#application-programming-interfaces-apis}
@z

@x
{{< grid items="grid_apis" >}}
@y
{{< grid items="grid_apis" >}}
@z

@x
## Drivers and specifications
@y
## ドライバーと仕様 {#drivers-and-specifications}
@z

@x
{{< grid items="grid_specs" >}}
@y
{{< grid items="grid_specs" >}}
@z
