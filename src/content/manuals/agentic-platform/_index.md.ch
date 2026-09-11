%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Docker Agentic Platform
description: Run agents and tools in isolated, hosted sandboxes with Docker Agentic Platform.
keywords: docker agentic platform, agents, sandboxes, mcp, secrets, network policies
@y
title: Docker Agentic Platform
description: Run agents and tools in isolated, hosted sandboxes with Docker Agentic Platform.
keywords: docker agentic platform, agents, sandboxes, mcp, secrets, network policies
@z

@x
      text: Experimental
@y
      text: 試験的
@z

@x
  - title: Get started
    description: Choose an agent environment and start a sandbox.
    icon: rocket-launch
    link: /agentic-platform/get-started/
@y
  - title: Get started
    description: Choose an agent environment and start a sandbox.
    icon: rocket-launch
    link: __SUBDIR__/agentic-platform/get-started/
@z

@x
  - title: Sandboxes
    description: Work with hosted agent environments.
    icon: command-line
    link: /agentic-platform/sandboxes/
@y
  - title: Sandboxes
    description: Work with hosted agent environments.
    icon: command-line
    link: __SUBDIR__/agentic-platform/sandboxes/
@z

@x
  - title: MCP
    description: Connect predefined or custom MCP servers.
    icon: cpu-chip
    link: /agentic-platform/mcp/
@y
  - title: MCP
    description: Connect predefined or custom MCP servers.
    icon: cpu-chip
    link: __SUBDIR__/agentic-platform/mcp/
@z

@x
  - title: Secrets
    description: Manage model provider and service credentials.
    icon: key
    link: /agentic-platform/secrets/
@y
  - title: Secrets
    description: Manage model provider and service credentials.
    icon: key
    link: __SUBDIR__/agentic-platform/secrets/
@z

@x
  - title: Policies
    description: Control outbound network access from sandboxes.
    icon: shield-check
    link: /agentic-platform/policies/
@y
  - title: Policies
    description: Control outbound network access from sandboxes.
    icon: shield-check
    link: __SUBDIR__/agentic-platform/policies/
@z

@x
  - title: FAQ
    description: Review launch scope and product boundaries.
    icon: question-mark-circle
    link: /agentic-platform/faq/
@y
  - title: FAQ
    description: Review launch scope and product boundaries.
    icon: question-mark-circle
    link: __SUBDIR__/agentic-platform/faq/
@z

@x
> [!NOTE]
> Docker Agentic Platform is experimental. Features and behavior may change.
@y
> [!NOTE]
> Docker Agentic Platform is experimental. Features and behavior may change.
@z

@x
Docker Agentic Platform runs agents and agent-powered tools in isolated
sandboxes on Docker-managed cloud infrastructure. An active workload is not
tied to your computer remaining awake or connected. You can leave the Console
and return to the sandbox while the agent continues working.
@y
Docker Agentic Platform runs agents and agent-powered tools in isolated
sandboxes on Docker-managed cloud infrastructure. An active workload is not
tied to your computer remaining awake or connected. You can leave the Console
and return to the sandbox while the agent continues working.
@z

@x
For sandboxes that run on your development machine through the `sbx` CLI, see
[Docker Sandboxes](/manuals/ai/sandboxes/_index.md).
@y
For sandboxes that run on your development machine through the `sbx` CLI, see
[Docker Sandboxes](manuals/ai/sandboxes/_index.md).
@z

@x
From the web Console, choose the type of sandbox to run and configure its model
credential, network access, tools, and compute. Docker creates the sandbox and
opens a live terminal for interacting with the agent. The **Sandboxes** page
provides one place to return to and manage your running and paused workloads.
@y
From the web Console, choose the type of sandbox to run and configure its model
credential, network access, tools, and compute. Docker creates the sandbox and
opens a live terminal for interacting with the agent. The **Sandboxes** page
provides one place to return to and manage your running and paused workloads.
@z

@x
Account-level configuration can be reused across sandboxes:
@y
Account-level configuration can be reused across sandboxes:
@z

@x
- [MCP](/manuals/agentic-platform/mcp.md) connects external tools.
- [Secrets](/manuals/agentic-platform/secrets.md) provide credentials
  without placing their values inside a sandbox.
- [Network policies](/manuals/agentic-platform/policies.md) control
  outbound destinations.
@y
- [MCP](manuals/agentic-platform/mcp.md) connects external tools.
- [Secrets](manuals/agentic-platform/secrets.md) provide credentials
  without placing their values inside a sandbox.
- [Network policies](manuals/agentic-platform/policies.md) control
  outbound destinations.
@z

@x
To begin, open [Docker Agentic Platform](https://agentic-platform.docker.com/)
and sign in with your Docker account. Docker meters sandbox compute per second.
For account and payment information, see [Docker Billing](/subscription-billing/).
@y
To begin, open [Docker Agentic Platform](https://agentic-platform.docker.com/)
and sign in with your Docker account. Docker meters sandbox compute per second.
For account and payment information, see [Docker Billing](__SUBDIR__/subscription-billing/).
@z
