%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Build your own agent kit
linkTitle: Build an agent
description: Walk through building an agent kit for Amp, from base image choice to invocation.
keywords: sandboxes, sbx, kits, agent, tutorial, amp, ampcode
@y
title: Build your own agent kit
linkTitle: Build an agent
description: Walk through building an agent kit for Amp, from base image choice to invocation.
keywords: sandboxes, sbx, kits, agent, tutorial, amp, ampcode
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
This tutorial walks through building an agent kit for the
[Amp](https://ampcode.com/) coding agent. Each step explains the decision
behind a part of the spec, so you can apply the same reasoning to other agents.
@y
This tutorial walks through building an agent kit for the
[Amp](https://ampcode.com/) coding agent. Each step explains the decision
behind a part of the spec, so you can apply the same reasoning to other agents.
@z

@x
For reference on every field, see the [Kits](kits.md) page. This tutorial
focuses on the journey.
@y
For reference on every field, see the [Kits](kits.md) page. This tutorial
focuses on the journey.
@z

@x
## Choose a base image
@y
## Choose a base image
@z

@x
An agent kit needs a container image that satisfies the
[base image requirements](kits.md#base-image-requirements): non-root
`agent` user at UID 1000, passwordless sudo, `/home/agent/` home, and HTTP
proxy environment variable forwarding.
@y
An agent kit needs a container image that satisfies the
[base image requirements](kits.md#base-image-requirements): non-root
`agent` user at UID 1000, passwordless sudo, `/home/agent/` home, and HTTP
proxy environment variable forwarding.
@z

@x
Rather than build an image from scratch, extend one of the published
sandbox templates. Three common starting points:
@y
Rather than build an image from scratch, extend one of the published
sandbox templates. Three common starting points:
@z

@x
- `docker/sandbox-templates:shell`. Generic base with no pre-installed
  agent.
- `docker/sandbox-templates:shell-docker`. Same, with Docker Engine inside
  the sandbox.
- Agent-specific variants (`claude-code`, `codex`, etc.). Only useful if
  you're extending that specific agent.
@y
- `docker/sandbox-templates:shell`. Generic base with no pre-installed
  agent.
- `docker/sandbox-templates:shell-docker`. Same, with Docker Engine inside
  the sandbox.
- Agent-specific variants (`claude-code`, `codex`, etc.). Only useful if
  you're extending that specific agent.
@z

@x
For Amp, pick `shell-docker`:
@y
For Amp, pick `shell-docker`:
@z

@x
- Amp isn't pre-installed in any variant, so you need a generic base
  (`shell`).
- Docker support is handy since coding agents often need to run containers.
- If you don't need Docker inside the sandbox, use the `shell` tag for a
  lighter, non-privileged environment.
@y
- Amp isn't pre-installed in any variant, so you need a generic base
  (`shell`).
- Docker support is handy since coding agents often need to run containers.
- If you don't need Docker inside the sandbox, use the `shell` tag for a
  lighter, non-privileged environment.
@z

@x
## Plan authentication
@y
## Plan authentication
@z

@x
Amp authenticates with an API key in `AMP_API_KEY`. To keep the real key
out of the VM, you split the work in two:
@y
Amp authenticates with an API key in `AMP_API_KEY`. To keep the real key
out of the VM, you split the work in two:
@z

@x
- The kit's network section maps the API host to a service identifier
  and tells the proxy which header to inject.
- You provide your key once on the host, via sbx's secret store. The
  real value stays on the host; only a placeholder reaches the sandbox.
@y
- The kit's network section maps the API host to a service identifier
  and tells the proxy which header to inject.
- You provide your key once on the host, via sbx's secret store. The
  real value stays on the host; only a placeholder reaches the sandbox.
@z

@x
Inside the sandbox `AMP_API_KEY` is set to that placeholder. The proxy
substitutes the real key on outbound requests to the API host, so the
secret never enters the sandbox. A later section walks through the
specific command for storing the key.
@y
Inside the sandbox `AMP_API_KEY` is set to that placeholder. The proxy
substitutes the real key on outbound requests to the API host, so the
secret never enters the sandbox. A later section walks through the
specific command for storing the key.
@z

@x
## Write the agent block
@y
## Write the agent block
@z

@x
The `agent:` block tells the sandbox how to launch Amp when the user
attaches.
@y
The `agent:` block tells the sandbox how to launch Amp when the user
attaches.
@z

@x
```yaml {title="amp/spec.yaml"}
schemaVersion: "1"
kind: agent
name: amp
displayName: Amp
description: The frontier coding agent.
@y
```yaml {title="amp/spec.yaml"}
schemaVersion: "1"
kind: agent
name: amp
displayName: Amp
description: The frontier coding agent.
@z

@x
agent:
  image: "docker/sandbox-templates:shell-docker"
  aiFilename: AGENTS.md
  persistence: persistent
  entrypoint:
    run: [amp, --dangerously-allow-all]
```
@y
agent:
  image: "docker/sandbox-templates:shell-docker"
  aiFilename: AGENTS.md
  persistence: persistent
  entrypoint:
    run: [amp, --dangerously-allow-all]
```
@z

@x
- `aiFilename: AGENTS.md` tells the sandbox to create `AGENTS.md` at launch
  and append the [`memory`](#prime-amp-with-memory) block to it. Amp reads
  this file for instructions.
- `persistence: persistent` keeps Amp's state (auth tokens, history) in a
  named volume across sandbox restarts. Without it, you re-authenticate
  every time.
- `entrypoint.run` runs `amp` in "YOLO-mode" when the sandbox starts. Adjust if
  you want to pass different args on startup.
@y
- `aiFilename: AGENTS.md` tells the sandbox to create `AGENTS.md` at launch
  and append the [`memory`](#prime-amp-with-memory) block to it. Amp reads
  this file for instructions.
- `persistence: persistent` keeps Amp's state (auth tokens, history) in a
  named volume across sandbox restarts. Without it, you re-authenticate
  every time.
- `entrypoint.run` runs `amp` in "YOLO-mode" when the sandbox starts. Adjust if
  you want to pass different args on startup.
@z

@x
## Install Amp
@y
## Install Amp
@z

@x
Amp installs via a curl-to-bash script:
@y
Amp installs via a curl-to-bash script:
@z

@x
```yaml
commands:
  install:
    - command: "curl -fsSL https://ampcode.com/install.sh | bash"
      user: "1000"
      description: Install Amp
```
@y
```yaml
commands:
  install:
    - command: "curl -fsSL https://ampcode.com/install.sh | bash"
      user: "1000"
      description: Install Amp
```
@z

@x
Note `user: "1000"`. That's the agent user. Install commands run as root
(UID 0) by default, and Amp's installer puts the binary in the user's home
directory. Running as root would land the binary in `/root/` where the
agent can't reach it.
@y
Note `user: "1000"`. That's the agent user. Install commands run as root
(UID 0) by default, and Amp's installer puts the binary in the user's home
directory. Running as root would land the binary in `/root/` where the
agent can't reach it.
@z

@x
## Allow network access
@y
## Allow network access
@z

@x
The network block does two things: it lists the hosts the sandbox is
allowed to reach (`allowedDomains`), and it wires the kit-side half of
the auth flow from [Plan authentication](#plan-authentication)
(`serviceDomains` + `serviceAuth`).
@y
The network block does two things: it lists the hosts the sandbox is
allowed to reach (`allowedDomains`), and it wires the kit-side half of
the auth flow from [Plan authentication](#plan-authentication)
(`serviceDomains` + `serviceAuth`).
@z

@x
```yaml
network:
  serviceDomains:
    ampcode.com: amp
  serviceAuth:
    amp:
      headerName: Authorization
      valueFormat: "Bearer %s"
  allowedDomains:
    - "ampcode.com:443"
    - "*.ampcode.com:443"
```
@y
```yaml
network:
  serviceDomains:
    ampcode.com: amp
  serviceAuth:
    amp:
      headerName: Authorization
      valueFormat: "Bearer %s"
  allowedDomains:
    - "ampcode.com:443"
    - "*.ampcode.com:443"
```
@z

@x
`allowedDomains` here covers the apex (`ampcode.com`) and the
install/CDN subdomains (`*.ampcode.com`). Treat it as a starting point;
Amp may reach other domains (model providers, analytics, updates) that
you'll discover by watching `sbx policy log` while testing.
@y
`allowedDomains` here covers the apex (`ampcode.com`) and the
install/CDN subdomains (`*.ampcode.com`). Treat it as a starting point;
Amp may reach other domains (model providers, analytics, updates) that
you'll discover by watching `sbx policy log` while testing.
@z

@x
For the auth wiring, when the agent makes an outbound request to
`ampcode.com`, the proxy looks up the host in `serviceDomains` to find
the service id `amp`, then uses `serviceAuth.amp` to inject an
`Authorization: Bearer <key>` header. The `<key>` value comes from the
secret you'll register in
[Register your API key](#register-your-api-key), matched by host. The
service id (`amp`) is just a label that ties the two blocks together —
pick any name.
@y
For the auth wiring, when the agent makes an outbound request to
`ampcode.com`, the proxy looks up the host in `serviceDomains` to find
the service id `amp`, then uses `serviceAuth.amp` to inject an
`Authorization: Bearer <key>` header. The `<key>` value comes from the
secret you'll register in
[Register your API key](#register-your-api-key), matched by host. The
service id (`amp`) is just a label that ties the two blocks together —
pick any name.
@z

@x
> [!IMPORTANT]
> Keep `serviceDomains` narrow. Mapping `*.ampcode.com` would push the
> proxy into TLS-intercepting mode for every subdomain — including the
> binary CDN the install script downloads from — which corrupts those
> downloads. List only the host that actually needs auth.
@y
> [!IMPORTANT]
> Keep `serviceDomains` narrow. Mapping `*.ampcode.com` would push the
> proxy into TLS-intercepting mode for every subdomain — including the
> binary CDN the install script downloads from — which corrupts those
> downloads. List only the host that actually needs auth.
@z

@x
## Prime Amp with memory
@y
## Prime Amp with memory
@z

@x
The `memory` field appends markdown to `AGENTS.md` at sandbox creation.
Use it to tell Amp about the sandbox environment so it knows the
conventions when it starts.
@y
The `memory` field appends markdown to `AGENTS.md` at sandbox creation.
Use it to tell Amp about the sandbox environment so it knows the
conventions when it starts.
@z

@x
```yaml
memory: |
  ## Sandbox environment
@y
```yaml
memory: |
  ## Sandbox environment
@z

@x
  You are running inside a Docker sandbox. The workspace is mounted at
  its absolute host path. `sudo` is passwordless; use it for package
  installs. Docker is available inside the sandbox; containers you start
  are isolated in the microVM.
```
@y
  You are running inside a Docker sandbox. The workspace is mounted at
  its absolute host path. `sudo` is passwordless; use it for package
  installs. Docker is available inside the sandbox; containers you start
  are isolated in the microVM.
```
@z

@x
Keep this short and sandbox-specific. For project instructions, put a
regular `AGENTS.md` in the workspace.
@y
Keep this short and sandbox-specific. For project instructions, put a
regular `AGENTS.md` in the workspace.
@z

@x
## The full spec
@y
## The full spec
@z

@x
Putting it all together:
@y
Putting it all together:
@z

@x
```yaml {title="amp/spec.yaml"}
schemaVersion: "1"
kind: agent
name: amp
displayName: Amp
description: The frontier coding agent.
@y
```yaml {title="amp/spec.yaml"}
schemaVersion: "1"
kind: agent
name: amp
displayName: Amp
description: The frontier coding agent.
@z

@x
agent:
  image: "docker/sandbox-templates:shell-docker"
  aiFilename: AGENTS.md
  persistence: persistent
  entrypoint:
    run: [amp, --dangerously-allow-all]
@y
agent:
  image: "docker/sandbox-templates:shell-docker"
  aiFilename: AGENTS.md
  persistence: persistent
  entrypoint:
    run: [amp, --dangerously-allow-all]
@z

@x
network:
  serviceDomains:
    ampcode.com: amp
  serviceAuth:
    amp:
      headerName: Authorization
      valueFormat: "Bearer %s"
  allowedDomains:
    - "ampcode.com:443"
    - "*.ampcode.com:443"
@y
network:
  serviceDomains:
    ampcode.com: amp
  serviceAuth:
    amp:
      headerName: Authorization
      valueFormat: "Bearer %s"
  allowedDomains:
    - "ampcode.com:443"
    - "*.ampcode.com:443"
@z

@x
commands:
  install:
    - command: "curl -fsSL https://ampcode.com/install.sh | bash"
      user: "1000"
      description: Install Amp
@y
commands:
  install:
    - command: "curl -fsSL https://ampcode.com/install.sh | bash"
      user: "1000"
      description: Install Amp
@z

@x
memory: |
  ## Sandbox environment
@y
memory: |
  ## Sandbox environment
@z

@x
  You are running inside a Docker sandbox. The workspace is mounted at
  its absolute host path. `sudo` is passwordless; use it for package
  installs.
```
@y
  You are running inside a Docker sandbox. The workspace is mounted at
  its absolute host path. `sudo` is passwordless; use it for package
  installs.
```
@z

@x
## Register your API key
@y
## Register your API key
@z

@x
Register your Amp API key on the host with `sbx secret set-custom`. The
value goes into the host secret store, and a placeholder is exposed
inside every sandbox you launch from this kit.
@y
Register your Amp API key on the host with `sbx secret set-custom`. The
value goes into the host secret store, and a placeholder is exposed
inside every sandbox you launch from this kit.
@z

@x
Amp validates `AMP_API_KEY`'s format at startup, so the placeholder needs
to look like a real Amp key. Pick a placeholder shape that matches Amp's
expected format:
@y
Amp validates `AMP_API_KEY`'s format at startup, so the placeholder needs
to look like a real Amp key. Pick a placeholder shape that matches Amp's
expected format:
@z

@x
```console
$ sbx secret set-custom -g \
    --host ampcode.com \
    --env AMP_API_KEY \
    --placeholder "sgamp-{rand}" \
    --value "$AMP_API_KEY"
```
@y
```console
$ sbx secret set-custom -g \
    --host ampcode.com \
    --env AMP_API_KEY \
    --placeholder "sgamp-{rand}" \
    --value "$AMP_API_KEY"
```
@z

@x
`{rand}` expands to a random suffix at registration time. Inside the
sandbox `AMP_API_KEY` is set to that placeholder; Amp accepts it as a
syntactically valid key, and the proxy substitutes the real secret on
outbound requests to `ampcode.com`.
@y
`{rand}` expands to a random suffix at registration time. Inside the
sandbox `AMP_API_KEY` is set to that placeholder; Amp accepts it as a
syntactically valid key, and the proxy substitutes the real secret on
outbound requests to `ampcode.com`.
@z

@x
> [!TIP]
> `sbx secret set-custom` is only required because Amp validates the
> key's format. If your agent reads the env var without a local format
> check, you can declare `environment.proxyManaged: [AMP_API_KEY]` in
> the kit instead and skip this user-side step — the proxy uses a
> default sentinel value (`proxy-managed`) that the agent never sees
> rejected.
@y
> [!TIP]
> `sbx secret set-custom` is only required because Amp validates the
> key's format. If your agent reads the env var without a local format
> check, you can declare `environment.proxyManaged: [AMP_API_KEY]` in
> the kit instead and skip this user-side step — the proxy uses a
> default sentinel value (`proxy-managed`) that the agent never sees
> rejected.
@z

@x
> [!NOTE]
> `sbx secret set-custom` is an experimental command and isn't listed
> in `sbx secret --help`. It works today but may change in future
> releases. This tutorial surfaces it because there's no other path to
> register a custom-format placeholder.
@y
> [!NOTE]
> `sbx secret set-custom` is an experimental command and isn't listed
> in `sbx secret --help`. It works today but may change in future
> releases. This tutorial surfaces it because there's no other path to
> register a custom-format placeholder.
@z

@x
## Run it
@y
## Run it
@z

@x
Validate the spec:
@y
Validate the spec:
@z

@x
```console
$ sbx kit validate ./amp/
```
@y
```console
$ sbx kit validate ./amp/
```
@z

@x
Launch a sandbox with the kit, passing the kit's `name:` (`amp`) as the
agent argument:
@y
Launch a sandbox with the kit, passing the kit's `name:` (`amp`) as the
agent argument:
@z

@x
```console
$ sbx run --kit ./amp/ amp
```
@y
```console
$ sbx run --kit ./amp/ amp
```
@z

@x
## Iterate
@y
## Iterate
@z

@x
As you use the kit, you'll likely hit missing domains or install quirks.
Two loops help:
@y
As you use the kit, you'll likely hit missing domains or install quirks.
Two loops help:
@z

@x
- Watch the network policy log (`sbx policy log`) to catch blocked
  requests, then add their domains to `allowedDomains`.
- Edit the spec and re-run `sbx run --kit ./amp/ amp` to pick up changes.
  Remove the sandbox first (`sbx rm <name>`) for a clean start.
@y
- Watch the network policy log (`sbx policy log`) to catch blocked
  requests, then add their domains to `allowedDomains`.
- Edit the spec and re-run `sbx run --kit ./amp/ amp` to pick up changes.
  Remove the sandbox first (`sbx rm <name>`) for a clean start.
@z

@x
Flesh out the `memory` block as you refine how Amp should behave in the
sandbox.
@y
Flesh out the `memory` block as you refine how Amp should behave in the
sandbox.
@z

@x
## Publish
@y
## Publish
@z

@x
Once the kit works, share it by packaging as a ZIP, pushing to an OCI
registry, or committing to a Git repository. See
[Packaging and distribution](kits.md#packaging-and-distribution) for the
`sbx kit` subcommands.
@y
Once the kit works, share it by packaging as a ZIP, pushing to an OCI
registry, or committing to a Git repository. See
[Packaging and distribution](kits.md#packaging-and-distribution) for the
`sbx kit` subcommands.
@z

@x
## Adapt this to another agent
@y
## Adapt this to another agent
@z

@x
Most of the specifics here are Amp's. To port the pattern, work through
the same decisions for your agent:
@y
Most of the specifics here are Amp's. To port the pattern, work through
the same decisions for your agent:
@z

@x
- **Base image**: `shell-docker` if you need Docker inside the sandbox,
  `shell` otherwise. Or extend either with your own image if the install
  is heavy.
- **Install**: a `commands.install` block at runtime, or bake the agent
  into a custom image. Pick install if it's a one-line script; bake if
  the install is slow or you need a pinned version.
- **Network mapping**: list only the API host in `serviceDomains`, not
  a wildcard. Keep install/CDN paths out of TLS-intercepting mode.
- **Credential injection**: if the agent validates the API key's format
  locally, register with `sbx secret set-custom` and pick a matching
  placeholder. If it accepts the env var as-is, declare
  `environment.proxyManaged` in the kit and skip the user-side step.
@y
- **Base image**: `shell-docker` if you need Docker inside the sandbox,
  `shell` otherwise. Or extend either with your own image if the install
  is heavy.
- **Install**: a `commands.install` block at runtime, or bake the agent
  into a custom image. Pick install if it's a one-line script; bake if
  the install is slow or you need a pinned version.
- **Network mapping**: list only the API host in `serviceDomains`, not
  a wildcard. Keep install/CDN paths out of TLS-intercepting mode.
- **Credential injection**: if the agent validates the API key's format
  locally, register with `sbx secret set-custom` and pick a matching
  placeholder. If it accepts the env var as-is, declare
  `environment.proxyManaged` in the kit and skip the user-side step.
@z

@x
The rest — memory block, network-policy iteration, packaging — is the
same regardless of agent.
@y
The rest — memory block, network-policy iteration, packaging — is the
same regardless of agent.
@z

@x
## Remove the stored secret
@y
## Remove the stored secret
@z

@x
To remove the entry created earlier with `sbx secret set-custom`, pass
the host to `sbx secret rm`:
@y
To remove the entry created earlier with `sbx secret set-custom`, pass
the host to `sbx secret rm`:
@z

@x
```console
$ sbx secret rm -g --host ampcode.com
```
@y
```console
$ sbx secret rm -g --host ampcode.com
```
@z

@x
The `--host` flag on `sbx secret rm` isn't listed in
`sbx secret rm --help`, but it's the only way to remove entries
created with `set-custom`. Like `set-custom` itself, it's experimental
and may change.
@y
The `--host` flag on `sbx secret rm` isn't listed in
`sbx secret rm --help`, but it's the only way to remove entries
created with `set-custom`. Like `set-custom` itself, it's experimental
and may change.
@z
