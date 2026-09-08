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
- Network rules to allow or deny domains
- Files to drop in
- Startup commands to run
- Memory instructions to give the agent
@y
- Tools to install
- Environment variables to set
- Credentials to inject
- Network rules to allow or deny domains
- Files to drop in
- Startup commands to run
- Memory instructions to give the agent
@z

@x
You declare these in a single `spec.yaml` file, point the CLI at the
directory (or a ZIP, OCI artifact, or Git URL), and the sandbox applies
and enforces them at runtime. Credentials stay on the host and go through
a proxy instead of entering the VM, and outbound traffic is restricted to
the domains permitted by the kit's network rules.
@y
You declare these in a single `spec.yaml` file, point the CLI at the
directory (or a ZIP, OCI artifact, or Git URL), and the sandbox applies
and enforces them at runtime. Credentials stay on the host and go through
a proxy instead of entering the VM, and outbound traffic is restricted to
the domains permitted by the kit's network rules.
@z

@x
A kit is either a mixin or a sandbox:
@y
A kit is either a mixin or a sandbox:
@z

@x
- Mixin kits (`kind: mixin`) extend an existing agent with extra
  capabilities. Stack several on the same sandbox.
- Sandbox kits (`kind: sandbox`) define a full agent from scratch: its image,
  entrypoint, network policies, and everything else the agent needs.
@y
- Mixin kits (`kind: mixin`) extend an existing agent with extra
  capabilities. Stack several on the same sandbox.
- Sandbox kits (`kind: sandbox`) define a full agent from scratch: its image,
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
setup:
  install:
    - command: "apt-get update && apt-get install -y jq"
```
@y
```yaml
setup:
  install:
    - command: "apt-get update && apt-get install -y jq"
```
@z

@x
Startup commands are for work that can run alongside the agent, such as a
background service. They must be idempotent — see the
[`startup`](kit-reference.md#startup) spec reference:
@y
Startup commands are for work that can run alongside the agent, such as a
background service. They must be idempotent — see the
[`startup`](kit-reference.md#startup) spec reference:
@z

@x
```yaml
setup:
  startup:
    - command: ["my-daemon"]
      background: true
```
@y
```yaml
setup:
  startup:
    - command: ["my-daemon"]
      background: true
```
@z

@x
### Inject files
@y
### Inject files
@z

@x
Kits can inject files into the sandbox in two ways: **static files** bundled
with the kit, and **`setup.files`** written at startup with runtime values
substituted in.
@y
Kits can inject files into the sandbox in two ways: **static files** bundled
with the kit, and **`setup.files`** written at startup with runtime values
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
`setup.files` cover content that depends on runtime values, such as an
absolute workspace path that a tool needs to bake into its config file
at startup:
@y
`setup.files` cover content that depends on runtime values, such as an
absolute workspace path that a tool needs to bake into its config file
at startup:
@z

@x
```yaml
setup:
  files:
    - path: /home/agent/.my-tool/config.json
      content: '{"workspace": "${WORKDIR}"}'
      onlyIfMissing: true
```
@y
```yaml
setup:
  files:
    - path: /home/agent/.my-tool/config.json
      content: '{"workspace": "${WORKDIR}"}'
      onlyIfMissing: true
