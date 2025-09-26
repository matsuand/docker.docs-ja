%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: How to uninstall Docker Compose
keywords: compose, orchestration, uninstall, uninstallation, docker, documentation
title: Uninstall Docker Compose
linkTitle: Uninstall 
@y
description: Docker Compose のアンインストール方法。
keywords: compose, orchestration, uninstall, uninstallation, docker, documentation
title: Docker Compose のアンインストール
linkTitle: アンインストール
@z

@x
How you uninstall Docker Compose depends on how it was installed. This guide covers uninstallation instructions for:
@y
Docker Compose のアンインストール方法は、これをどのようにインストールしたかによって異なります。
このガイドでは以下のアンインストール手順について説明します。
@z

@x
- Docker Compose installed via Docker Desktop
- Docker Compose installed as a CLI plugin
@y
- Docker Desktop を通じて Docker Compose をインストールした場合
- CLI プラグインとして Docker Compose をインストールした場合
@z

@x
## Uninstalling Docker Compose with Docker Desktop
@y
## Docker Desktop を使った Docker Compose のアンインストール {#uninstalling-docker-compose-with-docker-desktop}
@z

@x
If you want to uninstall Docker Compose and you have installed Docker Desktop, see [Uninstall Docker Desktop](/manuals/desktop/uninstall.md).
@y
Docker Compose をアンインストールするとして、そもそも Docker Desktop がインストール済である場合は [Docker Desktop のアンインストール](manuals/desktop/uninstall.md) を参照してください。
@z

@x
> [!WARNING]
>
> Unless you have other Docker instances installed on that specific environment, uninstalling Docker Desktop removes all Docker components, including Docker Engine, Docker CLI, and Docker Compose.
@y
> [!WARNING]
>
> 特別な環境上に別の Docker インスタンスを実現しているのでない限り、Docker Desktop のアンインストールは Docker コンポーネントをすべて削除します。
> つまり Docker Engine、Docker CLI、Docker Compose はすべて削除されます。
@z

@x
## Uninstalling the Docker Compose CLI plugin
@y
## Docker Compose CLI プラグインのアンインストール {#uninstalling-the-docker-compose-cli-plugin}
@z

@x
If you installed Docker Compose via a package manager, run:
@y
パッケージマネージャーを通じて Docker Compose をインストールしている場合は、以下を実行します。
@z

@x
On Ubuntu or Debian:
@y
Ubuntu, Debian の場合
@z

% snip command...

@x
On RPM-based distributions:
@y
RPM ベースのディストリビューションの場合
@z

% snip command...

@x
### Manually installed
@y
### 手動インストールの場合 {#manually-installed}
@z

@x
If you installed Docker Compose manually (using curl), remove it by deleting the binary:
@y
Docker Compose を (curl を使って) 手動でインストールしている場合、バイナリーを削除することでアンインストールします。
@z

% snip command...

@x
### Remove for all users
@y
### 全ユーザー向けの削除 {#remove-for-all-users}
@z

@x
If installed for all users, remove it from the system directory:
@y
全ユーザー向けにインストールしている場合は、システムディレクトリからバイナリーを削除します。
@z

% snip command...

@x
> [!NOTE]
>
> If you get a **Permission denied** error using either of the previous
> methods, you do not have the permissions needed to remove
> Docker Compose. To force the removal, prepend `sudo` to either of the previous instructions and run it again.
@y
> [!NOTE]
>
> 上 2 つの手順において **Permission denied** エラーが発生した場合は、Docker Compose を削除する権限を持っていないということです。
> 強制的に削除するには、各コマンドの先頭に `sudo` をつけて再実行してください。
@z

@x
### Inspect the location of the Compose CLI plugin
@y
### Compose CLI プラグインのインストール先の確認 {#inspect-the-location-of-the-compose-cli-plugin}
@z

@x
To check where Compose is installed, use:
@y
Compose がインストールされている場所は、以下を実行して確認します。
@z

% snip command...
