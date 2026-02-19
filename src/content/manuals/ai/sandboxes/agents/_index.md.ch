%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: Supported agents
linkTitle: Agents
description: AI coding agents supported by Docker Sandboxes with experimental status and configuration details.
@y
title: Supported agents
linkTitle: Agents
description: AI coding agents supported by Docker Sandboxes with experimental status and configuration details.
@z

@x
{{< summary-bar feature_name="Docker Sandboxes" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes" >}}
@z

@x
Docker Sandboxes supports multiple AI coding agents. All agents run isolated
inside microVMs with private Docker daemons.
@y
Docker Sandboxes supports multiple AI coding agents. All agents run isolated
inside microVMs with private Docker daemons.
@z

@x
## Supported agents
@y
## Supported agents
@z

@x
| Agent       | Command    | Status       | Notes                                     |
| ----------- | ---------- | ------------ | ----------------------------------------- |
| Claude Code | `claude`   | Experimental | Most tested implementation                |
| Codex       | `codex`    | Experimental | In development                            |
| Copilot     | `copilot`  | Experimental | In development                            |
| Gemini      | `gemini`   | Experimental | In development                            |
| cagent      | `cagent`   | Experimental | In development                            |
| Kiro        | `kiro`     | Experimental | In development                            |
| OpenCode    | `opencode` | Experimental | In development                            |
| Custom shell | `shell`   | Experimental | Minimal environment for manual setup      |
@y
| Agent       | Command    | Status       | Notes                                     |
| ----------- | ---------- | ------------ | ----------------------------------------- |
| Claude Code | `claude`   | Experimental | Most tested implementation                |
| Codex       | `codex`    | Experimental | In development                            |
| Copilot     | `copilot`  | Experimental | In development                            |
| Gemini      | `gemini`   | Experimental | In development                            |
| cagent      | `cagent`   | Experimental | In development                            |
| Kiro        | `kiro`     | Experimental | In development                            |
| OpenCode    | `opencode` | Experimental | In development                            |
| Custom shell | `shell`   | Experimental | Minimal environment for manual setup      |
@z

@x
## Experimental status
@y
## Experimental status
@z

@x
All agents are experimental features. This means:
@y
All agents are experimental features. This means:
@z

@x
- Breaking changes may occur between Docker Desktop versions
- Features may be incomplete or change significantly
- Stability and performance are not production-ready
- Limited support and documentation
@y
- Breaking changes may occur between Docker Desktop versions
- Features may be incomplete or change significantly
- Stability and performance are not production-ready
- Limited support and documentation
@z

@x
Use sandboxes for development and testing, not production workloads.
@y
Use sandboxes for development and testing, not production workloads.
@z

@x
## Using different agents
@y
## Using different agents
@z

@x
The agent type is specified when creating a sandbox:
@y
The agent type is specified when creating a sandbox:
@z

% snip command...

@x
Each agent runs in its own isolated sandbox. The agent type is bound to the
sandbox when created and cannot be changed later.
@y
Each agent runs in its own isolated sandbox. The agent type is bound to the
sandbox when created and cannot be changed later.
@z

@x
## Agent-specific configuration
@y
## Agent-specific configuration
@z

@x
Each agent has its own credential requirements and authentication flow.
Credentials are scoped per agent and must be provided specifically for that
agent (no fallback authentication methods are used).
@y
Each agent has its own credential requirements and authentication flow.
Credentials are scoped per agent and must be provided specifically for that
agent (no fallback authentication methods are used).
@z

@x
See the agent-specific documentation:
@y
See the agent-specific documentation:
@z

@x
- [Claude Code](./claude-code.md)
- [cagent](./cagent.md)
- [Codex](./codex.md)
- [Copilot](./copilot.md)
- [Gemini](./gemini.md)
- [Kiro](./kiro.md)
- [OpenCode](./opencode.md)
- [Custom shell](./shell.md)
@y
- [Claude Code](./claude-code.md)
- [cagent](./cagent.md)
- [Codex](./codex.md)
- [Copilot](./copilot.md)
- [Gemini](./gemini.md)
- [Kiro](./kiro.md)
- [OpenCode](./opencode.md)
- [Custom shell](./shell.md)
@z

@x
## Requirements
@y
## Requirements
@z

@x
- Docker Desktop 4.58 or later
- Platform support:
  - macOS with virtualization.framework
  - Windows with Hyper-V {{< badge color=violet text=Experimental >}}
- API keys or credentials for your chosen agent
@y
- Docker Desktop 4.58 or later
- Platform support:
  - macOS with virtualization.framework
  - Windows with Hyper-V {{< badge color=violet text=Experimental >}}
- API keys or credentials for your chosen agent
@z
