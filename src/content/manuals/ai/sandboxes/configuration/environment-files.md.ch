%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Sandbox environment files
linkTitle: Environment files
@y
title: Sandbox environment files
linkTitle: Environment files
@z

@x
description: Use a declarative sbxenv.yaml file to describe and share your sandbox configuration.
keywords:
  - docker sandboxes
  - sbx env
  - sbxenv
  - environment file
  - sandbox configuration
  - declarative
@y
description: Use a declarative sbxenv.yaml file to describe and share your sandbox configuration.
keywords:
  - docker sandboxes
  - sbx env
  - sbxenv
  - environment file
  - sandbox configuration
  - declarative
@z

@x
A sandbox environment file captures the setup for a project in a
`sbxenv.yaml` file. Share the file with project contributors so they use the
same agent, tools, resources, and credentials without reproducing CLI flags and
setup steps.
@y
A sandbox environment file captures the setup for a project in a
`sbxenv.yaml` file. Share the file with project contributors so they use the
same agent, tools, resources, and credentials without reproducing CLI flags and
setup steps.
@z

@x
> [!NOTE]
> `sbx env` is experimental. The command interface and file format may change.
@y
> [!NOTE]
> `sbx env` is experimental. The command interface and file format may change.
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
├── sbxenv.yaml
└── web-app/
```
@y
```text
web-app-env/
├── sbxenv.yaml
└── web-app/
```
@z

@x
Create `web-app-env/sbxenv.yaml`. This example gives the agent a shared
environment variable and the Playwright browser-testing tools. It also
publishes the application's development port:
@y
Create `web-app-env/sbxenv.yaml`. This example gives the agent a shared
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
`sbx` shows an environment plan and asks you to approve it. If you approve the
plan, the `web-app` directory becomes the workspace, while `sbxenv.yaml` remains
outside the sandbox. If the environment doesn't exist, `sbx` creates a sandbox
named `web-app`, installs Playwright and Chromium, and publishes sandbox port
`3000` on the host. It then attaches to the agent. Later runs attach to the
existing sandbox.
@y
`sbx` shows an environment plan and asks you to approve it. If you approve the
plan, the `web-app` directory becomes the workspace, while `sbxenv.yaml` remains
outside the sandbox. If the environment doesn't exist, `sbx` creates a sandbox
named `web-app`, installs Playwright and Chromium, and publishes sandbox port
`3000` on the host. It then attaches to the agent. Later runs attach to the
existing sandbox.
@z

@x
This placement keeps the environment file outside the agent's writable
workspace. If you later add `additionalWorkspaces`, keep `sbxenv.yaml`
outside those directories too. See the [`workspace` guidance](#workspace)
for details.
@y
This placement keeps the environment file outside the agent's writable
workspace. If you later add `additionalWorkspaces`, keep `sbxenv.yaml`
outside those directories too. See the [`workspace` guidance](#workspace)
for details.
@z

@x
## Commands
@y
## Commands
@z

@x
| Command                                                                       | Description                                                                          |
| ----------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| `sbx env plan [PATH...]`                                                       | Shows what applying the environment would change without changing or approving it    |
| [`sbx env run`](/reference/cli/sbx/env/run/) `[PATH...]`                      | Applies the approved plan, creates the environment if needed, and attaches            |
| [`sbx env create`](/reference/cli/sbx/env/create/) `[PATH...]`                | Applies the approved plan and creates the environment without attaching              |
| [`sbx env exec`](/reference/cli/sbx/env/exec/) `[PATH...] -- COMMAND [ARG...]` | Runs a command in an existing environment without running lifecycle commands         |
| [`sbx env rm`](/reference/cli/sbx/env/rm/) `[PATH...]`                        | Shows a destroy plan, then removes the sandbox and resources named in the plan        |
@y
| Command                                                                       | Description                                                                          |
| ----------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| `sbx env plan [PATH...]`                                                       | Shows what applying the environment would change without changing or approving it    |
| [`sbx env run`](__SUBDIR__/reference/cli/sbx/env/run/) `[PATH...]`                      | Applies the approved plan, creates the environment if needed, and attaches            |
| [`sbx env create`](__SUBDIR__/reference/cli/sbx/env/create/) `[PATH...]`                | Applies the approved plan and creates the environment without attaching              |
| [`sbx env exec`](__SUBDIR__/reference/cli/sbx/env/exec/) `[PATH...] -- COMMAND [ARG...]` | Runs a command in an existing environment without running lifecycle commands         |
| [`sbx env rm`](__SUBDIR__/reference/cli/sbx/env/rm/) `[PATH...]`                        | Shows a destroy plan, then removes the sandbox and resources named in the plan        |
@z

@x
To use an environment file, pass its path to `sbx env`. If you pass a
directory, `sbx` looks for `sbxenv.yaml` inside it. If you don't pass a path,
`sbx` looks in the directory you run the command from and loads your
[user defaults](#set-user-defaults), if present.
@y
To use an environment file, pass its path to `sbx env`. If you pass a
directory, `sbx` looks for `sbxenv.yaml` inside it. If you don't pass a path,
`sbx` looks in the directory you run the command from and loads your
[user defaults](#set-user-defaults), if present.
@z

@x
Every `sbx env` subcommand accepts `--name`. This flag sets the sandbox name
for that command, overriding the `name` field in the file or the automatically
generated name:
@y
Every `sbx env` subcommand accepts `--name`. This flag sets the sandbox name
for that command, overriding the `name` field in the file or the automatically
generated name:
@z

@x
```console
$ sbx env create --name web-app-test
$ sbx env exec --name web-app-test -- npm test
$ sbx env rm --name web-app-test
```
@y
```console
$ sbx env create --name web-app-test
$ sbx env exec --name web-app-test -- npm test
$ sbx env rm --name web-app-test
```
@z

@x
Use the same file paths for each command. If you set `--name`, use that same
name for every command that manages the sandbox.
@y
Use the same file paths for each command. If you set `--name`, use that same
name for every command that manages the sandbox.
@z

@x
### Set user defaults
@y
### Set user defaults
@z

@x
Create `~/.sbxenv.yaml` to share settings across your projects. For example,
this file selects Claude as the agent and mounts the directory you run
`sbx env` from:
@y
Create `~/.sbxenv.yaml` to share settings across your projects. For example,
this file selects Claude as the agent and mounts the directory you run
`sbx env` from:
@z

@x
```yaml
schemaVersion: "1"
agent: claude
workspace: ${{ env.projectDir }}
```
@y
```yaml
schemaVersion: "1"
agent: claude
workspace: ${{ env.projectDir }}
```
@z

@x
With this file saved in your home directory, run:
@y
With this file saved in your home directory, run:
@z

@x
```console
$ cd /projects/web-app
$ sbx env run
```
@y
```console
$ cd /projects/web-app
$ sbx env run
```
@z

@x
The sandbox mounts `/projects/web-app` as its workspace. Run the same command
from `/projects/api`, and it mounts `/projects/api` instead. You don't need a
separate `sbxenv.yaml` in either project.
@y
The sandbox mounts `/projects/web-app` as its workspace. Run the same command
from `/projects/api`, and it mounts `/projects/api` instead. You don't need a
separate `sbxenv.yaml` in either project.
@z

@x
If the project has a `sbxenv.yaml`, `sbx` combines it with your user defaults.
Project settings override individual default values. Lists such as `ports`
and `mcp.servers` combine entries from both files. If you pass a file or
directory path to the command, `sbx` skips `~/.sbxenv.yaml`.
@y
If the project has a `sbxenv.yaml`, `sbx` combines it with your user defaults.
Project settings override individual default values. Lists such as `ports`
and `mcp.servers` combine entries from both files. If you pass a file or
directory path to the command, `sbx` skips `~/.sbxenv.yaml`.
@z

@x
In `~/.sbxenv.yaml`, you can set `workspace` to `${{ env.projectDir }}` or a
subdirectory such as `${{ env.projectDir }}/src`. Other workspace paths
aren't accepted in this file.
@y
In `~/.sbxenv.yaml`, you can set `workspace` to `${{ env.projectDir }}` or a
subdirectory such as `${{ env.projectDir }}/src`. Other workspace paths
aren't accepted in this file.
@z

@x
The user defaults file cannot set `name`. Set the sandbox name in a project
environment file or with `--name`.
@y
The user defaults file cannot set `name`. Set the sandbox name in a project
environment file or with `--name`.
@z

@x
### Reference directories
@y
### Reference directories
@z

@x
You can use `${{ env.projectDir }}` and `${{ env.fileDir }}` in environment
files to insert absolute directory paths. They refer to directories on the
host.
@y
You can use `${{ env.projectDir }}` and `${{ env.fileDir }}` in environment
files to insert absolute directory paths. They refer to directories on the
host.
@z

@x
#### Project directory
@y
#### Project directory
@z

@x
`${{ env.projectDir }}` is the absolute path to your project directory.
`sbx` chooses this directory from the command you run:
@y
`${{ env.projectDir }}` is the absolute path to your project directory.
`sbx` chooses this directory from the command you run:
@z

@x
- `sbx env run`: the directory you run the command from.
- `sbx env run /projects/web-app`: `/projects/web-app`.
- `sbx env run /projects/web-app/custom.yaml`: `/projects/web-app`, the
  directory containing the file.
@y
- `sbx env run`: the directory you run the command from.
- `sbx env run /projects/web-app`: `/projects/web-app`.
- `sbx env run /projects/web-app/custom.yaml`: `/projects/web-app`, the
  directory containing the file.
@z

@x
If you pass several paths, the first one sets the project directory. Every
file loaded by that command uses the same value for `env.projectDir`.
@y
If you pass several paths, the first one sets the project directory. Every
file loaded by that command uses the same value for `env.projectDir`.
@z

@x
Use this reference in shared settings that need to point to each project's
files. For example, `workspace: ${{ env.projectDir }}/src` mounts the `src`
directory in whichever project you select.
@y
Use this reference in shared settings that need to point to each project's
files. For example, `workspace: ${{ env.projectDir }}/src` mounts the `src`
directory in whichever project you select.
@z

@x
#### File directory
@y
#### File directory
@z

@x
`${{ env.fileDir }}` is the absolute path to the directory containing the
environment file where you write the reference. For example, inside
`/shared/environment.yaml`, its value is `/shared`.
@y
`${{ env.fileDir }}` is the absolute path to the directory containing the
environment file where you write the reference. For example, inside
`/shared/environment.yaml`, its value is `/shared`.
@z

@x
Use this reference when an environment file needs to locate files stored
alongside it. For example, suppose your setup script is
`/shared/scripts/setup.sh`. Add this [lifecycle command](#lifecycle) to
`/shared/environment.yaml` to run the script from `/shared`:
@y
Use this reference when an environment file needs to locate files stored
alongside it. For example, suppose your setup script is
`/shared/scripts/setup.sh`. Add this [lifecycle command](#lifecycle) to
`/shared/environment.yaml` to run the script from `/shared`:
@z

@x
```yaml
lifecycle:
  initialize:
    - command: ./scripts/setup.sh
      workdir: ${{ env.fileDir }}
