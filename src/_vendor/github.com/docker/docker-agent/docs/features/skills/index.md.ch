%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Skills"
description: "Skills provide specialized instructions that agents can load on demand when a task matches a skill's description."
keywords: docker agent, ai agents, features, skills
@y
title: "Skills"
description: "Skills provide specialized instructions that agents can load on demand when a task matches a skill's description."
keywords: docker agent, ai agents, features, skills
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/features/skills/
@y
canonical: __SUBDIR__/ai/docker-agent/features/skills/
@z

@x
_Skills provide specialized instructions that agents can load on demand when a task matches a skill's description._
@y
_Skills provide specialized instructions that agents can load on demand when a task matches a skill's description._
@z

@x
## How Skills Work
@y
## How Skills Work
@z

@x
1. Docker Agent scans standard directories for `SKILL.md` files
2. Skill metadata (name, description) is injected into the agent's system prompt
3. When a user request matches a skill, the agent reads the full instructions
4. The agent follows the skill's detailed instructions to complete the task
@y
1. Docker Agent scans standard directories for `SKILL.md` files
2. Skill metadata (name, description) is injected into the agent's system prompt
3. When a user request matches a skill, the agent reads the full instructions
4. The agent follows the skill's detailed instructions to complete the task
@z

@x
## Enabling Skills
@y
## Enabling Skills
@z

@x
```yaml
agents:
  root:
    model: openai/gpt-4o
    instruction: You are a helpful assistant.
    skills: true
```
@y
```yaml
agents:
  root:
    model: openai/gpt-4o
    instruction: You are a helpful assistant.
    skills: true
```
@z

@x
> [!TIP]
> Skills are perfect for encoding team-specific workflows (PR review, deployment, coding standards) that apply across projects.
@y
> [!TIP]
> Skills are perfect for encoding team-specific workflows (PR review, deployment, coding standards) that apply across projects.
@z

@x
## Filtering Skills
@y
## Filtering Skills
@z

@x
The `skills` field also accepts a list, letting you restrict the agent to a specific subset of skills instead of exposing every discovered one. List items are classified automatically:
@y
The `skills` field also accepts a list, letting you restrict the agent to a specific subset of skills instead of exposing every discovered one. List items are classified automatically:
@z

@x
- `"local"` or any `http://` / `https://` URL → a **source** to load skills from
- any other string → the **name** of a skill to include
@y
- `"local"` or any `http://` / `https://` URL → a **source** to load skills from
- any other string → the **name** of a skill to include
@z

@x
When only names are given, local sources are used by default.
@y
When only names are given, local sources are used by default.
@z

@x
```yaml
agents:
  # Load every discovered local skill (same as `skills: true`).
  full:
    skills: true
@y
```yaml
agents:
  # Load every discovered local skill (same as `skills: true`).
  full:
    skills: true
@z

@x
  # Load local skills, but only expose "commit" and "poem".
  scoped:
    skills:
      - commit
      - poem
@y
  # Load local skills, but only expose "commit" and "poem".
  scoped:
    skills:
      - commit
      - poem
@z

@x
  # Combine an explicit source with a name filter.
  remote_filtered:
    skills:
      - https://skills.example.com
      - commit
@y
  # Combine an explicit source with a name filter.
  remote_filtered:
    skills:
      - https://skills.example.com
      - commit
@z

@x
  # Disable skills entirely.
  none:
    skills: false
```
@y
  # Disable skills entirely.
  none:
    skills: false
```
@z

@x
A name that doesn't match any discovered skill is logged as a warning at startup but is otherwise ignored.
@y
A name that doesn't match any discovered skill is logged as a warning at startup but is otherwise ignored.
@z

@x
## GitHub Skill Sources
@y
## GitHub Skill Sources
@z

@x
Load skills directly from a public GitHub repository, without installing Git or
an external skills CLI:
@y
Load skills directly from a public GitHub repository, without installing Git or
an external skills CLI:
@z

@x
```yaml
agents:
  root:
    model: openai/gpt-4o-mini
    skills:
      - local
      - https://github.com/docker/skills
    toolsets:
      - type: filesystem
      - type: shell
```
@y
```yaml
agents:
  root:
    model: openai/gpt-4o-mini
    skills:
      - local
      - https://github.com/docker/skills
    toolsets:
      - type: filesystem
      - type: shell
```
@z

@x
Repository URLs use the default branch. To select a branch, tag, commit SHA, or
subdirectory, use a GitHub tree URL or query parameters:
@y
Repository URLs use the default branch. To select a branch, tag, commit SHA, or
subdirectory, use a GitHub tree URL or query parameters:
@z

@x
```yaml
skills:
  - https://github.com/docker/skills/tree/main/skills
  # Alternative examples (use one source, not all of them):
  # - https://github.com/docker/skills?ref=v0.3.0
  # - https://github.com/docker/skills?ref=<full-40-character-commit-sha>
  # - https://github.com/owner/repo?ref=feature%2Fskills&path=skills
```
@y
```yaml
skills:
  - https://github.com/docker/skills/tree/main/skills
  # Alternative examples (use one source, not all of them):
  # - https://github.com/docker/skills?ref=v0.3.0
  # - https://github.com/docker/skills?ref=<full-40-character-commit-sha>
  # - https://github.com/owner/repo?ref=feature%2Fskills&path=skills
```
@z

