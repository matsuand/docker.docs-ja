%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Connect Orca to a sandbox
linkTitle: Orca
@y
title: Connect Orca to a sandbox
linkTitle: Orca
@z

@x
description: Run Orca's coding agents and terminals against a Docker Sandbox over SSH.
keywords: docker sandboxes, orca, remote ssh, coding agents, remote development, sbx
@y
description: Run Orca's coding agents and terminals against a Docker Sandbox over SSH.
keywords: docker sandboxes, orca, remote ssh, coding agents, remote development, sbx
@z

@x
{{< summary-bar feature_name="Docker Sandboxes SSH" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes SSH" >}}
@z

@x
These connection instructions use a local sandbox. For cloud SSH setup, see
[Connect with SSH](../cloud/usage.md#connect-with-ssh).
@y
These connection instructions use a local sandbox. For cloud SSH setup, see
[Connect with SSH](../cloud/usage.md#connect-with-ssh).
@z

@x
Orca runs coding agents in parallel, each in its own git worktree. Orca has no
dedicated Docker Sandboxes integration: it treats the sandbox as an ordinary
SSH host, installs a small relay inside it, and runs agents, terminals, and git
there while the editor and diff views stay on your host.
@y
Orca runs coding agents in parallel, each in its own git worktree. Orca has no
dedicated Docker Sandboxes integration: it treats the sandbox as an ordinary
SSH host, installs a small relay inside it, and runs agents, terminals, and git
there while the editor and diff views stay on your host.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- SSH access set up. See [Editor and app integrations](_index.md#enable-ssh-access).
- Orca installed.
@y
- SSH access set up. See [Editor and app integrations](_index.md#enable-ssh-access).
- Orca installed.
@z

@x
Orca's remote terminals need `node-pty`, which ships prebuilt binaries only for
macOS and Windows. On a Linux sandbox it compiles from source, and that build
needs a C++ compiler. Docker-provided templates include one, so a sandbox
created from a template is ready to connect.
@y
Orca's remote terminals need `node-pty`, which ships prebuilt binaries only for
macOS and Windows. On a Linux sandbox it compiles from source, and that build
needs a C++ compiler. Docker-provided templates include one, so a sandbox
created from a template is ready to connect.
@z

@x
A sandbox built from a custom
[base image](/manuals/ai/sandboxes/customize/author/base-images.md) without a
compiler still connects, and files, git, and the editor all work, but remote
terminals don't start. Add the toolchain to the image, or install it in the
running sandbox until you can:
@y
A sandbox built from a custom
[base image](manuals/ai/sandboxes/customize/author/base-images.md) without a
compiler still connects, and files, git, and the editor all work, but remote
terminals don't start. Add the toolchain to the image, or install it in the
running sandbox until you can:
@z

@x
```console
$ sbx exec <sandbox> -- sudo apt-get update
$ sbx exec <sandbox> -- sudo DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential
```
@y
```console
$ sbx exec <sandbox> -- sudo apt-get update
$ sbx exec <sandbox> -- sudo DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential
```
@z

@x
## Connect
@y
## Connect
@z

@x
Confirm that you can connect to the sandbox from a terminal:
@y
Confirm that you can connect to the sandbox from a terminal:
@z

@x
```console
$ ssh demo.sbx
```
@y
```console
$ ssh demo.sbx
```
@z

@x
1. In Orca, open **Settings → SSH** and select **Add Target**.
2. Enter the sandbox hostname, such as `demo.sbx`, as the host, and
   `_default_user_` as the username. Keep the default port and leave the
   identity file empty.
3. Select **Test** to check the connection, then **Save**.
4. Create a worktree and choose the sandbox under **Run on**.
@y
1. In Orca, open **Settings → SSH** and select **Add Target**.
2. Enter the sandbox hostname, such as `demo.sbx`, as the host, and
   `_default_user_` as the username. Keep the default port and leave the
   identity file empty.
3. Select **Test** to check the connection, then **Save**.
4. Create a worktree and choose the sandbox under **Run on**.
@z

@x
The first connection installs Orca's relay inside the sandbox, so it can take a
moment. Later connections are faster.
@y
The first connection installs Orca's relay inside the sandbox, so it can take a
moment. Later connections are faster.
@z

@x
`_default_user_` is the reserved username in the managed SSH configuration that
`sbx setup ssh` writes. It tells the daemon to run as the sandbox image's
default user. Any other username is taken literally as an in-sandbox user.
@y
`_default_user_` is the reserved username in the managed SSH configuration that
`sbx setup ssh` writes. It tells the daemon to run as the sandbox image's
default user. Any other username is taken literally as an in-sandbox user.
@z

@x
## Run an agent
@y
## Run an agent
@z

@x
Orca launches the agent you select for a worktree; a sandbox doesn't start one
for you. Orca pre-fills each agent's permission-bypass flag for new launches,
such as `--dangerously-skip-permissions` for Claude Code, which is how
`sbx run` starts the same agents.
@y
Orca launches the agent you select for a worktree; a sandbox doesn't start one
for you. Orca pre-fills each agent's permission-bypass flag for new launches,
such as `--dangerously-skip-permissions` for Claude Code, which is how
`sbx run` starts the same agents.
@z

@x
Orca only offers agents it finds installed on the host it connects to, so
create the sandbox with the agent you plan to drive:
@y
Orca only offers agents it finds installed on the host it connects to, so
create the sandbox with the agent you plan to drive:
@z

@x
```console
$ sbx create --name demo claude .
```
@y
```console
$ sbx create --name demo claude .
```
@z

@x
Credentials stay on your host. If you store them as
[credentials](../configuration/credentials.md), the sandbox proxy injects them
when the agent makes a request, so the agent authenticates without the value
ever entering the sandbox.
@y
Credentials stay on your host. If you store them as
[credentials](../configuration/credentials.md), the sandbox proxy injects them
when the agent makes a request, so the agent authenticates without the value
ever entering the sandbox.
@z

@x
## Related
@y
## Related
@z

@x
- [Editor and app integrations](_index.md) — how SSH access works and how to
  set it up
@y
- [Editor and app integrations](_index.md) — how SSH access works and how to
  set it up
@z
