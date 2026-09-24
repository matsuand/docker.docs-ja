%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

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
## Is Docker Sandboxes free? Can I use it commercially?
@y
## Is Docker Sandboxes free? Can I use it commercially?
@z

@x
Yes to both. The `sbx` CLI is free to use, including for commercial and
professional work, with no per-seat fee. Install it, sign in with a free
Docker account, and run sandboxes at no cost.
@y
Yes to both. The `sbx` CLI is free to use, including for commercial and
professional work, with no per-seat fee. Install it, sign in with a free
Docker account, and run sandboxes at no cost.
@z

@x
The only paid component is organization governance: centrally managed network,
filesystem, and MCP policies,
[sign-in enforcement](governance/monitor-and-enforce/sign-in-enforcement.md),
and [audit logs](governance/audit/). These
[organization governance features](governance/) require a separate paid
subscription —
[contact Docker Sales](https://www.docker.com/products/ai-governance/#contact-sales)
to get started. Everything else, including running agents in isolated
sandboxes, is free.
@y
The only paid component is organization governance: centrally managed network,
filesystem, and MCP policies,
[sign-in enforcement](governance/monitor-and-enforce/sign-in-enforcement.md),
and [audit logs](governance/audit/). These
[organization governance features](governance/) require a separate paid
subscription —
[contact Docker Sales](https://www.docker.com/products/ai-governance/#contact-sales)
to get started. Everything else, including running agents in isolated
sandboxes, is free.
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
controls apply to every sandbox in the organization. When organization
governance is active, only organization allow rules grant access: local allow
rules set with `sbx policy` are no longer evaluated, while local deny rules
still apply on top.
@y
Yes. Admins can centrally manage network, filesystem, and MCP policies. These
controls apply to every sandbox in the organization. When organization
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
## Which domains do I need to allow for Docker Sandboxes to work?
@y
## Which domains do I need to allow for Docker Sandboxes to work?
@z

@x
If your organization restricts outbound network access with a firewall or
proxy, add the following domains to your allowlist so that `sbx` can
authenticate, pull images, and report diagnostics.
@y
If your organization restricts outbound network access with a firewall or
proxy, add the following domains to your allowlist so that `sbx` can
authenticate, pull images, and report diagnostics.
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
Docker Sandboxes doesn't monitor sessions, read your prompts, or access your
code. Your code stays in the sandbox and on your host.
@y
Docker Sandboxes doesn't monitor sessions, read your prompts, or access your
code. Your code stays in the sandbox and on your host.
@z

@x
To opt out of all analytics, set the `SBX_NO_TELEMETRY` environment variable:
@y
To opt out of all analytics, set the `SBX_NO_TELEMETRY` environment variable:
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
To make approval prompts the default for every session, define a custom
sandbox kit that overrides the agent's entrypoint to drop the
permission-skipping flag. For example, a kit that launches Claude Code
without `--dangerously-skip-permissions`:
@y
To make approval prompts the default for every session, define a custom
sandbox kit that overrides the agent's entrypoint to drop the
permission-skipping flag. For example, a kit that launches Claude Code
without `--dangerously-skip-permissions`:
@z

@x
```yaml {title="claude-safe/spec.yaml"}
schemaVersion: "1"
kind: sandbox
name: claude-safe
sandbox:
  image: "docker/sandbox-templates:claude-code-docker"
  entrypoint:
    run: [claude]
```
@y
```yaml {title="claude-safe/spec.yaml"}
schemaVersion: "1"
kind: sandbox
name: claude-safe
sandbox:
  image: "docker/sandbox-templates:claude-code-docker"
  entrypoint:
    run: [claude]
```
@z

@x
Run it with `sbx run ./claude-safe/`. See
[Sandbox kits](customize/kits.md#sandbox-kits) for the full pattern.
@y
Run it with `sbx run ./claude-safe/`. See
[Sandbox kits](customize/kits.md#sandbox-kits) for the full pattern.
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
Sandboxes don't import your complete user-level agent configuration. Hooks,
settings, and other files under directories such as `~/.claude` remain on the
host. Project-level configuration in the working directory remains available
inside the sandbox.
@y
Sandboxes don't import your complete user-level agent configuration. Hooks,
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
Yes, but it's off by default. Text paste already works, because the terminal
sends it directly. Pasting an image or screenshot with `Ctrl+V` is different:
the agent reads it from your host clipboard, and the sandbox blocks that access
unless you opt in.
@y
Yes, but it's off by default. Text paste already works, because the terminal
sends it directly. Pasting an image or screenshot with `Ctrl+V` is different:
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
Yes. On Linux, `sbx` stores secrets in the Secret Service exposed by your
desktop keyring, such as GNOME Keyring or KDE Wallet. Headless servers and some
WSL setups have no running Secret Service, so `sbx` falls back to a file under
`$XDG_CONFIG_HOME/com.docker.sandboxes`, which defaults to
`~/.config/com.docker.sandboxes` when `$XDG_CONFIG_HOME` is unset. No setup is
required. When you store a secret on such a host, `sbx` prints a notice:
@y
Yes. On Linux, `sbx` stores secrets in the Secret Service exposed by your
desktop keyring, such as GNOME Keyring or KDE Wallet. Headless servers and some
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
