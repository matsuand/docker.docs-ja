%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: How to uninstall Docker Compose
keywords: compose, orchestration, uninstall, uninstallation, docker, documentation
title: Uninstall Docker Compose
@y
description: Docker Compose のアンインストール方法。
keywords: compose, orchestration, uninstall, uninstallation, docker, documentation
title: Docker Compose のアンインストール
@z

@x
How you uninstall Docker Compose depends on how it was installed. This guide covers uninstallation instructions for:
@y
How you uninstall Docker Compose depends on how it was installed. This guide covers uninstallation instructions for:
@z

@x
- Docker Compose installed via Docker Desktop
- Docker Compose installed as a CLI plugin
@y
- Docker Compose installed via Docker Desktop
- Docker Compose installed as a CLI plugin
@z

@x
## Uninstalling Docker Compose with Docker Desktop
@y
## Uninstalling Docker Compose with Docker Desktop
@z

@x
If you want to uninstall Docker Compose and you have installed Docker Desktop, see [Uninstall Docker Desktop](/manuals/desktop/uninstall.md).
@y
If you want to uninstall Docker Compose and you have installed Docker Desktop, see [Uninstall Docker Desktop](manuals/desktop/uninstall.md).
@z

@x
> [!WARNING]
>
> Unless you have other Docker instances installed on that specific environment, uninstalling Docker Desktop removes all Docker components, including Docker Engine, Docker CLI, and Docker Compose.
@y
> [!WARNING]
>
> Unless you have other Docker instances installed on that specific environment, uninstalling Docker Desktop removes all Docker components, including Docker Engine, Docker CLI, and Docker Compose.
@z

@x
## Uninstalling the Docker Compose CLI plugin
@y
## Docker Compose CLI プラグインのアンインストール {#uninstalling-the-docker-compose-cli-plugin}
@z

@x
If you installed Docker Compose via a package manager, run:
@y
If you installed Docker Compose via a package manager, run:
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
RPM ベースのディストロの場合
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
If you installed Docker Compose manually (using curl), remove it by deleting the binary:
@z

% snip command...

@x
### Remove for all users
@y
### Remove for all users
@z

@x
If installed for all users, remove it from the system directory:
@y
If installed for all users, remove it from the system directory:
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
> If you get a **Permission denied** error using either of the previous
> methods, you do not have the permissions needed to remove
> Docker Compose. To force the removal, prepend `sudo` to either of the previous instructions and run it again.
@z

@x
### Inspect the location of the Compose CLI plugin
@y
### Inspect the location of the Compose CLI plugin
@z

@x
To check where Compose is installed, use:
@y
To check where Compose is installed, use:
@z

% snip command...
