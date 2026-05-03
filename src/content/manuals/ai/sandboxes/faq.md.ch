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
keywords: docker sandboxes, sbx, faq, sign in, telemetry
@y
description: Frequently asked questions about Docker Sandboxes.
keywords: docker sandboxes, sbx, faq, sign in, telemetry
@z

@x
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
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
- **Enable team features down the road.** Shared environments, org-level
  policies, audit logs. These all need a concept of "who," and building that in
  later would be worse for everyone.
- **Authenticate against Docker infrastructure.** Sandboxes pull images, run
  daemons, and talk to Docker services. A Docker account makes that seamless.
@y
- **Tie sandboxes to a real person.** Governance matters when agents can build
  containers, install packages, and push code. Your Docker identity is the
  anchor.
- **Enable team features down the road.** Shared environments, org-level
  policies, audit logs. These all need a concept of "who," and building that in
  later would be worse for everyone.
- **Authenticate against Docker infrastructure.** Sandboxes pull images, run
  daemons, and talk to Docker services. A Docker account makes that seamless.
@z

@x
Your Docker account email is only used for authentication, not marketing.
@y
Your Docker account email is only used for authentication, not marketing.
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
The [`sbx secret`](/reference/cli/sbx/secret/) command only supports a fixed set
of [services](security/credentials.md#supported-services) (Anthropic, OpenAI,
GitHub, and others). If your agent needs an environment variable that isn't
tied to a supported service, such as `BRAVE_API_KEY` or a custom internal
token, write it to `/etc/sandbox-persistent.sh` inside the sandbox. This
file is sourced on every shell login, so the variable persists across agent
sessions for the sandbox's lifetime.
@y
The [`sbx secret`](__SUBDIR__/reference/cli/sbx/secret/) command only supports a fixed set
of [services](security/credentials.md#supported-services) (Anthropic, OpenAI,
GitHub, and others). If your agent needs an environment variable that isn't
tied to a supported service, such as `BRAVE_API_KEY` or a custom internal
token, write it to `/etc/sandbox-persistent.sh` inside the sandbox. This
file is sourced on every shell login, so the variable persists across agent
sessions for the sandbox's lifetime.
@z

@x
Use `sbx exec` to append the export:
@y
Use `sbx exec` to append the export:
@z

@x
```console
$ sbx exec -d <sandbox-name> bash -c "echo 'export BRAVE_API_KEY=your_key' >> /etc/sandbox-persistent.sh"
```
@y
```console
$ sbx exec -d <sandbox-name> bash -c "echo 'export BRAVE_API_KEY=your_key' >> /etc/sandbox-persistent.sh"
```
@z

@x
The `bash -c` wrapper is required so the `>>` redirect runs inside the
sandbox instead of on your host.
@y
The `bash -c` wrapper is required so the `>>` redirect runs inside the
sandbox instead of on your host.
@z

@x
> [!NOTE]
> Unlike `sbx secret`, which injects credentials through a host-side proxy
> without exposing them to the agent, this approach stores the value inside
> the sandbox. The agent process can read it directly. Only use this for
> credentials where proxy-based injection isn't available.
@y
> [!NOTE]
> Unlike `sbx secret`, which injects credentials through a host-side proxy
> without exposing them to the agent, this approach stores the value inside
> the sandbox. The agent process can read it directly. Only use this for
> credentials where proxy-based injection isn't available.
@z

@x
Variables in `/etc/sandbox-persistent.sh` are sourced automatically when
bash runs inside the sandbox, including interactive sessions and agents
started with `sbx run`. If you run a command directly with
`sbx exec <name> <command>`, the command runs without a shell, so the
persistent environment file is not sourced. Wrap the command in `bash -c`
to load the environment:
@y
Variables in `/etc/sandbox-persistent.sh` are sourced automatically when
bash runs inside the sandbox, including interactive sessions and agents
started with `sbx run`. If you run a command directly with
`sbx exec <name> <command>`, the command runs without a shell, so the
persistent environment file is not sourced. Wrap the command in `bash -c`
to load the environment:
@z

@x
```console
$ sbx exec <sandbox-name> bash -c "your-command"
```
@y
```console
$ sbx exec <sandbox-name> bash -c "your-command"
```
@z

@x
To verify the variable is set, open a shell in the sandbox:
@y
To verify the variable is set, open a shell in the sandbox:
@z

@x
```console
$ sbx exec -it <sandbox-name> bash
$ echo $BRAVE_API_KEY
```
@y
```console
$ sbx exec -it <sandbox-name> bash
$ echo $BRAVE_API_KEY
```
@z

@x
## Why do agents run without approval prompts?
@y
## Why do agents run without approval prompts?
@z

@x
The sandbox itself is the safety boundary. Because agents run inside an
isolated microVM with [network policies](security/policy.md),
[credential isolation](security/credentials.md), and no access to your host
system outside the workspace, the usual reasons for approval prompts (preventing
destructive commands, network access, file modifications) are handled by the
sandbox isolation layers instead.
@y
The sandbox itself is the safety boundary. Because agents run inside an
isolated microVM with [network policies](security/policy.md),
[credential isolation](security/credentials.md), and no access to your host
system outside the workspace, the usual reasons for approval prompts (preventing
destructive commands, network access, file modifications) are handled by the
sandbox isolation layers instead.
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
Sandboxes don't pick up user-level agent configuration from your host. This
includes directories like `~/.claude` for Claude Code or `~/.codex` for Codex,
where hooks, skills, and other settings are stored. Only project-level
configuration in the working directory is available inside the sandbox.
@y
Sandboxes don't pick up user-level agent configuration from your host. This
includes directories like `~/.claude` for Claude Code or `~/.codex` for Codex,
where hooks, skills, and other settings are stored. Only project-level
configuration in the working directory is available inside the sandbox.
@z

@x
To make configuration available in a sandbox, copy or move what you need into
your project directory before starting a session:
@y
To make configuration available in a sandbox, copy or move what you need into
your project directory before starting a session:
@z

@x
```console
$ cp -r ~/.claude/skills .claude/skills
```
@y
```console
$ cp -r ~/.claude/skills .claude/skills
```
@z

@x
Don't use symlinks — a sandboxed agent can't follow symlinks to paths outside
the sandbox.
@y
Don't use symlinks — a sandboxed agent can't follow symlinks to paths outside
the sandbox.
@z

@x
Collocating skills and other agent configuration with the project itself is a
good practice regardless of sandboxes. It's versioned alongside the code and
evolves with the project as it changes.
@y
Collocating skills and other agent configuration with the project itself is a
good practice regardless of sandboxes. It's versioned alongside the code and
evolves with the project as it changes.
@z
