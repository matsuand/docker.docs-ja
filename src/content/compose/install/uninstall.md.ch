%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How to uninstall Docker Compose
keywords: compose, orchestration, uninstall, uninstallation, docker, documentation
title: Uninstall Docker Compose
---
@y
---
description: How to uninstall Docker Compose
keywords: compose, orchestration, uninstall, uninstallation, docker, documentation
title: Uninstall Docker Compose
---
@z

@x
Uninstalling Docker Compose depends on the method you have used to install Docker Compose. On this page you can find specific instructions to uninstall Docker Compose.
@y
Uninstalling Docker Compose depends on the method you have used to install Docker Compose. On this page you can find specific instructions to uninstall Docker Compose.
@z

@x
## Uninstalling Docker Desktop
@y
## Uninstalling Docker Desktop
@z

@x
If you want to uninstall Compose and you have installed Docker Desktop, see [Uninstall Docker Desktop](../../desktop/uninstall.md).
@y
If you want to uninstall Compose and you have installed Docker Desktop, see [Uninstall Docker Desktop](../../desktop/uninstall.md).
@z

@x
> **Note**
>
> Unless you have other Docker instances installed on that specific environment, you would be removing Docker altogether by uninstalling the Desktop.
@y
> **Note**
>
> Unless you have other Docker instances installed on that specific environment, you would be removing Docker altogether by uninstalling the Desktop.
@z

@x
## Uninstalling the Docker Compose CLI plugin
@y
## Uninstalling the Docker Compose CLI plugin
@z

@x
To remove the Compose CLI plugin, run:
@y
To remove the Compose CLI plugin, run:
@z

@x
Ubuntu, Debian:
@y
Ubuntu, Debian:
@z

@x
   ```console
   $ sudo apt-get remove docker-compose-plugin
   ```
RPM-based distros:
@y
   ```console
   $ sudo apt-get remove docker-compose-plugin
   ```
RPM-based distros:
@z

@x
   ```console
   $ sudo yum remove docker-compose-plugin
   ```
@y
   ```console
   $ sudo yum remove docker-compose-plugin
   ```
@z

@x
### Manually installed
@y
### Manually installed
@z

@x
If you used `curl` to install Compose CLI plugin, to uninstall it, run:
@y
If you used `curl` to install Compose CLI plugin, to uninstall it, run:
@z

@x
   ```console
   $ rm $DOCKER_CONFIG/cli-plugins/docker-compose
   ```
@y
   ```console
   $ rm $DOCKER_CONFIG/cli-plugins/docker-compose
   ```
@z

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

@x
   ```console
   $ rm /usr/local/lib/docker/cli-plugins/docker-compose
   ```
@y
   ```console
   $ rm /usr/local/lib/docker/cli-plugins/docker-compose
   ```
@z

@x
> Got a **Permission denied** error?
>
> If you get a **Permission denied** error using either of the above
> methods, you do not have the permissions allowing you to remove
> `docker-compose`. To force the removal, prepend `sudo` to either of the above instructions and run it again.
{ .tip }
@y
> Got a **Permission denied** error?
>
> If you get a **Permission denied** error using either of the above
> methods, you do not have the permissions allowing you to remove
> `docker-compose`. To force the removal, prepend `sudo` to either of the above instructions and run it again.
{ .tip }
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

@x
```console
$ docker info --format '{{range .ClientInfo.Plugins}}{{if eq .Name "compose"}}{{.Path}}{{end}}{{end}}'
```
@y
```console
$ docker info --format '{{range .ClientInfo.Plugins}}{{if eq .Name "compose"}}{{.Path}}{{end}}{{end}}'
```
@z