```
@y
```yaml
lifecycle:
  initialize:
    - command: ./scripts/setup.sh
      workdir: ${{ env.fileDir }}
```
@z

@x
The command runs from `/shared`, even if you use this environment file with
a project in another directory.
@y
The command runs from `/shared`, even if you use this environment file with
a project in another directory.
@z

@x
Relative workspace paths already use the directory containing the environment
file. For example, `workspace: ./src` in `/shared/environment.yaml` mounts
`/shared/src`.
@y
Relative workspace paths already use the directory containing the environment
file. For example, `workspace: ./src` in `/shared/environment.yaml` mounts
`/shared/src`.
@z

@x
Both directory references can appear in YAML values, but not in field names
or inside the `args` block.
@y
Both directory references can appear in YAML values, but not in field names
or inside the `args` block.
@z

@x
### Parameterize an environment
@y
### Parameterize an environment
@z

@x
Declare inputs in a top-level `args` block when values need to vary between
uses of the same environment file. Each argument must have exactly one of
`default` or `required: true`:
@y
Declare inputs in a top-level `args` block when values need to vary between
uses of the same environment file. Each argument must have exactly one of
`default` or `required: true`:
@z

@x
```yaml
schemaVersion: "1"
name: web-app
agent: claude
@y
```yaml
schemaVersion: "1"
name: web-app
agent: claude
@z

@x
args:
  channel:
    default: stable
    description: Release channel
    enum:
      - stable
      - beta
  endpoint:
    required: true
    description: API endpoint
  cpus:
    default: "4"
    pattern: "[1-9][0-9]*"
@y
args:
  channel:
    default: stable
    description: Release channel
    enum:
      - stable
      - beta
  endpoint:
    required: true
    description: API endpoint
  cpus:
    default: "4"
    pattern: "[1-9][0-9]*"
@z

@x
env:
  RELEASE_CHANNEL: ${{ env.args.channel }}
  API_ENDPOINT: ${{ env.args.endpoint }}
@y
env:
  RELEASE_CHANNEL: ${{ env.args.channel }}
  API_ENDPOINT: ${{ env.args.endpoint }}
@z

@x
sandboxOptions:
  cpus: ${{ env.args.cpus }}
```
@y
sandboxOptions:
  cpus: ${{ env.args.cpus }}
