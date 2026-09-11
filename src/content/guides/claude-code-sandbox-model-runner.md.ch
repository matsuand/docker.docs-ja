%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: Run Claude Code in a Docker Sandbox with Docker Model Runner
description: Run Claude Code inside an isolated Docker Sandbox and route requests to Docker Model Runner so the agent uses local models on your host.
summary: |
  Combine Docker Sandboxes with Docker Model Runner to run Claude Code in an
  isolated microVM that talks to a local model on your host through the
  Anthropic-compatible API.
keywords: ai, claude code, docker model runner, docker sandboxes, sbx, anthropic, local models, coding assistant
@y
title: Run Claude Code in a Docker Sandbox with Docker Model Runner
description: Run Claude Code inside an isolated Docker Sandbox and route requests to Docker Model Runner so the agent uses local models on your host.
summary: |
  Combine Docker Sandboxes with Docker Model Runner to run Claude Code in an
  isolated microVM that talks to a local model on your host through the
  Anthropic-compatible API.
keywords: ai, claude code, docker model runner, docker sandboxes, sbx, anthropic, local models, coding assistant
@z

@x
  time: 15 minutes
@y
  time: 15 分
@z

@x
This guide shows how to run Claude Code inside a Docker Sandbox with Docker
Model Runner as the backend model provider. You'll keep the agent isolated
from your host in a microVM, point it at a local model on your machine, and
keep all model traffic on-device.
@y
This guide shows how to run Claude Code inside a Docker Sandbox with Docker
Model Runner as the backend model provider. You'll keep the agent isolated
from your host in a microVM, point it at a local model on your machine, and
keep all model traffic on-device.
@z

