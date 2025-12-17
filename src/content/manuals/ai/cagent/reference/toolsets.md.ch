%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Toolsets reference
linkTitle: Toolsets
description: Complete reference for cagent toolsets and their capabilities
keywords: [ai, agent, cagent, tools, toolsets]
@y
title: Toolsets reference
linkTitle: Toolsets
description: Complete reference for cagent toolsets and their capabilities
keywords: [ai, agent, cagent, tools, toolsets]
@z

@x
This reference documents the toolsets available in cagent and what each one
does. Tools give agents the ability to take action—interacting with files,
executing commands, accessing external resources, and managing state.
@y
This reference documents the toolsets available in cagent and what each one
does. Tools give agents the ability to take action—interacting with files,
executing commands, accessing external resources, and managing state.
@z

@x
For configuration file syntax and how to set up toolsets in your agent YAML,
see the [Configuration file reference](./config.md).
@y
For configuration file syntax and how to set up toolsets in your agent YAML,
see the [Configuration file reference](./config.md).
@z

@x
## How agents use tools
@y
## How agents use tools
@z

@x
When you configure toolsets for an agent, those tools become available in the
agent's context. The agent can invoke tools by name with appropriate parameters
based on the task at hand.
@y
When you configure toolsets for an agent, those tools become available in the
agent's context. The agent can invoke tools by name with appropriate parameters
based on the task at hand.
@z

@x
Tool invocation flow:
@y
Tool invocation flow:
@z

@x
1. Agent analyzes the task and determines which tool to use
2. Agent constructs tool parameters based on requirements
3. cagent executes the tool and returns results
4. Agent processes results and decides next steps
@y
1. Agent analyzes the task and determines which tool to use
2. Agent constructs tool parameters based on requirements
3. cagent executes the tool and returns results
4. Agent processes results and decides next steps
@z

@x
Agents can call multiple tools in sequence or make decisions based on tool
results. Tool selection is automatic based on the agent's understanding of the
task and available capabilities.
@y
Agents can call multiple tools in sequence or make decisions based on tool
results. Tool selection is automatic based on the agent's understanding of the
task and available capabilities.
@z

@x
## Tool types
@y
## Tool types
@z

@x
cagent supports three types of toolsets:
@y
cagent supports three types of toolsets:
@z

@x
Built-in toolsets
: Core functionality built directly into cagent (`filesystem`, `shell`,
`memory`, etc.). These provide essential capabilities for file operations,
command execution, and state management.
MCP toolsets
: Tools provided by Model Context Protocol servers, either local processes
(stdio) or remote servers (HTTP/SSE). MCP enables access to a wide ecosystem
of standardized tools.
Custom toolsets
: Shell scripts wrapped as tools with typed parameters (`script_shell`). This
lets you define domain-specific tools for your use case.
@y
Built-in toolsets
: Core functionality built directly into cagent (`filesystem`, `shell`,
`memory`, etc.). These provide essential capabilities for file operations,
command execution, and state management.
MCP toolsets
: Tools provided by Model Context Protocol servers, either local processes
(stdio) or remote servers (HTTP/SSE). MCP enables access to a wide ecosystem
of standardized tools.
Custom toolsets
: Shell scripts wrapped as tools with typed parameters (`script_shell`). This
lets you define domain-specific tools for your use case.
@z

@x
## Configuration
@y
## Configuration
@z

@x
Toolsets are configured in your agent's YAML file under the `toolsets` array:
@y
Toolsets are configured in your agent's YAML file under the `toolsets` array:
@z

@x
```yaml
agents:
  my_agent:
    model: anthropic/claude-sonnet-4-5
    description: A helpful coding assistant
    toolsets:
      # Built-in toolset
      - type: filesystem
@y
```yaml
agents:
  my_agent:
    model: anthropic/claude-sonnet-4-5
    description: A helpful coding assistant
    toolsets:
      # Built-in toolset
      - type: filesystem
@z

@x
      # Built-in toolset with configuration
      - type: memory
        path: ./memories.db
@y
      # Built-in toolset with configuration
      - type: memory
        path: ./memories.db
@z

