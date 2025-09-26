%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
description: Step-by-step instructions for installing the Docker Compose plugin on Linux using a package repository or manual method.
keywords: install docker compose linux, docker compose plugin, docker-compose-plugin linux, docker compose v2, docker compose manual install, linux docker compose
@y
description: Step-by-step instructions for installing the Docker Compose plugin on Linux using a package repository or manual method.
keywords: install docker compose linux, docker compose plugin, docker-compose-plugin linux, docker compose v2, docker compose manual install, linux docker compose
@z

@x
title: Install the Docker Compose plugin
linkTitle: Plugin
@y
title: Docker Compose プラグインのインストール
linkTitle: プラグイン
@z

@x
This page contains instructions on how to install the Docker Compose plugin on Linux from the command line.
@y
このページでは、Linux 上においてコマンドラインから Docker Compose プラグインをインストールする手順について説明します。
@z

@x
To install the Docker Compose plugin on Linux, you can either:
- [Set up Docker's repository on your Linux system](#install-using-the-repository).
- [Install manually](#install-the-plugin-manually).
@y
Linux 上において Docker Compose プラグインをインストールするには、以下のいずれかの方法をとります。
- [Linux 上に Docker のリポジトリを設定する方法](#install-using-the-repository).
- [手動でインストールする方法](#install-the-plugin-manually).
@z

@x
> [!NOTE]
>
> These instructions assume you already have Docker Engine and Docker CLI installed and now want to install the Docker Compose plugin. 
@y
> [!NOTE]
>
> ここに説明する手順は Docker Engine と Docker CLI が既にインストール済であって、そこから Docker Compose プラグインをインストールすることを前提に説明しています。
@z

@x
## Install using the repository
@y
## リポジトリを使ったインストール {#install-using-the-repository}
@z

@x
1. Set up the repository. Find distribution-specific instructions in:
@y
1. リポジトリを設定します。
   ディストリビューション固有の手順として以下を参照してください。
@z

@x
    [Ubuntu](/manuals/engine/install/ubuntu.md#install-using-the-repository) |
    [CentOS](/manuals/engine/install/centos.md#set-up-the-repository) |
    [Debian](/manuals/engine/install/debian.md#install-using-the-repository) |
    [Raspberry Pi OS](/manuals/engine/install/raspberry-pi-os.md#install-using-the-repository) |
    [Fedora](/manuals/engine/install/fedora.md#set-up-the-repository) |
    [RHEL](/manuals/engine/install/rhel.md#set-up-the-repository).
@y
    [Ubuntu](manuals/engine/install/ubuntu.md#install-using-the-repository) |
    [CentOS](manuals/engine/install/centos.md#set-up-the-repository) |
    [Debian](manuals/engine/install/debian.md#install-using-the-repository) |
    [Raspberry Pi OS](manuals/engine/install/raspberry-pi-os.md#install-using-the-repository) |
    [Fedora](manuals/engine/install/fedora.md#set-up-the-repository) |
    [RHEL](manuals/engine/install/rhel.md#set-up-the-repository).
@z

@x
2. Update the package index, and install the latest version of Docker Compose:
@y
2. パッケージインデックスを更新します。
   そして最新版の Docker Compose をインストールします。
@z

@x
    * For Ubuntu and Debian, run:
@y
    * Ubuntu や Debian の場合は以下を実行します。
@z

% snip command...

@x
    * For RPM-based distributions, run:
@y
    * RPM ベースのディストリビューションでは以下を実行します。
@z

% snip command...

@x
3.  Verify that Docker Compose is installed correctly by checking the version.
@y
3.  バージョンをチェックすることで Docker Compose が正常にインストールできたことを確認します。
@z

% snip command...

@x
### Update Docker Compose
@y
### Docker Compose の更新 {#update-docker-dompose}
@z

@x
To update the Docker Compose plugin, run the following commands:
@y
Docker Compose プラグインを更新するには、以下のコマンドを実行します。
@z

@x
* For Ubuntu and Debian, run:
@y
* Ubuntu や Debian の場合は以下を実行します。
@z

% snip command...

@x
* For RPM-based distributions, run:
@y
* RPM ベースのディストリビューションでは以下を実行します。
@z

% snip command...

@x
## Install the plugin manually
@y
## プラグインの手動インストール {#install-the-plugin-manually}
@z

@x
> [!WARNING]
>
> Manual installations don’t auto-update. For ease of maintenance, use the Docker repository method.
@y
> [!WARNING]
>
> 手動によるインストールの場合は自動更新が行われません。
> 保守を容易にするのであれば Docker リポジトリを利用する方法をとってください。
@z

@x
1.  To download and install the Docker Compose CLI plugin, run:
@y
1.  Docker Compose CLI プラグインのダウンロードとインストールを行うため、以下を実行します。
@z

% snip command...

@x
    This command downloads and installs the latest release of Docker Compose for the active user under `$HOME` directory.
@y
    このコマンドは最新版の Docker Compose をダウンロードし、現ユーザーの `$HOME` ディレクトリ配下にインストールします。
@z

@x
    To install:
    - Docker Compose for _all users_ on your system, replace `~/.docker/cli-plugins` with `/usr/local/lib/docker/cli-plugins`.
    - A different version of Compose, substitute `{{% param "compose_version" %}}` with the version of Compose you want to use.
    - For a different architecture, substitute `x86_64` with the [architecture you want](https://github.com/docker/compose/releases).   
@y
    インストールにあたっては、必要に応じて以下を行います。
    - Docker Compose を _全ユーザー_ 向けの利用とするなら、`~/.docker/cli-plugins` を `/usr/local/lib/docker/cli-plugins` に置き換えます。
    - Compose の別バージョンを利用するなら `{{% param "compose_version" %}}` を利用したいバージョンに置き換えます。
    - 別アーキテクチャーの場合は `x86_64` を [所望のアーキテクチャー](https://github.com/docker/compose/releases) に置き換えます。
@z

@x
2. Apply executable permissions to the binary:
@y
2. バイナリーに対して実行権限を与えます。
@z

% snip command...

@x
    or, if you chose to install Compose for all users:
@y
    または、インストールした Compose を全ユーザー向けとするなら以下を実行します。
@z

% snip command...

@x
3. Test the installation.
@y
3. インストール結果を確認します。
@z

% snip command...

@x
## What's next?
@y
## 次は何？ {#whats-next}
@z

@x
- [Understand how Compose works](/manuals/compose/intro/compose-application-model.md)
- [Try the Quickstart guide](/manuals/compose/gettingstarted.md)
@y
- [Compose はどのように動作するか](manuals/compose/intro/compose-application-model.md)
- [クィックスタートガイドを始める](manuals/compose/gettingstarted.md)
@z
