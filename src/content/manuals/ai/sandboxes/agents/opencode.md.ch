%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: OpenCode
@y
title: OpenCode
@z

@x
description: |
  Use OpenCode in Docker Sandboxes with multi-provider authentication and TUI
  interface for AI development.
keywords: docker sandboxes, opencode, ai agent, authentication, sbx
@y
description: |
  Use OpenCode in Docker Sandboxes with multi-provider authentication and TUI
  interface for AI development.
keywords: docker sandboxes, opencode, ai agent, authentication, sbx
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

% snip command...

@x
`sbx run` defaults the workspace to the current directory:
@y
`sbx run` defaults the workspace to the current directory:
@z

% snip command...

@x
To create a [mountless sandbox](../usage.md#choose-a-workspace), use
`sbx create` without a workspace path, then attach by name.
@y
To create a [mountless sandbox](../usage.md#choose-a-workspace), use
`sbx create` without a workspace path, then attach by name.
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
OpenCode supports multiple providers. Store keys for the providers you want to
use with [stored secrets](../configuration/credentials.md#stored-secrets):
@y
OpenCode supports multiple providers. Store keys for the providers you want to
use with [stored secrets](../configuration/credentials.md#stored-secrets):
@z

% snip command...

@x
You only need to configure the providers you want to use. OpenCode detects
available credentials and offers those providers in the TUI.
@y
You only need to configure the providers you want to use. OpenCode detects
available credentials and offers those providers in the TUI.
@z

@x
### OpenCode Zen API keys
@y
### OpenCode Zen API keys
@z

@x
OpenCode Zen API keys aren't part of the built-in OpenCode credentials that
`sbx secret set` supports. To use an OpenCode Zen API key, store it as a
[custom secret](../configuration/credentials.md#custom-secrets):
@y
OpenCode Zen API keys aren't part of the built-in OpenCode credentials that
`sbx secret set` supports. To use an OpenCode Zen API key, store it as a
[custom secret](../configuration/credentials.md#custom-secrets):
@z

@x
Set the `OPENCODE_API_KEY` environment variable on the host, then store it:
@y
Set the `OPENCODE_API_KEY` environment variable on the host, then store it:
@z

% snip command...

@x
Custom secrets keep the real key in the host secret store. The sandbox receives
`OPENCODE_API_KEY` as a placeholder, and the host-side proxy replaces that
placeholder with the real key on requests to `opencode.ai`.
@y
Custom secrets keep the real key in the host secret store. The sandbox receives
`OPENCODE_API_KEY` as a placeholder, and the host-side proxy replaces that
placeholder with the real key on requests to `opencode.ai`.
@z

@x
OpenCode Zen also requires network access to `opencode.ai`:
@y
OpenCode Zen also requires network access to `opencode.ai`:
@z

% snip command...

@x
If you add a global custom secret, recreate existing OpenCode sandboxes so the
new environment variable is available inside the sandbox.
@y
If you add a global custom secret, recreate existing OpenCode sandboxes so the
new environment variable is available inside the sandbox.
@z

@x
## Model selection
@y
## Model selection
@z

@x
To select a local model or inference endpoint with `sbx run --model`, see
[Use local and hosted models](../configuration/models.md).
@y
To select a local model or inference endpoint with `sbx run --model`, see
[Use local and hosted models](../configuration/models.md).
@z

@x
When you use `--model`, the model's supported thinking levels are available
as OpenCode variants. Press Ctrl+T to cycle through them.
@y
When you use `--model`, the model's supported thinking levels are available
as OpenCode variants. Press Ctrl+T to cycle through them.
@z

@x
## Configuration
@y
## Configuration
@z

@x
Sandboxes don't pick up user-level configuration from your host. Only
project-level configuration in the working directory is available inside the
sandbox. See
[Why doesn't the sandbox use my user-level agent configuration?](../faq.md#why-doesnt-the-sandbox-use-my-user-level-agent-configuration)
for workarounds.
@y
Sandboxes don't pick up user-level configuration from your host. Only
project-level configuration in the working directory is available inside the
sandbox. See
[Why doesn't the sandbox use my user-level agent configuration?](../faq.md#why-doesnt-the-sandbox-use-my-user-level-agent-configuration)
for workarounds.
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
### Default startup command
@y
### Default startup command
@z

@x
The sandbox runs `opencode` with no implicit flags. Args after `--` are passed
straight through. For example, to resume an existing session:
@y
The sandbox runs `opencode` with no implicit flags. Args after `--` are passed
straight through. For example, to resume an existing session:
@z

% snip command...

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
See [Customize](../customize/) to pre-install tools or customize this
environment.
@y
See [Customize](../customize/) to pre-install tools or customize this
environment.
@z
