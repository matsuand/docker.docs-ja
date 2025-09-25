%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: Learn how to install Docker Compose. Compose is available natively on
  Docker Desktop, as a Docker Engine plugin, and as a standalone tool.
keywords: install docker compose, docker compose plugin, install compose linux, install docker desktop, docker compose windows, standalone docker compose, docker compose not found
title: Overview of installing Docker Compose
linkTitle: Install
@y
description: Learn how to install Docker Compose. Compose is available natively on
  Docker Desktop, as a Docker Engine plugin, and as a standalone tool.
keywords: install docker compose, docker compose plugin, install compose linux, install docker desktop, docker compose windows, standalone docker compose, docker compose not found
title: Docker Compose インストールの概要
linkTitle: インストール
@z

@x
This page summarizes the different ways you can install Docker Compose, depending on your platform and needs.
@y
このページでは Docker Compose を利用するプラットフォームや利用方法に応じて、Docker Compose をインストールする方法をいくつか説明します。
@z

@x
## Installation scenarios 
@y
## インストールのシナリオ {#installation-scenarios}
@z

@x
### Docker Desktop (Recommended)
@y
### Docker Desktop (推奨) {#docker-desktop-recommended}
@z

@x
The easiest and recommended way to get Docker Compose is to install Docker Desktop. 
@y
Docker Compose の推奨される最も簡単な方法は Docker Desktop をインストールすることです。
@z

@x
Docker Desktop includes Docker Compose along with Docker Engine and Docker CLI which are Compose prerequisites. 
@y
Docker Desktop には Docker Engine、Docker CLI とともに Docker Compose が含まれています。
Docker Engine、Docker CLI は Compose にとって必要なものです。
@z

@x
Docker Desktop is available for:
- [Linux](/manuals/desktop/setup/install/linux/_index.md)
- [Mac](/manuals/desktop/setup/install/mac-install.md)
- [Windows](/manuals/desktop/setup/install/windows-install.md)
@y
Docker Desktop は以下の環境において利用可能です。
- [Linux](manuals/desktop/setup/install/linux/_index.md)
- [Mac](manuals/desktop/setup/install/mac-install.md)
- [Windows](manuals/desktop/setup/install/windows-install.md)
@z

@x
> [!TIP]
> 
> If you have already installed Docker Desktop, you can check which version of Compose you have by selecting **About Docker Desktop** from the Docker menu {{< inline-image src="../../desktop/images/whale-x.svg" alt="whale menu" >}}.
@y
> [!TIP]
> 
> すでに Docker Desktop をインストールしている場合は、Compose のバージョンが何であるかを確認してください。
> 確認方法は Docker メニュー {{< inline-image src="../../desktop/images/whale-x.svg" alt="whale menu" >}} の **About Docker Desktop** を選びます。
@z

@x
### Plugin (Linux only)
@y
### プラグイン (Linux のみ) {#plugin-linux-only}
@z

@x
> [!IMPORTANT]
>
> This method is only available on Linux.
@y
> [!IMPORTANT]
>
> この方法は Linux においてしか利用可能できません。
@z

@x
If you already have Docker Engine and Docker CLI installed, you can install the Docker Compose plugin from the command line, by either:
- [Using Docker's repository](linux.md#install-using-the-repository)
- [Downloading and installing manually](linux.md#install-the-plugin-manually)
@y
Docker Engine と Docker CLI をすでにインストールしている場合、コマンドラインから Docker Compose プラグインをインストールできます。
以下の 2 つの方法があります。
- [Docker リポジトリを用いた方法](linux.md#install-using-the-repository)
- [手動によりダウンロード、インストールを行う方法](linux.md#install-the-plugin-manually)
@z

@x
### Standalone (Legacy)
@y
### スタンドアロン (従来の方法) {#standalone-legacy}
@z

@x
> [!WARNING]
>
> This install scenario is not recommended and is only supported for backward compatibility purposes.
@y
> [!WARNING]
>
> このインストールシナリオはお勧めできません。
> これは後方互換の目的でサポートされているにすぎません。
@z

@x
You can [install the Docker Compose standalone](standalone.md) on Linux or on Windows Server.
@y
Linux や Windows Server においては [Docker Compose スタンドアロンインストール](standalone.md) を行うことができます。
@z
