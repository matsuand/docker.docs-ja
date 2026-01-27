%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Using sandboxes effectively
linkTitle: Workflows
description: Best practices and common workflows for Docker Sandboxes including dependency management, testing, and multi-project setups.
@y
title: Using sandboxes effectively
linkTitle: Workflows
description: Best practices and common workflows for Docker Sandboxes including dependency management, testing, and multi-project setups.
@z

@x
{{< summary-bar feature_name="Docker Sandboxes" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes" >}}
@z

@x
This guide covers practical patterns for working with sandboxed agents.
@y
This guide covers practical patterns for working with sandboxed agents.
@z

@x
## Basic workflow
@y
## Basic workflow
@z

@x
Create a sandbox for your project:
@y
Create a sandbox for your project:
@z

@x
```console
$ cd ~/my-project
$ docker sandbox run claude .
```
@y
```console
$ cd ~/my-project
$ docker sandbox run claude .
```
@z

@x
The sandbox persists. Stop and restart it without losing installed packages or
configuration:
@y
The sandbox persists. Stop and restart it without losing installed packages or
configuration:
@z

@x
```console
$ docker sandbox run <sandbox-name>  # Reconnect later
```
@y
```console
$ docker sandbox run <sandbox-name>  # Reconnect later
```
@z

@x
## Installing dependencies
@y
## Installing dependencies
@z

@x
Ask the agent to install what's needed:
@y
Ask the agent to install what's needed:
@z

@x
```plaintext
You: "Install pytest and black"
Claude: [Installs packages via pip]
@y
```plaintext
You: "Install pytest and black"
Claude: [Installs packages via pip]
@z

@x
You: "Install build-essential"
Claude: [Installs via apt]
```
@y
You: "Install build-essential"
Claude: [Installs via apt]
```
@z

@x
The agent has sudo access. Installed packages persist for the sandbox lifetime.
This works for system packages, language packages, and development tools.
@y
The agent has sudo access. Installed packages persist for the sandbox lifetime.
This works for system packages, language packages, and development tools.
@z

@x
For teams or repeated setups, use [Custom templates](templates.md) to
pre-install tools.
@y
For teams or repeated setups, use [Custom templates](templates.md) to
pre-install tools.
@z

@x
## Docker inside sandboxes
@y
## Docker inside sandboxes
@z

@x
Agents can build images, run containers, and use Docker Compose. Everything
runs inside the sandbox's private Docker daemon.
@y
Agents can build images, run containers, and use Docker Compose. Everything
runs inside the sandbox's private Docker daemon.
@z

@x
### Testing containerized apps
@y
### Testing containerized apps
@z

@x
```plaintext
You: "Build the Docker image and run the tests"
@y
```plaintext
You: "Build the Docker image and run the tests"
@z

@x
Claude: *runs*
  docker build -t myapp:test .
  docker run myapp:test npm test
```
@y
Claude: *runs*
  docker build -t myapp:test .
  docker run myapp:test npm test
```
@z

@x
Containers started by the agent run inside the sandbox, not on your host. They
don't appear in your host's `docker ps`.
@y
Containers started by the agent run inside the sandbox, not on your host. They
don't appear in your host's `docker ps`.
@z

@x
### Multi-container stacks
@y
### Multi-container stacks
@z

@x
```plaintext
You: "Start the application with docker-compose and run integration tests"
@y
```plaintext
You: "Start the application with docker-compose and run integration tests"
@z

@x
Claude: *runs*
  docker-compose up -d
  docker-compose exec api pytest tests/integration
  docker-compose down
```
@y
Claude: *runs*
  docker-compose up -d
  docker-compose exec api pytest tests/integration
  docker-compose down
```
@z

@x
Remove the sandbox, and all images, containers, and volumes are deleted.
@y
Remove the sandbox, and all images, containers, and volumes are deleted.
@z

@x
## What persists
@y
## What persists
@z

@x
While a sandbox exists:
@y
While a sandbox exists:
@z

@x
- Installed packages (apt, pip, npm, etc.)
- Docker images and containers inside the sandbox
- Configuration changes
- Command history
@y
- Installed packages (apt, pip, npm, etc.)
- Docker images and containers inside the sandbox
- Configuration changes
- Command history
@z

@x
When you remove a sandbox:
@y
When you remove a sandbox:
@z

@x
- Everything inside is deleted
- Your workspace files remain on your host (synced back)
@y
- Everything inside is deleted
- Your workspace files remain on your host (synced back)
@z

@x
To preserve a configured environment, create a [Custom template](templates.md).
@y
To preserve a configured environment, create a [Custom template](templates.md).
@z

@x
## Named sandboxes
@y
## Named sandboxes
@z

@x
Use meaningful names for sandboxes you'll reuse:
@y
Use meaningful names for sandboxes you'll reuse:
@z

@x
```console
$ docker sandbox run --name myproject claude ~/project
```
@y
```console
$ docker sandbox run --name myproject claude ~/project
```
@z

@x
Create multiple sandboxes for the same workspace:
@y
Create multiple sandboxes for the same workspace:
@z

@x
```console
$ docker sandbox create --name dev claude ~/project
$ docker sandbox create --name staging claude ~/project
$ docker sandbox run dev
```
@y
```console
$ docker sandbox create --name dev claude ~/project
$ docker sandbox create --name staging claude ~/project
$ docker sandbox run dev
```
@z

@x
Each maintains separate packages, Docker images, and state, but share the
workspace files.
@y
Each maintains separate packages, Docker images, and state, but share the
workspace files.
@z

@x
## Debugging
@y
## Debugging
@z

@x
Access the sandbox directly with an interactive shell:
@y
Access the sandbox directly with an interactive shell:
@z

@x
```console
$ docker sandbox exec -it <sandbox-name> bash
```
@y
```console
$ docker sandbox exec -it <sandbox-name> bash
```
@z

@x
Inside the shell, you can inspect the environment, manually install packages,
or check Docker containers:
@y
Inside the shell, you can inspect the environment, manually install packages,
or check Docker containers:
@z

@x
```console
agent@sandbox:~$ docker ps
agent@sandbox:~$ docker images
```
@y
```console
agent@sandbox:~$ docker ps
agent@sandbox:~$ docker images
```
@z

@x
List all sandboxes:
@y
List all sandboxes:
@z

@x
```console
$ docker sandbox ls
```
@y
```console
$ docker sandbox ls
```
@z

@x
## Managing multiple projects
@y
## Managing multiple projects
@z

@x
Create sandboxes for different projects:
@y
Create sandboxes for different projects:
@z

@x
```console
$ docker sandbox create claude ~/project-a
$ docker sandbox create claude ~/project-b
$ docker sandbox create claude ~/work/client-project
```
@y
```console
$ docker sandbox create claude ~/project-a
$ docker sandbox create claude ~/project-b
$ docker sandbox create claude ~/work/client-project
```
@z

@x
Each sandbox is completely isolated. Switch between them by running the
appropriate sandbox name.
@y
Each sandbox is completely isolated. Switch between them by running the
appropriate sandbox name.
@z

@x
Remove unused sandboxes to reclaim disk space:
@y
Remove unused sandboxes to reclaim disk space:
@z

@x
```console
$ docker sandbox rm <sandbox-name>
```
@y
```console
$ docker sandbox rm <sandbox-name>
```
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Custom templates](templates.md)
- [Architecture](architecture.md)
- [Network policies](network-policies.md)
@y
- [Custom templates](templates.md)
- [Architecture](architecture.md)
- [Network policies](network-policies.md)
@z
