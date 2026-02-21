%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: OpenCode sandbox
description: |
  Use OpenCode in Docker Sandboxes with multi-provider authentication and TUI
  interface for AI development.
keywords: docker, sandboxes, opencode, ai agent, multi-provider, authentication, tui
@y
title: OpenCode sandbox
description: |
  Use OpenCode in Docker Sandboxes with multi-provider authentication and TUI
  interface for AI development.
keywords: docker, sandboxes, opencode, ai agent, multi-provider, authentication, tui
@z

@x
{{< summary-bar feature_name="Docker Sandboxes v0.12" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes v0.12" >}}
@z

@x
This guide covers authentication, configuration, and usage of OpenCode in a
sandboxed environment.
@y
This guide covers authentication, configuration, and usage of OpenCode in a
sandboxed environment.
@z

@x
Official documentation: [OpenCode](https://opencode.ai/docs)
@y
Official documentation: [OpenCode](https://opencode.ai/docs)
@z

@x
## Quick start
@y
## Quick start
@z

@x
Create a sandbox and run OpenCode for a project directory:
@y
Create a sandbox and run OpenCode for a project directory:
@z

@x
```console
$ docker sandbox run opencode ~/my-project
```
@y
```console
$ docker sandbox run opencode ~/my-project
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
$ docker sandbox run opencode
```
@y
```console
$ cd ~/my-project
$ docker sandbox run opencode
```
@z

@x
OpenCode launches a TUI (text user interface) where you can select your
preferred LLM provider and interact with the agent.
@y
OpenCode launches a TUI (text user interface) where you can select your
preferred LLM provider and interact with the agent.
@z

@x
## Authentication
@y
## Authentication
@z

@x
OpenCode uses proxy-managed authentication for all supported providers. Docker
Sandboxes intercepts API requests and injects credentials transparently. You
provide your API keys through environment variables on the host, and the
sandbox handles credential management.
@y
OpenCode uses proxy-managed authentication for all supported providers. Docker
Sandboxes intercepts API requests and injects credentials transparently. You
provide your API keys through environment variables on the host, and the
sandbox handles credential management.
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
export GROQ_API_KEY=gsk_xxxxx
export AWS_ACCESS_KEY_ID=AKIA_xxxxx
export AWS_SECRET_ACCESS_KEY=xxxxx
export AWS_REGION=us-west-2
```
@y
```plaintext {title="~/.bashrc or ~/.zshrc"}
export OPENAI_API_KEY=sk-xxxxx
export ANTHROPIC_API_KEY=sk-ant-xxxxx
export GOOGLE_API_KEY=AIzaSyxxxxx
export XAI_API_KEY=xai-xxxxx
export GROQ_API_KEY=gsk_xxxxx
export AWS_ACCESS_KEY_ID=AKIA_xxxxx
export AWS_SECRET_ACCESS_KEY=xxxxx
export AWS_REGION=us-west-2
```
@z

@x
You only need to configure the providers you want to use. OpenCode detects
available credentials and offers those providers in the TUI.
@y
You only need to configure the providers you want to use. OpenCode detects
available credentials and offers those providers in the TUI.
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
$ docker sandbox create opencode ~/project
$ docker sandbox run <sandbox-name>
```
@y
```console
$ docker sandbox create opencode ~/project
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
OpenCode uses a TUI interface and doesn't require extensive configuration
files. The agent prompts you to select a provider when it starts, and you can
switch providers during a session.
@y
OpenCode uses a TUI interface and doesn't require extensive configuration
files. The agent prompts you to select a provider when it starts, and you can
switch providers during a session.
@z

@x
### TUI mode
@y
### TUI mode
@z

@x
OpenCode launches in TUI mode by default. The interface shows:
@y
OpenCode launches in TUI mode by default. The interface shows:
@z

@x
- Available LLM providers (based on configured credentials)
- Current conversation history
- File operations and tool usage
- Real-time agent responses
@y
- Available LLM providers (based on configured credentials)
- Current conversation history
- File operations and tool usage
- Real-time agent responses
@z

@x
Use keyboard shortcuts to navigate the interface and interact with the agent.
@y
Use keyboard shortcuts to navigate the interface and interact with the agent.
@z

@x
## Base image
@y
## Base image
@z

@x
Template: `docker/sandbox-templates:opencode`
@y
Template: `docker/sandbox-templates:opencode`
@z

@x
OpenCode supports multiple LLM providers with automatic credential injection
through the sandbox proxy.
@y
OpenCode supports multiple LLM providers with automatic credential injection
through the sandbox proxy.
@z

@x
See [Custom templates](../templates.md) to build your own agent images.
@y
See [Custom templates](../templates.md) to build your own agent images.
@z
