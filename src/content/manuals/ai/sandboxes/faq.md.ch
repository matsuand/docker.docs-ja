%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: FAQ
@y
title: FAQ
@z

@x
description: Frequently asked questions about Docker Sandboxes.
keywords: docker sandboxes, sbx, faq, sign in, telemetry, clipboard, image paste, pricing, commercial use, allowlist, firewall, domains, proxy
@y
description: Frequently asked questions about Docker Sandboxes.
keywords: docker sandboxes, sbx, faq, sign in, telemetry, clipboard, image paste, pricing, commercial use, allowlist, firewall, domains, proxy
@z

@x
Host integration and workspace instructions on this page describe local
sandboxes. See [Local and cloud differences](cloud/local-vs-cloud.md) before
adapting those workflows to the cloud.
@y
Host integration and workspace instructions on this page describe local
sandboxes. See [Local and cloud differences](cloud/local-vs-cloud.md) before
adapting those workflows to the cloud.
@z

@x
## Is Docker Sandboxes free? Can I use it commercially?
@y
## Is Docker Sandboxes free? Can I use it commercially?
@z

@x
The `sbx` CLI and local sandbox compute are free to use, including for
commercial and professional work. Cloud sandbox compute uses a
[pay-as-you-go subscription](/manuals/agentic-platform/signup.md#billing).
Model-provider charges are separate from sandbox compute.
@y
The `sbx` CLI and local sandbox compute are free to use, including for
commercial and professional work. Cloud sandbox compute uses a
[pay-as-you-go subscription](manuals/agentic-platform/signup.md#billing).
Model-provider charges are separate from sandbox compute.
@z

@x
Organization governance for local sandboxes includes centrally managed network,
filesystem, and MCP policies,
[sign-in enforcement](governance/monitor-and-enforce/sign-in-enforcement.md),
and [audit logs](governance/audit/). These
[organization governance features](governance/) require a separate paid
subscription —
[contact Docker Sales](https://www.docker.com/products/ai-governance/#contact-sales)
to get started.
@y
Organization governance for local sandboxes includes centrally managed network,
filesystem, and MCP policies,
[sign-in enforcement](governance/monitor-and-enforce/sign-in-enforcement.md),
and [audit logs](governance/audit/). These
[organization governance features](governance/) require a separate paid
subscription —
[contact Docker Sales](https://www.docker.com/products/ai-governance/#contact-sales)
to get started.
@z

@x
## Why do I need to sign in?
@y
## Why do I need to sign in?
@z

@x
Docker Sandboxes is built around the idea that you and your agents are a team.
Signing in gives each sandbox a verified identity, which lets Docker:
@y
Docker Sandboxes is built around the idea that you and your agents are a team.
Signing in gives each sandbox a verified identity, which lets Docker:
@z

@x
- **Tie sandboxes to a real person.** Governance matters when agents can build
  containers, install packages, and push code. Your Docker identity is the
  anchor.
- **Enable team features.** Team-scale features like
  [organization governance](governance/), shared environments, and audit logs
  need a concept of "who," and adding that later would be worse for everyone.
- **Authenticate against Docker infrastructure.** Sandboxes pull images, run
  daemons, and talk to Docker services. A Docker account authenticates those
  requests.
@y
- **Tie sandboxes to a real person.** Governance matters when agents can build
  containers, install packages, and push code. Your Docker identity is the
  anchor.
- **Enable team features.** Team-scale features like
  [organization governance](governance/), shared environments, and audit logs
  need a concept of "who," and adding that later would be worse for everyone.
- **Authenticate against Docker infrastructure.** Sandboxes pull images, run
  daemons, and talk to Docker services. A Docker account authenticates those
  requests.
@z

@x
Your Docker account email is only used for authentication, not marketing.
@y
Your Docker account email is only used for authentication, not marketing.
@z

@x
## Can I enforce sandbox policies across my organization?
@y
## Can I enforce sandbox policies across my organization?
@z

@x
Yes. Admins can centrally manage network, filesystem, and MCP policies. These
controls apply to local sandboxes in the organization. When organization
governance is active, only organization allow rules grant access: local allow
rules set with `sbx policy` are no longer evaluated, while local deny rules
still apply on top.
@y
Yes. Admins can centrally manage network, filesystem, and MCP policies. These
controls apply to local sandboxes in the organization. When organization
governance is active, only organization allow rules grant access: local allow
rules set with `sbx policy` are no longer evaluated, while local deny rules
still apply on top.
@z

@x
See [Organization policies](governance/access-controls/organization.md). This
feature requires a separate paid subscription —
[contact Docker Sales](https://www.docker.com/products/ai-governance/#contact-sales)
to get started.
@y
See [Organization policies](governance/access-controls/organization.md). This
feature requires a separate paid subscription —
[contact Docker Sales](https://www.docker.com/products/ai-governance/#contact-sales)
to get started.
@z

@x
Cloud sandboxes use separate network policy configuration.
See [Cloud network policy](cloud/network-policy.md) for cloud controls.
@y
Cloud sandboxes use separate network policy configuration.
See [Cloud network policy](cloud/network-policy.md) for cloud controls.
@z

@x
## Which domains do I need to allow for Docker Sandboxes to work?
@y
## Which domains do I need to allow for Docker Sandboxes to work?
@z

@x
If your organization restricts outbound network access with a firewall or
proxy, add the following domains to your allowlist so that `sbx` can
authenticate, pull images, and report diagnostics for local sandboxes.
Cloud operations also connect to `https://api.sandboxes-cloud.docker.com`.
@y
If your organization restricts outbound network access with a firewall or
proxy, add the following domains to your allowlist so that `sbx` can
authenticate, pull images, and report diagnostics for local sandboxes.
Cloud operations also connect to `https://api.sandboxes-cloud.docker.com`.
@z

@x
| Domain                                             | Description             |
| -------------------------------------------------- | ----------------------- |
| https://login.docker.com                           | Authentication          |
| https://hub.docker.com                             | Docker Hub              |
| https://api.docker.com                             | Docker API              |
| https://marlin-2.docker.com                        | Telemetry               |
| https://marlin-api.docker.com                      | Telemetry               |
| https://registry-1.docker.io                       | Docker pull/push        |
| https://auth.docker.io                             | Registry authentication |
| https://dhi.io                                     | Docker Hardened Images  |
| https://sbx-diagnostics.s3.us-east-1.amazonaws.com | Diagnostics upload      |
@y
| Domain                                             | Description             |
| -------------------------------------------------- | ----------------------- |
| https://login.docker.com                           | Authentication          |
| https://hub.docker.com                             | Docker Hub              |
| https://api.docker.com                             | Docker API              |
| https://marlin-2.docker.com                        | Telemetry               |
| https://marlin-api.docker.com                      | Telemetry               |
| https://registry-1.docker.io                       | Docker pull/push        |
| https://auth.docker.io                             | Registry authentication |
| https://dhi.io                                     | Docker Hardened Images  |
| https://sbx-diagnostics.s3.us-east-1.amazonaws.com | Diagnostics upload      |
@z

@x
## Does the CLI collect telemetry?
@y
## Does the CLI collect telemetry?
@z

@x
The `sbx` CLI collects basic usage data about CLI invocations:
@y
The `sbx` CLI collects basic usage data about CLI invocations:
@z

@x
- Which command you ran
- Whether it succeeded or failed
- How long it took
- If you're signed in, your Docker username is included
@y
- Which command you ran
- Whether it succeeded or failed
- How long it took
- If you're signed in, your Docker username is included
@z

@x
CLI usage telemetry does not include your prompts or code. Cloud sandboxes
execute on Docker-managed infrastructure, so files you transfer to them are
stored in the cloud.
@y
CLI usage telemetry does not include your prompts or code. Cloud sandboxes
execute on Docker-managed infrastructure, so files you transfer to them are
stored in the cloud.
@z

@x
To opt out of CLI usage analytics, set the `SBX_NO_TELEMETRY` environment variable:
@y
To opt out of CLI usage analytics, set the `SBX_NO_TELEMETRY` environment variable:
@z

@x
```console
$ export SBX_NO_TELEMETRY=1
```
@y
```console
$ export SBX_NO_TELEMETRY=1
```
@z

@x
## How do I set custom environment variables inside a sandbox?
@y
## How do I set custom environment variables inside a sandbox?
@z

@x
Starting with `sbx` version 0.39.0, use `-e`/`--env` or `--env-file` with
`sbx run` and `sbx create`. See
[Set environment variables](usage.md#set-environment-variables) for syntax,
precedence rules, persistent configuration for an existing sandbox, and
guidance for credentials.
@y
Starting with `sbx` version 0.39.0, use `-e`/`--env` or `--env-file` with
`sbx run` and `sbx create`. See
[Set environment variables](usage.md#set-environment-variables) for syntax,
precedence rules, persistent configuration for an existing sandbox, and
guidance for credentials.
@z

@x
Variables in `/etc/sandbox-persistent.sh` are available to interactive sessions
and agents started with `sbx run`. A variable only takes effect for sessions
and agents started after it's added. Restart a running agent, or stop and start
the sandbox, to pick up the new value.
@y
Variables in `/etc/sandbox-persistent.sh` are available to interactive sessions
and agents started with `sbx run`. A variable only takes effect for sessions
and agents started after it's added. Restart a running agent, or stop and start
the sandbox, to pick up the new value.
@z

@x
## Why do agents run without approval prompts?
@y
## Why do agents run without approval prompts?
@z

@x
The sandbox itself is the safety boundary. Because agents run inside an
isolated microVM with [network policies](governance/access-controls/network.md),
[credential isolation](security/isolation.md#credential-isolation), and no access to your host
system outside explicitly shared paths, the usual reasons for approval prompts
(preventing destructive commands, network access, file modifications) are
handled by the sandbox isolation layers instead.
@y
The sandbox itself is the safety boundary. Because agents run inside an
isolated microVM with [network policies](governance/access-controls/network.md),
[credential isolation](security/isolation.md#credential-isolation), and no access to your host
system outside explicitly shared paths, the usual reasons for approval prompts
(preventing destructive commands, network access, file modifications) are
handled by the sandbox isolation layers instead.
@z

@x
If you prefer to re-enable approval prompts, change the permission mode
inside the session. Most agents let you switch permission modes after
startup. In Claude Code, use the `/permissions` command to change the mode
interactively.
@y
If you prefer to re-enable approval prompts, change the permission mode
inside the session. Most agents let you switch permission modes after
startup. In Claude Code, use the `/permissions` command to change the mode
interactively.
@z

@x
To make approval prompts the default for every session, create a v2 sandbox
kit that extends the built-in agent and changes its launch options. See
[Fork an existing agent](customize/kits-v2.md#fork-an-existing-agent)
for a complete example.
@y
To make approval prompts the default for every session, create a v2 sandbox
kit that extends the built-in agent and changes its launch options. See
[Fork an existing agent](customize/kits-v2.md#fork-an-existing-agent)
for a complete example.
@z

@x
For an environment built entirely with v3 kits, set the launch command in
the workload's Dockerfile. See [Build a v3 agent kit](/manuals/ai/sandboxes/customize/author/build-an-agent.md).
@y
For an environment built entirely with v3 kits, set the launch command in
the workload's Dockerfile. See [Build a v3 agent kit](manuals/ai/sandboxes/customize/author/build-an-agent.md).
@z

@x
## How do I know if my agent is running in a sandbox?
@y
## How do I know if my agent is running in a sandbox?
@z

@x
Ask the agent. The agent can see whether or not it's running inside a sandbox.
In Claude Code, use the `/btw` slash command to ask without interrupting an
in-progress task:
@y
Ask the agent. The agent can see whether or not it's running inside a sandbox.
In Claude Code, use the `/btw` slash command to ask without interrupting an
in-progress task:
@z

@x
```text
/btw are you running in a sandbox?
```
@y
```text
/btw are you running in a sandbox?
```
@z

@x
## Why doesn't the sandbox use my user-level agent configuration?
@y
## Why doesn't the sandbox use my user-level agent configuration?
@z

@x
Local sandboxes don't import your complete user-level agent configuration. Hooks,
settings, and other files under directories such as `~/.claude` remain on the
host. Project-level configuration in the working directory remains available
inside the sandbox.
@y
Local sandboxes don't import your complete user-level agent configuration. Hooks,
settings, and other files under directories such as `~/.claude` remain on the
host. Project-level configuration in the working directory remains available
inside the sandbox.
@z

@x
Shared agent skills are the exception. Use `sbx skills add` to install skills
from a Git repository, or run `sbx skills import` to copy skills from supported
host directories. `sbx` keeps the skills in a persistent store shared with
sandboxes. See [Share agent skills](workflows/agent-skills.md) for repository
management, supported host directories, mount behavior, and per-sandbox
opt-out.
@y
Shared agent skills are the exception. Use `sbx skills add` to install skills
from a Git repository, or run `sbx skills import` to copy skills from supported
host directories. `sbx` keeps the skills in a persistent store shared with
sandboxes. See [Share agent skills](workflows/agent-skills.md) for repository
management, supported host directories, mount behavior, and per-sandbox
opt-out.
@z

@x
Keep project-specific skills and other agent configuration in the project
itself. This versions the configuration alongside the code. Don't use symlinks
to host paths because a sandboxed agent can't follow them outside the sandbox.
@y
Keep project-specific skills and other agent configuration in the project
itself. This versions the configuration alongside the code. Don't use symlinks
to host paths because a sandboxed agent can't follow them outside the sandbox.
@z

@x
## Can I paste images into an agent?
@y
## Can I paste images into an agent?
@z

@x
In local sandboxes, image paste is off by default. Text paste works because the
terminal sends it directly. Pasting an image or screenshot with `Ctrl+V` is different:
the agent reads it from your host clipboard, and the sandbox blocks that access
unless you opt in.
@y
In local sandboxes, image paste is off by default. Text paste works because the
terminal sends it directly. Pasting an image or screenshot with `Ctrl+V` is different:
the agent reads it from your host clipboard, and the sandbox blocks that access
unless you opt in.
@z

@x
Turn on [`clipboard.imagePaste`](configuration/settings.md#clipboardimagepaste):
@y
Turn on [`clipboard.imagePaste`](configuration/settings.md#clipboardimagepaste):
@z

@x
```console
$ sbx settings set clipboard.imagePaste true
```
@y
```console
$ sbx settings set clipboard.imagePaste true
```
@z

@x
`Ctrl+V` then pastes host images into agents that read the clipboard, including
Claude Code and Codex. The setting takes effect within a few seconds, even for
running sandboxes.
@y
`Ctrl+V` then pastes host images into agents that read the clipboard, including
Claude Code and Codex. The setting takes effect within a few seconds, even for
running sandboxes.
@z

@x
This is opt-in because it relaxes the sandbox's isolation: when enabled, a process
inside the sandbox can read your host clipboard through the host-side proxy. The
exposure is narrow — reads happen only on a paste, return image data only
(`image/png`), and clipboard content is never cached or logged — but it's still
host data crossing into the sandbox, so it stays off until you turn it on.
@y
This is opt-in because it relaxes the sandbox's isolation: when enabled, a process
inside the sandbox can read your host clipboard through the host-side proxy. The
exposure is narrow — reads happen only on a paste, return image data only
(`image/png`), and clipboard content is never cached or logged — but it's still
host data crossing into the sandbox, so it stays off until you turn it on.
@z

@x
To turn it back off:
@y
To turn it back off:
@z

@x
```console
$ sbx settings set clipboard.imagePaste false
```
@y
```console
$ sbx settings set clipboard.imagePaste false
```
@z

@x
## Can I use Docker Sandboxes on headless Linux?
@y
## Can I use Docker Sandboxes on headless Linux?
@z

@x
Yes. For local sandboxes on Linux, `sbx` stores secrets in the Secret Service
exposed by your desktop keyring, such as GNOME Keyring or KDE Wallet. Headless servers and some
WSL setups have no running Secret Service, so `sbx` falls back to a file under
`$XDG_CONFIG_HOME/com.docker.sandboxes`, which defaults to
`~/.config/com.docker.sandboxes` when `$XDG_CONFIG_HOME` is unset. No setup is
required. When you store a secret on such a host, `sbx` prints a notice:
@y
Yes. For local sandboxes on Linux, `sbx` stores secrets in the Secret Service
exposed by your desktop keyring, such as GNOME Keyring or KDE Wallet. Headless servers and some
WSL setups have no running Secret Service, so `sbx` falls back to a file under
`$XDG_CONFIG_HOME/com.docker.sandboxes`, which defaults to
`~/.config/com.docker.sandboxes` when `$XDG_CONFIG_HOME` is unset. No setup is
required. When you store a secret on such a host, `sbx` prints a notice:
@z

@x
```text
No keychain detected - this secret will be stored on disk, protected by file permissions rather than a password
```
@y
```text
No keychain detected - this secret will be stored on disk, protected by file permissions rather than a password
```
@z

@x
`sbx` stores the file in a directory with `0700` permissions, the same
file-permission model used for `~/.docker/config.json`. Any user or process that
can read the file can retrieve the stored credentials, so treat the directory as
sensitive. Where available, prefer a keychain, which mediates access per
application.
@y
`sbx` stores the file in a directory with `0700` permissions, the same
file-permission model used for `~/.docker/config.json`. Any user or process that
can read the file can retrieve the stored credentials, so treat the directory as
sensitive. Where available, prefer a keychain, which mediates access per
application.
@z

@x
To keep secrets in a keyring instead, run a Secret Service on the host before
storing them: install `gnome-keyring` and start `dbus-run-session`, or run the
keyring daemon under a login session that unlocks it. Once a working Secret
Service is available, `sbx` stores new
secrets in the keychain again. For where each platform keeps secrets, see
[Where secrets are stored](configuration/credentials.md#where-secrets-are-stored).
@y
To keep secrets in a keyring instead, run a Secret Service on the host before
storing them: install `gnome-keyring` and start `dbus-run-session`, or run the
keyring daemon under a login session that unlocks it. Once a working Secret
Service is available, `sbx` stores new
secrets in the keychain again. For where each platform keeps secrets, see
[Where secrets are stored](configuration/credentials.md#where-secrets-are-stored).
@z
