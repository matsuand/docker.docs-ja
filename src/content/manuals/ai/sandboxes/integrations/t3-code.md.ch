%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Connect T3 Code to a sandbox
linkTitle: T3 Code
@y
title: Connect T3 Code to a sandbox
linkTitle: T3 Code
@z

@x
description: Run T3 Code against a Docker Sandbox over SSH.
keywords: docker sandboxes, t3 code, remote ssh, remote development, sbx
@y
description: Run T3 Code against a Docker Sandbox over SSH.
keywords: docker sandboxes, t3 code, remote ssh, remote development, sbx
@z

@x
{{< summary-bar feature_name="Docker Sandboxes SSH" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes SSH" >}}
@z

@x
T3 Code's SSH integration lets the desktop app drive coding agents inside a
sandbox. T3 Code has no dedicated Docker Sandboxes integration — it treats the
sandbox as an ordinary SSH host, connects to it, and starts a T3 server inside
that tunnels back to the app.
@y
T3 Code's SSH integration lets the desktop app drive coding agents inside a
sandbox. T3 Code has no dedicated Docker Sandboxes integration — it treats the
sandbox as an ordinary SSH host, connects to it, and starts a T3 server inside
that tunnels back to the app.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- SSH access set up. See [Editor and app integrations](_index.md#enable-ssh-access).
- T3 Code installed.
@y
- SSH access set up. See [Editor and app integrations](_index.md#enable-ssh-access).
- T3 Code installed.
@z

@x
The first connection installs the T3 server in the sandbox, which needs a
build toolchain. T3 depends on `node-pty`, which ships prebuilt binaries only
for macOS and Windows. On a Linux sandbox, `node-pty` compiles from source and
the build fails without `make`, `python3`, and a compiler such as `g++`.
@y
The first connection installs the T3 server in the sandbox, which needs a
build toolchain. T3 depends on `node-pty`, which ships prebuilt binaries only
for macOS and Windows. On a Linux sandbox, `node-pty` compiles from source and
the build fails without `make`, `python3`, and a compiler such as `g++`.
@z

@x
The [`t3code` kit](https://github.com/docker/sbx-kits-contrib/tree/main/t3code)
prepares a sandbox for T3 Code: it installs the build toolchain and the `t3`
npm package when the sandbox is created, so the first connection starts a
pre-installed server instead of building `node-pty` from source. Pair it with
any agent whose base image ships Node.js 18 or later, which all standard
agent templates do:
@y
The [`t3code` kit](https://github.com/docker/sbx-kits-contrib/tree/main/t3code)
prepares a sandbox for T3 Code: it installs the build toolchain and the `t3`
npm package when the sandbox is created, so the first connection starts a
pre-installed server instead of building `node-pty` from source. Pair it with
any agent whose base image ships Node.js 18 or later, which all standard
agent templates do:
@z

@x
```console
$ sbx run claude --kit docker.io/sbx/t3code-kit:latest
```
@y
```console
$ sbx run claude --kit docker.io/sbx/t3code-kit:latest
```
@z

@x
For an existing sandbox, install the toolchain manually:
@y
For an existing sandbox, install the toolchain manually:
@z

@x
```console
$ sbx exec <sandbox> -- sudo apt-get update
$ sbx exec <sandbox> -- sudo DEBIAN_FRONTEND=noninteractive apt-get install -y g++ make python3
```
@y
```console
$ sbx exec <sandbox> -- sudo apt-get update
$ sbx exec <sandbox> -- sudo DEBIAN_FRONTEND=noninteractive apt-get install -y g++ make python3
```
@z

@x
Verify the toolchain is in place:
@y
Verify the toolchain is in place:
@z

@x
```console
$ sbx exec <sandbox> -- sh -lc 'command -v g++ && command -v make && command -v python3'
```
@y
```console
$ sbx exec <sandbox> -- sh -lc 'command -v g++ && command -v make && command -v python3'
```
@z

@x
A manual install lasts only until the sandbox is recreated, and the first
connection still builds `node-pty` from source. For a setup that persists,
recreate the sandbox with the [kit](../customize/kits.md) or a custom
[template](../customize/templates.md).
@y
A manual install lasts only until the sandbox is recreated, and the first
connection still builds `node-pty` from source. For a setup that persists,
recreate the sandbox with the [kit](../customize/kits.md) or a custom
[template](../customize/templates.md).
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
In T3 Code, add an SSH environment and enter the sandbox hostname, such as
`demo.sbx`, as the host. The first connection installs the T3 server inside
the sandbox unless the `t3code` kit pre-installed it, so it can take a
moment. Later connections are faster.
@y
In T3 Code, add an SSH environment and enter the sandbox hostname, such as
`demo.sbx`, as the host. The first connection installs the T3 server inside
the sandbox unless the `t3code` kit pre-installed it, so it can take a
moment. Later connections are faster.
@z

@x
Then add a new project, select the SSH environment from the list, and
[choose the mounted workspace](_index.md#select-the-workspace-folder) as the
project directory inside the sandbox.
@y
Then add a new project, select the SSH environment from the list, and
[choose the mounted workspace](_index.md#select-the-workspace-folder) as the
project directory inside the sandbox.
@z

@x
## Troubleshoot a server that never becomes ready
@y
## Troubleshoot a server that never becomes ready
@z

@x
T3 Code can fail to connect with an error like the following, wrapped here
for readability. It concatenates the connection failure with npm's install
output from inside the sandbox into a single error dialog:
@y
T3 Code can fail to connect with an error like the following, wrapped here
for readability. It concatenates the connection failure with npm's install
output from inside the sandbox into a single error dialog:
@z

@x
```text
Could not prepare the SSH environment: ... SshCommandError: Connecting to
sandbox "sandboxes"… Remote T3 server did not become ready on
127.0.0.1:3773. npm WARN EBADENGINE Unsupported engine { package:
'ini@7.0.0', required: { node: '^22.22.2 || ^24.15.0 || >=26.0.0' },
current: { node: 'v22.22.1', npm: '9.2.0' } }
```
@y
```text
Could not prepare the SSH environment: ... SshCommandError: Connecting to
sandbox "sandboxes"… Remote T3 server did not become ready on
127.0.0.1:3773. npm WARN EBADENGINE Unsupported engine { package:
'ini@7.0.0', required: { node: '^22.22.2 || ^24.15.0 || >=26.0.0' },
current: { node: 'v22.22.1', npm: '9.2.0' } }
```
@z

@x
The `npm WARN EBADENGINE` lines warn about the transitive `ini` dependency
and are separate from the failure: npm enforces engine requirements only
when `engine-strict` is set, which is off by default, so this warning alone
still lets the install proceed.
@y
The `npm WARN EBADENGINE` lines warn about the transitive `ini` dependency
and are separate from the failure: npm enforces engine requirements only
when `engine-strict` is set, which is off by default, so this warning alone
still lets the install proceed.
@z

@x
The most common causes are a missing C++ toolchain and a full disk, and both
produce this identical error. Get npm's actual output to tell them apart:
@y
The most common causes are a missing C++ toolchain and a full disk, and both
produce this identical error. Get npm's actual output to tell them apart:
@z

@x
```console
$ sbx exec <sandbox> -- sh -lc \
  'rm -rf /tmp/t3probe && mkdir -p /tmp/t3probe && cd /tmp/t3probe \
   && npm init -y >/dev/null && npm install t3@latest 2>&1 | tail -40'
```
@y
```console
$ sbx exec <sandbox> -- sh -lc \
  'rm -rf /tmp/t3probe && mkdir -p /tmp/t3probe && cd /tmp/t3probe \
   && npm init -y >/dev/null && npm install t3@latest 2>&1 | tail -40'
```
@z

@x
A missing compiler fails the native `node-pty` build with `Error 127` from
`make`:
@y
A missing compiler fails the native `node-pty` build with `Error 127` from
`make`:
@z

@x
```text
npm ERR! make: g++: No such file or directory
npm ERR! make: *** [pty.target.mk:115: Release/obj.target/pty/src/unix/pty.o] Error 127
npm ERR! gyp ERR! build error
npm ERR! gyp ERR! stack Error: `make` failed with exit code: 2
```
@y
```text
npm ERR! make: g++: No such file or directory
npm ERR! make: *** [pty.target.mk:115: Release/obj.target/pty/src/unix/pty.o] Error 127
npm ERR! gyp ERR! build error
npm ERR! gyp ERR! stack Error: `make` failed with exit code: 2
```
@z

@x
Install the build toolchain as described in [Prerequisites](#prerequisites).
@y
Install the build toolchain as described in [Prerequisites](#prerequisites).
@z

@x
A full disk fails with `ENOSPC`, and no gyp output appears at all because npm
fails before the native build starts:
@y
A full disk fails with `ENOSPC`, and no gyp output appears at all because npm
fails before the native build starts:
@z

@x
```text
npm ERR! code ENOSPC
npm ERR! nospc ENOSPC: no space left on device
```
@y
```text
npm ERR! code ENOSPC
npm ERR! nospc ENOSPC: no space left on device
```
@z

@x
Check free disk space:
@y
Check free disk space:
@z

@x
```console
$ sbx exec <sandbox> -- df -h /
```
@y
```console
$ sbx exec <sandbox> -- df -h /
```
@z

@x
A sandbox can have both problems at once. Fixing one still leaves the same
top-level error, so check both the toolchain and disk space before
concluding the sandbox is ready. Free up space or install the toolchain as
needed, then reconnect.
@y
A sandbox can have both problems at once. Fixing one still leaves the same
top-level error, so check both the toolchain and disk space before
concluding the sandbox is ready. Free up space or install the toolchain as
needed, then reconnect.
@z

@x
## Troubleshoot `turn/setPermissionMode failed`
@y
## Troubleshoot `turn/setPermissionMode failed`
@z

@x
If your organization manages Claude Code with a policy file, a local T3 Code
thread can fail to start with `turn/setPermissionMode failed`. T3 Code's
default runtime mode is Full access, which maps to the Claude Agent SDK's
`bypassPermissions` mode. A managed policy that disables that mode rejects
the request.
@y
If your organization manages Claude Code with a policy file, a local T3 Code
thread can fail to start with `turn/setPermissionMode failed`. T3 Code's
default runtime mode is Full access, which maps to the Claude Agent SDK's
`bypassPermissions` mode. A managed policy that disables that mode rejects
the request.
@z

@x
On macOS, check whether this applies to you:
@y
On macOS, check whether this applies to you:
@z

@x
```console
$ cat "/Library/Application Support/ClaudeCode/managed-settings.json"
```
@y
```console
$ cat "/Library/Application Support/ClaudeCode/managed-settings.json"
```
@z

@x
If `permissions.disableBypassPermissionsMode` is set to `disable`, switch T3
Code to a different runtime mode, such as Supervised, Auto-accept edits, or
Auto, then start a new thread. The permission mode is captured once when a
thread starts, so switching modes in an already-failing thread doesn't
recover it.
@y
If `permissions.disableBypassPermissionsMode` is set to `disable`, switch T3
Code to a different runtime mode, such as Supervised, Auto-accept edits, or
Auto, then start a new thread. The permission mode is captured once when a
thread starts, so switching modes in an already-failing thread doesn't
recover it.
@z

@x
This restriction applies to the host running Claude Code, not to a sandbox.
A thread connected to a sandbox isn't subject to the host's managed policy,
so Full access works normally there.
@y
This restriction applies to the host running Claude Code, not to a sandbox.
A thread connected to a sandbox isn't subject to the host's managed policy,
so Full access works normally there.
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
