%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: About Docker Offload
linktitle: About
@y
title: About Docker Offload
linktitle: About
@z

@x
description: Learn about Docker Offload, its features, and how it works.
keywords: cloud, offload, vdi
@y
description: Learn about Docker Offload, its features, and how it works.
keywords: cloud, offload, vdi
@z

@x
{{< summary-bar feature_name="Docker Offload" >}}
@y
{{< summary-bar feature_name="Docker Offload" >}}
@z

@x
Docker Offload is a fully managed service for building and running containers in
the cloud using the Docker tools you already know, including Docker Desktop, the
Docker CLI, and Docker Compose. It extends your local development workflow into a
scalable, cloud-powered environment, enabling developers to work efficiently even
in virtual desktop infrastructure (VDI) environments or systems that don't support
nested virtualization.
@y
Docker Offload is a fully managed service for building and running containers in
the cloud using the Docker tools you already know, including Docker Desktop, the
Docker CLI, and Docker Compose. It extends your local development workflow into a
scalable, cloud-powered environment, enabling developers to work efficiently even
in virtual desktop infrastructure (VDI) environments or systems that don't support
nested virtualization.
@z

@x
## Key features
@y
## Key features
@z

@x
Docker Offload includes the following capabilities to support modern container
workflows:
@y
Docker Offload includes the following capabilities to support modern container
workflows:
@z

@x
- Ephemeral cloud runners: Automatically provision and tear down cloud
  environments for each container session.
- Secure communication: Use encrypted tunnels between Docker Desktop and cloud
  environments with support for secure secrets and image pulling.
- Port forwarding and bind mounts: Retain a local development experience even
  when running containers in the cloud.
- VDI-friendly: [Use Docker Desktop](../desktop/setup/vm-vdi.md) in virtual
  desktop environments or systems that don't support nested virtualization.
@y
- Ephemeral cloud runners: Automatically provision and tear down cloud
  environments for each container session.
- Secure communication: Use encrypted tunnels between Docker Desktop and cloud
  environments with support for secure secrets and image pulling.
- Port forwarding and bind mounts: Retain a local development experience even
  when running containers in the cloud.
- VDI-friendly: [Use Docker Desktop](../desktop/setup/vm-vdi.md) in virtual
  desktop environments or systems that don't support nested virtualization.
@z