```
@z

@x
See [`setup.files`](kit-reference.md#files) in the spec reference for all
fields.
@y
See [`setup.files`](kit-reference.md#files) in the spec reference for all
fields.
@z

@x
#### Sandbox-managed agent configuration
@y
#### Sandbox-managed agent configuration
@z

@x
Built-in agent kits reserve the following paths for sandbox setup. Treat these
paths as sandbox-managed, even if a file is only needed for a particular
feature. Don't target them with static files, `setup.files`, or install
commands. Later setup can replace your content or depend on settings that your
file removes. In this table, `~` is `/home/agent`.
@y
Built-in agent kits reserve the following paths for sandbox setup. Treat these
paths as sandbox-managed, even if a file is only needed for a particular
feature. Don't target them with static files, `setup.files`, or install
commands. Later setup can replace your content or depend on settings that your
file removes. In this table, `~` is `/home/agent`.
@z

@x
| Built-in agent kit | Managed configuration paths |
| ------------------ | --------------------------- |
| `claude` | `~/.claude.json`, `~/.claude/settings.json`, `~/.claude/.config.json` |
| `codex` | `~/.codex/config.toml` |
| `copilot` | `~/.copilot/config.json` |
| `cursor` | `~/.cursor/cli-config.json` |
| `gemini` | `~/.gemini/settings.json` |
| `kiro` | `~/.kiro/settings/mcp.json` |
| `opencode` | `~/.config/opencode/opencode.json` |
@y
| Built-in agent kit | Managed configuration paths |
| ------------------ | --------------------------- |
| `claude` | `~/.claude.json`, `~/.claude/settings.json`, `~/.claude/.config.json` |
| `codex` | `~/.codex/config.toml` |
| `copilot` | `~/.copilot/config.json` |
| `cursor` | `~/.cursor/cli-config.json` |
| `gemini` | `~/.gemini/settings.json` |
| `kiro` | `~/.kiro/settings/mcp.json` |
| `opencode` | `~/.config/opencode/opencode.json` |
@z

@x
Use a separate settings layer when the agent supports one. For example, Claude
Code can load an additional settings file with `--settings`, and OpenCode can
load one from the path in `OPENCODE_CONFIG`. See
[Customize agent settings](kit-examples.md#customize-agent-settings) for
examples. Don't use `setup.startup` for settings the agent must read during
initialization because startup commands don't gate the agent entrypoint.
@y
Use a separate settings layer when the agent supports one. For example, Claude
Code can load an additional settings file with `--settings`, and OpenCode can
load one from the path in `OPENCODE_CONFIG`. See
[Customize agent settings](kit-examples.md#customize-agent-settings) for
examples. Don't use `setup.startup` for settings the agent must read during
initialization because startup commands don't gate the agent entrypoint.
@z

@x
### Set environment variables
@y
### Set environment variables
@z

@x
Environment variables set by the kit are available to the agent at
runtime:
@y
Environment variables set by the kit are available to the agent at
runtime:
@z

@x
```yaml
environment:
  variables:
    MY_TOOL_WORKSPACE: /home/agent/my-tool
```
@y
```yaml
environment:
  variables:
    MY_TOOL_WORKSPACE: /home/agent/my-tool
```
@z

@x
For credentials, see
[Authenticate to external services](#authenticate-to-external-services).
Don't put secret values directly in `environment.variables` — they'd
be visible inside the sandbox VM.
@y
For credentials, see
[Authenticate to external services](#authenticate-to-external-services).
Don't put secret values directly in `environment.variables` — they'd
be visible inside the sandbox VM.
@z

@x
> [!IMPORTANT]
> The sandbox manages proxy settings for you. It sets `HTTP_PROXY`,
> `HTTPS_PROXY`, `NO_PROXY`, and their lowercase equivalents automatically so
> that traffic flows through its built-in forward proxy, which enforces
> network policy and injects credentials. Leave these variables to the
> sandbox — setting them in a kit points traffic away from the forward proxy,
> so it can no longer apply network policy or inject credentials, and those
> requests typically fail to connect. To send sandbox traffic through an
> upstream corporate proxy, configure it on the host. See
> [Upstream proxy](../architecture.md#upstream-proxy).
@y
> [!IMPORTANT]
> The sandbox manages proxy settings for you. It sets `HTTP_PROXY`,
> `HTTPS_PROXY`, `NO_PROXY`, and their lowercase equivalents automatically so
> that traffic flows through its built-in forward proxy, which enforces
> network policy and injects credentials. Leave these variables to the
> sandbox — setting them in a kit points traffic away from the forward proxy,
> so it can no longer apply network policy or inject credentials, and those
> requests typically fail to connect. To send sandbox traffic through an
> upstream corporate proxy, configure it on the host. See
> [Upstream proxy](../architecture.md#upstream-proxy).
@z

@x
### Control network access
@y
### Control network access
@z

@x
Network rules define which domains the sandbox can reach or block. Kit
network rules apply only to sandboxes that use the kit:
@y
Network rules define which domains the sandbox can reach or block. Kit
network rules apply only to sandboxes that use the kit:
@z

@x
```yaml
permissions:
  network:
    allow:
      - api.example.com
      - "*.cdn.example.com"
    deny:
      - telemetry.example.com
```
@y
```yaml
permissions:
  network:
    allow:
      - api.example.com
      - "*.cdn.example.com"
    deny:
      - telemetry.example.com
