%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Using the Docker Desktop CLI
linkTitle: Docker Desktop CLI
@y
title: Using the Docker Desktop CLI
linkTitle: Docker Desktop CLI
@z

@x
description: How to use the Docker Desktop CLI
keywords: cli, docker desktop, macos, windows, linux
@y
description: How to use the Docker Desktop CLI
keywords: cli, docker desktop, macos, windows, linux
@z

@x
{{< summary-bar feature_name="Docker Desktop CLI" >}}
@y
{{< summary-bar feature_name="Docker Desktop CLI" >}}
@z

@x
The Docker Desktop CLI lets you perform key operations such as starting, stopping, restarting, and updating Docker Desktop directly from the command line.
@y
The Docker Desktop CLI lets you perform key operations such as starting, stopping, restarting, and updating Docker Desktop directly from the command line.
@z

@x
The Docker Desktop CLI provides:
@y
The Docker Desktop CLI provides:
@z

@x
- Simplified automation for local development: Execute Docker Desktop operations more efficiently in scripts and tests. 
- An improved developer experience: Restart, quit, or reset Docker Desktop from the command line, reducing dependency on the Docker Desktop Dashboard and improving flexibility and efficiency.
@y
- Simplified automation for local development: Execute Docker Desktop operations more efficiently in scripts and tests. 
- An improved developer experience: Restart, quit, or reset Docker Desktop from the command line, reducing dependency on the Docker Desktop Dashboard and improving flexibility and efficiency.
@z

@x
## Usage
@y
## Usage
@z

@x
```console
docker desktop COMMAND [OPTIONS]
```
@y
```console
docker desktop COMMAND [OPTIONS]
```
@z

@x
## Commands
@y
## Commands
@z

@x
| Command              | Description                              |
|:---------------------|:-----------------------------------------|
| `start`              | Starts Docker Desktop                    |
| `stop`               | Stops Docker Desktop                     |
| `restart`            | Restarts Docker Desktop                  |
| `status`             | Displays whether Docker Desktop is running or stopped.       |
| `engine ls`          | Lists available engines (Windows only)   |
| `engine use`         | Switch between Linux and Windows containers (Windows only) |
| `update`             | Manage Docker Desktop updates. Available for Mac only with Docker Desktop version 4.38, or all OSs with Docker Desktop version 4.39 and later. |
| `logs`               | Print log entries                        |
@y
| Command              | Description                              |
|:---------------------|:-----------------------------------------|
| `start`              | Starts Docker Desktop                    |
| `stop`               | Stops Docker Desktop                     |
| `restart`            | Restarts Docker Desktop                  |
| `status`             | Displays whether Docker Desktop is running or stopped.       |
| `engine ls`          | Lists available engines (Windows only)   |
| `engine use`         | Switch between Linux and Windows containers (Windows only) |
| `update`             | Manage Docker Desktop updates. Available for Mac only with Docker Desktop version 4.38, or all OSs with Docker Desktop version 4.39 and later. |
| `logs`               | Print log entries                        |
@z

@x
For more details on each command, see the [Docker Desktop CLI reference](/reference/cli/docker/desktop/_index.md).
@y
For more details on each command, see the [Docker Desktop CLI reference](reference/cli/docker/desktop/_index.md).
@z