@x
      # Local MCP server (stdio)
      - type: mcp
        command: npx
        args: ["-y", "@modelcontextprotocol/server-filesystem", "/path/to/dir"]
@y
      # Local MCP server (stdio)
      - type: mcp
        command: npx
        args: ["-y", "@modelcontextprotocol/server-filesystem", "/path/to/dir"]
@z

@x
      # Remote MCP server (SSE)
      - type: mcp
        remote:
          url: https://mcp.example.com/sse
          transport_type: sse
          headers:
            Authorization: Bearer ${API_TOKEN}
@y
      # Remote MCP server (SSE)
      - type: mcp
        remote:
          url: https://mcp.example.com/sse
          transport_type: sse
          headers:
            Authorization: Bearer ${API_TOKEN}
@z

@x
      # Custom shell tools
      - type: script_shell
        tools:
          build:
            cmd: npm run build
            description: Build the project
```
@y
      # Custom shell tools
      - type: script_shell
        tools:
          build:
            cmd: npm run build
            description: Build the project
```
@z

@x
### Common configuration options
@y
### Common configuration options
@z

@x
All toolset types support these optional properties:
@y
All toolset types support these optional properties:
@z

@x
| Property      | Type             | Description                                                                                                                                                                                                                         |
| ------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `instruction` | string           | Additional instructions for using the toolset                                                                                                                                                                                       |
| `tools`       | array            | Specific tool names to enable (defaults to all)                                                                                                                                                                                     |
| `env`         | object           | Environment variables for the toolset                                                                                                                                                                                               |
| `toon`        | string           | Comma-delimited regex patterns matching tool names whose JSON outputs should be compressed. Reduces token usage by simplifying/compressing JSON responses from matched tools using automatic encoding. Example: `"search.*,list.*"` |
| `defer`       | boolean or array | Control which tools load into initial context. Set to `true` to defer all tools, or array of tool names to defer specific tools. Deferred tools don't consume context until explicitly loaded via `search_tool`/`add_tool`.         |
@y
| Property      | Type             | Description                                                                                                                                                                                                                         |
| ------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `instruction` | string           | Additional instructions for using the toolset                                                                                                                                                                                       |
| `tools`       | array            | Specific tool names to enable (defaults to all)                                                                                                                                                                                     |
| `env`         | object           | Environment variables for the toolset                                                                                                                                                                                               |
| `toon`        | string           | Comma-delimited regex patterns matching tool names whose JSON outputs should be compressed. Reduces token usage by simplifying/compressing JSON responses from matched tools using automatic encoding. Example: `"search.*,list.*"` |
| `defer`       | boolean or array | Control which tools load into initial context. Set to `true` to defer all tools, or array of tool names to defer specific tools. Deferred tools don't consume context until explicitly loaded via `search_tool`/`add_tool`.         |
@z

@x
### Tool selection
@y
### Tool selection
@z

@x
By default, agents have access to all tools from their configured toolsets. You
can restrict this using the `tools` option:
@y
By default, agents have access to all tools from their configured toolsets. You
can restrict this using the `tools` option:
@z

@x
```yaml
toolsets:
  - type: filesystem
    tools: [read_file, write_file, list_directory]
```
@y
```yaml
toolsets:
  - type: filesystem
    tools: [read_file, write_file, list_directory]
```
@z

@x
This is useful for:
@y
This is useful for:
@z

@x
- Limiting agent capabilities for security
- Reducing context size for smaller models
- Creating specialized agents with focused tool access
@y
- Limiting agent capabilities for security
- Reducing context size for smaller models
- Creating specialized agents with focused tool access
@z

@x
### Deferred loading
@y
### Deferred loading
@z

@x
Deferred loading keeps tools out of the initial context window, loading them
only when explicitly requested. This is useful for large toolsets where most
tools won't be used, significantly reducing context consumption.
@y
Deferred loading keeps tools out of the initial context window, loading them
only when explicitly requested. This is useful for large toolsets where most
tools won't be used, significantly reducing context consumption.
@z

@x
Defer all tools in a toolset:
@y
Defer all tools in a toolset:
@z

