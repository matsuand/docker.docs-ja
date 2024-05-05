%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Reference documentation
description: Find reference documentation for the Docker platform’s various APIs, CLIs, and file formats
@y
title: リファレンスドキュメント
description: Docker プラットフォームの API、CLI、ドライバー仕様、ファイルフォーマットについてドキュメントを確認してください。
@z

% grid_files:

@x
- title: Dockerfile
  description: Defines the contents and startup behavior of a single container.
  icon: edit_document
  link: /reference/dockerfile/
@y
- title: Dockerfile
  description: Defines the contents and startup behavior of a single container.
  icon: edit_document
  link: __SUBDIR__/reference/dockerfile/
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

% grid_clis:

@x
- title: Docker CLI
  description: The main Docker CLI, includes all `docker` commands.
  icon: terminal
  link: /engine/reference/commandline/cli/
@y
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
  link: /reference/cli/dockerd/
@y
- title: Daemon CLI (dockerd)
  description: Persistent process that manages containers.
  icon: developer_board
  link: __SUBDIR__/reference/cli/dockerd/
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
  icon: area_chart
  link: /docker-hub/api/dvp/
@y
- title: DVP Data API
  description: API for Docker Verified Publishers to fetch analytics data.
  icon: area_chart
  link: __SUBDIR__/docker-hub/api/dvp/
@z

% snip aliases...

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
