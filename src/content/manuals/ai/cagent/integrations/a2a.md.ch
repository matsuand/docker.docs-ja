%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: A2A mode
linkTitle: A2A
description: Expose cagent agents via the Agent-to-Agent protocol
keywords: [cagent, a2a, agent-to-agent, multi-agent, protocol]
@y
title: A2A mode
linkTitle: A2A
description: Expose cagent agents via the Agent-to-Agent protocol
keywords: [cagent, a2a, agent-to-agent, multi-agent, protocol]
@z

@x
A2A mode runs your cagent agent as an HTTP server that other systems can call
using the Agent-to-Agent protocol. This lets you expose your agent as a service
that other agents or applications can discover and invoke over the network.
@y
A2A mode runs your cagent agent as an HTTP server that other systems can call
using the Agent-to-Agent protocol. This lets you expose your agent as a service
that other agents or applications can discover and invoke over the network.
@z

@x
Use A2A when you want to make your agent callable by other systems over HTTP.
For editor integration, see [ACP integration](./acp.md). For using agents as
tools in MCP clients, see [MCP integration](./mcp.md).
@y
Use A2A when you want to make your agent callable by other systems over HTTP.
For editor integration, see [ACP integration](./acp.md). For using agents as
tools in MCP clients, see [MCP integration](./mcp.md).
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before starting an A2A server, you need:
@y
Before starting an A2A server, you need:
@z

