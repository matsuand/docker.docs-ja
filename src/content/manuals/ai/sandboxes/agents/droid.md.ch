%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Droid
@y
title: Droid
@z

@x
description: |
  Use Droid in Docker Sandboxes with API key or OAuth authentication.
@y
description: |
  Use Droid in Docker Sandboxes with API key or OAuth authentication.
@z

@x
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@z

@x
This guide covers authentication, configuration, and usage of Droid, an AI
coding agent by Factory, in a sandboxed environment.
@y
This guide covers authentication, configuration, and usage of Droid, an AI
coding agent by Factory, in a sandboxed environment.
@z

@x
Official documentation: [Droid](https://docs.factory.ai/)
@y
Official documentation: [Droid](https://docs.factory.ai/)
@z

@x
## Quick start
@y
## Quick start
@z

@x
Create a sandbox and run Droid for a project directory:
@y
Create a sandbox and run Droid for a project directory:
@z

@x
```console
$ sbx run droid ~/my-project
```
@y
```console
$ sbx run droid ~/my-project
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
$ sbx run droid
```
@y
```console
$ cd ~/my-project
$ sbx run droid
```
@z

@x
## Authentication
@y
## Authentication
@z

@x
Droid requires a [Factory account](https://factory.ai). Both authentication
methods authenticate you to Factory's service directly — unlike other agents
where you supply a model provider key, Factory manages model access through
your Factory account.
@y
Droid requires a [Factory account](https://factory.ai). Both authentication
methods authenticate you to Factory's service directly — unlike other agents
where you supply a model provider key, Factory manages model access through
your Factory account.
@z

@x
**API key**: Store your Factory API key using
[stored secrets](../security/credentials.md#stored-secrets):
@y
**API key**: Store your Factory API key using
[stored secrets](../security/credentials.md#stored-secrets):
@z

@x
```console
$ sbx secret set -g droid
```
@y
```console
$ sbx secret set -g droid
```
@z

@x
Alternatively, export the `FACTORY_API_KEY` environment variable in your shell
before running the sandbox. See
[Credentials](../security/credentials.md) for details on both methods.
@y
Alternatively, export the `FACTORY_API_KEY` environment variable in your shell
before running the sandbox. See
[Credentials](../security/credentials.md) for details on both methods.
@z

@x
**OAuth**: If no API key is set, Droid prompts you to authenticate
interactively on first run. The proxy handles the OAuth flow, so credentials
aren't stored inside the sandbox.
@y
**OAuth**: If no API key is set, Droid prompts you to authenticate
interactively on first run. The proxy handles the OAuth flow, so credentials
aren't stored inside the sandbox.
@z

@x
## Configuration
@y
## Configuration
@z

@x
Sandboxes don't pick up user-level configuration from your host. Only
project-level configuration in the working directory is available inside the
sandbox. See
[Why doesn't the sandbox use my user-level agent configuration?](../faq.md#why-doesnt-the-sandbox-use-my-user-level-agent-configuration)
for workarounds.
@y
Sandboxes don't pick up user-level configuration from your host. Only
project-level configuration in the working directory is available inside the
sandbox. See
[Why doesn't the sandbox use my user-level agent configuration?](../faq.md#why-doesnt-the-sandbox-use-my-user-level-agent-configuration)
for workarounds.
@z

@x
The sandbox runs Droid without approval prompts by default. Pass additional
`droid` CLI options after `--`:
@y
The sandbox runs Droid without approval prompts by default. Pass additional
`droid` CLI options after `--`:
@z

@x
```console
$ sbx run droid --name <sandbox-name> -- <droid-options>
```
@y
```console
$ sbx run droid --name <sandbox-name> -- <droid-options>
```
@z

@x
## Base image
@y
## Base image
@z

@x
Template: `docker/sandbox-templates:droid-docker`
@y
Template: `docker/sandbox-templates:droid-docker`
@z

@x
Preconfigured to run without approval prompts. Authentication state is
persisted across sandbox restarts.
@y
Preconfigured to run without approval prompts. Authentication state is
persisted across sandbox restarts.
@z

@x
See [Custom environments](custom-environments.md) to pre-install tools or
customize this environment.
@y
See [Custom environments](custom-environments.md) to pre-install tools or
customize this environment.
@z
