%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Sandboxes
description: Create and manage cloud sandboxes in Docker Agentic Platform.
keywords: docker agentic platform, sandboxes, agents, cloud runtime, terminal, compute
@y
title: Sandboxes
description: Create and manage cloud sandboxes in Docker Agentic Platform.
keywords: docker agentic platform, sandboxes, agents, cloud runtime, terminal, compute
@z

@x
A sandbox is an isolated environment for running agents and tools in the cloud.
You can work with your agent through a terminal in the Console.
@y
A sandbox is an isolated environment for running agents and tools in the cloud.
You can work with your agent through a terminal in the Console.
@z

@x
The [kit](kits.md) you select determines the sandbox's base image, agent, and
installed tools. Each sandbox has its own filesystem, network settings, and
terminal. Choose a compute size to set how much CPU and
memory your sandbox has. Check your kit for installed tools such as Docker
Engine. For example, the Hermes kit doesn't include it.
@y
The [kit](kits.md) you select determines the sandbox's base image, agent, and
installed tools. Each sandbox has its own filesystem, network settings, and
terminal. Choose a compute size to set how much CPU and
memory your sandbox has. Check your kit for installed tools such as Docker
Engine. For example, the Hermes kit doesn't include it.
@z

@x
The Shell kit opens a Bash shell without a pre-installed agent. It uses the
same environment as [`sbx run shell`](/manuals/ai/sandboxes/agents/shell.md)
and is useful for working manually or installing your own agent.
@y
The Shell kit opens a Bash shell without a pre-installed agent. It uses the
same environment as [`sbx run shell`](manuals/ai/sandboxes/agents/shell.md)
and is useful for working manually or installing your own agent.
@z

@x
Your sandbox keeps running when you leave the Console. It runs until you pause
or delete it. When its timer expires, it performs the action you selected.
@y
Your sandbox keeps running when you leave the Console. It runs until you pause
or delete it. When its timer expires, it performs the action you selected.
@z

@x
## Choose a platform
@y
## Choose a platform
@z

@x
In the compute picker, under **Platform**, choose **auto**, **linux/amd64**
(Intel/AMD), or **linux/arm64** (Arm). The default, **auto**, uses the platform
provided by the kit's image. An explicit platform choice requires the image
to support that platform; otherwise, creation fails.
@y
In the compute picker, under **Platform**, choose **auto**, **linux/amd64**
(Intel/AMD), or **linux/arm64** (Arm). The default, **auto**, uses the platform
provided by the kit's image. An explicit platform choice requires the image
to support that platform; otherwise, creation fails.
@z

@x
## Source code and files
@y
## Source code and files
@z

@x
Each sandbox starts with a fresh filesystem. Your local repositories,
directories, and workspaces aren't mounted in it by default.
@y
Each sandbox starts with a fresh filesystem. Your local repositories,
directories, and workspaces aren't mounted in it by default.
@z

@x
Files don't sync automatically with your computer or a remote repository.
Commit and push any work you want to keep before deleting the sandbox. Files
left only in a deleted sandbox won't be available in a later sandbox.
@y
Files don't sync automatically with your computer or a remote repository.
Commit and push any work you want to keep before deleting the sandbox. Files
left only in a deleted sandbox won't be available in a later sandbox.
@z

@x
Use GitHub to clone source code into your sandbox and save changes remotely.
To clone a private repository or push changes, use the **GitHub token**
control in the launcher. Copilot uses this token for both the agent and GitHub
repository access. A custom kit must declare a GitHub credential to offer this
option.
Make sure your token has the required repository permissions. You can clone
public repositories without a token, but pushing to them still requires
authentication.
@y
Use GitHub to clone source code into your sandbox and save changes remotely.
To clone a private repository or push changes, use the **GitHub token**
control in the launcher. Copilot uses this token for both the agent and GitHub
repository access. A custom kit must declare a GitHub credential to offer this
option.
Make sure your token has the required repository permissions. You can clone
public repositories without a token, but pushing to them still requires
authentication.
@z

