%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Templates
@y
title: Templates
@z

@x
description: Build reusable sandbox images with tools and configuration baked in, or save a running sandbox as a template.
keywords: sandboxes, sbx, templates, images, dockerfile, snapshot, custom environments
@y
description: Build reusable sandbox images with tools and configuration baked in, or save a running sandbox as a template.
keywords: sandboxes, sbx, templates, images, dockerfile, snapshot, custom environments
@z

@x
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@z

@x
Every sandbox is customizable — agents install packages, pull images, and
configure tools as they work, and those changes persist for the sandbox's
lifetime. Templates capture a configured environment into a reusable image
so you don't have to set it up again every time.
@y
Every sandbox is customizable — agents install packages, pull images, and
configure tools as they work, and those changes persist for the sandbox's
lifetime. Templates capture a configured environment into a reusable image
so you don't have to set it up again every time.
@z

@x
## Custom templates
@y
## Custom templates
@z

@x
Custom templates are reusable sandbox images that extend one of the built-in
agent environments with additional tools and configuration baked in. Instead
of asking the agent to install packages every time, build a template once and
reuse it across sandboxes and team members.
@y
Custom templates are reusable sandbox images that extend one of the built-in
agent environments with additional tools and configuration baked in. Instead
of asking the agent to install packages every time, build a template once and
reuse it across sandboxes and team members.
@z

@x
Templates make sense when multiple people need the same environment, when
setup involves steps that are tedious to repeat, or when you need pinned
versions of specific tools. For one-off work, the default image is fine —
ask the agent to install what's needed.
@y
Templates make sense when multiple people need the same environment, when
setup involves steps that are tedious to repeat, or when you need pinned
versions of specific tools. For one-off work, the default image is fine —
ask the agent to install what's needed.
@z

