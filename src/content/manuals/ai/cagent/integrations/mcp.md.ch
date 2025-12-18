%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: MCP mode
linkTitle: MCP
description: Expose cagent agents as tools to MCP clients like Claude Desktop and Claude Code
keywords:
  [
    cagent,
    mcp,
    model context protocol,
    claude desktop,
    claude code,
    integration,
  ]
@y
title: MCP mode
linkTitle: MCP
description: Expose cagent agents as tools to MCP clients like Claude Desktop and Claude Code
keywords:
  [
    cagent,
    mcp,
    model context protocol,
    claude desktop,
    claude code,
    integration,
  ]
@z

@x
When you run cagent in MCP mode, your agents show up as tools in Claude Desktop
and other MCP clients. Instead of switching to a terminal to run your security
agent, you ask Claude to use it and Claude calls it for you.
@y
When you run cagent in MCP mode, your agents show up as tools in Claude Desktop
and other MCP clients. Instead of switching to a terminal to run your security
agent, you ask Claude to use it and Claude calls it for you.
@z

@x
This guide covers setup for Claude Desktop and Claude Code. If you want agents
embedded in your editor instead, see [ACP integration](./acp.md).
@y
This guide covers setup for Claude Desktop and Claude Code. If you want agents
embedded in your editor instead, see [ACP integration](./acp.md).
@z

@x
## How it works
@y
## How it works
@z

@x
You configure Claude Desktop (or another MCP client) to connect to cagent. Your
agents appear in Claude's tool list. When you ask Claude to use one, it calls
that agent through the MCP protocol.
@y
You configure Claude Desktop (or another MCP client) to connect to cagent. Your
agents appear in Claude's tool list. When you ask Claude to use one, it calls
that agent through the MCP protocol.
@z

@x
Say you have a security agent configured. Ask Claude Desktop "Use the security
agent to audit this authentication code" and Claude calls it. The agent runs
with its configured tools (filesystem, shell, whatever you gave it), then
returns results to Claude.
@y
Say you have a security agent configured. Ask Claude Desktop "Use the security
agent to audit this authentication code" and Claude calls it. The agent runs
with its configured tools (filesystem, shell, whatever you gave it), then
returns results to Claude.
@z

@x
If your configuration has multiple agents, each one becomes a separate tool. A
config with `root`, `designer`, and `engineer` agents gives Claude three tools
to choose from. Claude might call the engineer directly or use the root
coordinator—depends on your agent descriptions and what you ask for.
@y
If your configuration has multiple agents, each one becomes a separate tool. A
config with `root`, `designer`, and `engineer` agents gives Claude three tools
to choose from. Claude might call the engineer directly or use the root
coordinator—depends on your agent descriptions and what you ask for.
@z

@x
## MCP Gateway
@y
## MCP Gateway
@z

@x
Docker provides an [MCP Gateway](/ai/mcp-catalog-and-toolkit/mcp-gateway/) that
gives cagent agents access to a catalog of pre-configured MCP servers. Instead
of configuring individual MCP servers, agents can use the gateway to access
tools like web search, database queries, and more.
@y
Docker provides an [MCP Gateway](__SUBDIR__/ai/mcp-catalog-and-toolkit/mcp-gateway/) that
gives cagent agents access to a catalog of pre-configured MCP servers. Instead
of configuring individual MCP servers, agents can use the gateway to access
tools like web search, database queries, and more.
@z

@x
Configure MCP toolset with gateway reference:
@y
Configure MCP toolset with gateway reference:
@z

@x
```yaml
agents:
  root:
    toolsets:
      - type: mcp
        ref: docker:duckduckgo # Uses Docker MCP Gateway
```
@y
```yaml
agents:
  root:
    toolsets:
      - type: mcp
        ref: docker:duckduckgo # Uses Docker MCP Gateway
```
@z

@x
The `docker:` prefix tells cagent to use the MCP Gateway for this server. See
the [MCP Gateway documentation](/ai/mcp-catalog-and-toolkit/mcp-gateway/) for
available servers and configuration options.
@y
The `docker:` prefix tells cagent to use the MCP Gateway for this server. See
the [MCP Gateway documentation](__SUBDIR__/ai/mcp-catalog-and-toolkit/mcp-gateway/) for
available servers and configuration options.
@z