@x
## Open a sandbox
@y
## Open a sandbox
@z

@x
After you select **Run**, the Console shows provisioning progress. When the
sandbox is ready, its detail page opens. Use the terminal to work with your
agent or shell. Reloading the launch page resumes tracking the launch.
@y
After you select **Run**, the Console shows provisioning progress. When the
sandbox is ready, its detail page opens. Use the terminal to work with your
agent or shell. Reloading the launch page resumes tracking the launch.
@z

@x
Open **Sandboxes** to review each sandbox's name, type, status, hourly rate,
expiration, and age. Select a sandbox to reopen its detail page and terminal.
@y
Open **Sandboxes** to review each sandbox's name, type, status, hourly rate,
expiration, and age. Select a sandbox to reopen its detail page and terminal.
@z

@x
The **New** page also lists **Recent sandboxes**. Select a sandbox to reopen it,
or select **See all sandboxes** to open the full list.
@y
The **New** page also lists **Recent sandboxes**. Select a sandbox to reopen it,
or select **See all sandboxes** to open the full list.
@z

@x
In a Claude Code sandbox, paste an image from your clipboard or drag an image
file onto the terminal to attach it to your prompt. Wait for the upload to
finish, type your question, and press Enter to send it.
@y
In a Claude Code sandbox, paste an image from your clipboard or drag an image
file onto the terminal to attach it to your prompt. Wait for the upload to
finish, type your question, and press Enter to send it.
@z

@x
## Open additional shells
@y
## Open additional shells
@z

@x
Use the **+** button in the terminal tab bar to open another shell in the same
sandbox. Switch tabs to work with multiple shells. The agent remains in its
own tab while you run commands in another.
@y
Use the **+** button in the terminal tab bar to open another shell in the same
sandbox. Switch tabs to work with multiple shells. The agent remains in its
own tab while you run commands in another.
@z

@x
## Connect from your computer
@y
## Connect from your computer
@z

@x
If the sandbox detail page shows **Connect**, open it to find SSH connection
options. The panel includes a Docker Sandboxes CLI option and a connect script.
For the script, manage your public SSH key under **Settings**. Follow the
instructions in the panel for your chosen connection method.
@y
If the sandbox detail page shows **Connect**, open it to find SSH connection
options. The panel includes a Docker Sandboxes CLI option and a connect script.
For the script, manage your public SSH key under **Settings**. Follow the
instructions in the panel for your chosen connection method.
@z

@x
### Access a service by port
@y
### Access a service by port
@z

@x
To access a web application or development server running in your sandbox:
@y
To access a web application or development server running in your sandbox:
@z

@x
1. Start the service in the sandbox and note its port.
2. Open **Connect** and find **Connect via a Port**.
3. Enter the port and select **Open Port**.
4. Copy the public URL to access the service.
@y
1. Start the service in the sandbox and note its port.
2. Open **Connect** and find **Connect via a Port**.
3. Enter the port and select **Open Port**.
4. Copy the public URL to access the service.
@z

@x
The sandbox must be running. Port 2222 is reserved for SSH and can't be
published through this control. To stop exposing a service, use the close
action next to its port.
@y
The sandbox must be running. Port 2222 is reserved for SSH and can't be
published through this control. To stop exposing a service, use the close
action next to its port.
@z

@x
## Pause, resume, or delete a sandbox {#manage-the-lifecycle}
@y
## Pause, resume, or delete a sandbox {#manage-the-lifecycle}
@z

@x
A sandbox can be running or paused:
@y
A sandbox can be running or paused:
@z

@x
- Pause a running sandbox to stop it without deleting its files.
- Resume a paused sandbox to continue working with it. Resuming starts a fresh
  timer with the original duration.
