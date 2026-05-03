%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Shell
@y
title: Shell
@z

@x
description: Run an agent-less sandbox with a Bash login shell for manual setup, testing custom agent implementations, or inspecting a running environment.
keywords: sandboxes, sbx, shell, agent, manual setup, testing
@y
description: Run an agent-less sandbox with a Bash login shell for manual setup, testing custom agent implementations, or inspecting a running environment.
keywords: sandboxes, sbx, shell, agent, manual setup, testing
@z

@x
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@z

@x
`sbx run shell` drops you into a Bash login shell inside a sandbox with no
pre-installed agent binary. It's useful for installing and configuring
agents manually, testing custom implementations, or inspecting a running
environment.
@y
`sbx run shell` drops you into a Bash login shell inside a sandbox with no
pre-installed agent binary. It's useful for installing and configuring
agents manually, testing custom implementations, or inspecting a running
environment.
@z

@x
```console
$ sbx run shell ~/my-project
```
@y
```console
$ sbx run shell ~/my-project
```
@z

@x
The workspace path defaults to the current directory. To run a one-off
command instead of an interactive shell, pass it after `--`:
@y
The workspace path defaults to the current directory. To run a one-off
command instead of an interactive shell, pass it after `--`:
@z

@x
```console
$ sbx run shell -- -c "echo 'Hello from sandbox'"
```
@y
```console
$ sbx run shell -- -c "echo 'Hello from sandbox'"
```
@z

@x
Set your API keys as environment variables so the sandbox proxy can inject
them into API requests automatically. Credentials are never stored inside
the VM:
@y
Set your API keys as environment variables so the sandbox proxy can inject
them into API requests automatically. Credentials are never stored inside
the VM:
@z

@x
```console
$ export ANTHROPIC_API_KEY=sk-ant-xxxxx
$ export OPENAI_API_KEY=sk-xxxxx
```
@y
```console
$ export ANTHROPIC_API_KEY=sk-ant-xxxxx
$ export OPENAI_API_KEY=sk-xxxxx
```
@z

@x
Once inside the shell, you can install agents using their standard methods,
for example `npm install -g @continuedev/cli`. For complex setups, build a
[custom template](../customize/templates.md) instead of installing
interactively each time.
@y
Once inside the shell, you can install agents using their standard methods,
for example `npm install -g @continuedev/cli`. For complex setups, build a
[custom template](../customize/templates.md) instead of installing
interactively each time.
@z

@x
## Base image
@y
## Base image
@z

@x
The shell sandbox uses the `shell` base image — the common base environment
without a pre-installed agent.
@y
The shell sandbox uses the `shell` base image — the common base environment
without a pre-installed agent.
@z