@x
> [!NOTE]
> Custom templates customize an existing agent's environment — they don't
> create new agent runtimes. The agent that launches inside the sandbox is
> determined by the base image variant you extend and the agent you specify
> in the `sbx run` command, not by binaries installed in the template. To
> define a new agent from scratch, see [Kits](kits.md#defining-an-agent).
@y
> [!NOTE]
> Custom templates customize an existing agent's environment — they don't
> create new agent runtimes. The agent that launches inside the sandbox is
> determined by the base image variant you extend and the agent you specify
> in the `sbx run` command, not by binaries installed in the template. To
> define a new agent from scratch, see [Kits](kits.md#defining-an-agent).
@z

@x
### Base images
@y
### Base images
@z

@x
All sandbox templates are published as
`docker/sandbox-templates:<variant>`. They are based on Ubuntu and run as a
non-root `agent` user with sudo access. Most variants include Git, Docker
CLI, and common development tools like Node.js, Python, Go, and Java.
@y
All sandbox templates are published as
`docker/sandbox-templates:<variant>`. They are based on Ubuntu and run as a
non-root `agent` user with sudo access. Most variants include Git, Docker
CLI, and common development tools like Node.js, Python, Go, and Java.
@z

@x
| Variant               | Agent                                                                |
| --------------------- | -------------------------------------------------------------------- |
| `claude-code`         | [Claude Code](https://claude.ai/download)                            |
| `claude-code-minimal` | Claude Code with a minimal toolset (no Node.js, Python, Go, or Java) |
| `codex`               | [OpenAI Codex](https://github.com/openai/codex)                      |
| `copilot`             | [GitHub Copilot](https://github.com/github/copilot-cli)              |
| `cursor-agent`        | [Cursor](https://cursor.com/cli)                                     |
| `docker-agent`        | [Docker Agent](https://github.com/docker/docker-agent)               |
| `droid`               | [Droid](https://www.factory.ai)                                      |
| `gemini`              | [Gemini CLI](https://github.com/google-gemini/gemini-cli)            |
| `kiro`                | [Kiro](https://kiro.dev)                                             |
| `opencode`            | [OpenCode](https://opencode.ai)                                      |
| `shell`               | No agent pre-installed. Use for manual agent setup.                  |
@y
| Variant               | Agent                                                                |
| --------------------- | -------------------------------------------------------------------- |
| `claude-code`         | [Claude Code](https://claude.ai/download)                            |
| `claude-code-minimal` | Claude Code with a minimal toolset (no Node.js, Python, Go, or Java) |
| `codex`               | [OpenAI Codex](https://github.com/openai/codex)                      |
| `copilot`             | [GitHub Copilot](https://github.com/github/copilot-cli)              |
| `cursor-agent`        | [Cursor](https://cursor.com/cli)                                     |
| `docker-agent`        | [Docker Agent](https://github.com/docker/docker-agent)               |
| `droid`               | [Droid](https://www.factory.ai)                                      |
| `gemini`              | [Gemini CLI](https://github.com/google-gemini/gemini-cli)            |
| `kiro`                | [Kiro](https://kiro.dev)                                             |
| `opencode`            | [OpenCode](https://opencode.ai)                                      |
| `shell`               | No agent pre-installed. Use for manual agent setup.                  |
@z

@x
Each variant also has a `-docker` version (for example, `claude-code-docker`)
that includes a full Docker Engine running inside the sandbox — no local Docker
daemon required. When you pick a built-in agent without specifying a custom
template, `sbx run` and `sbx create` use the `-docker` template variants by
default.
@y
Each variant also has a `-docker` version (for example, `claude-code-docker`)
that includes a full Docker Engine running inside the sandbox — no local Docker
daemon required. When you pick a built-in agent without specifying a custom
template, `sbx run` and `sbx create` use the `-docker` template variants by
default.
@z

@x
The agent containers created from the `-docker` templates run in privileged
mode inside the microVM (not on your host), with a dedicated block volume at
`/var/lib/docker`, and `dockerd` starts automatically inside the sandbox. The
block volume defaults to 50 GB and uses a sparse file, so it only consumes
disk space as Docker writes to it.
@y
The agent containers created from the `-docker` templates run in privileged
mode inside the microVM (not on your host), with a dedicated block volume at
`/var/lib/docker`, and `dockerd` starts automatically inside the sandbox. The
block volume defaults to 50 GB and uses a sparse file, so it only consumes
disk space as Docker writes to it.
@z

@x
To override the volume size, set the `DOCKER_SANDBOXES_DOCKER_SIZE`
environment variable to a size string before starting the sandbox:
@y
To override the volume size, set the `DOCKER_SANDBOXES_DOCKER_SIZE`
environment variable to a size string before starting the sandbox:
@z

@x
```console
$ DOCKER_SANDBOXES_DOCKER_SIZE=10g sbx run claude
```
@y
```console
$ DOCKER_SANDBOXES_DOCKER_SIZE=10g sbx run claude
```
@z

@x
Use the non-Docker variant if you don't need to build or run containers
inside the sandbox and want a lighter, non-privileged environment. Specify
it explicitly with `--template`:
@y
Use the non-Docker variant if you don't need to build or run containers
inside the sandbox and want a lighter, non-privileged environment. Specify
it explicitly with `--template`:
@z

@x
```console
$ sbx run claude --template docker.io/docker/sandbox-templates:claude-code
```
@y
```console
$ sbx run claude --template docker.io/docker/sandbox-templates:claude-code
```
@z

@x
### Build a custom template
@y
### Build a custom template
@z

@x
Building a custom template requires
[Docker Desktop](https://docs.docker.com/desktop/).
@y
Building a custom template requires
[Docker Desktop](https://docs.docker.com/desktop/).
@z

@x
Write a Dockerfile that extends one of the base images. Pick the variant
that matches the agent you plan to run. For example, extend `claude-code`
to customize a Claude Code environment, or `codex` to customize an OpenAI
Codex environment.
@y
Write a Dockerfile that extends one of the base images. Pick the variant
that matches the agent you plan to run. For example, extend `claude-code`
to customize a Claude Code environment, or `codex` to customize an OpenAI
Codex environment.
@z

@x
The following example creates a Claude Code template with Rust and
protocol buffer tools pre-installed:
@y
The following example creates a Claude Code template with Rust and
protocol buffer tools pre-installed:
@z

@x
```dockerfile
FROM docker/sandbox-templates:claude-code
USER root
RUN apt-get update && apt-get install -y protobuf-compiler
USER agent
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
```
@y
```dockerfile
FROM docker/sandbox-templates:claude-code
USER root
RUN apt-get update && apt-get install -y protobuf-compiler
USER agent
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
```
@z

@x
Use `root` for system-level package installations (`apt-get`), and switch
back to `agent` before installing user-level tools. Tools that install into
the home directory, such as `rustup`, `nvm`, or `pyenv`, must run as
`agent` — otherwise they install under `/root/` and aren't available in
the sandbox.
@y
Use `root` for system-level package installations (`apt-get`), and switch
back to `agent` before installing user-level tools. Tools that install into
the home directory, such as `rustup`, `nvm`, or `pyenv`, must run as
`agent` — otherwise they install under `/root/` and aren't available in
the sandbox.
@z

@x
Build the image and push it to an OCI registry, such as Docker Hub:
@y
Build the image and push it to an OCI registry, such as Docker Hub:
@z

@x
```console
$ docker build -t my-org/my-template:v1 --push .
```
@y
```console
$ docker build -t my-org/my-template:v1 --push .
```
@z

@x
> [!NOTE]
> The Docker daemon used by Docker Sandboxes pulls templates from a
> registry directly; it doesn't share the image store of your local Docker
> daemon on the host.
@y
> [!NOTE]
> The Docker daemon used by Docker Sandboxes pulls templates from a
> registry directly; it doesn't share the image store of your local Docker
> daemon on the host.
@z

@x
Unless you use the permissive `allow-all` network policy, you may also need
to allow-list any domains that your custom tools depend on:
@y
Unless you use the permissive `allow-all` network policy, you may also need
to allow-list any domains that your custom tools depend on:
@z

@x
```console
$ sbx policy allow network "*.example.com:443,example.com:443"
```
@y
```console
$ sbx policy allow network "*.example.com:443,example.com:443"
```
@z

@x
Then run a sandbox with your template. The agent you specify must match
the base image variant your template extends:
@y
Then run a sandbox with your template. The agent you specify must match
the base image variant your template extends:
@z

@x
```console
$ sbx run --template docker.io/my-org/my-template:v1 claude
```
@y
```console
$ sbx run --template docker.io/my-org/my-template:v1 claude
```
@z

@x
Because this template extends the `claude-code` base image, you run it
with `claude`. If you extend `codex`, use `codex`; if you extend `shell`,
use `shell` (which drops you into a Bash shell with no agent).
@y
Because this template extends the `claude-code` base image, you run it
with `claude`. If you extend `codex`, use `codex`; if you extend `shell`,
use `shell` (which drops you into a Bash shell with no agent).
@z

@x
> [!NOTE]
> Unlike Docker commands, `sbx` does not automatically resolve the Docker
> Hub domain (`docker.io`) in image references.
@y
> [!NOTE]
> Unlike Docker commands, `sbx` does not automatically resolve the Docker
> Hub domain (`docker.io`) in image references.
@z

@x
### Template caching
@y
### Template caching
@z

@x
Template images are cached locally. The first use pulls from the registry;
subsequent sandboxes reuse the cache. Cached images persist across sandbox
creation and deletion, and are cleared when you run `sbx reset`.
@y
Template images are cached locally. The first use pulls from the registry;
subsequent sandboxes reuse the cache. Cached images persist across sandbox
creation and deletion, and are cleared when you run `sbx reset`.
@z

@x
## Saving a sandbox as a template
@y
## Saving a sandbox as a template
@z

@x
Instead of writing a Dockerfile, you can save a running sandbox's state as
a template. This captures installed packages, configuration changes, and
files into a reusable image — useful when you've set up an environment
interactively and want to preserve it.
@y
Instead of writing a Dockerfile, you can save a running sandbox's state as
a template. This captures installed packages, configuration changes, and
files into a reusable image — useful when you've set up an environment
interactively and want to preserve it.
@z

@x
### Save and reuse
@y
### Save and reuse
@z

@x
Stop the sandbox (or let the CLI prompt you), then save it with a name and
tag:
@y
Stop the sandbox (or let the CLI prompt you), then save it with a name and
tag:
@z

@x
```console
$ sbx template save my-sandbox my-template:v1
```
@y
```console
$ sbx template save my-sandbox my-template:v1
```
@z

@x
The image is stored in the sandbox runtime's local image store. Create a
new sandbox from it with the `-t` flag:
@y
The image is stored in the sandbox runtime's local image store. Create a
new sandbox from it with the `-t` flag:
@z

@x
```console
$ sbx run -t my-template:v1 claude
```
@y
```console
$ sbx run -t my-template:v1 claude
```
@z

@x
### List and remove templates
@y
### List and remove templates
@z

@x
List all saved templates:
@y
List all saved templates:
@z

@x
```console
$ sbx template ls
```
@y
```console
$ sbx template ls
```
@z

@x
Remove a template you no longer need:
@y
Remove a template you no longer need:
@z

@x
```console
$ sbx template rm my-template:v1
```
@y
```console
$ sbx template rm my-template:v1
```
@z

@x
### Export and import
@y
### Export and import
@z

@x
To share a saved template or move it to another machine, export it as a
tar file:
@y
To share a saved template or move it to another machine, export it as a
tar file:
@z

@x
```console
$ sbx template save my-sandbox my-template:v1 --output my-template.tar
```
@y
```console
$ sbx template save my-sandbox my-template:v1 --output my-template.tar
```
@z

@x
On the other machine, load the tar file and use it:
@y
On the other machine, load the tar file and use it:
@z

@x
```console
$ sbx template load my-template.tar
$ sbx run -t my-template:v1 claude
```
@y
```console
$ sbx template load my-template.tar
$ sbx run -t my-template:v1 claude
```
@z

@x
### Limitations
@y
### Limitations
@z

@x
Agent configuration files are always recreated when a sandbox is created.
Changes to user-level agent configuration files, such as
`/home/agent/.claude/settings.json` and `/home/agent/.claude.json`, do not
persist in saved templates.
@y
Agent configuration files are always recreated when a sandbox is created.
Changes to user-level agent configuration files, such as
`/home/agent/.claude/settings.json` and `/home/agent/.claude.json`, do not
persist in saved templates.
@z

@x
If the saved template was built for a different agent than the one you
specify in `sbx run`, you get a warning. For example, saving a Claude
sandbox and running it with `codex` produces:
@y
If the saved template was built for a different agent than the one you
specify in `sbx run`, you get a warning. For example, saving a Claude
sandbox and running it with `codex` produces:
@z

@x
```text
⚠ WARNING: template "my-template:v1" was built for the "claude" agent but you are using "codex".
  The sandbox may not work correctly. Consider using: sbx run -t my-template:v1 claude
```
@y
```text
⚠ WARNING: template "my-template:v1" was built for the "claude" agent but you are using "codex".
  The sandbox may not work correctly. Consider using: sbx run -t my-template:v1 claude
```
@z
