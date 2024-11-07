%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: Learn how to install Docker Compose. Compose is available natively on
  Docker Desktop, as a Docker Engine plugin, and as a standalone tool.
keywords: install docker compose, docker compose install, install docker compose ubuntu,
  installing docker compose, docker compose download, docker compose not found, docker
  compose windows, how to install docker compose
title: Overview of installing Docker Compose
linkTitle: Install
@y
description: Learn how to install Docker Compose. Compose is available natively on
  Docker Desktop, as a Docker Engine plugin, and as a standalone tool.
keywords: install docker compose, docker compose install, install docker compose ubuntu,
  installing docker compose, docker compose download, docker compose not found, docker
  compose windows, how to install docker compose
title: Overview of installing Docker Compose
linkTitle: Install
@z

@x
This page contains summary information about the available options for installing Docker Compose.
@y
This page contains summary information about the available options for installing Docker Compose.
@z

@x
## Installation scenarios 
@y
## Installation scenarios 
@z

@x
### Scenario one: Install Docker Desktop
@y
### Scenario one: Install Docker Desktop
@z

@x
The easiest and recommended way to get Docker Compose is to install Docker Desktop. Docker Desktop
includes Docker Compose along with Docker Engine and Docker CLI which are Compose prerequisites. 
@y
The easiest and recommended way to get Docker Compose is to install Docker Desktop. Docker Desktop
includes Docker Compose along with Docker Engine and Docker CLI which are Compose prerequisites. 
@z

@x
Docker Desktop is available on:
- [Linux](/manuals/desktop/setup/install/linux/_index.md)
- [Mac](/manuals/desktop/setup/install/mac-install.md)
- [Windows](/manuals/desktop/setup/install/windows-install.md)
@y
Docker Desktop is available on:
- [Linux](manuals/desktop/setup/install/linux/_index.md)
- [Mac](manuals/desktop/setup/install/mac-install.md)
- [Windows](manuals/desktop/setup/install/windows-install.md)
@z

@x
If you have already installed Docker Desktop, you can check which version of Compose you have by selecting **About Docker Desktop** from the Docker menu {{< inline-image src="../../desktop/images/whale-x.svg" alt="whale menu" >}}.
@y
If you have already installed Docker Desktop, you can check which version of Compose you have by selecting **About Docker Desktop** from the Docker menu {{< inline-image src="../../desktop/images/whale-x.svg" alt="whale menu" >}}.
@z

@x
> [!NOTE] 
>
> After Docker Compose V1 was removed in Docker Desktop version [4.23.0](/desktop/release-notes/#4230) as it had reached end-of-life,
> the `docker-compose` command now points directly to the Docker Compose V2 binary, running in standalone mode. 
> If you rely on Docker Desktop auto-update, the symlink might be broken and command unavailable, as the update doesn't ask for administrator password. 
> 
> This only affects Mac users. To fix this, either recreate the symlink:
> ```console
> $ sudo rm /usr/local/bin/docker-compose
> $ sudo ln -s /Applications/Docker.app/Contents/Resources/cli-plugins/docker-compose /usr/local/bin/docker-compose
> ```
> Or enable [Automatically check configuration](/manuals/desktop/settings-and-maintenance/settings.md) which will detect and fix it for you.
@y
> [!NOTE] 
>
> After Docker Compose V1 was removed in Docker Desktop version [4.23.0](__SUBDIR__/desktop/release-notes/#4230) as it had reached end-of-life,
> the `docker-compose` command now points directly to the Docker Compose V2 binary, running in standalone mode. 
> If you rely on Docker Desktop auto-update, the symlink might be broken and command unavailable, as the update doesn't ask for administrator password. 
> 
> This only affects Mac users. To fix this, either recreate the symlink:
> ```console
> $ sudo rm /usr/local/bin/docker-compose
> $ sudo ln -s /Applications/Docker.app/Contents/Resources/cli-plugins/docker-compose /usr/local/bin/docker-compose
> ```
> Or enable [Automatically check configuration](manuals/desktop/settings-and-maintenance/settings.md) which will detect and fix it for you.
@z

@x
### Scenario two: Install the Compose plugin
@y
### Scenario two: Install the Compose plugin
@z

@x
If you already have Docker Engine and Docker CLI installed, you can install the Compose plugin from the command line, by either:
- [Using Docker's repository](linux.md#install-using-the-repository)
- [Downloading and installing manually](linux.md#install-the-plugin-manually)
@y
If you already have Docker Engine and Docker CLI installed, you can install the Compose plugin from the command line, by either:
- [Using Docker's repository](linux.md#install-using-the-repository)
- [Downloading and installing manually](linux.md#install-the-plugin-manually)
@z

@x
> [!IMPORTANT]
>
>This is only available on Linux
@y
> [!IMPORTANT]
>
>This is only available on Linux
@z

@x
### Scenario three: Install the Compose standalone 
@y
### Scenario three: Install the Compose standalone 
@z

@x
You can [install the Compose standalone](standalone.md) on Linux or on Windows Server.
@y
You can [install the Compose standalone](standalone.md) on Linux or on Windows Server.
@z

@x
> [!WARNING]
>
>This install scenario is not recommended and is only supported for backward compatibility purposes.
@y
> [!WARNING]
>
>This install scenario is not recommended and is only supported for backward compatibility purposes.
@z
