%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Kits
description: Extend a sandbox with tools, credentials, network rules, and configuration using declarative YAML artifacts.
keywords: sandboxes, sbx, kits, mixins, customization, extensions, agents
@y
title: Kits
description: Extend a sandbox with tools, credentials, network rules, and configuration using declarative YAML artifacts.
keywords: sandboxes, sbx, kits, mixins, customization, extensions, agents
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
A kit packages a set of capabilities a sandbox can use, such as:
@y
A kit packages a set of capabilities a sandbox can use, such as:
@z

@x
- Tools to install
- Environment variables to set
- Credentials to inject
- Domains to allow
- Files to drop in
- Startup commands to run
@y
- Tools to install
- Environment variables to set
- Credentials to inject
- Domains to allow
- Files to drop in
- Startup commands to run
@z

@x
You declare these in a single `spec.yaml` file, point the CLI at the
directory (or a ZIP, OCI artifact, or Git URL), and the sandbox applies
and enforces them at runtime. Credentials stay on the host and go through
a proxy instead of entering the VM, and outbound traffic is restricted to
the domains the kit allows.
@y
You declare these in a single `spec.yaml` file, point the CLI at the
directory (or a ZIP, OCI artifact, or Git URL), and the sandbox applies
and enforces them at runtime. Credentials stay on the host and go through
a proxy instead of entering the VM, and outbound traffic is restricted to
the domains the kit allows.
@z

@x
A kit is either a mixin or an agent:
@y
A kit is either a mixin or an agent:
@z

@x
- Mixin kits (`kind: mixin`) extend an existing agent with extra
  capabilities. Stack several on the same sandbox.
- Agent kits (`kind: agent`) define a full agent from scratch: its image,
  entrypoint, network policies, and everything else the agent needs.
@y
- Mixin kits (`kind: mixin`) extend an existing agent with extra
  capabilities. Stack several on the same sandbox.
- Agent kits (`kind: agent`) define a full agent from scratch: its image,
  entrypoint, network policies, and everything else the agent needs.
@z

@x
## What kits can do
@y
## What kits can do
@z

@x
### Run commands
@y
### Run commands
@z

@x
A kit can run commands inside the sandbox automatically. **Install
commands** run once at creation; **startup commands** run each time
the sandbox starts.
@y
A kit can run commands inside the sandbox automatically. **Install
commands** run once at creation; **startup commands** run each time
the sandbox starts.
@z

@x
Install commands are the place to put anything an agent needs into the
image, via `apt`, `pip`, `npm`, `curl | bash`, or whatever fits:
@y
Install commands are the place to put anything an agent needs into the
image, via `apt`, `pip`, `npm`, `curl | bash`, or whatever fits:
@z

@x
```yaml
commands:
  install:
    - command: "apt-get update && apt-get install -y jq"
```
@y
```yaml
commands:
  install:
    - command: "apt-get update && apt-get install -y jq"
```
@z

@x
Startup commands cover things like launching background services,
warming caches, or refreshing config on each start:
@y
Startup commands cover things like launching background services,
warming caches, or refreshing config on each start:
@z

@x
```yaml
commands:
  startup:
    - command: ["sh", "-c", "my-daemon &"]
```
@y
```yaml
commands:
  startup:
    - command: ["sh", "-c", "my-daemon &"]
```
@z

@x
### Inject files
@y
### Inject files
@z

@x
Kits can inject files into the sandbox in two ways: **static files** bundled
with the kit, and **`initFiles`** written at startup with runtime values
substituted in.
@y
Kits can inject files into the sandbox in two ways: **static files** bundled
with the kit, and **`initFiles`** written at startup with runtime values
substituted in.
@z

@x
Static files work well for content that doesn't vary between sandboxes, such
as tool configurations, shared linter rules, helper scripts the agent can
invoke, or reference material like a style guide or API cheatsheet.
@y
Static files work well for content that doesn't vary between sandboxes, such
as tool configurations, shared linter rules, helper scripts the agent can
invoke, or reference material like a style guide or API cheatsheet.
@z

@x
```text
my-kit/
├── spec.yaml
└── files/
    ├── home/
    │   └── .config/my-tool/settings.json
    └── workspace/
        └── .editorconfig
```
@y
```text
my-kit/
├── spec.yaml
└── files/
    ├── home/
    │   └── .config/my-tool/settings.json
    └── workspace/
        └── .editorconfig
```
@z

@x
`initFiles` cover content that depends on runtime values, such as an
absolute workspace path that a tool needs to bake into its config file
at startup:
@y
`initFiles` cover content that depends on runtime values, such as an
absolute workspace path that a tool needs to bake into its config file
at startup:
@z

