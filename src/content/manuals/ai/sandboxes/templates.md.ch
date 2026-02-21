%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

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
## Building templates with Dockerfiles
@y
## Building templates with Dockerfiles
@z

@x
Start from Docker's official sandbox templates:
@y
Start from Docker's official sandbox templates:
@z

@x within code
# Install system packages
@y
# Install system packages
@z
@x
# Install development tools
@y
# Install development tools
@z

@x
Official templates include the agent binary, Ubuntu base, and development tools
like Git, Docker CLI, Node.js, Python, and Go. They run as the non-root
`agent` user with sudo access.
@y
Official templates include the agent binary, Ubuntu base, and development tools
like Git, Docker CLI, Node.js, Python, and Go. They run as the non-root
`agent` user with sudo access.
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
### Using templates built from Dockerfiles
@y
### Using templates built from Dockerfiles
@z

@x
Build your template:
@y
Build your template:
@z

% snip command...

@x
Use it directly from your local Docker daemon:
@y
Use it directly from your local Docker daemon:
@z

% snip command...

@x
The default `--pull-template missing` policy finds the image in your local
Docker daemon without pulling from a registry.
@y
The default `--pull-template missing` policy finds the image in your local
Docker daemon without pulling from a registry.
@z

@x
To share the template with others, push it to a registry:
@y
To share the template with others, push it to a registry:
@z

% snip command...

@x
For registry images, the default `--pull-template missing` policy automatically
pulls if not cached.
@y
For registry images, the default `--pull-template missing` policy automatically
pulls if not cached.
@z

@x
## Template caching and pull policies
@y
## Template caching and pull policies
@z

@x
Docker Sandboxes caches template images to speed up sandbox creation. The
`--pull-template` flag controls when images are pulled from registries.
@y
Docker Sandboxes caches template images to speed up sandbox creation. The
`--pull-template` flag controls when images are pulled from registries.
@z

@x
- `--pull-template missing` (default)
@y
- `--pull-template missing` (default)
@z

@x
  Use the local image if present, otherwise pull from the registry. Works for
  both locally-built images and registry images. On first use, registry images
  are pulled and cached; subsequent sandboxes reuse the cache.
@y
  Use the local image if present, otherwise pull from the registry. Works for
  both locally-built images and registry images. On first use, registry images
  are pulled and cached; subsequent sandboxes reuse the cache.
@z

@x
- `--pull-template always`
@y
- `--pull-template always`
@z

@x
  Always pull the latest image from the registry and update the host cache.
  The VM uses the refreshed cache. Slower than `missing` but guarantees the
  sandbox uses the latest version. Requires a registry image.
@y
  Always pull the latest image from the registry and update the host cache.
  The VM uses the refreshed cache. Slower than `missing` but guarantees the
  sandbox uses the latest version. Requires a registry image.
@z

@x
- `--pull-template never`
@y
- `--pull-template never`
@z

@x
  Never use the host cache. The sandbox VM pulls the image directly from the
  registry on every startup. Requires a registry image.
@y
  Never use the host cache. The sandbox VM pulls the image directly from the
  registry on every startup. Requires a registry image.
@z

@x
The cache stores template images separately from your host Docker daemon's
images. Cached images persist across sandbox creation and deletion, but are
removed when you run `docker sandbox reset`.
@y
The cache stores template images separately from your host Docker daemon's
images. Cached images persist across sandbox creation and deletion, but are
removed when you run `docker sandbox reset`.
@z

@x
## Creating templates from existing sandboxes
@y
## Creating templates from existing sandboxes
@z

@x
Rather than writing a Dockerfile, you can start with a sandbox, configure it,
then save it as a template. This is convenient when you already have a working
environment set up by the agent.
@y
Rather than writing a Dockerfile, you can start with a sandbox, configure it,
then save it as a template. This is convenient when you already have a working
environment set up by the agent.
@z

@x
Start a sandbox and have the agent install what you need:
@y
Start a sandbox and have the agent install what you need:
@z

% snip command...

@x
Inside the sandbox, ask the agent to install tools and configure the
environment. Once everything works, exit and save the sandbox as a template:
@y
Inside the sandbox, ask the agent to install tools and configure the
environment. Once everything works, exit and save the sandbox as a template:
@z

% snip command...

@x
This saves the image to your local Docker daemon. The default pull policy finds
the image locally:
@y
This saves the image to your local Docker daemon. The default pull policy finds
the image locally:
@z

% snip command...

@x
To save as a tar file instead (for example, to transfer to another machine):
@y
To save as a tar file instead (for example, to transfer to another machine):
@z

% snip command...

@x
Use a Dockerfile when you want a clear record of how the environment is built.
Use `docker sandbox save` when you already have a working sandbox and want to
reuse it.
@y
Use a Dockerfile when you want a clear record of how the environment is built.
Use `docker sandbox save` when you already have a working sandbox and want to
reuse it.
@z

@x
## Example: Node.js template
@y
## Example: Node.js template
@z

@x
This template adds Node.js 20 and common development tools:
@y
This template adds Node.js 20 and common development tools:
@z

@x within code
# Install Node.js 20 LTS
@y
# Install Node.js 20 LTS
@z
@x
# Install common tools
@y
# Install common tools
@z

@x
Pin specific versions for reproducible builds across your team.
@y
Pin specific versions for reproducible builds across your team.
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

% snip command...

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
To share templates, push them to a registry with version tags:
@y
To share templates, push them to a registry with version tags:
@z

% snip command...

@x
Or tag and push a saved sandbox:
@y
Or tag and push a saved sandbox:
@z

% snip command...

@x
Team members use the template by referencing the registry image:
@y
Team members use the template by referencing the registry image:
@z

% snip command...

@x
Use version tags like `:v1.0` instead of `:latest` for consistency across your
team.
@y
Use version tags like `:v1.0` instead of `:latest` for consistency across your
team.
@z
