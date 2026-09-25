%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Cloud sandboxes
description: Run Docker Sandboxes on Docker-managed cloud infrastructure and understand the cloud-specific command, storage, and billing model.
keywords: docker sandboxes, cloud sandboxes, sbx cloud, ai agents, agentic platform
@y
title: Cloud sandboxes
description: Run Docker Sandboxes on Docker-managed cloud infrastructure and understand the cloud-specific command, storage, and billing model.
keywords: docker sandboxes, cloud sandboxes, sbx cloud, ai agents, agentic platform
@z

@x
      text: Experimental
@y
      text: 試験的
@z

@x
> [!NOTE]
> Cloud sandbox support in the `sbx` CLI is experimental. Features and behavior
> may change.
@y
> [!NOTE]
> Cloud sandbox support in the `sbx` CLI is experimental. Features and behavior
> may change.
@z

@x
Cloud sandboxes run AI agents on Docker-managed infrastructure instead of your
local machine. Use them when you need an isolated environment that doesn't
depend on the compute resources or virtualization support of your host.
@y
Cloud sandboxes run AI agents on Docker-managed infrastructure instead of your
local machine. Use them when you need an isolated environment that doesn't
depend on the compute resources or virtualization support of your host.
@z

@x
Cloud sandboxes use the same `sbx` CLI as local sandboxes. Add the global
`--cloud` flag to send a supported command to the Cloud Sandboxes API:
@y
Cloud sandboxes use the same `sbx` CLI as local sandboxes. Add the global
`--cloud` flag to send a supported command to the Cloud Sandboxes API:
@z

@x
```console
$ sbx --cloud ls
```
@y
```console
$ sbx --cloud ls
```
@z

@x
Cloud and local sandboxes have separate state and different capabilities. A
cloud sandbox can't mount a host workspace or use host hardware, and its
secrets, network policy, ports, and lifecycle are managed in the cloud. See
[Local and cloud differences](local-vs-cloud.md) before adapting a local
workflow.
@y
Cloud and local sandboxes have separate state and different capabilities. A
cloud sandbox can't mount a host workspace or use host hardware, and its
secrets, network policy, ports, and lifecycle are managed in the cloud. See
[Local and cloud differences](local-vs-cloud.md) before adapting a local
workflow.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
To use cloud sandboxes, you need:
@y
To use cloud sandboxes, you need:
@z

