%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Docker AI overview
linkTitle: Overview
description: Docker's AI tools help you build, run, and manage AI-powered applications and workflows.
@y
title: Docker AI overview
linkTitle: Overview
description: Docker's AI tools help you build, run, and manage AI-powered applications and workflows.
@z

@x
keywords: docker, ai, gordon, docker agent, sandboxes, agentic platform, model runner, mcp
@y
keywords: docker, ai, gordon, docker agent, sandboxes, agentic platform, model runner, mcp
@z

@x
Docker provides tools for working with AI across your development workflow.
Each tool serves a different purpose.
@y
Docker provides tools for working with AI across your development workflow.
Each tool serves a different purpose.
@z

@x
## Which tool do I need?
@y
## Which tool do I need?
@z

@x
| I want to...                                                    | Use                                                      | Interface        |
| --------------------------------------------------------------- | -------------------------------------------------------- | ---------------- |
| Run coding agents in isolated environments                      | [Docker Sandboxes](./ai/sandboxes/)                      | `sbx`            |
| Run agents in cloud sandboxes through a web Console | [Docker Agentic Platform](./agentic-platform/_index.md) (experimental) | Web Console |
| Get AI help with Docker tasks (containers, images, Dockerfiles) | [Gordon](./ai/gordon/)                                   | `docker ai`      |
| Run AI models locally with an OpenAI-compatible API             | [Model Runner](./ai/model-runner/)                       | `docker model`   |
| Connect AI tools to external services via MCP                   | [MCP Catalog and Toolkit](./ai/mcp-catalog-and-toolkit/) | `docker mcp`     |
| Build and orchestrate custom multi-agent teams                  | [Docker Agent](./ai/docker-agent/)                       | `docker agent`   |
| Give my coding agent Docker best-practice guidance              | [Docker Skills](./ai/skills/)                            | None             |
@y
| I want to...                                                    | Use                                                      | Interface        |
| --------------------------------------------------------------- | -------------------------------------------------------- | ---------------- |
| Run coding agents in isolated environments                      | [Docker Sandboxes](./ai/sandboxes/)                      | `sbx`            |
| Run agents in cloud sandboxes through a web Console | [Docker Agentic Platform](./agentic-platform/_index.md) (experimental) | Web Console |
| Get AI help with Docker tasks (containers, images, Dockerfiles) | [Gordon](./ai/gordon/)                                   | `docker ai`      |
| Run AI models locally with an OpenAI-compatible API             | [Model Runner](./ai/model-runner/)                       | `docker model`   |
| Connect AI tools to external services via MCP                   | [MCP Catalog and Toolkit](./ai/mcp-catalog-and-toolkit/) | `docker mcp`     |
| Build and orchestrate custom multi-agent teams                  | [Docker Agent](./ai/docker-agent/)                       | `docker agent`   |
| Give my coding agent Docker best-practice guidance              | [Docker Skills](./ai/skills/)                            | None             |
@z

@x
## How these tools relate
@y
## How these tools relate
@z

@x
**Gordon** is Docker's built-in AI assistant. It helps with Docker-specific
tasks like debugging containers, writing Dockerfiles, and managing images. You
interact with it through Docker Desktop or the `docker ai` command.
@y
**Gordon** is Docker's built-in AI assistant. It helps with Docker-specific
tasks like debugging containers, writing Dockerfiles, and managing images. You
interact with it through Docker Desktop or the `docker ai` command.
@z

@x
**Docker Agent** is an open-source framework for defining teams of AI agents
in YAML. You configure agents with specific roles, models, and tools, then
run them from your terminal. Docker Agent is a general-purpose agent runtime,
not specific to Docker tasks.
@y
**Docker Agent** is an open-source framework for defining teams of AI agents
in YAML. You configure agents with specific roles, models, and tools, then
run them from your terminal. Docker Agent is a general-purpose agent runtime,
not specific to Docker tasks.
@z

@x
**Docker Skills** are Docker's official, open-source instructions for compatible
coding agents working on Docker tasks. Install them through your agent's
supported method; they can also be used by Docker Agent and agents running in
Docker Sandboxes. Browse the [Docker Skills
catalog](https://github.com/docker/skills#readme) for current guidance.
@y
**Docker Skills** are Docker's official, open-source instructions for compatible
coding agents working on Docker tasks. Install them through your agent's
supported method; they can also be used by Docker Agent and agents running in
Docker Sandboxes. Browse the [Docker Skills
catalog](https://github.com/docker/skills#readme) for current guidance.
@z

@x
Docker Sandboxes provides isolated environments for running coding agents
[locally](./ai/sandboxes/get-started.md) or
[in the cloud](./ai/sandboxes/cloud/_index.md). Sandboxes is the isolation layer;
the agents themselves are separate tools. Agent configuration and supported
features differ between local and cloud sandboxes.
@y
Docker Sandboxes provides isolated environments for running coding agents
[locally](./ai/sandboxes/get-started.md) or
[in the cloud](./ai/sandboxes/cloud/_index.md). Sandboxes is the isolation layer;
the agents themselves are separate tools. Agent configuration and supported
features differ between local and cloud sandboxes.
@z

@x
Docker Agentic Platform is an experimental service for running agents in
Docker-managed cloud sandboxes. Its web Console provides kit selection,
credentials, network policies, MCP tools, and sandbox lifecycle controls.
[Activate a subscription](./agentic-platform/signup.md) to use cloud compute,
billed on a pay-as-you-go basis.
@y
Docker Agentic Platform is an experimental service for running agents in
Docker-managed cloud sandboxes. Its web Console provides kit selection,
credentials, network policies, MCP tools, and sandbox lifecycle controls.
[Activate a subscription](./agentic-platform/signup.md) to use cloud compute,
billed on a pay-as-you-go basis.
@z

@x
**Model Runner** lets you run LLMs locally. Other tools like Docker Agent can
use Model Runner as a model provider.
@y
**Model Runner** lets you run LLMs locally. Other tools like Docker Agent can
use Model Runner as a model provider.
@z

@x
**MCP Catalog and Toolkit** manages connections between AI tools and external
services using the Model Context Protocol. Gordon, Docker Agent, and
third-party tools can all use MCP servers configured through the Toolkit.
@y
**MCP Catalog and Toolkit** manages connections between AI tools and external
services using the Model Context Protocol. Gordon, Docker Agent, and
third-party tools can all use MCP servers configured through the Toolkit.
@z
