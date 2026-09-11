%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Docker Agentic Platform FAQ
linkTitle: FAQ
description: Find answers about Docker Agentic Platform sandboxes, access, credentials, billing, and data retention.
keywords: docker agentic platform, faq, sandboxes, agents, docker sandboxes, usage, billing, inference, logs, telemetry, snapshots, data retention
@y
title: Docker Agentic Platform FAQ
linkTitle: FAQ
description: Find answers about Docker Agentic Platform sandboxes, access, credentials, billing, and data retention.
keywords: docker agentic platform, faq, sandboxes, agents, docker sandboxes, usage, billing, inference, logs, telemetry, snapshots, data retention
@z

@x
## What can I run in Docker Agentic Platform?
@y
## What can I run in Docker Agentic Platform?
@z

@x
Docker Agentic Platform provides predefined sandbox types for Claude Code,
Codex, OpenCode, Copilot, Gemini CLI, and Shell. Each type runs in an isolated,
Docker-hosted sandbox with a live terminal.
@y
Docker Agentic Platform provides predefined sandbox types for Claude Code,
Codex, OpenCode, Copilot, Gemini CLI, and Shell. Each type runs in an isolated,
Docker-hosted sandbox with a live terminal.
@z

@x
## How does Docker Agentic Platform differ from Docker Sandboxes?
@y
## How does Docker Agentic Platform differ from Docker Sandboxes?
@z

@x
Docker Agentic Platform runs sandboxes on Docker-managed cloud infrastructure
through a web Console. Docker Sandboxes runs sandboxes on your development
machine through the `sbx` command. Docker Agentic Platform manages the compute,
MCP connections, secrets, and network policies used by its hosted sandboxes.
@y
Docker Agentic Platform runs sandboxes on Docker-managed cloud infrastructure
through a web Console. Docker Sandboxes runs sandboxes on your development
machine through the `sbx` command. Docker Agentic Platform manages the compute,
MCP connections, secrets, and network policies used by its hosted sandboxes.
@z

@x
## Can I move a sandbox between my machine and Docker Agentic Platform?
@y
## Can I move a sandbox between my machine and Docker Agentic Platform?
@z

@x
No. Local and hosted sandboxes are separate in the initial release. You cannot
move a running sandbox or its local bind mounts into Docker Agentic Platform.
@y
No. Local and hosted sandboxes are separate in the initial release. You cannot
move a running sandbox or its local bind mounts into Docker Agentic Platform.
@z

@x
## Can I share sandboxes and configuration with a team?
@y
## Can I share sandboxes and configuration with a team?
@z

@x
The initial self-service experience is single-user. You manage your own
sandboxes, MCP connections, secrets, and network policies. Shared workspaces
and collaborative ownership are not part of the initial release.
@y
The initial self-service experience is single-user. You manage your own
sandboxes, MCP connections, secrets, and network policies. Shared workspaces
and collaborative ownership are not part of the initial release.
@z

@x
## How does a sandbox access external services?
@y
## How does a sandbox access external services?
@z

@x
By default, every new sandbox uses the **Open** user policy, regardless of
sandbox type. **Open** allows access to all outbound destinations. To restrict
egress, replace **Open** with **Balanced**, a custom policy, or no user policy.
@y
By default, every new sandbox uses the **Open** user policy, regardless of
sandbox type. **Open** allows access to all outbound destinations. To restrict
egress, replace **Open** with **Balanced**, a custom policy, or no user policy.
@z

@x
Network policies control the destinations a sandbox can reach. The sandbox
type's read-only kit policy applies automatically, and you can select zero or
more user policies when you create the sandbox. If you select no user policies,
only the kit policy applies and destinations that it does not allow are blocked.
A deny rule takes precedence over an allow rule. Docker stores configured
secret values outside the sandbox and applies them to matching requests through
the sandbox proxy.
@y
Network policies control the destinations a sandbox can reach. The sandbox
type's read-only kit policy applies automatically, and you can select zero or
more user policies when you create the sandbox. If you select no user policies,
only the kit policy applies and destinations that it does not allow are blocked.
A deny rule takes precedence over an allow rule. Docker stores configured
secret values outside the sandbox and applies them to matching requests through
the sandbox proxy.
@z

@x
## How are sandbox usage and model inference billed?
@y
## How are sandbox usage and model inference billed?
@z

@x
Docker bills sandbox compute per second while the sandbox runs. The Console
also shows the equivalent hourly rate.
@y
Docker bills sandbox compute per second while the sandbox runs. The Console
also shows the equivalent hourly rate.
@z

@x
Model inference is billed separately. The sandbox uses your credential for an
external model provider, which meters and bills inference under that provider
account. See [Docker Billing](/subscription-billing/) for account, usage, and payment
information.
@y
Model inference is billed separately. The sandbox uses your credential for an
external model provider, which meters and bills inference under that provider
account. See [Docker Billing](__SUBDIR__/subscription-billing/) for account, usage, and payment
information.
@z

@x
## How long are logs, telemetry, and snapshots retained?
@y
## How long are logs, telemetry, and snapshots retained?
@z

@x
Docker retains Docker Agentic Platform service logs for 31 days and raw
telemetry for 12 months.
@y
Docker retains Docker Agentic Platform service logs for 31 days and raw
telemetry for 12 months.
@z

@x
All snapshots, including the most recent snapshot created when you pause a
sandbox, are automatically deleted after seven days of non-use.
@y
All snapshots, including the most recent snapshot created when you pause a
sandbox, are automatically deleted after seven days of non-use.
@z
