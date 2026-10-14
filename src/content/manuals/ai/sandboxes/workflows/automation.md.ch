%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Run sandboxes in CI
linkTitle: CI and headless
@y
title: Run sandboxes in CI
linkTitle: CI and headless
@z

@x
description: Authenticate and run Docker Sandboxes in CI systems and other headless environments.
keywords: docker sandboxes, sbx, ci, headless, automation, personal access token
@y
description: Authenticate and run Docker Sandboxes in CI systems and other headless environments.
keywords: docker sandboxes, sbx, ci, headless, automation, personal access token
@z

@x
This page describes local sandboxes in CI. For cloud execution without local
virtualization, see [Run without attaching](../cloud/usage.md#run-without-attaching).
@y
This page describes local sandboxes in CI. For cloud execution without local
virtualization, see [Run without attaching](../cloud/usage.md#run-without-attaching).
@z

@x
For CI environments and scripts where a browser isn't available, authenticate
with a Docker Personal Access Token (PAT):
@y
For CI environments and scripts where a browser isn't available, authenticate
with a Docker Personal Access Token (PAT):
@z

@x
```console
$ echo "$DOCKER_PAT" | sbx login --username <your-docker-id> --password-stdin
```
@y
```console
$ echo "$DOCKER_PAT" | sbx login --username <your-docker-id> --password-stdin
```
@z

@x
Generate a PAT from your
[Docker account settings](https://app.docker.com/settings/personal-access-tokens)
with at least **Read** scope.
@y
Generate a PAT from your
[Docker account settings](https://app.docker.com/settings/personal-access-tokens)
with at least **Read** scope.
@z

@x
Sign in before running commands that require authentication. Read-only commands
and commands run with `--force` do not open an interactive sign-in flow.
Create workspace directories before calling `sbx create` or `sbx run`: without
a terminal, these commands fail if a workspace directory does not exist.
@y
Sign in before running commands that require authentication. Read-only commands
and commands run with `--force` do not open an interactive sign-in flow.
Create workspace directories before calling `sbx create` or `sbx run`: without
a terminal, these commands fail if a workspace directory does not exist.
@z

@x
Create the sandbox in the background with `sbx create`, run agent tasks with
`sbx exec`, and remove the sandbox when finished:
@y
Create the sandbox in the background with `sbx create`, run agent tasks with
`sbx exec`, and remove the sandbox when finished:
@z

@x
```console
$ sbx create --name ci-task --clone claude .
$ sbx exec ci-task -- claude --dangerously-skip-permissions -p "Review the code and commit your changes"
$ git fetch sandbox-ci-task
$ sbx rm --force ci-task
```
@y
```console
$ sbx create --name ci-task --clone claude .
$ sbx exec ci-task -- claude --dangerously-skip-permissions -p "Review the code and commit your changes"
$ git fetch sandbox-ci-task
$ sbx rm --force ci-task
```
@z

@x
Agent credentials (API keys, GitHub token) can be preconfigured as global
secrets so they're available to any sandbox the CI runner creates. If the
relevant environment variables are already set in the CI environment (see the
[built-in services table](../configuration/credentials.md#built-in-services) for which
variables each service reads), import them all at once:
@y
Agent credentials (API keys, GitHub token) can be preconfigured as global
secrets so they're available to any sandbox the CI runner creates. If the
relevant environment variables are already set in the CI environment (see the
[built-in services table](../configuration/credentials.md#built-in-services) for which
variables each service reads), import them all at once:
@z

@x
```console
$ sbx secret import --all
```
@y
```console
$ sbx secret import --all
```
@z

@x
To overwrite an existing stored entry, add `--force`. To pass a value from your
CI provider's secret store, use `-t`. For example, in a GitHub Actions step:
@y
To overwrite an existing stored entry, add `--force`. To pass a value from your
CI provider's secret store, use `-t`. For example, in a GitHub Actions step:
@z

@x
```yaml
- run: sbx secret set anthropic --force -t "${{ secrets.ANTHROPIC_API_KEY }}"
```
@y
```yaml
- run: sbx secret set anthropic --force -t "${{ secrets.ANTHROPIC_API_KEY }}"
```
@z

@x
## Cleanup and exit codes
@y
## Cleanup and exit codes
@z

@x
Confirmations require terminal input. Piping an answer, such as `echo y`, does
not confirm an operation. Use `--force` on commands that provide it to skip
confirmation in scripts. `sbx kit builder history rm` uses `--yes` or `-y`
instead, because its `--force` flag is passed to Buildx.
@y
Confirmations require terminal input. Piping an answer, such as `echo y`, does
not confirm an operation. Use `--force` on commands that provide it to skip
confirmation in scripts. `sbx kit builder history rm` uses `--yes` or `-y`
instead, because its `--force` flag is passed to Buildx.
@z

@x
A command that requires confirmation fails with exit status 1 when stdin is
not a terminal. Declining a confirmation also returns a non-zero exit code.
Treat this as an incomplete operation when deciding whether to continue a
script.
@y
A command that requires confirmation fails with exit status 1 when stdin is
not a terminal. Declining a confirmation also returns a non-zero exit code.
Treat this as an incomplete operation when deciding whether to continue a
script.
@z

@x
For repeatable cleanup, check which resources exist before removing them. For
example, use `sbx mcp ls` before `sbx mcp rm`, which fails for an unregistered
server even with `--force`.
@y
For repeatable cleanup, check which resources exist before removing them. For
example, use `sbx mcp ls` before `sbx mcp rm`, which fails for an unregistered
server even with `--force`.
@z

@x
## Parse command output
@y
## Parse command output
@z

@x
Use `--format json` or `--format yaml` on commands that support structured
output. Human-readable tables and messages can change between releases.
Results go to stdout. Errors, warnings, hints, and progress go to stderr.
@y
Use `--format json` or `--format yaml` on commands that support structured
output. Human-readable tables and messages can change between releases.
Results go to stdout. Errors, warnings, hints, and progress go to stderr.
@z

@x
```console
$ sbx ls --json | jq -r '.[].name'
$ sbx prune --dry-run --format yaml
```
@y
```console
$ sbx ls --json | jq -r '.[].name'
$ sbx prune --dry-run --format yaml
```
@z

@x
`--json` is an alias for `--format json`. On commands with shared output flags,
`--format`, `--json`, and `--quiet` (`-q`) are mutually exclusive, even when
`--json` and `--format json` request the same format. Unsupported format values
are rejected. `sbx events --json` emits newline-delimited JSON, and
`sbx mcp auth --format text|json` uses command-specific formats.
@y
`--json` is an alias for `--format json`. On commands with shared output flags,
`--format`, `--json`, and `--quiet` (`-q`) are mutually exclusive, even when
`--json` and `--format json` request the same format. Unsupported format values
are rejected. `sbx events --json` emits newline-delimited JSON, and
`sbx mcp auth --format text|json` uses command-specific formats.
@z

@x
### Update scripts for v0.48.0
@y
### Update scripts for v0.48.0
@z

@x
{{< copy-as-prompt instruction="Update this repository's Docker Sandboxes CLI usage for v0.48.0 using the migration reference below. Inspect scripts and documentation, update affected commands and output parsers, and verify the changes. Preserve unrelated behavior." >}}
@y
{{< copy-as-prompt instruction="Update this repository's Docker Sandboxes CLI usage for v0.48.0 using the migration reference below. Inspect scripts and documentation, update affected commands and output parsers, and verify the changes. Preserve unrelated behavior." >}}
@z

@x
Docker Sandboxes v0.48.0 changes flags and structured output. Update scripts
that use the following flags:
@y
Docker Sandboxes v0.48.0 changes flags and structured output. Update scripts
that use the following flags:
@z

@x
| Command | Previous flag | Replacement |
| --- | --- | --- |
| `sbx run`, `sbx env run` | `--detached` | `--detach` or `-d` |
| `sbx logout` | `--yes`, `-y` | `--force` or `-f` |
| `sbx env create`, `sbx env run` | `--auto-approve`, `-y` | `--force` or `-f` |
| `sbx create` | `--quiet`, `-q` | `--no-progress` suppresses progress but still prints the creation summary |
| `sbx template save` | `-d` for a description | `--description` |
| `sbx diagnose` | `--output`, `-o` | `--format table`, `json`, `yaml`, or `github-issue` |
| `sbx policy log` | `--quiet`, `-q` | Removed without a replacement |
@y
| Command | Previous flag | Replacement |
| --- | --- | --- |
| `sbx run`, `sbx env run` | `--detached` | `--detach` or `-d` |
| `sbx logout` | `--yes`, `-y` | `--force` or `-f` |
| `sbx env create`, `sbx env run` | `--auto-approve`, `-y` | `--force` or `-f` |
| `sbx create` | `--quiet`, `-q` | `--no-progress` suppresses progress but still prints the creation summary |
| `sbx template save` | `-d` for a description | `--description` |
| `sbx diagnose` | `--output`, `-o` | `--format table`, `json`, `yaml`, or `github-issue` |
| `sbx policy log` | `--quiet`, `-q` | Removed without a replacement |
@z

@x
`sbx settings ls` is the primary command spelling. `sbx settings list` remains
an alias. Replace the deprecated `sbx mcp add --skip_auth` with `--skip-auth`.
Secret commands that default to global scope still accept the deprecated
`--global` flag but print a warning to stderr. Omit the flag for those commands.
@y
`sbx settings ls` is the primary command spelling. `sbx settings list` remains
an alias. Replace the deprecated `sbx mcp add --skip_auth` with `--skip-auth`.
Secret commands that default to global scope still accept the deprecated
`--global` flag but print a warning to stderr. Omit the flag for those commands.
@z

@x
JSON field names use `snake_case`. YAML uses the same representation. Update
parsers for these commands:
@y
JSON field names use `snake_case`. YAML uses the same representation. Update
parsers for these commands:
@z

@x
| Command | Structured output in v0.48.0 |
| --- | --- |
| `sbx ls` | A sandbox array, replacing `{sandboxes: [...]}`. `created_at` and `last_used_at` use RFC 3339 timestamps. Rows include `detached`. |
| `sbx template ls` | An image array, replacing `{images: [...]}`. |
| Local `sbx mcp ls` | A server array, replacing `{gateway: {...}, servers: [...]}`. Each row includes `gateway`. Cloud rows describe server usage across sandboxes and differ from local registration rows. |
| `sbx policy log` | `{updated_at, allowed: [...], blocked: [...]}` for local and cloud output. See [Monitoring traffic](/manuals/ai/sandboxes/governance/monitor-and-enforce/monitoring.md#monitoring-traffic). |
| `sbx --cloud policy ls` | Field names use `snake_case` instead of camelCase. |
| `sbx ports` | Local rows contain `host_ip`, `host_port`, `sandbox_port`, and `protocol`. Cloud rows contain `sandbox_port` and `url`, replacing `port`. Local publish and unpublish results include `action: published` or `action: unpublished`. |
| Cloud `sbx volume create`, `sbx volume ls`, `sbx volume inspect` | Fields such as `ID`, `Name`, and `CreatedAt` become `id`, `name`, and `created_at`. `volume inspect` defaults to human-readable details, so request a structured format explicitly. |
| `sbx rm`, `sbx stop`, `sbx template rm`, `sbx volume rm` | An array of results with `action`, `resource`, `name`, and optional `id` and `error`, including missing or failed targets. Actions are lowercase: `removed`, `stopped`, `removing`, `stopping`, or `failed`. |
@y
| Command | Structured output in v0.48.0 |
| --- | --- |
| `sbx ls` | A sandbox array, replacing `{sandboxes: [...]}`. `created_at` and `last_used_at` use RFC 3339 timestamps. Rows include `detached`. |
| `sbx template ls` | An image array, replacing `{images: [...]}`. |
| Local `sbx mcp ls` | A server array, replacing `{gateway: {...}, servers: [...]}`. Each row includes `gateway`. Cloud rows describe server usage across sandboxes and differ from local registration rows. |
| `sbx policy log` | `{updated_at, allowed: [...], blocked: [...]}` for local and cloud output. See [Monitoring traffic](manuals/ai/sandboxes/governance/monitor-and-enforce/monitoring.md#monitoring-traffic). |
| `sbx --cloud policy ls` | Field names use `snake_case` instead of camelCase. |
| `sbx ports` | Local rows contain `host_ip`, `host_port`, `sandbox_port`, and `protocol`. Cloud rows contain `sandbox_port` and `url`, replacing `port`. Local publish and unpublish results include `action: published` or `action: unpublished`. |
| Cloud `sbx volume create`, `sbx volume ls`, `sbx volume inspect` | Fields such as `ID`, `Name`, and `CreatedAt` become `id`, `name`, and `created_at`. `volume inspect` defaults to human-readable details, so request a structured format explicitly. |
| `sbx rm`, `sbx stop`, `sbx template rm`, `sbx volume rm` | An array of results with `action`, `resource`, `name`, and optional `id` and `error`, including missing or failed targets. Actions are lowercase: `removed`, `stopped`, `removing`, `stopping`, or `failed`. |
@z

@x
For example, replace the jq filter `.sandboxes[].name` with `.[].name` when
extracting sandbox names from `sbx ls --json`.
@y
For example, replace the jq filter `.sandboxes[].name` with `.[].name` when
extracting sandbox names from `sbx ls --json`.
@z

@x
{{< /copy-as-prompt >}}
@y
{{< /copy-as-prompt >}}
@z
