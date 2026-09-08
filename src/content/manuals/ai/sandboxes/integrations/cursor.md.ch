%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Connect Cursor to a sandbox
linkTitle: Cursor
@y
title: Connect Cursor to a sandbox
linkTitle: Cursor
@z

@x
description: Use Cursor's Remote - SSH support to develop inside a Docker Sandbox.
keywords: docker sandboxes, cursor, remote ssh, remote development, sbx
@y
description: Use Cursor's Remote - SSH support to develop inside a Docker Sandbox.
keywords: docker sandboxes, cursor, remote ssh, remote development, sbx
@z

@x
{{< summary-bar feature_name="Docker Sandboxes SSH" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes SSH" >}}
@z

@x
Cursor is built on VS Code, so it connects to a sandbox the same way, using
Remote - SSH. Your editor stays on your host while files, terminals, and
extensions run in the isolated sandbox.
@y
Cursor is built on VS Code, so it connects to a sandbox the same way, using
Remote - SSH. Your editor stays on your host while files, terminals, and
extensions run in the isolated sandbox.
@z

@x
> [!NOTE]
> This page covers the Cursor editor connecting to a sandbox over SSH. To run
> the Cursor agent CLI inside a sandbox instead, see
> [Cursor agent](../agents/cursor.md).
@y
> [!NOTE]
> This page covers the Cursor editor connecting to a sandbox over SSH. To run
> the Cursor agent CLI inside a sandbox instead, see
> [Cursor agent](../agents/cursor.md).
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- SSH access set up. See [Editor and app integrations](_index.md#enable-ssh-access).
- Cursor's Remote - SSH support installed.
@y
- SSH access set up. See [Editor and app integrations](_index.md#enable-ssh-access).
- Cursor's Remote - SSH support installed.
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
1. Open the Command Palette and run **Remote-SSH: Connect to Host**.
2. Enter the sandbox host manually as `<name>.sbx`.
3. Cursor opens a new window connected to the sandbox. Use the remote folder
   picker to [select the mounted workspace](_index.md#select-the-workspace-folder).
@y
1. Open the Command Palette and run **Remote-SSH: Connect to Host**.
2. Enter the sandbox host manually as `<name>.sbx`.
3. Cursor opens a new window connected to the sandbox. Use the remote folder
   picker to [select the mounted workspace](_index.md#select-the-workspace-folder).
@z

@x
## Notes
@y
## Notes
@z

@x
- The first connection installs the editor server inside the sandbox, so it
  can take a moment. Later connections are faster.
@y
- The first connection installs the editor server inside the sandbox, so it
  can take a moment. Later connections are faster.
@z

@x
## Related
@y
## Related
@z

@x
- [Editor and app integrations](_index.md) — how SSH access works and how to
  set it up
- [Cursor agent](../agents/cursor.md) — run the Cursor CLI inside a sandbox
@y
- [Editor and app integrations](_index.md) — how SSH access works and how to
  set it up
- [Cursor agent](../agents/cursor.md) — run the Cursor CLI inside a sandbox
@z
