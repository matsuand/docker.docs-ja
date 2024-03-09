%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Install Docker Scout
description: Installation instructions for the Docker Scout CLI plugin
keywords: scout, cli, install, download
@y
title: Docker Scout のインストール
description: Installation instructions for the Docker Scout CLI plugin
keywords: scout, cli, install, download
@z

@x
The Docker Scout CLI plugin comes pre-installed with Docker Desktop.
@y
Docker Scout の CLI プラグインは Docker Desktop 内にプリインストールされています。.
@z

@x
If you run Docker Engine without Docker Desktop,
Docker Scout doesn't come pre-installed,
but you can install it as a standalone binary.
@y
Docker Desktop を用いずに Docker Engine を実行している場合、Docker Scout はプリインストールされていません。
その場合はスタンドアロンバイナリーとしてインストールします。
@z

@x
To install the latest version of the plugin, run the following commands:
@y
最新バージョンのプラグインをインストールするには、以下のコマンドを実行します。
@z

% snip command...

@x
> **Note**
>
> Always examine scripts downloaded from the internet before running them
> locally. Before installing, make yourself familiar with potential risks and
> limitations of the convenience script.
@y
> **メモ**
>
> インターネットからローカルにダウンロードしたスクリプトは、実行前に充分に内容を確認してください。
> インストールするにあたっては、この便利スクリプトが抱える潜在的リスクや制約について充分に理解しておいてください。
@z

@x
If you want to install the plugin manually, you can find full instructions
and links to download in the [scout-cli repository](https://github.com/docker/scout-cli).
@y
プラグインを手動インストールしたい場合は、[scout-cli リポジトリ](https://github.com/docker/scout-cli) にある手順に従って、そのリンクからダウンロードしてください。
@z

@x
The Docker Scout CLI plugin is also available as [a container image](https://hub.docker.com/r/docker/scout-cli)
and as [a GitHub action](https://github.com/docker/scout-action).
@y
Docker Scout CLI プラグインは [コンテナーイメージ](https://hub.docker.com/r/docker/scout-cli) として、または [GitHub アクション](https://github.com/docker/scout-action) として入手できます。
@z