@x
For more information, see the [Docker Offload product
page](https://www.docker.com/products/docker-offload/).
@y
For more information, see the [Docker Offload product
page](https://www.docker.com/products/docker-offload/).
@z

@x
## How Docker Offload works
@y
## How Docker Offload works
@z

@x
Docker Offload replaces the need to build or run containers locally by connecting
Docker Desktop to secure, dedicated cloud resources.
@y
Docker Offload replaces the need to build or run containers locally by connecting
Docker Desktop to secure, dedicated cloud resources.
@z

@x
### Running containers with Docker Offload
@y
### Running containers with Docker Offload
@z

@x
When you use Docker Offload to build or run containers, Docker Desktop creates a secure
SSH tunnel to a Docker daemon running in the cloud. Your containers are started
and managed entirely in that remote environment.
@y
When you use Docker Offload to build or run containers, Docker Desktop creates a secure
SSH tunnel to a Docker daemon running in the cloud. Your containers are started
and managed entirely in that remote environment.
@z

@x
Here's what happens:
@y
Here's what happens:
@z

@x
1. Docker Desktop connects to the cloud and triggers container creation.
2. Docker Offload builds or pulls the required images and starts containers in the cloud.
3. The connection stays open while the containers run and you remain active.
4. When the containers stop running, the environment shuts down and is cleaned
   up automatically.
@y
1. Docker Desktop connects to the cloud and triggers container creation.
2. Docker Offload builds or pulls the required images and starts containers in the cloud.
3. The connection stays open while the containers run and you remain active.
4. When the containers stop running, the environment shuts down and is cleaned
   up automatically.
@z

@x
This setup avoids the overhead of running containers locally and enables fast,
reliable containers even on low-powered machines, including machines that do not
support nested virtualization. This makes Docker Offload ideal for developers
using environments such as virtual desktops, cloud-hosted development machines,
or older hardware.
@y
This setup avoids the overhead of running containers locally and enables fast,
reliable containers even on low-powered machines, including machines that do not
support nested virtualization. This makes Docker Offload ideal for developers
using environments such as virtual desktops, cloud-hosted development machines,
or older hardware.
@z

@x
Despite running remotely, features like bind mounts and port forwarding continue
to work seamlessly, providing a local-like experience from within Docker Desktop
and the CLI.
@y
Despite running remotely, features like bind mounts and port forwarding continue
to work seamlessly, providing a local-like experience from within Docker Desktop
and the CLI.
@z

@x
### Cloud resources
@y
### Cloud resources
@z

@x
Docker Offload uses cloud hosts with 4 vCPUs and 8 GiB of memory. If you have
different requirements, [contact
Docker](https://www.docker.com/pricing/contact-sales/) to explore options.
@y
Docker Offload uses cloud hosts with 4 vCPUs and 8 GiB of memory. If you have
different requirements, [contact
Docker](https://www.docker.com/pricing/contact-sales/) to explore options.
@z

@x
### Session management and idle state
@y
### Session management and idle state
@z

@x
Docker Offload uses session management and idle state policies to ensure fair use of cloud resources across all users, see [Fair use](#fair-use).
@y
Docker Offload uses session management and idle state policies to ensure fair use of cloud resources across all users, see [Fair use](#fair-use).
@z

@x
Each user can run one Docker Offload session at a time. When Docker Desktop is in an **Offload idle** state, it waits for activity on the Docker API and only connects to a cloud environment when needed. Once connected, the session moves to an **Offload running** state and stays connected as long as Docker detects activity. Activity includes any Docker API call, a running container, or an active build.
@y
Each user can run one Docker Offload session at a time. When Docker Desktop is in an **Offload idle** state, it waits for activity on the Docker API and only connects to a cloud environment when needed. Once connected, the session moves to an **Offload running** state and stays connected as long as Docker detects activity. Activity includes any Docker API call, a running container, or an active build.
@z

@x
#### When you'll see a prompt
@y
#### When you'll see a prompt
@z

@x
While Docker Offload is running, Docker Desktop shows prompts in the Dashboard to check if you're still active. Prompts appear in two cases:
@y
While Docker Offload is running, Docker Desktop shows prompts in the Dashboard to check if you're still active. Prompts appear in two cases:
@z

@x
1. No activity is detected for more than 3 minutes.
2. The session has been running for a long time.
@y
1. No activity is detected for more than 3 minutes.
2. The session has been running for a long time.
@z

@x
When a prompt appears, you can:
   - Select **Ask me again later** to confirm you're still active and continue your session.
   - Select **Idle now** to return to an idle state immediately.
   - Do nothing, and the session returns to an idle state automatically.
@y
When a prompt appears, you can:
   - Select **Ask me again later** to confirm you're still active and continue your session.
   - Select **Idle now** to return to an idle state immediately.
   - Do nothing, and the session returns to an idle state automatically.
@z

@x
#### What happens when your session goes idle
@y
#### What happens when your session goes idle
@z

@x
After your session returns to an idle state, there is a 5-minute grace period. You can resume the session during this time by running any Docker command.
@y
After your session returns to an idle state, there is a 5-minute grace period. You can resume the session during this time by running any Docker command.
@z

@x
> [!IMPORTANT]
> If the idle period exceeds 5 minutes without activity, the session is terminated. Docker Offload environments are ephemeral, so the remote environment and any containers, images, or volumes in it are deleted. To keep work between sessions, push images to a registry such as [Docker Hub](/docker-hub/) before your session ends.
@y
> [!IMPORTANT]
> If the idle period exceeds 5 minutes without activity, the session is terminated. Docker Offload environments are ephemeral, so the remote environment and any containers, images, or volumes in it are deleted. To keep work between sessions, push images to a registry such as [Docker Hub](__SUBDIR__/docker-hub/) before your session ends.
@z

@x
#### Long session prompts
@y
#### Long session prompts
@z

@x
Long session prompts appear every 3 hours during a session. After 8 hours of cumulative usage in a day, prompts appear every hour. The 8-hour counter resets at the start of each day.
@y
Long session prompts appear every 3 hours during a session. After 8 hours of cumulative usage in a day, prompts appear every hour. The 8-hour counter resets at the start of each day.
@z

@x
## Fair use
@y
## Fair use
@z

@x
Docker Offload enforces a fair use policy to prevent resource abuse. Fair use is
defined as up to 8 compute hours per named user per day, totaled across all user
sessions. Usage in excess of this threshold may be subject to session management
at Docker's discretion.
@y
Docker Offload enforces a fair use policy to prevent resource abuse. Fair use is
defined as up to 8 compute hours per named user per day, totaled across all user
sessions. Usage in excess of this threshold may be subject to session management
at Docker's discretion.
@z

@x
## What's next
@y
## What's next
@z

@x
Get hands-on with Docker Offload by following the [Docker Offload quickstart](/offload/quickstart/).
@y
Get hands-on with Docker Offload by following the [Docker Offload quickstart](__SUBDIR__/offload/quickstart/).
@z
