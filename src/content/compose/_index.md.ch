%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
@x
---
description: Learn how to use Docker Compose to define and run multi-container applications
  with this detailed introduction to the tool.
keywords: docker compose, docker-compose, docker compose command, docker compose files,
  docker compose documentation, using docker compose, compose container, docker compose
  service
title: Docker Compose overview
grid:
- title: Install Compose
  description: Follow the instructions on how to install Docker Compose.
  icon: download
  link: /compose/install
- title: Try Compose
  description: Learn the key concepts of Docker Compose whilst building a simple Python
    web application.
  icon: explore
  link: /compose/gettingstarted
- title: View the release notes
  description: Find out about the latest enhancements and bug fixes.
  icon: note_add
  link: /compose/release-notes
- title: Understand key features of Compose
  description: Understand its key features and explore common use cases.
  icon: category
  link: /compose/features-uses/
- title: Explore the Compose file reference
  description: Find information on defining services, networks, and volumes for a
    Docker application.
  icon: feature_search
  link: /compose/compose-file
- title: Browse common FAQs
  description: Explore general FAQs and find out how to give feedback.
  icon: help
  link: /compose/faq
aliases:
- /compose/cli-command/
- /compose/networking/swarm/
- /compose/overview/
- /compose/swarm/
- /compose/completion/
---
@y
---
description: Learn how to use Docker Compose to define and run multi-container applications
  with this detailed introduction to the tool.
keywords: docker compose, docker-compose, docker compose command, docker compose files,
  docker compose documentation, using docker compose, compose container, docker compose
  service
title: Docker Compose 概要
grid:
- title: Compose のインストール
  description: Follow the instructions on how to install Docker Compose.
  icon: download
  link: __SUBDIR__/compose/install
- title: Compose を試す
  description: Learn the key concepts of Docker Compose whilst building a simple Python
    web application.
  icon: explore
  link: __SUBDIR__/compose/gettingstarted
- title: リリースノートの確認
  description: Find out about the latest enhancements and bug fixes.
  icon: note_add
  link: __SUBDIR__/compose/release-notes
- title: Compose の主要機能の理解
  description: Understand its key features and explore common use cases.
  icon: category
  link: __SUBDIR__/compose/features-uses/
- title: Compose ファイルリファレンスの確認
  description: Find information on defining services, networks, and volumes for a
    Docker application.
  icon: feature_search
  link: __SUBDIR__/compose/compose-file
- title: Browse common FAQs
  description: Explore general FAQs and find out how to give feedback.
  icon: help
  link: __SUBDIR__/compose/faq
aliases:
- /compose/cli-command/
- /compose/networking/swarm/
- /compose/overview/
- /compose/swarm/
- /compose/completion/
---
@z

@x
{{< include "compose-eol.md" >}}
@y
{{< include "compose-eol.md" >}}
@z

@x
Compose is a tool for defining and running multi-container Docker applications.
With Compose, you use a YAML file to configure your application's services.
Then, with a single command, you create and start all the services
from your configuration.
@y
Compose とは、Docker アプリケーションにおいてマルチコンテナーを定義して実行するためのツールのことです。
Compose においては、アプリケーションサービスの設定を YAML ファイルを使って行います。
そしてただ一つのコマンドを使えば、その設定に基づいたサービスすべてを生成し起動することができます。
@z

@x
Compose works in all environments; production, staging, development, testing, as
well as CI workflows. It also has commands for managing the whole lifecycle of your application:
@y
Compose は本番環境、ステージング環境、開発環境において動作し、CI ワークフローとしても利用することができます。
またアプリケーションのライフサイクルを管理するコマンドも提供されます。
@z

@x
 * Start, stop, and rebuild services
 * View the status of running services
 * Stream the log output of running services
 * Run a one-off command on a service
@y
 * サービスの起動、停止、再起動。
 * 実行中サービスの状態確認。
 * 実行中サービスのログ出力。
 * サービスに対する一括 (one-off) コマンドの実行。
@z

@x
The key features of Compose that make it effective are:
@y
Compose の特徴的な機能は以下のとおりです。
@z

@x
* [Have multiple isolated environments on a single host](features-uses.md#have-multiple-isolated-environments-on-a-single-host)
* [Preserve volume data when containers are created](features-uses.md#preserves-volume-data-when-containers-are-created)
* [Only recreate containers that have changed](features-uses.md#only-recreate-containers-that-have-changed)
* [Support variables and moving a composition between environments](features-uses.md#supports-variables-and-moving-a-composition-between-environments)
@y
* [ただ一つのホスト上に複数の独立した環境を実現](features-uses.md#have-multiple-isolated-environments-on-a-single-host)
* [コンテナー生成後にボリュームデータを保持](features-uses.md#preserves-volume-data-when-containers-are-created)
* [変更のあったコンテナーのみ再生成](features-uses.md#only-recreate-containers-that-have-changed)
* [変数サポートと環境間の移行実現](features-uses.md#supports-variables-and-moving-a-composition-between-environments)
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
