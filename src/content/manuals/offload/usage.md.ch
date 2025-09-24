%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker Offload usage and billing
linktitle: Usage & billing
weight: 30
description: Learn about Docker Offload usage and how to monitor your cloud resources.
keywords: cloud, usage, cloud minutes, shared cache, top repositories, cloud builder, Docker Offload
---
@y
---
title: Docker Offload usage and billing
linktitle: Usage & billing
weight: 30
description: Learn about Docker Offload usage and how to monitor your cloud resources.
keywords: cloud, usage, cloud minutes, shared cache, top repositories, cloud builder, Docker Offload
---
@z

@x
{{< summary-bar feature_name="Docker Offload" >}}
@y
{{< summary-bar feature_name="Docker Offload" >}}
@z

@x
> [!NOTE]
>
> All free trial credits granted for the Docker Offload Beta expire after 90
> days from the time they are granted. To continue using Docker Offload after
> your credits expire, you can enable on-demand usage at [Docker Home
> Billing](https://app.docker.com/billing).
@y
> [!NOTE]
>
> All free trial credits granted for the Docker Offload Beta expire after 90
> days from the time they are granted. To continue using Docker Offload after
> your credits expire, you can enable on-demand usage at [Docker Home
> Billing](https://app.docker.com/billing).
@z

@x
## Docker Offload billing
@y
## Docker Offload billing
@z

@x
For Docker Offload, you can view and configure billing on the **Docker Offload**
page in [Docker Home Billing](https://app.docker.com/billing). On this page, you
can:
@y
For Docker Offload, you can view and configure billing on the **Docker Offload**
page in [Docker Home Billing](https://app.docker.com/billing). On this page, you
can:
@z

@x
- View your included budget
- View rates for cloud resources
- Enable or disable on-demand usage
- Add or change payment methods
@y
- View your included budget
- View rates for cloud resources
- Enable or disable on-demand usage
- Add or change payment methods
@z

@x
For more general information about billing, see [Billing](../billing/_index.md).
@y
For more general information about billing, see [Billing](../billing/_index.md).
@z

@x
## Docker Offload overview
@y
## Docker Offload overview
@z

@x
The Docker Offload overview page in Docker Home provides visibility into
how you or your team is using cloud resources to build and run containers.
@y
The Docker Offload overview page in Docker Home provides visibility into
how you or your team is using cloud resources to build and run containers.
@z

@x
To view the **Overview** page:
@y
To view the **Overview** page:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/).
2. Select the account for which you want to manage Docker Offload.
3. Select **Offload** > **Overview**.
@y
1. Sign in to [Docker Home](https://app.docker.com/).
2. Select the account for which you want to manage Docker Offload.
3. Select **Offload** > **Overview**.
@z

@x
The following sections describe the available widgets on **Overview**.
@y
The following sections describe the available widgets on **Overview**.
@z

@x
### Offload minutes
@y
### Offload minutes
@z

@x
This widget shows the total number of offload minutes used over time. Offload
minutes represent the time spent running builds and containers in the Offload
environment. You can use this chart to:
@y
This widget shows the total number of offload minutes used over time. Offload
minutes represent the time spent running builds and containers in the Offload
environment. You can use this chart to:
@z

@x
- Track your Offload usage trends over time.
- Spot spikes in usage, which may indicate CI changes or build issues.
- Estimate usage against your subscription limits.
@y
- Track your Offload usage trends over time.
- Spot spikes in usage, which may indicate CI changes or build issues.
- Estimate usage against your subscription limits.
@z

@x
### Build cache usage
@y
### Build cache usage
@z

@x
This widget displays data about cache re-use across all builds, helping you
understand how effectively Docker Offload is using the build cache. It
provides insight into:
@y
This widget displays data about cache re-use across all builds, helping you
understand how effectively Docker Offload is using the build cache. It
provides insight into:
@z

@x
- The percentage of cache hits vs. misses.
- How much estimated build time is saved by reusing cache layers.
- Opportunities to improve cache efficiency by tuning your Dockerfiles or build
  strategy.
@y
- The percentage of cache hits vs. misses.
- How much estimated build time is saved by reusing cache layers.
- Opportunities to improve cache efficiency by tuning your Dockerfiles or build
  strategy.
@z

@x
### Top repositories built
@y
### Top repositories built
@z

@x
This widget highlights the repositories with the highest build activity for
Docker Offload. This widget helps you understand which projects consume the most
cloud resources and how efficiently they're being built.
@y
This widget highlights the repositories with the highest build activity for
Docker Offload. This widget helps you understand which projects consume the most
cloud resources and how efficiently they're being built.
@z

@x
It includes both aggregated metrics and per-repository details to give you a
comprehensive view.
@y
It includes both aggregated metrics and per-repository details to give you a
comprehensive view.
@z

@x
Use this widget to:
@y
Use this widget to:
@z

@x
- Identify build hotspots: See which repositories are consuming the most build
  time and resources.
- Spot trends: Monitor how build activity evolves across your projects.
- Evaluate efficiency: Check which repositories benefit most from cache re-use.
- Target improvements: Flag repositories with low cache hits or high failure
  rates for optimization.
@y
- Identify build hotspots: See which repositories are consuming the most build
  time and resources.
- Spot trends: Monitor how build activity evolves across your projects.
- Evaluate efficiency: Check which repositories benefit most from cache re-use.
- Target improvements: Flag repositories with low cache hits or high failure
  rates for optimization.
@z

@x
### Top 10 images
@y
### Top 10 images
@z

@x
This widget shows the top 10 images used in Docker Offload in run sessions. It
provides insight into which images are most frequently used, helping you
understand your team's container usage patterns.
@y
This widget shows the top 10 images used in Docker Offload in run sessions. It
provides insight into which images are most frequently used, helping you
understand your team's container usage patterns.
@z
