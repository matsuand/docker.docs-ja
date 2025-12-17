%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Sharing agents
description: Distribute agent configurations through OCI registries
keywords: [cagent, oci, registry, docker hub, sharing, distribution]
@y
title: Sharing agents
description: Distribute agent configurations through OCI registries
keywords: [cagent, oci, registry, docker hub, sharing, distribution]
@z

@x
Push your agent to a registry and share it by name. Your teammates
reference `agentcatalog/security-expert` instead of copying YAML files
around or asking you where your agent configuration lives.
@y
Push your agent to a registry and share it by name. Your teammates
reference `agentcatalog/security-expert` instead of copying YAML files
around or asking you where your agent configuration lives.
@z

@x
When you update the agent in the registry, everyone gets the new version
the next time they pull or restart their client.
@y
When you update the agent in the registry, everyone gets the new version
the next time they pull or restart their client.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
To push agents to a registry, authenticate first:
@y
To push agents to a registry, authenticate first:
@z

@x
```console
$ docker login
```
@y
```console
$ docker login
```
@z

@x
For other registries, use their authentication method.
@y
For other registries, use their authentication method.
@z

@x
## Publishing agents
@y
## Publishing agents
@z

@x
Push your agent configuration to a registry:
@y
Push your agent configuration to a registry:
@z

@x
```console
$ cagent push ./agent.yml myusername/agent-name
```
@y
```console
$ cagent push ./agent.yml myusername/agent-name
```
@z

@x
Push creates the repository if it doesn't exist yet. Use Docker Hub or
any OCI-compatible registry.
@y
Push creates the repository if it doesn't exist yet. Use Docker Hub or
any OCI-compatible registry.
@z

@x
Tag specific versions:
@y
Tag specific versions:
@z

@x
```console
$ cagent push ./agent.yml myusername/agent-name:v1.0.0
$ cagent push ./agent.yml myusername/agent-name:latest
```
@y
```console
$ cagent push ./agent.yml myusername/agent-name:v1.0.0
$ cagent push ./agent.yml myusername/agent-name:latest
```
@z

@x
## Using published agents
@y
## Using published agents
@z

@x
Pull an agent to inspect it locally:
@y
Pull an agent to inspect it locally:
@z

@x
```console
$ cagent pull agentcatalog/pirate
```
@y
```console
$ cagent pull agentcatalog/pirate
```
@z

@x
This saves the configuration as a local YAML file.
@y
This saves the configuration as a local YAML file.
@z

@x
Run agents directly from the registry:
@y
Run agents directly from the registry:
@z

@x
```console
$ cagent run agentcatalog/pirate
```
@y
```console
$ cagent run agentcatalog/pirate
```
@z

@x
Or reference it directly in integrations:
@y
Or reference it directly in integrations:
@z

@x
### Editor integration (ACP)
@y
### Editor integration (ACP)
@z

@x
Use registry references in ACP configurations so your editor always uses
the latest version:
@y
Use registry references in ACP configurations so your editor always uses
the latest version:
@z

@x
```json
{
  "agent_servers": {
    "myagent": {
      "command": "cagent",
      "args": ["acp", "agentcatalog/pirate"]
    }
  }
}
```
@y
```json
{
  "agent_servers": {
    "myagent": {
      "command": "cagent",
      "args": ["acp", "agentcatalog/pirate"]
    }
  }
}
```
@z

@x
### MCP client integration
@y
### MCP client integration
@z

@x
Agents can be exposed as tools in MCP clients:
@y
Agents can be exposed as tools in MCP clients:
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
## What's next
@y
## What's next
@z

@x
- Set up [ACP integration](./integrations/acp.md) with shared agents
- Configure [MCP integration](./integrations/mcp.md) with shared agents
- Browse the [agent catalog](https://hub.docker.com/u/agentcatalog) for examples
@y
- Set up [ACP integration](./integrations/acp.md) with shared agents
- Configure [MCP integration](./integrations/mcp.md) with shared agents
- Browse the [agent catalog](https://hub.docker.com/u/agentcatalog) for examples
@z
