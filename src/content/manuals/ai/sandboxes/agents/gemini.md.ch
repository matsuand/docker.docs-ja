%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Gemini sandbox
description: |
  Use Google Gemini in Docker Sandboxes with proxy-managed authentication and
  API key configuration.
keywords: docker, sandboxes, gemini, google, ai agent, authentication, proxy
@y
title: Gemini sandbox
description: |
  Use Google Gemini in Docker Sandboxes with proxy-managed authentication and
  API key configuration.
keywords: docker, sandboxes, gemini, google, ai agent, authentication, proxy
@z

@x
{{< summary-bar feature_name="Docker Sandboxes" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes" >}}
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
$ docker sandbox run gemini ~/my-project
```
@y
```console
$ docker sandbox run gemini ~/my-project
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
$ docker sandbox run gemini
```
@y
```console
$ cd ~/my-project
$ docker sandbox run gemini
```
@z

@x
## Authentication
@y
## Authentication
@z

@x
Gemini uses proxy-managed authentication. Docker Sandboxes intercepts API
requests and injects credentials transparently. You provide your API key
through environment variables on the host, and the sandbox handles credential
management.
@y
Gemini uses proxy-managed authentication. Docker Sandboxes intercepts API
requests and injects credentials transparently. You provide your API key
through environment variables on the host, and the sandbox handles credential
management.
@z

@x
### Environment variable (recommended)
@y
### Environment variable (recommended)
@z

@x
Set the `GEMINI_API_KEY` or `GOOGLE_API_KEY` environment variable in your
shell configuration file.
@y
Set the `GEMINI_API_KEY` or `GOOGLE_API_KEY` environment variable in your
shell configuration file.
@z

@x
Docker Sandboxes use a daemon process that doesn't inherit environment
variables from your current shell session. To make your API key available to
sandboxes, set it globally in your shell configuration file.
@y
Docker Sandboxes use a daemon process that doesn't inherit environment
variables from your current shell session. To make your API key available to
sandboxes, set it globally in your shell configuration file.
@z

@x
Add the API key to your shell configuration file:
@y
Add the API key to your shell configuration file:
@z

@x
```plaintext {title="~/.bashrc or ~/.zshrc"}
export GEMINI_API_KEY=AIzaSyxxxxx
```
@y
```plaintext {title="~/.bashrc or ~/.zshrc"}
export GEMINI_API_KEY=AIzaSyxxxxx
```
@z

@x
Or use `GOOGLE_API_KEY`:
@y
Or use `GOOGLE_API_KEY`:
@z

@x
```plaintext {title="~/.bashrc or ~/.zshrc"}
export GOOGLE_API_KEY=AIzaSyxxxxx
```
@y
```plaintext {title="~/.bashrc or ~/.zshrc"}
export GOOGLE_API_KEY=AIzaSyxxxxx
```
@z

@x
Apply the changes:
@y
Apply the changes:
@z

@x
1. Source your shell configuration: `source ~/.bashrc` (or `~/.zshrc`)
2. Restart Docker Desktop so the daemon picks up the new environment variable
3. Create and run your sandbox:
@y
1. Source your shell configuration: `source ~/.bashrc` (or `~/.zshrc`)
2. Restart Docker Desktop so the daemon picks up the new environment variable
3. Create and run your sandbox:
@z

@x
```console
$ docker sandbox create gemini ~/project
$ docker sandbox run <sandbox-name>
```
@y
```console
$ docker sandbox create gemini ~/project
$ docker sandbox run <sandbox-name>
```
@z

@x
The sandbox detects the environment variable and uses it automatically.
@y
The sandbox detects the environment variable and uses it automatically.
@z

@x
### Interactive authentication
@y
### Interactive authentication
@z

@x
If neither `GEMINI_API_KEY` nor `GOOGLE_API_KEY` is set, Gemini prompts you to
sign in when it starts.
@y
If neither `GEMINI_API_KEY` nor `GOOGLE_API_KEY` is set, Gemini prompts you to
sign in when it starts.
@z

@x
When using interactive authentication:
@y
When using interactive authentication:
@z

@x
- You must authenticate each sandbox separately
- If the sandbox is removed or destroyed, you'll need to authenticate again when you recreate it
- Authentication sessions aren't persisted outside the sandbox
- No fallback authentication methods are used
@y
- You must authenticate each sandbox separately
- If the sandbox is removed or destroyed, you'll need to authenticate again when you recreate it
- Authentication sessions aren't persisted outside the sandbox
- No fallback authentication methods are used
@z

@x
To avoid repeated authentication, set the `GEMINI_API_KEY` or `GOOGLE_API_KEY` environment variable.
@y
To avoid repeated authentication, set the `GEMINI_API_KEY` or `GOOGLE_API_KEY` environment variable.
@z

@x
## Configuration
@y
## Configuration
@z

@x
Configure Gemini behavior in `~/.gemini/settings.json`:
@y
Configure Gemini behavior in `~/.gemini/settings.json`:
@z

@x
```json
{
  "disable_sandbox_tool": true,
  "trusted_folders": ["/workspace"]
}
```
@y
```json
{
  "disable_sandbox_tool": true,
  "trusted_folders": ["/workspace"]
}
```
@z

@x
These settings disable safety checks and allow Gemini to operate without
repeated confirmations for workspace files.
@y
These settings disable safety checks and allow Gemini to operate without
repeated confirmations for workspace files.
@z

@x
### Pass options at runtime
@y
### Pass options at runtime
@z

@x
Pass Gemini CLI options after the sandbox name and a `--` separator:
@y
Pass Gemini CLI options after the sandbox name and a `--` separator:
@z

@x
```console
$ docker sandbox run <sandbox-name> -- --yolo
```
@y
```console
$ docker sandbox run <sandbox-name> -- --yolo
```
@z

@x
The `--yolo` flag disables approval prompts for a single session without
modifying the configuration file.
@y
The `--yolo` flag disables approval prompts for a single session without
modifying the configuration file.
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
Gemini is configured to disable its built-in OAuth flow. Authentication is managed through the Docker Sandbox proxy with API keys.
@y
Gemini is configured to disable its built-in OAuth flow. Authentication is managed through the Docker Sandbox proxy with API keys.
@z

@x
See [Custom templates](../templates.md) to build your own agent images.
@y
See [Custom templates](../templates.md) to build your own agent images.
@z
