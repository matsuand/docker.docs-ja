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
Docker Offload implements session management and idle state policies to ensure
fair use across all users. For more information, see [Fair use](#fair-use).
@y
Docker Offload implements session management and idle state policies to ensure
fair use across all users. For more information, see [Fair use](#fair-use).
@z

@x
Here's how session management works:
@y
Here's how session management works:
@z

@x
1. You start a new Docker Offload session. You can only have one session active
   at a time.
2. You receive periodic prompts (every 1 to 3 hours) in the Docker Desktop Dashboard
   to determine if you are still active. When the prompt appears, you can choose to:
   - Select **Resume** in the prompt to confirm you're still active and
     continue your session.
   - Do nothing, select **Cancel**, or dismiss the prompt. You have a
     5-minute grace period. After the grace period, if you still haven't
     responded, your session enters a 5-minute idle timeout period. During
     either period, you can select **Resume** to continue your session and
     preserve all containers, images, and volumes.
3. If the idle timeout period exceeds 5 minutes without resuming, the session
   is suspended (the remote connection is suspended and containers stop
   running).
4. After 8 hours of cumulative usage, the periodic prompts become more frequent.
   If you do not respond to a prompt and the idle timeout expires, your session
   ends and any containers, images, or volumes are deleted.
@y
1. You start a new Docker Offload session. You can only have one session active
   at a time.
2. You receive periodic prompts (every 1 to 3 hours) in the Docker Desktop Dashboard
   to determine if you are still active. When the prompt appears, you can choose to:
   - Select **Resume** in the prompt to confirm you're still active and
     continue your session.
   - Do nothing, select **Cancel**, or dismiss the prompt. You have a
     5-minute grace period. After the grace period, if you still haven't
     responded, your session enters a 5-minute idle timeout period. During
     either period, you can select **Resume** to continue your session and
     preserve all containers, images, and volumes.
3. If the idle timeout period exceeds 5 minutes without resuming, the session
   is suspended (the remote connection is suspended and containers stop
   running).
4. After 8 hours of cumulative usage, the periodic prompts become more frequent.
   If you do not respond to a prompt and the idle timeout expires, your session
   ends and any containers, images, or volumes are deleted.
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
