%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: cagent
description: cagent lets you build, orchestrate, and share AI agents that work together as a team.
weight: 60
@y
title: cagent
description: cagent lets you build, orchestrate, and share AI agents that work together as a team.
weight: 60
@z

@x
      text: Experimental
keywords: [ai, agent, cagent]
@y
      text: 試験的
keywords: [ai, agent, cagent]
@z

@x
{{< summary-bar feature_name="cagent" >}}
@y
{{< summary-bar feature_name="cagent" >}}
@z

@x
[cagent](https://github.com/docker/cagent) is an open source tool for building
teams of specialized AI agents. Instead of prompting one generalist model, you
define agents with specific roles and instructions that collaborate to solve
problems. Run these agent teams from your terminal using any LLM provider.
@y
[cagent](https://github.com/docker/cagent) is an open source tool for building
teams of specialized AI agents. Instead of prompting one generalist model, you
define agents with specific roles and instructions that collaborate to solve
problems. Run these agent teams from your terminal using any LLM provider.
@z

@x
## Why agent teams
@y
## Why agent teams
@z

@x
One agent handling complex work means constant context-switching. Split the work
across focused agents instead - each handles what it's best at. cagent manages
the coordination.
@y
One agent handling complex work means constant context-switching. Split the work
across focused agents instead - each handles what it's best at. cagent manages
the coordination.
@z

@x
Here's a two-agent team that debugs problems:
@y
Here's a two-agent team that debugs problems:
@z

@x
```yaml
agents:
  root:
    model: openai/gpt-5-mini # Change to the model that you want to use
    description: Bug investigator
    instruction: |
      Analyze error messages, stack traces, and code to find bug root causes.
      Explain what's wrong and why it's happening.
      Delegate fix implementation to the fixer agent.
    sub_agents: [fixer]
    toolsets:
      - type: filesystem
      - type: mcp
        ref: docker:duckduckgo
@y
```yaml
agents:
  root:
    model: openai/gpt-5-mini # Change to the model that you want to use
    description: Bug investigator
    instruction: |
      Analyze error messages, stack traces, and code to find bug root causes.
      Explain what's wrong and why it's happening.
      Delegate fix implementation to the fixer agent.
    sub_agents: [fixer]
    toolsets:
      - type: filesystem
      - type: mcp
        ref: docker:duckduckgo
@z

@x
  fixer:
    model: anthropic/claude-sonnet-4-5 # Change to the model that you want to use
    description: Fix implementer
    instruction: |
      Write fixes for bugs diagnosed by the investigator.
      Make minimal, targeted changes and add tests to prevent regression.
    toolsets:
      - type: filesystem
      - type: shell
```
@y
  fixer:
    model: anthropic/claude-sonnet-4-5 # Change to the model that you want to use
    description: Fix implementer
    instruction: |
      Write fixes for bugs diagnosed by the investigator.
      Make minimal, targeted changes and add tests to prevent regression.
    toolsets:
      - type: filesystem
      - type: shell
```
@z

@x
The root agent investigates and explains the problem. When it understands the
issue, it hands off to `fixer` for implementation. Each agent stays focused on
its specialty.
@y
The root agent investigates and explains the problem. When it understands the
issue, it hands off to `fixer` for implementation. Each agent stays focused on
its specialty.
@z

@x
## Installation
@y
## Installation
@z

@x
cagent is included in Docker Desktop 4.49 and later.
@y
cagent is included in Docker Desktop 4.49 and later.
@z

@x
For Docker Engine users or custom installations:
@y
For Docker Engine users or custom installations:
@z

@x
- **Homebrew**: `brew install cagent`
- **Winget**: `winget install Docker.Cagent`
- **Pre-built binaries**: [GitHub
  releases](https://github.com/docker/cagent/releases)
- **From source**: See the [cagent
  repository](https://github.com/docker/cagent?tab=readme-ov-file#build-from-source)
@y
- **Homebrew**: `brew install cagent`
- **Winget**: `winget install Docker.Cagent`
- **Pre-built binaries**: [GitHub
  releases](https://github.com/docker/cagent/releases)
- **From source**: See the [cagent
  repository](https://github.com/docker/cagent?tab=readme-ov-file#build-from-source)
@z

@x
## Get started
@y
## Get started
@z

@x
Try the bug analyzer team:
@y
Try the bug analyzer team:
@z

@x
1. Set your API key for the model provider you want to use:
@y
1. Set your API key for the model provider you want to use:
@z

@x
   ```console
   $ export ANTHROPIC_API_KEY=<your_key>  # For Claude models
   $ export OPENAI_API_KEY=<your_key>     # For OpenAI models
   $ export GOOGLE_API_KEY=<your_key>     # For Gemini models
   ```
@y
   ```console
   $ export ANTHROPIC_API_KEY=<your_key>  # For Claude models
   $ export OPENAI_API_KEY=<your_key>     # For OpenAI models
   $ export GOOGLE_API_KEY=<your_key>     # For Gemini models
   ```
@z

@x
2. Save the [example configuration](#why-agent-teams) as `debugger.yaml`.
@y
2. Save the [example configuration](#why-agent-teams) as `debugger.yaml`.
@z

@x
3. Run your agent team:
@y
3. Run your agent team:
@z

@x
   ```console
   $ cagent run debugger.yaml
   ```
@y
   ```console
   $ cagent run debugger.yaml
   ```
@z

@x
You'll see a prompt where you can describe bugs or paste error messages. The
investigator analyzes the problem, then hands off to the fixer for
implementation.
@y
You'll see a prompt where you can describe bugs or paste error messages. The
investigator analyzes the problem, then hands off to the fixer for
implementation.
@z

@x
## How it works
@y
## How it works
@z

@x
You interact with the _root agent_, which can delegate work to sub-agents you
define. Each agent:
@y
You interact with the _root agent_, which can delegate work to sub-agents you
define. Each agent:
@z

@x
- Uses its own model and parameters
- Has its own context (agents don't share knowledge)
- Can access built-in tools like todo lists, memory, and task delegation
- Can use external tools via [MCP
  servers](/manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md)
@y
- Uses its own model and parameters
- Has its own context (agents don't share knowledge)
- Can access built-in tools like todo lists, memory, and task delegation
- Can use external tools via [MCP
  servers](manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md)
@z

@x
The root agent delegates tasks to agents listed under `sub_agents`. Sub-agents
can have their own sub-agents for deeper hierarchies.
@y
The root agent delegates tasks to agents listed under `sub_agents`. Sub-agents
can have their own sub-agents for deeper hierarchies.
@z

@x
## Configuration options
@y
## Configuration options
@z

@x
Agent configurations are YAML files. A basic structure looks like this:
@y
Agent configurations are YAML files. A basic structure looks like this:
@z

@x
```yaml
agents:
  root:
    model: claude-sonnet-4-0
    description: Brief role summary
    instruction: |
      Detailed instructions for this agent...
    sub_agents: [helper]
@y
```yaml
agents:
  root:
    model: claude-sonnet-4-0
    description: Brief role summary
    instruction: |
      Detailed instructions for this agent...
    sub_agents: [helper]
@z

@x
  helper:
    model: gpt-5-mini
    description: Specialist agent role
    instruction: |
      Instructions for the helper agent...
```
@y
  helper:
    model: gpt-5-mini
    description: Specialist agent role
    instruction: |
      Instructions for the helper agent...
```
@z

@x
You can also configure model settings (like context limits), tools (including
MCP servers), and more. See the [configuration
reference](./reference/config.md)
for complete details.
@y
You can also configure model settings (like context limits), tools (including
MCP servers), and more. See the [configuration
reference](./reference/config.md)
for complete details.
@z

@x
## Share agent teams
@y
## Share agent teams
@z

@x
Agent configurations are packaged as OCI artifacts. Push and pull them like
container images:
@y
Agent configurations are packaged as OCI artifacts. Push and pull them like
container images:
@z

@x
```console
$ cagent push ./debugger.yaml myusername/debugger
$ cagent pull myusername/debugger
```
@y
```console
$ cagent push ./debugger.yaml myusername/debugger
$ cagent pull myusername/debugger
```
@z

@x
Use Docker Hub or any OCI-compatible registry. Pushing creates the repository if
it doesn't exist yet.
@y
Use Docker Hub or any OCI-compatible registry. Pushing creates the repository if
it doesn't exist yet.
@z

@x
## What's next
@y
## What's next
@z

@x
- Follow the [tutorial](./tutorial.md) to build your first coding agent
- Learn [best practices](./best-practices.md) for building effective agents
- Integrate cagent with your [editor](./integrations/acp.md) or use agents as
  [tools in MCP clients](./integrations/mcp.md)
- Browse example agent configurations in the [cagent
  repository](https://github.com/docker/cagent/tree/main/examples)
- Use `cagent new` to generate agent teams with AI <!-- TODO: link to some page
  where we explain this, probably a CLI reference? -->
- Connect agents to external tools via the [Docker MCP
  Gateway](/manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md)
- Read the full [configuration
  reference](https://github.com/docker/cagent?tab=readme-ov-file#-configuration-reference)
  <!-- TODO: move to this site/repo -->
@y
- Follow the [tutorial](./tutorial.md) to build your first coding agent
- Learn [best practices](./best-practices.md) for building effective agents
- Integrate cagent with your [editor](./integrations/acp.md) or use agents as
  [tools in MCP clients](./integrations/mcp.md)
- Browse example agent configurations in the [cagent
  repository](https://github.com/docker/cagent/tree/main/examples)
- Use `cagent new` to generate agent teams with AI <!-- TODO: link to some page
  where we explain this, probably a CLI reference? -->
- Connect agents to external tools via the [Docker MCP
  Gateway](manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md)
- Read the full [configuration
  reference](https://github.com/docker/cagent?tab=readme-ov-file#-configuration-reference)
  <!-- TODO: move to this site/repo -->
@z
