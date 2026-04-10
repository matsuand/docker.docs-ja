%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Docker Sandboxes
description: Run AI coding agents in isolated environments
@y
title: Docker Sandboxes
description: Run AI coding agents in isolated environments
@z

@x
      text: Experimental
@y
      text: Experimental
@z

@x
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@z

@x
Docker Sandboxes run AI coding agents in isolated microVM sandboxes. Each
sandbox gets its own Docker daemon, filesystem, and network — the agent can
build containers, install packages, and modify files without touching your host
system.
@y
Docker Sandboxes run AI coding agents in isolated microVM sandboxes. Each
sandbox gets its own Docker daemon, filesystem, and network — the agent can
build containers, install packages, and modify files without touching your host
system.
@z

@x
## Get started
@y
## Get started
@z

@x
Install the `sbx` CLI and sign in:
@y
Install the `sbx` CLI and sign in:
@z

@x
{{< tabs >}}
{{< tab name="macOS" >}}
@y
{{< tabs >}}
{{< tab name="macOS" >}}
@z

@x
```console
$ brew install docker/tap/sbx
$ sbx login
```
@y
```console
$ brew install docker/tap/sbx
$ sbx login
```
@z

@x
{{< /tab >}}
{{< tab name="Windows" >}}
@y
{{< /tab >}}
{{< tab name="Windows" >}}
@z

@x
```powershell
> winget install -h Docker.sbx
> sbx login
```
@y
```powershell
> winget install -h Docker.sbx
> sbx login
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
Then launch an agent in a sandbox:
@y
Then launch an agent in a sandbox:
@z

@x
```console
$ cd ~/my-project
$ sbx run claude
```
@y
```console
$ cd ~/my-project
$ sbx run claude
```
@z

@x
See the [get started guide](get-started.md) for a full walkthrough, or jump to
the [usage guide](usage.md) for common patterns.
@y
See the [get started guide](get-started.md) for a full walkthrough, or jump to
the [usage guide](usage.md) for common patterns.
@z

@x
## Learn more
@y
## Learn more
@z

@x
- [Agents](agents/) — supported agents and per-agent configuration
- [Custom environments](agents/custom-environments.md) — build reusable sandbox
  images with pre-installed tools
- [Architecture](architecture.md) — microVM isolation, workspace mounting,
  networking
- [Security](security/) — isolation model, credential handling, network
  policies, workspace trust
- [CLI reference](/reference/cli/sbx/) — full list of `sbx` commands and options
- [Troubleshooting](troubleshooting.md) — common issues and fixes
- [FAQ](faq.md) — login requirements, telemetry, etc
@y
- [Agents](agents/) — supported agents and per-agent configuration
- [Custom environments](agents/custom-environments.md) — build reusable sandbox
  images with pre-installed tools
- [Architecture](architecture.md) — microVM isolation, workspace mounting,
  networking
- [Security](security/) — isolation model, credential handling, network
  policies, workspace trust
- [CLI reference](__SUBDIR__/reference/cli/sbx/) — full list of `sbx` commands and options
- [Troubleshooting](troubleshooting.md) — common issues and fixes
- [FAQ](faq.md) — login requirements, telemetry, etc
@z

@x
## Feedback
@y
## Feedback
@z

@x
Docker Sandboxes is experimental and under active development. Your feedback
shapes what gets built next. If you run into a bug, hit a missing feature, or
have a suggestion, open an issue at
[github.com/docker/sbx-releases/issues](https://github.com/docker/sbx-releases/issues).
@y
Docker Sandboxes is experimental and under active development. Your feedback
shapes what gets built next. If you run into a bug, hit a missing feature, or
have a suggestion, open an issue at
[github.com/docker/sbx-releases/issues](https://github.com/docker/sbx-releases/issues).
@z

@x
## Docker Desktop integration
@y
## Docker Desktop integration
@z

@x
Docker Desktop also includes a [built-in sandbox command](docker-desktop.md)
(`docker sandbox`) with a subset of features. The `sbx` CLI is recommended for
most use cases.
@y
Docker Desktop also includes a [built-in sandbox command](docker-desktop.md)
(`docker sandbox`) with a subset of features. The `sbx` CLI is recommended for
most use cases.
@z
