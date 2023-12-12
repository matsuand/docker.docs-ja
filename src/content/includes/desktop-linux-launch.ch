%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
To start Docker Desktop for Linux, search **Docker Desktop** on the
**Applications** menu and open it. This launches the Docker menu icon and opens
the Docker Dashboard, reporting the status of Docker Desktop.
@y
To start Docker Desktop for Linux, search **Docker Desktop** on the
**Applications** menu and open it. This launches the Docker menu icon and opens
the Docker Dashboard, reporting the status of Docker Desktop.
@z

@x
Alternatively, open a terminal and run:
@y
Alternatively, open a terminal and run:
@z

@x
```console
$ systemctl --user start docker-desktop
```
@y
```console
$ systemctl --user start docker-desktop
```
@z

@x
When Docker Desktop starts, it creates a dedicated [context](/engine/context/working-with-contexts) that the Docker CLI
can use as a target and sets it as the current context in use. This is to avoid
a clash with a local Docker Engine that may be running on the Linux host and
using the default context. On shutdown, Docker Desktop resets the current
context to the previous one.
@y
When Docker Desktop starts, it creates a dedicated [context](/engine/context/working-with-contexts) that the Docker CLI
can use as a target and sets it as the current context in use. This is to avoid
a clash with a local Docker Engine that may be running on the Linux host and
using the default context. On shutdown, Docker Desktop resets the current
context to the previous one.
@z

@x
The Docker Desktop installer updates Docker Compose and the Docker CLI binaries
on the host. It installs Docker Compose V2 and gives users the choice to
link it as docker-compose from the Settings panel. Docker Desktop installs
the new Docker CLI binary that includes cloud-integration capabilities in `/usr/local/bin/com.docker.cli`
and creates a symlink to the classic Docker CLI at `/usr/local/bin`.
@y
The Docker Desktop installer updates Docker Compose and the Docker CLI binaries
on the host. It installs Docker Compose V2 and gives users the choice to
link it as docker-compose from the Settings panel. Docker Desktop installs
the new Docker CLI binary that includes cloud-integration capabilities in `/usr/local/bin/com.docker.cli`
and creates a symlink to the classic Docker CLI at `/usr/local/bin`.
@z

@x
After you’ve successfully installed Docker Desktop, you can check the versions
of these binaries by running the following commands:
@y
After you’ve successfully installed Docker Desktop, you can check the versions
of these binaries by running the following commands:
@z

@x
```console
$ docker compose version
Docker Compose version v2.17.3
@y
```console
$ docker compose version
Docker Compose version v2.17.3
@z

@x
$ docker --version
Docker version 23.0.5, build bc4487a
@y
$ docker --version
Docker version 23.0.5, build bc4487a
@z

@x
$ docker version
Client: Docker Engine - Community
 Cloud integration: v1.0.31
 Version:           23.0.5
 API version:       1.42
<...>
```
@y
$ docker version
Client: Docker Engine - Community
 Cloud integration: v1.0.31
 Version:           23.0.5
 API version:       1.42
<...>
```
@z

@x
To enable Docker Desktop to start on login, from the Docker menu, select
**Settings** > **General** > **Start Docker Desktop when you log in**.
@y
To enable Docker Desktop to start on login, from the Docker menu, select
**Settings** > **General** > **Start Docker Desktop when you log in**.
@z

@x
Alternatively, open a terminal and run:
@y
Alternatively, open a terminal and run:
@z

@x
```console
$ systemctl --user enable docker-desktop
```
@y
```console
$ systemctl --user enable docker-desktop
```
@z

@x
To stop Docker Desktop, select the Docker menu icon to open the Docker menu and select **Quit Docker Desktop**.
@y
To stop Docker Desktop, select the Docker menu icon to open the Docker menu and select **Quit Docker Desktop**.
@z

@x
Alternatively, open a terminal and run:
@y
Alternatively, open a terminal and run:
@z

@x
```console
$ systemctl --user stop docker-desktop
```
@y
```console
$ systemctl --user stop docker-desktop
```
@z
