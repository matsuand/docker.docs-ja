%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Docker Offload quickstart
linktitle: Quickstart
@y
title: Docker Offload quickstart
linktitle: Quickstart
@z

@x
description: Learn how to use Docker Offload to build and run your container images in the cloud.
keywords: cloud, quickstart, Docker Desktop, offload
@y
description: Learn how to use Docker Offload to build and run your container images in the cloud.
keywords: cloud, quickstart, Docker Desktop, offload
@z

@x
{{< summary-bar feature_name="Docker Offload" >}}
@y
{{< summary-bar feature_name="Docker Offload" >}}
@z

@x
This quickstart covers the steps developers need to get started with Docker
Offload.
@y
This quickstart covers the steps developers need to get started with Docker
Offload.
@z

@x
It describes Docker Offload usage with `docker offload create` and
`docker --cloud`, which requires a Docker Agentic Platform subscription. If you
start Offload with `docker offload start` or the toggle in the Docker Desktop
Dashboard header, see [Docker Offload v1](/manuals/offload/v1/_index.md).
@y
It describes Docker Offload usage with `docker offload create` and
`docker --cloud`, which requires a Docker Agentic Platform subscription. If you
start Offload with `docker offload start` or the toggle in the Docker Desktop
Dashboard header, see [Docker Offload v1](manuals/offload/v1/_index.md).
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- [Docker Desktop](/desktop/) 4.97 or later. Docker recommends using the latest
  version to access the newest features and improvements in Docker Offload.
- A Docker Agentic Platform subscription. To subscribe, see [Signup and
  billing](/manuals/agentic-platform/signup.md).
@y
- [Docker Desktop](__SUBDIR__/desktop/) 4.97 or later. Docker recommends using the latest
  version to access the newest features and improvements in Docker Offload.
- A Docker Agentic Platform subscription. To subscribe, see [Signup and
  billing](manuals/agentic-platform/signup.md).
@z

@x
## Step 1: Create a cloud sandbox
@y
## Step 1: Create a cloud sandbox
@z

@x
Run the following command to create a sandbox and connect Docker to it:
@y
Run the following command to create a sandbox and connect Docker to it:
@z

@x
```console
$ docker offload create
```
@y
```console
$ docker offload create
```
@z

@x
Docker Offload creates a cloud sandbox and switches your Docker context to
`docker-cloud`. From this point, `docker` commands run in the cloud sandbox instead of
on your local machine.
@y
Docker Offload creates a cloud sandbox and switches your Docker context to
`docker-cloud`. From this point, `docker` commands run in the cloud sandbox instead of
on your local machine.
@z

@x
To confirm which context is selected:
@y
To confirm which context is selected:
@z

@x
```console
$ docker context ls
```
@y
```console
$ docker context ls
```
@z

@x
## Step 2: Run a container
@y
## Step 2: Run a container
@z

@x
Run a container to verify that Docker Offload is working:
@y
Run a container to verify that Docker Offload is working:
@z

@x
```console
$ docker run --rm hello-world
```
@y
```console
$ docker run --rm hello-world
```
@z

@x
The container runs in the cloud sandbox, and its output is streamed to your
terminal. If Docker Offload is working, you see `Hello from Docker!` in the
output.
@y
The container runs in the cloud sandbox, and its output is streamed to your
terminal. If Docker Offload is working, you see `Hello from Docker!` in the
output.
@z

@x
You can also send a single command to the sandbox without running `docker offload create` first.
The `--cloud` flag runs that command in the cloud and leaves your context
unchanged:
@y
You can also send a single command to the sandbox without running `docker offload create` first.
The `--cloud` flag runs that command in the cloud and leaves your context
unchanged:
@z

@x
```console
$ docker --cloud build .
$ docker --cloud run --rm hello-world
```
@y
```console
$ docker --cloud build .
$ docker --cloud run --rm hello-world
```
@z

@x
If you don't already have a sandbox, `docker --cloud` creates one.
@y
If you don't already have a sandbox, `docker --cloud` creates one.
@z

@x
> [!IMPORTANT]
>
> `--cloud` is a global flag, so it goes before the subcommand. Passing it
> after, as in `docker run --cloud hello-world`, fails with
> `unknown flag: --cloud`.
@y
> [!IMPORTANT]
>
> `--cloud` is a global flag, so it goes before the subcommand. Passing it
> after, as in `docker run --cloud hello-world`, fails with
> `unknown flag: --cloud`.
@z

@x
## Step 3: Check your sandbox
@y
## Step 3: Check your sandbox
@z

