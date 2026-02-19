%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Custom shell
description: |
  Use the custom shell sandbox for manual agent installation and custom
  development environments in Docker Sandboxes.
keywords: docker, sandboxes, shell, custom, manual setup, development environment
@y
title: Custom shell
description: |
  Use the custom shell sandbox for manual agent installation and custom
  development environments in Docker Sandboxes.
keywords: docker, sandboxes, shell, custom, manual setup, development environment
@z

@x
{{< summary-bar feature_name="Docker Sandboxes" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes" >}}
@z

@x
This guide covers the Shell sandbox, a minimal environment for custom agent
installation and development. Unlike other agent sandboxes, Shell doesn't
include a pre-installed agent binary. Instead, it provides a clean environment
where you can install and configure any agent or tool.
@y
This guide covers the Shell sandbox, a minimal environment for custom agent
installation and development. Unlike other agent sandboxes, Shell doesn't
include a pre-installed agent binary. Instead, it provides a clean environment
where you can install and configure any agent or tool.
@z

@x
## Quick start
@y
## Quick start
@z

@x
Create a sandbox and launch a shell environment:
@y
Create a sandbox and launch a shell environment:
@z

@x
```console
$ docker sandbox run shell ~/my-project
```
@y
```console
$ docker sandbox run shell ~/my-project
```
@z

@x
The workspace parameter is optional and defaults to the current directory:
@y
The workspace parameter is optional and defaults to the current directory:
@z

@x
```console
$ cd ~/my-project
$ docker sandbox run shell
```
@y
```console
$ cd ~/my-project
$ docker sandbox run shell
```
@z

@x
This launches a bash login shell inside the sandbox.
@y
This launches a bash login shell inside the sandbox.
@z

@x
## Use cases
@y
## Use cases
@z

@x
The Shell sandbox serves several purposes:
@y
The Shell sandbox serves several purposes:
@z

@x
- Custom agent installation
@y
- Custom agent installation
@z

@x
  Install agents not officially supported by Docker Sandboxes. The environment
  includes package managers and development tools for installing arbitrary
  software.
@y
  Install agents not officially supported by Docker Sandboxes. The environment
  includes package managers and development tools for installing arbitrary
  software.
@z

@x
- Agent development
@y
- Agent development
@z

@x
  Test custom agent implementations or modifications in an isolated environment
  with a private Docker daemon.
@y
  Test custom agent implementations or modifications in an isolated environment
  with a private Docker daemon.
@z

@x
- Manual configuration
@y
- Manual configuration
@z

@x
  Configure agents with complex setup requirements or custom authentication
  flows that aren't supported by the standard templates.
@y
  Configure agents with complex setup requirements or custom authentication
  flows that aren't supported by the standard templates.
@z

@x
- Troubleshooting
@y
- Troubleshooting
@z

@x
  Debug agent issues by manually running commands and inspecting the sandbox
  environment.
@y
  Debug agent issues by manually running commands and inspecting the sandbox
  environment.
@z

@x
## Authentication
@y
## Authentication
@z

@x
The Shell sandbox uses proxy credential injection. The proxy automatically
injects credentials into API requests for supported providers (OpenAI,
Anthropic, Google, GitHub, etc.).
@y
The Shell sandbox uses proxy credential injection. The proxy automatically
injects credentials into API requests for supported providers (OpenAI,
Anthropic, Google, GitHub, etc.).
@z

@x
Set your API keys in your shell configuration file:
@y
Set your API keys in your shell configuration file:
@z

@x
```plaintext {title="~/.bashrc or ~/.zshrc"}
export OPENAI_API_KEY=sk-xxxxx
export ANTHROPIC_API_KEY=sk-ant-xxxxx
export GOOGLE_API_KEY=AIzaSyxxxxx
export GH_TOKEN=ghp_xxxxx
```
@y
```plaintext {title="~/.bashrc or ~/.zshrc"}
export OPENAI_API_KEY=sk-xxxxx
export ANTHROPIC_API_KEY=sk-ant-xxxxx
export GOOGLE_API_KEY=AIzaSyxxxxx
export GH_TOKEN=ghp_xxxxx
```
@z

@x
Apply the changes:
@y
Apply the changes:
@z

@x
1. Source your shell configuration: `source ~/.bashrc` (or `~/.zshrc`)
2. Restart Docker Desktop so the daemon picks up the environment variables
3. Create and run your sandbox:
@y
1. Source your shell configuration: `source ~/.bashrc` (or `~/.zshrc`)
2. Restart Docker Desktop so the daemon picks up the environment variables
3. Create and run your sandbox:
@z

@x
```console
$ docker sandbox create shell ~/project
$ docker sandbox run <sandbox-name>
```
@y
```console
$ docker sandbox create shell ~/project
$ docker sandbox run <sandbox-name>
```
@z

@x
The proxy reads credentials from your host environment and injects them into
API requests automatically. Credentials are never stored inside the sandbox.
@y
The proxy reads credentials from your host environment and injects them into
API requests automatically. Credentials are never stored inside the sandbox.
@z

@x
## Installing agents
@y
## Installing agents
@z

@x
Once inside the shell sandbox, install agents using their standard installation
methods.
@y
Once inside the shell sandbox, install agents using their standard installation
methods.
@z

@x
### Example: Installing Continue
@y
### Example: Installing Continue
@z

@x
[Continue](https://continue.dev) is an AI code assistant. Since Node.js is
pre-installed, you can install it directly:
@y
[Continue](https://continue.dev) is an AI code assistant. Since Node.js is
pre-installed, you can install it directly:
@z

@x
```console
$ npm install -g @continuedev/cli
$ cn --version
1.5.43
```
@y
```console
$ npm install -g @continuedev/cli
$ cn --version
1.5.43
```
@z

@x
For containerized agents or complex setups, consider creating a [custom
template](../templates.md) based on the shell template instead of installing
interactively.
@y
For containerized agents or complex setups, consider creating a [custom
template](../templates.md) based on the shell template instead of installing
interactively.
@z

@x
## Running commands
@y
## Running commands
@z

@x
Pass shell options after the `--` separator to execute commands:
@y
Pass shell options after the `--` separator to execute commands:
@z

@x
```console
$ docker sandbox run <sandbox-name> -- -c "echo 'Hello from sandbox'"
```
@y
```console
$ docker sandbox run <sandbox-name> -- -c "echo 'Hello from sandbox'"
```
@z

@x
## Base image
@y
## Base image
@z

@x
Template: `docker/sandbox-templates:shell`
@y
Template: `docker/sandbox-templates:shell`
@z

@x
The shell template provides the base environment without a pre-installed agent,
making it suitable for manual agent installation.
@y
The shell template provides the base environment without a pre-installed agent,
making it suitable for manual agent installation.
@z

@x
See [Custom templates](../templates.md) to build your own agent images.
@y
See [Custom templates](../templates.md) to build your own agent images.
@z

@x
The minimal nature of this template makes it suitable as a base for any custom
agent installation.
@y
The minimal nature of this template makes it suitable as a base for any custom
agent installation.
@z
