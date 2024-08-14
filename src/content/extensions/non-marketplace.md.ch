%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Extensions
keywords: Docker Extensions, Docker Desktop, Linux, Mac, Windows,
title: Non-Marketplace extensions
aliases:
 - /desktop/extensions/non-marketplace/
---
@y
---
description: Extensions
keywords: Docker Extensions, Docker Desktop, Linux, Mac, Windows,
title: Non-Marketplace extensions
aliases:
 - /desktop/extensions/non-marketplace/
---
@z

@x
## Install an extension not available in the Marketplace
@y
## Install an extension not available in the Marketplace
@z

@x
> **Warning**
>
> Docker Extensions that are not in the Marketplace haven't gone through Docker's review process.
> Extensions can install binaries, invoke commands and access files on your machine. Installing them is at your own risk.
{ .warning }
@y
> **Warning**
>
> Docker Extensions that are not in the Marketplace haven't gone through Docker's review process.
> Extensions can install binaries, invoke commands and access files on your machine. Installing them is at your own risk.
{ .warning }
@z

@x
The Extensions Marketplace is the trusted and official place to install extensions from within Docker Desktop. These extensions have gone through a review process by Docker. However, other extensions can also be installed in Docker Desktop if you trust the extension author.
@y
The Extensions Marketplace is the trusted and official place to install extensions from within Docker Desktop. These extensions have gone through a review process by Docker. However, other extensions can also be installed in Docker Desktop if you trust the extension author.
@z

@x
Given the nature of a Docker Extension (i.e. a Docker image) you can find other places where users have their extension's source code published. For example on GitHub, GitLab or even hosted in image registries like DockerHub or GHCR.
You can install an extension that has been developed by the community or internally at your company from a teammate. You are not limited to installing extensions just from the Marketplace.
@y
Given the nature of a Docker Extension (i.e. a Docker image) you can find other places where users have their extension's source code published. For example on GitHub, GitLab or even hosted in image registries like DockerHub or GHCR.
You can install an extension that has been developed by the community or internally at your company from a teammate. You are not limited to installing extensions just from the Marketplace.
@z

@x
> **Note**
>
> Ensure the option **Allow only extensions distributed through the Docker Marketplace** is disabled. Otherwise, this prevents any extension not listed in the Marketplace, via the Extension SDK tools from, being installed.
> You can change this option in **Settings**. 
@y
> **Note**
>
> Ensure the option **Allow only extensions distributed through the Docker Marketplace** is disabled. Otherwise, this prevents any extension not listed in the Marketplace, via the Extension SDK tools from, being installed.
> You can change this option in **Settings**. 
@z

@x
To install an extension which is not present in the Marketplace, you can use the Extensions CLI that is bundled with Docker Desktop.
@y
To install an extension which is not present in the Marketplace, you can use the Extensions CLI that is bundled with Docker Desktop.
@z

@x
In a terminal, type `docker extension install IMAGE[:TAG]` to install an extension by its image reference and optionally a tag. Use the `-f` or `--force` flag to avoid interactive confirmation.
@y
In a terminal, type `docker extension install IMAGE[:TAG]` to install an extension by its image reference and optionally a tag. Use the `-f` or `--force` flag to avoid interactive confirmation.
@z

@x
Go to the Docker Dashboard to see the new extension installed.
@y
Go to the Docker Dashboard to see the new extension installed.
@z

@x
## List installed extensions
@y
## List installed extensions
@z

@x
Regardless whether the extension was installed from the Marketplace or manually by using the Extensions CLI, you can use the `docker extension ls` command to display the list of extensions installed.
As part of the output you'll see the extension ID, the provider, version, the title and whether it runs a backend container or has deployed binaries to the host, for example:
@y
Regardless whether the extension was installed from the Marketplace or manually by using the Extensions CLI, you can use the `docker extension ls` command to display the list of extensions installed.
As part of the output you'll see the extension ID, the provider, version, the title and whether it runs a backend container or has deployed binaries to the host, for example:
@z

@x
```console
$ docker extension ls
ID                  PROVIDER            VERSION             UI                    VM                  HOST
john/my-extension   John                latest              1 tab(My-Extension)   Running(1)          -
```
@y
```console
$ docker extension ls
ID                  PROVIDER            VERSION             UI                    VM                  HOST
john/my-extension   John                latest              1 tab(My-Extension)   Running(1)          -
```
@z

@x
Go to the Docker Dashboard, click on **Add Extensions** and on the **Managed** tab to see the new extension installed.
Notice that an `UNPUBLISHED` label displays which indicates that the extension has not been installed from the Marketplace.
@y
Go to the Docker Dashboard, click on **Add Extensions** and on the **Managed** tab to see the new extension installed.
Notice that an `UNPUBLISHED` label displays which indicates that the extension has not been installed from the Marketplace.
@z

@x
## Update an extension 
@y
## Update an extension 
@z

@x
To update an extension which isn't present in the Marketplace, in a terminal type `docker extension update IMAGE[:TAG]` where the `TAG` should be different from the extension that's already installed.
@y
To update an extension which isn't present in the Marketplace, in a terminal type `docker extension update IMAGE[:TAG]` where the `TAG` should be different from the extension that's already installed.
@z

@x
For instance, if you installed an extension with `docker extension install john/my-extension:0.0.1`, you can update it by running `docker extension update john/my-extension:0.0.2`.
Go to the Docker Dashboard to see the new extension updated.
@y
For instance, if you installed an extension with `docker extension install john/my-extension:0.0.1`, you can update it by running `docker extension update john/my-extension:0.0.2`.
Go to the Docker Dashboard to see the new extension updated.
@z

@x
> **Note**
>
> Extensions that aren't installed through the Marketplace don't receive update notifications from Docker Desktop.
@y
> **Note**
>
> Extensions that aren't installed through the Marketplace don't receive update notifications from Docker Desktop.
@z

@x
## Uninstall an extension
@y
## Uninstall an extension
@z

@x
To uninstall an extension which is not present in the Marketplace, you can either navigate to the **Managed** tab in the Marketplace and select the **Uninstall** button, or from a terminal type `docker extension uninstall IMAGE[:TAG]`.
@y
To uninstall an extension which is not present in the Marketplace, you can either navigate to the **Managed** tab in the Marketplace and select the **Uninstall** button, or from a terminal type `docker extension uninstall IMAGE[:TAG]`.
@z
