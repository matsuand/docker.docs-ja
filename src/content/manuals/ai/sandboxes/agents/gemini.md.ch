%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Gemini
@y
title: Gemini
@z

@x
description: |
  Use Google Gemini in Docker Sandboxes with proxy-managed authentication and
  API key configuration.
keywords: docker sandboxes, gemini, google, ai agent, sbx
@y
description: |
  Use Google Gemini in Docker Sandboxes with proxy-managed authentication and
  API key configuration.
keywords: docker sandboxes, gemini, google, ai agent, sbx
@z

@x
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@z

@x
This guide covers authentication, configuration, and usage of Google Gemini in
a sandboxed environment.
@y
This guide covers authentication, configuration, and usage of Google Gemini in
a sandboxed environment.
@z

@x
Official documentation: [Gemini CLI](https://geminicli.com/docs/)
@y
Official documentation: [Gemini CLI](https://geminicli.com/docs/)
@z

@x
## Quick start
@y
## Quick start
@z

@x
Create a sandbox and run Gemini for a project directory:
@y
Create a sandbox and run Gemini for a project directory:
@z

@x
```console
$ sbx run gemini ~/my-project
```
@y
```console
$ sbx run gemini ~/my-project
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
$ sbx run gemini
```
@y
```console
$ cd ~/my-project
$ sbx run gemini
```
@z

@x
## Authentication
@y
## Authentication
@z

@x
Gemini requires either a Google API key or a Google account with Gemini access.
@y
Gemini requires either a Google API key or a Google account with Gemini access.
@z

@x
**API key**: Store your key using
[stored secrets](../security/credentials.md#stored-secrets):
@y
**API key**: Store your key using
[stored secrets](../security/credentials.md#stored-secrets):
@z

@x
```console
$ sbx secret set -g google
```
@y
```console
$ sbx secret set -g google
```
@z

@x
Alternatively, export the `GEMINI_API_KEY` or `GOOGLE_API_KEY` environment
variable in your shell before running the sandbox. See
[Credentials](../security/credentials.md) for details on both methods.
@y
Alternatively, export the `GEMINI_API_KEY` or `GOOGLE_API_KEY` environment
variable in your shell before running the sandbox. See
[Credentials](../security/credentials.md) for details on both methods.
@z

@x
**Google account**: If no API key is set, Gemini prompts you to sign in
interactively when it starts. Interactive authentication is scoped to the
sandbox and doesn't persist if you remove and recreate it.
@y
**Google account**: If no API key is set, Gemini prompts you to sign in
interactively when it starts. Interactive authentication is scoped to the
sandbox and doesn't persist if you remove and recreate it.
@z

@x
## Configuration
@y
## Configuration
@z

@x
Sandboxes don't pick up user-level configuration from your host, such as
`~/.gemini`. Only project-level configuration in the working directory is
available inside the sandbox. See
[Why doesn't the sandbox use my user-level agent configuration?](../faq.md#why-doesnt-the-sandbox-use-my-user-level-agent-configuration)
for workarounds.
@y
Sandboxes don't pick up user-level configuration from your host, such as
`~/.gemini`. Only project-level configuration in the working directory is
available inside the sandbox. See
[Why doesn't the sandbox use my user-level agent configuration?](../faq.md#why-doesnt-the-sandbox-use-my-user-level-agent-configuration)
for workarounds.
@z

@x
The sandbox runs Gemini without approval prompts by default and disables
Gemini's built-in sandbox tool (since the sandbox itself provides isolation).
Pass additional Gemini CLI options after `--`:
@y
The sandbox runs Gemini without approval prompts by default and disables
Gemini's built-in sandbox tool (since the sandbox itself provides isolation).
Pass additional Gemini CLI options after `--`:
@z

@x
```console
$ sbx run gemini --name <sandbox-name> -- <gemini-options>
```
@y
```console
$ sbx run gemini --name <sandbox-name> -- <gemini-options>
```
@z

@x
## Base image
@y
## Base image
@z

@x
Template: `docker/sandbox-templates:gemini`
@y
Template: `docker/sandbox-templates:gemini`
@z

@x
Gemini is configured to disable its built-in OAuth flow. Authentication is
managed through the proxy with API keys. Preconfigured to run without
approval prompts.
@y
Gemini is configured to disable its built-in OAuth flow. Authentication is
managed through the proxy with API keys. Preconfigured to run without
approval prompts.
@z

@x
See [Customize](../customize/) to pre-install tools or customize this
environment.
@y
See [Customize](../customize/) to pre-install tools or customize this
environment.
@z