```
@z

@x
Use `allow` for hosts the agent needs, such as package
registries, install endpoints, or external APIs. Use `deny` for
hosts the agent should not reach, such as telemetry endpoints. If a domain
matches both an allow rule and a deny rule, the deny rule wins.
@y
Use `allow` for hosts the agent needs, such as package
registries, install endpoints, or external APIs. Use `deny` for
hosts the agent should not reach, such as telemetry endpoints. If a domain
matches both an allow rule and a deny rule, the deny rule wins.
@z

@x
> [!IMPORTANT]
> When organization governance is active, only organization allow rules grant
> access, so kit-defined `allow` rules are ignored — including any domains a kit
> allows for the agent to reach. Kit-defined `deny` rules still apply, because a
> deny can only restrict access further. For details, see
> [Policy precedence](../governance/concepts.md#precedence).
@y
> [!IMPORTANT]
> When organization governance is active, only organization allow rules grant
> access, so kit-defined `allow` rules are ignored — including any domains a kit
> allows for the agent to reach. Kit-defined `deny` rules still apply, because a
> deny can only restrict access further. For details, see
> [Policy precedence](../governance/concepts.md#precedence).
@z

@x
For authenticated services, see
[Authenticate to external services](#authenticate-to-external-services).
@y
For authenticated services, see
[Authenticate to external services](#authenticate-to-external-services).
@z

@x
### Authenticate to external services
@y
### Authenticate to external services
@z

@x
A kit can attach credentials to outbound requests through the
host-side proxy. The agent inside the VM works with a sentinel value;
the proxy reads the real credential on the host and overwrites the
auth header before the request leaves the sandbox.
@y
A kit can attach credentials to outbound requests through the
host-side proxy. The agent inside the VM works with a sentinel value;
the proxy reads the real credential on the host and overwrites the
auth header before the request leaves the sandbox.
@z

@x
A kit declares the service, the in-container environment variable, and how
to inject the credential. It doesn't declare a host discovery source. The user
provides the value through the secret store or first-run prompt, and a
[credential binding](../configuration/credentials.md) authorizes its use:
@y
A kit declares the service, the in-container environment variable, and how
to inject the credential. It doesn't declare a host discovery source. The user
provides the value through the secret store or first-run prompt, and a
[credential binding](../configuration/credentials.md) authorizes its use:
@z

@x
```yaml
credentials:
  - service: my-service
    apiKey:
      name: MY_SERVICE_API_KEY # in-VM env var, set to a sentinel
      proxyManaged: true
      inject:
        - domain: api.example.com # inject on requests to this domain
          header: Authorization # overwrite this header
          format: "Bearer %s"
@y
```yaml
credentials:
  - service: my-service
    apiKey:
      name: MY_SERVICE_API_KEY # in-VM env var, set to a sentinel
      proxyManaged: true
      inject:
        - domain: api.example.com # inject on requests to this domain
          header: Authorization # overwrite this header
          format: "Bearer %s"
@z

@x
permissions:
  network:
    allow:
      - api.example.com # the domain must also be reachable
```
@y
permissions:
  network:
    allow:
      - api.example.com # the domain must also be reachable
```
@z

@x
The agent boots with `MY_SERVICE_API_KEY=proxy-managed`, sends a
request with that sentinel in `Authorization`, and the proxy overwrites
the header with the real credential before forwarding. The real
secret never enters the VM.
@y
The agent boots with `MY_SERVICE_API_KEY=proxy-managed`, sends a
request with that sentinel in `Authorization`, and the proxy overwrites
the header with the real credential before forwarding. The real
secret never enters the VM.
@z

@x
See [Credentials](../configuration/credentials.md) for how to provide the
credential value on your host, other approaches for cases the example
above doesn't fit, and what the proxy does at request time. See
[Credential bindings](../configuration/credentials.md) to approve the mechanisms
and domains declared by a third-party v2 kit.
@y
See [Credentials](../configuration/credentials.md) for how to provide the
credential value on your host, other approaches for cases the example
above doesn't fit, and what the proxy does at request time. See
[Credential bindings](../configuration/credentials.md) to approve the mechanisms
and domains declared by a third-party v2 kit.
@z

@x
### Inject agent memory
@y
### Inject agent memory
@z

@x
A kit can append content to the agent's memory file, such as `CLAUDE.md`
or `AGENTS.md`. The agent reads this file at startup. Use it to give
the agent project conventions, usage tips for a tool the kit installs,
or other guidance that should be in scope when the sandbox runs.
@y
A kit can append content to the agent's memory file, such as `CLAUDE.md`
or `AGENTS.md`. The agent reads this file at startup. Use it to give
the agent project conventions, usage tips for a tool the kit installs,
or other guidance that should be in scope when the sandbox runs.
@z

@x
```yaml
agentInstructions:
  content: |
    Ruff is installed. Run `ruff check` before committing.
    Shared config lives at `/workspace/ruff.toml`.
