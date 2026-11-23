%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Quick install Docker Engine
linkTitle: Docker Engine
description: Install Docker Engine on Linux with the convenience script and run a test container.
keywords: Docker Engine, quick install, Linux, convenience script
@y
title: Docker Engine のクィックインストール
linkTitle: Docker Engine
description: 簡単なスクリプトを使って Linux 上に Docker Engine をインストールしてテストコンテナーを動作させます。
keywords: Docker Engine, quick install, Linux, convenience script, クィックインストール
@z

@x
Docker Engine runs containers on Linux without a desktop application. For a
Mac or Windows computer, use [Docker Desktop](/get-docker/desktop.md).
@y
Linux 上においてデスクトップアプリケーションを利用せずに Docker Engine からコンテナーを起動させます。
Mac や Windows では [Docker Desktop](get-docker/desktop.md) を利用してください。
@z

@x
## Install
@y
## インストール {#install}
@z

@x
Use Docker's convenience script on a development or test machine running a
[supported Linux distribution](/manuals/engine/install/_index.md):
@y
[サポート対象の Linux ディストリビューション](manuals/engine/install/_index.md) において、開発環境やテストマシン上であれば、Docker が提供する便利スクリプトを利用します。
@z

% snip command...

@x
The script installs Docker Engine and its dependencies. For production systems,
use the package repository instructions for your distribution instead.
@y
このスクリプトは Docker Engine と関連パッケージをインストールします。
本番環境向けには、各ディストリビューション向けのパッケージリポジトリ手順に従ってください。
@z

@x
## Check the installation
@y
## インストール後の確認 {#check-the-installation}
@z

@x
Run a test container:
@y
テストコンテナーを起動します。
@z

% snip command...

@x
The container prints a confirmation message when the installation works.
@y
インストールが正常であればこのコンテナーは確認メッセージを表示します。
@z

@x
## Full installation instructions
@y
## 完全なインストール手順 {#full-installation-instructions}
@z

@x
{{< card
  title="Install Docker Engine"
  description="Choose a Linux distribution for system requirements, package installation, version selection, and upgrades."
  link="/engine/install/" >}}
@y
{{< card
  title="Docker Engine のインストール"
  description="システム要件を満たした Linux ディストリビューションを選んで、パッケージのインストール、バージョンの選定、アップグレードを行ってください。"
  link="__SUBDIR__/engine/install/" >}}
@z

@x
For details about the script, see
[Install using the convenience script](/manuals/engine/install/ubuntu.md#install-using-the-convenience-script).
@y
上のスクリプトに関する詳細は [便利スクリプトを使ったインストール](manuals/engine/install/ubuntu.md#install-using-the-convenience-script) を参照してください。
@z
