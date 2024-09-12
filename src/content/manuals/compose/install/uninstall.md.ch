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
Uninstalling Docker Compose depends on the method you have used to install Docker Compose. On this page you can find specific instructions to uninstall Docker Compose.
@y
Uninstalling Docker Compose depends on the method you have used to install Docker Compose. On this page you can find specific instructions to uninstall Docker Compose.
@z

@x
## Uninstalling Docker Desktop
@y
## Docker Desktop のアンインストール {#uninstalling-docker-desktop}
@z

@x
If you want to uninstall Compose and you have installed Docker Desktop, see [Uninstall Docker Desktop](/manuals/desktop/uninstall.md).
@y
If you want to uninstall Compose and you have installed Docker Desktop, see [Uninstall Docker Desktop](manuals/desktop/uninstall.md).
@z

@x
> [!NOTE]
>
> Unless you have other Docker instances installed on that specific environment, you would be removing Docker altogether by uninstalling the Desktop.
@y
> [!NOTE]
>
> Unless you have other Docker instances installed on that specific environment, you would be removing Docker altogether by uninstalling the Desktop.
@z

@x
## Uninstalling the Docker Compose CLI plugin
@y
## Docker Compose CLI プラグインのアンインストール {#uninstalling-the-docker-compose-cli-plugin}
@z

@x
To remove the Compose CLI plugin, run:
@y
To remove the Compose CLI plugin, run:
@z

@x
Ubuntu, Debian:
@y
Ubuntu, Debian の場合
@z

% snip command...

@x
RPM-based distros:
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
If you used `curl` to install Compose CLI plugin, to uninstall it, run:
@y
If you used `curl` to install Compose CLI plugin, to uninstall it, run:
@z

% snip command...

@x
### Remove for all users
@y
### Remove for all users
@z

@x
Or, if you have installed Compose for all users, run:
@y
Or, if you have installed Compose for all users, run:
@z

% snip command...

@x
> Got a **Permission denied** error?
>
> If you get a **Permission denied** error using either of the above
> methods, you do not have the permissions allowing you to remove
> `docker-compose`. To force the removal, prepend `sudo` to either of the above instructions and run it again.
@y
> Got a **Permission denied** error?
>
> If you get a **Permission denied** error using either of the above
> methods, you do not have the permissions allowing you to remove
> `docker-compose`. To force the removal, prepend `sudo` to either of the above instructions and run it again.
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
