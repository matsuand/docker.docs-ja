%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Get started with Docker Agentic Platform
linkTitle: Get started
description: Review a sample project with a coding agent or build and preview it from a shell in a cloud sandbox, without setting up a local development environment.
keywords: docker agentic platform, get started, cloud sandboxes, shell, agents, ssh, vscode, cursor
@y
title: Get started with Docker Agentic Platform
linkTitle: Get started
description: Review a sample project with a coding agent or build and preview it from a shell in a cloud sandbox, without setting up a local development environment.
keywords: docker agentic platform, get started, cloud sandboxes, shell, agents, ssh, vscode, cursor
@z

@x
Use a cloud sandbox to review a project with a coding agent or build and run
an application from a shell, without setting up the project on your computer.
@y
Use a cloud sandbox to review a project with a coding agent or build and run
an application from a shell, without setting up the project on your computer.
@z

@x
You can complete either workflow in the browser. An optional step shows how
to open the same project in VS Code or Cursor over SSH.
@y
You can complete either workflow in the browser. An optional step shows how
to open the same project in VS Code or Cursor over SSH.
@z

@x
## Before you begin
@y
## Before you begin
@z

@x
You need a personal Docker account with an active
[Docker Agentic Platform subscription](signup.md#activate-cloud-access).
@y
You need a personal Docker account with an active
[Docker Agentic Platform subscription](signup.md#activate-cloud-access).
@z

@x
Both workflows use a public sample project, so you don't need a GitHub token.
@y
Both workflows use a public sample project, so you don't need a GitHub token.
@z

@x
## Choose a workflow
@y
## Choose a workflow
@z

@x
- [Use a coding agent](#use-a-coding-agent) to have Claude Code review a sample
  project and save its findings. You need an Anthropic API key.
- [Use a shell](#use-a-shell) to build and run the sample application and preview
  it in your browser. You don't need a model provider API key.
@y
- [Use a coding agent](#use-a-coding-agent) to have Claude Code review a sample
  project and save its findings. You need an Anthropic API key.
- [Use a shell](#use-a-shell) to build and run the sample application and preview
  it in your browser. You don't need a model provider API key.
@z

@x
## Use a coding agent
@y
## Use a coding agent
@z

@x
Add an Anthropic API key under **Secrets** or enter it when you launch the
sandbox. Your model provider bills inference separately from Docker's sandbox
compute charges. For other agents and their credentials, see [Kits](kits.md)
and [Secrets](secrets.md).
@y
Add an Anthropic API key under **Secrets** or enter it when you launch the
sandbox. Your model provider bills inference separately from Docker's sandbox
compute charges. For other agents and their credentials, see [Kits](kits.md)
and [Secrets](secrets.md).
@z

@x
### Launch Claude Code
@y
### Launch Claude Code
@z

@x
1. Open [Docker Agentic Platform](https://agentic-platform.docker.com/) and
   select **+ New sandbox**.
2. Choose the Claude Code kit.
3. Add your Anthropic API key if it isn't already saved. Don't enter it in
   the agent's prompt or in a file inside the sandbox.
4. Keep the defaults and select **Run**.
@y
1. Open [Docker Agentic Platform](https://agentic-platform.docker.com/) and
   select **+ New sandbox**.
2. Choose the Claude Code kit.
3. Add your Anthropic API key if it isn't already saved. Don't enter it in
   the agent's prompt or in a file inside the sandbox.
4. Keep the defaults and select **Run**.
@z

@x
On your first launch, the default **Open** network policy permits outbound
access to any host. If you're using a custom policy, make sure it permits
GitHub and your model provider. See [Network policies](policies.md).
@y
On your first launch, the default **Open** network policy permits outbound
access to any host. If you're using a custom policy, make sure it permits
GitHub and your model provider. See [Network policies](policies.md).
@z

@x
When the sandbox is ready, its terminal opens with Claude Code.
@y
When the sandbox is ready, its terminal opens with Claude Code.
@z

@x
### Give the agent a task
@y
### Give the agent a task
@z

@x
Your local files aren't mounted in a cloud sandbox. Ask Claude Code to clone
and review a public sample project:
@y
Your local files aren't mounted in a cloud sandbox. Ask Claude Code to clone
and review a public sample project:
@z

@x
```text
Clone https://github.com/docker/welcome-to-docker.git into
/home/agent/workspace/project, then review the application.
Read the source, package.json, and Dockerfile. Don't modify the application
or install dependencies.
Write /home/agent/workspace/review.md with:
- A short explanation of what the application does.
- The commands defined in package.json for running and building it.
- An explanation of how the Dockerfile builds and serves the application.
- One small improvement you'd recommend, with the relevant file path.
Base the review on the files you read. Don't claim to have run the application.
Summarize your findings in your response.
```
@y
```text
Clone https://github.com/docker/welcome-to-docker.git into
/home/agent/workspace/project, then review the application.
Read the source, package.json, and Dockerfile. Don't modify the application
or install dependencies.
Write /home/agent/workspace/review.md with:
- A short explanation of what the application does.
- The commands defined in package.json for running and building it.
- An explanation of how the Dockerfile builds and serves the application.
- One small improvement you'd recommend, with the relevant file path.
Base the review on the files you read. Don't claim to have run the application.
Summarize your findings in your response.
```
@z

@x
Claude Code summarizes the project in the conversation and saves the review
at `/home/agent/workspace/review.md`. You can ask follow-up questions or give
it another task in the same session.
@y
Claude Code summarizes the project in the conversation and saves the review
at `/home/agent/workspace/review.md`. You can ask follow-up questions or give
it another task in the same session.
@z

@x
Continue to [keep your work](#keep-your-work), or
[open the project in your editor](#open-the-project-in-your-editor-optional).
@y
Continue to [keep your work](#keep-your-work), or
[open the project in your editor](#open-the-project-in-your-editor-optional).
@z

@x
## Use a shell
@y
## Use a shell
@z

@x
### Launch a shell
@y
### Launch a shell
@z

@x
The Shell kit starts a Bash shell without an agent.
@y
The Shell kit starts a Bash shell without an agent.
@z

@x
1. Open [Docker Agentic Platform](https://agentic-platform.docker.com/) and
   select **+ New sandbox**.
2. Open the kit picker and choose **shell**.
3. If saved secrets or a GitHub token are selected, deselect them for this
   walkthrough. You don't need MCP tools either.
4. In the network policy picker, select **Balanced** to permit access to
   GitHub, Docker Hub, and npm. Keep the compute and timer defaults and select
   **Run**.
@y
1. Open [Docker Agentic Platform](https://agentic-platform.docker.com/) and
   select **+ New sandbox**.
2. Open the kit picker and choose **shell**.
3. If saved secrets or a GitHub token are selected, deselect them for this
   walkthrough. You don't need MCP tools either.
4. In the network policy picker, select **Balanced** to permit access to
   GitHub, Docker Hub, and npm. Keep the compute and timer defaults and select
   **Run**.
@z

@x
If you use a custom network policy, make sure it permits GitHub, Docker Hub,
and npm. See [Network policies](policies.md).
@y
If you use a custom network policy, make sure it permits GitHub, Docker Hub,
and npm. See [Network policies](policies.md).
@z

@x
When the sandbox is ready, its terminal opens with a Bash shell.
@y
When the sandbox is ready, its terminal opens with a Bash shell.
@z

@x
### Build and run an application
@y
### Build and run an application
@z

@x
Your local files aren't mounted in a cloud sandbox. In the browser terminal,
clone a public sample project:
@y
Your local files aren't mounted in a cloud sandbox. In the browser terminal,
clone a public sample project:
@z

@x
```console
$ git clone https://github.com/docker/welcome-to-docker.git project
$ cd project
```
@y
```console
$ git clone https://github.com/docker/welcome-to-docker.git project
$ cd project
```
@z

@x
The Shell kit includes Docker Engine. Build the application's container image:
@y
The Shell kit includes Docker Engine. Build the application's container image:
@z

@x
```console
$ docker build -t welcome-to-docker .
```
@y
```console
$ docker build -t welcome-to-docker .
```
@z

@x
The build installs the application's dependencies and compiles it inside the
sandbox. When it finishes, start a container and publish its port:
@y
The build installs the application's dependencies and compiles it inside the
sandbox. When it finishes, start a container and publish its port:
@z

@x
```console
$ docker run -d --name welcome-to-docker -p 3000:3000 welcome-to-docker
```
@y
```console
$ docker run -d --name welcome-to-docker -p 3000:3000 welcome-to-docker
```
@z

@x
### Preview the application
@y
### Preview the application
@z

@x
1. Select **Connect** on the sandbox's detail page.
2. Under **Connect via a Port**, enter `3000` and select **Open Port**.
3. Open the generated URL in your browser.
@y
1. Select **Connect** on the sandbox's detail page.
2. Under **Connect via a Port**, enter `3000` and select **Open Port**.
3. Open the generated URL in your browser.
@z

@x
You should see the Welcome to Docker application. The application runs in the
cloud sandbox, so you can try it without installing Docker or Node.js on your
computer.
@y
You should see the Welcome to Docker application. The application runs in the
cloud sandbox, so you can try it without installing Docker or Node.js on your
computer.
@z

@x
The generated URL is public. Close the port in **Connect** when you've finished
previewing the application.
@y
The generated URL is public. Close the port in **Connect** when you've finished
previewing the application.
@z

@x
Continue to [keep your work](#keep-your-work), or
[open the project in your editor](#open-the-project-in-your-editor-optional).
@y
Continue to [keep your work](#keep-your-work), or
[open the project in your editor](#open-the-project-in-your-editor-optional).
@z

@x
## Keep your work
@y
## Keep your work
@z

@x
The cloned project and any files you create are stored in the sandbox. Files
don't sync automatically with your computer or a remote repository. They remain available
when you pause and resume the sandbox, but are lost when you delete it.
@y
The cloned project and any files you create are stored in the sandbox. Files
don't sync automatically with your computer or a remote repository. They remain available
when you pause and resume the sandbox, but are lost when you delete it.
@z

@x
To keep files outside the sandbox, use the CLI to
[transfer files](/manuals/ai/sandboxes/cloud/usage.md#transfer-files), or commit
and push changes to a repository. Include a
[GitHub credential](secrets.md#github-credential) when launching a sandbox that
needs to push changes.
@y
To keep files outside the sandbox, use the CLI to
[transfer files](manuals/ai/sandboxes/cloud/usage.md#transfer-files), or commit
and push changes to a repository. Include a
[GitHub credential](secrets.md#github-credential) when launching a sandbox that
needs to push changes.
@z

@x
## Open the project in your editor (optional)
@y
## Open the project in your editor (optional)
@z

@x
Open the project in VS Code or Cursor over SSH to edit the application. Your
editor runs on your computer, while the files and terminal commands stay in
the cloud sandbox.
@y
Open the project in VS Code or Cursor over SSH to edit the application. Your
editor runs on your computer, while the files and terminal commands stay in
the cloud sandbox.
@z

@x
1. Install the [Docker Sandboxes CLI](/manuals/ai/sandboxes/install.md),
   version 0.45.0 or later.
2. In a terminal on your computer, sign in with the same Docker account you
   used in the Console and configure cloud SSH access:
@y
1. Install the [Docker Sandboxes CLI](manuals/ai/sandboxes/install.md),
   version 0.45.0 or later.
2. In a terminal on your computer, sign in with the same Docker account you
   used in the Console and configure cloud SSH access:
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
3. Find your sandbox in the list and copy its `sbx_`-prefixed ID. Test the
   connection, replacing `<SANDBOX_ID>` with that ID:
@y
3. Find your sandbox in the list and copy its `sbx_`-prefixed ID. Test the
   connection, replacing `<SANDBOX_ID>` with that ID:
@z

@x
   ```console
   $ ssh <SANDBOX_ID>@sbx_cloud
   ```
@y
   ```console
   $ ssh <SANDBOX_ID>@sbx_cloud
   ```
@z

@x
   A successful connection opens a shell inside the cloud sandbox. Run `exit`
   to return to your computer's terminal.
4. In VS Code, install the
   [Remote - SSH extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh).
   In Cursor, install its Remote - SSH support.
5. Open your editor's Command Palette and run **Remote-SSH: Connect to Host**.
   Enter `<SANDBOX_ID>@sbx_cloud`, using the same ID as in the SSH command.
6. Open `/home/agent/workspace` in the remote window. Both workflows clone
   the application into `project`. The coding agent also saves `review.md`
   in the workspace.
@y
   A successful connection opens a shell inside the cloud sandbox. Run `exit`
   to return to your computer's terminal.
4. In VS Code, install the
   [Remote - SSH extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh).
   In Cursor, install its Remote - SSH support.
5. Open your editor's Command Palette and run **Remote-SSH: Connect to Host**.
   Enter `<SANDBOX_ID>@sbx_cloud`, using the same ID as in the SSH command.
6. Open `/home/agent/workspace` in the remote window. Both workflows clone
   the application into `project`. The coding agent also saves `review.md`
   in the workspace.
@z

@x
The first connection installs the editor's server inside the sandbox.
@y
The first connection installs the editor's server inside the sandbox.
@z

@x
If you followed the coding agent workflow, download the review run this command in a terminal on your computer:
@y
If you followed the coding agent workflow, download the review run this command in a terminal on your computer:
@z

@x
```console
$ sbx --cloud cp <SANDBOX_ID>:/home/agent/workspace/review.md ./review.md
```
@y
```console
$ sbx --cloud cp <SANDBOX_ID>:/home/agent/workspace/review.md ./review.md
```
@z

@x
## Pause, keep running, or delete the sandbox
@y
## Pause, keep running, or delete the sandbox
@z

@x
Closing the browser or disconnecting your editor leaves the sandbox running.
Commands and background processes can continue until you pause or delete the
sandbox, or its timer expires. Compute is billed while the sandbox runs, even
when no commands are running.
@y
Closing the browser or disconnecting your editor leaves the sandbox running.
Commands and background processes can continue until you pause or delete the
sandbox, or its timer expires. Compute is billed while the sandbox runs, even
when no commands are running.
@z

@x
Return to **Sandboxes** in the Console and choose what to do next:
@y
Return to **Sandboxes** in the Console and choose what to do next:
@z

@x
- Pause the sandbox to stop compute charges and keep its files. Confirm that
  it is paused in the list. To continue later, reopen the sandbox and resume
  it. Resuming starts a fresh timer with the original duration.
- Leave it running if the agent still has work to do or to keep the application available. Check the expiration
  time: the default **Stop** action stops the sandbox after one hour, including
  background processes, and keeps its files.
- Delete it when you no longer need it. Push any source changes
  you want to keep first. Deletion removes files stored only in the sandbox.
@y
- Pause the sandbox to stop compute charges and keep its files. Confirm that
  it is paused in the list. To continue later, reopen the sandbox and resume
  it. Resuming starts a fresh timer with the original duration.
- Leave it running if the agent still has work to do or to keep the application available. Check the expiration
  time: the default **Stop** action stops the sandbox after one hour, including
  background processes, and keeps its files.
- Delete it when you no longer need it. Push any source changes
  you want to keep first. Deletion removes files stored only in the sandbox.
@z

@x
For more detail, see [Lifecycle actions](sandboxes.md#manage-the-lifecycle).
To run a task from your own terminal, follow the
[cloud CLI walkthrough](/manuals/ai/sandboxes/cloud/_index.md#get-started).
For programmatic workflows, see the
[Sandboxes API quickstart](/manuals/ai/sandboxes-api/get-started.md).
@y
For more detail, see [Lifecycle actions](sandboxes.md#manage-the-lifecycle).
To run a task from your own terminal, follow the
[cloud CLI walkthrough](manuals/ai/sandboxes/cloud/_index.md#get-started).
For programmatic workflows, see the
[Sandboxes API quickstart](manuals/ai/sandboxes-api/get-started.md).
@z

@x
## Sandbox options
@y
## Sandbox options
@z

@x
After launch, you can't change the selected credentials, tools, network policies,
or compute size. Configure these options before selecting **Run**:
@y
After launch, you can't change the selected credentials, tools, network policies,
or compute size. Configure these options before selecting **Run**:
@z

@x
| Option | What to choose |
| --- | --- |
| Agent credentials | Add the API keys or tokens your kit needs. Saved credentials are reused by default; deselect optional credentials you don't want to include. See [Secrets](secrets.md). |
| GitHub token | Provide a token for Copilot or for cloning private repositories and pushing changes. Copilot uses the same token for both. Repository access is optional for other agents. See [GitHub credential](secrets.md#github-credential). |
| Network policies | Review the hosts and services the sandbox can reach. See [Network policies](policies.md). |
| MCP tools | Choose the servers your agent can use and authorize them if prompted. See [MCP](mcp.md). |
| Compute and platform | Choose CPU and memory resources. Under **Platform**, use **auto** or a platform supported by the kit's image. See [Sandbox platforms](sandboxes.md#choose-a-platform). |
| Timer | Under **Run for**, choose 1 to 24 hours. Under **When the time is up**, choose **Stop**, **Delete**, or **Restart** if offered. See [Lifecycle actions](sandboxes.md#manage-the-lifecycle). |
@y
| Option | What to choose |
| --- | --- |
| Agent credentials | Add the API keys or tokens your kit needs. Saved credentials are reused by default; deselect optional credentials you don't want to include. See [Secrets](secrets.md). |
| GitHub token | Provide a token for Copilot or for cloning private repositories and pushing changes. Copilot uses the same token for both. Repository access is optional for other agents. See [GitHub credential](secrets.md#github-credential). |
| Network policies | Review the hosts and services the sandbox can reach. See [Network policies](policies.md). |
| MCP tools | Choose the servers your agent can use and authorize them if prompted. See [MCP](mcp.md). |
| Compute and platform | Choose CPU and memory resources. Under **Platform**, use **auto** or a platform supported by the kit's image. See [Sandbox platforms](sandboxes.md#choose-a-platform). |
| Timer | Under **Run for**, choose 1 to 24 hours. Under **When the time is up**, choose **Stop**, **Delete**, or **Restart** if offered. See [Lifecycle actions](sandboxes.md#manage-the-lifecycle). |
@z

@x
The launcher remembers your policy selections from the previous launch in the
same browser. Policies marked **Always applied** are selected automatically.
Review the selected policies before launching. Selecting **Balanced** alongside
**Open** doesn't restrict Open's access; see [How policies combine](policies.md#how-policies-combine).
@y
The launcher remembers your policy selections from the previous launch in the
same browser. Policies marked **Always applied** are selected automatically.
Review the selected policies before launching. Selecting **Balanced** alongside
**Open** doesn't restrict Open's access; see [How policies combine](policies.md#how-policies-combine).
@z
