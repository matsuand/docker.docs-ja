%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Docker Agentic Platform
description: Run agents and tools in isolated cloud sandboxes with Docker Agentic Platform.
keywords: docker agentic platform, agents, kits, sandboxes, mcp, secrets, network policies
@y
title: Docker Agentic Platform
description: Run agents and tools in isolated cloud sandboxes with Docker Agentic Platform.
keywords: docker agentic platform, agents, kits, sandboxes, mcp, secrets, network policies
@z

@x
      text: Experimental
@y
      text: 試験的
@z

@x
  - title: Sign up
    description: Activate cloud access and review billing.
    icon: credit-card
    link: /agentic-platform/signup/
@y
  - title: Sign up
    description: Activate cloud access and review billing.
    icon: credit-card
    link: __SUBDIR__/agentic-platform/signup/
@z

@x
  - title: Get started
    description: Start your first sandbox.
    icon: rocket-launch
    link: /agentic-platform/get-started/
@y
  - title: Get started
    description: Start your first sandbox.
    icon: rocket-launch
    link: __SUBDIR__/agentic-platform/get-started/
@z

@x
  - title: Kits
    description: Find a kit or run your own public kit.
    icon: cube
    link: /agentic-platform/kits/
@y
  - title: Kits
    description: Find a kit or run your own public kit.
    icon: cube
    link: __SUBDIR__/agentic-platform/kits/
@z

@x
  - title: Sandboxes
    description: Access, pause, resume, and delete your sandboxes.
    icon: command-line
    link: /agentic-platform/sandboxes/
@y
  - title: Sandboxes
    description: Access, pause, resume, and delete your sandboxes.
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
    description: Find answers about access, billing, and supported features.
    icon: question-mark-circle
    link: /agentic-platform/faq/
@y
  - title: FAQ
    description: Find answers about access, billing, and supported features.
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
Docker Agentic Platform lets you run agents and tools in isolated cloud
sandboxes. Your agent keeps working when you close the Console, disconnect
your computer, or put it to sleep.
@y
Docker Agentic Platform lets you run agents and tools in isolated cloud
sandboxes. Your agent keeps working when you close the Console, disconnect
your computer, or put it to sleep.
@z

@x
The `sbx` CLI supports both
[local sandboxes](/manuals/ai/sandboxes/get-started.md) and
[cloud sandboxes](/manuals/ai/sandboxes/cloud/_index.md). These pages describe
the web Console experience. The Console and CLI use different secret names;
see [Cloud credentials](/manuals/ai/sandboxes/cloud/credentials.md).
@y
The `sbx` CLI supports both
[local sandboxes](manuals/ai/sandboxes/get-started.md) and
[cloud sandboxes](manuals/ai/sandboxes/cloud/_index.md). These pages describe
the web Console experience. The Console and CLI use different secret names;
see [Cloud credentials](manuals/ai/sandboxes/cloud/credentials.md).
@z

@x
In the Console, choose a [kit](/manuals/agentic-platform/kits.md) and configure
the sandbox's credentials, network access, tools, and compute size. Once it
starts, use its terminal to work with the agent. You can return to running or
paused sandboxes from **Sandboxes**.
@y
In the Console, choose a [kit](/manuals/agentic-platform/kits.md) and configure
the sandbox's credentials, network access, tools, and compute size. Once it
starts, use its terminal to work with the agent. You can return to running or
paused sandboxes from **Sandboxes**.
@z

@x
You can reuse these settings across sandboxes:
@y
You can reuse these settings across sandboxes:
@z

@x
- [MCP](/manuals/agentic-platform/mcp.md) connects external tools.
- [Secrets](/manuals/agentic-platform/secrets.md) provide credentials
  without placing their values inside a sandbox.
- [Network policies](/manuals/agentic-platform/policies.md) control
  which hosts and services a sandbox can reach.
@y
- [MCP](manuals/agentic-platform/mcp.md) connects external tools.
- [Secrets](manuals/agentic-platform/secrets.md) provide credentials
  without placing their values inside a sandbox.
- [Network policies](manuals/agentic-platform/policies.md) control
  which hosts and services a sandbox can reach.
@z

@x
To begin, [activate your subscription](signup.md#activate-cloud-access), then
[start a sandbox](get-started.md). You pay for compute by the second while your
sandbox runs. See [Signup and billing](signup.md) for account and payment
information.
@y
To begin, [activate your subscription](signup.md#activate-cloud-access), then
[start a sandbox](get-started.md). You pay for compute by the second while your
sandbox runs. See [Signup and billing](signup.md) for account and payment
information.
@z
