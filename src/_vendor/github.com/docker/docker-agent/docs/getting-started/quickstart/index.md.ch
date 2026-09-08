%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Quick Start"
description: "Get up and running with Docker Agent in under 5 minutes. Pick whichever path suits you best."
keywords: docker agent, ai agents, getting started, quick start
@y
title: "Quick Start"
description: "Get up and running with Docker Agent in under 5 minutes. Pick whichever path suits you best."
keywords: docker agent, ai agents, getting started, quick start
@z

@x
_Get up and running with Docker Agent in under 5 minutes. Pick whichever path suits you best._
@y
_Get up and running with Docker Agent in under 5 minutes. Pick whichever path suits you best._
@z

@x
## Option A: Run the Default Agent
@y
## Option A: Run the Default Agent
@z

@x
The fastest way to try Docker Agent — no config file needed:
@y
The fastest way to try Docker Agent — no config file needed:
@z

@x
```bash
# Launch the default agent with the interactive TUI
$ docker agent run
```
@y
```bash
# Launch the default agent with the interactive TUI
$ docker agent run
```
@z

@x
This starts a general-purpose assistant with sensible defaults. Just start chatting.
@y
This starts a general-purpose assistant with sensible defaults. Just start chatting.
@z

@x
> [!NOTE]
> This needs a model: a cloud provider API key, or a local model pulled through Docker Model Runner. [Set Up a Model](../set-up-a-model/index.md) walks through both paths.
@y
> [!NOTE]
> This needs a model: a cloud provider API key, or a local model pulled through Docker Model Runner. [Set Up a Model](../set-up-a-model/index.md) walks through both paths.
@z

@x
## Option B: Run an Agent from a Registry
@y
## Option B: Run an Agent from a Registry
@z

@x
Run an agent shared through any OCI-compatible registry — no local YAML needed:
@y
Run an agent shared through any OCI-compatible registry — no local YAML needed:
@z

@x
```bash
$ docker agent run myorg/agent:tag
```
@y
```bash
$ docker agent run myorg/agent:tag
```
@z

@x
## Option C: Generate a Config Interactively
@y
## Option C: Generate a Config Interactively
@z

@x
Use the `docker agent new` command to scaffold a config file through prompts:
@y
Use the `docker agent new` command to scaffold a config file through prompts:
@z

@x
```bash
# Interactive wizard
$ docker agent new
@y
```bash
# Interactive wizard
$ docker agent new
@z

@x
# Or specify options directly
$ docker agent new --model openai/gpt-5
@y
# Or specify options directly
$ docker agent new --model openai/gpt-5
@z

@x
# Override iteration limits
$ docker agent new --model dmr/ai/gemma3-qat:12B --max-iterations 15
```
@y
# Override iteration limits
$ docker agent new --model dmr/ai/gemma3-qat:12B --max-iterations 15
```
@z

@x
This generates an `agent.yaml` in the current directory. Then run it:
@y
This generates an `agent.yaml` in the current directory. Then run it:
@z

@x
```bash
$ docker agent run agent.yaml
```
@y
```bash
$ docker agent run agent.yaml
```
@z

@x
## Option D: Write Your Own Config
@y
## Option D: Write Your Own Config
@z

@x
Create an `agent.yaml` by hand for full control. Here's a minimal example:
@y
Create an `agent.yaml` by hand for full control. Here's a minimal example:
@z

@x
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: A helpful coding assistant
    instruction: |
      You are an expert software developer. Help users write
      clean, efficient code. Explain your reasoning.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: A helpful coding assistant
    instruction: |
      You are an expert software developer. Help users write
      clean, efficient code. Explain your reasoning.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@z

@x
This gives your agent:
@y
This gives your agent:
@z

@x
- **Claude Sonnet 4.5** as the underlying model
- **Filesystem access** to read and write files
- **Shell access** to run commands
- **Think tool** for step-by-step reasoning
@y
- **Claude Sonnet 4.5** as the underlying model
- **Filesystem access** to read and write files
- **Shell access** to run commands
- **Think tool** for step-by-step reasoning
@z

@x
This config needs `ANTHROPIC_API_KEY` set. See [Set Up a Model](../set-up-a-model/index.md) for where to put it, or use a local `dmr/...` model that needs no key.
@y
This config needs `ANTHROPIC_API_KEY` set. See [Set Up a Model](../set-up-a-model/index.md) for where to put it, or use a local `dmr/...` model that needs no key.
@z

@x
```bash
# Launch the interactive terminal UI
$ docker agent run agent.yaml
```
@y
```bash
# Launch the interactive terminal UI
$ docker agent run agent.yaml
```
@z

