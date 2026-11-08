%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Docker Offload
@y
title: Docker Offload
@z

@x
description: Find documentation on Docker Offload to help you offload containers to the cloud.
keywords: build, cloud, cloud build, remote builder, offload
@y
description: Find documentation on Docker Offload to help you offload containers to the cloud.
keywords: build, cloud, cloud build, remote builder, offload
@z

% grid

@x
- title: Quickstart
  description: Get up and running with Docker Offload in just a few steps.
  icon: rocket-launch
  link: /offload/quickstart/
@y
- title: クィックスタート
  description: ほんの数ステップで Docker Offload を立ち上げます。
  icon: rocket-launch
  link: __SUBDIR__/offload/quickstart/
@z

@x
- title: How Offload works
  description: Learn about Docker Offload and how it works.
  icon: information-circle
  link: /offload/about/
@y
- title: Offload はどう動くか
  description: Docker Offload とその動作について学びます。
  icon: information-circle
  link: __SUBDIR__/offload/about/
@z

@x
- title: Manage cloud sandboxes
  description: Start, stop, inspect, and resume the cloud sandbox that runs your containers.
  icon: command-line
  link: /offload/sandboxes/
@y
- title: Manage cloud sandboxes
  description: Start, stop, inspect, and resume the cloud sandbox that runs your containers.
  icon: command-line
  link: __SUBDIR__/offload/sandboxes/
@z

@x
- title: Usage
  description: Learn how Docker Offload is billed and how to monitor your spend.
  icon: heart
  link: /offload/usage/
@y
- title: 利用方法
  description: Learn how Docker Offload is billed and how to monitor your spend.
  icon: heart
  link: __SUBDIR__/offload/usage/
@z

@x
- title: Optimize
  description: Improve performance and cost efficiency in Docker Offload.
  icon: bolt
  link: /offload/optimize/
@y
- title: 最適化
  description: Docker Offload のパフォーマンス、コスト効率を改善します。
  icon: bolt
  link: __SUBDIR__/offload/optimize/
@z

@x
- title: Troubleshoot
  description: Learn how to troubleshoot issues with Docker Offload.
  icon: bug-ant
  link: /offload/troubleshoot/
@y
- title: トラブルシューティング
  description: Docker Offload でのトラブルシューティング方法について学びます。
  icon: bug-ant
  link: __SUBDIR__/offload/troubleshoot/
@z

@x
- title: Feedback
  description: Provide feedback on Docker Offload.
  icon: chat-bubble-left
  link: /offload/feedback/
@y
- title: フィードバック
  description: Docker Offload へのフィードバックを行います。
  icon: chat-bubble-left
  link: __SUBDIR__/offload/feedback/
@z

@x
{{< summary-bar feature_name="Docker Offload" >}}
@y
{{< summary-bar feature_name="Docker Offload" >}}
@z

@x
Docker Offload is a fully managed service that lets you offload building and
running containers to the cloud using the Docker tools you already know. It
runs your containers in a cloud sandbox instead of on your local machine, so
you can work on hardware that can't run your workload, in virtual desktop
infrastructure (VDI) environments, or on systems that don't support nested
virtualization.
@y
Docker Offload is a fully managed service that lets you offload building and
running containers to the cloud using the Docker tools you already know. It
runs your containers in a cloud sandbox instead of on your local machine, so
you can work on hardware that can't run your workload, in virtual desktop
infrastructure (VDI) environments, or on systems that don't support nested
virtualization.
@z

@x
## Key features
@y
## Key features
@z

@x
- Cloud sandboxes that persist: Your containers, images, and volumes survive
  pausing and resuming, so you can pick up a long-running workload where you
  left off.
@y
- Cloud sandboxes that persist: Your containers, images, and volumes survive
  pausing and resuming, so you can pick up a long-running workload where you
  left off.
@z

@x
- Familiar commands: Run the Docker CLI and Docker Compose commands you already
  use. Your context determines where they run.
@y
- Familiar commands: Run the Docker CLI and Docker Compose commands you already
  use. Your context determines where they run.
@z

@x
- Port forwarding and file sync: Reach ports published in the sandbox from your
  machine, and work with bind-mounted files, as you would with local
  containers.
@y
- Port forwarding and file sync: Reach ports published in the sandbox from your
  machine, and work with bind-mounted files, as you would with local
  containers.
@z

@x
- Secure communication: Use encrypted tunnels between Docker Desktop and the
  cloud sandbox, with support for secure secrets and image pulling.
@y
- Secure communication: Use encrypted tunnels between Docker Desktop and the
  cloud sandbox, with support for secure secrets and image pulling.
@z

@x
- Usage-based billing: Pay for the time your sandbox runs, not for the time it
  spends paused.
@y
- Usage-based billing: Pay for the time your sandbox runs, not for the time it
  spends paused.
@z

@x
- VDI-friendly: [Use Docker Desktop](/manuals/desktop/setup/vm-vdi.md) in
  virtual desktop environments or systems that don't support nested
  virtualization.
@y
- VDI-friendly: [Use Docker Desktop](/manuals/desktop/setup/vm-vdi.md) in
  virtual desktop environments or systems that don't support nested
  virtualization.
@z

@x
Docker Offload is for individual developers, and it's included with a [Docker
Agentic Platform](/manuals/subscription-billing/plans/docker-agentic-platform.md) subscription. You pay for the time your cloud sandbox runs.
@y
Docker Offload is for individual developers, and it's included with a [Docker
Agentic Platform](/manuals/subscription-billing/plans/docker-agentic-platform.md) subscription. You pay for the time your cloud sandbox runs.
@z

@x
> [!NOTE]
>
> If you start Docker Offload with `docker offload start`, or with the cloud toggle
> in the Docker Desktop Dashboard header, your organization subscribes to
> [Docker Offload v1](v1/_index.md). To use the latest version of Docker Offload,
> see [Move to the current version of Docker
> Offload](v1/configuration.md#move-to-the-current-version-of-docker-offload).
@y
> [!NOTE]
>
> If you start Docker Offload with `docker offload start`, or with the cloud toggle
> in the Docker Desktop Dashboard header, your organization subscribes to
> [Docker Offload v1](v1/_index.md). To use the latest version of Docker Offload,
> see [Move to the current version of Docker
> Offload](v1/configuration.md#move-to-the-current-version-of-docker-offload).
@z

@x
In the following topics, learn about Docker Offload, how to set it up, use it
for your workflows, and troubleshoot common issues.
@y
In the following topics, learn about Docker Offload, how to set it up, use it
for your workflows, and troubleshoot common issues.
@z

% grid
