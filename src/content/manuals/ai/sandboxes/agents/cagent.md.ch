%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: cagent sandbox
description: |
  Use Docker cagent in Docker Sandboxes with multi-provider authentication
  supporting OpenAI, Anthropic, and more.
keywords: docker, sandboxes, cagent, ai agent, multi-provider, authentication
@y
title: cagent sandbox
description: |
  Use Docker cagent in Docker Sandboxes with multi-provider authentication
  supporting OpenAI, Anthropic, and more.
keywords: docker, sandboxes, cagent, ai agent, multi-provider, authentication
@z

@x
{{< summary-bar feature_name="Docker Sandboxes" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes" >}}
@z

@x
This guide covers authentication, configuration, and usage of Docker cagent in
a sandboxed environment. [cagent](/ai/cagent/) is Docker's open source coding
agent that supports multiple providers.
@y
This guide covers authentication, configuration, and usage of Docker cagent in
a sandboxed environment. [cagent](__SUBDIR__/ai/cagent/) is Docker's open source coding
agent that supports multiple providers.
@z

@x
## Quick start
@y
## Quick start
@z

@x
Create a sandbox and run cagent for a project directory:
@y
Create a sandbox and run cagent for a project directory:
@z

@x
```console
$ docker sandbox run cagent ~/my-project
```
@y
```console
$ docker sandbox run cagent ~/my-project
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
$ docker sandbox run cagent
```
@y
```console
$ cd ~/my-project
$ docker sandbox run cagent
```
@z

@x
## Authentication
@y
## Authentication
@z

@x
cagent uses proxy-managed authentication for all supported providers. Docker
Sandboxes intercepts API requests and injects credentials transparently. You
provide your API keys through environment variables, and the sandbox handles
credential management.
@y
cagent uses proxy-managed authentication for all supported providers. Docker
Sandboxes intercepts API requests and injects credentials transparently. You
provide your API keys through environment variables, and the sandbox handles
credential management.
@z

@x
### Supported providers
@y
### Supported providers
@z

@x
Configure one or more providers by setting environment variables:
@y
Configure one or more providers by setting environment variables:
@z

@x
```plaintext {title="~/.bashrc or ~/.zshrc"}
export OPENAI_API_KEY=sk-xxxxx
export ANTHROPIC_API_KEY=sk-ant-xxxxx
export GOOGLE_API_KEY=AIzaSyxxxxx
export XAI_API_KEY=xai-xxxxx
export NEBIUS_API_KEY=xxxxx
export MISTRAL_API_KEY=xxxxx
```
@y
```plaintext {title="~/.bashrc or ~/.zshrc"}
export OPENAI_API_KEY=sk-xxxxx
export ANTHROPIC_API_KEY=sk-ant-xxxxx
export GOOGLE_API_KEY=AIzaSyxxxxx
export XAI_API_KEY=xai-xxxxx
export NEBIUS_API_KEY=xxxxx
export MISTRAL_API_KEY=xxxxx
```
@z

@x
You only need to configure the providers you want to use. cagent detects
available credentials and routes requests to the appropriate provider.
@y
You only need to configure the providers you want to use. cagent detects
available credentials and routes requests to the appropriate provider.
@z

@x
### Environment variable setup
@y
### Environment variable setup
@z

@x
Docker Sandboxes use a daemon process that doesn't inherit environment
variables from your current shell session. To make your API keys available to
sandboxes, set them globally in your shell configuration file.
@y
Docker Sandboxes use a daemon process that doesn't inherit environment
variables from your current shell session. To make your API keys available to
sandboxes, set them globally in your shell configuration file.
@z

@x
Apply the changes:
@y
Apply the changes:
@z

@x
1. Source your shell configuration: `source ~/.bashrc` (or `~/.zshrc`)
2. Restart Docker Desktop so the daemon picks up the new environment variables
3. Create and run your sandbox:
@y
1. Source your shell configuration: `source ~/.bashrc` (or `~/.zshrc`)
2. Restart Docker Desktop so the daemon picks up the new environment variables
3. Create and run your sandbox:
@z

@x
```console
$ docker sandbox create cagent ~/project
$ docker sandbox run <sandbox-name>
```
@y
```console
$ docker sandbox create cagent ~/project
$ docker sandbox run <sandbox-name>
```
@z

@x
The sandbox detects the environment variables and uses them automatically.
@y
The sandbox detects the environment variables and uses them automatically.
@z

@x
## Configuration
@y
## Configuration
@z

@x
cagent supports YOLO mode that disables safety checks and approval prompts.
This mode grants the agent full access to your sandbox environment without
interactive confirmation.
@y
cagent supports YOLO mode that disables safety checks and approval prompts.
This mode grants the agent full access to your sandbox environment without
interactive confirmation.
@z

@x
### Pass options at runtime
@y
### Pass options at runtime
@z

@x
Pass cagent CLI options after the sandbox name and a `--` separator:
@y
Pass cagent CLI options after the sandbox name and a `--` separator:
@z

@x
```console
$ docker sandbox run <sandbox-name> -- run --yolo
```
@y
```console
$ docker sandbox run <sandbox-name> -- run --yolo
```
@z

@x
The `run --yolo` command starts cagent with approval prompts disabled.
@y
The `run --yolo` command starts cagent with approval prompts disabled.
@z

@x
## Base image
@y
## Base image
@z

@x
Template: `docker/sandbox-templates:cagent`
@y
Template: `docker/sandbox-templates:cagent`
@z

@x
cagent supports multiple LLM providers with automatic credential injection
through the sandbox proxy. Launches with `run --yolo` by default.
@y
cagent supports multiple LLM providers with automatic credential injection
through the sandbox proxy. Launches with `run --yolo` by default.
@z

@x
See [Custom templates](../templates.md) to build your own agent images.
@y
See [Custom templates](../templates.md) to build your own agent images.
@z