@x
> [!TIP]
> **Prefer HCL?**
>
> You can write the same config as `agent.hcl` using labeled blocks and heredocs. See [HCL Configuration](../../configuration/hcl/index.md).
@y
> [!TIP]
> **Prefer HCL?**
>
> You can write the same config as `agent.hcl` using labeled blocks and heredocs. See [HCL Configuration](../../configuration/hcl/index.md).
@z

@x
## Try It Out
@y
## Try It Out
@z

@x
Once your agent is running, try asking it to:
@y
Once your agent is running, try asking it to:
@z

@x
- _"List the files in the current directory"_
- _"Create a Python script that fetches weather data"_
- _"Explain what the code in main.go does"_
@y
- _"List the files in the current directory"_
- _"Create a Python script that fetches weather data"_
- _"Explain what the code in main.go does"_
@z

@x
> [!TIP]
> Add `--yolo` to auto-approve all tool calls: `docker agent run agent.yaml --yolo`
@y
> [!TIP]
> Add `--yolo` to auto-approve all tool calls: `docker agent run agent.yaml --yolo`
@z

@x
## Take the Interactive Tour
@y
## Take the Interactive Tour
@z

@x
Prefer to learn by doing? Run:
@y
Prefer to learn by doing? Run:
@z

@x
```bash
$ docker agent getting-started
```
@y
```bash
$ docker agent getting-started
```
@z

@x
This launches a short, scripted tour inside the chat UI: sending messages, approving tool calls, the command palette, and slash commands. It's skippable at any point with <kbd>Esc</kbd>, and you can replay it later with the same command or the `/getting-started` slash command.
@y
This launches a short, scripted tour inside the chat UI: sending messages, approving tool calls, the command palette, and slash commands. It's skippable at any point with <kbd>Esc</kbd>, and you can replay it later with the same command or the `/getting-started` slash command.
@z

@x
## Non-Interactive Mode
@y
## Non-Interactive Mode
@z

@x
Use `docker agent run --exec` for one-shot tasks:
@y
Use `docker agent run --exec` for one-shot tasks:
@z

@x
```bash
# Ask a single question
$ docker agent run --exec agent.yaml "Create a Dockerfile for a Node.js app"
@y
```bash
# Ask a single question
$ docker agent run --exec agent.yaml "Create a Dockerfile for a Node.js app"
@z

@x
# Pipe input
$ cat error.log | docker agent run --exec agent.yaml "What's wrong in this log?"
```
@y
# Pipe input
$ cat error.log | docker agent run --exec agent.yaml "What's wrong in this log?"
```
@z

@x
## Add More Power
@y
## Add More Power
@z

@x
Give your agent persistent memory and web search:
@y
Give your agent persistent memory and web search:
@z

@x
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Research assistant with memory
    instruction: |
      You are a research assistant. Search the web for information,
      remember important findings, and provide thorough analysis.
    toolsets:
      - type: think
      - type: memory
        path: ./research.db
      - type: mcp
        ref: docker:duckduckgo
```
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Research assistant with memory
    instruction: |
      You are a research assistant. Search the web for information,
      remember important findings, and provide thorough analysis.
    toolsets:
      - type: think
      - type: memory
        path: ./research.db
      - type: mcp
        ref: docker:duckduckgo
```
@z

@x
> [!NOTE]
> **Docker MCP Tools**
>
> The `ref: docker:duckduckgo` syntax runs the DuckDuckGo MCP server in a Docker container. This is the recommended way to use MCP tools — secure, isolated, and easy to configure. Requires Docker Desktop.
@y
> [!NOTE]
> **Docker MCP Tools**
>
> The `ref: docker:duckduckgo` syntax runs the DuckDuckGo MCP server in a Docker container. This is the recommended way to use MCP tools — secure, isolated, and easy to configure. Requires Docker Desktop.
@z

@x
## What's Next?
@y
## What's Next?
@z

@x
- [**Understand Agents**](../../concepts/agents/index.md) — learn how agents work and what you can configure.
- [**Multi-Agent Systems**](../../concepts/multi-agent/index.md) — build teams of collaborating agents.
- [**Configuration Reference**](../../configuration/overview/index.md) — full reference for all YAML and HCL options.
- [**Troubleshooting**](../../community/troubleshooting/index.md) — something not working? Debug tips and common fixes.
@y
- [**Understand Agents**](../../concepts/agents/index.md) — learn how agents work and what you can configure.
- [**Multi-Agent Systems**](../../concepts/multi-agent/index.md) — build teams of collaborating agents.
- [**Configuration Reference**](../../configuration/overview/index.md) — full reference for all YAML and HCL options.
- [**Troubleshooting**](../../community/troubleshooting/index.md) — something not working? Debug tips and common fixes.
@z
