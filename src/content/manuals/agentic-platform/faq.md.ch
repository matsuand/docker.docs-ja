%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

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
You can run agents such as Claude Code, Codex, and Hermes in isolated cloud
sandboxes with live terminals. Browse [Kits](kits.md) for curated and community
agents, or choose Shell to work without an agent. You can also enter a public
kit reference in the launcher.
@y
You can run agents such as Claude Code, Codex, and Hermes in isolated cloud
sandboxes with live terminals. Browse [Kits](kits.md) for curated and community
agents, or choose Shell to work without an agent. You can also enter a public
kit reference in the launcher.
@z

@x
## Can I use private kits?
@y
## Can I use private kits?
@z

@x
You can run private Docker Hub kits using the Docker Sandboxes CLI. Launching
a kit from the Console requires both the kit and its base image to be public.
The **Kits** page provides the CLI command to copy.
@y
You can run private Docker Hub kits using the Docker Sandboxes CLI. Launching
a kit from the Console requires both the kit and its base image to be public.
The **Kits** page provides the CLI command to copy.
@z

@x
To access private GitHub repositories from inside a sandbox, use a
[GitHub credential](secrets.md#github-credential).
@y
To access private GitHub repositories from inside a sandbox, use a
[GitHub credential](secrets.md#github-credential).
@z

@x
## How does Docker Agentic Platform differ from Docker Sandboxes?
@y
## How does Docker Agentic Platform differ from Docker Sandboxes?
@z

@x
Docker Agentic Platform runs sandboxes on Docker-managed cloud infrastructure
through a web Console. The `sbx` CLI runs local sandboxes on your development
machine and cloud sandboxes with `sbx --cloud`. The Console and CLI have
different workflows and secret names. See
[Cloud sandboxes](/manuals/ai/sandboxes/cloud/_index.md) for the CLI experience.
@y
Docker Agentic Platform runs sandboxes on Docker-managed cloud infrastructure
through a web Console. The `sbx` CLI runs local sandboxes on your development
machine and cloud sandboxes with `sbx --cloud`. The Console and CLI have
different workflows and secret names. See
[Cloud sandboxes](manuals/ai/sandboxes/cloud/_index.md) for the CLI experience.
@z

@x
## Can I move a sandbox between my machine and Docker Agentic Platform?
@y
## Can I move a sandbox between my machine and Docker Agentic Platform?
@z

@x
The `sbx move` command copies a sandbox filesystem between local and cloud
environments. It does not transfer running processes, host bind mounts, or
managed secrets, and it leaves the source sandbox in place. See
[Move a sandbox](/manuals/ai/sandboxes/cloud/move.md) for the CLI workflow and
its limitations.
@y
The `sbx move` command copies a sandbox filesystem between local and cloud
environments. It does not transfer running processes, host bind mounts, or
managed secrets, and it leaves the source sandbox in place. See
[Move a sandbox](manuals/ai/sandboxes/cloud/move.md) for the CLI workflow and
its limitations.
@z

@x
## Can I share sandboxes and configuration with a team?
@y
## Can I share sandboxes and configuration with a team?
@z

@x
The initial release is for individual use. You manage your own sandboxes, MCP
connections, secrets, and network policies. Shared workspaces and team
ownership aren't supported.
@y
The initial release is for individual use. You manage your own sandboxes, MCP
connections, secrets, and network policies. Shared workspaces and team
ownership aren't supported.
@z

@x
## How does a sandbox access external services?
@y
## How does a sandbox access external services?
@z

@x
The **Open** user policy allows outbound access to any host. **Balanced**
allows a curated set of hosts and services. Allow rules from all applicable
policies are combined: selecting both **Open** and **Balanced** permits all
outbound destinations except those blocked by explicit deny rules. Balanced's
allow list doesn't restrict Open's access. To restrict access with an allow
list, deselect **Open** if it is selected and can be removed.
@y
The **Open** user policy allows outbound access to any host. **Balanced**
allows a curated set of hosts and services. Allow rules from all applicable
policies are combined: selecting both **Open** and **Balanced** permits all
outbound destinations except those blocked by explicit deny rules. Balanced's
allow list doesn't restrict Open's access. To restrict access with an allow
list, deselect **Open** if it is selected and can be removed.
@z

@x
The launcher remembers your policy selections from the previous launch in the
same browser. Without saved selections, it selects the account's policies
marked **Always applied**. These policies can't be deselected in the launcher.
@y
The launcher remembers your policy selections from the previous launch in the
same browser. Without saved selections, it selects the account's policies
marked **Always applied**. These policies can't be deselected in the launcher.
@z

@x
Your kit's network rules also apply. If an allow rule and a deny rule match
the same destination, the deny rule wins. See [Network policies](policies.md)
for details.
@y
Your kit's network rules also apply. If an allow rule and a deny rule match
the same destination, the deny rule wins. See [Network policies](policies.md)
for details.
@z

@x
For services that need authentication, save your credentials under
[Secrets](secrets.md). The sandbox proxy adds them to matching requests without
exposing their values to the agent.
@y
For services that need authentication, save your credentials under
[Secrets](secrets.md). The sandbox proxy adds them to matching requests without
exposing their values to the agent.
@z

@x
## How are sandbox usage and model inference billed?
@y
## How are sandbox usage and model inference billed?
@z

@x
You pay for compute by the second while your sandbox runs. The Console also
shows the equivalent hourly rate.
@y
You pay for compute by the second while your sandbox runs. The Console also
shows the equivalent hourly rate.
@z

@x
Your model provider bills inference separately, under the account associated
with your API key. See [Docker Billing](/subscription-billing/) for account,
usage, and payment information.
@y
Your model provider bills inference separately, under the account associated
with your API key. See [Docker Billing](__SUBDIR__/subscription-billing/) for account,
usage, and payment information.
@z

@x
## How long are logs, telemetry, and snapshots retained?
@y
## How long are logs, telemetry, and snapshots retained?
@z

@x
Service logs are kept for 31 days and raw telemetry for 12 months.
@y
Service logs are kept for 31 days and raw telemetry for 12 months.
@z

@x
All snapshots, including the most recent snapshot created when you pause a
sandbox, are automatically deleted after seven days of non-use.
@y
All snapshots, including the most recent snapshot created when you pause a
sandbox, are automatically deleted after seven days of non-use.
@z
