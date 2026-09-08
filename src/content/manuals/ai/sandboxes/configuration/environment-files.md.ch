%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Sandbox environment files
linkTitle: Environment files
@y
title: Sandbox environment files
linkTitle: Environment files
@z

@x
description: Use a declarative .sbxenv.yaml file to describe and share your sandbox configuration.
keywords:
  - docker sandboxes
  - sbx env
  - sbxenv
  - environment file
  - sandbox configuration
  - declarative
@y
description: Use a declarative .sbxenv.yaml file to describe and share your sandbox configuration.
keywords:
  - docker sandboxes
  - sbx env
  - sbxenv
  - environment file
  - sandbox configuration
  - declarative
@z

@x
      text: Experimental
@y
      text: 試験的
@z

@x
A sandbox environment file captures the setup for a project in a
`.sbxenv.yaml` file. Share the file with project contributors so they use the
same agent, tools, resources, and credentials without reproducing CLI flags and
setup steps.
@y
A sandbox environment file captures the setup for a project in a
`.sbxenv.yaml` file. Share the file with project contributors so they use the
same agent, tools, resources, and credentials without reproducing CLI flags and
setup steps.
@z

@x
> [!NOTE]
> `sbx env` requires `sbx` 0.39.0 or later. The feature is experimental, so the
> command interface and file format may change in future releases.
@y
> [!NOTE]
> `sbx env` requires `sbx` 0.39.0 or later. The feature is experimental, so the
> command interface and file format may change in future releases.
@z

@x
## Start an environment
@y
## Start an environment
@z

@x
Keep the environment file outside the directories you mount into the sandbox.
That includes the primary workspace and every `additionalWorkspaces` mount.
For example, place it beside your project:
@y
Keep the environment file outside the directories you mount into the sandbox.
That includes the primary workspace and every `additionalWorkspaces` mount.
For example, place it beside your project:
@z

@x
```text
web-app-env/
├── .sbxenv.yaml
└── web-app/
```
@y
```text
web-app-env/
├── .sbxenv.yaml
└── web-app/
```
@z

@x
Create `web-app-env/.sbxenv.yaml`. This example gives the agent a shared
environment variable and the Playwright browser-testing tools. It also
publishes the application's development port:
@y
Create `web-app-env/.sbxenv.yaml`. This example gives the agent a shared
environment variable and the Playwright browser-testing tools. It also
publishes the application's development port:
@z

@x
```yaml
schemaVersion: "1"
name: web-app
agent: claude
workspace: ./web-app
@y
```yaml
schemaVersion: "1"
name: web-app
agent: claude
workspace: ./web-app
@z

@x
kits:
  - docker.io/sbx/playwright-kit:latest
@y
kits:
  - docker.io/sbx/playwright-kit:latest
@z

@x
env:
  NODE_ENV: test
@y
env:
  NODE_ENV: test
@z

@x
ports:
  - sandbox: 3000
    host: 3000
```
@y
ports:
  - sandbox: 3000
    host: 3000
```
@z

@x
From `web-app-env`, run the environment:
@y
From `web-app-env`, run the environment:
@z

@x
```console
$ sbx env run
```
@y
```console
$ sbx env run
```
@z

@x
The `web-app` directory becomes the workspace, while `.sbxenv.yaml` remains
outside the sandbox. If the environment doesn't exist, `sbx` creates a sandbox
named `web-app`, installs Playwright and Chromium, and publishes sandbox port
`3000` on the host. It then attaches to the agent. Later runs attach to the
existing sandbox.
@y
The `web-app` directory becomes the workspace, while `.sbxenv.yaml` remains
outside the sandbox. If the environment doesn't exist, `sbx` creates a sandbox
named `web-app`, installs Playwright and Chromium, and publishes sandbox port
`3000` on the host. It then attaches to the agent. Later runs attach to the
existing sandbox.
@z