```
@z

@x
Reference a declared argument as `${{ env.args.NAME }}` anywhere a YAML value
can appear. References can't be used in field names or within the `args` block.
An unquoted reference is interpreted as a YAML value after substitution, so
the `cpus` value in this example becomes an integer. Quote a reference to
preserve it as a string.
@y
Reference a declared argument as `${{ env.args.NAME }}` anywhere a YAML value
can appear. References can't be used in field names or within the `args` block.
An unquoted reference is interpreted as a YAML value after substitution, so
the `cpus` value in this example becomes an integer. Quote a reference to
preserve it as a string.
@z

@x
All `sbx env` commands accept repeatable `--env-arg NAME=VALUE` flags. Values
provided with a flag replace defaults from the environment file:
@y
All `sbx env` commands accept repeatable `--env-arg NAME=VALUE` flags. Values
provided with a flag replace defaults from the environment file:
@z

@x
```console
$ sbx env run --env-arg endpoint=https://api.example.com --env-arg channel=beta
```
@y
```console
$ sbx env run --env-arg endpoint=https://api.example.com --env-arg channel=beta
```
@z

@x
Use `--env-args-file` to load values from a file. Each non-empty, non-comment
line must have the form `NAME=VALUE`:
@y
Use `--env-args-file` to load values from a file. Each non-empty, non-comment
line must have the form `NAME=VALUE`:
@z

@x
```text
# production.args
channel=beta
endpoint=https://api.example.com
```
@y
```text
# production.args
channel=beta
endpoint=https://api.example.com
```
@z

@x
```console
$ sbx env run --env-args-file production.args
```
@y
```console
$ sbx env run --env-args-file production.args
```
@z

@x
You can pass multiple argument files. Later files take precedence over earlier
files, and `--env-arg` flags take precedence over every argument file.
Values can contain `=`, and values in an argument file are read literally
rather than expanded by a shell.
@y
You can pass multiple argument files. Later files take precedence over earlier
files, and `--env-arg` flags take precedence over every argument file.
Values can contain `=`, and values in an argument file are read literally
rather than expanded by a shell.
@z

@x
Argument references and the two directory references are the only variable
expressions expanded in an environment file. Shell-style expressions such as
`${VAR}` aren't expanded from the host environment. Other dollar signs remain
literal, so a value such as `$PATH:/opt/bin` is passed unchanged.
Use `$${{ env.args.NAME }}` to produce the literal text `${{ env.args.NAME }}`. Substituted values aren't expanded a
second time.
@y
Argument references and the two directory references are the only variable
expressions expanded in an environment file. Shell-style expressions such as
`${VAR}` aren't expanded from the host environment. Other dollar signs remain
literal, so a value such as `$PATH:/opt/bin` is passed unchanged.
Use `$${{ env.args.NAME }}` to produce the literal text `${{ env.args.NAME }}`. Substituted values aren't expanded a
second time.
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
12 GB of memory, and both environment variables. Each relative workspace path
resolves from the directory of the file that declares it.
@y
Nested mappings merge by key, lists concatenate, and values from later files
replace earlier scalar values. In this example, the sandbox has four CPUs,
12 GB of memory, and both environment variables. Each relative workspace path
resolves from the directory of the file that declares it.
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
# sbxenv.yaml in the directory above the repositories
schemaVersion: "1"
name: web-platform
agent: codex
@y
```yaml
# sbxenv.yaml in the directory above the repositories
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
three workspaces. Relative paths resolve from the directory of the
environment file that declares them. Additional workspaces are mounted directly
even when the primary workspace uses clone mode.
@y
The agent starts in `web-app`, can modify `shared-components`, and can read
`architecture-docs` without changing it. The environment file stays outside all
three workspaces. Relative paths resolve from the directory of the
environment file that declares them. Additional workspaces are mounted directly
even when the primary workspace uses clone mode.
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
$ sbx env create --auto-approve
$ sbx env exec -- npm test
$ sbx env rm --force
```
@y
```console
$ sbx env create --auto-approve
$ sbx env exec -- npm test
$ sbx env rm --force
```
@z

@x
`--auto-approve` approves the plan for that invocation without recording
consent for later invocations. Use the flag for each unattended `create` or
`run`. The `--force` flag approves the destroy plan and removes the sandbox even
when it is in use.
@y
`--auto-approve` approves the plan for that invocation without recording
consent for later invocations. Use the flag for each unattended `create` or
`run`. The `--force` flag approves the destroy plan and removes the sandbox even
when it is in use.
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
## Review an environment plan
@y
## Review an environment plan
@z

@x
`sbx env create`, `sbx env run`, and `sbx env rm` show the changes an
environment makes outside its sandbox and ask for approval before applying
them. The plan includes host commands, credentials, bindings, MCP
registrations, directories, kits, published ports, sandbox options, and
environment variables.
@y
`sbx env create`, `sbx env run`, and `sbx env rm` show the changes an
environment makes outside its sandbox and ask for approval before applying
them. The plan includes host commands, credentials, bindings, MCP
registrations, directories, kits, published ports, sandbox options, and
environment variables.
@z

@x
Run `sbx env plan` to inspect the apply plan without changing, approving, or
recording anything:
@y
Run `sbx env plan` to inspect the apply plan without changing, approving, or
recording anything:
@z

@x
```console
$ sbx env plan
```
@y
```console
$ sbx env plan
```
@z

@x
The plan compares the environment file with the environment's last applied
state and the resources on the host. It omits resources that are unchanged and
already approved. Literal secret values appear as SHA-256 digests. Secret
references, host commands, environment variables, ports, paths, and binding
domains remain visible so you can review them.
@y
The plan compares the environment file with the environment's last applied
state and the resources on the host. It omits resources that are unchanged and
already approved. Literal secret values appear as SHA-256 digests. Secret
references, host commands, environment variables, ports, paths, and binding
domains remain visible so you can review them.
@z

@x
Interactive approval is recorded for the environment under the `sbx` state
directory. Plans without host commands apply silently on later invocations until
the environment changes or a resource is missing. An approval provided with
`--auto-approve` applies only to that invocation.
@y
Interactive approval is recorded for the environment under the `sbx` state
directory. Plans without host commands apply silently on later invocations until
the environment changes or a resource is missing. An approval provided with
`--auto-approve` applies only to that invocation.
@z

@x
## Update an environment
@y
## Update an environment
@z

@x
For an existing sandbox, `sbx env run` applies updated `env` values to the new
agent session and reconciles declared MCP servers. Changes to workspaces, kits,
ports, secrets, bindings, and `sandboxOptions` take effect only when the
sandbox is next created. Remove the environment with `sbx env rm`, then create
it again to apply those changes.
@y
For an existing sandbox, `sbx env run` applies updated `env` values to the new
agent session and reconciles declared MCP servers. Changes to workspaces, kits,
ports, secrets, bindings, and `sandboxOptions` take effect only when the
sandbox is next created. Remove the environment with `sbx env rm`, then create
it again to apply those changes.
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
`sbx env rm` builds a destroy plan from the resources on the host. The plan
includes all credentials stored at the sandbox's scope, including credentials
that the environment file no longer declares. After approval, `sbx` removes
only the resources named in the plan.
@y
`sbx env rm` builds a destroy plan from the resources on the host. The plan
includes all credentials stored at the sandbox's scope, including credentials
that the environment file no longer declares. After approval, `sbx` removes
only the resources named in the plan.
@z

@x
Global credential bindings remain unless you pass `--prune-bindings`. MCP
registrations remain available to other sandboxes.
@y
Global credential bindings remain unless you pass `--prune-bindings`. MCP
registrations remain available to other sandboxes.
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
### Top-level fields
@y
### Top-level fields
@z

@x
| Field                  | Type             | Required | Default                        | Description                                                                     |
| ---------------------- | ---------------- | -------- | ------------------------------ | ------------------------------------------------------------------------------- |
| `schemaVersion`        | string           | Yes      | None                           | Schema version. The supported value is `"1"`                                   |
| `name`                 | string           | No       | `<agent>-<workspace-basename>` | Sandbox name, overridden by `--name`                                                                    |
| `agent`                | string           | Yes      | None                           | Built-in agent or the name of an agent kit                                      |
| `args`                 | map              | No       | None                           | Environment arguments. See [`args`](#args)                                      |
| `kits`                 | list             | No       | None                           | Kits to install at creation. See [`kits`](#kits)                                 |
| `workspace`            | string or object | No       | No host mount                  | Primary workspace. See [`workspace`](#workspace)                                |
| `additionalWorkspaces` | list             | No       | None                           | Extra directories to mount. See [`additionalWorkspaces`](#additionalworkspaces) |
| `env`                  | map of strings   | No       | None                           | Environment variables for the sandbox                                           |
| `sandboxOptions`       | object           | No       | None                           | Creation options. See [`sandboxOptions`](#sandboxoptions)                        |
| `secrets`              | map              | No       | None                           | Service credentials. See [`secrets`](#secrets)                                  |
| `bindings`             | map              | No       | None                           | Credential injection approvals. See [`bindings`](#bindings)                     |
| `registries`           | map              | No       | None                           | Registry pull credentials. See [`registries`](#registries)                      |
| `mcp`                  | object           | No       | None                           | MCP servers. See [`mcp`](#mcp)                                                  |
| `ports`                | list             | No       | None                           | Port mappings. See [`ports`](#ports)                                            |
| `lifecycle`            | object           | No       | None                           | Host commands. See [`lifecycle`](#lifecycle)                                    |
@y
| Field                  | Type             | Required | Default                        | Description                                                                     |
| ---------------------- | ---------------- | -------- | ------------------------------ | ------------------------------------------------------------------------------- |
| `schemaVersion`        | string           | Yes      | None                           | Schema version. The supported value is `"1"`                                   |
| `name`                 | string           | No       | `<agent>-<workspace-basename>` | Sandbox name, overridden by `--name`                                                                    |
| `agent`                | string           | Yes      | None                           | Built-in agent or the name of an agent kit                                      |
| `args`                 | map              | No       | None                           | Environment arguments. See [`args`](#args)                                      |
| `kits`                 | list             | No       | None                           | Kits to install at creation. See [`kits`](#kits)                                 |
| `workspace`            | string or object | No       | No host mount                  | Primary workspace. See [`workspace`](#workspace)                                |
| `additionalWorkspaces` | list             | No       | None                           | Extra directories to mount. See [`additionalWorkspaces`](#additionalworkspaces) |
| `env`                  | map of strings   | No       | None                           | Environment variables for the sandbox                                           |
| `sandboxOptions`       | object           | No       | None                           | Creation options. See [`sandboxOptions`](#sandboxoptions)                        |
| `secrets`              | map              | No       | None                           | Service credentials. See [`secrets`](#secrets)                                  |
| `bindings`             | map              | No       | None                           | Credential injection approvals. See [`bindings`](#bindings)                     |
| `registries`           | map              | No       | None                           | Registry pull credentials. See [`registries`](#registries)                      |
| `mcp`                  | object           | No       | None                           | MCP servers. See [`mcp`](#mcp)                                                  |
| `ports`                | list             | No       | None                           | Port mappings. See [`ports`](#ports)                                            |
| `lifecycle`            | object           | No       | None                           | Host commands. See [`lifecycle`](#lifecycle)                                    |
@z

@x
### `args`
@y
### `args`
@z

@x
`args` maps argument names to their declarations. Names must start with a
letter or underscore and can contain letters, numbers, underscores, and
hyphens. Each declaration must set exactly one of `default` or `required:
true`.
@y
`args` maps argument names to their declarations. Names must start with a
letter or underscore and can contain letters, numbers, underscores, and
hyphens. Each declaration must set exactly one of `default` or `required:
true`.
@z

@x
| Field         | Type            | Default | Description                                                       |
| ------------- | --------------- | ------- | ----------------------------------------------------------------- |
| `default`     | string          | None    | Value used when the command doesn't supply the argument           |
| `required`    | boolean         | `false` | Require the command to supply the argument                         |
| `description` | string          | None    | Explanation shown in command output                               |
| `enum`        | list of strings | None    | Values accepted for the argument                                  |
| `pattern`     | string          | None    | Go (`RE2`) expression matched against the complete argument value |
@y
| Field         | Type            | Default | Description                                                       |
| ------------- | --------------- | ------- | ----------------------------------------------------------------- |
| `default`     | string          | None    | Value used when the command doesn't supply the argument           |
| `required`    | boolean         | `false` | Require the command to supply the argument                         |
| `description` | string          | None    | Explanation shown in command output                               |
| `enum`        | list of strings | None    | Values accepted for the argument                                  |
| `pattern`     | string          | None    | Go (`RE2`) expression matched against the complete argument value |
@z

@x
`enum` and `pattern` can't be used together.
@y
`enum` and `pattern` can't be used together.
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
Explicit relative paths resolve from the directory of the environment file
that declares them. These include `.`, `..`, paths that start with `./` or
`../`, and relative paths that end in `.zip`. Bare references such as
`organization/kit` remain registry references.
@y
Explicit relative paths resolve from the directory of the environment file
that declares them. These include `.`, `..`, paths that start with `./` or
`../`, and relative paths that end in `.zip`. Bare references such as
`organization/kit` remain registry references.
@z

@x
Use an object entry to pass arguments to a kit. Set `source` to the kit
reference and map the kit's argument names to values under `args`:
@y
Use an object entry to pass arguments to a kit. Set `source` to the kit
reference and map the kit's argument names to values under `args`:
@z

@x
```yaml
kits:
  - source: ./kits/tool
    args:
      version: ${{ env.args.channel }}
