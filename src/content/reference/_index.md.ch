%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Reference documentation
linkTitle: Reference
@y
title: リファレンスドキュメント
linkTitle: リファレンス
@z

@x
description: Find reference documentation for the Docker platform’s various APIs, CLIs, and file formats
@y
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
    description: 1 つのコンテナーの内容と起動方法を定義します。
    icon: edit_document
    link: __SUBDIR__/reference/dockerfile/
@z

@x
  - title: Compose file
    description: Defines a multi-container application.
    icon: polyline
    link: /reference/compose-file/
@y
  - title: Compose ファイル
    description: マルチコンテナーアプリケーションを定義します。
    icon: polyline
    link: __SUBDIR__/reference/compose-file/
@z

% grid_clis:

@x
  - title: Docker CLI
    description: The main Docker CLI, includes all `docker` commands.
    icon: terminal
    link: /reference/cli/docker/
@y
  - title: Docker CLI
    description: "`docker` コマンドをはじめとする主要な Docker CLI です。"
    icon: terminal
    link: __SUBDIR__/reference/cli/docker/
@z

@x
  - title: Compose CLI
    description: The CLI for Docker Compose, for building and running multi-container
      applications.
    icon: subtitles
    link: /reference/cli/docker/compose/
@y
  - title: Compose CLI
    description: Docker Compose 向けの CLI であり、マルチコンテナーをビルドし実行します。
      applications.
    icon: subtitles
    link: __SUBDIR__/reference/cli/docker/compose/
@z

@x
  - title: Daemon CLI (dockerd)
    description: Persistent process that manages containers.
    icon: developer_board
    link: /reference/cli/dockerd/
@y
  - title: Daemon CLI (dockerd)
    description: コンテナーを管理する常駐プロセスです。
    icon: developer_board
    link: __SUBDIR__/reference/cli/dockerd/
@z

% grid_apis:

@x
  - title: Engine API
    description: The main API for Docker, provides programmatic access to a daemon.
    icon: api
    link: /reference/api/engine/
@y
  - title: Engine API
    description: Docker のメイン API であり、デーモンへのプログラム的なアクセスを実現します。
    icon: api
    link: __SUBDIR__/reference/api/engine/
@z

@x
  - title: Docker Hub API
    description: API to interact with Docker Hub.
    icon: communities
    link: /reference/api/hub/latest/
@y
  - title: Docker Hub API
    description: Docker Hub との対話を行う API です。
    icon: communities
    link: __SUBDIR__/reference/api/hub/latest/
@z

@x
  - title: DVP Data API
    description: API for Docker Verified Publishers to fetch analytics data.
    icon: area_chart
    link: /reference/api/dvp/latest/
@y
  - title: DVP Data API
    description: Docker 認定公開者 (Docker Verified Publishers) が分析データを取得するための API です。
    icon: area_chart
    link: __SUBDIR__/reference/api/dvp/latest/
@z

@x
  - title: Registry API
    description: API for Docker Registry.
    icon: database
    link: /reference/api/registry/latest/
@y
  - title: Registry API
    description: Docker Registry の API です。
    icon: database
    link: __SUBDIR__/reference/api/registry/latest/
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