@x
```yaml
toolsets:
  - type: mcp
    command: npx
    args: ["-y", "@modelcontextprotocol/server-filesystem", "/path"]
    defer: true # All tools load on-demand
```
@y
```yaml
toolsets:
  - type: mcp
    command: npx
    args: ["-y", "@modelcontextprotocol/server-filesystem", "/path"]
    defer: true # All tools load on-demand
```
@z

@x
Or defer specific tools while loading others immediately:
@y
Or defer specific tools while loading others immediately:
@z

@x
```yaml
toolsets:
  - type: mcp
    command: npx
    args: ["-y", "@modelcontextprotocol/server-filesystem", "/path"]
    defer: [search_files, list_directory] # Only these are deferred
```
@y
```yaml
toolsets:
  - type: mcp
    command: npx
    args: ["-y", "@modelcontextprotocol/server-filesystem", "/path"]
    defer: [search_files, list_directory] # Only these are deferred
```
@z

@x
Agents can discover deferred tools via `search_tool` and load them into context
via `add_tool` when needed. Best for toolsets with dozens of tools where only a
few are typically used.
@y
Agents can discover deferred tools via `search_tool` and load them into context
via `add_tool` when needed. Best for toolsets with dozens of tools where only a
few are typically used.
@z

@x
### Output compression
@y
### Output compression
@z

@x
The `toon` property compresses JSON outputs from matched tools to reduce token
usage. When a tool's output is JSON, it's automatically compressed using
efficient encoding before being returned to the agent:
@y
The `toon` property compresses JSON outputs from matched tools to reduce token
usage. When a tool's output is JSON, it's automatically compressed using
efficient encoding before being returned to the agent:
@z

@x
```yaml
toolsets:
  - type: mcp
    command: npx
    args: ["-y", "@modelcontextprotocol/server-github"]
    toon: "search.*,list.*" # Compress outputs from search/list tools
```
@y
```yaml
toolsets:
  - type: mcp
    command: npx
    args: ["-y", "@modelcontextprotocol/server-github"]
    toon: "search.*,list.*" # Compress outputs from search/list tools
```
@z

@x
Useful for tools that return large JSON responses (API results, file listings,
search results). The compression is transparent to the agent but can
significantly reduce context consumption for verbose tool outputs.
@y
Useful for tools that return large JSON responses (API results, file listings,
search results). The compression is transparent to the agent but can
significantly reduce context consumption for verbose tool outputs.
@z

@x
### Per-agent tool configuration
@y
### Per-agent tool configuration
@z

@x
Different agents can have different toolsets:
@y
Different agents can have different toolsets:
@z

@x
```yaml
agents:
  coordinator:
    model: anthropic/claude-sonnet-4-5
    sub_agents: [code_writer, code_reviewer]
    toolsets:
      - type: filesystem
        tools: [read_file]
@y
```yaml
agents:
  coordinator:
    model: anthropic/claude-sonnet-4-5
    sub_agents: [code_writer, code_reviewer]
    toolsets:
      - type: filesystem
        tools: [read_file]
@z

@x
  code_writer:
    model: openai/gpt-5-mini
    toolsets:
      - type: filesystem
      - type: shell
@y
  code_writer:
    model: openai/gpt-5-mini
    toolsets:
      - type: filesystem
      - type: shell
@z

@x
  code_reviewer:
    model: anthropic/claude-sonnet-4-5
    toolsets:
      - type: filesystem
        tools: [read_file, read_multiple_files]
```
@y
  code_reviewer:
    model: anthropic/claude-sonnet-4-5
    toolsets:
      - type: filesystem
        tools: [read_file, read_multiple_files]
```
@z

@x
This allows specialized agents with focused capabilities, security boundaries,
and optimized performance.
@y
This allows specialized agents with focused capabilities, security boundaries,
and optimized performance.
@z

@x
## Built-in tools reference
@y
## Built-in tools reference
@z

@x
### Filesystem
@y
### Filesystem
@z

@x
The `filesystem` toolset gives your agent the ability to work with
files and directories. Your agent can read files to understand
context, write new files, make targeted edits to existing files,
search for content, and explore directory structures. Essential for
code analysis, documentation updates, configuration management, and
any agent that needs to understand or modify project files.
@y
The `filesystem` toolset gives your agent the ability to work with
files and directories. Your agent can read files to understand
context, write new files, make targeted edits to existing files,
search for content, and explore directory structures. Essential for
code analysis, documentation updates, configuration management, and
any agent that needs to understand or modify project files.
@z