```
@y
```yaml
kits:
  - source: ./kits/tool
    args:
      version: ${{ env.args.channel }}
```
@z

@x
Remote kit sources must match the
[`kit.allowedSources`](settings.md#kitallowedsources) setting. Docker Hub is
allowed by default. To use Git kits from `docker/sbx-kits-contrib`, add its
source:
@y
Remote kit sources must match the
[`kit.allowedSources`](settings.md#kitallowedsources) setting. Docker Hub is
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
clone mode. Omit `workspace` to create a sandbox without a host bind mount. Set
`workspace: .` to mount the directory that contains the environment file
that declares it.
@y
When specified as a string, `workspace` is the path. Use the object form for
clone mode. Omit `workspace` to create a sandbox without a host bind mount. Set
`workspace: .` to mount the directory that contains the environment file
that declares it.
@z

@x
`sbx` mounts the environment file read-only inside the sandbox. Keep the file
outside direct-mounted workspaces or directly in a workspace root.
@y
`sbx` mounts the environment file read-only inside the sandbox. Keep the file
outside direct-mounted workspaces or directly in a workspace root.
@z

@x
| Field   | Type    | Required | Default | Description                                                     |
| ------- | ------- | -------- | ------- | --------------------------------------------------------------- |
| `path`  | string  | Yes      | None    | Workspace directory. Relative paths resolve from the declaring file's directory |
| `clone` | boolean | No       | `false` | Use a private clone, equivalent to `sbx create --clone`          |
@y
| Field   | Type    | Required | Default | Description                                                     |
| ------- | ------- | -------- | ------- | --------------------------------------------------------------- |
| `path`  | string  | Yes      | None    | Workspace directory. Relative paths resolve from the declaring file's directory |
| `clone` | boolean | No       | `false` | Use a private clone, equivalent to `sbx create --clone`          |
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
paths resolve from the directory of the environment file that declares them.
@y
Each additional workspace is mounted after the primary workspace. Relative
paths resolve from the directory of the environment file that declares them.
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
| Field         | Type            | Default  | Description                                           |
| ------------- | --------------- | -------- | ----------------------------------------------------- |
| `template`    | string          | None     | Custom sandbox template image                         |
| `memory`      | string          | None     | Memory limit, such as `8g` or `512m`                   |
| `cpus`        | integer         | `0`      | Number of CPUs. `0` allocates all host CPUs            |
| `pullPolicy`  | string          | `always` | Image pull policy: `always`, `missing`, or `never`     |
| `profile`     | string          | None     | Governance profile name                               |
| `skills`      | string          | Daemon default | Shared agent skills store access: `off`, `readonly`, or `readwrite` |
| `display`     | boolean         | `false`  | Provision a display socket for graphical applications |
| `gpu`         | boolean         | `false`  | Pass the host GPU through to the sandbox               |
| `usb`         | list of strings | None     | USB device selectors to pass through to the sandbox   |
@y
| Field         | Type            | Default  | Description                                           |
| ------------- | --------------- | -------- | ----------------------------------------------------- |
| `template`    | string          | None     | Custom sandbox template image                         |
| `memory`      | string          | None     | Memory limit, such as `8g` or `512m`                   |
| `cpus`        | integer         | `0`      | Number of CPUs. `0` allocates all host CPUs            |
| `pullPolicy`  | string          | `always` | Image pull policy: `always`, `missing`, or `never`     |
| `profile`     | string          | None     | Governance profile name                               |
| `skills`      | string          | Daemon default | Shared agent skills store access: `off`, `readonly`, or `readwrite` |
| `display`     | boolean         | `false`  | Provision a display socket for graphical applications |
| `gpu`         | boolean         | `false`  | Pass the host GPU through to the sandbox               |
| `usb`         | list of strings | None     | USB device selectors to pass through to the sandbox   |
@z

@x
`skills` controls access to the shared [agent skills](../workflows/agent-skills.md)
store. Set it to `off` to omit the mount, `readonly` to mount the store read-only,
or `readwrite` to let the sandbox modify shared skills. If omitted, it uses the
daemon's default, which is `readonly` unless your organization overrides it.
@y
`skills` controls access to the shared [agent skills](../workflows/agent-skills.md)
store. Set it to `off` to omit the mount, `readonly` to mount the store read-only,
or `readwrite` to let the sandbox modify shared skills. If omitted, it uses the
daemon's default, which is `readonly` unless your organization overrides it.
@z

@x
### `lifecycle`
@y
### `lifecycle`
@z

@x
The `lifecycle` block declares commands that run on the host with your user
privileges. Use lifecycle commands for work that must happen outside the
sandbox, such as creating a workspace, seeding fixtures, or archiving state.
@y
The `lifecycle` block declares commands that run on the host with your user
privileges. Use lifecycle commands for work that must happen outside the
sandbox, such as creating a workspace, seeding fixtures, or archiving state.
@z

@x
```yaml
lifecycle:
  initialize:
    - name: Prepare workspace
      command: test -d web-app || git clone https://github.com/example/web-app
      timeout: 5m
  postCreate:
    - command: ./scripts/seed-fixtures.sh
      workdir: web-app
  preRemove:
    - command: ./scripts/archive-state.sh
