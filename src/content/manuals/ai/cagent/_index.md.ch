%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md ƒŠƒ“ƒN‚Ö‚Ì (no slash) ‘Î‰ž
% snip ‘Î‰ž

@x
title: cagent
description: cagent lets you build, orchestrate, and share AI agents that work together as a team.
@y
title: cagent
description: cagent lets you build, orchestrate, and share AI agents that work together as a team.
@z

@x
{{< summary-bar feature_name="cagent" >}}
@y
{{< summary-bar feature_name="cagent" >}}
@z

@x
[cagent](https://github.com/docker/cagent) lets you build, orchestrate, and share
AI agents. You can use it to define AI agents that work as a team.
@y
[cagent](https://github.com/docker/cagent) lets you build, orchestrate, and share
AI agents. You can use it to define AI agents that work as a team.
@z

@x
cagent relies on the concept of a _root agent_ that acts as a team lead and
delegates tasks to the sub-agents you define.
Each agent:
- uses the model of your choice, with the parameters of your choice.
- has access to the [built-in tools](#built-in-tools) and MCP servers
  configured in the [Docker MCP gateway](/manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md).
- works in its own context. They do not share knowledge.
@y
cagent relies on the concept of a _root agent_ that acts as a team lead and
delegates tasks to the sub-agents you define.
Each agent:
- uses the model of your choice, with the parameters of your choice.
- has access to the [built-in tools](#built-in-tools) and MCP servers
  configured in the [Docker MCP gateway](manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md).
- works in its own context. They do not share knowledge.
@z

@x
The root agent is your main contact point. Each agent has its own context,
they don't share knowledge.
@y
The root agent is your main contact point. Each agent has its own context,
they don't share knowledge.
@z

@x
## Key features
@y
## Key features
@z

@x
- ï¸Multi-tenant architecture with client isolation and session management.
- Rich tool ecosystem via Model Context Protocol (MCP) integration.
- Hierarchical agent system with intelligent task delegation.
- Multiple interfaces including CLI, TUI, API server, and MCP server.
- Agent distribution via Docker registry integration.
- Security-first design with proper client scoping and resource isolation.
- Event-driven streaming for real-time interactions.
- Multi-model support (OpenAI, Anthropic, Gemini, DMR, Docker AI Gateway).
@y
- ï¸Multi-tenant architecture with client isolation and session management.
- Rich tool ecosystem via Model Context Protocol (MCP) integration.
- Hierarchical agent system with intelligent task delegation.
- Multiple interfaces including CLI, TUI, API server, and MCP server.
- Agent distribution via Docker registry integration.
- Security-first design with proper client scoping and resource isolation.
- Event-driven streaming for real-time interactions.
- Multi-model support (OpenAI, Anthropic, Gemini, DMR, Docker AI Gateway).
@z

@x
## Get started with cagent
@y
## Get started with cagent
@z

@x
1. The easiest way to get cagent is to [install Docker Desktop version 4.49 or later](/manuals/desktop/release-notes.md) for your operating system.
@y
1. The easiest way to get cagent is to [install Docker Desktop version 4.49 or later](manuals/desktop/release-notes.md) for your operating system.
@z

@x
   > [!NOTE]
   > You can also build cagent from the source. For more information, see the [cagent GitHub repository](https://github.com/docker/cagent?tab=readme-ov-file#build-from-source).
@y
   > [!NOTE]
   > You can also build cagent from the source. For more information, see the [cagent GitHub repository](https://github.com/docker/cagent?tab=readme-ov-file#build-from-source).
@z

@x
1. Set the following environment variables:
@y
1. Set the following environment variables:
@z

@x within code
   export OPENAI_API_KEY=<your_api_key_here>    # For OpenAI models
   export ANTHROPIC_API_KEY=<your_api_key_here> # For Anthropic models
   export GOOGLE_API_KEY=<your_api_key_here>    # For Gemini models
@y
   export OPENAI_API_KEY=<your_api_key_here>    # For OpenAI models
   export ANTHROPIC_API_KEY=<your_api_key_here> # For Anthropic models
   export GOOGLE_API_KEY=<your_api_key_here>    # For Gemini models
@z

@x
1. Create an agent by saving this sample as `assistant.yaml`:
@y
1. Create an agent by saving this sample as `assistant.yaml`:
@z

% snip code...

@x
1. Start your prompt with your agent:
@y
1. Start your prompt with your agent:
@z

% snip command...

@x
## Create an agentic team
@y
## Create an agentic team
@z

@x
You can use AI prompting to generate a team of agents with the `cagent new`
command:
@y
You can use AI prompting to generate a team of agents with the `cagent new`
command:
@z

% snip command...

@x
Alternatively, you can write your configuration file manually. For example:
@y
Alternatively, you can write your configuration file manually. For example:
@z

% snip code...

@x
[See the reference documentation](https://github.com/docker/cagent?tab=readme-ov-file#-configuration-reference).
@y
[See the reference documentation](https://github.com/docker/cagent?tab=readme-ov-file#-configuration-reference).
@z

@x
## Built-in tools
@y
## Built-in tools
@z

@x
cagent includes a set of built-in tools that enhance your agents' capabilities.
You don't need to configure any external MCP tools to use them.
@y
cagent includes a set of built-in tools that enhance your agents' capabilities.
You don't need to configure any external MCP tools to use them.
@z

@x within code
    # ... other config
@y
    # ... other config
@z

@x
### Think tool
@y
### Think tool
@z

@x
The think tool allows agents to reason through problems step by step:
@y
The think tool allows agents to reason through problems step by step:
@z

@x within code
    # ... other config
@y
    # ... other config
@z

@x
### Todo tool
@y
### Todo tool
@z

@x
The todo tool helps agents manage task lists:
@y
The todo tool helps agents manage task lists:
@z

@x within code
    # ... other config
@y
    # ... other config
@z

@x
### Memory tool
@y
### Memory tool
@z

@x
The memory tool provides persistent storage:
@y
The memory tool provides persistent storage:
@z

@x within code
    # ... other config
@y
    # ... other config
@z

@x
### Task transfer tool
@y
### Task transfer tool
@z

@x
The task transfer tool is an internal tool that allows an agent to delegate a task
to sub-agents. To prevent an agent from delegating work, make sure it doesn't have
sub-agents defined in its configuration.
@y
The task transfer tool is an internal tool that allows an agent to delegate a task
to sub-agents. To prevent an agent from delegating work, make sure it doesn't have
sub-agents defined in its configuration.
@z

@x
### Using tools via the Docker MCP Gateway
@y
### Using tools via the Docker MCP Gateway
@z

@x
If you use the [Docker MCP gateway](/manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md),
you can configure your agent to interact with the
gateway and use the MCP servers configured in it. See [docker mcp
gateway run](/reference/cli/docker/mcp/gateway/gateway_run.md).
@y
If you use the [Docker MCP gateway](manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md),
you can configure your agent to interact with the
gateway and use the MCP servers configured in it. See [docker mcp
gateway run](reference/cli/docker/mcp/gateway/gateway_run.md).
@z

@x
For example, to enable an agent to use Duckduckgo via the MCP Gateway:
@y
For example, to enable an agent to use Duckduckgo via the MCP Gateway:
@z

% snip code...

@x
## CLI interactive commands
@y
## CLI interactive commands
@z

@x
You can use the following CLI commands, during
CLI sessions with your agents:
@y
You can use the following CLI commands, during
CLI sessions with your agents:
@z

@x
| Command  | Description                              |
|----------|------------------------------------------|
| /exit    | Exit the program                         |
| /reset   | Clear conversation history               |
| /eval    | Save current conversation for evaluation |
| /compact | Compact the current session              |
@y
| Command  | Description                              |
|----------|------------------------------------------|
| /exit    | Exit the program                         |
| /reset   | Clear conversation history               |
| /eval    | Save current conversation for evaluation |
| /compact | Compact the current session              |
@z

@x
## Share your agents
@y
## Share your agents
@z

@x
Agent configurations can be packaged and shared via Docker Hub.
Before you start, make sure you have a [Docker repository](/manuals/docker-hub/repos/create.md).
@y
Agent configurations can be packaged and shared via Docker Hub.
Before you start, make sure you have a [Docker repository](manuals/docker-hub/repos/create.md).
@z

@x
To push an agent:
@y
To push an agent:
@z

% snip command...

@x
To pull an agent to the current directory:
@y
To pull an agent to the current directory:
@z

% snip command...

@x
The agent's configuration file is named `<namespace>_<reponame>.yaml`. Run
it with the `cagent run <filename>` command.
@y
The agent's configuration file is named `<namespace>_<reponame>.yaml`. Run
it with the `cagent run <filename>` command.
@z

@x
## Related pages
@y
## Related pages
@z

@x
- For more information about cagent, see the
[GitHub repository](https://github.com/docker/cagent).
- [Docker MCP Gateway](/manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md)
@y
- For more information about cagent, see the
[GitHub repository](https://github.com/docker/cagent).
- [Docker MCP Gateway](manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md)
@z
