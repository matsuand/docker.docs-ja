%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Configure Docker Sandboxes
linkTitle: Configuration
@y
title: Configure Docker Sandboxes
linkTitle: Configuration
@z

@x
description: Configure Docker Sandboxes settings, credentials, models, project environments, GPU passthrough, registry mirrors, and upstream proxies.
keywords: docker sandboxes, sbx, configuration, settings, credentials, models, environment files, gpu passthrough, registry mirror, upstream proxy
@y
description: Configure Docker Sandboxes settings, credentials, models, project environments, GPU passthrough, registry mirrors, and upstream proxies.
keywords: docker sandboxes, sbx, configuration, settings, credentials, models, environment files, gpu passthrough, registry mirror, upstream proxy
@z

@x
Configure credentials and how Docker Sandboxes run for a project, host, or
network environment. These settings control sandbox creation, authentication,
and connectivity. To change the tools and agent configuration inside a
sandbox, see [Customize](../customize/).
@y
Configure credentials and how Docker Sandboxes run for a project, host, or
network environment. These settings control sandbox creation, authentication,
and connectivity. To change the tools and agent configuration inside a
sandbox, see [Customize](../customize/).
@z

@x
- [Settings](settings.md) lists host-level settings, environment variable
  equivalents, and commands to inspect and change values.
- [Credentials](credentials.md) configures API keys, authentication
  credentials, and registry access for sandboxed agents.
- [Models](models.md) selects local models, hosted providers, or custom
  inference endpoints for sandboxed agents.
- [Environment files](environment-files.md) declare reusable project
  configuration in `sbxenv.yaml`.
- [GPU passthrough](gpu-passthrough.md) configures a Linux host and sandbox for
  NVIDIA GPU workloads.
- [Registry mirror](registry-mirror.md) routes Docker Hub template, kit, and
  in-sandbox Docker image pulls through an organization's registry mirror.
- [Upstream proxy](upstream-proxy.md) routes sandbox and daemon traffic through
  an operating system or corporate proxy.
@y
- [Settings](settings.md) lists host-level settings, environment variable
  equivalents, and commands to inspect and change values.
- [Credentials](credentials.md) configures API keys, authentication
  credentials, and registry access for sandboxed agents.
- [Models](models.md) selects local models, hosted providers, or custom
  inference endpoints for sandboxed agents.
- [Environment files](environment-files.md) declare reusable project
  configuration in `sbxenv.yaml`.
- [GPU passthrough](gpu-passthrough.md) configures a Linux host and sandbox for
  NVIDIA GPU workloads.
- [Registry mirror](registry-mirror.md) routes Docker Hub template, kit, and
  in-sandbox Docker image pulls through an organization's registry mirror.
- [Upstream proxy](upstream-proxy.md) routes sandbox and daemon traffic through
  an operating system or corporate proxy.
@z