```
@y
```yaml
agentInstructions:
  content: |
    Ruff is installed. Run `ruff check` before committing.
    Shared config lives at `/workspace/ruff.toml`.
```
@z

@x
Both mixin and sandbox kits can declare `agentInstructions.content`. The active
sandbox kit sets `agentInstructions.filename`, which determines the memory
file's name. The sandbox kit's content is written inline in that file. Each
mixin's content is written to its own `<kit-name>.md` file under a sibling
`kits-memory/` directory, and the main memory file gets a `## Kits` section that
points to each mixin file:
@y
Both mixin and sandbox kits can declare `agentInstructions.content`. The active
sandbox kit sets `agentInstructions.filename`, which determines the memory
file's name. The sandbox kit's content is written inline in that file. Each
mixin's content is written to its own `<kit-name>.md` file under a sibling
`kits-memory/` directory, and the main memory file gets a `## Kits` section that
points to each mixin file:
@z

@x
```text
/Users/you/
├── myproject/              # workspace
├── AGENTS.md               # main memory file with a "## Kits" index
└── kits-memory/
    ├── ruff-lint.md
    ├── vale.md
    └── git-ssh-sign.md
```
@y
```text
/Users/you/
├── myproject/              # workspace
├── AGENTS.md               # main memory file with a "## Kits" index
└── kits-memory/
    ├── ruff-lint.md
    ├── vale.md
    └── git-ssh-sign.md
```
@z

