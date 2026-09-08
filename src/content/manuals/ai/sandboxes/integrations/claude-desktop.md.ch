%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Connect Claude Desktop to a sandbox
linkTitle: Claude Desktop
@y
title: Connect Claude Desktop to a sandbox
linkTitle: Claude Desktop
@z

@x
description: Run Claude Code from Claude Desktop against a Docker Sandbox over SSH.
keywords: docker sandboxes, claude desktop, claude code, remote ssh, sbx
@y
description: Run Claude Code from Claude Desktop against a Docker Sandbox over SSH.
keywords: docker sandboxes, claude desktop, claude code, remote ssh, sbx
@z

@x
{{< summary-bar feature_name="Docker Sandboxes SSH" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes SSH" >}}
@z

@x
Claude Desktop can run Claude Code on a remote machine over SSH. Point it at a
sandbox so the agent works inside the isolated environment instead of on your
host.
@y
Claude Desktop can run Claude Code on a remote machine over SSH. Point it at a
sandbox so the agent works inside the isolated environment instead of on your
host.
@z

@x
> [!NOTE]
> This page covers Claude Desktop connecting to a sandbox over SSH. To run the
> Claude Code CLI inside a sandbox directly, see
> [Claude Code](../agents/claude-code.md).
@y
> [!NOTE]
> This page covers Claude Desktop connecting to a sandbox over SSH. To run the
> Claude Code CLI inside a sandbox directly, see
> [Claude Code](../agents/claude-code.md).
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- SSH access set up. See [Editor and app integrations](_index.md#enable-ssh-access).
- Claude Desktop installed.
@y
- SSH access set up. See [Editor and app integrations](_index.md#enable-ssh-access).
- Claude Desktop installed.
@z

@x
Use a sandbox created with the Claude agent type. The Claude sandbox template
configures Anthropic credentials and network access for the remote Claude Code
session.
@y
Use a sandbox created with the Claude agent type. The Claude sandbox template
configures Anthropic credentials and network access for the remote Claude Code
session.
@z

@x
## Connect
@y
## Connect
@z

@x
> [!WARNING]
> Connecting Claude Desktop to a sandbox over SSH transmits Anthropic
> credentials into the Claude Code process within the sandbox, reducing
> isolation guarantees.
@y
> [!WARNING]
> Connecting Claude Desktop to a sandbox over SSH transmits Anthropic
> credentials into the Claude Code process within the sandbox, reducing
> isolation guarantees.
@z

@x
Create a named Claude sandbox for the current directory if you don't already
have one:
@y
Create a named Claude sandbox for the current directory if you don't already
have one:
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
In Claude Desktop, open the environment drop-down before starting a session and
select **+ Add SSH connection**. Enter a name for the connection and enter the
sandbox hostname, such as `demo.sbx`, in **SSH Host**. Leave **SSH Port** and
**Identity File** empty because the managed SSH config supplies them.
@y
In Claude Desktop, open the environment drop-down before starting a session and
select **+ Add SSH connection**. Enter a name for the connection and enter the
sandbox hostname, such as `demo.sbx`, in **SSH Host**. Leave **SSH Port** and
**Identity File** empty because the managed SSH config supplies them.
@z

@x
Select the connection from the environment drop-down, then use the remote
folder picker to
[select the mounted workspace](_index.md#select-the-workspace-folder). The
picker might initially open at `/home/agent`.
@y
Select the connection from the environment drop-down, then use the remote
folder picker to
[select the mounted workspace](_index.md#select-the-workspace-folder). The
picker might initially open at `/home/agent`.
@z

@x
For more connection options, see the Claude Desktop instructions for
[SSH sessions](https://code.claude.com/docs/en/desktop#ssh-sessions).
@y
For more connection options, see the Claude Desktop instructions for
[SSH sessions](https://code.claude.com/docs/en/desktop#ssh-sessions).
@z

@x
## Troubleshoot a broken SSH connection after token refresh
@y
## Troubleshoot a broken SSH connection after token refresh
@z

@x
The SSH connection drops when the Anthropic token expires and needs to be
refreshed. To work around this, run the sandbox manually from your host:
@y
The SSH connection drops when the Anthropic token expires and needs to be
refreshed. To work around this, run the sandbox manually from your host:
@z

@x
```console
$ sbx run --name <sandbox-name>
```
@y
```console
$ sbx run --name <sandbox-name>
```
@z

@x
## Troubleshoot SSH connection timeouts on Windows
@y
## Troubleshoot SSH connection timeouts on Windows
@z

@x
Claude Desktop requires Git on Windows. If an SSH connection times out and the
Claude Desktop logs include `ProxyCommand error: spawn sh ENOENT`, install
[Git for Windows](https://git-scm.com/download/win).
@y
Claude Desktop requires Git on Windows. If an SSH connection times out and the
Claude Desktop logs include `ProxyCommand error: spawn sh ENOENT`, install
[Git for Windows](https://git-scm.com/download/win).
@z

@x
If Git is already installed, verify that `sh.exe` is available on your `PATH`:
@y
If Git is already installed, verify that `sh.exe` is available on your `PATH`:
@z

@x
```powershell
PS> where.exe sh
```
@y
```powershell
PS> where.exe sh
```
@z

@x
If the command doesn't find `sh.exe`, add the Git `bin` directory to your user
`Path`. The default directory is `C:\Program Files\Git\bin`. Quit and restart
Claude Desktop after updating `Path`.
@y
If the command doesn't find `sh.exe`, add the Git `bin` directory to your user
`Path`. The default directory is `C:\Program Files\Git\bin`. Quit and restart
Claude Desktop after updating `Path`.
@z

@x
## Related
@y
## Related
@z

@x
- [Editor and app integrations](_index.md) — how SSH access works and how to
  set it up
- [Claude Code](../agents/claude-code.md) — run the Claude Code CLI inside a
  sandbox
@y
- [Editor and app integrations](_index.md) — how SSH access works and how to
  set it up
- [Claude Code](../agents/claude-code.md) — run the Claude Code CLI inside a
  sandbox
@z
