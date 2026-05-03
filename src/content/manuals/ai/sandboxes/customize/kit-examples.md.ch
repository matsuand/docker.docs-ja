%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Kit examples
linkTitle: Examples
description: Copy-and-adapt spec.yaml snippets for common mixin and agent kit patterns — static files, install commands, background services, initFiles, Claude Code skills, and agent forks.
keywords: sandboxes, sbx, kits, mixins, examples, patterns, skills
@y
title: Kit examples
linkTitle: Examples
description: Copy-and-adapt spec.yaml snippets for common mixin and agent kit patterns — static files, install commands, background services, initFiles, Claude Code skills, and agent forks.
keywords: sandboxes, sbx, kits, mixins, examples, patterns, skills
@z

@x
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@z

@x
> [!NOTE]
> Kits are experimental. The kit file format, CLI commands, and experience
> for creating, loading, and managing kits are subject to change as the
> feature evolves. Share feedback and bug reports in the
> [docker/sbx-releases](https://github.com/docker/sbx-releases) repository.
@y
> [!NOTE]
> Kits are experimental. The kit file format, CLI commands, and experience
> for creating, loading, and managing kits are subject to change as the
> feature evolves. Share feedback and bug reports in the
> [docker/sbx-releases](https://github.com/docker/sbx-releases) repository.
@z

@x
Each section below shows one `spec.yaml` snippet that demonstrates a
single kit pattern. These aren't complete, distributable kits — they're
small, focused examples you can lift into your own kit. For the full
spec reference, see [Kits](kits.md).
@y
Each section below shows one `spec.yaml` snippet that demonstrates a
single kit pattern. These aren't complete, distributable kits — they're
small, focused examples you can lift into your own kit. For the full
spec reference, see [Kits](kits.md).
@z

@x
## Drop a shared config file
@y
## Drop a shared config file
@z

@x
Use static files under `files/workspace/` when the content is the same
across every sandbox and doesn't need any runtime values substituted
in. Typical use cases: linter rules, editor settings, a shared
`.editorconfig`, team dotfiles.
@y
Use static files under `files/workspace/` when the content is the same
across every sandbox and doesn't need any runtime values substituted
in. Typical use cases: linter rules, editor settings, a shared
`.editorconfig`, team dotfiles.
@z

@x
```text
ruff-lint/
├── spec.yaml
└── files/
    └── workspace/
        └── ruff.toml
```
@y
```text
ruff-lint/
├── spec.yaml
└── files/
    └── workspace/
        └── ruff.toml
```
@z

@x
```yaml {title="ruff-lint/spec.yaml"}
schemaVersion: "1"
kind: mixin
name: ruff-lint
displayName: Ruff
description: Python linting with shared team config
@y
```yaml {title="ruff-lint/spec.yaml"}
schemaVersion: "1"
kind: mixin
name: ruff-lint
displayName: Ruff
description: Python linting with shared team config
@z

@x
commands:
  install:
    - command: "uv tool install ruff@latest"
      user: "1000"
```
@y
commands:
  install:
    - command: "uv tool install ruff@latest"
      user: "1000"
```
@z

@x
```toml {title="ruff-lint/files/workspace/ruff.toml"}
line-length = 80
@y
```toml {title="ruff-lint/files/workspace/ruff.toml"}
line-length = 80
@z

@x
[lint]
select = ["E", "F", "I"]
```
@y
[lint]
select = ["E", "F", "I"]
```
@z

@x
## Install a tool at sandbox creation
@y
## Install a tool at sandbox creation
@z

@x
`commands.install` runs once per sandbox, at creation time. It's where
anything that needs to land in the image goes — package managers
(`apt-get`, `pip`, `npm`), binary downloads, or vendor install scripts.
@y
`commands.install` runs once per sandbox, at creation time. It's where
anything that needs to land in the image goes — package managers
(`apt-get`, `pip`, `npm`), binary downloads, or vendor install scripts.
@z

@x
```yaml
commands:
  install:
    - command: "apt-get update && apt-get install -y jq"
    - command: "curl -fsSL https://example.com/install.sh | sh"
```
@y
```yaml
commands:
  install:
    - command: "apt-get update && apt-get install -y jq"
    - command: "curl -fsSL https://example.com/install.sh | sh"
```
@z

@x
Install commands run as root by default. Set `user: "1000"` when the
step should run as the agent user — for example, `npm install -g`
against a user-scoped prefix, or anything that writes to
`/home/agent/`.
@y
Install commands run as root by default. Set `user: "1000"` when the
step should run as the agent user — for example, `npm install -g`
against a user-scoped prefix, or anything that writes to
`/home/agent/`.
@z

@x
## Run a background service
@y
## Run a background service
@z

@x
<!-- TODO: follow up on commands.startup[].background.
     `background: true` on its own isn't enough to keep a
     long-running service alive — the process exits shortly after start.
     Using `nohup … &` inside a shell command is the current workaround
     and what this section teaches. If background ever actually daemonizes
     the command, this section can be simplified. -->
@y
<!-- TODO: follow up on commands.startup[].background.
     `background: true` on its own isn't enough to keep a
     long-running service alive — the process exits shortly after start.
     Using `nohup … &` inside a shell command is the current workaround
     and what this section teaches. If background ever actually daemonizes
     the command, this section can be simplified. -->
@z

@x
`commands.startup` runs at every sandbox start. For long-running
services, background them inside a shell command and redirect output to
a log file. Relying on the `background: true` field alone can leave
the service attached to a shell that exits, which silently kills it.
@y
`commands.startup` runs at every sandbox start. For long-running
services, background them inside a shell command and redirect output to
a log file. Relying on the `background: true` field alone can leave
the service attached to a shell that exits, which silently kills it.
@z

@x
```yaml
commands:
  startup:
    - command:
        - sh
        - -c
        - nohup my-service --port 8080 > /tmp/my-service.log 2>&1 &
      user: "1000"
```
@y
```yaml
commands:
  startup:
    - command:
        - sh
        - -c
        - nohup my-service --port 8080 > /tmp/my-service.log 2>&1 &
      user: "1000"
```
@z

@x
The log file is worth the extra flag: if the service exits early, its
stderr goes to a parent shell that isn't attached to anything you can
read. An empty log file tells you the wrapper ran; a populated one
tells you why it failed.
@y
The log file is worth the extra flag: if the service exits early, its
stderr goes to a parent shell that isn't attached to anything you can
read. An empty log file tells you the wrapper ran; a populated one
tells you why it failed.
@z

@x
## Bake runtime values into a file with initFiles
@y
## Bake runtime values into a file with initFiles
@z

@x
When a config file needs a value that isn't known until sandbox start
— most often the absolute workspace path — use `commands.initFiles`.
The `${WORKDIR}` placeholder expands to the primary workspace path
when the file is written.
@y
When a config file needs a value that isn't known until sandbox start
— most often the absolute workspace path — use `commands.initFiles`.
The `${WORKDIR}` placeholder expands to the primary workspace path
when the file is written.
@z

@x
```yaml
commands:
  initFiles:
    - path: /home/agent/.local/bin/start-code-server.sh
      content: |
        exec code-server --bind-addr 0.0.0.0:8080 --auth none "${WORKDIR}"
      mode: "0755"
  startup:
    - command:
        - sh
        - -c
        - nohup /home/agent/.local/bin/start-code-server.sh > /tmp/code-server.log 2>&1 &
      user: "1000"
```
@y
```yaml
commands:
  initFiles:
    - path: /home/agent/.local/bin/start-code-server.sh
      content: |
        exec code-server --bind-addr 0.0.0.0:8080 --auth none "${WORKDIR}"
      mode: "0755"
  startup:
    - command:
        - sh
        - -c
        - nohup /home/agent/.local/bin/start-code-server.sh > /tmp/code-server.log 2>&1 &
      user: "1000"
```
@z

@x
`mode: "0755"` makes the generated file executable so the startup
command can invoke it directly.
@y
`mode: "0755"` makes the generated file executable so the startup
command can invoke it directly.
@z

@x
Use `initFiles` instead of a static file whenever the content depends
on a runtime value. Use a static file otherwise.
@y
Use `initFiles` instead of a static file whenever the content depends
on a runtime value. Use a static file otherwise.
@z

@x
## Ship a Claude Code skill
@y
## Ship a Claude Code skill
@z

@x
Claude Code reads project-scoped skills from
`.claude/skills/<name>/SKILL.md` in the workspace. Drop one into
`files/workspace/` and it's available in the sandbox.
@y
Claude Code reads project-scoped skills from
`.claude/skills/<name>/SKILL.md` in the workspace. Drop one into
`files/workspace/` and it's available in the sandbox.
@z

@x
```text
docker-review/
├── spec.yaml
└── files/
    └── workspace/
        └── .claude/
            └── skills/
                └── docker-review/
                    └── SKILL.md
```
@y
```text
docker-review/
├── spec.yaml
└── files/
    └── workspace/
        └── .claude/
            └── skills/
                └── docker-review/
                    └── SKILL.md
```
@z

@x
```yaml {title="docker-review/spec.yaml"}
schemaVersion: "1"
kind: mixin
name: docker-review
displayName: Dockerfile review skill
description: Ships a Claude Code skill that reviews Dockerfiles
```
@y
```yaml {title="docker-review/spec.yaml"}
schemaVersion: "1"
kind: mixin
name: docker-review
displayName: Dockerfile review skill
description: Ships a Claude Code skill that reviews Dockerfiles
```
@z

@x
```markdown {title="docker-review/files/workspace/.claude/skills/docker-review/SKILL.md"}
---
name: docker-review
description: Review a Dockerfile for best practices. Use when the user asks to review, audit, or improve a Dockerfile.
---
@y
```markdown {title="docker-review/files/workspace/.claude/skills/docker-review/SKILL.md"}
---
name: docker-review
description: Review a Dockerfile for best practices. Use when the user asks to review, audit, or improve a Dockerfile.
---
@z

@x
When reviewing a Dockerfile, check:
@y
When reviewing a Dockerfile, check:
@z

@x
1. Base image — pinned tag or digest, appropriate for the workload
2. Layer order — dependencies copied before application source
3. Image size — multi-stage builds, `.dockerignore`, package-manager cache flags
4. Security — non-root `USER`, no secrets in `ARG`/`ENV`
5. Reproducibility — pinned package versions, frontend directive where relevant
```
@y
1. Base image — pinned tag or digest, appropriate for the workload
2. Layer order — dependencies copied before application source
3. Image size — multi-stage builds, `.dockerignore`, package-manager cache flags
4. Security — non-root `USER`, no secrets in `ARG`/`ENV`
5. Reproducibility — pinned package versions, frontend directive where relevant
```
@z

@x
Kits have to target the workspace rather than `~/.claude/` because
sandboxes don't pick up user-level agent configuration from the host.
See the
[FAQ](../faq.md#why-doesnt-the-sandbox-use-my-user-level-agent-configuration)
for details.
@y
Kits have to target the workspace rather than `~/.claude/` because
sandboxes don't pick up user-level agent configuration from the host.
See the
[FAQ](../faq.md#why-doesnt-the-sandbox-use-my-user-level-agent-configuration)
for details.
@z

@x
## Fork an existing agent
@y
## Fork an existing agent
@z

@x
Agent kits (`kind: agent`) define a full agent from scratch. The most
common variant is a fork of a built-in agent — same image and
credentials, but a different entrypoint. This example reproduces the
built-in `claude` agent but drops `--dangerously-skip-permissions` so
every tool call prompts for approval:
@y
Agent kits (`kind: agent`) define a full agent from scratch. The most
common variant is a fork of a built-in agent — same image and
credentials, but a different entrypoint. This example reproduces the
built-in `claude` agent but drops `--dangerously-skip-permissions` so
every tool call prompts for approval:
@z

@x
```yaml {title="claude-safe/spec.yaml"}
schemaVersion: "1"
kind: agent
name: claude-safe
displayName: Claude Code (with approval prompts)
description: Claude Code without --dangerously-skip-permissions
@y
```yaml {title="claude-safe/spec.yaml"}
schemaVersion: "1"
kind: agent
name: claude-safe
displayName: Claude Code (with approval prompts)
description: Claude Code without --dangerously-skip-permissions
@z

@x
agent:
  image: "docker/sandbox-templates:claude-code-docker"
  aiFilename: CLAUDE.md
  persistence: persistent
  entrypoint:
    run: [claude]
@y
agent:
  image: "docker/sandbox-templates:claude-code-docker"
  aiFilename: CLAUDE.md
  persistence: persistent
  entrypoint:
    run: [claude]
@z

@x
network:
  serviceDomains:
    api.anthropic.com: anthropic
    console.anthropic.com: anthropic
  serviceAuth:
    anthropic:
      headerName: x-api-key
      valueFormat: "%s"
  allowedDomains:
    - "claude.com:443"
@y
network:
  serviceDomains:
    api.anthropic.com: anthropic
    console.anthropic.com: anthropic
  serviceAuth:
    anthropic:
      headerName: x-api-key
      valueFormat: "%s"
  allowedDomains:
    - "claude.com:443"
@z

@x
credentials:
  sources:
    anthropic:
      env:
        - ANTHROPIC_API_KEY
```
@y
credentials:
  sources:
    anthropic:
      env:
        - ANTHROPIC_API_KEY
```
@z

@x
Launch with the kit's `name:` as the agent argument to `sbx run`:
@y
Launch with the kit's `name:` as the agent argument to `sbx run`:
@z

@x
```console
$ sbx run claude-safe --kit ./claude-safe
```
@y
```console
$ sbx run claude-safe --kit ./claude-safe
```
@z

@x
For a step-by-step walkthrough of building a new agent kit from
scratch, see [Build an agent](build-an-agent.md).
@y
For a step-by-step walkthrough of building a new agent kit from
scratch, see [Build an agent](build-an-agent.md).
@z
