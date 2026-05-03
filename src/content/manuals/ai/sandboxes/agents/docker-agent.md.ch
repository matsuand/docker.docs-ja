%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Docker Agent
@y
title: Docker Agent
@z

@x
description: |
  Use Docker Agent in Docker Sandboxes with multi-provider authentication
  supporting OpenAI, Anthropic, and more.
keywords: docker sandboxes, docker agent, openai, anthropic, sbx
@y
description: |
  Use Docker Agent in Docker Sandboxes with multi-provider authentication
  supporting OpenAI, Anthropic, and more.
keywords: docker sandboxes, docker agent, openai, anthropic, sbx
@z

@x
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@z

@x
Official documentation: [Docker Agent](https://docs.docker.com/ai/docker-agent/)
@y
Official documentation: [Docker Agent](https://docs.docker.com/ai/docker-agent/)
@z

@x
## Quick start
@y
## Quick start
@z

@x
Create a sandbox and run Docker Agent for a project directory:
@y
Create a sandbox and run Docker Agent for a project directory:
@z

@x
```console
$ sbx run docker-agent ~/my-project
```
@y
```console
$ sbx run docker-agent ~/my-project
```
@z

@x
The workspace parameter defaults to the current directory, so
`sbx run docker-agent` from inside your project works too.
@y
The workspace parameter defaults to the current directory, so
`sbx run docker-agent` from inside your project works too.
@z

@x
## Authentication
@y
## Authentication
@z

@x
Docker Agent supports multiple providers. Store keys for the providers you want
to use with [stored secrets](../security/credentials.md#stored-secrets):
@y
Docker Agent supports multiple providers. Store keys for the providers you want
to use with [stored secrets](../security/credentials.md#stored-secrets):
@z

@x
```console
$ sbx secret set -g openai
$ sbx secret set -g anthropic
$ sbx secret set -g google
$ sbx secret set -g xai
$ sbx secret set -g nebius
$ sbx secret set -g mistral
```
@y
```console
$ sbx secret set -g openai
$ sbx secret set -g anthropic
$ sbx secret set -g google
$ sbx secret set -g xai
$ sbx secret set -g nebius
$ sbx secret set -g mistral
```
@z

@x
You only need to configure the providers you want to use. Docker Agent detects
available credentials and routes requests to the appropriate provider.
@y
You only need to configure the providers you want to use. Docker Agent detects
available credentials and routes requests to the appropriate provider.
@z

@x
Alternatively, export the environment variables (`OPENAI_API_KEY`,
`ANTHROPIC_API_KEY`, `GOOGLE_API_KEY`, `XAI_API_KEY`, `NEBIUS_API_KEY`,
`MISTRAL_API_KEY`) in your shell before running the sandbox. See
[Credentials](../security/credentials.md) for details on both methods.
@y
Alternatively, export the environment variables (`OPENAI_API_KEY`,
`ANTHROPIC_API_KEY`, `GOOGLE_API_KEY`, `XAI_API_KEY`, `NEBIUS_API_KEY`,
`MISTRAL_API_KEY`) in your shell before running the sandbox. See
[Credentials](../security/credentials.md) for details on both methods.
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
The sandbox runs Docker Agent without approval prompts by default. Pass
additional CLI options after `--`:
@y
The sandbox runs Docker Agent without approval prompts by default. Pass
additional CLI options after `--`:
@z

@x
```console
$ sbx run docker-agent --name my-sandbox -- <options>
```
@y
```console
$ sbx run docker-agent --name my-sandbox -- <options>
```
@z

@x
For example, to specify a custom `agent.yml` configuration file:
@y
For example, to specify a custom `agent.yml` configuration file:
@z

@x
```console
$ sbx run docker-agent -- agent.yml
```
@y
```console
$ sbx run docker-agent -- agent.yml
```
@z

@x
## Base image
@y
## Base image
@z

@x
The sandbox uses `docker/sandbox-templates:docker-agent` and launches Docker
Agent without approval prompts by default. See
[Templates](../customize/templates.md) to build your own image on top of
this base.
@y
The sandbox uses `docker/sandbox-templates:docker-agent` and launches Docker
Agent without approval prompts by default. See
[Templates](../customize/templates.md) to build your own image on top of
this base.
@z