@x
See [`agentInstructions`](kit-reference.md#agent-instructions) in the spec
reference for the full field schema.
@y
See [`agentInstructions`](kit-reference.md#agent-instructions) in the spec
reference for the full field schema.
@z

@x
### Define an agent
@y
### Define an agent
@z

@x
Sandbox kits declare a `sandbox:` block with the image the agent runs in and
the command the user attaches to when they launch the sandbox:
@y
Sandbox kits declare a `sandbox:` block with the image the agent runs in and
the command the user attaches to when they launch the sandbox:
@z

@x
```yaml
sandbox:
  image: "my-registry/my-agent:latest"
  entrypoint: [my-agent, "--yolo"]
```
@y
```yaml
sandbox:
  image: "my-registry/my-agent:latest"
  entrypoint: [my-agent, "--yolo"]
```
@z

@x
See [Sandbox kits](#sandbox-kits) for use cases and an example.
@y
See [Sandbox kits](#sandbox-kits) for use cases and an example.
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
See [Drop a shared config file](kit-examples.md#drop-a-shared-config-file) and
[Install a tool at sandbox creation](kit-examples.md#install-a-tool-at-sandbox-creation)
for complete mixin examples.
@y
See [Drop a shared config file](kit-examples.md#drop-a-shared-config-file) and
[Install a tool at sandbox creation](kit-examples.md#install-a-tool-at-sandbox-creation)
for complete mixin examples.
@z

@x
## Sandbox kits
@y
## Sandbox kits
@z

@x
A sandbox kit defines a full agent from scratch — image, entrypoint, and
everything the agent needs. Common use cases:
@y
A sandbox kit defines a full agent from scratch — image, entrypoint, and
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
Sandbox kits declare everything a mixin kit can, plus an
[`sandbox:` block](kit-reference.md#sandbox-block) that tells the sandbox how to launch the
agent. For a step-by-step walkthrough, see
[Build your own agent kit](build-an-agent.md).
@y
Sandbox kits declare everything a mixin kit can, plus an
[`sandbox:` block](kit-reference.md#sandbox-block) that tells the sandbox how to launch the
agent. For a step-by-step walkthrough, see
[Build your own agent kit](build-an-agent.md).
@z

@x
### Extend a built-in agent
@y
### Extend a built-in agent
@z

@x
Use `extends:` to create a variant of a built-in agent without reproducing its
configuration. The child kit inherits the parent's image, credentials, network
permissions, persistent volumes, settings, MCP integration, and agent
instructions. Use `extends:` for a single parent agent; use a mixin to add an
independent capability that can work with one or more agents. See
[Fork an existing agent](kit-examples.md#fork-an-existing-agent) for an example
that changes Claude Code's permission mode.
@y
Use `extends:` to create a variant of a built-in agent without reproducing its
configuration. The child kit inherits the parent's image, credentials, network
permissions, persistent volumes, settings, MCP integration, and agent
instructions. Use `extends:` for a single parent agent; use a mixin to add an
independent capability that can work with one or more agents. See
[Fork an existing agent](kit-examples.md#fork-an-existing-agent) for an example
that changes Claude Code's permission mode.
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
> `--kit` only takes effect when a sandbox is created. Passing it against an
> existing sandbox name fails with
> `--kit can only be used when creating a new sandbox`. To add a supported
> mixin kit to a running sandbox, use [`sbx kit add`](#local) instead.
> `sbx kit add` restarts the sandbox to apply the updated kit set.
> VM state — installed packages, Docker images, volumes, and agent history
> — is preserved across the restart. It supports mixin kits limited to
> `environment.variables`, `setup.install`, and `permissions.network.allow`.
> To use other fields, recreate the sandbox with `--kit`.
@y
> [!IMPORTANT]
> `--kit` only takes effect when a sandbox is created. Passing it against an
> existing sandbox name fails with
> `--kit can only be used when creating a new sandbox`. To add a supported
> mixin kit to a running sandbox, use [`sbx kit add`](#local) instead.
> `sbx kit add` restarts the sandbox to apply the updated kit set.
> VM state — installed packages, Docker images, volumes, and agent history
> — is preserved across the restart. It supports mixin kits limited to
> `environment.variables`, `setup.install`, and `permissions.network.allow`.
> To use other fields, recreate the sandbox with `--kit`.
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
While iterating on a supported mixin kit, apply changes to a running sandbox
with `sbx kit add`:
@y
While iterating on a supported mixin kit, apply changes to a running sandbox
with `sbx kit add`:
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
`sbx kit add` restarts the sandbox to apply the updated kit set.
VM state — installed packages, Docker images, volumes, and agent history — is
preserved across the restart. Kits can't be removed from a running sandbox —
remove and recreate it to start clean.
@y
`sbx kit add` restarts the sandbox to apply the updated kit set.
VM state — installed packages, Docker images, volumes, and agent history — is
preserved across the restart. Kits can't be removed from a running sandbox —
remove and recreate it to start clean.
@z

@x
### Git repository
@y
### Git repository
@z

@x
```console
$ sbx run claude --kit "git+https://github.com/docker/sbx-kits-contrib.git#ref=v0.1.0&dir=code-server"
```
@y
```console
$ sbx run claude --kit "git+https://github.com/docker/sbx-kits-contrib.git#ref=v0.1.0&dir=code-server"
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
> [!IMPORTANT]
> For Docker Hub, `sbx` reuses your `sbx login` session to pull private
> kits. For other registries, store pull credentials with
> [`sbx secret set --registry`](../configuration/credentials.md#registry-credentials)
> before running the sandbox:
>
> ```console
> $ gh auth token | sbx secret set --registry ghcr.io --password-stdin
> ```
>
> Without stored credentials, pulls from non-Docker Hub registries are
> anonymous and private kits fail to pull.
@y
> [!IMPORTANT]
> For Docker Hub, `sbx` reuses your `sbx login` session to pull private
> kits. For other registries, store pull credentials with
> [`sbx secret set --registry`](../configuration/credentials.md#registry-credentials)
> before running the sandbox:
>
> ```console
> $ gh auth token | sbx secret set --registry ghcr.io --password-stdin
> ```
>
> Without stored credentials, pulls from non-Docker Hub registries are
> anonymous and private kits fail to pull.
@z

@x
### Restrict kit sources
@y
### Restrict kit sources
@z

@x
`sbx` restricts which sources a kit can install from. A kit's install
commands run with root privileges inside the sandbox, so limiting where kits
come from reduces supply-chain risk. By default, only kits hosted on Docker
Hub (`docker.io/`) are allowed. Loading a kit from any other source fails:
@y
`sbx` restricts which sources a kit can install from. A kit's install
commands run with root privileges inside the sandbox, so limiting where kits
come from reduces supply-chain risk. By default, only kits hosted on Docker
Hub (`docker.io/`) are allowed. Loading a kit from any other source fails:
@z

@x
```console
$ sbx run claude --kit "git+https://github.com/docker/sbx-kits-contrib.git#dir=vale"
ERROR: resolve kits: kit "git+https://github.com/docker/sbx-kits-contrib.git#dir=vale" cannot be installed — its source is not in your allowlist.
```
@y
```console
$ sbx run claude --kit "git+https://github.com/docker/sbx-kits-contrib.git#dir=vale"
ERROR: resolve kits: kit "git+https://github.com/docker/sbx-kits-contrib.git#dir=vale" cannot be installed — its source is not in your allowlist.
```
@z

@x
To allow another publisher, add its host or host/path prefix to the
`kit.allowedSources` setting. The setting replaces the whole list, so include
the entries you want to keep:
@y
To allow another publisher, add its host or host/path prefix to the
`kit.allowedSources` setting. The setting replaces the whole list, so include
the entries you want to keep:
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
Entries match as prefixes on a path-segment boundary, so `github.com/docker/`
allows `github.com/docker/sbx-kits-contrib` but not `github.com/docker-evil/kit`.
To remove the restriction and allow any remote source, set the list to
`["*"]`. This isn't recommended.
@y
Entries match as prefixes on a path-segment boundary, so `github.com/docker/`
allows `github.com/docker/sbx-kits-contrib` but not `github.com/docker-evil/kit`.
To remove the restriction and allow any remote source, set the list to
`["*"]`. This isn't recommended.
@z

@x
Installing from a local directory or ZIP file is governed separately by the
`kit.allowLocalKits` setting, which defaults to `true`. Set it to `false` to
require a remote source:
@y
Installing from a local directory or ZIP file is governed separately by the
`kit.allowLocalKits` setting, which defaults to `true`. Set it to `false` to
require a remote source:
@z

@x
```console
$ sbx settings set kit.allowLocalKits false
```
@y
```console
$ sbx settings set kit.allowLocalKits false
```
@z

@x
For non-interactive use, both settings have environment-variable equivalents:
`DOCKER_SANDBOXES_KIT_ALLOWED_SOURCES` and `DOCKER_SANDBOXES_KIT_ALLOW_LOCAL`.
@y
For non-interactive use, both settings have environment-variable equivalents:
`DOCKER_SANDBOXES_KIT_ALLOWED_SOURCES` and `DOCKER_SANDBOXES_KIT_ALLOW_LOCAL`.
@z

@x
## Sign and verify kits
@y
## Sign and verify kits
@z

@x
Use cosign-compatible Sigstore signatures to verify who approved a kit and
that its signed content hasn't changed. Signing is keyless by default. Verify a
keyless signature with the certificate identity and OpenID Connect (OIDC)
issuer:
@y
Use cosign-compatible Sigstore signatures to verify who approved a kit and
that its signed content hasn't changed. Signing is keyless by default. Verify a
keyless signature with the certificate identity and OpenID Connect (OIDC)
issuer:
@z

@x
```console
$ sbx kit sign ./my-kit/
$ sbx kit verify \
    --certificate-identity user@example.com \
    --certificate-oidc-issuer https://accounts.google.com \
    ./my-kit/
```
@y
```console
$ sbx kit sign ./my-kit/
$ sbx kit verify \
    --certificate-identity user@example.com \
    --certificate-oidc-issuer https://accounts.google.com \
    ./my-kit/
```
@z

@x
For key-based signing, use an ECDSA P-256 key pair:
@y
For key-based signing, use an ECDSA P-256 key pair:
@z

@x
```console
$ sbx kit sign --key cosign.key ./my-kit/
$ sbx kit verify --key cosign.pub ./my-kit/
```
@y
```console
$ sbx kit sign --key cosign.key ./my-kit/
$ sbx kit verify --key cosign.pub ./my-kit/
```
@z

@x
For a local directory, `sbx kit sign` writes a `kit.sig.bundle` file next to
`spec.yaml`. Commit this file so consumers can verify a kit loaded from the Git
repository. For an OCI kit, the signature is stored as an OCI referrer. You can
sign an OCI kit after pushing it, or push and sign it in one step:
@y
For a local directory, `sbx kit sign` writes a `kit.sig.bundle` file next to
`spec.yaml`. Commit this file so consumers can verify a kit loaded from the Git
repository. For an OCI kit, the signature is stored as an OCI referrer. You can
sign an OCI kit after pushing it, or push and sign it in one step:
@z

@x
```console
$ sbx kit push ./my-kit/ ghcr.io/myorg/my-kit:1.0 --sign
```
@y
```console
$ sbx kit push ./my-kit/ ghcr.io/myorg/my-kit:1.0 --sign
```
@z

@x
ZIP kits can't carry verifiable signatures.
@y
ZIP kits can't carry verifiable signatures.
@z

@x
### Require signed kits
@y
### Require signed kits
@z

@x
Set a trusted signer policy for the identities or keys you trust before
requiring signatures. Otherwise, `sbx` uses the default policy, which trusts
Docker employee identities attested by Google's OpenID Connect issuer. A
keyless policy must specify both the certificate identity and its OpenID
Connect issuer:
@y
Set a trusted signer policy for the identities or keys you trust before
requiring signatures. Otherwise, `sbx` uses the default policy, which trusts
Docker employee identities attested by Google's OpenID Connect issuer. A
keyless policy must specify both the certificate identity and its OpenID
Connect issuer:
@z

@x
```console
$ sbx settings set kit.trustedSigners \
    '[{"identity":"release-bot@example.com","issuer":"https://accounts.google.com"}]'
$ sbx settings set kit.requireSignature true
```
@y
```console
$ sbx settings set kit.trustedSigners \
    '[{"identity":"release-bot@example.com","issuer":"https://accounts.google.com"}]'
$ sbx settings set kit.requireSignature true
```
@z

@x
To trust a key-based signature, set the policy to the public key path:
@y
To trust a key-based signature, set the policy to the public key path:
@z

@x
```console
$ sbx settings set kit.trustedSigners '[{"key":"/path/to/cosign.pub"}]'
$ sbx settings set kit.requireSignature true
```
@y
```console
$ sbx settings set kit.trustedSigners '[{"key":"/path/to/cosign.pub"}]'
$ sbx settings set kit.requireSignature true
```
@z

@x
When `kit.requireSignature` is `true`, `sbx` rejects unsigned kits, signatures
that don't match `kit.trustedSigners`, and ZIP kits. This policy applies when a
kit is loaded from a local directory, Git repository, or OCI registry.
@y
When `kit.requireSignature` is `true`, `sbx` rejects unsigned kits, signatures
that don't match `kit.trustedSigners`, and ZIP kits. This policy applies when a
kit is loaded from a local directory, Git repository, or OCI registry.
@z

@x
The signature covers `spec.yaml` and the kit's `files/` content, but not mutable
dependencies such as image tags or content downloaded by install and startup
commands. Pin those dependencies by digest or checksum when they must remain
immutable.
@y
The signature covers `spec.yaml` and the kit's `files/` content, but not mutable
dependencies such as image tags or content downloaded by install and startup
commands. Pin those dependencies by digest or checksum when they must remain
immutable.
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
`sbx kit pull` prefers credentials stored with
[`sbx secret set --registry`](../configuration/credentials.md#registry-credentials),
falling back to the Docker credential store. `sbx kit push` only uses the
Docker credential store, so pushing to a private registry requires a prior
`docker login`.
@y
`sbx kit pull` prefers credentials stored with
[`sbx secret set --registry`](../configuration/credentials.md#registry-credentials),
falling back to the Docker credential store. `sbx kit push` only uses the
Docker credential store, so pushing to a private registry requires a prior
`docker login`.
@z

@x
## Spec reference
@y
## Spec reference
@z

@x
For a field-by-field reference of every `spec.yaml` block — top-level
fields, credentials, network, environment, setup, static files,
agent instructions, and the sandbox block — see [Kit spec reference](kit-reference.md).
@y
For a field-by-field reference of every `spec.yaml` block — top-level
fields, credentials, network, environment, setup, static files,
agent instructions, and the sandbox block — see [Kit spec reference](kit-reference.md).
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
  arrive corrupted after you add a credential's `apiKey.inject`, check
  whether an injection domain is too broad. Inject only on the hosts that
  need credentials.
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
  arrive corrupted after you add a credential's `apiKey.inject`, check
  whether an injection domain is too broad. Inject only on the hosts that
  need credentials.
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