@x
A tree URL treats the first segment after `/tree/` as the revision and the rest
as a directory. Use `?ref=...&path=...` for branch or tag names containing `/`, or
URL-escape the slash as `%2F`. Short commit hashes are resolved through the API;
use a full 40-character SHA for an immutable pin.
@y
A tree URL treats the first segment after `/tree/` as the revision and the rest
as a directory. Use `?ref=...&path=...` for branch or tag names containing `/`, or
URL-escape the slash as `%2F`. Short commit hashes are resolved through the API;
use a full 40-character SHA for an immutable pin.
@z

@x
Without a selected directory, discovery checks `skills/**/SKILL.md`, then
`.agents/skills/**/SKILL.md`, then a root `SKILL.md`, using the first layout
containing skills. An explicit directory is searched recursively without
fallback. Complete skill directories, including supporting files, are cached.
@y
Without a selected directory, discovery checks `skills/**/SKILL.md`, then
`.agents/skills/**/SKILL.md`, then a root `SKILL.md`, using the first layout
containing skills. An explicit directory is searched recursively without
fallback. Complete skill directories, including supporting files, are cached.
@z

@x
### Authentication and caching
@y
### Authentication and caching
@z

@x
Only **public repositories on github.com** are supported. The optional
`GITHUB_TOKEN` comes from the configured environment provider, including OS
environment variables, env files, and secrets. It raises GitHub API rate limits;
it is not required or prompted for, and does not enable private repositories.
The token is sent only to `api.github.com`, never to the archive host.
@y
Only **public repositories on github.com** are supported. The optional
`GITHUB_TOKEN` comes from the configured environment provider, including OS
environment variables, env files, and secrets. It raises GitHub API rate limits;
it is not required or prompted for, and does not enable private repositories.
The token is sent only to `api.github.com`, never to the archive host.
@z

@x
Default branches, named branches, and tags are resolved to a commit SHA and
cached for **five minutes**. Downloaded snapshots are immutable and cached by
repository, SHA, and directory. A warm load makes no network requests; after
five minutes mutable revisions are checked again. A full-SHA source needs no
further network requests once cached. All files come from the same commit.
@y
Default branches, named branches, and tags are resolved to a commit SHA and
cached for **five minutes**. Downloaded snapshots are immutable and cached by
repository, SHA, and directory. A warm load makes no network requests; after
five minutes mutable revisions are checked again. A full-SHA source needs no
further network requests once cached. All files come from the same commit.
@z

@x
Archives are fetched from `codeload.github.com`. Downloads are bounded to 32 MiB
compressed, 128 MiB expanded, and 4,096 selected files, with a 1 MiB limit per
skill file and 32 MiB total selected content. Failed downloads never publish a
partial snapshot; source failures appear as load-time warnings. Expired mutable
revisions are not silently reused on network errors.
@y
Archives are fetched from `codeload.github.com`. Downloads are bounded to 32 MiB
compressed, 128 MiB expanded, and 4,096 selected files, with a 1 MiB limit per
skill file and 32 MiB total selected content. Failed downloads never publish a
partial snapshot; source failures appear as load-time warnings. Expired mutable
revisions are not silently reused on network errors.
@z

@x
### Trust and sandbox behavior
@y
### Trust and sandbox behavior
@z

@x
Cached GitHub skills remain **remote**: embedded `` !`command` `` expressions are
not expanded. Remote frontmatter `model` and `toolsets` overrides are ignored.
Fork skills inherit the parent's model and tools, with `allowed-tools` able to
restrict inherited tools. Symlinks and other non-regular entries inside selected
skill directories are rejected; Git submodules are not fetched.
@y
Cached GitHub skills remain **remote**: embedded `` !`command` `` expressions are
not expanded. Remote frontmatter `model` and `toolsets` overrides are ignored.
Fork skills inherit the parent's model and tools, with `allowed-tools` able to
restrict inherited tools. Symlinks and other non-regular entries inside selected
skill directories are rejected; Git submodules are not fetched.
@z

@x
In sandbox mode, GitHub sources are fetched inside the VM rather than staged as
local skills. Permit network access to `api.github.com` and `codeload.github.com`
and make any optional token available through the sandbox's environment provider.
@y
In sandbox mode, GitHub sources are fetched inside the VM rather than staged as
local skills. Permit network access to `api.github.com` and `codeload.github.com`
and make any optional token available through the sandbox's environment provider.
@z

