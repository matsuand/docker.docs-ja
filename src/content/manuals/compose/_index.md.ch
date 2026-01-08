%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Docker Compose
@y
title: Docker Compose
@z

@x
description: Learn how to use Docker Compose to define and run multi-container applications
  with this detailed introduction to the tool.
keywords: docker compose, docker-compose, compose.yaml, docker compose command, multi-container applications, container orchestration, docker cli
@y
description: Learn how to use Docker Compose to define and run multi-container applications
  with this detailed introduction to the tool.
keywords: docker compose, docker-compose, compose.yaml, docker compose command, multi-container applications, container orchestration, docker cli
@z

% grid:

@x
- title: Why use Compose?
  description: Understand Docker Compose's key benefits
  icon: feature_search
  link: /compose/intro/features-uses/
@y
- title: Compose 利用はなぜ？
  description: Docker Compose の主要機能の特性を理解します。
  icon: feature_search
  link: __SUBDIR__/compose/intro/features-uses/
@z

@x
- title: How Compose works 
  description: Understand how Compose works
  icon: category
  link: /compose/intro/compose-application-model/
@y
- title: Compose はどう動くのか
  description: Compose はどのようにして動作するのかを理解します。
  icon: category
  link: __SUBDIR__/compose/intro/compose-application-model/
@z

@x
- title: Install Compose
  description: Follow the instructions on how to install Docker Compose.
  icon: download
  link: /compose/install
@y
- title: Compose のインストール
  description: Docker Compose のインストール手順を説明していきます。
  icon: download
  link: __SUBDIR__/compose/install
@z

@x
- title: Quickstart
  description: Learn the key concepts of Docker Compose whilst building a simple Python
    web application.
  icon: explore
  link: /compose/gettingstarted
@y
- title: クィックスタート
  description: 簡単な Pytyhon ウェブアプリケーションをビルドしながら Docker Compose の特徴的な考え方について学んでいきます。
  icon: explore
  link: __SUBDIR__/compose/gettingstarted
@z

@x
- title: View the release notes
  description: Find out about the latest enhancements and bug fixes.
  icon: note_add
  link: "https://github.com/docker/compose/releases"
@y
- title: リリースノートの確認
  description: 最新の機能拡張やバグフィックスを確認します。
  icon: note_add
  link: "https://github.com/docker/compose/releases"
@z

@x
- title: Explore the Compose file reference
  description: Find information on defining services, networks, and volumes for a
    Docker application.
  icon: polyline
  link: /reference/compose-file
@y
- title: Compose ファイルリファレンスの確認
  description: Find information on defining services, networks, and volumes for a
    Docker application.
  icon: polyline
  link: __SUBDIR__/reference/compose-file
@z

@x
- title: Use Compose Bridge
  description: Transform your Compose configuration file into configuration files for different platforms, such as Kubernetes.
  icon: move_down
  link: /compose/bridge
@y
- title: Compose Bridge の利用
  description: Transform your Compose configuration file into configuration files for different platforms, such as Kubernetes.
  icon: move_down
  link: __SUBDIR__/compose/bridge
@z

@x
- title: Browse common FAQs
  description: Explore general FAQs and find out how to give feedback.
  icon: help
  link: /compose/faq
@y
- title: 一般的な FAQ の確認
  description: Explore general FAQs and find out how to give feedback.
  icon: help
  link: __SUBDIR__/compose/faq
@z

% snip aliases...

@x
Docker Compose is a tool for defining and running multi-container applications. 
It is the key to unlocking a streamlined and efficient development and deployment experience. 
@y
Docker Compose は、マルチコンテナーアプリケーションを定義して実行するためのツールのことです。
合理的で効率的な開発とデプロイを行うための重要な道具となります。
@z

@x
Compose simplifies the control of your entire application stack, making it easy to manage services, networks, and volumes in a single YAML configuration file. Then, with a single command, you create and start all the services
from your configuration file.
@y
Compose を使えば、アプリケーション全体に関する管理作業を単純化できます。
サービス、ネットワーク、ボリュームそれぞれの管理は、たった一つの YAML 設定ファイルにまとめられます。
そしてその設定ファイルからはたった一つのコマンドだけで、全サービスの生成と起動を行います。
@z

@x
Compose works in all environments - production, staging, development, testing, as
well as CI workflows. It also has commands for managing the whole lifecycle of your application:
@y
Compose は本番環境、ステージング環境、開発環境において動作し、CI ワークフローとしても利用することができます。
またアプリケーションのライフサイクルを管理するコマンドも提供されます。
@z

@x
 - Start, stop, and rebuild services
 - View the status of running services
 - Stream the log output of running services
 - Run a one-off command on a service
@y
 - サービスの起動、停止、再起動。
 - 実行中サービスの状態確認。
 - 実行中サービスのログ出力。
 - サービスに対する一括 (one-off) コマンドの実行。
@z

% snip grid...
