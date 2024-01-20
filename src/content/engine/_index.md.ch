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
- /engine/migration/
- /engine/misc/
- /linux/
---
@y
---
description: Engine
keywords: Engine
title: Docker Engine 概要
grid:
- title: Docker Engine のインストール
  description: 手元のディストリビューションにオープンソースの Docker Engine をインストールする方法について学びます。
  icon: download
  link: __SUBDIR__/engine/install
- title: ストレージ
  description: Docker コンテナーにおけるデータを保存します。
  icon: database
  link: __SUBDIR__/storage
- title: ネットワーク
  description: コンテナー間でのネットワーク接続を管理します。
  icon: network_node
  link: __SUBDIR__/network
- title: コンテナーのログ
  description: コンテナーのログを参照し読む方法について学びます。
  icon: feed
  link: __SUBDIR__/config/containers/logging/
- title: prune （取り除き）
  description: 未使用のリソースを取り除きます。
  icon: cut
  link: __SUBDIR__/config/pruning
- title: デーモンを設定します。
  description: Docker デーモンの設定オプションについて学びます。
  icon: tune
  link: __SUBDIR__/config/daemon
- title: rootless モード
  description: root 権限なしに Docker を実行します。
  icon: security
  link: __SUBDIR__/engine/security/rootless
- title: 非推奨の機能
  description: Docker Engine における機能のうち、利用を中止すべきものについて検索します。
  icon: folder_delete
  link: __SUBDIR__/engine/deprecated/
- title: リリースノート
  description: 最新版に対するリリースノートを確認します。
  icon: note_add
  link: __SUBDIR__/engine/release-notes
aliases:
- /edge/
- /engine/ce-ee-node-activate/
- /engine/migration/
- /engine/misc/
- /linux/
---
@z

@x
Docker Engine is an open source containerization technology for building and
containerizing your applications. Docker Engine acts as a client-server
application with:
@y
Docker Engine はオープンソースによるコンテナー技術であり、アプリケーションの構築とコンテナー化を行います。
Docker Engine はクライアントサーバーアプリケーションとして動作し、以下を提供します。
@z

@x
- A server with a long-running daemon process
  [`dockerd`](/engine/reference/commandline/dockerd).
- APIs which specify interfaces that programs can use to talk to and instruct
  the Docker daemon.
- A command line interface (CLI) client
  [`docker`](/engine/reference/commandline/cli/).
@y
- デーモンプロセス [`dockerd`](/engine/reference/commandline/dockerd) を長期にわたって動作させるサーバー。
- アプリケーションプログラムが Docker デーモンとやりとりしたり指示したりするためのインターフェースとなる API。
- コマンドラインインターフェース (CLI) クライアントである [`docker`](/engine/reference/commandline/cli/)。
@z

@x
The CLI uses [Docker APIs](api/index.md) to control or interact with the Docker
daemon through scripting or direct CLI commands. Many other Docker applications
use the underlying API and CLI. The daemon creates and manage Docker objects,
such as images, containers, networks, and volumes.
@y
CLI は [Docker API](api/index.md) を利用して、Docker デーモンの制御ややりとりを行います。
これはスクリプト処理や CLI コマンドの直接操作によって行います。
これ以外の Docker アプリケーションの多くが API や CLI を利用しています。
デーモンからは、イメージ、コンテナー、ネットワーク、ボリュームといった Docker オブジェクトが生成され管理されます。
@z

@x
For more details, see
[Docker Architecture](../get-started/overview.md#docker-architecture).
@y
詳細は [Docker アーキテクチャー](../get-started/overview.md#docker-architecture) を参照してください。
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z

@x
## Licensing
@y
## ライセンス {#licensing}
@z

@x
The Docker Engine is licensed under the Apache License, Version 2.0. See
[LICENSE](https://github.com/moby/moby/blob/master/LICENSE) for the full license
text.
@y
Docker Engine は ライセンスとして Apache License, Version 2.0 を採用しています。
ライセンス全文は [LICENSE](https://github.com/moby/moby/blob/master/LICENSE) を参照してください。
@z
