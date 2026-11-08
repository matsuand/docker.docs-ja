%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Core concepts
@y
title: Core concepts
@z

@x
description: Learn about Docker Offload, its features, and how it works.
keywords: cloud, offload, vdi, cloud sandbox
@y
description: Learn about Docker Offload, its features, and how it works.
keywords: cloud, offload, vdi, cloud sandbox
@z

@x
{{< summary-bar feature_name="Docker Offload" >}}
@y
{{< summary-bar feature_name="Docker Offload" >}}
@z

@x
Docker Offload replaces the need to build or run containers locally by
connecting Docker Desktop to a cloud sandbox running its own Docker daemon.
@y
Docker Offload replaces the need to build or run containers locally by
connecting Docker Desktop to a cloud sandbox running its own Docker daemon.
@z

@x
When you run `docker offload create` or `docker --cloud <command>`:
@y
When you run `docker offload create` or `docker --cloud <command>`:
@z

@x
1. Docker Offload provisions a cloud sandbox for your account.
2. Docker Desktop opens a secure tunnel to the Docker daemon in that sandbox.
3. Your Docker context switches to `docker-cloud`, so Docker commands run in the
   sandbox.
4. Builds and containers run on cloud hardware, and their output streams to
   your terminal.
@y
1. Docker Offload provisions a cloud sandbox for your account.
2. Docker Desktop opens a secure tunnel to the Docker daemon in that sandbox.
3. Your Docker context switches to `docker-cloud`, so Docker commands run in the
   sandbox.
4. Builds and containers run on cloud hardware, and their output streams to
   your terminal.
@z

