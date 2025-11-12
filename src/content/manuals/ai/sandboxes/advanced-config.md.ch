%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Advanced configurations
linkTitle: Advanced
description: Docker access, volume mounting, environment variables, custom templates, and sandbox management.
@y
title: Advanced configurations
linkTitle: Advanced
description: Docker access, volume mounting, environment variables, custom templates, and sandbox management.
@z

@x
{{< summary-bar feature_name="Docker Sandboxes" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes" >}}
@z

@x
This guide covers advanced configurations for sandboxed agents running locally.
@y
This guide covers advanced configurations for sandboxed agents running locally.
@z

@x
## Managing sandboxes
@y
## Managing sandboxes
@z

@x
### Recreating sandboxes
@y
### Recreating sandboxes
@z

@x
Since Docker enforces one sandbox per workspace, the same sandbox is reused
each time you run `docker sandbox run <agent>` in a given directory. To create
a fresh sandbox, you need to remove the existing one first:
@y
Since Docker enforces one sandbox per workspace, the same sandbox is reused
each time you run `docker sandbox run <agent>` in a given directory. To create
a fresh sandbox, you need to remove the existing one first:
@z

@x
```console
$ docker sandbox ls  # Find the sandbox ID
$ docker sandbox rm <sandbox-id>
$ docker sandbox run <agent>  # Creates a new sandbox
```
@y
```console
$ docker sandbox ls  # Find the sandbox ID
$ docker sandbox rm <sandbox-id>
$ docker sandbox run <agent>  # Creates a new sandbox
```
@z

@x
### When to recreate sandboxes
@y
### When to recreate sandboxes
@z

@x
Sandboxes remember their initial configuration and don't pick up changes from subsequent `docker sandbox run` commands. You must recreate the sandbox to modify:
@y
Sandboxes remember their initial configuration and don't pick up changes from subsequent `docker sandbox run` commands. You must recreate the sandbox to modify:
@z

@x
- Environment variables (the `-e` flag)
- Volume mounts (the `-v` flag)
- Docker socket access (the `--mount-docker-socket` flag)
- Credentials mode (the `--credentials` flag)
@y
- Environment variables (the `-e` flag)
- Volume mounts (the `-v` flag)
- Docker socket access (the `--mount-docker-socket` flag)
- Credentials mode (the `--credentials` flag)
@z

@x
### Listing and inspecting sandboxes
@y
### Listing and inspecting sandboxes
@z

@x
View all your sandboxes:
@y
View all your sandboxes:
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
Get detailed information about a specific sandbox:
@y
Get detailed information about a specific sandbox:
@z

@x
```console
$ docker sandbox inspect <sandbox-id>
```
@y
```console
$ docker sandbox inspect <sandbox-id>
```
@z

@x
This shows the sandbox's configuration, including environment variables, volumes, and creation time.
@y
This shows the sandbox's configuration, including environment variables, volumes, and creation time.
@z

@x
### Removing sandboxes
@y
### Removing sandboxes
@z

@x
Remove a specific sandbox:
@y
Remove a specific sandbox:
@z

@x
```console
$ docker sandbox rm <sandbox-id>
```
@y
```console
$ docker sandbox rm <sandbox-id>
```
@z

@x
Remove all sandboxes at once:
@y
Remove all sandboxes at once:
@z

@x
```console
$ docker sandbox rm $(docker sandbox ls -q)
```
@y
```console
$ docker sandbox rm $(docker sandbox ls -q)
```
@z

@x
This is useful for cleanup when you're done with a project or want to start fresh.
@y
This is useful for cleanup when you're done with a project or want to start fresh.
@z

@x
## Giving agents access to Docker
@y
## Giving agents access to Docker
@z

@x
Mount the Docker socket to give agents access to Docker commands inside the
container. The agent can build images, run containers, and work with Docker
Compose setups.
@y
Mount the Docker socket to give agents access to Docker commands inside the
container. The agent can build images, run containers, and work with Docker
Compose setups.
@z

@x
> [!CAUTION]
> Mounting the Docker socket grants the agent full access to your Docker daemon,
> which has root-level privileges on your system. The agent can start or stop
> any container, access volumes, and potentially escape the sandbox. Only use
> this option when you fully trust the code the agent is working with.
@y
> [!CAUTION]
> Mounting the Docker socket grants the agent full access to your Docker daemon,
> which has root-level privileges on your system. The agent can start or stop
> any container, access volumes, and potentially escape the sandbox. Only use
> this option when you fully trust the code the agent is working with.
@z

@x
### Enable Docker socket access
@y
### Enable Docker socket access
@z

@x
Use the `--mount-docker-socket` flag:
@y
Use the `--mount-docker-socket` flag:
@z

@x
```console
$ docker sandbox run --mount-docker-socket claude
```
@y
```console
$ docker sandbox run --mount-docker-socket claude
```
@z

@x
This mounts your host's Docker socket (`/var/run/docker.sock`) into the
container, giving the agent access to Docker commands.
@y
This mounts your host's Docker socket (`/var/run/docker.sock`) into the
container, giving the agent access to Docker commands.
@z

@x
> [!IMPORTANT]
> The agent can see and interact with all containers on your host, not just
> those created within the sandbox.
@y
> [!IMPORTANT]
> The agent can see and interact with all containers on your host, not just
> those created within the sandbox.
@z

@x
### Example: Testing a containerized application
@y
### Example: Testing a containerized application
@z

@x
If your project has a Dockerfile, the agent can build and test it:
@y
If your project has a Dockerfile, the agent can build and test it:
@z

@x
```console
$ cd ~/my-docker-app
$ docker sandbox run --mount-docker-socket claude
```
@y
```console
$ cd ~/my-docker-app
$ docker sandbox run --mount-docker-socket claude
```
@z

@x
Example conversation:
@y
Example conversation:
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
### What agents can do with Docker socket access
@y
### What agents can do with Docker socket access
@z

@x
With Docker access enabled, agents can:
@y
With Docker access enabled, agents can:
@z

@x
- Start multi-container applications with Docker Compose
- Build images for multiple architectures
- Manage existing containers on your host
- Validate Dockerfiles and test build processes
@y
- Start multi-container applications with Docker Compose
- Build images for multiple architectures
- Manage existing containers on your host
- Validate Dockerfiles and test build processes
@z

@x
## Environment variables
@y
## Environment variables
@z

@x
Pass environment variables to configure the sandbox environment with the `-e`
flag:
@y
Pass environment variables to configure the sandbox environment with the `-e`
flag:
@z

@x
```console
$ docker sandbox run \
  -e NODE_ENV=development \
  -e DATABASE_URL=postgresql://localhost/myapp_dev \
  -e DEBUG=true \
  claude
```
@y
```console
$ docker sandbox run \
  -e NODE_ENV=development \
  -e DATABASE_URL=postgresql://localhost/myapp_dev \
  -e DEBUG=true \
  claude
```
@z

@x
These variables are available to all processes in the container, including the
agent and any commands it runs. Use multiple `-e` flags for multiple variables.
@y
These variables are available to all processes in the container, including the
agent and any commands it runs. Use multiple `-e` flags for multiple variables.
@z

@x
### Example: Development environment setup
@y
### Example: Development environment setup
@z

@x
Set up a complete development environment:
@y
Set up a complete development environment:
@z

@x
```console
$ docker sandbox run \
  -e NODE_ENV=development \
  -e DATABASE_URL=postgresql://localhost/myapp_dev \
  -e REDIS_URL=redis://localhost:6379 \
  -e LOG_LEVEL=debug \
  claude
```
@y
```console
$ docker sandbox run \
  -e NODE_ENV=development \
  -e DATABASE_URL=postgresql://localhost/myapp_dev \
  -e REDIS_URL=redis://localhost:6379 \
  -e LOG_LEVEL=debug \
  claude
```
@z

@x
Example conversation:
@y
Example conversation:
@z

@x
```plaintext
You: "Run the database migrations and start the development server"
@y
```plaintext
You: "Run the database migrations and start the development server"
@z

@x
Claude: *uses DATABASE_URL and other environment variables*
  npm run migrate
  npm run dev
```
@y
Claude: *uses DATABASE_URL and other environment variables*
  npm run migrate
  npm run dev
```
@z

@x
### Common use cases
@y
### Common use cases
@z

@x
API keys for testing:
@y
API keys for testing:
@z

@x
```console
$ docker sandbox run \
  -e STRIPE_TEST_KEY=sk_test_xxx \
  -e SENDGRID_API_KEY=SG.xxx \
  claude
```
@y
```console
$ docker sandbox run \
  -e STRIPE_TEST_KEY=sk_test_xxx \
  -e SENDGRID_API_KEY=SG.xxx \
  claude
```
@z

@x
> [!CAUTION]
> Only use test/development API keys in sandboxes, never production keys.
@y
> [!CAUTION]
> Only use test/development API keys in sandboxes, never production keys.
@z

@x
Loading from .env files:
@y
Loading from .env files:
@z

@x
Sandboxes don't automatically load `.env` files from your workspace, but you can ask Claude to use them:
@y
Sandboxes don't automatically load `.env` files from your workspace, but you can ask Claude to use them:
@z

@x
```plaintext
You: "Load environment variables from .env.development and start the server"
```
@y
```plaintext
You: "Load environment variables from .env.development and start the server"
```
@z

@x
Claude can use `dotenv` tools or source the file directly.
@y
Claude can use `dotenv` tools or source the file directly.
@z

@x
## Volume mounting
@y
## Volume mounting
@z

@x
Mount additional directories or files to share data beyond your main workspace.
Use the `-v` flag with the syntax `host-path:container-path`:
@y
Mount additional directories or files to share data beyond your main workspace.
Use the `-v` flag with the syntax `host-path:container-path`:
@z

@x
```console
$ docker sandbox run -v ~/datasets:/data claude
```
@y
```console
$ docker sandbox run -v ~/datasets:/data claude
```
@z

@x
This makes `~/datasets` available at `/data` inside the container. The agent
can read and write files in this location.
@y
This makes `~/datasets` available at `/data` inside the container. The agent
can read and write files in this location.
@z

@x
Read-only mounts:
@y
Read-only mounts:
@z

@x
Add `:ro` to prevent modifications:
@y
Add `:ro` to prevent modifications:
@z

@x
```console
$ docker sandbox run -v ~/configs/app.yml:/config/app.yml:ro claude
```
@y
```console
$ docker sandbox run -v ~/configs/app.yml:/config/app.yml:ro claude
```
@z

@x
Multiple mounts:
@y
Multiple mounts:
@z

@x
Use multiple `-v` flags to mount several locations:
@y
Use multiple `-v` flags to mount several locations:
@z

@x
```console
$ docker sandbox run \
  -v ~/datasets:/data:ro \
  -v ~/models:/models \
  -v ~/.cache/pip:/root/.cache/pip \
  claude
```
@y
```console
$ docker sandbox run \
  -v ~/datasets:/data:ro \
  -v ~/models:/models \
  -v ~/.cache/pip:/root/.cache/pip \
  claude
```
@z

@x
### Example: Machine learning workflow
@y
### Example: Machine learning workflow
@z

@x
Set up an ML environment with shared datasets, model storage, and persistent
caches:
@y
Set up an ML environment with shared datasets, model storage, and persistent
caches:
@z

@x
```console
$ docker sandbox run \
  -v ~/datasets:/data:ro \
  -v ~/models:/models \
  -v ~/.cache/pip:/root/.cache/pip \
  claude
```
@y
```console
$ docker sandbox run \
  -v ~/datasets:/data:ro \
  -v ~/models:/models \
  -v ~/.cache/pip:/root/.cache/pip \
  claude
```
@z

@x
This provides read-only access to datasets (preventing accidental modifications),
read-write access to save trained models, and a persistent pip cache for faster
package installs across sessions.
@y
This provides read-only access to datasets (preventing accidental modifications),
read-write access to save trained models, and a persistent pip cache for faster
package installs across sessions.
@z

@x
Example conversation:
@y
Example conversation:
@z

@x
```plaintext
You: "Train a model on the MNIST dataset and save it to /models"
@y
```plaintext
You: "Train a model on the MNIST dataset and save it to /models"
@z

@x
Claude: *runs*
  python train.py --data /data/mnist --output /models/mnist_model.h5
```
@y
Claude: *runs*
  python train.py --data /data/mnist --output /models/mnist_model.h5
```
@z

@x
### Common use cases
@y
### Common use cases
@z

@x
Shared configuration files:
@y
Shared configuration files:
@z

@x
```console
$ docker sandbox run -v ~/.aws:/root/.aws:ro claude
```
@y
```console
$ docker sandbox run -v ~/.aws:/root/.aws:ro claude
```
@z

@x
Build caches:
@y
Build caches:
@z

@x
```console
$ docker sandbox run \
  -v ~/.cache/go-build:/root/.cache/go-build \
  -v ~/go/pkg/mod:/go/pkg/mod \
  claude
```
@y
```console
$ docker sandbox run \
  -v ~/.cache/go-build:/root/.cache/go-build \
  -v ~/go/pkg/mod:/go/pkg/mod \
  claude
```
@z

@x
Custom tools:
@y
Custom tools:
@z

@x
```console
$ docker sandbox run -v ~/bin:/shared-bin:ro claude
```
@y
```console
$ docker sandbox run -v ~/bin:/shared-bin:ro claude
```
@z

@x
## Custom templates
@y
## Custom templates
@z

@x
Create custom sandbox templates to reuse configured environments. Instead of
installing tools every time you start an agent, build a Docker image with
everything pre-installed:
@y
Create custom sandbox templates to reuse configured environments. Instead of
installing tools every time you start an agent, build a Docker image with
everything pre-installed:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM docker/sandbox-templates:claude-code
RUN <<EOF
curl -LsSf https://astral.sh/uv/install.sh | sh
. ~/.local/bin/env
uv tool install ruff@latest
EOF
ENV PATH="$PATH:~/.local/bin"
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM docker/sandbox-templates:claude-code
RUN <<EOF
curl -LsSf https://astral.sh/uv/install.sh | sh
. ~/.local/bin/env
uv tool install ruff@latest
EOF
ENV PATH="$PATH:~/.local/bin"
```
@z

@x
Build the image, and use the [`docker sandbox run --template`](/reference/cli/docker/sandbox/run#template)
flag to start a new sandbox based on the image.
@y
Build the image, and use the [`docker sandbox run --template`](__SUBDIR__/reference/cli/docker/sandbox/run#template)
flag to start a new sandbox based on the image.
@z

@x
```console
$ docker build -t my-dev-env .
$ docker sandbox run --template my-dev-env claude
```
@y
```console
$ docker build -t my-dev-env .
$ docker sandbox run --template my-dev-env claude
```
@z

@x
### Using standard images
@y
### Using standard images
@z

@x
You can use standard Docker images as sandbox templates, but they don't include
agent binaries, shell configuration, or runtime dependencies that Docker's
sandbox templates provide. Using a standard Python image directly fails:
@y
You can use standard Docker images as sandbox templates, but they don't include
agent binaries, shell configuration, or runtime dependencies that Docker's
sandbox templates provide. Using a standard Python image directly fails:
@z

@x
```console
$ docker sandbox run --template python:3-slim claude
The claude binary was not found in the sandbox; please check this is the correct sandbox for this agent.
```
@y
```console
$ docker sandbox run --template python:3-slim claude
The claude binary was not found in the sandbox; please check this is the correct sandbox for this agent.
```
@z

@x
To use a standard image, create a Dockerfile that installs the agent binary,
dependencies, and shell configuration on top of your base image. This approach
makes sense when you need a specific base image (for example, an exact OS
version or a specialized image with particular build tools).
@y
To use a standard image, create a Dockerfile that installs the agent binary,
dependencies, and shell configuration on top of your base image. This approach
makes sense when you need a specific base image (for example, an exact OS
version or a specialized image with particular build tools).
@z
