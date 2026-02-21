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
The most recent versions of Docker Desktop create microVM-based sandboxes,
replacing the container-based implementation released in earlier versions. This
guide helps you migrate from legacy sandboxes to the new architecture.
@y
The most recent versions of Docker Desktop create microVM-based sandboxes,
replacing the container-based implementation released in earlier versions. This
guide helps you migrate from legacy sandboxes to the new architecture.
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
After upgrading to Docker Desktop 4.58 or later:
@y
After upgrading to Docker Desktop 4.58 or later:
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

% snip command...

@x
3. Remove the credential volume:
@y
3. Remove the credential volume:
@z

% snip command...

@x
4. Create a new microVM sandbox:
@y
4. Create a new microVM sandbox:
@z

% snip command...

@x
5. Reinstall dependencies. Ask the agent to install needed tools:
@y
5. Reinstall dependencies. Ask the agent to install needed tools:
@z

% snip text...

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

% snip command...

@x
2. Create a custom template with your tools:
@y
2. Create a custom template with your tools:
@z

@x within code
   # Install your tools
@y
   # Install your tools
@z
@x
   # Install language-specific packages
@y
   # Install language-specific packages
@z
@x
   # Add any custom configuration
@y
   # Add any custom configuration
@z

@x
3. Build your template:
@y
3. Build your template:
@z

% snip command...

@x
4. Create a new sandbox with your template:
@y
4. Create a new sandbox with your template:
@z

% snip command...

@x
   > [!NOTE]
   > The `--pull-template` flag was introduced in Docker Desktop 4.61 (Sandbox
   > version 0.12). On Docker Desktop 4.58–4.60, use `--load-local-template`
   > to use a locally-built template image.
@y
   > [!NOTE]
   > The `--pull-template` flag was introduced in Docker Desktop 4.61 (Sandbox
   > version 0.12). On Docker Desktop 4.58–4.60, use `--load-local-template`
   > to use a locally-built template image.
@z

@x
5. Run the sandbox:
@y
5. Run the sandbox:
@z

% snip command...

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

% snip command...

@x
Remove all stopped containers and unused volumes:
@y
Remove all stopped containers and unused volumes:
@z

% snip command...

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

% snip command...

@x
New command structure:
@y
New command structure:
@z

% snip command...

@x
The agent name is now a required parameter when creating sandboxes, and you run
the sandbox by name.
@y
The agent name is now a required parameter when creating sandboxes, and you run
the sandbox by name.
@z
