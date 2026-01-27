%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Migrating from legacy sandboxes
description: Migrate from container-based sandboxes to microVM-based sandboxes
@y
title: Migrating from legacy sandboxes
description: Migrate from container-based sandboxes to microVM-based sandboxes
@z

@x
{{< summary-bar feature_name="Docker Sandboxes" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes" >}}
@z

@x
Docker Desktop 4.58 introduces microVM-based sandboxes, replacing the previous
container-based implementation. This guide helps you migrate from legacy
sandboxes to the new architecture.
@y
Docker Desktop 4.58 introduces microVM-based sandboxes, replacing the previous
container-based implementation. This guide helps you migrate from legacy
sandboxes to the new architecture.
@z

@x
## What changed
@y
## What changed
@z

@x
Docker Sandboxes now run in lightweight microVMs instead of containers. Each
sandbox has a private Docker daemon, better isolation, and network filtering
policies.
@y
Docker Sandboxes now run in lightweight microVMs instead of containers. Each
sandbox has a private Docker daemon, better isolation, and network filtering
policies.
@z

@x
> [!NOTE]
> If you need to use legacy container-based sandboxes, install
> [Docker Desktop 4.57](/desktop/release-notes/#4570).
@y
> [!NOTE]
> If you need to use legacy container-based sandboxes, install
> [Docker Desktop 4.57](__SUBDIR__/desktop/release-notes/#4570).
@z

@x
After upgrading to Docker Desktop 4.58:
@y
After upgrading to Docker Desktop 4.58:
@z

@x
- Old sandboxes don't appear in `docker sandbox ls`
- They still exist as regular Docker containers and volumes
- You can see them with `docker ps -a` and `docker volume ls`
- Old sandboxes won't work with the new CLI commands
- Running `docker sandbox run` creates a new microVM-based sandbox
@y
- Old sandboxes don't appear in `docker sandbox ls`
- They still exist as regular Docker containers and volumes
- You can see them with `docker ps -a` and `docker volume ls`
- Old sandboxes won't work with the new CLI commands
- Running `docker sandbox run` creates a new microVM-based sandbox
@z

@x
## Migration options
@y
## Migration options
@z

@x
Choose the approach that fits your situation:
@y
Choose the approach that fits your situation:
@z

@x
### Option 1: Start fresh (recommended)
@y
### Option 1: Start fresh (recommended)
@z

@x
This is the simplest approach for experimental features. You'll recreate your
sandbox with the new architecture.
@y
This is the simplest approach for experimental features. You'll recreate your
sandbox with the new architecture.
@z

@x
1. Note any important configuration or installed packages in your old sandbox.
@y
1. Note any important configuration or installed packages in your old sandbox.
@z

@x
2. Remove the old sandbox containers:
@y
2. Remove the old sandbox containers:
@z

@x
   ```console
   $ docker rm -f $(docker ps -q -a --filter="label=docker/sandbox=true")
   ```
@y
   ```console
   $ docker rm -f $(docker ps -q -a --filter="label=docker/sandbox=true")
   ```
@z

@x
3. Remove the credential volume:
@y
3. Remove the credential volume:
@z

@x
   ```console
   $ docker volume rm docker-claude-sandbox-data
   ```
@y
   ```console
   $ docker volume rm docker-claude-sandbox-data
   ```
@z

@x
4. Create a new microVM sandbox:
@y
4. Create a new microVM sandbox:
@z

@x
   ```console
   $ docker sandbox create claude ~/project
   $ docker sandbox run <sandbox-name>
   ```
@y
   ```console
   $ docker sandbox create claude ~/project
   $ docker sandbox run <sandbox-name>
   ```
@z

@x
5. Reinstall dependencies. Ask the agent to install needed tools:
@y
5. Reinstall dependencies. Ask the agent to install needed tools:
@z

@x
   ```plaintext
   You: "Install all the tools needed to build and test this project"
   Claude: [Installs tools]
   ```
@y
   ```plaintext
   You: "Install all the tools needed to build and test this project"
   Claude: [Installs tools]
   ```
@z

@x
What you lose:
@y
What you lose:
@z

@x
- API keys (re-authenticate on first run, or set `ANTHROPIC_API_KEY`)
- Installed packages (reinstall via the agent)
- Custom configuration (reconfigure as needed)
@y
- API keys (re-authenticate on first run, or set `ANTHROPIC_API_KEY`)
- Installed packages (reinstall via the agent)
- Custom configuration (reconfigure as needed)
@z

@x
What you gain:
@y
What you gain:
@z

@x
- Better isolation (microVM versus container)
- Private Docker daemon for test containers
- Network filtering policies
- Improved security
@y
- Better isolation (microVM versus container)
- Private Docker daemon for test containers
- Network filtering policies
- Improved security
@z

@x
### Option 2: Migrate configuration
@y
### Option 2: Migrate configuration
@z

@x
If you have extensive customization, preserve your setup by creating a custom
template.
@y
If you have extensive customization, preserve your setup by creating a custom
template.
@z

@x
1. Inspect your old sandbox to see what's installed:
@y
1. Inspect your old sandbox to see what's installed:
@z

@x
   ```console
   $ docker exec <old-sandbox-container> dpkg -l
   ```
@y
   ```console
   $ docker exec <old-sandbox-container> dpkg -l
   ```
@z

@x
2. Create a custom template with your tools:
@y
2. Create a custom template with your tools:
@z

@x
   ```dockerfile
   FROM docker/sandbox-templates:claude-code
@y
   ```dockerfile
   FROM docker/sandbox-templates:claude-code
@z

@x
   USER root
@y
   USER root
@z

@x
   # Install your tools
   RUN apt-get update && apt-get install -y \
       build-essential \
       nodejs \
       npm
@y
   # Install your tools
   RUN apt-get update && apt-get install -y \
       build-essential \
       nodejs \
       npm
@z

@x
   # Install language-specific packages
   RUN npm install -g typescript eslint
@y
   # Install language-specific packages
   RUN npm install -g typescript eslint
@z

@x
   # Add any custom configuration
   ENV EDITOR=vim
@y
   # Add any custom configuration
   ENV EDITOR=vim
@z

@x
   USER agent
   ```
@y
   USER agent
   ```
@z

@x
3. Build your template:
@y
3. Build your template:
@z

@x
   ```console
   $ docker build -t my-sandbox-template:v1 .
   ```
@y
   ```console
   $ docker build -t my-sandbox-template:v1 .
   ```
@z

@x
4. Create a new sandbox with your template:
@y
4. Create a new sandbox with your template:
@z

@x
   ```console
   $ docker sandbox create --template my-sandbox-template:v1 \
       --load-local-template \
       claude ~/project
   ```
@y
   ```console
   $ docker sandbox create --template my-sandbox-template:v1 \
       --load-local-template \
       claude ~/project
   ```
@z

@x
5. Run the sandbox:
@y
5. Run the sandbox:
@z

@x
   ```console
   $ docker sandbox run <sandbox-name>
   ```
@y
   ```console
   $ docker sandbox run <sandbox-name>
   ```
@z

@x
If you want to share this template with your team, push it to a registry. See
[Custom templates](templates.md) for details.
@y
If you want to share this template with your team, push it to a registry. See
[Custom templates](templates.md) for details.
@z

@x
## Cleanup old resources
@y
## Cleanup old resources
@z

@x
After migrating, clean up legacy containers and volumes:
@y
After migrating, clean up legacy containers and volumes:
@z

@x
Remove specific sandbox:
@y
Remove specific sandbox:
@z

@x
```console
$ docker rm -f <old-sandbox-container>
$ docker volume rm docker-claude-sandbox-data
```
@y
```console
$ docker rm -f <old-sandbox-container>
$ docker volume rm docker-claude-sandbox-data
```
@z

@x
Remove all stopped containers and unused volumes:
@y
Remove all stopped containers and unused volumes:
@z

@x
```console
$ docker container prune
$ docker volume prune
```
@y
```console
$ docker container prune
$ docker volume prune
```
@z

@x
> [!WARNING]
> `docker volume prune` removes ALL unused volumes, not just sandbox volumes.
> Make sure you don't have other important unused volumes before running this
> command.
@y
> [!WARNING]
> `docker volume prune` removes ALL unused volumes, not just sandbox volumes.
> Make sure you don't have other important unused volumes before running this
> command.
@z

@x
## Understanding the differences
@y
## Understanding the differences
@z

@x
### Architecture
@y
### Architecture
@z

@x
Old (container-based):
@y
Old (container-based):
@z

@x
- Sandboxes were Docker containers
- Appeared in `docker ps`
- Mounted host Docker socket for container access
- Stored credentials in Docker volume
@y
- Sandboxes were Docker containers
- Appeared in `docker ps`
- Mounted host Docker socket for container access
- Stored credentials in Docker volume
@z

@x
New (microVM-based):
@y
New (microVM-based):
@z

@x
- Sandboxes are lightweight microVMs
- Use `docker sandbox ls` to see them
- Private Docker daemon inside VM
- Credentials via `ANTHROPIC_API_KEY` environment variable or interactive auth
@y
- Sandboxes are lightweight microVMs
- Use `docker sandbox ls` to see them
- Private Docker daemon inside VM
- Credentials via `ANTHROPIC_API_KEY` environment variable or interactive auth
@z

@x
### CLI changes
@y
### CLI changes
@z

@x
Old command structure:
@y
Old command structure:
@z

@x
```console
$ docker sandbox run ~/project
```
@y
```console
$ docker sandbox run ~/project
```
@z

@x
New command structure:
@y
New command structure:
@z

@x
```console
$ docker sandbox run claude ~/project
```
@y
```console
$ docker sandbox run claude ~/project
```
@z

@x
The agent name (`claude`, `codex`, `gemini`, `cagent`, `kiro`) is now a
required parameter when creating sandboxes, and you run the sandbox by name.
@y
The agent name (`claude`, `codex`, `gemini`, `cagent`, `kiro`) is now a
required parameter when creating sandboxes, and you run the sandbox by name.
@z