@x
See [`examples/skills_github.yaml`](https://github.com/docker/docker-agent/blob/main/examples/skills_github.yaml)
for a complete configuration.
@y
See [`examples/skills_github.yaml`](https://github.com/docker/docker-agent/blob/main/examples/skills_github.yaml)
for a complete configuration.
@z

@x
## Inline Skills
@y
## Inline Skills
@z

@x
Instead of (or alongside) loading skills from files and URLs, you can define skills directly in the agent config. An inline skill is a mapping item in the `skills` list, freely mixed with the string items above:
@y
Instead of (or alongside) loading skills from files and URLs, you can define skills directly in the agent config. An inline skill is a mapping item in the `skills` list, freely mixed with the string items above:
@z

@x
```yaml
agents:
  root:
    model: openai/gpt-4o
    instruction: You are a helpful assistant.
    skills:
      - name: changelog
        description: Write a concise changelog entry from a diff or description.
        instructions: |
          Produce a single changelog entry in Keep a Changelog style.
          Pick the right category (Added, Changed, Fixed, Removed) and write
          one imperative sentence summarising the user-visible change.
@y
```yaml
agents:
  root:
    model: openai/gpt-4o
    instruction: You are a helpful assistant.
    skills:
      - name: changelog
        description: Write a concise changelog entry from a diff or description.
        instructions: |
          Produce a single changelog entry in Keep a Changelog style.
          Pick the right category (Added, Changed, Fixed, Removed) and write
          one imperative sentence summarising the user-visible change.
@z

@x
      # A fork-mode inline skill runs in an isolated sub-agent.
      - name: triage
        description: Triage a bug report in an isolated context.
        context: fork
        instructions: |
          Restate the problem, list likely root causes most-probable-first,
          and propose the smallest reproduction and next concrete action.
@y
      # A fork-mode inline skill runs in an isolated sub-agent.
      - name: triage
        description: Triage a bug report in an isolated context.
        context: fork
        instructions: |
          Restate the problem, list likely root causes most-probable-first,
          and propose the smallest reproduction and next concrete action.
@z

@x
      # Inline skills mix freely with sources and name filters.
      - local
    toolsets:
      - type: filesystem
```
@y
      # Inline skills mix freely with sources and name filters.
      - local
    toolsets:
      - type: filesystem
```
@z

@x
Inline skills carry their body in the config itself, so they need no `SKILL.md` file and require no filesystem source. They are **always exposed** — the name filter only applies to file- and URL-based skills. An inline skill also **takes precedence** over a discovered skill of the same name: the config is explicit, whereas local skills are picked up from whatever happens to sit in the [search paths](#search-paths). The shadowed skill is dropped and a warning is logged at startup. Because inline skills travel inside the agent YAML, they also work in `--sandbox` mode without any kit staging, and they can be shared with the agent via `share push`.
@y
Inline skills carry their body in the config itself, so they need no `SKILL.md` file and require no filesystem source. They are **always exposed** — the name filter only applies to file- and URL-based skills. An inline skill also **takes precedence** over a discovered skill of the same name: the config is explicit, whereas local skills are picked up from whatever happens to sit in the [search paths](#search-paths). The shadowed skill is dropped and a warning is logged at startup. Because inline skills travel inside the agent YAML, they also work in `--sandbox` mode without any kit staging, and they can be shared with the agent via `share push`.
@z

@x
### Inline Skill Fields
@y
### Inline Skill Fields
@z

@x
| Field           | Required | Description                                                                |
| --------------- | -------- | -------------------------------------------------------------------------- |
| `name`          | Yes      | Skill identifier used by `read_skill` / `run_skill` and the `/<name>` command. Must not contain whitespace |
| `description`   | Yes      | Short description shown to the agent for skill matching                    |
| `instructions`  | Yes      | The skill body (what a `SKILL.md` would contain below its frontmatter)     |
| `context`       | No       | Set to `fork` to run the skill as an isolated sub-agent                    |
| `model`         | No       | Override the model used while running a fork-mode skill                    |
| `allowed_tools` | No       | For a fork-mode skill, restricts the sub-session to the parent tools whose names match an entry (glob or exact). See [Scoping a fork skill's tools](#scoping-a-fork-skills-tools). |
| `toolsets`      | No       | For a fork-mode skill, names of top-level [`toolsets`](../../configuration/overview/index.md#reusable-toolsets-toolsets) to expose in the sub-session on top of the inherited tools. |
@y
| Field           | Required | Description                                                                |
| --------------- | -------- | -------------------------------------------------------------------------- |
| `name`          | Yes      | Skill identifier used by `read_skill` / `run_skill` and the `/<name>` command. Must not contain whitespace |
| `description`   | Yes      | Short description shown to the agent for skill matching                    |
| `instructions`  | Yes      | The skill body (what a `SKILL.md` would contain below its frontmatter)     |
| `context`       | No       | Set to `fork` to run the skill as an isolated sub-agent                    |
| `model`         | No       | Override the model used while running a fork-mode skill                    |
| `allowed_tools` | No       | For a fork-mode skill, restricts the sub-session to the parent tools whose names match an entry (glob or exact). See [Scoping a fork skill's tools](#scoping-a-fork-skills-tools). |
| `toolsets`      | No       | For a fork-mode skill, names of top-level [`toolsets`](../../configuration/overview/index.md#reusable-toolsets-toolsets) to expose in the sub-session on top of the inherited tools. |
@z

@x
> [!NOTE]
> **Inline vs. file-based skills**
>
> Inline skills support the subset of the SKILL.md format that fits in YAML. They cannot bundle supporting files (no `read_skill_file`), so for skills that need bundled resources use a `SKILL.md` directory instead. They do support [embedded commands](#embedded-commands).
@y
> [!NOTE]
> **Inline vs. file-based skills**
>
> Inline skills support the subset of the SKILL.md format that fits in YAML. They cannot bundle supporting files (no `read_skill_file`), so for skills that need bundled resources use a `SKILL.md` directory instead. They do support [embedded commands](#embedded-commands).
@z

@x
## SKILL.md Format
@y
## SKILL.md Format
@z

@x
<!-- yaml-lint:skip -->
```yaml
---
name: create-dockerfile
description: Create optimized Dockerfiles for applications
license: Apache-2.0
metadata:
  author: my-org
  version: "1.0"
---
@y
<!-- yaml-lint:skip -->
```yaml
---
name: create-dockerfile
description: Create optimized Dockerfiles for applications
license: Apache-2.0
metadata:
  author: my-org
  version: "1.0"
---
@z

@x
# Creating Dockerfiles
@y
# Creating Dockerfiles
@z

@x
When asked to create a Dockerfile:
@y
When asked to create a Dockerfile:
@z

@x
1. Analyze the application type and language
2. Use multi-stage builds for compiled languages
3. Minimize image size by using slim base images
4. Follow security best practices (non-root user, etc.)
```
@y
1. Analyze the application type and language
2. Use multi-stage builds for compiled languages
3. Minimize image size by using slim base images
4. Follow security best practices (non-root user, etc.)
```
@z

@x
### Frontmatter Fields
@y
### Frontmatter Fields
@z

@x
| Field            | Required | Description                                                                 |
| ---------------- | -------- | --------------------------------------------------------------------------- |
| `name`           | Yes      | Unique skill identifier                                                     |
| `description`    | Yes      | Short description shown to the agent for skill matching                     |
| `context`        | No       | Set to `fork` to run the skill as an isolated sub-agent (see below)         |
| `model`          | No       | Override the model used while running the skill as a sub-agent (fork only)  |
| `allowed-tools`  | No       | For a fork-mode skill, restricts the sub-session to the parent tools whose names match an entry (YAML list or comma-separated string). See [Scoping a fork skill's tools](#scoping-a-fork-skills-tools). |
| `toolsets`       | No       | For a fork-mode skill, names of top-level [`toolsets`](../../configuration/overview/index.md#reusable-toolsets-toolsets) to expose in the sub-session (YAML list or comma-separated string). |
| `license`        | No       | License identifier (e.g. `Apache-2.0`)                                      |
| `compatibility`  | No       | Free-text compatibility notes                                               |
| `metadata`       | No       | Arbitrary key-value pairs (e.g. `author`, `version`)                        |
@y
| Field            | Required | Description                                                                 |
| ---------------- | -------- | --------------------------------------------------------------------------- |
| `name`           | Yes      | Unique skill identifier                                                     |
| `description`    | Yes      | Short description shown to the agent for skill matching                     |
| `context`        | No       | Set to `fork` to run the skill as an isolated sub-agent (see below)         |
| `model`          | No       | Override the model used while running the skill as a sub-agent (fork only)  |
| `allowed-tools`  | No       | For a fork-mode skill, restricts the sub-session to the parent tools whose names match an entry (YAML list or comma-separated string). See [Scoping a fork skill's tools](#scoping-a-fork-skills-tools). |
| `toolsets`       | No       | For a fork-mode skill, names of top-level [`toolsets`](../../configuration/overview/index.md#reusable-toolsets-toolsets) to expose in the sub-session (YAML list or comma-separated string). |
| `license`        | No       | License identifier (e.g. `Apache-2.0`)                                      |
| `compatibility`  | No       | Free-text compatibility notes                                               |
| `metadata`       | No       | Arbitrary key-value pairs (e.g. `author`, `version`)                        |
@z

@x
### Embedded Commands
@y
### Embedded Commands
@z

@x
A local skill — whether loaded from a `SKILL.md` file or [defined inline](#inline-skills) in the agent config — can inject the output of a command into its body with the `` !`command` `` syntax:
@y
A local skill — whether loaded from a `SKILL.md` file or [defined inline](#inline-skills) in the agent config — can inject the output of a command into its body with the `` !`command` `` syntax:
@z

@x
```markdown
Current branch: !`git branch --show-current`
```
@y
```markdown
Current branch: !`git branch --show-current`
```
@z

@x
These commands run on your machine, so commands loaded by the agent through
`read_skill` or `run_skill` are emitted as `shell` tool calls and go through the
normal approval policy — classification, permission rules and safety mode —
before they run. In practice that means a confirmation prompt unless the policy
already allows the command (an `allow` rule, autonomous mode, or a read-only
command under the balanced mode). Refusing a command leaves an error note in its
place; the rest of the skill is still loaded.
@y
These commands run on your machine, so commands loaded by the agent through
`read_skill` or `run_skill` are emitted as `shell` tool calls and go through the
normal approval policy — classification, permission rules and safety mode —
before they run. In practice that means a confirmation prompt unless the policy
already allows the command (an `allow` rule, autonomous mode, or a read-only
command under the balanced mode). Refusing a command leaves an error note in its
place; the rest of the skill is still loaded.
@z

@x
Expansion is skipped entirely for remote skills, whose body is fetched over the
network from a third party. It is also skipped when a skill is invoked directly
with `/<name>`: input resolution has no parent tool call to own an approval
prompt, so the commands are reported as skipped instead of running unannounced.
@y
Expansion is skipped entirely for remote skills, whose body is fetched over the
network from a third party. It is also skipped when a skill is invoked directly
with `/<name>`: input resolution has no parent tool call to own an approval
prompt, so the commands are reported as skipped instead of running unannounced.
@z

@x
> [!WARNING]
> An inline skill's commands come from the agent config itself, so an agent YAML
> you did not write — for example one pulled from a registry with
> `docker-agent run myorg/agent:tag` — can carry them. That config also chooses
> the agent's instructions, toolsets and `permissions` rules, so treat a
> third-party agent config as you would any other untrusted code and read it
> before running it.
@y
> [!WARNING]
> An inline skill's commands come from the agent config itself, so an agent YAML
> you did not write — for example one pulled from a registry with
> `docker-agent run myorg/agent:tag` — can carry them. That config also chooses
> the agent's instructions, toolsets and `permissions` rules, so treat a
> third-party agent config as you would any other untrusted code and read it
> before running it.
@z

@x
## Supporting Files
@y
## Supporting Files
@z

@x
Skills can bundle references, scripts, and other resources in their directory.
The `read_skill_file` tool reads these on demand using paths relative to that
skill's directory. Absolute paths and paths containing `..` are rejected.
Relative symlinks to files or directories inside the skill directory are allowed;
symlinks that escape it, and all absolute symlinks (even to internal targets),
are rejected. This boundary applies to supporting-file reads, not arbitrary
filesystem tools or commands.
@y
Skills can bundle references, scripts, and other resources in their directory.
The `read_skill_file` tool reads these on demand using paths relative to that
skill's directory. Absolute paths and paths containing `..` are rejected.
Relative symlinks to files or directories inside the skill directory are allowed;
symlinks that escape it, and all absolute symlinks (even to internal targets),
are rejected. This boundary applies to supporting-file reads, not arbitrary
filesystem tools or commands.
@z

@x
## Running a Skill as a Sub-Agent
@y
## Running a Skill as a Sub-Agent
@z

@x
By default, when an agent invokes a skill it reads the instructions inline into its own conversation. For complex, multi-step skills this can consume a large portion of the agent's context window and pollute the parent conversation with intermediate tool calls.
@y
By default, when an agent invokes a skill it reads the instructions inline into its own conversation. For complex, multi-step skills this can consume a large portion of the agent's context window and pollute the parent conversation with intermediate tool calls.
@z

@x
Adding `context: fork` to the SKILL.md frontmatter tells the agent to run the skill in an **isolated sub-agent** instead:
@y
Adding `context: fork` to the SKILL.md frontmatter tells the agent to run the skill in an **isolated sub-agent** instead:
@z

@x
<!-- yaml-lint:skip -->
```yaml
---
name: bump-go-dependencies
description: Update Go module dependencies one by one
context: fork
---
@y
<!-- yaml-lint:skip -->
```yaml
---
name: bump-go-dependencies
description: Update Go module dependencies one by one
context: fork
---
@z

@x
# Bump Dependencies
@y
# Bump Dependencies
@z

@x
1. List outdated deps
2. Update each one, run tests, commit or revert
3. Produce a summary table
```
@y
1. List outdated deps
2. Update each one, run tests, commit or revert
3. Produce a summary table
```
@z

@x
When the agent encounters a task that matches a `context: fork` skill, it uses the `run_skill` tool instead of `read_skill`. This:
@y
When the agent encounters a task that matches a `context: fork` skill, it uses the `run_skill` tool instead of `read_skill`. This:
@z

@x
- **Spawns a child session** with the skill content as the system prompt and the caller's task as the user message
- **Isolates the context window** — the sub-agent has its own conversation history, so lengthy tool-call chains don't eat into the parent's token budget
- **Folds the result** — only the sub-agent's final answer is returned to the parent as the tool result
- **Inherits the parent's model and tools** — the sub-agent can use all tools available to the parent agent (scope this with `allowed_tools` / `toolsets`, see [Scoping a fork skill's tools](#scoping-a-fork-skills-tools))
@y
- **Spawns a child session** with the skill content as the system prompt and the caller's task as the user message
- **Isolates the context window** — the sub-agent has its own conversation history, so lengthy tool-call chains don't eat into the parent's token budget
- **Folds the result** — only the sub-agent's final answer is returned to the parent as the tool result
- **Inherits the parent's model and tools** — the sub-agent can use all tools available to the parent agent (scope this with `allowed_tools` / `toolsets`, see [Scoping a fork skill's tools](#scoping-a-fork-skills-tools))
@z

@x
> [!TIP]
> **When to use context: fork**
>
> Use `context: fork` for skills that involve many steps, heavy tool usage, or that should not clutter the main conversation — for example dependency bumping, large refactors, or code generation pipelines.
@y
> [!TIP]
> **When to use context: fork**
>
> Use `context: fork` for skills that involve many steps, heavy tool usage, or that should not clutter the main conversation — for example dependency bumping, large refactors, or code generation pipelines.
@z

@x
### Overriding the model for a fork skill
@y
### Overriding the model for a fork skill
@z

@x
Fork skills can declare a `model` field in their frontmatter to use a
different model than the parent agent for the duration of the sub-session.
This is useful when a skill is best handled by a faster, cheaper, or more
specialised model — for example a powerful reasoning model for refactors,
or a fast model for routine bookkeeping work. The override only applies
while the skill is running; the parent agent keeps its own model.
@y
Fork skills can declare a `model` field in their frontmatter to use a
different model than the parent agent for the duration of the sub-session.
This is useful when a skill is best handled by a faster, cheaper, or more
specialised model — for example a powerful reasoning model for refactors,
or a fast model for routine bookkeeping work. The override only applies
while the skill is running; the parent agent keeps its own model.
@z

@x
The `model` value accepts either a named model from the agent config or
an inline `provider/model` reference (and the same comma-separated alloy
syntax as the rest of the agent config):
@y
The `model` value accepts either a named model from the agent config or
an inline `provider/model` reference (and the same comma-separated alloy
syntax as the rest of the agent config):
@z

@x
<!-- yaml-lint:skip -->
```yaml
---
name: bump-go-dependencies
description: Update Go module dependencies one by one
context: fork
model: openai/gpt-4o-mini
---
@y
<!-- yaml-lint:skip -->
```yaml
---
name: bump-go-dependencies
description: Update Go module dependencies one by one
context: fork
model: openai/gpt-4o-mini
---
@z

@x
# Bump Dependencies
@y
# Bump Dependencies
@z

@x
1. ...
```
@y
1. ...
```
@z

@x
If the model reference cannot be resolved (unknown name, missing
credentials, runtime not configured for model switching, …) the skill
falls back to the agent's currently-active model (its configured
default, or any override the user previously set via the model picker)
and a warning is logged.
@y
If the model reference cannot be resolved (unknown name, missing
credentials, runtime not configured for model switching, …) the skill
falls back to the agent's currently-active model (its configured
default, or any override the user previously set via the model picker)
and a warning is logged.
@z

@x
When the skill completes, the agent's previous model is restored — but
only if no one else changed the model in the meantime. If the user
switches the model via the TUI model picker while the fork skill is
running, their choice is preserved (the deferred restore becomes a
no-op).
@y
When the skill completes, the agent's previous model is restored — but
only if no one else changed the model in the meantime. If the user
switches the model via the TUI model picker while the fork skill is
running, their choice is preserved (the deferred restore becomes a
no-op).
@z

@x
### Scoping a fork skill's tools
@y
### Scoping a fork skill's tools
@z

@x
By default a fork skill inherits the parent agent's entire tool set. Two
optional fields let you scope what the sub-session can use. Both apply
**only to fork-mode skills** and work the same whether the skill is
inline or loaded from a `SKILL.md` file.
@y
By default a fork skill inherits the parent agent's entire tool set. Two
optional fields let you scope what the sub-session can use. Both apply
**only to fork-mode skills** and work the same whether the skill is
inline or loaded from a `SKILL.md` file.
@z

@x
`allowed_tools` (frontmatter: `allowed-tools`) is an **allow-list** over
the inherited tools: only tools whose names match an entry are kept,
everything else is hidden from the sub-session. Entries support glob
patterns (e.g. `read_*`) and otherwise match exactly. This is the
Claude-Code-compatible `allowed-tools` field, now enforced for fork
skills rather than merely recorded.
@y
`allowed_tools` (frontmatter: `allowed-tools`) is an **allow-list** over
the inherited tools: only tools whose names match an entry are kept,
everything else is hidden from the sub-session. Entries support glob
patterns (e.g. `read_*`) and otherwise match exactly. This is the
Claude-Code-compatible `allowed-tools` field, now enforced for fork
skills rather than merely recorded.
@z

@x
`toolsets` references reusable [top-level toolsets](../../configuration/overview/index.md#reusable-toolsets-toolsets)
by name. The referenced toolsets are exposed in the sub-session **in
addition to** the inherited tools, and they bypass the `allowed_tools`
filter (the skill explicitly asked for them).
@y
`toolsets` references reusable [top-level toolsets](../../configuration/overview/index.md#reusable-toolsets-toolsets)
by name. The referenced toolsets are exposed in the sub-session **in
addition to** the inherited tools, and they bypass the `allowed_tools`
filter (the skill explicitly asked for them).
@z

@x
```yaml
toolsets:
  web:
    type: fetch
@y
```yaml
toolsets:
  web:
    type: fetch
@z

@x
agents:
  root:
    model: openai/gpt-4o
    instruction: You are a helpful assistant.
    toolsets:
      - type: filesystem
      - type: shell
    skills:
      # Inherits the parent tools but is restricted to read-only filesystem
      # access while it runs — shell and write tools are hidden.
      - name: audit
        description: Review the repository layout without modifying anything.
        context: fork
        allowed_tools:
          - read_file
          - list_directory
          - directory_tree
        instructions: Inspect the repository structure and summarise it.
@y
agents:
  root:
    model: openai/gpt-4o
    instruction: You are a helpful assistant.
    toolsets:
      - type: filesystem
      - type: shell
    skills:
      # Inherits the parent tools but is restricted to read-only filesystem
      # access while it runs — shell and write tools are hidden.
      - name: audit
        description: Review the repository layout without modifying anything.
        context: fork
        allowed_tools:
          - read_file
          - list_directory
          - directory_tree
        instructions: Inspect the repository structure and summarise it.
@z

@x
      # Brings in the top-level `web` toolset on top of the parent's tools.
      - name: research
        description: Research a topic using web fetches in an isolated context.
        context: fork
        toolsets:
          - web
        instructions: Research the requested topic and summarise with links.
```
@y
      # Brings in the top-level `web` toolset on top of the parent's tools.
      - name: research
        description: Research a topic using web fetches in an isolated context.
        context: fork
        toolsets:
          - web
        instructions: Research the requested topic and summarise with links.
```
@z

@x
The equivalent in a `SKILL.md` file uses frontmatter lists:
@y
The equivalent in a `SKILL.md` file uses frontmatter lists:
@z

@x
<!-- yaml-lint:skip -->
```yaml
---
name: research
description: Research a topic using web fetches
context: fork
allowed-tools:
  - fetch
toolsets:
  - web
---
```
@y
<!-- yaml-lint:skip -->
```yaml
---
name: research
description: Research a topic using web fetches
context: fork
allowed-tools:
  - fetch
toolsets:
  - web
---
```
@z

@x
> [!NOTE]
> **Fork only**
>
> Both fields are rejected by config validation when set on a non-fork skill, and a `toolsets` entry that doesn't resolve to a top-level toolset is a load-time error.
@y
> [!NOTE]
> **Fork only**
>
> Both fields are rejected by config validation when set on a non-fork skill, and a `toolsets` entry that doesn't resolve to a top-level toolset is a load-time error.
@z

@x
## Search Paths
@y
## Search Paths
@z

@x
Skills are discovered from these locations (later overrides earlier):
@y
Skills are discovered from these locations (later overrides earlier):
@z

@x
### Global
@y
### Global
@z

@x
| Path                | Search Type                             |
| ------------------- | --------------------------------------- |
| `~/.codex/skills/`  | Recursive (searches all subdirectories) |
| `~/.claude/skills/` | Flat (immediate children only)          |
| `~/.agents/skills/` | Recursive (searches all subdirectories) |
@y
| Path                | Search Type                             |
| ------------------- | --------------------------------------- |
| `~/.codex/skills/`  | Recursive (searches all subdirectories) |
| `~/.claude/skills/` | Flat (immediate children only)          |
| `~/.agents/skills/` | Recursive (searches all subdirectories) |
@z

@x
### Project (from git root to current directory)
@y
### Project (from git root to current directory)
@z

@x
| Path              | Search Type                                |
| ----------------- | ------------------------------------------ |
| `.claude/skills/` | Flat (cwd only)                            |
| `.github/skills/` | Flat (each directory from git root to cwd) |
| `.agents/skills/` | Flat (each directory from git root to cwd) |
@y
| Path              | Search Type                                |
| ----------------- | ------------------------------------------ |
| `.claude/skills/` | Flat (cwd only)                            |
| `.github/skills/` | Flat (each directory from git root to cwd) |
| `.agents/skills/` | Flat (each directory from git root to cwd) |
@z

@x
## Invoking Skills
@y
## Invoking Skills
@z

@x
Skills can be invoked in multiple ways:
@y
Skills can be invoked in multiple ways:
@z

@x
- **Automatic:** The agent detects when your request matches a skill's description and loads it automatically
- **Explicit:** Reference the skill name in your prompt: "Use the create-dockerfile skill to..."
- **Slash command:** Use `/{skill-name}` to invoke a skill directly
@y
- **Automatic:** The agent detects when your request matches a skill's description and loads it automatically
- **Explicit:** Reference the skill name in your prompt: "Use the create-dockerfile skill to..."
- **Slash command:** Use `/{skill-name}` to invoke a skill directly
@z

@x
```bash
# In the TUI, invoke skill directly:
/create-dockerfile
@y
```bash
# In the TUI, invoke skill directly:
/create-dockerfile
@z

@x
# Or mention it in your message:
"Create a dockerfile for my Python app (use the create-dockerfile skill)"
```
@y
# Or mention it in your message:
"Create a dockerfile for my Python app (use the create-dockerfile skill)"
```
@z

@x
## Precedence
@y
## Precedence
@z

@x
When multiple skills share the same name:
@y
When multiple skills share the same name:
@z

@x
1. Global skills load first
2. Project skills load next, from git root toward current directory
3. Skills closer to the current directory override those further away
4. At the same directory level, `.agents/skills/` overrides `.github/skills/`
5. An [inline skill](#inline-skills) overrides any discovered skill of the same name
@y
1. Global skills load first
2. Project skills load next, from git root toward current directory
3. Skills closer to the current directory override those further away
4. At the same directory level, `.agents/skills/` overrides `.github/skills/`
5. An [inline skill](#inline-skills) overrides any discovered skill of the same name
@z

@x
## Skills in Sandbox Mode
@y
## Skills in Sandbox Mode
@z

@x
When you run an agent with [`--sandbox`](../../configuration/sandbox/index.md), the sandbox VM has its own filesystem with no access to your host's skill directories. Docker Agent handles this transparently via the [auto-kit](../../configuration/sandbox/index.md#auto-kit): every discovered local skill is staged into a per-agent kit on the host, run through best-effort secret redaction (see the [auto-kit](../../configuration/sandbox/index.md#secret-redaction) docs), and bind-mounted read-only into the sandbox so the agent sees the same skills inside the VM as on the host. No configuration is required — use `--no-kit` only if you explicitly want to run the sandbox without any host skills.
@y
When you run an agent with [`--sandbox`](../../configuration/sandbox/index.md), the sandbox VM has its own filesystem with no access to your host's skill directories. Docker Agent handles this transparently via the [auto-kit](../../configuration/sandbox/index.md#auto-kit): every discovered local skill is staged into a per-agent kit on the host, run through best-effort secret redaction (see the [auto-kit](../../configuration/sandbox/index.md#secret-redaction) docs), and bind-mounted read-only into the sandbox so the agent sees the same skills inside the VM as on the host. No configuration is required — use `--no-kit` only if you explicitly want to run the sandbox without any host skills.
@z

@x
## Creating a Skill
@y
## Creating a Skill
@z

@x
```bash
# Create the skill directory
$ mkdir -p ~/.agents/skills/create-dockerfile
@y
```bash
# Create the skill directory
$ mkdir -p ~/.agents/skills/create-dockerfile
@z

@x
# Write the SKILL.md file
$ cat > ~/.agents/skills/create-dockerfile/SKILL.md << 'EOF'
---
name: create-dockerfile
description: Create optimized Dockerfiles for applications
---
@y
# Write the SKILL.md file
$ cat > ~/.agents/skills/create-dockerfile/SKILL.md << 'EOF'
---
name: create-dockerfile
description: Create optimized Dockerfiles for applications
---
@z

@x
# Creating Dockerfiles
@y
# Creating Dockerfiles
@z

@x
When asked to create a Dockerfile:
@y
When asked to create a Dockerfile:
@z

@x
1. Analyze the application type and language
2. Use multi-stage builds for compiled languages
3. Use slim base images to minimize size
4. Run as non-root user for security
EOF
```
@y
1. Analyze the application type and language
2. Use multi-stage builds for compiled languages
3. Use slim base images to minimize size
4. Run as non-root user for security
EOF
```
@z

@x
The skill will automatically be available to any agent with skills enabled (`skills: true`, or a list that targets its name — see [Filtering Skills](#filtering-skills)).
@y
The skill will automatically be available to any agent with skills enabled (`skills: true`, or a list that targets its name — see [Filtering Skills](#filtering-skills)).
@z

@x
> [!NOTE]
> **See also**
>
> Skills are enabled in the [Agent Config](../../configuration/agents/index.md) with the `skills` property (boolean or list). For tool-based capabilities, see [Tools](../../concepts/tools/index.md).
>
> Example configs: [`examples/skills_inline.yaml`](https://github.com/docker/docker-agent/blob/main/examples/skills_inline.yaml) (inline skill definition), [`examples/skills_fork_toolsets.yaml`](https://github.com/docker/docker-agent/blob/main/examples/skills_fork_toolsets.yaml) (scoping a fork skill's tools), [`examples/skills_filter.yaml`](https://github.com/docker/docker-agent/blob/main/examples/skills_filter.yaml) (filtering which skills load).
@y
> [!NOTE]
> **See also**
>
> Skills are enabled in the [Agent Config](../../configuration/agents/index.md) with the `skills` property (boolean or list). For tool-based capabilities, see [Tools](../../concepts/tools/index.md).
>
> Example configs: [`examples/skills_inline.yaml`](https://github.com/docker/docker-agent/blob/main/examples/skills_inline.yaml) (inline skill definition), [`examples/skills_fork_toolsets.yaml`](https://github.com/docker/docker-agent/blob/main/examples/skills_fork_toolsets.yaml) (scoping a fork skill's tools), [`examples/skills_filter.yaml`](https://github.com/docker/docker-agent/blob/main/examples/skills_filter.yaml) (filtering which skills load).
@z

@x
### Screening skill content
@y
### Screening skill content
@z

@x
Configure [`skill_content_guard`](../../configuration/hooks/index.md#skill-content-guard)
to reject unsafe skill text before command expansion or delivery, including
forked skills, slash commands, and supporting-file reads. Model judges use the
built-in `guard_decision` schema; failures reject the load in every safety mode.
This checks skill-loader reads, not arbitrary filesystem access or skill
metadata, and does not replace tool permissions or sandboxing.
@y
Configure [`skill_content_guard`](../../configuration/hooks/index.md#skill-content-guard)
to reject unsafe skill text before command expansion or delivery, including
forked skills, slash commands, and supporting-file reads. Model judges use the
built-in `guard_decision` schema; failures reject the load in every safety mode.
This checks skill-loader reads, not arbitrary filesystem access or skill
metadata, and does not replace tool permissions or sandboxing.
@z

@x
Handoffs inside a forked skill stay within that fork: explicit `handoff` and
configured `force_handoff` can select another agent without changing the parent
conversation's active agent. Background sessions remain hard-pinned and reject
explicit handoffs.
@y
Handoffs inside a forked skill stay within that fork: explicit `handoff` and
configured `force_handoff` can select another agent without changing the parent
conversation's active agent. Background sessions remain hard-pinned and reject
explicit handoffs.
@z
