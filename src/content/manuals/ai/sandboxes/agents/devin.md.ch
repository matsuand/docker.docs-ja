%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Devin
@y
title: Devin
@z

@x
description: Use Devin CLI in Docker Sandboxes with reusable, proxy-managed authentication.
keywords: docker sandboxes, devin, cognition, ai agent, sbx
@y
description: Use Devin CLI in Docker Sandboxes with reusable, proxy-managed authentication.
keywords: docker sandboxes, devin, cognition, ai agent, sbx
@z

@x
Official documentation: [Devin CLI](https://docs.devin.ai/work-with-devin/devin-cli)
@y
Official documentation: [Devin CLI](https://docs.devin.ai/work-with-devin/devin-cli)
@z

@x
## Quick start
@y
## Quick start
@z

@x
Create a sandbox and run Devin for a project directory:
@y
Create a sandbox and run Devin for a project directory:
@z

@x
```console
$ sbx run devin ~/my-project
```
@y
```console
$ sbx run devin ~/my-project
```
@z

@x
The workspace parameter is optional and defaults to the current directory:
@y
The workspace parameter is optional and defaults to the current directory:
@z

@x
```console
$ cd ~/my-project
$ sbx run devin
```
@y
```console
$ cd ~/my-project
$ sbx run devin
```
@z

@x
## Authentication
@y
## Authentication
@z

@x
On first run, Devin prompts you to sign in interactively inside the sandbox.
After you sign in, Docker Sandboxes manages the reusable credential on the host
and supplies it to future Devin sandboxes through the proxy.
@y
On first run, Devin prompts you to sign in interactively inside the sandbox.
After you sign in, Docker Sandboxes manages the reusable credential on the host
and supplies it to future Devin sandboxes through the proxy.
@z

@x
## Configuration
@y
## Configuration
@z

@x
Sandboxes don't pick up user-level Devin configuration from your host. Only
project-level configuration in the working directory is available inside the
sandbox. See
[Why doesn't the sandbox use my user-level agent configuration?](../faq.md#why-doesnt-the-sandbox-use-my-user-level-agent-configuration)
for workarounds.
@y
Sandboxes don't pick up user-level Devin configuration from your host. Only
project-level configuration in the working directory is available inside the
sandbox. See
[Why doesn't the sandbox use my user-level agent configuration?](../faq.md#why-doesnt-the-sandbox-use-my-user-level-agent-configuration)
for workarounds.
@z

@x
Devin reads `AGENTS.md` from the workspace for agent-specific instructions and
uses the [shared agent skills](../workflows/agent-skills.md) store.
@y
Devin reads `AGENTS.md` from the workspace for agent-specific instructions and
uses the [shared agent skills](../workflows/agent-skills.md) store.
@z

@x
### Default startup command
@y
### Default startup command
@z

@x
Without extra args, the sandbox runs:
@y
Without extra args, the sandbox runs:
@z

@x
```text
devin --permission-mode dangerous --respect-workspace-trust=false
```
@y
```text
devin --permission-mode dangerous --respect-workspace-trust=false
```
@z

@x
## Base image
@y
## Base image
@z

@x
Template: `docker/sandbox-templates:devin-docker`
@y
Template: `docker/sandbox-templates:devin-docker`
@z

@x
See [Customize](../customize/) to pre-install tools or customize this
environment.
@y
See [Customize](../customize/) to pre-install tools or customize this
environment.
@z