```
@y
```yaml
lifecycle:
  initialize:
    - name: Prepare workspace
      command: test -d web-app || git clone https://github.com/example/web-app
      timeout: 5m
  postCreate:
    - command: ./scripts/seed-fixtures.sh
      workdir: web-app
  preRemove:
    - command: ./scripts/archive-state.sh
```
@z

@x
Lifecycle phases run at the following points:
@y
Lifecycle phases run at the following points:
@z

@x
| Phase        | Timing                                                                                                           |
| ------------ | ---------------------------------------------------------------------------------------------------------------- |
| `initialize` | Before other create or run actions. Runs for every `create` and `run`                                             |
| `postCreate` | After a new sandbox is created. For `run`, before attachment. Does not run when attaching to an existing sandbox   |
| `preRemove`  | After you approve removal and before `sbx` deletes resources. A failure produces a warning and removal continues  |
@y
| Phase        | Timing                                                                                                           |
| ------------ | ---------------------------------------------------------------------------------------------------------------- |
| `initialize` | Before other create or run actions. Runs for every `create` and `run`                                             |
| `postCreate` | After a new sandbox is created. For `run`, before attachment. Does not run when attaching to an existing sandbox   |
| `preRemove`  | After you approve removal and before `sbx` deletes resources. A failure produces a warning and removal continues  |
@z

@x
`sbx env exec` doesn't run lifecycle commands. Commands within a phase run in
order and stop at the first failure. Make `initialize` commands safe to run
more than once.
@y
`sbx env exec` doesn't run lifecycle commands. Commands within a phase run in
order and stop at the first failure. Make `initialize` commands safe to run
more than once.
@z

@x
After `preRemove` commands finish, `sbx` generates the destroy plan again.
Removal stops if the commands introduced changes that weren't included in the
approved plan.
@y
After `preRemove` commands finish, `sbx` generates the destroy plan again.
Removal stops if the commands introduced changes that weren't included in the
approved plan.
@z

@x
Each command requires `command` and accepts the following fields:
@y
Each command requires `command` and accepts the following fields:
@z

@x
| Field     | Type   | Default           | Description                                                                    |
| --------- | ------ | ----------------- | ------------------------------------------------------------------------------ |
| `name`    | string | Command text      | Label shown in progress and plan output                                        |
| `command` | string | None              | Command passed to the user's shell                                             |
| `workdir` | string | Project directory | Host working directory. Relative paths resolve from the first file's directory |
| `timeout` | string | None              | Maximum runtime, such as `90s` or `5m`                                         |
@y
| Field     | Type   | Default           | Description                                                                    |
| --------- | ------ | ----------------- | ------------------------------------------------------------------------------ |
| `name`    | string | Command text      | Label shown in progress and plan output                                        |
| `command` | string | None              | Command passed to the user's shell                                             |
| `workdir` | string | Project directory | Host working directory. Relative paths resolve from the first file's directory |
| `timeout` | string | None              | Maximum runtime, such as `90s` or `5m`                                         |
@z

@x
Commands inherit the environment of the `sbx` process and receive the following
variables:
@y
Commands inherit the environment of the `sbx` process and receive the following
variables:
@z

@x
- `SBX_LIFECYCLE_PHASE`
- `SBX_ENV_FILE` and `SBX_ENV_FILES`
- `SBX_ENV_DIR`
- `SBX_SANDBOX_NAME`
- `SBX_AGENT`
- `SBX_WORKSPACE`
@y
- `SBX_LIFECYCLE_PHASE`
- `SBX_ENV_FILE` and `SBX_ENV_FILES`
- `SBX_ENV_DIR`
- `SBX_SANDBOX_NAME`
- `SBX_AGENT`
- `SBX_WORKSPACE`
@z

@x
The environment file's `env` values and resolved secrets aren't passed to host
commands.
@y
The environment file's `env` values and resolved secrets aren't passed to host
commands.
@z

@x
Plans containing lifecycle commands or credential `command` sources require
approval for every invocation by default, even when the command text hasn't
changed. Approve one invocation with `--auto-approve`, skip lifecycle commands
with `--skip-host-commands`, or turn on
[`env.rememberHostCommands`](settings.md#envrememberhostcommands) to remember
approval until the commands change:
@y
Plans containing lifecycle commands or credential `command` sources require
approval for every invocation by default, even when the command text hasn't
changed. Approve one invocation with `--auto-approve`, skip lifecycle commands
with `--skip-host-commands`, or turn on
[`env.rememberHostCommands`](settings.md#envrememberhostcommands) to remember
approval until the commands change:
@z

@x
```console
$ sbx settings set env.rememberHostCommands true
```
@y
```console
$ sbx settings set env.rememberHostCommands true
```
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
| Field      | Type    | Required | Default                              | Description                                     |
| ---------- | ------- | -------- | ------------------------------------ | ----------------------------------------------- |
| `sandbox`  | integer | Yes      | None                                 | Sandbox port from 1 through 65535               |
| `host`     | integer | No       | Ephemeral                            | Host port from 1 through 65535                  |
| `protocol` | string  | No       | `tcp4`, or `tcp6` for IPv6 `hostIP` | `tcp`, `tcp4`, `tcp6`, `udp`, `udp4`, or `udp6` |
| `hostIP`   | string  | No       | Loopback                             | Host interface to bind                          |
@y
| Field      | Type    | Required | Default                              | Description                                     |
| ---------- | ------- | -------- | ------------------------------------ | ----------------------------------------------- |
| `sandbox`  | integer | Yes      | None                                 | Sandbox port from 1 through 65535               |
| `host`     | integer | No       | Ephemeral                            | Host port from 1 through 65535                  |
| `protocol` | string  | No       | `tcp4`, or `tcp6` for IPv6 `hostIP` | `tcp`, `tcp4`, `tcp6`, `udp`, `udp4`, or `udp6` |
| `hostIP`   | string  | No       | Loopback                             | Host interface to bind                          |
@z

@x
Set `protocol: tcp` to bind both IPv4 and IPv6. Leave `hostIP` unset for a
dual-stack binding because an explicit address binds only its own IP family.
@y
Set `protocol: tcp` to bind both IPv4 and IPv6. Leave `hostIP` unset for a
dual-stack binding because an explicit address binds only its own IP family.
@z

@x
If a port can't be published, sandbox creation fails and removes the new
sandbox.
@y
If a port can't be published, sandbox creation fails and removes the new
sandbox.
@z
