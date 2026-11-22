%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Quick install Docker Engine
linkTitle: Docker Engine
description: Install Docker Engine on Linux with the convenience script and run a test container.
keywords: Docker Engine, quick install, Linux, convenience script
@y
title: Quick install Docker Engine
linkTitle: Docker Engine
description: Install Docker Engine on Linux with the convenience script and run a test container.
keywords: Docker Engine, quick install, Linux, convenience script
@z

@x
Docker Engine runs containers on Linux without a desktop application. For a
Mac or Windows computer, use [Docker Desktop](/get-docker/desktop.md).
@y
Docker Engine runs containers on Linux without a desktop application. For a
Mac or Windows computer, use [Docker Desktop](get-docker/desktop.md).
@z

@x
## Install
@y
## Install
@z

@x
Use Docker's convenience script on a development or test machine running a
[supported Linux distribution](/manuals/engine/install/_index.md):
@y
Use Docker's convenience script on a development or test machine running a
[supported Linux distribution](manuals/engine/install/_index.md):
@z

@x
```console
$ curl -fsSL https://get.docker.com | sudo sh
```
@y
```console
$ curl -fsSL https://get.docker.com | sudo sh
```
@z

@x
The script installs Docker Engine and its dependencies. For production systems,
use the package repository instructions for your distribution instead.
@y
The script installs Docker Engine and its dependencies. For production systems,
use the package repository instructions for your distribution instead.
@z

@x
## Check the installation
@y
## Check the installation
@z

@x
Run a test container:
@y
Run a test container:
@z

@x
```console
$ sudo docker run hello-world
```
@y
```console
$ sudo docker run hello-world
```
@z

@x
The container prints a confirmation message when the installation works.
@y
The container prints a confirmation message when the installation works.
@z

@x
## Full installation instructions
@y
## Full installation instructions
@z

@x
{{< card
  title="Install Docker Engine"
  description="Choose a Linux distribution for system requirements, package installation, version selection, and upgrades."
  link="/engine/install/" >}}
@y
{{< card
  title="Install Docker Engine"
  description="Choose a Linux distribution for system requirements, package installation, version selection, and upgrades."
  link="/engine/install/" >}}
@z

@x
For details about the script, see
[Install using the convenience script](/manuals/engine/install/ubuntu.md#install-using-the-convenience-script).
@y
For details about the script, see
[Install using the convenience script](manuals/engine/install/ubuntu.md#install-using-the-convenience-script).
@z