@x
Access is restricted to the current working directory by default. Agents can
request access to additional directories at runtime, which requires your
approval.
@y
Access is restricted to the current working directory by default. Agents can
request access to additional directories at runtime, which requires your
approval.
@z

@x
#### Configuration
@y
#### Configuration
@z

@x
```yaml
toolsets:
  - type: filesystem
@y
```yaml
toolsets:
  - type: filesystem
@z

@x
  # Optional: restrict to specific tools
  - type: filesystem
    tools: [read_file, write_file, edit_file]
```
@y
  # Optional: restrict to specific tools
  - type: filesystem
    tools: [read_file, write_file, edit_file]
```
@z

@x
### Shell
@y
### Shell
@z

@x
The `shell` toolset lets your agent execute commands in your system's shell
environment. Use this for agents that need to run builds, execute tests, manage
processes, interact with CLI tools, or perform system operations. The agent can
run commands in the foreground or background.
@y
The `shell` toolset lets your agent execute commands in your system's shell
environment. Use this for agents that need to run builds, execute tests, manage
processes, interact with CLI tools, or perform system operations. The agent can
run commands in the foreground or background.
@z

@x
Commands execute in the current working directory and inherit environment
variables from the cagent process. This toolset is powerful but should be used
with appropriate security considerations.
@y
Commands execute in the current working directory and inherit environment
variables from the cagent process. This toolset is powerful but should be used
with appropriate security considerations.
@z

@x
#### Configuration
@y
#### Configuration
@z

@x
```yaml
toolsets:
  - type: shell
```
@y
```yaml
toolsets:
  - type: shell
```
@z

@x
### Think
@y
### Think
@z

@x
The `think` toolset provides your agent with a reasoning scratchpad. The agent
can record thoughts and reasoning steps without taking actions or modifying
data. Particularly useful for complex tasks where the agent needs to plan
multiple steps, verify requirements, or maintain context across a long
conversation.
@y
The `think` toolset provides your agent with a reasoning scratchpad. The agent
can record thoughts and reasoning steps without taking actions or modifying
data. Particularly useful for complex tasks where the agent needs to plan
multiple steps, verify requirements, or maintain context across a long
conversation.
@z

@x
Agents use this to break down problems, list applicable rules, verify they have
all needed information, and document their reasoning process before acting.
@y
Agents use this to break down problems, list applicable rules, verify they have
all needed information, and document their reasoning process before acting.
@z

@x
#### Configuration
@y
#### Configuration
@z

@x
```yaml
toolsets:
  - type: think
```
@y
```yaml
toolsets:
  - type: think
```
@z

@x
### Todo
@y
### Todo
@z

@x
The `todo` toolset gives your agent task-tracking capabilities for managing
multi-step operations. Your agent can break down complex work into discrete
tasks, track progress through each step, and ensure nothing is missed before
completing a request. Especially valuable for agents handling complex
workflows with multiple dependencies.
@y
The `todo` toolset gives your agent task-tracking capabilities for managing
multi-step operations. Your agent can break down complex work into discrete
tasks, track progress through each step, and ensure nothing is missed before
completing a request. Especially valuable for agents handling complex
workflows with multiple dependencies.
@z

@x
The `shared` option allows todos to persist across different agents in a
multi-agent system, enabling coordination.
@y
The `shared` option allows todos to persist across different agents in a
multi-agent system, enabling coordination.
@z

@x
#### Configuration
@y
#### Configuration
@z

@x
```yaml
toolsets:
  - type: todo
@y
```yaml
toolsets:
  - type: todo
@z

@x
  # Optional: share todos across agents
  - type: todo
    shared: true
```
@y
  # Optional: share todos across agents
  - type: todo
    shared: true
```
@z

@x
### Memory
@y
### Memory
@z