@x
You can view your sandbox, including its hourly price, in the [Docker
Agentic Platform Console](https://agentic-platform.docker.com/), where its name
starts with `offload-`.
@y
You can view your sandbox, including its hourly price, in the [Docker
Agentic Platform Console](https://agentic-platform.docker.com/), where its name
starts with `offload-`.
@z

@x
You use one Docker Offload sandbox per account at a time. If you run `docker
offload create` while a sandbox exists, Docker Offload connects you to that
sandbox instead of creating a second one. This is how you work from more than
one machine.
@y
You use one Docker Offload sandbox per account at a time. If you run `docker
offload create` while a sandbox exists, Docker Offload connects you to that
sandbox instead of creating a second one. This is how you work from more than
one machine.
@z

@x
To check the state of your sandbox and your connection to it:
@y
To check the state of your sandbox and your connection to it:
@z

@x
```console
$ docker offload status
@y
```console
$ docker offload status
@z

@x
  Account: <your-account>
@y
  Account: <your-account>
@z

@x
  Sandbox
    ID: sbx_001m49455jm42x4v6epbg8kd5fy
    State: Running
    Created: 4 minutes ago
@y
  Sandbox
    ID: sbx_001m49455jm42x4v6epbg8kd5fy
    State: Running
    Created: 4 minutes ago
@z

@x
  This machine
    State: Started (Active)
    Session started: 4 minutes ago
    Idle detection: on (5m)
    Kept awake by: checking activity
```
@y
  This machine
    State: Started (Active)
    Session started: 4 minutes ago
    Idle detection: on (5m)
    Kept awake by: checking activity
```
@z

@x
The output separates the sandbox, which every machine on your account shares,
from this machine's connection to it. For what each field means, see [Check the
status of your cloud
sandbox](sandboxes.md#check-the-status-of-your-cloud-sandbox).
@y
The output separates the sandbox, which every machine on your account shares,
from this machine's connection to it. For what each field means, see [Check the
status of your cloud
sandbox](sandboxes.md#check-the-status-of-your-cloud-sandbox).
@z

@x
## Step 4: Reach your local containers
@y
## Step 4: Reach your local containers
@z

@x
Creating a sandbox doesn't stop your local containers, but it does change which
containers Docker commands apply to. While your context is `docker-cloud`:
@y
Creating a sandbox doesn't stop your local containers, but it does change which
containers Docker commands apply to. While your context is `docker-cloud`:
@z

@x
- `docker ps -a` lists containers in the sandbox, not your local containers.
- Ports published by your local containers aren't reachable through the
  `docker-cloud` context.
@y
- `docker ps -a` lists containers in the sandbox, not your local containers.
- Ports published by your local containers aren't reachable through the
  `docker-cloud` context.
@z

@x
To work with your local containers without leaving Docker Offload, pass the
local context explicitly:
@y
To work with your local containers without leaving Docker Offload, pass the
local context explicitly:
@z

@x
```console
$ docker --context desktop-linux ps -a
```
@y
```console
$ docker --context desktop-linux ps -a
```
@z

@x
Ports published by containers in the sandbox are forwarded to your machine, so
you reach them the same way you reach a local container's ports. For more
information, see [Ports and files](sandboxes.md#ports-and-files).
@y
Ports published by containers in the sandbox are forwarded to your machine, so
you reach them the same way you reach a local container's ports. For more
information, see [Ports and files](sandboxes.md#ports-and-files).
@z

@x
## Step 5: Stop Docker Offload
@y
## Step 5: Stop Docker Offload
@z

@x
When you finish, stop Docker Offload:
@y
When you finish, stop Docker Offload:
@z

@x
```console
$ docker offload stop
```
@y
```console
$ docker offload stop
```
@z

@x
Your Docker context switches back to your previous context immediately, and the
sandbox pauses in the background. Your local containers and their published
ports are available again.
@y
Your Docker context switches back to your previous context immediately, and the
sandbox pauses in the background. Your local containers and their published
ports are available again.
@z

@x
Stopping doesn't discard your work. The sandbox keeps
its containers, images, and volumes, so you can resume where you left off. For
what's preserved and how billing stops, see [Manage
sandboxes](sandboxes.md).
@y
Stopping doesn't discard your work. The sandbox keeps
its containers, images, and volumes, so you can resume where you left off. For
what's preserved and how billing stops, see [Manage
sandboxes](sandboxes.md).
@z

@x
If you forget to stop it, your sandbox pauses on its own after 5 minutes
without activity. To change that period or turn it off, see [Control when your
sandbox pauses](sandboxes.md#control-when-your-cloud-sandbox-pauses).
@y
If you forget to stop it, your sandbox pauses on its own after 5 minutes
without activity. To change that period or turn it off, see [Control when your
sandbox pauses](sandboxes.md#control-when-your-cloud-sandbox-pauses).
@z

@x
To pick up where you left off, run a command that needs the sandbox, such as
`docker start` or `docker run`. That resumes it. 
@y
To pick up where you left off, run a command that needs the sandbox, such as
`docker start` or `docker run`. That resumes it. 
@z

@x
## Step 6: Delete your cloud sandbox
@y
## Step 6: Delete your cloud sandbox
@z

@x
To delete the sandbox and
everything on it, run:
@y
To delete the sandbox and
everything on it, run:
@z

@x
```console
$ docker offload rm
```
@y
```console
$ docker offload rm
```
@z

@x
The sandbox is removed from the Docker Agentic Platform console as well.
@y
The sandbox is removed from the Docker Agentic Platform console as well.
@z

@x
## What's next
@y
## What's next
@z

@x
- [Explore the Docker Offload CLI reference](/reference/cli/docker/offload/).
- [Learn how Docker Offload works](core-concepts.md)
- [Manage your sandbox](sandboxes.md), including resuming and deleting it
- [Optimize your Docker Offload usage](optimize.md)
@y
- [Explore the Docker Offload CLI reference](__SUBDIR__/reference/cli/docker/offload/).
- [Learn how Docker Offload works](core-concepts.md)
- [Manage your sandbox](sandboxes.md), including resuming and deleting it
- [Optimize your Docker Offload usage](optimize.md)
@z
