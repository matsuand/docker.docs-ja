%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Custom templates
description: Create custom sandbox templates to standardize development environments with pre-installed tools and configurations.
@y
title: Custom templates
description: Create custom sandbox templates to standardize development environments with pre-installed tools and configurations.
@z

@x
{{< summary-bar feature_name="Docker Sandboxes" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes" >}}
@z

@x
Custom templates let you create reusable sandbox environments with
pre-installed tools and configuration. Instead of asking the agent to install
packages each time, build a template with everything ready.
@y
Custom templates let you create reusable sandbox environments with
pre-installed tools and configuration. Instead of asking the agent to install
packages each time, build a template with everything ready.
@z

@x
## When to use custom templates
@y
## When to use custom templates
@z

@x
Use custom templates when:
@y
Use custom templates when:
@z

@x
- Multiple team members need the same environment
- You're creating many sandboxes with identical tooling
- Setup involves complex steps that are tedious to repeat
- You need specific versions of tools or libraries
@y
- Multiple team members need the same environment
- You're creating many sandboxes with identical tooling
- Setup involves complex steps that are tedious to repeat
- You need specific versions of tools or libraries
@z

@x
For one-off work or simple setups, use the default template and ask the agent
to install what's needed.
@y
For one-off work or simple setups, use the default template and ask the agent
to install what's needed.
@z

@x
## Building a template
@y
## Building a template
@z

@x
Start from Docker's official sandbox templates:
@y
Start from Docker's official sandbox templates:
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
# Install system packages
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*
@y
# Install system packages
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*
@z

@x
# Install development tools
RUN pip3 install --no-cache-dir \
    pytest \
    black \
    pylint
@y
# Install development tools
RUN pip3 install --no-cache-dir \
    pytest \
    black \
    pylint
@z

@x
USER agent
```
@y
USER agent
```
@z

@x
Official templates include the agent binary, Ubuntu base, development tools
(Git, Docker CLI, Node.js, Python, Go), and the non-root `agent` user with
sudo access.
@y
Official templates include the agent binary, Ubuntu base, development tools
(Git, Docker CLI, Node.js, Python, Go), and the non-root `agent` user with
sudo access.
@z

@x
### The USER pattern
@y
### The USER pattern
@z

@x
Switch to `root` for system-level installations, then back to `agent` at the
end. The base template defaults to `USER agent`, so you need to explicitly
switch to root for package installations. Always switch back to `agent` before
the end of your Dockerfile so the agent runs with the correct permissions.
@y
Switch to `root` for system-level installations, then back to `agent` at the
end. The base template defaults to `USER agent`, so you need to explicitly
switch to root for package installations. Always switch back to `agent` before
the end of your Dockerfile so the agent runs with the correct permissions.
@z

@x
### Using templates
@y
### Using templates
@z

@x
Build your template:
@y
Build your template:
@z

@x
```console
$ docker build -t my-template:v1 .
```
@y
```console
$ docker build -t my-template:v1 .
```
@z

@x
Then choose how to use it:
@y
Then choose how to use it:
@z

@x
Option 1: Load from local images (quick, for personal use)
@y
Option 1: Load from local images (quick, for personal use)
@z

@x
```console
$ docker sandbox create --template my-template:v1 \
    --load-local-template \
    claude ~/project
$ docker sandbox run <sandbox-name>
```
@y
```console
$ docker sandbox create --template my-template:v1 \
    --load-local-template \
    claude ~/project
$ docker sandbox run <sandbox-name>
```
@z

@x
The `--load-local-template` flag loads the image from your local Docker daemon
into the sandbox VM. This works for quick iteration and personal templates.
@y
The `--load-local-template` flag loads the image from your local Docker daemon
into the sandbox VM. This works for quick iteration and personal templates.
@z

@x
Option 2: Push to a registry (for sharing and persistence)
@y
Option 2: Push to a registry (for sharing and persistence)
@z

@x
```console
$ docker tag my-template:v1 myorg/my-template:v1
$ docker push myorg/my-template:v1
$ docker sandbox create --template myorg/my-template:v1 claude ~/project
$ docker sandbox run <sandbox-name>
```
@y
```console
$ docker tag my-template:v1 myorg/my-template:v1
$ docker push myorg/my-template:v1
$ docker sandbox create --template myorg/my-template:v1 claude ~/project
$ docker sandbox run <sandbox-name>
```
@z

@x
Pushing to a registry makes templates available to your team and persists them
beyond your local machine.
@y
Pushing to a registry makes templates available to your team and persists them
beyond your local machine.
@z

@x
## Example: Node.js template
@y
## Example: Node.js template
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
RUN apt-get update && apt-get install -y curl \
    && rm -rf /var/lib/apt/lists/*
@y
RUN apt-get update && apt-get install -y curl \
    && rm -rf /var/lib/apt/lists/*
@z

@x
# Install Node.js 20 LTS
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*
@y
# Install Node.js 20 LTS
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*
@z

@x
# Install common tools
RUN npm install -g \
    typescript@5.1.6 \
    eslint@8.46.0 \
    prettier@3.0.0
@y
# Install common tools
RUN npm install -g \
    typescript@5.1.6 \
    eslint@8.46.0 \
    prettier@3.0.0
@z

@x
USER agent
```
@y
USER agent
```
@z

@x
Pin versions for reproducible builds.
@y
Pin versions for reproducible builds.
@z

@x
## Using standard images
@y
## Using standard images
@z

@x
You can use standard Docker images (like `python:3.11` or `node:20`) as a
base, but they don't include agent binaries or sandbox configuration.
@y
You can use standard Docker images (like `python:3.11` or `node:20`) as a
base, but they don't include agent binaries or sandbox configuration.
@z

@x
Using a standard image directly creates the sandbox but fails at runtime:
@y
Using a standard image directly creates the sandbox but fails at runtime:
@z

@x
```console
$ docker sandbox create --template python:3-slim claude ~/project
✓ Created sandbox claude-sandbox-2026-01-16-170525 in VM claude-project
@y
```console
$ docker sandbox create --template python:3-slim claude ~/project
✓ Created sandbox claude-sandbox-2026-01-16-170525 in VM claude-project
@z

@x
$ docker sandbox run claude-project
agent binary "claude" not found in sandbox: verify this is the correct sandbox type
```
@y
$ docker sandbox run claude-project
agent binary "claude" not found in sandbox: verify this is the correct sandbox type
```
@z

@x
To use a standard image, you'd need to install the agent binary, add sandbox
dependencies, configure the shell, and set up the `agent` user. Building from
`docker/sandbox-templates:claude-code` is simpler.
@y
To use a standard image, you'd need to install the agent binary, add sandbox
dependencies, configure the shell, and set up the `agent` user. Building from
`docker/sandbox-templates:claude-code` is simpler.
@z

@x
## Sharing with teams
@y
## Sharing with teams
@z

@x
Push templates to a registry and version them:
@y
Push templates to a registry and version them:
@z

@x
```console
$ docker build -t myorg/sandbox-templates:python-v1.0 .
$ docker push myorg/sandbox-templates:python-v1.0
```
@y
```console
$ docker build -t myorg/sandbox-templates:python-v1.0 .
$ docker push myorg/sandbox-templates:python-v1.0
```
@z

@x
Team members can then use the template:
@y
Team members can then use the template:
@z

@x
```console
$ docker sandbox create --template myorg/sandbox-templates:python-v1.0 claude ~/project
```
@y
```console
$ docker sandbox create --template myorg/sandbox-templates:python-v1.0 claude ~/project
```
@z

@x
Using version tags (`:v1.0`, `:v2.0`) instead of `:latest` ensures stability
across your team.
@y
Using version tags (`:v1.0`, `:v2.0`) instead of `:latest` ensures stability
across your team.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Using sandboxes effectively](workflows.md)
- [Architecture](architecture.md)
- [Network policies](network-policies.md)
@y
- [Using sandboxes effectively](workflows.md)
- [Architecture](architecture.md)
- [Network policies](network-policies.md)
@z
