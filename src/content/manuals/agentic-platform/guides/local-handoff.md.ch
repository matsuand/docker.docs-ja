%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Continue local work in the cloud
linkTitle: Local-to-cloud handoff
description: Prepare a bounded agent task in a local sandbox, move its filesystem to the cloud, and retrieve the results.
keywords: docker agentic platform, cloud sandboxes, workflows, local-to-cloud handoff
@y
title: Continue local work in the cloud
linkTitle: Local-to-cloud handoff
description: Prepare a bounded agent task in a local sandbox, move its filesystem to the cloud, and retrieve the results.
keywords: docker agentic platform, cloud sandboxes, workflows, local-to-cloud handoff
@z

@x
Prepare a sample review locally, then let an agent finish it in the cloud while
your computer is disconnected. Retrieve the report before removing either
sandbox.
@y
Prepare a sample review locally, then let an agent finish it in the cloud while
your computer is disconnected. Retrieve the report before removing either
sandbox.
@z

@x
## Before you begin
@y
## Before you begin
@z

@x
You need the [CLI and a supported local runtime](/manuals/ai/sandboxes/install.md),
version 0.45.0 or later, an active
[Docker Agentic Platform subscription](/manuals/agentic-platform/signup.md#activate-cloud-access),
and an Anthropic API key for Claude Code in the cloud. You can use a Claude
subscription locally, but cloud sandboxes require an API key. This guide uses
an API key in both environments.
@y
You need the [CLI and a supported local runtime](manuals/ai/sandboxes/install.md),
version 0.45.0 or later, an active
[Docker Agentic Platform subscription](manuals/agentic-platform/signup.md#activate-cloud-access),
and an Anthropic API key for Claude Code in the cloud. You can use a Claude
subscription locally, but cloud sandboxes require an API key. This guide uses
an API key in both environments.
@z

@x
Docker bills cloud compute while the destination runs, even when disconnected.
Anthropic bills inference separately. The public sample needs no GitHub token.
Use the managed credential stores so keys stay out of the filesystem snapshot:
@y
Docker bills cloud compute while the destination runs, even when disconnected.
Anthropic bills inference separately. The public sample needs no GitHub token.
Use the managed credential stores so keys stay out of the filesystem snapshot:
@z

@x
```console
$ sbx login
$ sbx --cloud diagnose
$ sbx secret set anthropic
$ sbx --cloud secret set anthropic
```
@y
```console
$ sbx login
$ sbx --cloud diagnose
$ sbx secret set anthropic
$ sbx --cloud secret set anthropic
```
@z

@x
Local and cloud secret stores are separate. See
[Cloud credentials](/manuals/ai/sandboxes/cloud/credentials.md).
@y
Local and cloud secret stores are separate. See
[Cloud credentials](manuals/ai/sandboxes/cloud/credentials.md).
@z

@x
## Prepare files inside the local sandbox
@y
## Prepare files inside the local sandbox
@z

@x
On your computer, create a mountless sandbox by omitting the workspace argument.
Clone the project inside it so the files transfer to the cloud. Directories
mounted from your computer and clone-mode volumes are outside the sandbox
filesystem and aren't included in a move:
@y
On your computer, create a mountless sandbox by omitting the workspace argument.
Clone the project inside it so the files transfer to the cloud. Directories
mounted from your computer and clone-mode volumes are outside the sandbox
filesystem and aren't included in a move:
@z

@x
```console
$ sbx create --name handoff-local --cpus 2 --memory 4g claude
$ sbx policy allow network github.com:443 --sandbox handoff-local
$ sbx exec handoff-local git clone https://github.com/docker/welcome-to-docker.git /home/agent/workspace/project
$ sbx run --name handoff-local
```
@y
```console
$ sbx create --name handoff-local --cpus 2 --memory 4g claude
$ sbx policy allow network github.com:443 --sandbox handoff-local
$ sbx exec handoff-local git clone https://github.com/docker/welcome-to-docker.git /home/agent/workspace/project
$ sbx run --name handoff-local
```
@z

@x
Ask the local agent to prepare the task without carrying it out:
@y
Ask the local agent to prepare the task without carrying it out:
@z

@x
```text
Read /home/agent/workspace/project. Don't modify it or install dependencies.
Record the full git HEAD revision and confirm the working tree is clean.
Write /home/agent/workspace/HANDOFF.md with that baseline, the project path,
and this remaining task:
Review package.json and the Dockerfile. Explain the build and startup commands,
identify the application's listening port, and recommend one small improvement
with a source path and reason. Don't modify the application or install anything.
Save the review to /home/agent/workspace/review.md. Include the baseline revision,
files read, and limitations. Don't claim to have run the application.
Don't start this review yet.
```
@y
```text
Read /home/agent/workspace/project. Don't modify it or install dependencies.
Record the full git HEAD revision and confirm the working tree is clean.
Write /home/agent/workspace/HANDOFF.md with that baseline, the project path,
and this remaining task:
Review package.json and the Dockerfile. Explain the build and startup commands,
identify the application's listening port, and recommend one small improvement
with a source path and reason. Don't modify the application or install anything.
Save the review to /home/agent/workspace/review.md. Include the baseline revision,
files read, and limitations. Don't claim to have run the application.
Don't start this review yet.
```
@z

@x
Exit the local agent when preparation is complete. Before snapshotting, remove
any credentials saved in filesystem files, including interactive sign-in files.
Managed secrets aren't copied, but ordinary credential files are.
@y
Exit the local agent when preparation is complete. Before snapshotting, remove
any credentials saved in filesystem files, including interactive sign-in files.
Managed secrets aren't copied, but ordinary credential files are.
@z

@x
## Move the filesystem
@y
## Move the filesystem
@z

@x
From your computer, run:
@y
From your computer, run:
@z

@x
```console
$ sbx move handoff-local --to cloud --ttl 2h --on-timeout stop
```
@y
```console
$ sbx move handoff-local --to cloud --ttl 2h --on-timeout stop
```
@z

@x
The move stops the local source for capture and creates a separate destination.
Use its printed `sbx_`-prefixed ID in place of `<CLOUD_ID>`. The move also creates
a template: the filesystem image used to create the destination, including
`HANDOFF.md`. It remains after you remove the sandbox.
@y
The move stops the local source for capture and creates a separate destination.
Use its printed `sbx_`-prefixed ID in place of `<CLOUD_ID>`. The move also creates
a template: the filesystem image used to create the destination, including
`HANDOFF.md`. It remains after you remove the sandbox.
@z

@x
Cloud sandboxes support both `linux/amd64` and `linux/arm64`. The destination
matches your local sandbox's architecture; a move doesn't convert between them.
@y
Cloud sandboxes support both `linux/amd64` and `linux/arm64`. The destination
matches your local sandbox's architecture; a move doesn't convert between them.
@z

@x
The explicit timeout requests that the destination stop after two hours and
retain its files; the command
fails if stopping isn't supported. Don't substitute deletion without first
arranging to save your work.
@y
The explicit timeout requests that the destination stop after two hours and
retain its files; the command
fails if stopping isn't supported. Don't substitute deletion without first
arranging to save your work.
@z

@x
A move transfers a filesystem snapshot. Running processes, memory, open sockets,
workspace mounts, clone-mode volumes, and managed secrets don't transfer.
Local network rules don't transfer either. Published TCP sandbox ports can be
republished with cloud URLs; rejected ports produce warnings. See
[Move a sandbox](/manuals/ai/sandboxes/cloud/move.md) for transfer details.
@y
A move transfers a filesystem snapshot. Running processes, memory, open sockets,
workspace mounts, clone-mode volumes, and managed secrets don't transfer.
Local network rules don't transfer either. Published TCP sandbox ports can be
republished with cloud URLs; rejected ports produce warnings. See
[Move a sandbox](manuals/ai/sandboxes/cloud/move.md) for transfer details.
@z

@x
## Continue in the Console
@y
## Continue in the Console
@z

@x
Open the [Console](https://agentic-platform.docker.com) and sign in with the
same Docker account you used for the CLI. Open **Sandboxes** and select the
destination using the ID printed by the move. Use its browser terminal to
continue the task; the local agent process wasn't transferred.
@y
Open the [Console](https://agentic-platform.docker.com) and sign in with the
same Docker account you used for the CLI. Open **Sandboxes** and select the
destination using the ID printed by the move. Use its browser terminal to
continue the task; the local agent process wasn't transferred.
@z

@x
Before starting work, confirm the destination's architecture, compute size,
and expiration match your expectations. Check that your cloud Anthropic
credential is set. This task needs no published ports; remove any unintended
exposure. Verify the
[cloud network policy](/manuals/ai/sandboxes/cloud/network-policy.md) permits
the model provider; local network rules don't transfer.
@y
Before starting work, confirm the destination's architecture, compute size,
and expiration match your expectations. Check that your cloud Anthropic
credential is set. This task needs no published ports; remove any unintended
exposure. Verify the
[cloud network policy](manuals/ai/sandboxes/cloud/network-policy.md) permits
the model provider; local network rules don't transfer.
@z

@x
In an additional shell, check the transferred handoff:
@y
In an additional shell, check the transferred handoff:
@z

@x
```console
$ cat /home/agent/workspace/HANDOFF.md
```
@y
```console
$ cat /home/agent/workspace/HANDOFF.md
```
@z

@x
Expect the recorded baseline, project path, and remaining task. Return to the
agent's terminal to restart the work.
@y
Expect the recorded baseline, project path, and remaining task. Return to the
agent's terminal to restart the work.
@z

@x
Give it this prompt:
@y
Give it this prompt:
@z

@x
```text
Read /home/agent/workspace/HANDOFF.md. Confirm the baseline revision and clean
working tree before doing the remaining review. Stop and report a mismatch.
Complete only the recorded task and save /home/agent/workspace/review.md.
```
@y
```text
Read /home/agent/workspace/HANDOFF.md. Confirm the baseline revision and clean
working tree before doing the remaining review. Stop and report a mismatch.
Complete only the recorded task and save /home/agent/workspace/review.md.
```
@z

@x
## Disconnect and retrieve the result
@y
## Disconnect and retrieve the result
@z

@x
Once the agent starts, close the browser tab to disconnect. The cloud agent
can continue while your computer is disconnected. The timer still applies;
no further work runs after the sandbox stops until you resume it.
@y
Once the agent starts, close the browser tab to disconnect. The cloud agent
can continue while your computer is disconnected. The timer still applies;
no further work runs after the sandbox stops until you resume it.
@z

@x
Return to **Sandboxes** in the Console and reopen the destination. If it is
paused, select **Restore to connect**. Resuming starts a fresh timer. Review
the agent's response in the browser terminal.
@y
Return to **Sandboxes** in the Console and reopen the destination. If it is
paused, select **Restore to connect**. Resuming starts a fresh timer. Review
the agent's response in the browser terminal.
@z

@x
> [!TIP]
> If the terminal appears stuck after reconnecting, try resizing it by resizing
> your browser window. This can make the agent interface redraw.
@y
> [!TIP]
> If the terminal appears stuck after reconnecting, try resizing it by resizing
> your browser window. This can make the agent interface redraw.
@z

@x
When the report is ready, return to your computer's terminal and copy both files:
@y
When the report is ready, return to your computer's terminal and copy both files:
@z

@x
```console
$ sbx --cloud ttl <CLOUD_ID>
$ sbx --cloud cp <CLOUD_ID>:/home/agent/workspace/review.md ./review.md
$ sbx --cloud cp <CLOUD_ID>:/home/agent/workspace/HANDOFF.md ./HANDOFF.md
```
@y
```console
$ sbx --cloud ttl <CLOUD_ID>
$ sbx --cloud cp <CLOUD_ID>:/home/agent/workspace/review.md ./review.md
$ sbx --cloud cp <CLOUD_ID>:/home/agent/workspace/HANDOFF.md ./HANDOFF.md
```
@z

@x
Read the local copies. Expect the report to identify the recorded baseline,
explain the build and startup commands with file references, and state that the
application wasn't run. Compare it with the source rather than treating the
agent's claims as verified. Files don't synchronize after a move: copying these
results is what brings them back to your computer.
@y
Read the local copies. Expect the report to identify the recorded baseline,
explain the build and startup commands with file references, and state that the
application wasn't run. Compare it with the source rather than treating the
agent's claims as verified. Files don't synchronize after a move: copying these
results is what brings them back to your computer.
@z

@x
## Clean up both sandboxes
@y
## Clean up both sandboxes
@z

@x
After verifying your saved files, remove the destination, its template, and the
local source. First inspect the destination to identify its backing template,
then list the templates. Find the matching entry, typically named
`moved-handoff-local-<SUFFIX>`, and use its ID as `<TEMPLATE_ID>`. Check the ID
against the inspected sandbox so you remove only this move's snapshot:
@y
After verifying your saved files, remove the destination, its template, and the
local source. First inspect the destination to identify its backing template,
then list the templates. Find the matching entry, typically named
`moved-handoff-local-<SUFFIX>`, and use its ID as `<TEMPLATE_ID>`. Check the ID
against the inspected sandbox so you remove only this move's snapshot:
@z

@x
```console
$ sbx --cloud inspect <CLOUD_ID>
$ sbx --cloud template ls
```
@y
```console
$ sbx --cloud inspect <CLOUD_ID>
$ sbx --cloud template ls
```
@z

@x
Delete the cloud sandbox before removing its backing template:
@y
Delete the cloud sandbox before removing its backing template:
@z

@x
```console
$ sbx --cloud rm <CLOUD_ID>
$ sbx --cloud template rm <TEMPLATE_ID>
$ sbx rm handoff-local
$ sbx --cloud ls
$ sbx --cloud template ls
$ sbx ls
```
@y
```console
$ sbx --cloud rm <CLOUD_ID>
$ sbx --cloud template rm <TEMPLATE_ID>
$ sbx rm handoff-local
$ sbx --cloud ls
$ sbx --cloud template ls
$ sbx ls
```
@z

@x
Confirm both sandboxes and the template are absent. The template contains the
captured filesystem, so removing only the sandbox leaves that snapshot stored.
Removal deletes files stored only in those resources.
If retaining the cloud destination instead, stop it and confirm its state with
`sbx --cloud ls` to stop compute charges. Check the expiration again after any
resume. See [Stop or remove a sandbox](/manuals/ai/sandboxes/cloud/usage.md#stop-or-remove-a-sandbox).
@y
Confirm both sandboxes and the template are absent. The template contains the
captured filesystem, so removing only the sandbox leaves that snapshot stored.
Removal deletes files stored only in those resources.
If retaining the cloud destination instead, stop it and confirm its state with
`sbx --cloud ls` to stop compute charges. Check the expiration again after any
resume. See [Stop or remove a sandbox](manuals/ai/sandboxes/cloud/usage.md#stop-or-remove-a-sandbox).
@z
