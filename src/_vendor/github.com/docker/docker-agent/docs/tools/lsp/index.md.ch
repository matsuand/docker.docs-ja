%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "LSP Tool"
description: "Connect to Language Server Protocol servers for code intelligence."
keywords: docker agent, ai agents, tools, toolsets, lsp tool
linkTitle: "LSP"
@y
title: "LSP Tool"
description: "Connect to Language Server Protocol servers for code intelligence."
keywords: docker agent, ai agents, tools, toolsets, lsp tool
linkTitle: "LSP"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/tools/lsp/
@y
canonical: __SUBDIR__/ai/docker-agent/tools/lsp/
@z

@x
_Connect to Language Server Protocol servers for code intelligence._
@y
_Connect to Language Server Protocol servers for code intelligence._
@z

@x
## Overview
@y
## Overview
@z

@x
The LSP tool connects your agent to any Language Server Protocol (LSP) server, providing comprehensive code intelligence capabilities like go-to-definition, find references, diagnostics, and more.
@y
The LSP tool connects your agent to any Language Server Protocol (LSP) server, providing comprehensive code intelligence capabilities like go-to-definition, find references, diagnostics, and more.
@z

@x
> [!NOTE]
> **What is LSP?**
>
> The [Language Server Protocol](https://microsoft.github.io/language-server-protocol/) is a standard for providing language features like autocomplete, go-to-definition, and diagnostics. Most programming languages have LSP servers available.
@y
> [!NOTE]
> **What is LSP?**
>
> The [Language Server Protocol](https://microsoft.github.io/language-server-protocol/) is a standard for providing language features like autocomplete, go-to-definition, and diagnostics. Most programming languages have LSP servers available.
@z

@x
## Available Tools
@y
## Available Tools
@z

@x
The LSP toolset provides these tools to the agent:
@y
The LSP toolset provides these tools to the agent:
@z

@x
| Tool                    | Description                                   | Read-Only |
| ----------------------- | --------------------------------------------- | --------- |
| `lsp_workspace`         | Get workspace info and available capabilities | ✓         |
| `lsp_hover`             | Get type info and documentation for a symbol  | ✓         |
| `lsp_definition`        | Find where a symbol is defined                | ✓         |
| `lsp_references`        | Find all references to a symbol               | ✓         |
| `lsp_document_symbols`  | List all symbols in a file                    | ✓         |
| `lsp_workspace_symbols` | Search symbols across the workspace           | ✓         |
| `lsp_diagnostics`       | Get errors and warnings for a file            | ✓         |
| `lsp_code_actions`      | Get available quick fixes and refactorings    | ✓         |
| `lsp_rename`            | Rename a symbol across the workspace          | ✗         |
| `lsp_format`            | Format a file                                 | ✗         |
| `lsp_call_hierarchy`    | Find incoming/outgoing calls                  | ✓         |
| `lsp_type_hierarchy`    | Find supertypes/subtypes                      | ✓         |
| `lsp_implementations`   | Find interface implementations                | ✓         |
| `lsp_signature_help`    | Get function signature at call site           | ✓         |
| `lsp_inlay_hints`       | Get type annotations and parameter names      | ✓         |
@y
| Tool                    | Description                                   | Read-Only |
| ----------------------- | --------------------------------------------- | --------- |
| `lsp_workspace`         | Get workspace info and available capabilities | ✓         |
| `lsp_hover`             | Get type info and documentation for a symbol  | ✓         |
| `lsp_definition`        | Find where a symbol is defined                | ✓         |
| `lsp_references`        | Find all references to a symbol               | ✓         |
| `lsp_document_symbols`  | List all symbols in a file                    | ✓         |
| `lsp_workspace_symbols` | Search symbols across the workspace           | ✓         |
| `lsp_diagnostics`       | Get errors and warnings for a file            | ✓         |
| `lsp_code_actions`      | Get available quick fixes and refactorings    | ✓         |
| `lsp_rename`            | Rename a symbol across the workspace          | ✗         |
| `lsp_format`            | Format a file                                 | ✗         |
| `lsp_call_hierarchy`    | Find incoming/outgoing calls                  | ✓         |
| `lsp_type_hierarchy`    | Find supertypes/subtypes                      | ✓         |
| `lsp_implementations`   | Find interface implementations                | ✓         |
| `lsp_signature_help`    | Get function signature at call site           | ✓         |
| `lsp_inlay_hints`       | Get type annotations and parameter names      | ✓         |
@z

@x
## Configuration
@y
## Configuration
@z

@x
```yaml
agents:
  developer:
    model: anthropic/claude-sonnet-4-5
    description: Code developer with LSP support
    instruction: You are a software developer.
    toolsets:
      - type: lsp
        command: gopls
        args: []
        file_types: [".go"]
      - type: filesystem
      - type: shell
```
@y
```yaml
agents:
  developer:
    model: anthropic/claude-sonnet-4-5
    description: Code developer with LSP support
    instruction: You are a software developer.
    toolsets:
      - type: lsp
        command: gopls
        args: []
        file_types: [".go"]
      - type: filesystem
      - type: shell
```
@z

@x
## Properties
@y
## Properties
@z

@x
| Property      | Type   | Required | Description                                                                                                                  |
| ------------- | ------ | -------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `command`     | string | ✓        | LSP server executable command                                                                                                |
| `args`        | array  | ✗        | Command-line arguments for the LSP server                                                                                    |
| `env`         | object | ✗        | Environment variables for the LSP process                                                                                    |
| `file_types`  | array  | ✗        | File extensions this LSP handles (e.g., `[".go", ".mod"]`)                                                                   |
| `working_dir` | string | ✗        | Working directory for the LSP server process. Relative paths are resolved against the agent's working directory. Defaults to the agent's working directory when omitted. |
| `version`     | string | ✗        | Package reference for [auto-installing](../../configuration/tools/index.md#auto-installing-tools) the command binary |
@y
| Property      | Type   | Required | Description                                                                                                                  |
| ------------- | ------ | -------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `command`     | string | ✓        | LSP server executable command                                                                                                |
| `args`        | array  | ✗        | Command-line arguments for the LSP server                                                                                    |
| `env`         | object | ✗        | Environment variables for the LSP process                                                                                    |
| `file_types`  | array  | ✗        | File extensions this LSP handles (e.g., `[".go", ".mod"]`)                                                                   |
| `working_dir` | string | ✗        | Working directory for the LSP server process. Relative paths are resolved against the agent's working directory. Defaults to the agent's working directory when omitted. |
| `version`     | string | ✗        | Package reference for [auto-installing](../../configuration/tools/index.md#auto-installing-tools) the command binary |
@z

@x
## Common LSP Servers
@y
## Common LSP Servers
@z

@x
Here are configurations for popular languages:
@y
Here are configurations for popular languages:
@z

@x
### Go (gopls)
@y
### Go (gopls)
@z

@x
```yaml
toolsets:
  - type: lsp
    command: gopls
    version: "golang/tools@v0.21.0" # optional: auto-install if not in PATH
    file_types: [".go"]
```
@y
```yaml
toolsets:
  - type: lsp
    command: gopls
    version: "golang/tools@v0.21.0" # optional: auto-install if not in PATH
    file_types: [".go"]
```
@z

@x
If your Go module lives in a subdirectory (e.g. a monorepo where `go.mod` is under `./backend`), set `working_dir` so `gopls` is started from the module root:
@y
If your Go module lives in a subdirectory (e.g. a monorepo where `go.mod` is under `./backend`), set `working_dir` so `gopls` is started from the module root:
@z

@x
```yaml
toolsets:
  - type: lsp
    command: gopls
    file_types: [".go"]
    working_dir: ./backend # gopls must be started from the module root
```
@y
```yaml
toolsets:
  - type: lsp
    command: gopls
    file_types: [".go"]
    working_dir: ./backend # gopls must be started from the module root
```
@z

@x
### TypeScript/JavaScript (typescript-language-server)
@y
### TypeScript/JavaScript (typescript-language-server)
@z

@x
```yaml
toolsets:
  - type: lsp
    command: typescript-language-server
    args: ["--stdio"]
    file_types: [".ts", ".tsx", ".js", ".jsx"]
```
@y
```yaml
toolsets:
  - type: lsp
    command: typescript-language-server
    args: ["--stdio"]
    file_types: [".ts", ".tsx", ".js", ".jsx"]
```
@z

@x
### Python (pylsp)
@y
### Python (pylsp)
@z

@x
```yaml
toolsets:
  - type: lsp
    command: pylsp
    file_types: [".py"]
```
@y
```yaml
toolsets:
  - type: lsp
    command: pylsp
    file_types: [".py"]
```
@z

@x
### Rust (rust-analyzer)
@y
### Rust (rust-analyzer)
@z

@x
```yaml
toolsets:
  - type: lsp
    command: rust-analyzer
    file_types: [".rs"]
```
@y
```yaml
toolsets:
  - type: lsp
    command: rust-analyzer
    file_types: [".rs"]
```
@z

@x
### C/C++ (clangd)
@y
### C/C++ (clangd)
@z

@x
```yaml
toolsets:
  - type: lsp
    command: clangd
    file_types: [".c", ".cpp", ".h", ".hpp"]
```
@y
```yaml
toolsets:
  - type: lsp
    command: clangd
    file_types: [".c", ".cpp", ".h", ".hpp"]
```
@z

@x
## Multiple LSP Servers
@y
## Multiple LSP Servers
@z

@x
You can configure multiple LSP servers for different file types:
@y
You can configure multiple LSP servers for different file types:
@z

@x
```yaml
agents:
  polyglot:
    model: anthropic/claude-sonnet-4-5
    description: Multi-language developer
    instruction: You are a full-stack developer.
    toolsets:
      - type: lsp
        command: gopls
        file_types: [".go"]
      - type: lsp
        command: typescript-language-server
        args: ["--stdio"]
        file_types: [".ts", ".tsx", ".js", ".jsx"]
      - type: lsp
        command: pylsp
        file_types: [".py"]
      - type: filesystem
      - type: shell
```
@y
```yaml
agents:
  polyglot:
    model: anthropic/claude-sonnet-4-5
    description: Multi-language developer
    instruction: You are a full-stack developer.
    toolsets:
      - type: lsp
        command: gopls
        file_types: [".go"]
      - type: lsp
        command: typescript-language-server
        args: ["--stdio"]
        file_types: [".ts", ".tsx", ".js", ".jsx"]
      - type: lsp
        command: pylsp
        file_types: [".py"]
      - type: filesystem
      - type: shell
```
@z

@x
## Workflow Instructions
@y
## Workflow Instructions
@z

@x
The LSP tool includes built-in instructions that guide the agent on how to use it effectively. The agent learns to:
@y
The LSP tool includes built-in instructions that guide the agent on how to use it effectively. The agent learns to:
@z

@x
1. Start with `lsp_workspace` to understand available capabilities
2. Use `lsp_workspace_symbols` to find relevant code
3. Use `lsp_references` before modifying any symbol
4. Check `lsp_diagnostics` after every code change
5. Apply `lsp_format` after edits are complete
@y
1. Start with `lsp_workspace` to understand available capabilities
2. Use `lsp_workspace_symbols` to find relevant code
3. Use `lsp_references` before modifying any symbol
4. Check `lsp_diagnostics` after every code change
5. Apply `lsp_format` after edits are complete
@z

@x
> [!TIP]
> **Best Practice**
>
> Always include the `filesystem` tool alongside LSP. The agent needs filesystem access to read and write code files, while LSP provides intelligence about the code.
@y
> [!TIP]
> **Best Practice**
>
> Always include the `filesystem` tool alongside LSP. The agent needs filesystem access to read and write code files, while LSP provides intelligence about the code.
@z

@x
## Capability Detection
@y
## Capability Detection
@z

@x
Not all LSP servers support all features. During the `initialize` handshake, Docker Agent reads the server's `ServerCapabilities` and **filters out the `lsp_*` tools the server does not advertise**. The model never sees, for example, `lsp_inlay_hints` against a server that doesn't support it, so it can't waste a turn calling a tool that would only fail.
@y
Not all LSP servers support all features. During the `initialize` handshake, Docker Agent reads the server's `ServerCapabilities` and **filters out the `lsp_*` tools the server does not advertise**. The model never sees, for example, `lsp_inlay_hints` against a server that doesn't support it, so it can't waste a turn calling a tool that would only fail.
@z

@x
The agent uses `lsp_workspace` to discover what's available:
@y
The agent uses `lsp_workspace` to discover what's available:
@z

@x
```text
Workspace Information:
- Root: /path/to/project
- Server: gopls v0.14.0
- File types: .go
@y
```text
Workspace Information:
- Root: /path/to/project
- Server: gopls v0.14.0
- File types: .go
@z

@x
Available Capabilities:
- Hover: Yes
- Go to Definition: Yes
- Find References: Yes
- Rename: Yes
- Code Actions: Yes
- Formatting: Yes
- Call Hierarchy: Yes
- Type Hierarchy: Yes
...
```
@y
Available Capabilities:
- Hover: Yes
- Go to Definition: Yes
- Find References: Yes
- Rename: Yes
- Code Actions: Yes
- Formatting: Yes
- Call Hierarchy: Yes
- Type Hierarchy: Yes
...
```
@z

@x
## Auto-Restart and Lifecycle
@y
## Auto-Restart and Lifecycle
@z

@x
LSP toolsets are managed by the same supervisor as MCP toolsets, so a crashed `gopls` (or any other language server) is reconnected automatically with exponential backoff. Use the [`lifecycle`](../../configuration/tools/index.md#toolset-lifecycle) block to tune the policy per toolset — for example, mark `gopls` as `strict` if your CI flow requires it to be available, or use `/toolset-restart gopls` from the TUI to force a reconnect when the server gets stuck.
@y
LSP toolsets are managed by the same supervisor as MCP toolsets, so a crashed `gopls` (or any other language server) is reconnected automatically with exponential backoff. Use the [`lifecycle`](../../configuration/tools/index.md#toolset-lifecycle) block to tune the policy per toolset — for example, mark `gopls` as `strict` if your CI flow requires it to be available, or use `/toolset-restart gopls` from the TUI to force a reconnect when the server gets stuck.
@z

@x
```yaml
toolsets:
  - type: lsp
    command: gopls
    file_types: [".go"]
    lifecycle:
      profile: resilient # default: auto-restart on crash with exponential backoff
```
@y
```yaml
toolsets:
  - type: lsp
    command: gopls
    file_types: [".go"]
    lifecycle:
      profile: resilient # default: auto-restart on crash with exponential backoff
```
@z

@x
## Position Format
@y
## Position Format
@z

@x
All LSP tools use **1-based** line and character positions:
@y
All LSP tools use **1-based** line and character positions:
@z

@x
- Line 1 is the first line of the file
- Character 1 is the first character on a line
@y
- Line 1 is the first line of the file
- Character 1 is the first character on a line
@z

@x
```json
{
  "file": "/path/to/file.go",
  "line": 42,
  "character": 15
}
```
@y
```json
{
  "file": "/path/to/file.go",
  "line": 42,
  "character": 15
}
```
@z

@x
> [!TIP]
> **Auto-Installation**
>
> Docker Agent can automatically download and install LSP servers if they are not found in your PATH. Use the `version` property to specify a package, or let Docker Agent auto-detect it from the command name. See [Auto-Installing Tools](../../configuration/tools/index.md#auto-installing-tools) for details.
@y
> [!TIP]
> **Auto-Installation**
>
> Docker Agent can automatically download and install LSP servers if they are not found in your PATH. Use the `version` property to specify a package, or let Docker Agent auto-detect it from the command name. See [Auto-Installing Tools](../../configuration/tools/index.md#auto-installing-tools) for details.
@z
