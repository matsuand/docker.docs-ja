%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md ƒŠƒ“ƒN‚Ö‚Ì (no slash) ‘Î‰ž

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
  configured in the [Docker MCP gateway](/manuals/ai/mcp-gateway/_index.md).
- works in its own context. They do not share knowledge.
@y
cagent relies on the concept of a _root agent_ that acts as a team lead and
delegates tasks to the sub-agents you define.
Each agent:
- uses the model of your choice, with the parameters of your choice.
- has access to the [built-in tools](#built-in-tools) and MCP servers
  configured in the [Docker MCP gateway](manuals/ai/mcp-gateway/_index.md).
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
1. Download the [latest release](https://github.com/docker/cagent/releases)
   for your operating system.
@y
1. Download the [latest release](https://github.com/docker/cagent/releases)
   for your operating system.
@z

@x
   > [!NOTE]
   > You might need to give the binary executable permissions.
   > On macOS and Linux, run:
@y
   > [!NOTE]
   > You might need to give the binary executable permissions.
   > On macOS and Linux, run:
@z

@x
     ```console
     chmod +x /path/to/downloads/cagent-linux-<arm/amd>64
     ```
@y
     ```console
     chmod +x /path/to/downloads/cagent-linux-<arm/amd>64
     ```
@z

@x
   > [!NOTE]
   > You can also build cagent from the source. See the [repository](https://github.com/docker/cagent?tab=readme-ov-file#build-from-source).
@y
   > [!NOTE]
   > You can also build cagent from the source. See the [repository](https://github.com/docker/cagent?tab=readme-ov-file#build-from-source).
@z

@x
1. Optional: Rename the binary as needed and update your PATH to include
   cagent's executable.
@y
1. Optional: Rename the binary as needed and update your PATH to include
   cagent's executable.
@z

@x
1. Set the following environment variables:
@y
1. Set the following environment variables:
@z

@x
   ```bash
   # If using the Docker AI Gateway, set this environment variable or use
   # the `--models-gateway <url_to_docker_ai_gateway>` CLI flag
@y
   ```bash
   # If using the Docker AI Gateway, set this environment variable or use
   # the `--models-gateway <url_to_docker_ai_gateway>` CLI flag
@z

@x
   export CAGENT_MODELS_GATEWAY=<url_to_docker_ai_gateway>
@y
   export CAGENT_MODELS_GATEWAY=<url_to_docker_ai_gateway>
@z

@x
   # Alternatively, set keys for remote inference services.
   # These are not needed if you are using Docker AI Gateway.
@y
   # Alternatively, set keys for remote inference services.
   # These are not needed if you are using Docker AI Gateway.
@z

@x
   export OPENAI_API_KEY=<your_api_key_here>    # For OpenAI models
   export ANTHROPIC_API_KEY=<your_api_key_here> # For Anthropic models
   export GOOGLE_API_KEY=<your_api_key_here>    # For Gemini models
   ```
@y
   export OPENAI_API_KEY=<your_api_key_here>    # For OpenAI models
   export ANTHROPIC_API_KEY=<your_api_key_here> # For Anthropic models
   export GOOGLE_API_KEY=<your_api_key_here>    # For Gemini models
   ```
@z

@x
1. Create an agent by saving this sample as `assistant.yaml`:
@y
1. Create an agent by saving this sample as `assistant.yaml`:
@z

@x
   ```yaml {title="assistant.yaml"}
   agents:
     root:
       model: openai/gpt-5-mini
       description: A helpful AI assistant
       instruction: |
         You are a knowledgeable assistant that helps users with various tasks.
         Be helpful, accurate, and concise in your responses.
   ```
@y
   ```yaml {title="assistant.yaml"}
   agents:
     root:
       model: openai/gpt-5-mini
       description: A helpful AI assistant
       instruction: |
         You are a knowledgeable assistant that helps users with various tasks.
         Be helpful, accurate, and concise in your responses.
   ```
@z

@x
1. Start your prompt with your agent:
@y
1. Start your prompt with your agent:
@z

@x
   ```bash
   cagent run assistant.yaml
   ```
@y
   ```bash
   cagent run assistant.yaml
   ```
@z

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

@x
```console
$ cagent new
@y
```console
$ cagent new
@z

@x
For any feedback, visit: https://docker.qualtrics.com/jfe/form/SV_cNsCIg92nQemlfw
@y
For any feedback, visit: https://docker.qualtrics.com/jfe/form/SV_cNsCIg92nQemlfw
@z

@x
Welcome to cagent! (Ctrl+C to exit)
@y
Welcome to cagent! (Ctrl+C to exit)
@z

@x
What should your agent/agent team do? (describe its purpose):
@y
What should your agent/agent team do? (describe its purpose):
@z

@x
> I need a cross-functional feature team. The team owns a specific product
  feature end-to-end. Include the key responsibilities of each of the roles
  involved (engineers, designer, product manager, QA). Keep the description
  short, clear, and focused on how this team delivers value to users and the business.
```
@y
> I need a cross-functional feature team. The team owns a specific product
  feature end-to-end. Include the key responsibilities of each of the roles
  involved (engineers, designer, product manager, QA). Keep the description
  short, clear, and focused on how this team delivers value to users and the business.
```
@z

@x
Alternatively, you can write your configuration file manually. For example:
@y
Alternatively, you can write your configuration file manually. For example:
@z

@x
```yaml {title="agentic-team.yaml"}
agents:
  root:
    model: claude
    description: "Main coordinator agent that delegates tasks and manages workflow"
    instruction: |
      You are the root coordinator agent. Your job is to:
      1. Understand user requests and break them down into manageable tasks.
      2. Delegate appropriate tasks to your helper agent.
      3. Coordinate responses and ensure tasks are completed properly.
      4. Provide final responses to the user.
      When you receive a request, analyze what needs to be done and decide whether to:
      - Handle it yourself if it's simple.
      - Delegate to the helper agent if it requires specific assistance.
      - Break complex requests into multiple sub-tasks.
    sub_agents: ["helper"]
@y
```yaml {title="agentic-team.yaml"}
agents:
  root:
    model: claude
    description: "Main coordinator agent that delegates tasks and manages workflow"
    instruction: |
      You are the root coordinator agent. Your job is to:
      1. Understand user requests and break them down into manageable tasks.
      2. Delegate appropriate tasks to your helper agent.
      3. Coordinate responses and ensure tasks are completed properly.
      4. Provide final responses to the user.
      When you receive a request, analyze what needs to be done and decide whether to:
      - Handle it yourself if it's simple.
      - Delegate to the helper agent if it requires specific assistance.
      - Break complex requests into multiple sub-tasks.
    sub_agents: ["helper"]
@z

@x
  helper:
    model: claude
    description: "Assistant agent that helps with various tasks as directed by the root agent"
    instruction: |
      You are a helpful assistant agent. Your role is to:
      1. Complete specific tasks assigned by the root agent.
      2. Provide detailed and accurate responses.
      3. Ask for clarification if tasks are unclear.
      4. Report back to the root agent with your results.
@y
  helper:
    model: claude
    description: "Assistant agent that helps with various tasks as directed by the root agent"
    instruction: |
      You are a helpful assistant agent. Your role is to:
      1. Complete specific tasks assigned by the root agent.
      2. Provide detailed and accurate responses.
      3. Ask for clarification if tasks are unclear.
      4. Report back to the root agent with your results.
@z

@x
      Focus on being thorough and helpful in whatever task you're given.
@y
      Focus on being thorough and helpful in whatever task you're given.
@z

@x
models:
  claude:
    provider: anthropic
    model: claude-sonnet-4-0
    max_tokens: 64000
```
@y
models:
  claude:
    provider: anthropic
    model: claude-sonnet-4-0
    max_tokens: 64000
```
@z

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

@x
```yaml
agents:
  root:
    # ... other config
    toolsets:
      - type: todo
      - type: transfer_task
```
@y
```yaml
agents:
  root:
    # ... other config
    toolsets:
      - type: todo
      - type: transfer_task
```
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

@x
```yaml
agents:
  root:
    # ... other config
    toolsets:
      - type: think
```
@y
```yaml
agents:
  root:
    # ... other config
    toolsets:
      - type: think
```
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

@x
```yaml
agents:
  root:
    # ... other config
    toolsets:
      - type: todo
```
@y
```yaml
agents:
  root:
    # ... other config
    toolsets:
      - type: todo
```
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

@x
```yaml
agents:
  root:
    # ... other config
    toolsets:
      - type: memory
        path: "./agent_memory.db"
```
@y
```yaml
agents:
  root:
    # ... other config
    toolsets:
      - type: memory
        path: "./agent_memory.db"
```
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
If you use the [Docker MCP gateway](/manuals/ai/mcp-gateway.md),
you can configure your agent to interact with the
gateway and use the MCP servers configured in it. See [docker mcp
gateway run](/reference/cli/docker/mcp/gateway/gateway_run.md).
@y
If you use the [Docker MCP gateway](manuals/ai/mcp-gateway.md),
you can configure your agent to interact with the
gateway and use the MCP servers configured in it. See [docker mcp
gateway run](reference/cli/docker/mcp/gateway/gateway_run.md).
@z

@x
For example, to enable an agent to use Duckduckgo via the MCP Gateway:
@y
For example, to enable an agent to use Duckduckgo via the MCP Gateway:
@z

@x
```yaml
toolsets:
  - type: mcp
    command: docker
    args: ["mcp", "gateway", "run", "--servers=duckduckgo"]
```
@y
```yaml
toolsets:
  - type: mcp
    command: docker
    args: ["mcp", "gateway", "run", "--servers=duckduckgo"]
```
@z

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

@x
```bash
cagent push ./<agent-file>.yaml <namespace>/<reponame>
```
@y
```bash
cagent push ./<agent-file>.yaml <namespace>/<reponame>
```
@z

@x
To pull an agent to the current directory:
@y
To pull an agent to the current directory:
@z

@x
```bash
cagent pull <namespace>/<reponame>
```
@y
```bash
cagent pull <namespace>/<reponame>
```
@z

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
- [Docker MCP Gateway](/manuals/ai/mcp-gateway/_index.md)
@y
- For more information about cagent, see the
[GitHub repository](https://github.com/docker/cagent).
- [Docker MCP Gateway](manuals/ai/mcp-gateway/_index.md)
@z
