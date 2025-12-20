%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
linktitle: Quickstart
title: Docker Hardened Images quickstart
description: Follow a quickstart guide to explore and run a Docker Hardened Image.
@y
linktitle: Quickstart
title: Docker Hardened Images quickstart
description: Follow a quickstart guide to explore and run a Docker Hardened Image.
@z

@x
keywords: docker hardened images quickstart, run secure image
@y
keywords: docker hardened images quickstart, run secure image
@z

@x
This guide shows you how to go from zero to running a Docker Hardened Image
(DHI) using a real example. At the end, you'll compare the DHI to a standard
Docker image to better understand the differences. While the steps use a
specific image as an example, they can be applied to any DHI.
@y
This guide shows you how to go from zero to running a Docker Hardened Image
(DHI) using a real example. At the end, you'll compare the DHI to a standard
Docker image to better understand the differences. While the steps use a
specific image as an example, they can be applied to any DHI.
@z

@x
> [!NOTE]
>
> Docker Hardened Images are freely available to everyone with no subscription
> required, no usage restrictions, and no vendor lock-in. You can upgrade to a
> DHI Enterprise subscription when you require enterprise features like FIPS or
> STIG compliance variants, customization capabilities, or SLA-backed support.
@y
> [!NOTE]
>
> Docker Hardened Images are freely available to everyone with no subscription
> required, no usage restrictions, and no vendor lock-in. You can upgrade to a
> DHI Enterprise subscription when you require enterprise features like FIPS or
> STIG compliance variants, customization capabilities, or SLA-backed support.
@z

@x
## Step 1: Find an image to use
@y
## Step 1: Find an image to use
@z