@x
- The [`sbx` CLI](../install.md), version 0.45.0 or later
- An active [Docker Agentic Platform subscription](/manuals/agentic-platform/signup.md#activate-cloud-access)
@y
- The [`sbx` CLI](../install.md), version 0.45.0 or later
- An active [Docker Agentic Platform subscription](manuals/agentic-platform/signup.md#activate-cloud-access)
@z

@x
Follow [Signup and billing](/manuals/agentic-platform/signup.md) to activate
cloud access and review compute charges. Then return here to sign in from the
CLI and configure your agent.
@y
Follow [Signup and billing](manuals/agentic-platform/signup.md) to activate
cloud access and review compute charges. Then return here to sign in from the
CLI and configure your agent.
@z

@x
### Sign in from the CLI
@y
### Sign in from the CLI
@z

@x
Sign in with the same Docker account you used to subscribe:
@y
Sign in with the same Docker account you used to subscribe:
@z

@x
```console
$ sbx login
```
@y
```console
$ sbx login
```
@z

@x
Check cloud connectivity and account access:
@y
Check cloud connectivity and account access:
@z

@x
```console
$ sbx --cloud diagnose
```
@y
```console
$ sbx --cloud diagnose
```
@z

@x
If the check reports that your account doesn't have access, follow
[Check account access](/manuals/agentic-platform/signup.md#check-account-access).
@y
If the check reports that your account doesn't have access, follow
[Check account access](manuals/agentic-platform/signup.md#check-account-access).
@z

@x
## Get started
@y
## Get started
@z

@x
Credentials configured for local sandboxes aren't available to cloud
sandboxes. Configure a cloud credential for your agent before launching it.
For Claude Code, store an Anthropic API key:
@y
Credentials configured for local sandboxes aren't available to cloud
sandboxes. Configure a cloud credential for your agent before launching it.
For Claude Code, store an Anthropic API key:
@z

@x
```console
$ sbx --cloud secret set anthropic
```
@y
```console
$ sbx --cloud secret set anthropic
```
@z

@x
See [Authenticate cloud agents](credentials.md) for other agents and credential
options.
@y
See [Authenticate cloud agents](credentials.md) for other agents and credential
options.
@z

@x
Cloud sandboxes expire after one hour by default. On expiration, the service
stops sandboxes that can be resumed and deletes the rest. Check the timeout
action before relying on a sandbox to retain your work. See
[Configure expiration](usage.md#configure-expiration).
@y
Cloud sandboxes expire after one hour by default. On expiration, the service
stops sandboxes that can be resumed and deletes the rest. Check the timeout
action before relying on a sandbox to retain your work. See
[Configure expiration](usage.md#configure-expiration).
@z

@x
Create a sandbox without attaching, allowing access to GitHub for this example:
@y
Create a sandbox without attaching, allowing access to GitHub for this example:
@z

@x
```console
$ sbx --cloud create --name cloud-project --allow-network github.com:443 claude
```
@y
```console
$ sbx --cloud create --name cloud-project --allow-network github.com:443 claude
```
@z

@x
Cloud sandboxes don't accept a local workspace path. Clone the public
[Welcome to Docker repository](https://github.com/docker/welcome-to-docker)
inside the sandbox:
@y
Cloud sandboxes don't accept a local workspace path. Clone the public
[Welcome to Docker repository](https://github.com/docker/welcome-to-docker)
inside the sandbox:
@z

@x
```console
$ sbx --cloud exec cloud-project git clone \
    https://github.com/docker/welcome-to-docker.git /home/agent/workspace/project
```
@y
```console
$ sbx --cloud exec cloud-project git clone \
    https://github.com/docker/welcome-to-docker.git /home/agent/workspace/project
```
@z

@x
Attach to the agent:
@y
Attach to the agent:
@z

@x
```console
$ sbx --cloud attach cloud-project
```
@y
```console
$ sbx --cloud attach cloud-project
```
@z

@x
Ask Claude to inspect `/home/agent/workspace/project` and write a description
of the application to `/home/agent/workspace/review.md`. When the file is ready,
press `Ctrl+\` to detach and leave the agent running.
@y
Ask Claude to inspect `/home/agent/workspace/project` and write a description
of the application to `/home/agent/workspace/review.md`. When the file is ready,
press `Ctrl+\` to detach and leave the agent running.
@z

@x
Copy the result to your machine:
@y
Copy the result to your machine:
@z

@x
```console
$ sbx --cloud cp cloud-project:/home/agent/workspace/review.md ./review.md
```
@y
```console
$ sbx --cloud cp cloud-project:/home/agent/workspace/review.md ./review.md
```
@z

@x
Read the result, then remove the sandbox when you're finished:
@y
Read the result, then remove the sandbox when you're finished:
@z

@x
```console
$ sbx --cloud rm cloud-project
```
@y
```console
$ sbx --cloud rm cloud-project
```
@z

@x
Removal deletes files stored only in the sandbox. For your own projects, see
[Transfer files](usage.md#transfer-files) and
[Authenticate cloud agents](credentials.md) before cloning private repositories.
@y
Removal deletes files stored only in the sandbox. For your own projects, see
[Transfer files](usage.md#transfer-files) and
[Authenticate cloud agents](credentials.md) before cloning private repositories.
@z

@x
## Learn more
@y
## Learn more
@z

@x
- [Signup and billing](/manuals/agentic-platform/signup.md) covers activation
  and compute charges
- [Local and cloud differences](local-vs-cloud.md) compares the two execution
  environments
- [Use cloud sandboxes](usage.md) covers creation, files, ports, and lifecycle
- [Authenticate cloud agents](credentials.md) covers cloud-specific secrets,
  API keys, and OAuth
- [Manage cloud network policy](network-policy.md) covers account-level and
  sandbox-level network access
- [Move a sandbox](move.md) explains filesystem transfers between local and
  cloud environments
- [`sbx` CLI reference](/reference/cli/sbx/) lists commands and options
@y
- [Signup and billing](manuals/agentic-platform/signup.md) covers activation
  and compute charges
- [Local and cloud differences](local-vs-cloud.md) compares the two execution
  environments
- [Use cloud sandboxes](usage.md) covers creation, files, ports, and lifecycle
- [Authenticate cloud agents](credentials.md) covers cloud-specific secrets,
  API keys, and OAuth
- [Manage cloud network policy](network-policy.md) covers account-level and
  sandbox-level network access
- [Move a sandbox](move.md) explains filesystem transfers between local and
  cloud environments
- [`sbx` CLI reference](__SUBDIR__/reference/cli/sbx/) lists commands and options
@z