@x
> **Acknowledgment**
>
> Docker would like to thank [Pradumna Saraf](https://twitter.com/pradumna_saraf) for his contribution to this guide.
@y
> **Acknowledgment**
>
> Docker would like to thank [Pradumna Saraf](https://twitter.com/pradumna_saraf) for his contribution to this guide.
@z

@x
In this guide, you'll learn how to:
@y
In this guide, you'll learn how to:
@z

@x
- Pull a coding model and start Docker Model Runner with TCP enabled
- Allow the sandbox to reach Docker Model Runner on your host
- Create a Claude Code sandbox and set the local endpoint persistently
- Launch Claude Code with a local model and verify the connection
- Package `gpt-oss` with a larger context window for longer prompts
@y
- Pull a coding model and start Docker Model Runner with TCP enabled
- Allow the sandbox to reach Docker Model Runner on your host
- Create a Claude Code sandbox and set the local endpoint persistently
- Launch Claude Code with a local model and verify the connection
- Package `gpt-oss` with a larger context window for longer prompts
@z

@x
## How the pieces fit together
@y
## How the pieces fit together
@z

@x
Three components cooperate at runtime:
@y
Three components cooperate at runtime:
@z

@x
- **Docker Model Runner** runs on your host and serves an
  Anthropic-compatible API at `http://localhost:12434`.
- **The Docker Sandbox** runs Claude Code inside an isolated microVM. The
  microVM has its own network and can't reach your host's `localhost`
  directly.
- **The sandbox proxy** sits on your host and brokers every outbound
  request from the sandbox. It enforces network policy and translates the
  special hostname `host.docker.internal` to `localhost`.
@y
- **Docker Model Runner** runs on your host and serves an
  Anthropic-compatible API at `http://localhost:12434`.
- **The Docker Sandbox** runs Claude Code inside an isolated microVM. The
  microVM has its own network and can't reach your host's `localhost`
  directly.
- **The sandbox proxy** sits on your host and brokers every outbound
  request from the sandbox. It enforces network policy and translates the
  special hostname `host.docker.internal` to `localhost`.
@z

@x
Claude Code inside the sandbox sends requests to
`http://host.docker.internal:12434`. The proxy rewrites the destination to
`localhost:12434`, which Docker Model Runner answers. No model traffic
leaves your machine.
@y
Claude Code inside the sandbox sends requests to
`http://host.docker.internal:12434`. The proxy rewrites the destination to
`localhost:12434`, which Docker Model Runner answers. No model traffic
leaves your machine.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before you start, make sure you have:
@y
Before you start, make sure you have:
@z

@x
- [Docker Desktop](../get-started/get-docker.md) or Docker Engine installed
- [Docker Model Runner enabled](../manuals/ai/model-runner/get-started.md#enable-docker-model-runner)
- [Docker Sandboxes (`sbx`) version 0.39.0 or later installed and signed in](../manuals/ai/sandboxes/install.md)
@y
- [Docker Desktop](../get-started/get-docker.md) or Docker Engine installed
- [Docker Model Runner enabled](../manuals/ai/model-runner/get-started.md#enable-docker-model-runner)
- [Docker Sandboxes (`sbx`) version 0.39.0 or later installed and signed in](../manuals/ai/sandboxes/install.md)
@z

@x
If you use Docker Desktop, turn on TCP access in **Settings** > **AI**, or
run:
@y
If you use Docker Desktop, turn on TCP access in **Settings** > **AI**, or
run:
@z

% snip command...

@x
## Step 1: Pull a coding model
@y
## Step 1: Pull a coding model
@z

@x
Pull a model on your host before you create the sandbox:
@y
Pull a model on your host before you create the sandbox:
@z

% snip command...

@x
You can also use `ai/qwen3-coder` if you want another coding-focused model
with a large context window.
@y
You can also use `ai/qwen3-coder` if you want another coding-focused model
with a large context window.
@z

@x
## Step 2: Allow the sandbox to reach Docker Model Runner
@y
## Step 2: Allow the sandbox to reach Docker Model Runner
@z

@x
Sandboxes are network-isolated by default, so you need a policy rule before
the sandbox can reach Docker Model Runner.
@y
Sandboxes are network-isolated by default, so you need a policy rule before
the sandbox can reach Docker Model Runner.
@z

@x
The rule is matched against the destination the proxy forwards to, not the
hostname the sandbox uses. Because the proxy rewrites
`host.docker.internal` to `localhost` before forwarding, the rule allows
`localhost:12434` even though Claude Code will use `host.docker.internal`
in its requests:
@y
The rule is matched against the destination the proxy forwards to, not the
hostname the sandbox uses. Because the proxy rewrites
`host.docker.internal` to `localhost` before forwarding, the rule allows
`localhost:12434` even though Claude Code will use `host.docker.internal`
in its requests:
@z

% snip command...

@x
For background on host access from sandboxes, see
[Accessing host services from a sandbox](../manuals/ai/sandboxes/workflows/development.md#accessing-host-services-from-a-sandbox).
@y
For background on host access from sandboxes, see
[Accessing host services from a sandbox](../manuals/ai/sandboxes/workflows/development.md#accessing-host-services-from-a-sandbox).
@z

@x
## Step 3: Create a Claude Code sandbox
@y
## Step 3: Create a Claude Code sandbox
@z

@x
From your project directory, create a sandbox without launching the agent. Set
`ANTHROPIC_BASE_URL` so Claude Code uses Docker Model Runner whenever the
sandbox starts:
@y
From your project directory, create a sandbox without launching the agent. Set
`ANTHROPIC_BASE_URL` so Claude Code uses Docker Model Runner whenever the
sandbox starts:
@z

% snip command...

@x
`sbx run` would also work, but it launches Claude Code immediately. Creating
the sandbox first lets you confirm the variable and test connectivity before
the agent starts.
@y
`sbx run` would also work, but it launches Claude Code immediately. Creating
the sandbox first lets you confirm the variable and test connectivity before
the agent starts.
@z

@x
You don't need to set an Anthropic API key or run `sbx secret set
anthropic`. Docker Model Runner doesn't authenticate the local endpoint,
and the sandbox proxy only injects credentials for requests bound for
`api.anthropic.com`. See
[Credentials](../manuals/ai/sandboxes/configuration/credentials.md) for the full
list of services the proxy authenticates. For more ways to set variables, see
[Set environment variables](../manuals/ai/sandboxes/usage.md#set-environment-variables).
@y
You don't need to set an Anthropic API key or run `sbx secret set
anthropic`. Docker Model Runner doesn't authenticate the local endpoint,
and the sandbox proxy only injects credentials for requests bound for
`api.anthropic.com`. See
[Credentials](../manuals/ai/sandboxes/configuration/credentials.md) for the full
list of services the proxy authenticates. For more ways to set variables, see
[Set environment variables](../manuals/ai/sandboxes/usage.md#set-environment-variables).
@z

@x
To confirm the variable is set, open a shell in the sandbox:
@y
To confirm the variable is set, open a shell in the sandbox:
@z

% snip command...

@x
## Step 4: Verify connectivity to Docker Model Runner
@y
## Step 4: Verify connectivity to Docker Model Runner
@z

@x
Still inside the sandbox shell, send a test request to the host endpoint:
@y
Still inside the sandbox shell, send a test request to the host endpoint:
@z

% snip command...

@x
A successful response confirms the policy rule and base URL are correct.
Type `exit` to leave the shell. For more details about the request format,
see the
[Anthropic-compatible API reference](../manuals/ai/model-runner/api-reference.md#anthropic-compatible-api).
@y
A successful response confirms the policy rule and base URL are correct.
Type `exit` to leave the shell. For more details about the request format,
see the
[Anthropic-compatible API reference](../manuals/ai/model-runner/api-reference.md#anthropic-compatible-api).
@z

@x
## Step 5: Launch Claude Code with the local model
@y
## Step 5: Launch Claude Code with the local model
@z

@x
Run Claude Code in the sandbox and pass the model flag through to the agent:
@y
Run Claude Code in the sandbox and pass the model flag through to the agent:
@z

% snip command...

@x
Everything after `--` is forwarded to the Claude Code CLI.
`ANTHROPIC_BASE_URL` is stored with the sandbox and available to every session,
so Claude Code routes requests to Docker Model Runner on your host instead of
`api.anthropic.com`.
@y
Everything after `--` is forwarded to the Claude Code CLI.
`ANTHROPIC_BASE_URL` is stored with the sandbox and available to every session,
so Claude Code routes requests to Docker Model Runner on your host instead of
`api.anthropic.com`.
@z

@x
## Step 6: Inspect Claude Code requests
@y
## Step 6: Inspect Claude Code requests
@z

@x
To inspect the requests Claude Code sends, run on your host:
@y
To inspect the requests Claude Code sends, run on your host:
@z

% snip command...

@x
This helps you debug prompts, context usage, and compatibility issues
without attaching to the sandbox.
@y
This helps you debug prompts, context usage, and compatibility issues
without attaching to the sandbox.
@z

@x
## Step 7: Package `gpt-oss` with a larger context window
@y
## Step 7: Package `gpt-oss` with a larger context window
@z

@x
`ai/gpt-oss` defaults to a smaller context window than coding-focused
models. To use it for repository-scale prompts, package a larger variant on
the host:
@y
`ai/gpt-oss` defaults to a smaller context window than coding-focused
models. To use it for repository-scale prompts, package a larger variant on
the host:
@z

% snip command...

@x
Then point Claude Code at the packaged model the next time you run the
sandbox:
@y
Then point Claude Code at the packaged model the next time you run the
sandbox:
@z

% snip command...

@x
## Clean up
@y
## Clean up
@z

@x
Sandboxes persist after Claude Code exits. To stop the sandbox without
deleting it:
@y
Sandboxes persist after Claude Code exits. To stop the sandbox without
deleting it:
@z

% snip command...

@x
To remove the sandbox and everything inside:
@y
To remove the sandbox and everything inside:
@z

% snip command...

@x
Files in your workspace are unaffected.
@y
Files in your workspace are unaffected.
@z

@x
## Learn more
@y
## Learn more
@z

@x
- [Use Claude Code with Docker Model Runner](claude-code-model-runner.md)
- [Get started with Docker Sandboxes](../manuals/ai/sandboxes/get-started.md)
- [Claude Code in Docker Sandboxes](../manuals/ai/sandboxes/agents/claude-code.md)
- [Docker Model Runner overview](../manuals/ai/model-runner/_index.md)
- [Docker Model Runner API reference](../manuals/ai/model-runner/api-reference.md)
@y
- [Use Claude Code with Docker Model Runner](claude-code-model-runner.md)
- [Get started with Docker Sandboxes](../manuals/ai/sandboxes/get-started.md)
- [Claude Code in Docker Sandboxes](../manuals/ai/sandboxes/agents/claude-code.md)
- [Docker Model Runner overview](../manuals/ai/model-runner/_index.md)
- [Docker Model Runner API reference](../manuals/ai/model-runner/api-reference.md)
@z