@x
```yaml
commands:
  initFiles:
    - path: /home/agent/.my-tool/config.json
      content: '{"workspace": "${WORKDIR}"}'
      onlyIfMissing: true
```
@y
```yaml
commands:
  initFiles:
    - path: /home/agent/.my-tool/config.json
      content: '{"workspace": "${WORKDIR}"}'
      onlyIfMissing: true
```
@z

@x
See [`initFiles`](#initfiles) in the spec reference for all fields.
@y
See [`initFiles`](#initfiles) in the spec reference for all fields.
@z

@x
### Set environment variables
@y
### Set environment variables
@z

@x
Environment variables set by the kit are available to the agent at
runtime. Sensitive values can be marked proxy-managed, so the real
credential is substituted only when the proxy forwards a request. The
secret itself never enters the VM:
@y
Environment variables set by the kit are available to the agent at
runtime. Sensitive values can be marked proxy-managed, so the real
credential is substituted only when the proxy forwards a request. The
secret itself never enters the VM:
@z

@x
```yaml
environment:
  variables:
    MY_TOOL_WORKSPACE: /home/agent/my-tool
  proxyManaged:
    - MY_TOOL_API_KEY
```
@y
```yaml
environment:
  variables:
    MY_TOOL_WORKSPACE: /home/agent/my-tool
  proxyManaged:
    - MY_TOOL_API_KEY
```
@z

@x
### Control network access
@y
### Control network access
@z

@x
Network rules define which domains the sandbox can reach. For
authenticated services, a domain can be mapped to a service identifier,
and the proxy injects the auth header on forwarded requests:
@y
Network rules define which domains the sandbox can reach. For
authenticated services, a domain can be mapped to a service identifier,
and the proxy injects the auth header on forwarded requests:
@z

@x
```yaml
network:
  allowedDomains:
    - api.example.com
  serviceDomains:
    api.example.com: my-service
  serviceAuth:
    my-service:
      headerName: Authorization
      valueFormat: "Bearer %s"
```
@y
```yaml
network:
  allowedDomains:
    - api.example.com
  serviceDomains:
    api.example.com: my-service
  serviceAuth:
    my-service:
      headerName: Authorization
      valueFormat: "Bearer %s"
```
@z

@x
### Declare credential sources
@y
### Declare credential sources
@z

@x
Credential sources tell the proxy where to find secrets on the host. The
sandbox never sees the value itself. The proxy reads it and injects it
into outbound requests:
@y
Credential sources tell the proxy where to find secrets on the host. The
sandbox never sees the value itself. The proxy reads it and injects it
into outbound requests:
@z

@x
```yaml
credentials:
  sources:
    my-service:
      env:
        - MY_SERVICE_API_KEY
```
@y
```yaml
credentials:
  sources:
    my-service:
      env:
        - MY_SERVICE_API_KEY
```
@z

@x
### Define an agent
@y
### Define an agent
@z

@x
Agent kits declare an `agent:` block with the image the agent runs in and
the command the user attaches to when they launch the sandbox:
@y
Agent kits declare an `agent:` block with the image the agent runs in and
the command the user attaches to when they launch the sandbox:
@z

@x
```yaml
agent:
  image: "my-registry/my-agent:latest"
  entrypoint:
    run: [my-agent, "--yolo"]
```
@y
```yaml
agent:
  image: "my-registry/my-agent:latest"
  entrypoint:
    run: [my-agent, "--yolo"]
```
@z

@x
See [Agent kits](#agent-kits) for use cases and an example.
@y
See [Agent kits](#agent-kits) for use cases and an example.
@z

@x
## Mixin kits
@y
## Mixin kits
@z

@x
A mixin kit extends an existing agent with extra capabilities. Common use
cases:
@y
A mixin kit extends an existing agent with extra capabilities. Common use
cases:
@z

@x
- Pre-install tools: linters, libraries, or other custom programs
- Grant the agent access to a new authenticated service (a database, a
  vendor API)
- Inject shared team config (linter rules, editor settings, dotfiles)
@y
- Pre-install tools: linters, libraries, or other custom programs
- Grant the agent access to a new authenticated service (a database, a
  vendor API)
- Inject shared team config (linter rules, editor settings, dotfiles)
@z

@x
### Example: Python linting kit
@y
### Example: Python linting kit
@z

@x
This kit installs [Ruff](https://docs.astral.sh/ruff/) and injects a shared
configuration file, so every sandbox starts with the same linting setup.
@y
This kit installs [Ruff](https://docs.astral.sh/ruff/) and injects a shared
configuration file, so every sandbox starts with the same linting setup.
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
displayName: Ruff Linter
description: Python linting with shared team config
@y
```yaml {title="ruff-lint/spec.yaml"}
schemaVersion: "1"
kind: mixin
name: ruff-lint
displayName: Ruff Linter
description: Python linting with shared team config
@z

@x
network:
  allowedDomains:
    - pypi.org
    - files.pythonhosted.org
@y
network:
  allowedDomains:
    - pypi.org
    - files.pythonhosted.org
@z

@x
commands:
  install:
    - command: "uv tool install ruff@latest"
      user: "1000"
      description: Install Ruff
```
@y
commands:
  install:
    - command: "uv tool install ruff@latest"
      user: "1000"
      description: Install Ruff
```
@z

@x
```toml {title="ruff-lint/files/workspace/ruff.toml"}
line-length = 100
@y
```toml {title="ruff-lint/files/workspace/ruff.toml"}
line-length = 100
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
> [!TIP]
> The templates for the built-in agents (`claude`, `codex`, etc) already
> includes `uv`, so this mixin can use it without installing it separately.
@y
> [!TIP]
> The templates for the built-in agents (`claude`, `codex`, etc) already
> includes `uv`, so this mixin can use it without installing it separately.
@z

@x
To run an agent with this mixin:
@y
To run an agent with this mixin:
@z

@x
```console
$ sbx run claude --kit /path/to/ruff-lint/
```
@y
```console
$ sbx run claude --kit /path/to/ruff-lint/
```
@z

@x
## Agent kits
@y
## Agent kits
@z

@x
An agent kit defines a full agent from scratch — image, entrypoint, and
everything the agent needs. Common use cases:
@y
An agent kit defines a full agent from scratch — image, entrypoint, and
everything the agent needs. Common use cases:
@z

@x
- Package a custom agent you've built so others can run it
- Ship a team-internal agent with defaults baked in
- Run a fork of an existing agent with your own config
- Prototype a new agent integration
@y
- Package a custom agent you've built so others can run it
- Ship a team-internal agent with defaults baked in
- Run a fork of an existing agent with your own config
- Prototype a new agent integration
@z

@x
Agent kits declare everything a mixin kit can, plus an
[`agent:` block](#agent-block) that tells the sandbox how to launch the
agent. For a step-by-step walkthrough, see
[Build your own agent kit](build-an-agent.md).
@y
Agent kits declare everything a mixin kit can, plus an
[`agent:` block](#agent-block) that tells the sandbox how to launch the
agent. For a step-by-step walkthrough, see
[Build your own agent kit](build-an-agent.md).
@z

@x
### Example: the built-in `claude` agent
@y
### Example: the built-in `claude` agent
@z

@x
The `claude` agent you get from `sbx run claude` is defined as a kit. Here
is an abbreviated version of its spec, showing how the agent block combines
with network, credentials, environment, and commands:
@y
The `claude` agent you get from `sbx run claude` is defined as a kit. Here
is an abbreviated version of its spec, showing how the agent block combines
with network, credentials, environment, and commands:
@z

@x
```yaml {title="claude/spec.yaml"}
schemaVersion: "1"
kind: agent
name: claude
agent:
  image: "docker/sandbox-templates:claude-code-docker"
  aiFilename: CLAUDE.md
  persistence: persistent
  entrypoint:
    run: [claude, "--dangerously-skip-permissions"]
@y
```yaml {title="claude/spec.yaml"}
schemaVersion: "1"
kind: agent
name: claude
agent:
  image: "docker/sandbox-templates:claude-code-docker"
  aiFilename: CLAUDE.md
  persistence: persistent
  entrypoint:
    run: [claude, "--dangerously-skip-permissions"]
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
@y
credentials:
  sources:
    anthropic:
      env:
        - ANTHROPIC_API_KEY
@z

@x
environment:
  variables:
    IS_SANDBOX: "1"
@y
environment:
  variables:
    IS_SANDBOX: "1"
@z

@x
commands:
  install:
    - command: "curl -fsSL https://claude.ai/install.sh | bash"
      user: "1000"
      description: Install Claude Code
```
@y
commands:
  install:
    - command: "curl -fsSL https://claude.ai/install.sh | bash"
      user: "1000"
      description: Install Claude Code
```
@z

@x
## Using kits
@y
## Using kits
@z

@x
Kits can be loaded from a local path (a directory or ZIP file), a Git
repository, or an OCI registry. Pass `--kit` more than once to stack
several kits on the same sandbox.
@y
Kits can be loaded from a local path (a directory or ZIP file), a Git
repository, or an OCI registry. Pass `--kit` more than once to stack
several kits on the same sandbox.
@z

@x
> [!IMPORTANT]
> `--kit` only takes effect when a sandbox is created. Passing it
> against an existing sandbox name fails with
> `--kit can only be used when creating a new sandbox`. To extend a
> running sandbox with a kit, use [`sbx kit add`](#local) instead.
@y
> [!IMPORTANT]
> `--kit` only takes effect when a sandbox is created. Passing it
> against an existing sandbox name fails with
> `--kit can only be used when creating a new sandbox`. To extend a
> running sandbox with a kit, use [`sbx kit add`](#local) instead.
@z

@x
### Local
@y
### Local
@z

@x
Point `--kit` at a directory or ZIP file on disk:
@y
Point `--kit` at a directory or ZIP file on disk:
@z

@x
```console
$ sbx run claude --kit ./my-kit/
$ sbx run claude --kit ./my-kit-1.0.zip
```
@y
```console
$ sbx run claude --kit ./my-kit/
$ sbx run claude --kit ./my-kit-1.0.zip
```
@z

@x
While iterating on a kit, apply changes to a running sandbox with
`sbx kit add` instead of recreating it:
@y
While iterating on a kit, apply changes to a running sandbox with
`sbx kit add` instead of recreating it:
@z

@x
```console
$ sbx kit add my-sandbox ./my-kit/
```
@y
```console
$ sbx kit add my-sandbox ./my-kit/
```
@z

@x
`kit add` re-runs install commands and re-copies files. Kits can't be
removed from a running sandbox — remove and recreate it to start clean.
@y
`kit add` re-runs install commands and re-copies files. Kits can't be
removed from a running sandbox — remove and recreate it to start clean.
@z

@x
### Git repository
@y
### Git repository
@z

@x
```console
$ sbx run claude --kit "git+https://github.com/<owner>/<repo>.git#ref=v0.1.0&dir=code-server"
```
@y
```console
$ sbx run claude --kit "git+https://github.com/<owner>/<repo>.git#ref=v0.1.0&dir=code-server"
```
@z

@x
- `#ref=<branch|tag|commit>` pins to a specific revision. Defaults to the
  repository's default branch.
- `#dir=<path>` loads a kit from a subdirectory.
- `git+ssh://` URLs also work, using your local SSH agent, Git credential
  helpers, and `.netrc`.
- Quote the URL in shells where `&` starts a background job.
@y
- `#ref=<branch|tag|commit>` pins to a specific revision. Defaults to the
  repository's default branch.
- `#dir=<path>` loads a kit from a subdirectory.
- `git+ssh://` URLs also work, using your local SSH agent, Git credential
  helpers, and `.netrc`.
- Quote the URL in shells where `&` starts a background job.
@z

@x
### OCI registry
@y
### OCI registry
@z

@x
```console
$ sbx run claude --kit ghcr.io/myorg/my-kit:1.0
```
@y
```console
$ sbx run claude --kit ghcr.io/myorg/my-kit:1.0
```
@z

@x
For Docker Hub, include the full `docker.io` prefix. See
[Packaging and distribution](#packaging-and-distribution) for publishing.
@y
For Docker Hub, include the full `docker.io` prefix. See
[Packaging and distribution](#packaging-and-distribution) for publishing.
@z

@x
## Packaging and distribution
@y
## Packaging and distribution
@z

@x
The `sbx kit` subcommands validate, inspect, and publish kits:
@y
The `sbx kit` subcommands validate, inspect, and publish kits:
@z

@x
- `sbx kit validate <path>` — check that a kit directory or ZIP is
  well-formed.
- `sbx kit inspect <path>` — display kit details. Add `--json` for
  machine-readable output.
- `sbx kit pack <path> -o <file.zip>` — package a directory as a ZIP file
  for sharing.
- `sbx kit push <path> <ref>` — publish to an OCI registry (for example,
  `ghcr.io/myorg/my-kit:1.0`).
- `sbx kit pull <ref>` — download a kit from a registry as a ZIP file to
  the working directory.
@y
- `sbx kit validate <path>` — check that a kit directory or ZIP is
  well-formed.
- `sbx kit inspect <path>` — display kit details. Add `--json` for
  machine-readable output.
- `sbx kit pack <path> -o <file.zip>` — package a directory as a ZIP file
  for sharing.
- `sbx kit push <path> <ref>` — publish to an OCI registry (for example,
  `ghcr.io/myorg/my-kit:1.0`).
- `sbx kit pull <ref>` — download a kit from a registry as a ZIP file to
  the working directory.
@z

@x
For Docker Hub, include the full `docker.io` prefix — `sbx` doesn't add it
automatically.
@y
For Docker Hub, include the full `docker.io` prefix — `sbx` doesn't add it
automatically.
@z

@x
## Spec reference
@y
## Spec reference
@z

@x
A kit directory has a required `spec.yaml` and an optional `files/` tree:
@y
A kit directory has a required `spec.yaml` and an optional `files/` tree:
@z

@x
```text
my-kit/
├── spec.yaml       # required
└── files/          # optional — static files to inject
    ├── home/
    └── workspace/
```
@y
```text
my-kit/
├── spec.yaml       # required
└── files/          # optional — static files to inject
    ├── home/
    └── workspace/
```
@z

@x
### Top-level fields
@y
### Top-level fields
@z

@x
```yaml
schemaVersion: "1"
kind: <mixin | agent>
name: <name>
displayName: <name>
description: <text>
```
@y
```yaml
schemaVersion: "1"
kind: <mixin | agent>
name: <name>
displayName: <name>
description: <text>
```
@z

@x
| Field           | Required | Description                                                              |
| --------------- | -------- | ------------------------------------------------------------------------ |
| `schemaVersion` | Yes      | Spec schema version. Set to `"1"`.                                       |
| `kind`          | Yes      | `mixin` for kits that extend an agent; `agent` for kits that define one. |
| `name`          | Yes      | Unique identifier. Lowercase, alphanumeric, hyphens.                     |
| `displayName`   | No       | Human-readable name.                                                     |
| `description`   | No       | Short description.                                                       |
@y
| Field           | Required | Description                                                              |
| --------------- | -------- | ------------------------------------------------------------------------ |
| `schemaVersion` | Yes      | Spec schema version. Set to `"1"`.                                       |
| `kind`          | Yes      | `mixin` for kits that extend an agent; `agent` for kits that define one. |
| `name`          | Yes      | Unique identifier. Lowercase, alphanumeric, hyphens.                     |
| `displayName`   | No       | Human-readable name.                                                     |
| `description`   | No       | Short description.                                                       |
@z

@x
The sections below apply to both kinds. Agent kits also declare an
[`agent:` block](#agent-block).
@y
The sections below apply to both kinds. Agent kits also declare an
[`agent:` block](#agent-block).
@z

@x
### Credentials
@y
### Credentials
@z

@x
```yaml
credentials:
  sources:
    <service-id>:
      env: [<env-var>, ...]
      file:
        path: <path>
        parser: <parser>
      priority: <env-first | file-first>
```
@y
```yaml
credentials:
  sources:
    <service-id>:
      env: [<env-var>, ...]
      file:
        path: <path>
        parser: <parser>
      priority: <env-first | file-first>
```
@z

@x
| Field                      | Description                                                   |
| -------------------------- | ------------------------------------------------------------- |
| `sources`                  | Map of service identifier to credential source.               |
| `sources.<id>.env`         | Environment variables to read on the host, in priority order. |
| `sources.<id>.file.path`   | Path on host. `~` expands to home.                            |
| `sources.<id>.file.parser` | How to extract the value (for example, `"json:apiKey"`).      |
| `sources.<id>.priority`    | `env-first` (default) or `file-first`.                        |
@y
| Field                      | Description                                                   |
| -------------------------- | ------------------------------------------------------------- |
| `sources`                  | Map of service identifier to credential source.               |
| `sources.<id>.env`         | Environment variables to read on the host, in priority order. |
| `sources.<id>.file.path`   | Path on host. `~` expands to home.                            |
| `sources.<id>.file.parser` | How to extract the value (for example, `"json:apiKey"`).      |
| `sources.<id>.priority`    | `env-first` (default) or `file-first`.                        |
@z

@x
Service identifiers link credentials to [network rules](#network).
@y
Service identifiers link credentials to [network rules](#network).
@z

@x
### Network
@y
### Network
@z

@x
```yaml
network:
  allowedDomains: [<domain>, ...]
  serviceDomains:
    <domain>: <service-id>
  serviceAuth:
    <service-id>:
      headerName: <header>
      valueFormat: <format>
```
@y
```yaml
network:
  allowedDomains: [<domain>, ...]
  serviceDomains:
    <domain>: <service-id>
  serviceAuth:
    <service-id>:
      headerName: <header>
      valueFormat: <format>
```
@z

@x
| Field                     | Description                                                      |
| ------------------------- | ---------------------------------------------------------------- |
| `allowedDomains`          | Domains the sandbox can reach. Wildcards supported.              |
| `serviceDomains`          | Map of domain to service identifier from `credentials.sources`.  |
| `serviceAuth.headerName`  | HTTP header the proxy sets (for example, `Authorization`).       |
| `serviceAuth.valueFormat` | Format string for the header value (for example, `"Bearer %s"`). |
@y
| Field                     | Description                                                      |
| ------------------------- | ---------------------------------------------------------------- |
| `allowedDomains`          | Domains the sandbox can reach. Wildcards supported.              |
| `serviceDomains`          | Map of domain to service identifier from `credentials.sources`.  |
| `serviceAuth.headerName`  | HTTP header the proxy sets (for example, `Authorization`).       |
| `serviceAuth.valueFormat` | Format string for the header value (for example, `"Bearer %s"`). |
@z

@x
### Environment
@y
### Environment
@z

@x
```yaml
environment:
  variables:
    <NAME>: <value>
  proxyManaged: [<NAME>, ...]
```
@y
```yaml
environment:
  variables:
    <NAME>: <value>
  proxyManaged: [<NAME>, ...]
```
@z

@x
| Field          | Description                                                                                                         |
| -------------- | ------------------------------------------------------------------------------------------------------------------- |
| `variables`    | Key-value pairs set directly in the container.                                                                      |
| `proxyManaged` | Environment variable names populated by the proxy at request time. Pair with [`credentials.sources`](#credentials). |
@y
| Field          | Description                                                                                                         |
| -------------- | ------------------------------------------------------------------------------------------------------------------- |
| `variables`    | Key-value pairs set directly in the container.                                                                      |
| `proxyManaged` | Environment variable names populated by the proxy at request time. Pair with [`credentials.sources`](#credentials). |
@z

@x
Variable names must be valid shell identifiers (`[A-Za-z_][A-Za-z0-9_]*`).
@y
Variable names must be valid shell identifiers (`[A-Za-z_][A-Za-z0-9_]*`).
@z

@x
### Commands
@y
### Commands
@z

@x
```yaml
commands:
  install:
    - command: <shell-string>
      user: <uid>
      description: <text>
  startup:
    - command: [<argv>, ...]
      user: <uid>
      background: <true | false>
      description: <text>
  initFiles:
    - path: <path>
      content: <text>
      mode: <octal>
      onlyIfMissing: <true | false>
      description: <text>
```
@y
```yaml
commands:
  install:
    - command: <shell-string>
      user: <uid>
      description: <text>
  startup:
    - command: [<argv>, ...]
      user: <uid>
      background: <true | false>
      description: <text>
  initFiles:
    - path: <path>
      content: <text>
      mode: <octal>
      onlyIfMissing: <true | false>
      description: <text>
```
@z

@x
#### `install`
@y
#### `install`
@z

@x
Runs once during sandbox creation. Shell strings passed to `sh -c`.
@y
Runs once during sandbox creation. Shell strings passed to `sh -c`.
@z

@x
| Field         | Default | Description                   |
| ------------- | ------- | ----------------------------- |
| `command`     | —       | Shell command string.         |
| `user`        | `"0"`   | User to run as. `"0"` = root. |
| `description` | —       | Human-readable description.   |
@y
| Field         | Default | Description                   |
| ------------- | ------- | ----------------------------- |
| `command`     | —       | Shell command string.         |
| `user`        | `"0"`   | User to run as. `"0"` = root. |
| `description` | —       | Human-readable description.   |
@z

@x
#### `startup`
@y
#### `startup`
@z

@x
Runs at every sandbox start. String array, not interpreted by a shell.
@y
Runs at every sandbox start. String array, not interpreted by a shell.
@z

@x
| Field         | Default  | Description                         |
| ------------- | -------- | ----------------------------------- |
| `command`     | —        | Command and args as a string array. |
| `user`        | `"1000"` | User to run as. `"1000"` = agent.   |
| `background`  | `false`  | Run in background.                  |
| `description` | —        | Human-readable description.         |
@y
| Field         | Default  | Description                         |
| ------------- | -------- | ----------------------------------- |
| `command`     | —        | Command and args as a string array. |
| `user`        | `"1000"` | User to run as. `"1000"` = agent.   |
| `background`  | `false`  | Run in background.                  |
| `description` | —        | Human-readable description.         |
@z

@x
Startup commands are non-interactive. They run before the agent
attaches, with no terminal connected, so they can't prompt the user
(for example, an interactive `aws login` will hang or fail). They also
don't gate the agent's entrypoint: the agent launches once startup
commands have been dispatched, regardless of `background`. Use them
for non-interactive prep — launching daemons, warming caches,
refreshing config — and use `commands.initFiles` for any value that
needs to land on disk before the agent runs.
@y
Startup commands are non-interactive. They run before the agent
attaches, with no terminal connected, so they can't prompt the user
(for example, an interactive `aws login` will hang or fail). They also
don't gate the agent's entrypoint: the agent launches once startup
commands have been dispatched, regardless of `background`. Use them
for non-interactive prep — launching daemons, warming caches,
refreshing config — and use `commands.initFiles` for any value that
needs to land on disk before the agent runs.
@z

@x
#### `initFiles`
@y
#### `initFiles`
@z

@x
Files written at sandbox start, with runtime substitution.
@y
Files written at sandbox start, with runtime substitution.
@z

@x
| Field           | Default  | Description                                               |
| --------------- | -------- | --------------------------------------------------------- |
| `path`          | —        | Absolute container path.                                  |
| `content`       | —        | File content. `${WORKDIR}` expands to the workspace path. |
| `mode`          | `"0644"` | File permissions in octal.                                |
| `onlyIfMissing` | `false`  | Skip if the file already exists.                          |
@y
| Field           | Default  | Description                                               |
| --------------- | -------- | --------------------------------------------------------- |
| `path`          | —        | Absolute container path.                                  |
| `content`       | —        | File content. `${WORKDIR}` expands to the workspace path. |
| `mode`          | `"0644"` | File permissions in octal.                                |
| `onlyIfMissing` | `false`  | Skip if the file already exists.                          |
@z

@x
### Static files
@y
### Static files
@z

@x
```text
my-kit/files/
├── home/       → /home/agent/
└── workspace/  → primary workspace path
```
@y
```text
my-kit/files/
├── home/       → /home/agent/
└── workspace/  → primary workspace path
```
@z

@x
| Kit path           | Container destination                   |
| ------------------ | --------------------------------------- |
| `files/home/`      | `/home/agent/` (config files, dotfiles) |
| `files/workspace/` | The primary workspace path              |
@y
| Kit path           | Container destination                   |
| ------------------ | --------------------------------------- |
| `files/home/`      | `/home/agent/` (config files, dotfiles) |
| `files/workspace/` | The primary workspace path              |
@z

@x
Parent directories are created automatically. Existing files are
overwritten. Absolute paths and path-traversal sequences (`../../`) are
rejected.
@y
Parent directories are created automatically. Existing files are
overwritten. Absolute paths and path-traversal sequences (`../../`) are
rejected.
@z

@x
### Agent block
@y
### Agent block
@z

@x
Required for `kind: agent`.
@y
Required for `kind: agent`.
@z

@x
```yaml
agent:
  image: <image-ref>
  aiFilename: <filename>
  persistence: <persistent | ephemeral>
  entrypoint:
    run: [<argv>, ...]
    args: [<arg>, ...]
```
@y
```yaml
agent:
  image: <image-ref>
  aiFilename: <filename>
  persistence: <persistent | ephemeral>
  entrypoint:
    run: [<argv>, ...]
    args: [<arg>, ...]
```
@z

@x
| Field                   | Required | Description                                                                                    |
| ----------------------- | -------- | ---------------------------------------------------------------------------------------------- |
| `agent.image`           | Yes      | Docker image reference. See [Base image requirements](#base-image-requirements).               |
| `agent.aiFilename`      | No       | Memory filename (for example, `AGENTS.md`). Appends top-level [`memory`](#memory) at creation. |
| `agent.persistence`     | No       | `persistent` (named volume across restarts) or `ephemeral` (default).                          |
| `agent.entrypoint.run`  | No       | Command and args as a string array. Replaces the image's entrypoint.                           |
| `agent.entrypoint.args` | No       | Args appended to the image's existing entrypoint.                                              |
@y
| Field                   | Required | Description                                                                                    |
| ----------------------- | -------- | ---------------------------------------------------------------------------------------------- |
| `agent.image`           | Yes      | Docker image reference. See [Base image requirements](#base-image-requirements).               |
| `agent.aiFilename`      | No       | Memory filename (for example, `AGENTS.md`). Appends top-level [`memory`](#memory) at creation. |
| `agent.persistence`     | No       | `persistent` (named volume across restarts) or `ephemeral` (default).                          |
| `agent.entrypoint.run`  | No       | Command and args as a string array. Replaces the image's entrypoint.                           |
| `agent.entrypoint.args` | No       | Args appended to the image's existing entrypoint.                                              |
@z

@x
#### Base image requirements
@y
#### Base image requirements
@z

@x
The agent's container image must provide:
@y
The agent's container image must provide:
@z

@x
- A non-root `agent` user at UID 1000 with passwordless sudo.
- A `/home/agent/` home directory owned by `agent`.
- HTTP proxy environment variables (`HTTP_PROXY`, `HTTPS_PROXY`,
  `NO_PROXY`) preserved across sudo.
- The agent binary (baked in, or installed via
  [`commands.install`](#commands)).
@y
- A non-root `agent` user at UID 1000 with passwordless sudo.
- A `/home/agent/` home directory owned by `agent`.
- HTTP proxy environment variables (`HTTP_PROXY`, `HTTPS_PROXY`,
  `NO_PROXY`) preserved across sudo.
- The agent binary (baked in, or installed via
  [`commands.install`](#commands)).
@z

@x
Build on top of `docker/sandbox-templates:shell-docker` to get these for
free.
@y
Build on top of `docker/sandbox-templates:shell-docker` to get these for
free.
@z

@x
#### Memory
@y
#### Memory
@z

@x
```yaml
memory: |
  <markdown>
```
@y
```yaml
memory: |
  <markdown>
```
@z

@x
Top-level field. Markdown appended to the agent's memory file at sandbox
creation. The agent reads this content at startup, so write it as
instructions or notes the agent should follow when working in the
sandbox. Applied only when `agent.aiFilename` is set.
@y
Top-level field. Markdown appended to the agent's memory file at sandbox
creation. The agent reads this content at startup, so write it as
instructions or notes the agent should follow when working in the
sandbox. Applied only when `agent.aiFilename` is set.
@z

@x
The file is written to the parent of the workspace path inside the
sandbox, not to the workspace itself. For a workspace mounted at
`/Users/you/myproject`, the memory file lands at
`/Users/you/AGENTS.md` (or whatever `aiFilename` is set to). It exists
only inside the sandbox — nothing is written to the host.
@y
The file is written to the parent of the workspace path inside the
sandbox, not to the workspace itself. For a workspace mounted at
`/Users/you/myproject`, the memory file lands at
`/Users/you/AGENTS.md` (or whatever `aiFilename` is set to). It exists
only inside the sandbox — nothing is written to the host.
@z

@x
## Debugging
@y
## Debugging
@z

@x
When a kit doesn't behave as expected, start with the network policy log
and direct inspection inside the sandbox:
@y
When a kit doesn't behave as expected, start with the network policy log
and direct inspection inside the sandbox:
@z

@x
- `sbx policy log` shows every outbound request the sandbox proxy saw,
  the rule it matched, extra context when available, and its `PROXY`
  value, such as `forward`, `forward-bypass`, `transparent`, or
  `browser-open`. Use it to diagnose install-time download failures,
  blocked domains, and unexpected TLS interception. If downloads fail or
  arrive corrupted after you add `serviceDomains`, check whether the
  service mapping is too broad. Map only the hosts that need credential
  injection.
- `sbx exec <sandbox> -- <cmd>` runs an arbitrary command inside an
  existing sandbox. Useful for inspecting post-install state without
  recreating: `which mytool`, `ls /home/agent/.local/bin/`,
  `cat /home/agent/.config/...`, and so on.
@y
- `sbx policy log` shows every outbound request the sandbox proxy saw,
  the rule it matched, extra context when available, and its `PROXY`
  value, such as `forward`, `forward-bypass`, `transparent`, or
  `browser-open`. Use it to diagnose install-time download failures,
  blocked domains, and unexpected TLS interception. If downloads fail or
  arrive corrupted after you add `serviceDomains`, check whether the
  service mapping is too broad. Map only the hosts that need credential
  injection.
- `sbx exec <sandbox> -- <cmd>` runs an arbitrary command inside an
  existing sandbox. Useful for inspecting post-install state without
  recreating: `which mytool`, `ls /home/agent/.local/bin/`,
  `cat /home/agent/.config/...`, and so on.
@z

@x
Install and startup command output is only emitted during `sbx run` or
`sbx create`; `sbx` doesn't retain it for later inspection. To repeat
setup with fresh output, remove and recreate the sandbox:
`sbx rm <sandbox> && sbx run ...`.
@y
Install and startup command output is only emitted during `sbx run` or
`sbx create`; `sbx` doesn't retain it for later inspection. To repeat
setup with fresh output, remove and recreate the sandbox:
`sbx rm <sandbox> && sbx run ...`.
@z