@x
This placement keeps the environment file outside the agent's writable
workspace. If you later add `additionalWorkspaces`, keep `.sbxenv.yaml`
outside those directories too. See the [`workspace` guidance](#workspace)
for details.
@y
This placement keeps the environment file outside the agent's writable
workspace. If you later add `additionalWorkspaces`, keep `.sbxenv.yaml`
outside those directories too. See the [`workspace` guidance](#workspace)
for details.
@z

@x
## Commands
@y
## Commands
@z

@x
| Command                                                                                 | Description                                                                                          |
| --------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| [`sbx env run`](/reference/cli/sbx/env/run/) `[PATH...]`                                | Creates the environment if needed, then attaches. Re-runs apply only [`env` and MCP changes](#update-an-environment). Remove and recreate for other changes |
| [`sbx env create`](/reference/cli/sbx/env/create/) `[PATH...]`                          | Creates the environment without attaching                                                            |
| [`sbx env exec`](/reference/cli/sbx/env/exec/) `[PATH...] -- COMMAND [ARG...]`           | Runs a command in an existing environment                                                            |
| [`sbx env rm`](/reference/cli/sbx/env/rm/) `[PATH...]`                                  | Removes the sandbox and its scoped credentials                                                       |
@y
| Command                                                                                 | Description                                                                                          |
| --------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| [`sbx env run`](__SUBDIR__/reference/cli/sbx/env/run/) `[PATH...]`                                | Creates the environment if needed, then attaches. Re-runs apply only [`env` and MCP changes](#update-an-environment). Remove and recreate for other changes |
| [`sbx env create`](__SUBDIR__/reference/cli/sbx/env/create/) `[PATH...]`                          | Creates the environment without attaching                                                            |
| [`sbx env exec`](__SUBDIR__/reference/cli/sbx/env/exec/) `[PATH...] -- COMMAND [ARG...]`           | Runs a command in an existing environment                                                            |
| [`sbx env rm`](__SUBDIR__/reference/cli/sbx/env/rm/) `[PATH...]`                                  | Removes the sandbox and its scoped credentials                                                       |
@z

@x
`PATH` can be a directory or a direct path to an environment file. When you
pass a directory, `sbx` reads `.sbxenv.yaml` and falls back to `.sbxenv.yml`.
With no path, `sbx` searches the working directory.
@y
`PATH` can be a directory or a direct path to an environment file. When you
pass a directory, `sbx` reads `.sbxenv.yaml` and falls back to `.sbxenv.yml`.
With no path, `sbx` searches the working directory.
@z

@x
Pass the same set of paths to each lifecycle command so they resolve the same
sandbox.
@y
Pass the same set of paths to each lifecycle command so they resolve the same
sandbox.
@z

@x
## Common workflows
@y
## Common workflows
@z

@x
The following examples combine environment file fields into configurations you
can adapt for a project.
@y
The following examples combine environment file fields into configurations you
can adapt for a project.
@z

@x
### Combine team defaults and personal settings
@y
### Combine team defaults and personal settings
@z

@x
Keep the shared configuration in a version-controlled environment directory
outside the mounted workspace. Put machine-specific settings in a file excluded
from version control. For example, commit `base.sbxenv.yaml` beside the
`web-app` directory:
@y
Keep the shared configuration in a version-controlled environment directory
outside the mounted workspace. Put machine-specific settings in a file excluded
from version control. For example, commit `base.sbxenv.yaml` beside the
`web-app` directory:
@z

@x
```yaml
schemaVersion: "1"
name: web-app
agent: claude
workspace: ./web-app
@y
```yaml
schemaVersion: "1"
name: web-app
agent: claude
workspace: ./web-app
@z

@x
env:
  NODE_ENV: development
@y
env:
  NODE_ENV: development
@z

@x
sandboxOptions:
  cpus: 4
  memory: 8g
```
@y
sandboxOptions:
  cpus: 4
  memory: 8g
```
@z

@x
Add `local.sbxenv.yaml` to `.gitignore`, then use it for personal settings:
@y
Add `local.sbxenv.yaml` to `.gitignore`, then use it for personal settings:
@z

@x
```yaml
env:
  LOG_LEVEL: debug
@y
```yaml
env:
  LOG_LEVEL: debug
@z

@x
sandboxOptions:
  memory: 12g
```
@y
sandboxOptions:
  memory: 12g
```
@z

@x
Pass both files in merge order:
@y
Pass both files in merge order:
@z

@x
```console
$ sbx env run base.sbxenv.yaml local.sbxenv.yaml
```
@y
```console
$ sbx env run base.sbxenv.yaml local.sbxenv.yaml
```
@z

@x
Nested mappings merge by key, lists concatenate, and values from later files
replace earlier scalar values. In this example, the sandbox has four CPUs,
12 GB of memory, and both environment variables. The first file controls the
base directory for relative workspace paths and the default sandbox name.
@y
Nested mappings merge by key, lists concatenate, and values from later files
replace earlier scalar values. In this example, the sandbox has four CPUs,
12 GB of memory, and both environment variables. The first file controls the
base directory for relative workspace paths and the default sandbox name.
@z

@x
### Work across multiple repositories
@y
### Work across multiple repositories
@z

@x
Mount related repositories alongside the primary project when the agent needs
to coordinate changes or consult shared code and documentation:
@y
Mount related repositories alongside the primary project when the agent needs
to coordinate changes or consult shared code and documentation:
@z

@x
```yaml
# .sbxenv.yaml in the directory above the repositories
schemaVersion: "1"
name: web-platform
agent: codex
@y
```yaml
# .sbxenv.yaml in the directory above the repositories
schemaVersion: "1"
name: web-platform
agent: codex
@z

@x
workspace: ./web-app
@y
workspace: ./web-app
@z

@x
additionalWorkspaces:
  - path: ./shared-components
  - path: ./architecture-docs
    readOnly: true
```
@y
additionalWorkspaces:
  - path: ./shared-components
  - path: ./architecture-docs
    readOnly: true
```
@z

@x
The agent starts in `web-app`, can modify `shared-components`, and can read
`architecture-docs` without changing it. The environment file stays outside all
three workspaces. Relative paths resolve from the directory of the first
environment file. Additional workspaces are mounted directly even when the
primary workspace uses clone mode.
@y
The agent starts in `web-app`, can modify `shared-components`, and can read
`architecture-docs` without changing it. The environment file stays outside all
three workspaces. Relative paths resolve from the directory of the first
environment file. Additional workspaces are mounted directly even when the
primary workspace uses clone mode.
@z

@x
### Reuse an environment in automation
@y
### Reuse an environment in automation
@z

@x
Use the same committed environment for interactive development and automated
tasks. Developers attach to the agent with `run`:
@y
Use the same committed environment for interactive development and automated
tasks. Developers attach to the agent with `run`:
@z

@x
```console
$ sbx env run
```
@y
```console
$ sbx env run
```
@z

@x
Automation can create the sandbox without attaching, run commands in it, and
remove it afterward:
@y
Automation can create the sandbox without attaching, run commands in it, and
remove it afterward:
@z

@x
```console
$ sbx env create
$ sbx env exec -- npm test
$ sbx env rm --force
```
@y
```console
$ sbx env create
$ sbx env exec -- npm test
$ sbx env rm --force
```
@z

@x
Commands and vault references under `secrets` resolve on the host, so the
automation runner must provide the referenced tools and authentication. The
secret values remain outside the environment file.
@y
Commands and vault references under `secrets` resolve on the host, so the
automation runner must provide the referenced tools and authentication. The
secret values remain outside the environment file.
@z

@x
## Update an environment
@y
## Update an environment
@z

@x
`sbx env run` starts and attaches to an existing sandbox without provisioning
its secrets and bindings again. For an existing sandbox, the command applies
changes to `env` to the new session and reconciles declared MCP servers. Changes
to workspaces, kits, ports, secrets, bindings, and `sandboxOptions` require you
to remove the environment with `sbx env rm` and create it again.
@y
`sbx env run` starts and attaches to an existing sandbox without provisioning
its secrets and bindings again. For an existing sandbox, the command applies
changes to `env` to the new session and reconciles declared MCP servers. Changes
to workspaces, kits, ports, secrets, bindings, and `sandboxOptions` require you
to remove the environment with `sbx env rm` and create it again.
@z

@x
## Remove an environment
@y
## Remove an environment
@z

@x
Secrets and registry credentials are sandbox-scoped. Credential bindings and
MCP server registrations are host-global and can be shared by multiple
sandboxes.
@y
Secrets and registry credentials are sandbox-scoped. Credential bindings and
MCP server registrations are host-global and can be shared by multiple
sandboxes.
@z

@x
`sbx env rm` removes the sandbox and its scoped credentials. Global credential
bindings remain unless you pass `--prune-bindings`. MCP registrations remain
available to other sandboxes.
@y
`sbx env rm` removes the sandbox and its scoped credentials. Global credential
bindings remain unless you pass `--prune-bindings`. MCP registrations remain
available to other sandboxes.
@z

@x
### Clean up after a failed create
@y
### Clean up after a failed create
@z

@x
Secret provisioning, binding updates, and MCP server registration occur before
the sandbox is created. If sandbox creation fails, scoped secrets remain, and
bindings and MCP registrations may also remain. Run `sbx env rm` with the same
paths to remove the scoped secrets. Pass `--prune-bindings` if you also want to
remove the declared global bindings. MCP registrations are host-global and
remain after cleanup.
@y
Secret provisioning, binding updates, and MCP server registration occur before
the sandbox is created. If sandbox creation fails, scoped secrets remain, and
bindings and MCP registrations may also remain. Run `sbx env rm` with the same
paths to remove the scoped secrets. Pass `--prune-bindings` if you also want to
remove the declared global bindings. MCP registrations are host-global and
remain after cleanup.
@z

@x
## File reference
@y
## File reference
@z

@x
The loader rejects unknown fields and unsupported schema versions.
@y
The loader rejects unknown fields and unsupported schema versions.
@z

@x
### Top-level fields
@y
### Top-level fields
@z

@x
| Field                  | Type             | Required | Default                        | Description                                                                     |
| ---------------------- | ---------------- | -------- | ------------------------------ | ------------------------------------------------------------------------------- |
| `schemaVersion`        | string           | Yes      | None                           | Schema version. The supported value is `"1"`                                   |
| `name`                 | string           | No       | `<agent>-<workspace-basename>` | Sandbox name                                                                    |
| `agent`                | string           | Yes      | None                           | Built-in agent or the name of an agent kit                                      |
| `kits`                 | list of strings  | No       | None                           | Kits to install at creation. See [`kits`](#kits)                                 |
| `workspace`            | string or object | No       | First file's directory         | Primary workspace. See [`workspace`](#workspace)                                |
| `additionalWorkspaces` | list             | No       | None                           | Extra directories to mount. See [`additionalWorkspaces`](#additionalworkspaces) |
| `env`                  | map of strings   | No       | None                           | Environment variables for the sandbox                                           |
| `sandboxOptions`       | object           | No       | None                           | Creation options. See [`sandboxOptions`](#sandboxoptions)                        |
| `secrets`              | map              | No       | None                           | Service credentials. See [`secrets`](#secrets)                                  |
| `bindings`             | map              | No       | None                           | Credential injection approvals. See [`bindings`](#bindings)                     |
| `registries`           | map              | No       | None                           | Registry pull credentials. See [`registries`](#registries)                      |
| `mcp`                  | object           | No       | None                           | MCP servers. See [`mcp`](#mcp)                                                  |
| `ports`                | list             | No       | None                           | Port mappings. See [`ports`](#ports)                                            |
@y
| Field                  | Type             | Required | Default                        | Description                                                                     |
| ---------------------- | ---------------- | -------- | ------------------------------ | ------------------------------------------------------------------------------- |
| `schemaVersion`        | string           | Yes      | None                           | Schema version. The supported value is `"1"`                                   |
| `name`                 | string           | No       | `<agent>-<workspace-basename>` | Sandbox name                                                                    |
| `agent`                | string           | Yes      | None                           | Built-in agent or the name of an agent kit                                      |
| `kits`                 | list of strings  | No       | None                           | Kits to install at creation. See [`kits`](#kits)                                 |
| `workspace`            | string or object | No       | First file's directory         | Primary workspace. See [`workspace`](#workspace)                                |
| `additionalWorkspaces` | list             | No       | None                           | Extra directories to mount. See [`additionalWorkspaces`](#additionalworkspaces) |
| `env`                  | map of strings   | No       | None                           | Environment variables for the sandbox                                           |
| `sandboxOptions`       | object           | No       | None                           | Creation options. See [`sandboxOptions`](#sandboxoptions)                        |
| `secrets`              | map              | No       | None                           | Service credentials. See [`secrets`](#secrets)                                  |
| `bindings`             | map              | No       | None                           | Credential injection approvals. See [`bindings`](#bindings)                     |
| `registries`           | map              | No       | None                           | Registry pull credentials. See [`registries`](#registries)                      |
| `mcp`                  | object           | No       | None                           | MCP servers. See [`mcp`](#mcp)                                                  |
| `ports`                | list             | No       | None                           | Port mappings. See [`ports`](#ports)                                            |
@z

@x
### `kits`
@y
### `kits`
@z

@x
`kits` accepts local directories, ZIP archives, OCI registry references, and
Git URLs prefixed with `git+https://` or `git+ssh://`. Kits can install tools,
configure the sandbox, and give the agent project-specific instructions. See
[Kits](../customize/kits.md) for details.
@y
`kits` accepts local directories, ZIP archives, OCI registry references, and
Git URLs prefixed with `git+https://` or `git+ssh://`. Kits can install tools,
configure the sandbox, and give the agent project-specific instructions. See
[Kits](../customize/kits.md) for details.
@z

@x
Remote kit sources must match the
[kit source allowlist](../customize/kits.md#restrict-kit-sources). Docker Hub is
allowed by default. To use Git kits from `docker/sbx-kits-contrib`, add its
source:
@y
Remote kit sources must match the
[kit source allowlist](../customize/kits.md#restrict-kit-sources). Docker Hub is
allowed by default. To use Git kits from `docker/sbx-kits-contrib`, add its
source:
@z

@x
```console
$ sbx settings set kit.allowedSources '["docker.io/","github.com/docker/"]'
```
@y
```console
$ sbx settings set kit.allowedSources '["docker.io/","github.com/docker/"]'
```
@z

@x
The setting replaces the complete allowlist, so include any existing sources
you want to keep. For reproducible setup, pin Git kits with the `ref` URL
parameter and OCI kits with an immutable tag or digest.
@y
The setting replaces the complete allowlist, so include any existing sources
you want to keep. For reproducible setup, pin Git kits with the `ref` URL
parameter and OCI kits with an immutable tag or digest.
@z

@x
### `workspace`
@y
### `workspace`
@z

@x
When specified as a string, `workspace` is the path. Use the object form for
clone mode:
@y
When specified as a string, `workspace` is the path. Use the object form for
clone mode:
@z

@x
> [!WARNING]
> With [direct mount](../security/isolation.md#direct-mount-default), the agent can
> modify every file in a workspace. If an environment file is inside a mounted
> workspace, the agent can change the file that controls later `sbx env`
> commands. Store environment files outside all direct-mounted workspaces,
> including every `additionalWorkspaces` mount.
> [Clone mode](../security/isolation.md#clone-mode) protects files in the primary
> repository, but additional workspaces remain direct-mounted.
@y
> [!WARNING]
> With [direct mount](../security/isolation.md#direct-mount-default), the agent can
> modify every file in a workspace. If an environment file is inside a mounted
> workspace, the agent can change the file that controls later `sbx env`
> commands. Store environment files outside all direct-mounted workspaces,
> including every `additionalWorkspaces` mount.
> [Clone mode](../security/isolation.md#clone-mode) protects files in the primary
> repository, but additional workspaces remain direct-mounted.
@z

@x
| Field   | Type    | Default                | Description                                                             |
| ------- | ------- | ---------------------- | ----------------------------------------------------------------------- |
| `path`  | string  | First file's directory | Workspace directory. Relative paths resolve from the first file         |
| `clone` | boolean | `false`                | Use a private clone, equivalent to `sbx create --clone`                  |
@y
| Field   | Type    | Default                | Description                                                             |
| ------- | ------- | ---------------------- | ----------------------------------------------------------------------- |
| `path`  | string  | First file's directory | Workspace directory. Relative paths resolve from the first file         |
| `clone` | boolean | `false`                | Use a private clone, equivalent to `sbx create --clone`                  |
@z

@x
You can override `workspace.clone` for one `create` or `run` invocation with
`--clone` or `--clone=false`.
@y
You can override `workspace.clone` for one `create` or `run` invocation with
`--clone` or `--clone=false`.
@z

@x
### `additionalWorkspaces`
@y
### `additionalWorkspaces`
@z

@x
Each additional workspace is mounted after the primary workspace. Relative
paths resolve from the directory of the first environment file.
@y
Each additional workspace is mounted after the primary workspace. Relative
paths resolve from the directory of the first environment file.
@z

@x
| Field      | Type    | Required | Default | Description                   |
| ---------- | ------- | -------- | ------- | ----------------------------- |
| `path`     | string  | Yes      | None    | Directory to mount            |
| `readOnly` | boolean | No       | `false` | Mount the directory read-only |
@y
| Field      | Type    | Required | Default | Description                   |
| ---------- | ------- | -------- | ------- | ----------------------------- |
| `path`     | string  | Yes      | None    | Directory to mount            |
| `readOnly` | boolean | No       | `false` | Mount the directory read-only |
@z

@x
### `sandboxOptions`
@y
### `sandboxOptions`
@z

@x
| Field        | Type    | Default  | Description                                                     |
| ------------ | ------- | -------- | --------------------------------------------------------------- |
| `template`   | string  | None     | Custom sandbox template image                                   |
| `memory`     | string  | None     | Memory limit, such as `8g` or `512m`                             |
| `cpus`       | integer | `0`      | Number of CPUs. `0` allocates all host CPUs                      |
| `pullPolicy` | string  | `always` | Image pull policy: `always`, `missing`, or `never`               |
| `profile`    | string  | None     | Governance profile name                                         |
@y
| Field        | Type    | Default  | Description                                                     |
| ------------ | ------- | -------- | --------------------------------------------------------------- |
| `template`   | string  | None     | Custom sandbox template image                                   |
| `memory`     | string  | None     | Memory limit, such as `8g` or `512m`                             |
| `cpus`       | integer | `0`      | Number of CPUs. `0` allocates all host CPUs                      |
| `pullPolicy` | string  | `always` | Image pull policy: `always`, `missing`, or `never`               |
| `profile`    | string  | None     | Governance profile name                                         |
@z

@x
### `secrets`
@y
### `secrets`
@z

@x
`secrets` maps service names to secret sources. Each entry must set exactly one
of `value`, `ref`, or `command`. The secret is stored at the sandbox scope when
the environment is created.
@y
`secrets` maps service names to secret sources. Each entry must set exactly one
of `value`, `ref`, or `command`. The secret is stored at the sandbox scope when
the environment is created.
@z

@x
| Field      | Type    | Default | Description                                                                  |
| ---------- | ------- | ------- | ---------------------------------------------------------------------------- |
| `value`    | string  | None    | Literal secret value                                                         |
| `ref`      | string  | None    | Vault URI, such as `op://Vault/Item/field`                                    |
| `command`  | string  | None    | Host shell command whose standard output becomes the secret                   |
| `refresh`  | string  | None    | Resolution policy for `ref` or `command`, such as `on-demand` or `55m`        |
| `backend`  | string  | Automatic | Resolver for `ref`: `sdk` or `cli`                                          |
| `noVerify` | boolean | `false` | Skip verifying that a `ref` or `command` resolves during provisioning          |
@y
| Field      | Type    | Default | Description                                                                  |
| ---------- | ------- | ------- | ---------------------------------------------------------------------------- |
| `value`    | string  | None    | Literal secret value                                                         |
| `ref`      | string  | None    | Vault URI, such as `op://Vault/Item/field`                                    |
| `command`  | string  | None    | Host shell command whose standard output becomes the secret                   |
| `refresh`  | string  | None    | Resolution policy for `ref` or `command`, such as `on-demand` or `55m`        |
| `backend`  | string  | Automatic | Resolver for `ref`: `sdk` or `cli`                                          |
| `noVerify` | boolean | `false` | Skip verifying that a `ref` or `command` resolves during provisioning          |
@z

@x
> [!WARNING]
> A literal `value` is visible to anyone with read access to the file. Use a
> vault URI with `ref` or obtain the value at runtime with `command`.
@y
> [!WARNING]
> A literal `value` is visible to anyone with read access to the file. Use a
> vault URI with `ref` or obtain the value at runtime with `command`.
@z

@x
```yaml
secrets:
  anthropic:
    ref: op://Private/Anthropic/api-key
    refresh: 55m
  github:
    command: gh auth token
```
@y
```yaml
secrets:
  anthropic:
    ref: op://Private/Anthropic/api-key
    refresh: 55m
  github:
    command: gh auth token
```
@z

@x
### `bindings`
@y
### `bindings`
@z

@x
`bindings` approves credential injection domains for each service. The
environment merges these approvals into the user's global
`credentials.yaml`. Each service can contain an `apiKey` block, an `oauth`
block, or both. Each block contains a `domains` list:
@y
`bindings` approves credential injection domains for each service. The
environment merges these approvals into the user's global
`credentials.yaml`. Each service can contain an `apiKey` block, an `oauth`
block, or both. Each block contains a `domains` list:
@z

@x
```yaml
bindings:
  github:
    apiKey:
      domains:
        - api.github.com
```
@y
```yaml
bindings:
  github:
    apiKey:
      domains:
        - api.github.com
```
@z

@x
`sbx env rm` preserves global bindings by default. Pass `--prune-bindings` to
remove every service binding declared by the environment file.
@y
`sbx env rm` preserves global bindings by default. Pass `--prune-bindings` to
remove every service binding declared by the environment file.
@z

@x
> [!WARNING]
> `--prune-bindings` deletes the complete global binding entry for every
> service declared in the environment file. This can affect other sandboxes
> that share those service bindings.
@y
> [!WARNING]
> `--prune-bindings` deletes the complete global binding entry for every
> service declared in the environment file. This can affect other sandboxes
> that share those service bindings.
@z

@x
### `registries`
@y
### `registries`
@z

@x
`registries` maps registry hostnames to pull credentials. Each entry requires
`secret` and accepts an optional `username`. Both fields accept a secret source
with exactly one of `value`, `ref`, or `command`.
@y
`registries` maps registry hostnames to pull credentials. Each entry requires
`secret` and accepts an optional `username`. Both fields accept a secret source
with exactly one of `value`, `ref`, or `command`.
@z

@x
When `username` is omitted, `sbx` stores a token-only credential. Registries
such as GHCR and GitLab accept token-only credentials.
@y
When `username` is omitted, `sbx` stores a token-only credential. Registries
such as GHCR and GitLab accept token-only credentials.
@z

@x
```yaml
registries:
  ghcr.io:
    secret:
      command: gh auth token
```
@y
```yaml
registries:
  ghcr.io:
    secret:
      command: gh auth token
```
@z

@x
### `mcp`
@y
### `mcp`
@z

@x
The `mcp.servers` list registers servers with the built-in
[MCP gateway](../mcp-gateway.md) and adds them to the sandbox. MCP registrations
are host-global and remain after `sbx env rm`.
@y
The `mcp.servers` list registers servers with the built-in
[MCP gateway](../mcp-gateway.md) and adds them to the sandbox. MCP registrations
are host-global and remain after `sbx env rm`.
@z

@x
| Field     | Type            | Required | Default | Description                                                     |
| --------- | --------------- | -------- | ------- | --------------------------------------------------------------- |
| `name`    | string          | Yes      | None    | Server name                                                     |
| `url`     | string          | No       | None    | Remote server URL, registry reference, or OCI reference          |
| `command` | string          | No       | None    | Command for a local stdio server                                 |
| `args`    | list of strings | No       | None    | Arguments passed to `command`                                   |
@y
| Field     | Type            | Required | Default | Description                                                     |
| --------- | --------------- | -------- | ------- | --------------------------------------------------------------- |
| `name`    | string          | Yes      | None    | Server name                                                     |
| `url`     | string          | No       | None    | Remote server URL, registry reference, or OCI reference          |
| `command` | string          | No       | None    | Command for a local stdio server                                 |
| `args`    | list of strings | No       | None    | Arguments passed to `command`                                   |
@z

@x
Each server must set exactly one of `url` or `command`.
@y
Each server must set exactly one of `url` or `command`.
@z

@x
### `ports`
@y
### `ports`
@z

@x
`ports` publishes sandbox ports when the environment is created. Ports exposed
by a kit but omitted from this list receive an ephemeral host port.
@y
`ports` publishes sandbox ports when the environment is created. Ports exposed
by a kit but omitted from this list receive an ephemeral host port.
@z

@x
| Field      | Type    | Required | Default          | Description                                                           |
| ---------- | ------- | -------- | ---------------- | --------------------------------------------------------------------- |
| `sandbox`  | integer | Yes      | None             | Sandbox port from 1 through 65535                                     |
| `host`     | integer | No       | Ephemeral        | Host port from 1 through 65535                                        |
| `protocol` | string  | No       | `tcp`            | `tcp`, `tcp4`, `tcp6`, `udp`, `udp4`, or `udp6`                       |
| `hostIP`   | string  | No       | Loopback         | Host interface. The default uses available IPv4 and IPv6 loopback     |
@y
| Field      | Type    | Required | Default          | Description                                                           |
| ---------- | ------- | -------- | ---------------- | --------------------------------------------------------------------- |
| `sandbox`  | integer | Yes      | None             | Sandbox port from 1 through 65535                                     |
| `host`     | integer | No       | Ephemeral        | Host port from 1 through 65535                                        |
| `protocol` | string  | No       | `tcp`            | `tcp`, `tcp4`, `tcp6`, `udp`, `udp4`, or `udp6`                       |
| `hostIP`   | string  | No       | Loopback         | Host interface. The default uses available IPv4 and IPv6 loopback     |
@z

@x
If a port can't be published, sandbox creation fails and removes the new
sandbox.
@y
If a port can't be published, sandbox creation fails and removes the new
sandbox.
@z