@x
The `memory` toolset allows your agent to store and retrieve information across
conversations and sessions. Your agent can remember user preferences, project
context, previous decisions, and other information that should persist. Useful
for agents that interact with users over time or need to maintain state about
a project or environment.
@y
The `memory` toolset allows your agent to store and retrieve information across
conversations and sessions. Your agent can remember user preferences, project
context, previous decisions, and other information that should persist. Useful
for agents that interact with users over time or need to maintain state about
a project or environment.
@z

@x
Memories are stored in a local database file and persist across cagent
sessions.
@y
Memories are stored in a local database file and persist across cagent
sessions.
@z

@x
#### Configuration
@y
#### Configuration
@z

@x
```yaml
toolsets:
  - type: memory
@y
```yaml
toolsets:
  - type: memory
@z

@x
  # Optional: specify database location
  - type: memory
    path: ./agent-memories.db
```
@y
  # Optional: specify database location
  - type: memory
    path: ./agent-memories.db
```
@z

@x
### Fetch
@y
### Fetch
@z

@x
The `fetch` toolset enables your agent to retrieve content from HTTP/HTTPS URLs.
Your agent can fetch documentation, API responses, web pages, or any content
accessible via HTTP GET requests. Useful for agents that need to access
external resources, check API documentation, or retrieve web content.
@y
The `fetch` toolset enables your agent to retrieve content from HTTP/HTTPS URLs.
Your agent can fetch documentation, API responses, web pages, or any content
accessible via HTTP GET requests. Useful for agents that need to access
external resources, check API documentation, or retrieve web content.
@z

@x
The agent can specify custom HTTP headers when needed for authentication or
other purposes.
@y
The agent can specify custom HTTP headers when needed for authentication or
other purposes.
@z

@x
#### Configuration
@y
#### Configuration
@z

@x
```yaml
toolsets:
  - type: fetch
```
@y
```yaml
toolsets:
  - type: fetch
```
@z

@x
### API
@y
### API
@z

@x
The `api` toolset lets you define custom tools that call HTTP APIs. Similar to
`script_shell` but for web services, this allows you to expose REST APIs,
webhooks, or any HTTP endpoint as a tool your agent can use. The agent sees
these as typed tools with automatic parameter validation.
@y
The `api` toolset lets you define custom tools that call HTTP APIs. Similar to
`script_shell` but for web services, this allows you to expose REST APIs,
webhooks, or any HTTP endpoint as a tool your agent can use. The agent sees
these as typed tools with automatic parameter validation.
@z

@x
Use this to integrate with external services, call internal APIs, trigger
webhooks, or interact with any HTTP-based system.
@y
Use this to integrate with external services, call internal APIs, trigger
webhooks, or interact with any HTTP-based system.
@z

@x
#### Configuration
@y
#### Configuration
@z

@x
Each API tool is defined with an `api_config` containing the endpoint, HTTP method, and optional typed parameters:
@y
Each API tool is defined with an `api_config` containing the endpoint, HTTP method, and optional typed parameters:
@z

@x
```yaml
toolsets:
  - type: api
    api_config:
      name: search_docs
      endpoint: https://api.example.com/search
      method: GET
      instruction: Search the documentation database
      headers:
        Authorization: Bearer ${API_TOKEN}
      args:
        query:
          type: string
          description: Search query
        limit:
          type: number
          description: Maximum results
      required: [query]
@y
```yaml
toolsets:
  - type: api
    api_config:
      name: search_docs
      endpoint: https://api.example.com/search
      method: GET
      instruction: Search the documentation database
      headers:
        Authorization: Bearer ${API_TOKEN}
      args:
        query:
          type: string
          description: Search query
        limit:
          type: number
          description: Maximum results
      required: [query]
@z

@x
  - type: api
    api_config:
      name: create_ticket
      endpoint: https://api.example.com/tickets
      method: POST
      instruction: Create a support ticket
      args:
        title:
          type: string
          description: Ticket title
        description:
          type: string
          description: Ticket description
      required: [title, description]
```
@y
  - type: api
    api_config:
      name: create_ticket
      endpoint: https://api.example.com/tickets
      method: POST
      instruction: Create a support ticket
      args:
        title:
          type: string
          description: Ticket title
        description:
          type: string
          description: Ticket description
      required: [title, description]
```
@z

