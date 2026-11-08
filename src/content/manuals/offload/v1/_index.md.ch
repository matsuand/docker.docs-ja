%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Docker Offload v1
linktitle: Docker Offload v1
@y
title: Docker Offload v1
linktitle: Docker Offload v1
@z

@x
description: Find documentation for Docker Offload v1, the subscription-based version started with docker offload start.
keywords: offload, offload v1, cloud, docker offload start
@y
description: Find documentation for Docker Offload v1, the subscription-based version started with docker offload start.
keywords: offload, offload v1, cloud, docker offload start
@z

% grid:

@x
- title: Quickstart
  description: Get up and running with Docker Offload v1.
  icon: rocket-launch
  link: /offload/v1/quickstart/
@y
- title: Quickstart
  description: Get up and running with Docker Offload v1.
  icon: rocket-launch
  link: __SUBDIR__/offload/v1/quickstart/
@z

@x
- title: About
  description: Learn about Docker Offload v1 and how it works.
  icon: information-circle
  link: /offload/v1/about/
@y
- title: About
  description: Learn about Docker Offload v1 and how it works.
  icon: information-circle
  link: __SUBDIR__/offload/v1/about/
@z

@x
- title: Configure
  description: Manage Docker Offload v1 for your organization and in Docker Desktop.
  icon: adjustments-horizontal
  link: /offload/v1/configuration/
@y
- title: Configure
  description: Manage Docker Offload v1 for your organization and in Docker Desktop.
  icon: adjustments-horizontal
  link: __SUBDIR__/offload/v1/configuration/
@z

@x
- title: Usage
  description: Monitor Docker Offload v1 sessions for your organization.
  icon: heart
  link: /offload/v1/usage/
@y
- title: Usage
  description: Monitor Docker Offload v1 sessions for your organization.
  icon: heart
  link: __SUBDIR__/offload/v1/usage/
@z

@x
- title: Troubleshoot
  description: Troubleshoot issues with Docker Offload v1.
  icon: bug-ant
  link: /offload/v1/troubleshoot/
@y
- title: Troubleshoot
  description: Troubleshoot issues with Docker Offload v1.
  icon: bug-ant
  link: __SUBDIR__/offload/v1/troubleshoot/
@z

@x
{{< summary-bar feature_name="Docker Offload v1" >}}
@y
{{< summary-bar feature_name="Docker Offload v1" >}}
@z

@x
Docker Offload v1 is the version of Docker Offload that organizations subscribe
to and that you start with `docker offload start` or the toggle in the Docker
Desktop Dashboard header. It runs builds and containers in an ephemeral cloud
environment that's removed when your session ends.
@y
Docker Offload v1 is the version of Docker Offload that organizations subscribe
to and that you start with `docker offload start` or the toggle in the Docker
Desktop Dashboard header. It runs builds and containers in an ephemeral cloud
environment that's removed when your session ends.
@z

@x
These pages are for you if any of the following apply:
@y
These pages are for you if any of the following apply:
@z

@x
- Your organization has a Docker Offload v1 subscription.
- You see a **Docker Offload** toggle in the Docker Desktop Dashboard header.
- **Enable Docker Offload** is visible and on in Docker Desktops settings.
@y
- Your organization has a Docker Offload v1 subscription.
- You see a **Docker Offload** toggle in the Docker Desktop Dashboard header.
- **Enable Docker Offload** is visible and on in Docker Desktops settings.
@z

@x
For the version that individual developers subscribe to and start with
`docker offload create`, see [Docker Offload](/manuals/offload/_index.md).
@y
For the version that individual developers subscribe to and start with
`docker offload create`, see [Docker Offload](manuals/offload/_index.md).
@z

@x
## Key features
@y
## Key features
@z

@x
Docker Offload v1 includes the following capabilities to support modern container
workflows:
@y
Docker Offload v1 includes the following capabilities to support modern container
workflows:
@z

@x
- Ephemeral cloud runners: Automatically provision and tear down cloud
  environments for each container session.
- Secure communication: Use encrypted tunnels between Docker Desktop and cloud
  environments with support for secure secrets and image pulling.
- Port forwarding and bind mounts: Retain a local development experience even
  when running containers in the cloud.
- VDI-friendly: [Use Docker Desktop](/manuals/desktop/setup/vm-vdi.md) in virtual
  desktop environments or systems that don't support nested virtualization.
@y
- Ephemeral cloud runners: Automatically provision and tear down cloud
  environments for each container session.
- Secure communication: Use encrypted tunnels between Docker Desktop and cloud
  environments with support for secure secrets and image pulling.
- Port forwarding and bind mounts: Retain a local development experience even
  when running containers in the cloud.
- VDI-friendly: [Use Docker Desktop](manuals/desktop/setup/vm-vdi.md) in virtual
  desktop environments or systems that don't support nested virtualization.
@z

@x
## Fair use
@y
## Fair use
@z

@x
Docker Offload v1 enforces a fair use policy to prevent resource abuse. Fair use is
defined as up to 8 compute hours per named user per day, totaled across all user
sessions. Usage in excess of this threshold may be subject to session management
at Docker's discretion.
@y
Docker Offload v1 enforces a fair use policy to prevent resource abuse. Fair use is
defined as up to 8 compute hours per named user per day, totaled across all user
sessions. Usage in excess of this threshold may be subject to session management
at Docker's discretion.
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