@x
You can also use the [MCP Toolkit](/ai/mcp-catalog-and-toolkit/) to explore and
manage MCP servers interactively.
@y
You can also use the [MCP Toolkit](__SUBDIR__/ai/mcp-catalog-and-toolkit/) to explore and
manage MCP servers interactively.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before configuring MCP integration, you need:
@y
Before configuring MCP integration, you need:
@z

@x
- **cagent installed** - See the [installation guide](../_index.md#installation)
- **Agent configuration** - A YAML file defining your agent. See the
  [tutorial](../tutorial.md) or [example
  configurations](https://github.com/docker/cagent/tree/main/examples)
- **MCP client** - Claude Desktop, Claude Code, or another MCP-compatible
  application
- **API keys** - Environment variables for any model providers your agents use
  (`ANTHROPIC_API_KEY`, `OPENAI_API_KEY`, etc.)
@y
- **cagent installed** - See the [installation guide](../_index.md#installation)
- **Agent configuration** - A YAML file defining your agent. See the
  [tutorial](../tutorial.md) or [example
  configurations](https://github.com/docker/cagent/tree/main/examples)
- **MCP client** - Claude Desktop, Claude Code, or another MCP-compatible
  application
- **API keys** - Environment variables for any model providers your agents use
  (`ANTHROPIC_API_KEY`, `OPENAI_API_KEY`, etc.)
@z

@x
## MCP client configuration
@y
## MCP client configuration
@z

@x
Your MCP client needs to know how to start cagent and communicate with it. This
typically involves adding cagent as an MCP server in your client's
configuration.
@y
Your MCP client needs to know how to start cagent and communicate with it. This
typically involves adding cagent as an MCP server in your client's
configuration.
@z

@x
### Claude Desktop
@y
### Claude Desktop
@z

@x
Add cagent to your Claude Desktop MCP settings file:
@y
Add cagent to your Claude Desktop MCP settings file:
@z

@x
- macOS: `~/Library/Application Support/Claude/claude_desktop_config.json`
- Windows: `%APPDATA%\Claude\claude_desktop_config.json`
@y
- macOS: `~/Library/Application Support/Claude/claude_desktop_config.json`
- Windows: `%APPDATA%\Claude\claude_desktop_config.json`
@z

@x
Example configuration:
@y
Example configuration:
@z

@x
```json
{
  "mcpServers": {
    "myagent": {
      "command": "/usr/local/bin/cagent",
      "args": [
        "mcp",
        "/path/to/agent.yml",
        "--working-dir",
        "/Users/yourname/projects"
      ],
      "env": {
        "ANTHROPIC_API_KEY": "your_anthropic_key_here",
        "OPENAI_API_KEY": "your_openai_key_here"
      }
    }
  }
}
```
@y
```json
{
  "mcpServers": {
    "myagent": {
      "command": "/usr/local/bin/cagent",
      "args": [
        "mcp",
        "/path/to/agent.yml",
        "--working-dir",
        "/Users/yourname/projects"
      ],
      "env": {
        "ANTHROPIC_API_KEY": "your_anthropic_key_here",
        "OPENAI_API_KEY": "your_openai_key_here"
      }
    }
  }
}
```
@z

@x
Configuration breakdown:
@y
Configuration breakdown:
@z

@x
- `command`: Full path to your `cagent` binary (use `which cagent` to find it)
- `args`: MCP command arguments:
  - `mcp`: The subcommand to run cagent in MCP mode
  - `dockereng/myagent`: Your agent configuration (local file path or OCI
    reference)
  - `--working-dir`: Optional working directory for agent execution
- `env`: Environment variables your agents need:
  - Model provider API keys (`ANTHROPIC_API_KEY`, `OPENAI_API_KEY`, etc.)
  - Any other environment variables your agents reference
@y
- `command`: Full path to your `cagent` binary (use `which cagent` to find it)
- `args`: MCP command arguments:
  - `mcp`: The subcommand to run cagent in MCP mode
  - `dockereng/myagent`: Your agent configuration (local file path or OCI
    reference)
  - `--working-dir`: Optional working directory for agent execution
- `env`: Environment variables your agents need:
  - Model provider API keys (`ANTHROPIC_API_KEY`, `OPENAI_API_KEY`, etc.)
  - Any other environment variables your agents reference
@z

@x
After updating the configuration, restart Claude Desktop. Your agents will
appear as available tools.
@y
After updating the configuration, restart Claude Desktop. Your agents will
appear as available tools.
@z

@x
### Claude Code
@y
### Claude Code
@z

@x
Add cagent as an MCP server using the `claude mcp add` command:
@y
Add cagent as an MCP server using the `claude mcp add` command:
@z

@x
```console
$ claude mcp add --transport stdio myagent \
  --env OPENAI_API_KEY=$OPENAI_API_KEY \
  --env ANTHROPIC_API_KEY=$ANTHROPIC_API_KEY \
  -- cagent mcp /path/to/agent.yml --working-dir $(pwd)
```
@y
```console
$ claude mcp add --transport stdio myagent \
  --env OPENAI_API_KEY=$OPENAI_API_KEY \
  --env ANTHROPIC_API_KEY=$ANTHROPIC_API_KEY \
  -- cagent mcp /path/to/agent.yml --working-dir $(pwd)
```
@z

@x
Command breakdown:
@y
Command breakdown:
@z

@x
- `claude mcp add`: Claude Code command to register an MCP server
- `--transport stdio`: Use stdio transport (standard for local MCP servers)
- `myagent`: Name for this MCP server in Claude Code
- `--env`: Pass environment variables (repeat for each variable)
- `--`: Separates Claude Code options from the MCP server command
- `cagent mcp /path/to/agent.yml`: The cagent MCP command with the path to your
  agent configuration
- `--working-dir $(pwd)`: Set the working directory for agent execution
@y
- `claude mcp add`: Claude Code command to register an MCP server
- `--transport stdio`: Use stdio transport (standard for local MCP servers)
- `myagent`: Name for this MCP server in Claude Code
- `--env`: Pass environment variables (repeat for each variable)
- `--`: Separates Claude Code options from the MCP server command
- `cagent mcp /path/to/agent.yml`: The cagent MCP command with the path to your
  agent configuration
- `--working-dir $(pwd)`: Set the working directory for agent execution
@z

@x
After adding the server, your agents will be available as tools in Claude Code
sessions.
@y
After adding the server, your agents will be available as tools in Claude Code
sessions.
@z

@x
### Other MCP clients
@y
### Other MCP clients
@z

@x
For other MCP-compatible clients, you need to:
@y
For other MCP-compatible clients, you need to:
@z

@x
1. Start cagent with `cagent mcp /path/to/agent.yml --working-dir /project/path`
2. Configure the client to communicate with cagent over stdio
3. Pass required environment variables (API keys, etc.)
@y
1. Start cagent with `cagent mcp /path/to/agent.yml --working-dir /project/path`
2. Configure the client to communicate with cagent over stdio
3. Pass required environment variables (API keys, etc.)
@z

@x
Consult your MCP client's documentation for specific configuration steps.
@y
Consult your MCP client's documentation for specific configuration steps.
@z

@x
## Agent references
@y
## Agent references
@z

@x
You can specify your agent configuration as a local file path or OCI registry
reference:
@y
You can specify your agent configuration as a local file path or OCI registry
reference:
@z

@x
```console
# Local file path
$ cagent mcp ./agent.yml
@y
```console
# Local file path
$ cagent mcp ./agent.yml
@z

@x
# OCI registry reference
$ cagent mcp agentcatalog/pirate
$ cagent mcp dockereng/myagent:v1.0.0
```
@y
# OCI registry reference
$ cagent mcp agentcatalog/pirate
$ cagent mcp dockereng/myagent:v1.0.0
```
@z

@x
Use the same syntax in MCP client configurations:
@y
Use the same syntax in MCP client configurations:
@z

@x
```json
{
  "mcpServers": {
    "myagent": {
      "command": "/usr/local/bin/cagent",
      "args": ["mcp", "agentcatalog/pirate"]
    }
  }
}
```
@y
```json
{
  "mcpServers": {
    "myagent": {
      "command": "/usr/local/bin/cagent",
      "args": ["mcp", "agentcatalog/pirate"]
    }
  }
}
```
@z

@x
Registry references let your team use the same agent configuration without
managing local files. See [Sharing agents](../sharing-agents.md) for details.
@y
Registry references let your team use the same agent configuration without
managing local files. See [Sharing agents](../sharing-agents.md) for details.
@z

@x
## Designing agents for MCP
@y
## Designing agents for MCP
@z

@x
MCP clients see each of your agents as a separate tool and can call any of them
directly. This changes how you should think about agent design compared to
running agents with `cagent run`.
@y
MCP clients see each of your agents as a separate tool and can call any of them
directly. This changes how you should think about agent design compared to
running agents with `cagent run`.
@z

@x
### Write good descriptions
@y
### Write good descriptions
@z

@x
The `description` field tells the MCP client what the agent does. This is how
the client decides when to call it. "Analyzes code for security vulnerabilities
and compliance issues" is specific. "A helpful security agent" doesn't say what
it actually does.
@y
The `description` field tells the MCP client what the agent does. This is how
the client decides when to call it. "Analyzes code for security vulnerabilities
and compliance issues" is specific. "A helpful security agent" doesn't say what
it actually does.
@z

@x
```yaml
agents:
  security_auditor:
    description: Analyzes code for security vulnerabilities and compliance issues
    # Not: "A helpful security agent"
```
@y
```yaml
agents:
  security_auditor:
    description: Analyzes code for security vulnerabilities and compliance issues
    # Not: "A helpful security agent"
```
@z

@x
### MCP clients call agents directly
@y
### MCP clients call agents directly
@z

@x
The MCP client can call any of your agents, not just root. If you have `root`,
`designer`, and `engineer` agents, the client might call the engineer directly
instead of going through root. Design each agent to work on its own:
@y
The MCP client can call any of your agents, not just root. If you have `root`,
`designer`, and `engineer` agents, the client might call the engineer directly
instead of going through root. Design each agent to work on its own:
@z

@x
```yaml
agents:
  engineer:
    description: Implements features and writes production code
    instruction: |
      You implement code based on requirements provided.
      You can work independently without a coordinator.
    toolsets:
      - type: filesystem
      - type: shell
```
@y
```yaml
agents:
  engineer:
    description: Implements features and writes production code
    instruction: |
      You implement code based on requirements provided.
      You can work independently without a coordinator.
    toolsets:
      - type: filesystem
      - type: shell
```
@z

@x
If an agent needs others to work properly, say so in the description:
"Coordinates design and engineering agents to implement complete features."
@y
If an agent needs others to work properly, say so in the description:
"Coordinates design and engineering agents to implement complete features."
@z

@x
### Test each agent on its own
@y
### Test each agent on its own
@z

@x
MCP clients call agents individually, so test them that way:
@y
MCP clients call agents individually, so test them that way:
@z

@x
```console
$ cagent run agent.yml --agent engineer
```
@y
```console
$ cagent run agent.yml --agent engineer
```
@z

@x
Make sure the agent works without going through root first. Check that it has
the right tools and that its instructions make sense when it's called directly.
@y
Make sure the agent works without going through root first. Check that it has
the right tools and that its instructions make sense when it's called directly.
@z

@x
## Testing your setup
@y
## Testing your setup
@z

@x
Verify your MCP integration works:
@y
Verify your MCP integration works:
@z

@x
1. Restart your MCP client after configuration changes
2. Check that cagent agents appear as available tools
3. Invoke an agent with a simple test prompt
4. Verify the agent can access its configured tools (filesystem, shell, etc.)
@y
1. Restart your MCP client after configuration changes
2. Check that cagent agents appear as available tools
3. Invoke an agent with a simple test prompt
4. Verify the agent can access its configured tools (filesystem, shell, etc.)
@z

@x
If agents don't appear or fail to execute, check:
@y
If agents don't appear or fail to execute, check:
@z

@x
- `cagent` binary path is correct and executable
- Agent configuration file exists and is valid
- All required API keys are set in environment variables
- Working directory path exists and has appropriate permissions
- MCP client logs for connection or execution errors
@y
- `cagent` binary path is correct and executable
- Agent configuration file exists and is valid
- All required API keys are set in environment variables
- Working directory path exists and has appropriate permissions
- MCP client logs for connection or execution errors
@z

@x
## Common workflows
@y
## Common workflows
@z

@x
### Call specialist agents
@y
### Call specialist agents
@z

@x
You have a security agent that knows your compliance rules and common
vulnerabilities. In Claude Desktop, paste some authentication code and ask "Use
the security agent to review this." The agent checks the code and reports what
it finds. You stay in Claude's interface the whole time.
@y
You have a security agent that knows your compliance rules and common
vulnerabilities. In Claude Desktop, paste some authentication code and ask "Use
the security agent to review this." The agent checks the code and reports what
it finds. You stay in Claude's interface the whole time.
@z

@x
### Work with agent teams
@y
### Work with agent teams
@z

@x
Your configuration has a coordinator that delegates to designer and engineer
agents. Ask Claude Code "Use the coordinator to implement a login form" and the
coordinator hands off UI work to the designer and code to the engineer. You get
a complete implementation without running `cagent run` yourself.
@y
Your configuration has a coordinator that delegates to designer and engineer
agents. Ask Claude Code "Use the coordinator to implement a login form" and the
coordinator hands off UI work to the designer and code to the engineer. You get
a complete implementation without running `cagent run` yourself.
@z

@x
### Run domain-specific tools
@y
### Run domain-specific tools
@z

@x
You built an infrastructure agent with custom deployment scripts and monitoring
queries. Ask any MCP client "Use the infra agent to check production status" and
it runs your tools and returns results. Your deployment knowledge is now
available wherever you use MCP clients.
@y
You built an infrastructure agent with custom deployment scripts and monitoring
queries. Ask any MCP client "Use the infra agent to check production status" and
it runs your tools and returns results. Your deployment knowledge is now
available wherever you use MCP clients.
@z

@x
### Share agents
@y
### Share agents
@z

@x
Your team keeps agents in an OCI registry. Everyone adds
`agentcatalog/security-expert` to their MCP client config. When you update the
agent, they get the new version on their next restart. No YAML files to pass
around.
@y
Your team keeps agents in an OCI registry. Everyone adds
`agentcatalog/security-expert` to their MCP client config. When you update the
agent, they get the new version on their next restart. No YAML files to pass
around.
@z

@x
## What's next
@y
## What's next
@z

@x
- Use the [MCP Gateway](/ai/mcp-catalog-and-toolkit/mcp-gateway/) to give your
  agents access to pre-configured MCP servers
- Explore MCP servers interactively with the [MCP
  Toolkit](/ai/mcp-catalog-and-toolkit/)
- Review the [configuration reference](../reference/config.md) for advanced
  agent setup
- Explore the [toolsets reference](../reference/toolsets.md) to learn what tools
  agents can use
- Add [RAG for codebase search](../rag.md) to your agent
- Check the [CLI reference](../reference/cli.md) for all `cagent mcp` options
- Browse [example
  configurations](https://github.com/docker/cagent/tree/main/examples) for
  different agent types
@y
- Use the [MCP Gateway](__SUBDIR__/ai/mcp-catalog-and-toolkit/mcp-gateway/) to give your
  agents access to pre-configured MCP servers
- Explore MCP servers interactively with the [MCP
  Toolkit](__SUBDIR__/ai/mcp-catalog-and-toolkit/)
- Review the [configuration reference](../reference/config.md) for advanced
  agent setup
- Explore the [toolsets reference](../reference/toolsets.md) to learn what tools
  agents can use
- Add [RAG for codebase search](../rag.md) to your agent
- Check the [CLI reference](../reference/cli.md) for all `cagent mcp` options
- Browse [example
  configurations](https://github.com/docker/cagent/tree/main/examples) for
  different agent types
@z