@x
For GET requests, parameters are interpolated into the endpoint URL. For POST
requests, parameters are sent as JSON in the request body.
@y
For GET requests, parameters are interpolated into the endpoint URL. For POST
requests, parameters are sent as JSON in the request body.
@z

@x
Supported argument types: `string`, `number`, `boolean`, `array`, `object`.
@y
Supported argument types: `string`, `number`, `boolean`, `array`, `object`.
@z

@x
### Script Shell
@y
### Script Shell
@z

@x
The `script_shell` toolset lets you define custom tools by wrapping shell
commands with typed parameters. This allows you to expose domain-specific
operations to your agent as first-class tools. The agent sees these custom
tools just like built-in tools, with parameter validation and type checking
handled automatically.
@y
The `script_shell` toolset lets you define custom tools by wrapping shell
commands with typed parameters. This allows you to expose domain-specific
operations to your agent as first-class tools. The agent sees these custom
tools just like built-in tools, with parameter validation and type checking
handled automatically.
@z

@x
Use this to create tools for deployment scripts, build commands, test runners,
or any operation specific to your project or workflow.
@y
Use this to create tools for deployment scripts, build commands, test runners,
or any operation specific to your project or workflow.
@z

@x
#### Configuration
@y
#### Configuration
@z

@x
Each custom tool is defined with a command, description, and optional typed
parameters:
@y
Each custom tool is defined with a command, description, and optional typed
parameters:
@z

@x
```yaml
toolsets:
  - type: script_shell
    tools:
      deploy:
        cmd: ./deploy.sh
        description: Deploy the application to an environment
        args:
          environment:
            type: string
            description: Target environment (dev, staging, prod)
          version:
            type: string
            description: Version to deploy
        required: [environment]
@y
```yaml
toolsets:
  - type: script_shell
    tools:
      deploy:
        cmd: ./deploy.sh
        description: Deploy the application to an environment
        args:
          environment:
            type: string
            description: Target environment (dev, staging, prod)
          version:
            type: string
            description: Version to deploy
        required: [environment]
@z

@x
      run_tests:
        cmd: npm test
        description: Run the test suite
        args:
          filter:
            type: string
            description: Test name filter pattern
```
@y
      run_tests:
        cmd: npm test
        description: Run the test suite
        args:
          filter:
            type: string
            description: Test name filter pattern
```
@z

@x
Supported argument types: `string`, `number`, `boolean`, `array`, `object`.
@y
Supported argument types: `string`, `number`, `boolean`, `array`, `object`.
@z

@x
#### Tools
@y
#### Tools
@z

@x
The tools you define become available to your agent. In the previous example,
the agent would have access to `deploy` and `run_tests` tools.
@y
The tools you define become available to your agent. In the previous example,
the agent would have access to `deploy` and `run_tests` tools.
@z

@x
## Automatic tools
@y
## Automatic tools
@z

@x
Some tools are automatically added to agents based on their configuration. You
don't configure these explicitly—they appear when needed.
@y
Some tools are automatically added to agents based on their configuration. You
don't configure these explicitly—they appear when needed.
@z

@x
### transfer_task
@y
### transfer_task
@z

@x
Automatically available when your agent has `sub_agents` configured. Allows
the agent to delegate tasks to sub-agents and receive results back.
@y
Automatically available when your agent has `sub_agents` configured. Allows
the agent to delegate tasks to sub-agents and receive results back.
@z

@x
### handoff
@y
### handoff
@z

@x
Automatically available when your agent has `handoffs` configured. Allows the
agent to transfer the entire conversation to a different agent.
@y
Automatically available when your agent has `handoffs` configured. Allows the
agent to transfer the entire conversation to a different agent.
@z

@x
## What's next
@y
## What's next
@z

@x
- Read the [Configuration file reference](./config.md) for YAML file structure
- Review the [CLI reference](./cli.md) for running agents
- Explore [MCP servers](/manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md) for extended capabilities
- Browse [example configurations](https://github.com/docker/cagent/tree/main/examples)
@y
- Read the [Configuration file reference](./config.md) for YAML file structure
- Review the [CLI reference](./cli.md) for running agents
- Explore [MCP servers](manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md) for extended capabilities
- Browse [example configurations](https://github.com/docker/cagent/tree/main/examples)
@z
