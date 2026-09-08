%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Connect ChatGPT to a sandbox
linkTitle: ChatGPT
@y
title: Connect ChatGPT to a sandbox
linkTitle: ChatGPT
@z

@x
description: Run Codex in the ChatGPT desktop app against a Docker Sandbox over SSH.
keywords: docker sandboxes, chatgpt, codex, openai, remote ssh, sbx
@y
description: Run Codex in the ChatGPT desktop app against a Docker Sandbox over SSH.
keywords: docker sandboxes, chatgpt, codex, openai, remote ssh, sbx
@z

@x
{{< summary-bar feature_name="Docker Sandboxes SSH" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes SSH" >}}
@z

@x
Connect the ChatGPT desktop app to a sandbox over SSH so Codex works inside the
isolated environment instead of on your host.
@y
Connect the ChatGPT desktop app to a sandbox over SSH so Codex works inside the
isolated environment instead of on your host.
@z

@x
> [!NOTE]
> This page covers running Codex in the ChatGPT desktop app connected to a
> sandbox over SSH. To run the Codex CLI inside a sandbox directly, see
> [Codex](../agents/codex.md).
@y
> [!NOTE]
> This page covers running Codex in the ChatGPT desktop app connected to a
> sandbox over SSH. To run the Codex CLI inside a sandbox directly, see
> [Codex](../agents/codex.md).
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- SSH access set up. See [Editor and app integrations](_index.md#enable-ssh-access).
- The ChatGPT desktop app installed.
@y
- SSH access set up. See [Editor and app integrations](_index.md#enable-ssh-access).
- The ChatGPT desktop app installed.
@z

@x
ChatGPT's remote server requires the `codex` command in the sandbox. The Codex
sandbox template used in the following section includes this command.
@y
ChatGPT's remote server requires the `codex` command in the sandbox. The Codex
sandbox template used in the following section includes this command.
@z

@x
## Connect
@y
## Connect
@z

@x
Create a named Codex sandbox for the current directory if you don't already
have one:
@y
Create a named Codex sandbox for the current directory if you don't already
have one:
@z

@x
```console
$ sbx create --name demo codex .
```
@y
```console
$ sbx create --name demo codex .
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
In the ChatGPT desktop app, open **Settings > Connections** and add an SSH
connection manually. Enter the sandbox hostname, such as `demo.sbx`, as the
host, then use the remote folder picker to
[select the mounted workspace](_index.md#select-the-workspace-folder) as the
remote project.
@y
In the ChatGPT desktop app, open **Settings > Connections** and add an SSH
connection manually. Enter the sandbox hostname, such as `demo.sbx`, as the
host, then use the remote folder picker to
[select the mounted workspace](_index.md#select-the-workspace-folder) as the
remote project.
@z

@x
For more connection options, see the OpenAI instructions to
[connect to an SSH host](https://learn.chatgpt.com/docs/remote-connections#connect-to-an-ssh-host).
@y
For more connection options, see the OpenAI instructions to
[connect to an SSH host](https://learn.chatgpt.com/docs/remote-connections#connect-to-an-ssh-host).
@z

@x
## Full access still prompts for approval
@y
## Full access still prompts for approval
@z

@x
ChatGPT controls Codex permissions separately from the Docker Sandbox. To run
commands without Codex approval prompts, select **Full access** from the
permissions menu for the remote chat. Enabling **Full access** under
**Settings > General** only adds the mode to the permissions menu. It doesn't
change an existing chat.
@y
ChatGPT controls Codex permissions separately from the Docker Sandbox. To run
commands without Codex approval prompts, select **Full access** from the
permissions menu for the remote chat. Enabling **Full access** under
**Settings > General** only adds the mode to the permissions menu. It doesn't
change an existing chat.
@z

@x
If the chat continues to request approval while showing **Full access**, update
the ChatGPT desktop app, then stop and restart the active task. Approval prompts
that return after reconnecting can indicate a
[Codex remote-permission synchronization issue](https://github.com/openai/codex/issues/29054).
@y
If the chat continues to request approval while showing **Full access**, update
the ChatGPT desktop app, then stop and restart the active task. Approval prompts
that return after reconnecting can indicate a
[Codex remote-permission synchronization issue](https://github.com/openai/codex/issues/29054).
@z

@x
## Related
@y
## Related
@z

@x
- [Editor and app integrations](_index.md) — how SSH access works and how to
  set it up
- [Codex](../agents/codex.md) — run the Codex CLI inside a sandbox
@y
- [Editor and app integrations](_index.md) — how SSH access works and how to
  set it up
- [Codex](../agents/codex.md) — run the Codex CLI inside a sandbox
@z