@x
Docker commands no longer reach your local daemon while your context is
`docker-cloud`. To run one against it, pass your local context with
`--context`. For more information, see [Manage
sandboxes](sandboxes.md#work-with-local-and-cloud-containers).
@y
Docker commands no longer reach your local daemon while your context is
`docker-cloud`. To run one against it, pass your local context with
`--context`. For more information, see [Manage
sandboxes](sandboxes.md#work-with-local-and-cloud-containers).
@z

@x
## Relationship to Docker Sandboxes
@y
## Relationship to Docker Sandboxes
@z

@x
Docker Offload runs on the same cloud infrastructure as [cloud
sandboxes](/manuals/ai/sandboxes/cloud/_index.md) in Docker Agentic Platform.
@y
Docker Offload runs on the same cloud infrastructure as [cloud
sandboxes](manuals/ai/sandboxes/cloud/_index.md) in Docker Agentic Platform.
@z

@x
A sandbox that Docker Offload creates belongs to your account and appears in
the Docker Agentic Platform Console with a name that starts with `offload-`.
@y
A sandbox that Docker Offload creates belongs to your account and appears in
the Docker Agentic Platform Console with a name that starts with `offload-`.
@z

@x
## Cloud resources
@y
## Cloud resources
@z

@x
You can choose the size of a sandbox when Docker Offload creates it, using
`--cpus` and `--memory`. For the available sizes, see [Choose the size of a new
cloud sandbox](sandboxes.md#choose-the-size-of-a-new-cloud-sandbox).
@y
You can choose the size of a sandbox when Docker Offload creates it, using
`--cpus` and `--memory`. For the available sizes, see [Choose the size of a new
cloud sandbox](sandboxes.md#choose-the-size-of-a-new-cloud-sandbox).
@z

@x
The default is 4 vCPUs and 8 GiB of memory.
@y
The default is 4 vCPUs and 8 GiB of memory.
@z

@x
## Session lifecycle
@y
## Session lifecycle
@z

@x
A Docker Offload sandbox moves between a running state and a paused state.
@y
A Docker Offload sandbox moves between a running state and a paused state.
@z

@x
- Running: The sandbox is connected and billable. Builds and containers execute
  on cloud hardware.
- Paused: The sandbox is suspended and isn't billed. Its containers, images,
  and volumes are preserved.
@y
- Running: The sandbox is connected and billable. Builds and containers execute
  on cloud hardware.
- Paused: The sandbox is suspended and isn't billed. Its containers, images,
  and volumes are preserved.
@z

@x
Your sandbox pauses when you run `docker offload stop`, or automatically after
a period without activity. By default, that period is 5 minutes. Docker Offload
takes a short time to notice that a sandbox has gone quiet, so an automatic
pause begins a little after the timeout rather than exactly on it. Pausing
itself takes several minutes to complete.
@y
Your sandbox pauses when you run `docker offload stop`, or automatically after
a period without activity. By default, that period is 5 minutes. Docker Offload
takes a short time to notice that a sandbox has gone quiet, so an automatic
pause begins a little after the timeout rather than exactly on it. Pausing
itself takes several minutes to complete.
@z

@x
You don't resume a sandbox explicitly. Running a command that needs the sandbox
or one of its containers resumes it. Resuming restores the sandbox's exact
previous state: containers that were running resume, data written to volumes
and container filesystems is still there, and build logs from an earlier
session remain available. For which commands resume a sandbox and what's
unavailable while it's paused, see [Resume a
sandbox](sandboxes.md#resume-a-sandbox).
@y
You don't resume a sandbox explicitly. Running a command that needs the sandbox
or one of its containers resumes it. Resuming restores the sandbox's exact
previous state: containers that were running resume, data written to volumes
and container filesystems is still there, and build logs from an earlier
session remain available. For which commands resume a sandbox and what's
unavailable while it's paused, see [Resume a
sandbox](sandboxes.md#resume-a-sandbox).
@z

@x
Two separate timers govern the sandbox, because idle detection runs on the
machine that's connected to it:
@y
Two separate timers govern the sandbox, because idle detection runs on the
machine that's connected to it:
@z

@x
- The idle timeout pauses the sandbox when your machine is awake but you're not
  running anything. You can change it with `--idle-timeout`, or turn it off
  with `--keep-alive`.
- The time to live applies when no machine is connected, such as when your
  machine sleeps or goes offline. Docker Offload keeps renewing it while a
  machine is connected.
@y
- The idle timeout pauses the sandbox when your machine is awake but you're not
  running anything. You can change it with `--idle-timeout`, or turn it off
  with `--keep-alive`.
- The time to live applies when no machine is connected, such as when your
  machine sleeps or goes offline. Docker Offload keeps renewing it while a
  machine is connected.
@z

@x
For how to set both, see [Control when your sandbox
pauses](sandboxes.md#control-when-your-cloud-sandbox-pauses).
@y
For how to set both, see [Control when your sandbox
pauses](sandboxes.md#control-when-your-cloud-sandbox-pauses).
@z

@x
## Working from more than one machine
@y
## Working from more than one machine
@z

@x
You can connect to the same sandbox from more than one machine. A second
`docker offload create` connects to your existing sandbox rather than creating
another one, so both machines report the same sandbox ID.
@y
You can connect to the same sandbox from more than one machine. A second
`docker offload create` connects to your existing sandbox rather than creating
another one, so both machines report the same sandbox ID.
@z

@x
Each connection keeps its own session timer and its own idle detection, so the
two machines can report different times until idle. For more information, see
[Connect from more than one
machine](sandboxes.md#connect-from-more-than-one-machine).
@y
Each connection keeps its own session timer and its own idle detection, so the
two machines can report different times until idle. For more information, see
[Connect from more than one
machine](sandboxes.md#connect-from-more-than-one-machine).
@z

@x
## Comparison with Docker Offload v1
@y
## Comparison with Docker Offload v1
@z

@x
| | Docker Offload | [Docker Offload v1](v1/_index.md) |
| --- | --- | --- |
| Subscription | Docker Agentic Platform, purchased by individual developers | Docker Offload, purchased by an organization and a Teams or Business subscription. |
| Start with | `docker --cloud <command>` or `docker offload create` | `docker offload start`, or the Dashboard toggle |
| On stop | Sandbox pauses and keeps its state | Environment is terminated and its contents are deleted |
| Multiple machines | Connect to the same sandbox from more than one machine | One session per user at a time |
| Billing | Metered for the time the sandbox runs | Covered by the organization's subscription, subject to fair use |
@y
| | Docker Offload | [Docker Offload v1](v1/_index.md) |
| --- | --- | --- |
| Subscription | Docker Agentic Platform, purchased by individual developers | Docker Offload, purchased by an organization and a Teams or Business subscription. |
| Start with | `docker --cloud <command>` or `docker offload create` | `docker offload start`, or the Dashboard toggle |
| On stop | Sandbox pauses and keeps its state | Environment is terminated and its contents are deleted |
| Multiple machines | Connect to the same sandbox from more than one machine | One session per user at a time |
| Billing | Metered for the time the sandbox runs | Covered by the organization's subscription, subject to fair use |
@z

@x
Both versions use the `docker-cloud` Docker context, so scripts and tooling
that reference it by name keep working.
@y
Both versions use the `docker-cloud` Docker context, so scripts and tooling
that reference it by name keep working.
@z

@x
## What's next
@y
## What's next
@z

@x
Get hands-on with Docker Offload by following the [Docker Offload
quickstart](quickstart.md).
@y
Get hands-on with Docker Offload by following the [Docker Offload
quickstart](quickstart.md).
@z

@x
For the commands you use day to day, see [Manage
sandboxes](sandboxes.md).
@y
For the commands you use day to day, see [Manage
sandboxes](sandboxes.md).
@z
