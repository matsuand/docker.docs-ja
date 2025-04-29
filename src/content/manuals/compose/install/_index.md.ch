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
This page summarizes the different ways you can install Docker Compose, depending on your platform and needs.
@y
This page summarizes the different ways you can install Docker Compose, depending on your platform and needs.
@z

@x
## Installation scenarios 
@y
## Installation scenarios 
@z

@x
### Scenario one: Install Docker Desktop (Recommended)
@y
### Scenario one: Install Docker Desktop (Recommended)
@z

@x
The easiest and recommended way to get Docker Compose is to install Docker Desktop. 
@y
The easiest and recommended way to get Docker Compose is to install Docker Desktop. 
@z

@x
Docker Desktop includes Docker Compose along with Docker Engine and Docker CLI which are Compose prerequisites. 
@y
Docker Desktop includes Docker Compose along with Docker Engine and Docker CLI which are Compose prerequisites. 
@z

@x
Docker Desktop is available for:
- [Linux](/manuals/desktop/setup/install/linux/_index.md)
- [Mac](/manuals/desktop/setup/install/mac-install.md)
- [Windows](/manuals/desktop/setup/install/windows-install.md)
@y
Docker Desktop is available for:
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
> If you have already installed Docker Desktop, you can check which version of Compose you have by selecting **About Docker Desktop** from the Docker menu {{< inline-image src="../../desktop/images/whale-x.svg" alt="whale menu" >}}.
@z

@x
### Scenario two: Install the Docker Compose plugin (Linux only)
@y
### Scenario two: Install the Docker Compose plugin (Linux only)
@z

@x
> [!IMPORTANT]
>
> This method is only available on Linux.
@y
> [!IMPORTANT]
>
> This method is only available on Linux.
@z

@x
If you already have Docker Engine and Docker CLI installed, you can install the Docker Compose plugin from the command line, by either:
- [Using Docker's repository](linux.md#install-using-the-repository)
- [Downloading and installing manually](linux.md#install-the-plugin-manually)
@y
If you already have Docker Engine and Docker CLI installed, you can install the Docker Compose plugin from the command line, by either:
- [Using Docker's repository](linux.md#install-using-the-repository)
- [Downloading and installing manually](linux.md#install-the-plugin-manually)
@z

@x
### Scenario three: Install the Docker Compose standalone (Legacy)
@y
### Scenario three: Install the Docker Compose standalone (Legacy)
@z

@x
> [!WARNING]
>
> This install scenario is not recommended and is only supported for backward compatibility purposes.
@y
> [!WARNING]
>
> This install scenario is not recommended and is only supported for backward compatibility purposes.
@z

@x
You can [install the Docker Compose standalone](standalone.md) on Linux or on Windows Server.
@y
You can [install the Docker Compose standalone](standalone.md) on Linux or on Windows Server.
@z
