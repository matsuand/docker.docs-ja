%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Develop remotely in a cloud sandbox
linkTitle: Remote development
description: Connect VS Code or Cursor to a cloud sandbox over SSH, edit and preview a sample, and save your work.
keywords: docker agentic platform, cloud sandboxes, workflows, remote development
@y
title: Develop remotely in a cloud sandbox
linkTitle: Remote development
description: Connect VS Code or Cursor to a cloud sandbox over SSH, edit and preview a sample, and save your work.
keywords: docker agentic platform, cloud sandboxes, workflows, remote development
@z

@x
Keep project files and development tools in a cloud sandbox while using VS Code
or Cursor on your computer.
@y
Keep project files and development tools in a cloud sandbox while using VS Code
or Cursor on your computer.
@z

@x
## Before you begin
@y
## Before you begin
@z

@x
You need an active [Docker Agentic Platform subscription](/manuals/agentic-platform/signup.md#activate-cloud-access),
the [Docker Sandboxes CLI](/manuals/ai/sandboxes/install.md) version 0.45.0 or
later, an SSH client, and VS Code or Cursor. The public sample needs no GitHub
token or model API key. Use the same Docker account in the CLI and Console.
@y
You need an active [Docker Agentic Platform subscription](manuals/agentic-platform/signup.md#activate-cloud-access),
the [Docker Sandboxes CLI](manuals/ai/sandboxes/install.md) version 0.45.0 or
later, an SSH client, and VS Code or Cursor. The public sample needs no GitHub
token or model API key. Use the same Docker account in the CLI and Console.
@z

@x
Your editor window runs locally. Project files, terminal commands, and the
editor's remote server run inside the sandbox. Files don't sync to your computer.
Docker bills compute while the sandbox runs, even with the editor disconnected.
@y
Your editor window runs locally. Project files, terminal commands, and the
editor's remote server run inside the sandbox. Files don't sync to your computer.
Docker bills compute while the sandbox runs, even with the editor disconnected.
@z

@x
## Create the remote project
@y
## Create the remote project
@z

@x
1. Open the [Console](https://agentic-platform.docker.com/) and select **+ New sandbox**.
2. Choose **shell**, deselect saved credentials and MCP tools, and select
   **Open** so the editor can download its remote server and dependencies.
   Open permits unrestricted outbound network access; use it here with the
   public sample and no saved credentials.
3. Review the compute price and timer. Select **Stop** under **When the time is up**
   to retain files, then select **Run**.
4. In the sandbox's browser terminal, clone the sample:
@y
1. Open the [Console](https://agentic-platform.docker.com/) and select **+ New sandbox**.
2. Choose **shell**, deselect saved credentials and MCP tools, and select
   **Open** so the editor can download its remote server and dependencies.
   Open permits unrestricted outbound network access; use it here with the
   public sample and no saved credentials.
3. Review the compute price and timer. Select **Stop** under **When the time is up**
   to retain files, then select **Run**.
4. In the sandbox's browser terminal, clone the sample:
@z

@x
   ```console
   $ git clone https://github.com/docker/welcome-to-docker.git project
   ```
@y
   ```console
   $ git clone https://github.com/docker/welcome-to-docker.git project
   ```
@z

@x
Expect `/home/agent/workspace/project` to contain the sample source and Dockerfile.
Local workspaces aren't mounted in the cloud sandbox.
@y
Expect `/home/agent/workspace/project` to contain the sample source and Dockerfile.
Local workspaces aren't mounted in the cloud sandbox.
@z

@x
## Configure and test SSH
@y
## Configure and test SSH
@z

@x
In a terminal on your computer, run:
@y
In a terminal on your computer, run:
@z

@x
```console
$ sbx login
$ sbx --cloud setup ssh
$ sbx --cloud ls
```
@y
```console
$ sbx login
$ sbx --cloud setup ssh
$ sbx --cloud ls
```
@z

@x
Copy the sandbox's `sbx_`-prefixed ID from the list, then test the connection:
@y
Copy the sandbox's `sbx_`-prefixed ID from the list, then test the connection:
@z

@x
```console
$ ssh <SANDBOX_ID>@sbx_cloud
$ ls /home/agent/workspace/project
$ exit
```
@y
```console
$ ssh <SANDBOX_ID>@sbx_cloud
$ ls /home/agent/workspace/project
$ exit
```
@z

@x
Expect a shell inside the sandbox and the project files. `exit` returns you to
your computer. Use the ID, rather than the sandbox's display name, for SSH.
See [Connect with SSH](/manuals/ai/sandboxes/cloud/usage.md#connect-with-ssh)
for proxy troubleshooting.
@y
Expect a shell inside the sandbox and the project files. `exit` returns you to
your computer. Use the ID, rather than the sandbox's display name, for SSH.
See [Connect with SSH](manuals/ai/sandboxes/cloud/usage.md#connect-with-ssh)
for proxy troubleshooting.
@z

@x
## Connect your editor
@y
## Connect your editor
@z

@x
Choose the instructions for your editor:
@y
Choose the instructions for your editor:
@z

@x
- In VS Code, install the
  [Remote - SSH extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh).
  Open the Command Palette and run **Remote-SSH: Connect to Host**.
- In Cursor, install its Remote - SSH support. Open the Command Palette and run
  **Remote-SSH: Connect to Host**.
@y
- In VS Code, install the
  [Remote - SSH extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh).
  Open the Command Palette and run **Remote-SSH: Connect to Host**.
- In Cursor, install its Remote - SSH support. Open the Command Palette and run
  **Remote-SSH: Connect to Host**.
@z

@x
Enter `<SANDBOX_ID>@sbx_cloud` using the ID you tested. In the remote window,
open `/home/agent/workspace/project`. The first connection installs the editor's
server inside the sandbox. Expect the editor to show a remote connection and
the same project files you listed over SSH.
@y
Enter `<SANDBOX_ID>@sbx_cloud` using the ID you tested. In the remote window,
open `/home/agent/workspace/project`. The first connection installs the editor's
server inside the sandbox. Expect the editor to show a remote connection and
the same project files you listed over SSH.
@z

@x
For local sandbox integration, see the separate
[VS Code](/manuals/ai/sandboxes/integrations/vscode.md) and
[Cursor](/manuals/ai/sandboxes/integrations/cursor.md) pages.
@y
For local sandbox integration, see the separate
[VS Code](manuals/ai/sandboxes/integrations/vscode.md) and
[Cursor](manuals/ai/sandboxes/integrations/cursor.md) pages.
@z

@x
## Edit and preview remotely
@y
## Edit and preview remotely
@z

@x
In the remote editor, find a visible heading in the application's source,
change its text, and save the file. In the editor's remote terminal, build and run:
@y
In the remote editor, find a visible heading in the application's source,
change its text, and save the file. In the editor's remote terminal, build and run:
@z

@x
```console
$ cd /home/agent/workspace/project
$ docker build -t welcome-to-docker .
$ docker run -d --name welcome-to-docker -p 3000:3000 welcome-to-docker
```
@y
```console
$ cd /home/agent/workspace/project
$ docker build -t welcome-to-docker .
$ docker run -d --name welcome-to-docker -p 3000:3000 welcome-to-docker
```
@z

@x
In the Console, select **Connect**, enter `3000` under **Connect via a Port**,
and select **Open Port**. Open the generated HTTPS URL and expect to see your
changed heading. This URL is public: Docker account authentication doesn't
protect it. Use non-sensitive data and application authentication for private
content. Close the port in **Connect** after checking the preview and reload
the URL to verify the application is no longer reachable.
@y
In the Console, select **Connect**, enter `3000` under **Connect via a Port**,
and select **Open Port**. Open the generated HTTPS URL and expect to see your
changed heading. This URL is public: Docker account authentication doesn't
protect it. Use non-sensitive data and application authentication for private
content. Close the port in **Connect** after checking the preview and reload
the URL to verify the application is no longer reachable.
@z

@x
## Reconnect and keep your work
@y
## Reconnect and keep your work
@z

@x
Close the remote editor window, then connect again using the same host entry
and open the same directory. Expect your saved change to remain. Disconnecting
doesn't pause the sandbox. If the timer stopped it, resume it in the Console
before reconnecting; check the fresh timer and restart the workload if needed.
@y
Close the remote editor window, then connect again using the same host entry
and open the same directory. Expect your saved change to remain. Disconnecting
doesn't pause the sandbox. If the timer stopped it, resume it in the Console
before reconnecting; check the fresh timer and restart the workload if needed.
@z

@x
From a terminal on your computer, copy the project out:
@y
From a terminal on your computer, copy the project out:
@z

@x
```console
$ sbx --cloud cp <SANDBOX_ID>:/home/agent/workspace/project ./cloud-project
```
@y
```console
$ sbx --cloud cp <SANDBOX_ID>:/home/agent/workspace/project ./cloud-project
```
@z

@x
Inspect the copied source and confirm that your edit is present. Alternatively,
commit and push to a repository you control. Configure a
[GitHub credential](/manuals/agentic-platform/secrets.md#github-credential)
with the required repository permissions before launching a sandbox for that workflow.
@y
Inspect the copied source and confirm that your edit is present. Alternatively,
commit and push to a repository you control. Configure a
[GitHub credential](manuals/agentic-platform/secrets.md#github-credential)
with the required repository permissions before launching a sandbox for that workflow.
@z

@x
## Clean up
@y
## Clean up
@z

@x
In **Sandboxes**, pause the sandbox and confirm its paused status to stop compute
charges and retain files. A resumed sandbox gets a fresh timer with the original
duration. Once you've verified your saved copy, delete the sandbox if you no
longer need it. Deletion removes the remote files and editor server.
See [Lifecycle actions](/manuals/agentic-platform/sandboxes.md#manage-the-lifecycle).
@y
In **Sandboxes**, pause the sandbox and confirm its paused status to stop compute
charges and retain files. A resumed sandbox gets a fresh timer with the original
duration. Once you've verified your saved copy, delete the sandbox if you no
longer need it. Deletion removes the remote files and editor server.
See [Lifecycle actions](manuals/agentic-platform/sandboxes.md#manage-the-lifecycle).
@z
