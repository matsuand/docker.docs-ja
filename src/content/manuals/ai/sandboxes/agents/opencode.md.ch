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
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
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
The workspace parameter is optional and defaults to the current directory:
@y
The workspace parameter is optional and defaults to the current directory:
@z

% snip command...

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
use with [stored secrets](../security/credentials.md#stored-secrets):
@y
OpenCode supports multiple providers. Store keys for the providers you want to
use with [stored secrets](../security/credentials.md#stored-secrets):
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
You can also use environment variables (`OPENAI_API_KEY`, `ANTHROPIC_API_KEY`,
`GOOGLE_API_KEY`, `XAI_API_KEY`, `GROQ_API_KEY`, `AWS_ACCESS_KEY_ID`). See
[Credentials](../security/credentials.md) for details on both methods.
@y
You can also use environment variables (`OPENAI_API_KEY`, `ANTHROPIC_API_KEY`,
`GOOGLE_API_KEY`, `XAI_API_KEY`, `GROQ_API_KEY`, `AWS_ACCESS_KEY_ID`). See
[Credentials](../security/credentials.md) for details on both methods.
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
### Pass options at runtime
@y
### Pass options at runtime
@z

@x
Pass OpenCode CLI options after `--`:
@y
Pass OpenCode CLI options after `--`:
@z

% snip command...

@x
For example, to resume an existing session in a named sandbox:
@y
For example, to resume an existing session in a named sandbox:
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