@x
1. Go to the Hardened Images catalog in [Docker
   Hub](https://hub.docker.com/hardened-images/catalog) and sign in.
2. In the left sidebar, select **Hardened Images**. If you have DHI Enterprise,
   then select **Hardened Images** > **Catalog**.
3. Use the search bar or filters to find an image (e.g., `python`, `node`,
   `golang`). For this guide, use the Python image as an example.
4. Select the Python repository to view its details.
@y
1. Go to the Hardened Images catalog in [Docker
   Hub](https://hub.docker.com/hardened-images/catalog) and sign in.
2. In the left sidebar, select **Hardened Images**. If you have DHI Enterprise,
   then select **Hardened Images** > **Catalog**.
3. Use the search bar or filters to find an image (e.g., `python`, `node`,
   `golang`). For this guide, use the Python image as an example.
4. Select the Python repository to view its details.
@z

@x
Continue to the next step to pull and run the image. To dive deeper into exploring
images see [Explore Docker Hardened Images](./how-to/explore.md).
@y
Continue to the next step to pull and run the image. To dive deeper into exploring
images see [Explore Docker Hardened Images](./how-to/explore.md).
@z

@x
## Step 2: Pull and run the image
@y
## Step 2: Pull and run the image
@z

@x
You can pull and run a DHI like any other Docker image. Note that Docker Hardened
Images are designed to be minimal and secure, so they may not include all the
tools or libraries you expect in a typical image. You can view the typical
differences in [Considerations when adopting
DHIs](./how-to/use.md#considerations-when-adopting-dhis).
@y
You can pull and run a DHI like any other Docker image. Note that Docker Hardened
Images are designed to be minimal and secure, so they may not include all the
tools or libraries you expect in a typical image. You can view the typical
differences in [Considerations when adopting
DHIs](./how-to/use.md#considerations-when-adopting-dhis).
@z

@x
> [!TIP]
>
> On every repository page in the DHI catalog, you'll find instructions for
> pulling and scanning the image by selecting **Use this image**.
@y
> [!TIP]
>
> On every repository page in the DHI catalog, you'll find instructions for
> pulling and scanning the image by selecting **Use this image**.
@z

@x
The following example demonstrates that you can run the Python image and execute
a simple Python command just like you would with any other Docker image:
@y
The following example demonstrates that you can run the Python image and execute
a simple Python command just like you would with any other Docker image:
@z

@x
1. Open a terminal and sign in to the Docker Hardened Images registry using your
   Docker ID credentials.
@y
1. Open a terminal and sign in to the Docker Hardened Images registry using your
   Docker ID credentials.
@z

% snip command...

@x
2. Pull the image:
@y
2. Pull the image:
@z

% snip command...

@x
3. Run the image to confirm everything works:
@y
3. Run the image to confirm everything works:
@z

% snip command...

@x
    This starts a container from the `python:3.13` image and runs a simple
    Python script that prints `Hello from DHI`.
@y
    This starts a container from the `python:3.13` image and runs a simple
    Python script that prints `Hello from DHI`.
@z

@x
To dive deeper into using images, see:
@y
To dive deeper into using images, see:
@z

@x
- [Use a Docker Hardened Image](./how-to/use.md) for general usage
- [Use in Kubernetes](./how-to/k8s.md) for Kubernetes deployments
- [Use a Helm chart](./how-to/helm.md) for deploying with Helm
@y
- [Use a Docker Hardened Image](./how-to/use.md) for general usage
- [Use in Kubernetes](./how-to/k8s.md) for Kubernetes deployments
- [Use a Helm chart](./how-to/helm.md) for deploying with Helm
@z

@x
## Step 3: Compare with the other images
@y
## Step 3: Compare with the other images
@z

@x
You can quickly compare DHIs with other images to see the security
improvements and differences. This comparison helps you understand the value of
using hardened images.
@y
You can quickly compare DHIs with other images to see the security
improvements and differences. This comparison helps you understand the value of
using hardened images.
@z

@x
Run the following command to see a summary comparison between the Docker
Hardened Image for Python and the non-hardened Docker Official Image for Python
from Docker Hub:
@y
Run the following command to see a summary comparison between the Docker
Hardened Image for Python and the non-hardened Docker Official Image for Python
from Docker Hub:
@z

% snip command...

@x
Example output:
@y
Example output:
@z

% snip output...

@x
> [!NOTE]
>
> This is example output. Your results may vary depending on newly discovered
> CVEs and image updates.
>
> Docker maintains near-zero CVEs in Docker Hardened Images. For DHI Enterprise
> subscriptions, when new CVEs are discovered, the CVEs are remediated within
> the industry-leading SLA timeframe. Learn more about the [SLA-backed security
> features](./features.md#sla-backed-security).
@y
> [!NOTE]
>
> This is example output. Your results may vary depending on newly discovered
> CVEs and image updates.
>
> Docker maintains near-zero CVEs in Docker Hardened Images. For DHI Enterprise
> subscriptions, when new CVEs are discovered, the CVEs are remediated within
> the industry-leading SLA timeframe. Learn more about the [SLA-backed security
> features](./features.md#sla-backed-security).
@z

@x
This comparison shows that the Docker Hardened Image:
@y
This comparison shows that the Docker Hardened Image:
@z

@x
- Removes vulnerabilities: 1 high, 5 medium, 141 low, and 2 unspecified severity CVEs removed
- Reduces size: From 412 MB down to 35 MB (91% reduction)
- Minimizes packages: From 610 packages down to 80 (87% reduction)
@y
- Removes vulnerabilities: 1 high, 5 medium, 141 low, and 2 unspecified severity CVEs removed
- Reduces size: From 412 MB down to 35 MB (91% reduction)
- Minimizes packages: From 610 packages down to 80 (87% reduction)
@z

@x
To dive deeper into comparing images see [Compare Docker Hardened Images](./how-to/compare.md).
@y
To dive deeper into comparing images see [Compare Docker Hardened Images](./how-to/compare.md).
@z

@x
## What's next
@y
## What's next
@z

@x
You've pulled and run your first Docker Hardened Image. Here are a few ways to keep going:
@y
You've pulled and run your first Docker Hardened Image. Here are a few ways to keep going:
@z

@x
- [Migrate existing applications to DHIs](./migration/migrate-with-ai.md): Use
  Docker's AI assistant to update your Dockerfiles to use Docker Hardened Images
  as the base.
@y
- [Migrate existing applications to DHIs](./migration/migrate-with-ai.md): Use
  Docker's AI assistant to update your Dockerfiles to use Docker Hardened Images
  as the base.
@z

@x
- [Start a trial](https://hub.docker.com/hardened-images/start-free-trial) to
  explore the benefits of a DHI Enterprise subscription, such as access to FIPS
  and STIG variants, customized images, and SLA-backed updates.
@y
- [Start a trial](https://hub.docker.com/hardened-images/start-free-trial) to
  explore the benefits of a DHI Enterprise subscription, such as access to FIPS
  and STIG variants, customized images, and SLA-backed updates.
@z

@x
- [Mirror a repository](./how-to/mirror.md): After subscribing to DHI Enterprise
  or starting a trial, learn how to mirror a DHI repository to enable
  customization, access compliance variants, and get SLA-backed updates.
@y
- [Mirror a repository](./how-to/mirror.md): After subscribing to DHI Enterprise
  or starting a trial, learn how to mirror a DHI repository to enable
  customization, access compliance variants, and get SLA-backed updates.
@z

@x
- [Verify DHIs](./how-to/verify.md): Use tools like [Docker Scout](/scout/) or
  Cosign to inspect and verify signed attestations, like SBOMs and provenance.
@y
- [Verify DHIs](./how-to/verify.md): Use tools like [Docker Scout](__SUBDIR__/scout/) or
  Cosign to inspect and verify signed attestations, like SBOMs and provenance.
@z

@x
- [Scan DHIs](./how-to/scan.md): Analyze the image with Docker
  Scout or other scanners to identify known CVEs.
@y
- [Scan DHIs](./how-to/scan.md): Analyze the image with Docker
  Scout or other scanners to identify known CVEs.
@z
