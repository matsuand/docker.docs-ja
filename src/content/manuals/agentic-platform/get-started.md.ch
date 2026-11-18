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
Both paths introduce the same cloud sandbox lifecycle: launch an environment,
run a task, save work, and pause or delete it. Complete either path in your
browser, then use the [guides](guides/_index.md) for sharing, remote development,
or moving local work to the cloud.
@y
Both paths introduce the same cloud sandbox lifecycle: launch an environment,
run a task, save work, and pause or delete it. Complete either path in your
browser, then use the [guides](guides/_index.md) for sharing, remote development,
or moving local work to the cloud.
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
Review the compute price and timer before launching. Choose **Stop** as the
timeout action to keep files. Compute is billed while the sandbox runs;
closing the browser doesn't stop it.
@y
Both workflows use a public sample project, so you don't need a GitHub token.
Review the compute price and timer before launching. Choose **Stop** as the
timeout action to keep files. Compute is billed while the sandbox runs;
closing the browser doesn't stop it.
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
Continue to [keep your work](#keep-your-work).
@y
Continue to [keep your work](#keep-your-work).
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
   GitHub, Docker Hub, and npm. Deselect **Open** if selected: combining it
   with Balanced doesn't restrict Open's access. Review the compute price and
   timer, choose **Stop** as the timeout action, and select **Run**.
@y
1. Open [Docker Agentic Platform](https://agentic-platform.docker.com/) and
   select **+ New sandbox**.
2. Open the kit picker and choose **shell**.
3. If saved secrets or a GitHub token are selected, deselect them for this
   walkthrough. You don't need MCP tools either.
4. In the network policy picker, select **Balanced** to permit access to
   GitHub, Docker Hub, and npm. Deselect **Open** if selected: combining it
   with Balanced doesn't restrict Open's access. Review the compute price and
   timer, choose **Stop** as the timeout action, and select **Run**.
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
The generated URL is public, and Docker account authentication doesn't protect
it. Use only non-sensitive data. Close the port in **Connect** when you've
finished previewing, then reload the URL to confirm access is withdrawn.
For a complete sharing workflow, including checking access from a separate
browser session, follow [Share an application](guides/share-app.md).
@y
The generated URL is public, and Docker account authentication doesn't protect
it. Use only non-sensitive data. Close the port in **Connect** when you've
finished previewing, then reload the URL to confirm access is withdrawn.
For a complete sharing workflow, including checking access from a separate
browser session, follow [Share an application](guides/share-app.md).
@z

@x
Continue to [keep your work](#keep-your-work).
@y
Continue to [keep your work](#keep-your-work).
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
## Pause, keep running, or delete the sandbox
@y
## Pause, keep running, or delete the sandbox
@z

@x
Closing the browser leaves the sandbox running.
Commands and background processes can continue until you pause or delete the
sandbox, or its timer expires. Compute is billed while the sandbox runs, even
when no commands are running.
@y
Closing the browser leaves the sandbox running.
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
@y
For more detail, see [Lifecycle actions](sandboxes.md#manage-the-lifecycle).
@z

@x
## Sandbox options
@y
## Sandbox options
@z

@x
For launch settings, see [Kits](kits.md), [Secrets](secrets.md),
[Network policies](policies.md), and [MCP tools](mcp.md). For compute platforms
and timer actions, see [Sandboxes](sandboxes.md). Choose these settings before
launching: credentials, tools, network policies, and compute size can't be
changed afterward.
@y
For launch settings, see [Kits](kits.md), [Secrets](secrets.md),
[Network policies](policies.md), and [MCP tools](mcp.md). For compute platforms
and timer actions, see [Sandboxes](sandboxes.md). Choose these settings before
launching: credentials, tools, network policies, and compute size can't be
changed afterward.
@z

@x
## Next steps
@y
## Next steps
@z

@x
To run a task from your own terminal, follow the
[cloud CLI walkthrough](/manuals/ai/sandboxes/cloud/_index.md#get-started).
For programmatic workflows, see the
[Sandboxes API quickstart](/manuals/ai/sandboxes-api/get-started.md).
@y
To run a task from your own terminal, follow the
[cloud CLI walkthrough](manuals/ai/sandboxes/cloud/_index.md#get-started).
For programmatic workflows, see the
[Sandboxes API quickstart](manuals/ai/sandboxes-api/get-started.md).
@z

@x
Continue with a targeted workflow:
@y
Continue with a targeted workflow:
@z

@x
- [Share an application](guides/share-app.md) through a public URL.
- [Develop remotely](guides/remote-development.md) with VS Code or Cursor.
- [Continue local work in the cloud](guides/local-handoff.md) and retrieve the results.
@y
- [Share an application](guides/share-app.md) through a public URL.
- [Develop remotely](guides/remote-development.md) with VS Code or Cursor.
- [Continue local work in the cloud](guides/local-handoff.md) and retrieve the results.
@z