@x
- cagent installed - See the [installation guide](../_index.md#installation)
- Agent configuration - A YAML file defining your agent. See the
  [tutorial](../tutorial.md)
- API keys configured - If using cloud model providers (see [Model
  providers](../model-providers.md))
@y
- cagent installed - See the [installation guide](../_index.md#installation)
- Agent configuration - A YAML file defining your agent. See the
  [tutorial](../tutorial.md)
- API keys configured - If using cloud model providers (see [Model
  providers](../model-providers.md))
@z

@x
## Starting an A2A server
@y
## Starting an A2A server
@z

@x
Basic usage:
@y
Basic usage:
@z

@x
```console
$ cagent a2a ./agent.yaml
```
@y
```console
$ cagent a2a ./agent.yaml
```
@z

@x
Your agent is now accessible via HTTP. Other A2A systems can discover your
agent's capabilities and call it.
@y
Your agent is now accessible via HTTP. Other A2A systems can discover your
agent's capabilities and call it.
@z

@x
Custom port:
@y
Custom port:
@z

@x
```console
$ cagent a2a ./agent.yaml --port 8080
```
@y
```console
$ cagent a2a ./agent.yaml --port 8080
```
@z

@x
Specific agent in a team:
@y
Specific agent in a team:
@z

@x
```console
$ cagent a2a ./agent.yaml --agent engineer
```
@y
```console
$ cagent a2a ./agent.yaml --agent engineer
```
@z

@x
From OCI registry:
@y
From OCI registry:
@z

@x
```console
$ cagent a2a agentcatalog/pirate --port 9000
```
@y
```console
$ cagent a2a agentcatalog/pirate --port 9000
```
@z

@x
## HTTP endpoints
@y
## HTTP endpoints
@z

@x
When you start an A2A server, it exposes two HTTP endpoints:
@y
When you start an A2A server, it exposes two HTTP endpoints:
@z

@x
### Agent card: `/.well-known/agent-card`
@y
### Agent card: `/.well-known/agent-card`
@z

@x
The agent card describes your agent's capabilities:
@y
The agent card describes your agent's capabilities:
@z

@x
```console
$ curl http://localhost:8080/.well-known/agent-card
```
@y
```console
$ curl http://localhost:8080/.well-known/agent-card
```
@z

@x
```json
{
  "name": "agent",
  "description": "A helpful coding assistant",
  "skills": [
    {
      "id": "agent_root",
      "name": "root",
      "description": "A helpful coding assistant",
      "tags": ["llm", "cagent"]
    }
  ],
  "preferredTransport": "jsonrpc",
  "url": "http://localhost:8080/invoke",
  "capabilities": {
    "streaming": true
  },
  "version": "0.1.0"
}
```
@y
```json
{
  "name": "agent",
  "description": "A helpful coding assistant",
  "skills": [
    {
      "id": "agent_root",
      "name": "root",
      "description": "A helpful coding assistant",
      "tags": ["llm", "cagent"]
    }
  ],
  "preferredTransport": "jsonrpc",
  "url": "http://localhost:8080/invoke",
  "capabilities": {
    "streaming": true
  },
  "version": "0.1.0"
}
```
@z

@x
### Invoke endpoint: `/invoke`
@y
### Invoke endpoint: `/invoke`
@z

@x
Call your agent by sending a JSON-RPC request:
@y
Call your agent by sending a JSON-RPC request:
@z

@x
```console
$ curl -X POST http://localhost:8080/invoke \
  -H "Content-Type: application/json" \
  -d '{
    "jsonrpc": "2.0",
    "id": "req-1",
    "method": "message/send",
    "params": {
      "message": {
        "role": "user",
        "parts": [
          {
            "kind": "text",
            "text": "What is 2+2?"
          }
        ]
      }
    }
  }'
```
@y
```console
$ curl -X POST http://localhost:8080/invoke \
  -H "Content-Type: application/json" \
  -d '{
    "jsonrpc": "2.0",
    "id": "req-1",
    "method": "message/send",
    "params": {
      "message": {
        "role": "user",
        "parts": [
          {
            "kind": "text",
            "text": "What is 2+2?"
          }
        ]
      }
    }
  }'
```
@z

@x
The response includes the agent's reply:
@y
The response includes the agent's reply:
@z

@x
```json
{
  "jsonrpc": "2.0",
  "id": "req-1",
  "result": {
    "artifacts": [
      {
        "parts": [
          {
            "kind": "text",
            "text": "2+2 equals 4."
          }
        ]
      }
    ]
  }
}
```
@y
```json
{
  "jsonrpc": "2.0",
  "id": "req-1",
  "result": {
    "artifacts": [
      {
        "parts": [
          {
            "kind": "text",
            "text": "2+2 equals 4."
          }
        ]
      }
    ]
  }
}
```
@z

@x
## Example: Multi-agent workflow
@y
## Example: Multi-agent workflow
@z

@x
Here's a concrete scenario where A2A is useful. You have two agents:
@y
Here's a concrete scenario where A2A is useful. You have two agents:
@z

@x
1. A general-purpose agent that interacts with users
2. A specialized code review agent with access to your codebase
@y
1. A general-purpose agent that interacts with users
2. A specialized code review agent with access to your codebase
@z

@x
Run the specialist as an A2A server:
@y
Run the specialist as an A2A server:
@z

@x
```console
$ cagent a2a ./code-reviewer.yaml --port 8080
Listening on 127.0.0.1:8080
```
@y
```console
$ cagent a2a ./code-reviewer.yaml --port 8080
Listening on 127.0.0.1:8080
```
@z

@x
Configure your main agent to call it:
@y
Configure your main agent to call it:
@z

@x
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    instruction: You are a helpful assistant
    toolsets:
      - type: a2a
        url: http://localhost:8080
        name: code-reviewer
```
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    instruction: You are a helpful assistant
    toolsets:
      - type: a2a
        url: http://localhost:8080
        name: code-reviewer
```
@z

@x
Now when users ask the main agent about code quality, it can delegate to the
specialist. The main agent sees `code-reviewer` as a tool it can call, and the
specialist has access to the codebase tools it needs.
@y
Now when users ask the main agent about code quality, it can delegate to the
specialist. The main agent sees `code-reviewer` as a tool it can call, and the
specialist has access to the codebase tools it needs.
@z

@x
## Calling other A2A agents
@y
## Calling other A2A agents
@z

@x
Your cagent agents can call remote A2A agents as tools. Configure the A2A
toolset with the remote agent's URL:
@y
Your cagent agents can call remote A2A agents as tools. Configure the A2A
toolset with the remote agent's URL:
@z

@x
```yaml
agents:
  root:
    toolsets:
      - type: a2a
        url: http://localhost:8080
        name: specialist
```
@y
```yaml
agents:
  root:
    toolsets:
      - type: a2a
        url: http://localhost:8080
        name: specialist
```
@z

@x
The `url` specifies where the remote agent is running, and `name` is an
optional identifier for the tool. Your agent can now delegate tasks to the
remote specialist agent.
@y
The `url` specifies where the remote agent is running, and `name` is an
optional identifier for the tool. Your agent can now delegate tasks to the
remote specialist agent.
@z

@x
If the remote agent requires authentication or custom headers:
@y
If the remote agent requires authentication or custom headers:
@z

@x
```yaml
agents:
  root:
    toolsets:
      - type: a2a
        url: http://localhost:8080
        name: specialist
        remote:
          headers:
            Authorization: Bearer token123
            X-Custom-Header: value
```
@y
```yaml
agents:
  root:
    toolsets:
      - type: a2a
        url: http://localhost:8080
        name: specialist
        remote:
          headers:
            Authorization: Bearer token123
            X-Custom-Header: value
```
@z

@x
## What's next
@y
## What's next
@z

@x
- Review the [CLI reference](../reference/cli.md#a2a) for all `cagent a2a`
  options
- Learn about [MCP mode](./mcp.md) to expose agents as tools in MCP clients
- Learn about [ACP mode](./acp.md) for editor integration
- Share your agents with [OCI registries](../sharing-agents.md)
@y
- Review the [CLI reference](../reference/cli.md#a2a) for all `cagent a2a`
  options
- Learn about [MCP mode](./mcp.md) to expose agents as tools in MCP clients
- Learn about [ACP mode](./acp.md) for editor integration
- Share your agents with [OCI registries](../sharing-agents.md)
@z
