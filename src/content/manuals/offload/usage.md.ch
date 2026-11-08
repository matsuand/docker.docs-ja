%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Docker Offload usage
linktitle: Usage
@y
title: Docker Offload usage
linktitle: Usage
@z

@x
description: Learn how Docker Offload is billed and how to monitor your usage.
keywords: cloud, usage, offload, billing
@y
description: Learn how Docker Offload is billed and how to monitor your usage.
keywords: cloud, usage, offload, billing
@z

@x
{{< summary-bar feature_name="Docker Offload" >}}
@y
{{< summary-bar feature_name="Docker Offload" >}}
@z

@x
Docker Offload is billed for the time your cloud sandbox runs, as part of your
Docker Agentic Platform subscription. For subscription and payment information,
see [Signup and billing](/manuals/agentic-platform/signup.md).
@y
Docker Offload is billed for the time your cloud sandbox runs, as part of your
Docker Agentic Platform subscription. For subscription and payment information,
ssee [Signup and billing](manuals/agentic-platform/signup.md).
@z

@x
## What you're billed for
@y
## What you're billed for
@z

@x
Billing starts when your sandbox finishes being created and stops when the
sandbox starts pausing, whether you run `docker offload stop` or the sandbox
pauses on its own after a period without activity.
@y
Billing starts when your sandbox finishes being created and stops when the
sandbox starts pausing, whether you run `docker offload stop` or the sandbox
pauses on its own after a period without activity.
@z

@x
You aren't billed while a sandbox is paused. A paused sandbox keeps its
containers, images, and volumes, so you can leave a workload in place between
sessions without paying for idle time.
@y
You aren't billed while a sandbox is paused. A paused sandbox keeps its
containers, images, and volumes, so you can leave a workload in place between
sessions without paying for idle time.
@z

@x
By default, a sandbox pauses after 5 minutes without activity. You can change
that period with `--idle-timeout`.
@y
By default, a sandbox pauses after 5 minutes without activity. You can change
that period with `--idle-timeout`.
@z

@x
> [!WARNING]
>
> `--keep-alive` turns off idle detection, so the sandbox keeps running, and
> billing continues, until you run `docker offload stop`. It still pauses if
> your machine sleeps past the sandbox's time to live, and after 24 hours. For
> more information, see [Control when your sandbox
> pauses](sandboxes.md#control-when-your-cloud-sandbox-pauses).
@y
> [!WARNING]
>
> `--keep-alive` turns off idle detection, so the sandbox keeps running, and
> billing continues, until you run `docker offload stop`. It still pauses if
> your machine sleeps past the sandbox's time to live, and after 24 hours. For
> more information, see [Control when your sandbox
> pauses](sandboxes.md#control-when-your-cloud-sandbox-pauses).
@z

@x
Some workloads keep a sandbox awake even when you've stopped using it, which
means it keeps billing. A container running on the host network does this, and
so does a large number of running containers. Run `docker offload status` to
see what's keeping a sandbox awake, and `docker offload stop` when you're
finished.
@y
Some workloads keep a sandbox awake even when you've stopped using it, which
means it keeps billing. A container running on the host network does this, and
so does a large number of running containers. Run `docker offload status` to
see what's keeping a sandbox awake, and `docker offload stop` when you're
finished.
@z

@x
## Monitor your usage
@y
## Monitor your usage
@z

@x
To see your running sandbox and its hourly price, open the [Docker Agentic
Platform Console](https://agentic-platform.docker.com/).
@y
To see your running sandbox and its hourly price, open the [Docker Agentic
Platform Console](https://agentic-platform.docker.com/).
@z

@x
### Find your sandbox in the Console
@y
### Find your sandbox in the Console
@z

@x
A sandbox that Docker Offload creates appears in the Console under your account
with a name that starts with `offload-`. Use that prefix to tell it apart from
sandboxes you started another way.
@y
A sandbox that Docker Offload creates appears in the Console under your account
with a name that starts with `offload-`. Use that prefix to tell it apart from
sandboxes you started another way.
@z

@x
Your usage shows the sandbox's details, such as its size, vCPUs, and memory. It
doesn't report that Docker Offload created the sandbox, so the name prefix is
what identifies it.
@y
Your usage shows the sandbox's details, such as its size, vCPUs, and memory. It
doesn't report that Docker Offload created the sandbox, so the name prefix is
what identifies it.
@z

@x
## Reduce your usage
@y
## Reduce your usage
@z

@x
Because you're billed for the time your sandbox runs, the main ways to reduce
your spend are to stop your sandbox when you're not using it and to make your
builds faster. For build and transfer optimizations, see [Optimize Docker
Offload usage](optimize.md).
@y
Because you're billed for the time your sandbox runs, the main ways to reduce
your spend are to stop your sandbox when you're not using it and to make your
builds faster. For build and transfer optimizations, see [Optimize Docker
Offload usage](optimize.md).
@z