- Delete a sandbox when you no longer need it.
@y
- Pause a running sandbox to stop it without deleting its files.
- Resume a paused sandbox to continue working with it. Resuming starts a fresh
  timer with the original duration.
- Delete a sandbox when you no longer need it.
@z

@x
When you create a sandbox, set a timer from 1 to 24 hours and choose
what happens when it expires. **Stop** stops the sandbox, while **Delete**
deletes the sandbox and its files. If **Restart** is offered, select it to
restart the sandbox automatically when the timer expires. When a sandbox stops,
all processes inside it stop too, including background processes.
@y
When you create a sandbox, set a timer from 1 to 24 hours and choose
what happens when it expires. **Stop** stops the sandbox, while **Delete**
deletes the sandbox and its files. If **Restart** is offered, select it to
restart the sandbox automatically when the timer expires. When a sandbox stops,
all processes inside it stop too, including background processes.
@z

@x
After launch, you can't change the selected credentials, tools, network
policies, or compute size.
@y
After launch, you can't change the selected credentials, tools, network
policies, or compute size.
@z

@x
You pay for compute by the second while your sandbox runs. Your model provider
bills inference separately. For account, usage, and payment information, see
[Docker Billing](/subscription-billing/).
@y
You pay for compute by the second while your sandbox runs. Your model provider
bills inference separately. For account, usage, and payment information, see
[Docker Billing](__SUBDIR__/subscription-billing/).
@z

@x
## Account quotas
@y
## Account quotas
@z

@x
The following default quotas apply across your cloud sandbox account, whether
resources are created through the Console, CLI, or API:
@y
The following default quotas apply across your cloud sandbox account, whether
resources are created through the Console, CLI, or API:
@z

@x
| Resource | Default limit |
| --- | ---: |
| Concurrent sandboxes | 10 |
| Stored sandboxes | 50 |
| Volumes | 100 |
| Secrets | 100 |
| Images being prepared at the same time | 3 |
@y
| Resource | Default limit |
| --- | ---: |
| Concurrent sandboxes | 10 |
| Stored sandboxes | 50 |
| Volumes | 100 |
| Secrets | 100 |
| Images being prepared at the same time | 3 |
@z

@x
Your account can have different quotas. Confirm your account's limits with
Docker before planning a workload that depends on a particular allowance.
@y
Your account can have different quotas. Confirm your account's limits with
Docker before planning a workload that depends on a particular allowance.
@z

@x
Stopping an ordinary sandbox releases its concurrency slot, but the sandbox
still counts toward stored usage. Resuming it needs a concurrency slot. An
always-on sandbox retains its concurrency reservation while stopped. Delete
sandboxes you no longer need to release stored usage.
@y
Stopping an ordinary sandbox releases its concurrency slot, but the sandbox
still counts toward stored usage. Resuming it needs a concurrency slot. An
always-on sandbox retains its concurrency reservation while stopped. Delete
sandboxes you no longer need to release stored usage.
@z

@x
If the Console reports a running sandbox limit, stop or delete a sandbox
before trying again. If it reports a sandbox storage limit, delete a sandbox;
stopping it doesn't free a stored-sandbox slot.
@y
If the Console reports a running sandbox limit, stop or delete a sandbox
before trying again. If it reports a sandbox storage limit, delete a sandbox;
stopping it doesn't free a stored-sandbox slot.
@z

@x
## Check sandbox configuration
@y
## Check sandbox configuration
@z

@x
If your agent cannot reach a service or use a tool:
@y
If your agent cannot reach a service or use a tool:
@z

@x
- Check that the network policies allow access to the service.
- If the sandbox needs an MCP tool, confirm that its server is connected and
  authorized.
- If the service requires authentication, check that its credential was
  included when you created the sandbox.
@y
- Check that the network policies allow access to the service.
- If the sandbox needs an MCP tool, confirm that its server is connected and
  authorized.
- If the service requires authentication, check that its credential was
  included when you created the sandbox.
@z
