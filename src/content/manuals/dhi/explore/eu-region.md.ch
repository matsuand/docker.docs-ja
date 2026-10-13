%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: EU data residency for Docker Hardened Images
linkTitle: EU data residency
description: Learn how Docker stores your mirrored and customized Docker Hardened Images in the EU when your DHI subscription is in the EU region, and what works differently in that region.
keywords: docker hardened images, dhi, eu region, data residency, europe, mirror, customization
@y
title: EU data residency for Docker Hardened Images
linkTitle: EU data residency
description: Learn how Docker stores your mirrored and customized Docker Hardened Images in the EU when your DHI subscription is in the EU region, and what works differently in that region.
keywords: docker hardened images, dhi, eu region, data residency, europe, mirror, customization
@z

@x
{{< summary-bar feature_name="Docker Hardened Images EU data residency" >}}
@y
{{< summary-bar feature_name="Docker Hardened Images EU data residency" >}}
@z

@x
Docker can provision your organization's Docker Hardened Images (DHI)
subscription in the EU region. When your subscription is in the EU region,
Docker stores your mirrored and customized images in the EU.
@y
Docker can provision your organization's Docker Hardened Images (DHI)
subscription in the EU region. When your subscription is in the EU region,
Docker stores your mirrored and customized images in the EU.
@z

@x
## How your region is set
@y
## How your region is set
@z

@x
Docker sets the region on your DHI subscription. Docker doesn't detect your
region automatically. To have your subscription provisioned in the EU region,
or to change its region, contact your Docker account representative or <a
href="https://www.docker.com/pricing/contact-sales/"
id="dkr_docs_cs_dhi_eu_region" class="link" rel="noopener">Docker
sales</a>.
@y
Docker sets the region on your DHI subscription. Docker doesn't detect your
region automatically. To have your subscription provisioned in the EU region,
or to change its region, contact your Docker account representative or <a
href="https://www.docker.com/pricing/contact-sales/"
id="dkr_docs_cs_dhi_eu_region" class="link" rel="noopener">Docker
sales</a>.
@z

@x
If you plan to use the EU region, request it before you start mirroring.
Mirrors that you create before your subscription moves to the EU region stay
in their original region.
@y
If you plan to use the EU region, request it before you start mirroring.
Mirrors that you create before your subscription moves to the EU region stay
in their original region.
@z

@x
## Check your region
@y
## Check your region
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
1. Select **My Hub**.
1. In the namespace drop-down, select your organization.
1. Select **Hardened Images** > **Manage**.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
1. Select **My Hub**.
1. In the namespace drop-down, select your organization.
1. Select **Hardened Images** > **Manage**.
@z

@x
When your subscription is in the EU region, the subscription label shows
**Your subscription (Region EU)**. When it shows only **Your subscription**,
your subscription is in the default US region.
@y
When your subscription is in the EU region, the subscription label shows
**Your subscription (Region EU)**. When it shows only **Your subscription**,
your subscription is in the default US region.
@z

@x
## What Docker stores in the EU
@y
## What Docker stores in the EU
@z

@x
When your subscription is in the EU region, Docker stores the following in the
EU:
@y
When your subscription is in the EU region, Docker stores the following in the
EU:
@z

@x
- The repositories that Docker creates when you [mirror a DHI
  repository](../how-to/mirror.md) to your organization on Docker Hub, and
  their attestations
- Your [customized images](../how-to/customize.md) and their attestations
@y
- The repositories that Docker creates when you [mirror a DHI
  repository](../how-to/mirror.md) to your organization on Docker Hub, and
  their attestations
- Your [customized images](../how-to/customize.md) and their attestations
@z

@x
OCI artifacts that you use in customizations are stored in the region of the
repository that you push them to. To keep them in the EU, push them to
repositories in the EU region.
@y
OCI artifacts that you use in customizations are stored in the region of the
repository that you push them to. To keep them in the EU, push them to
repositories in the EU region.
@z

@x
Your region doesn't apply to repositories that you [mirror to a third-party
registry](../how-to/mirror.md#mirror-a-dhi-repository-to-a-third-party-registry).
Where that content is stored depends on the registry you use.
@y
Your region doesn't apply to repositories that you [mirror to a third-party
registry](../how-to/mirror.md#mirror-a-dhi-repository-to-a-third-party-registry).
Where that content is stored depends on the registry you use.
@z

@x
## Attestations in the EU region
@y
## Attestations in the EU region
@z

@x
Docker stores attestations with the images in your Docker Hub repository. For
mirrored repositories, Docker copies only the attestations created when the
image is built. Attestations that Docker Scout generates, such as VEX
statements and vulnerability reports, aren't available in the EU region. To
see which attestations are available, see [Image
attestations](./security-concepts/attestations.md#image-attestations).
@y
Docker stores attestations with the images in your Docker Hub repository. For
mirrored repositories, Docker copies only the attestations created when the
image is built. Attestations that Docker Scout generates, such as VEX
statements and vulnerability reports, aren't available in the EU region. To
see which attestations are available, see [Image
attestations](./security-concepts/attestations.md#image-attestations).
@z

@x
## Limitations in the EU region
@y
## Limitations in the EU region
@z

@x
Mirroring and customization in the EU region work the same as in other regions,
with the following differences:
@y
Mirroring and customization in the EU region work the same as in other regions,
with the following differences:
@z

@x
- You can't [add files](../how-to/customize.md#inject-files-into-the-image)
  that you write directly in a customization, such as configuration files or
  setup scripts. This doesn't affect files that come from OCI artifacts. You can
  still add packages, OCI artifacts, and symlinks.
- Docker doesn't provide VEX statements or vulnerability reports for your
  mirrored repositories or customized images.
- Docker doesn't turn on Docker Scout image analysis for your mirrored
  repositories or customized images in the EU region. If you turn on Docker
  Scout image analysis for a repository in the EU region, the data that Docker
  Scout processes is stored in the US.
@y
- You can't [add files](../how-to/customize.md#inject-files-into-the-image)
  that you write directly in a customization, such as configuration files or
  setup scripts. This doesn't affect files that come from OCI artifacts. You can
  still add packages, OCI artifacts, and symlinks.
- Docker doesn't provide VEX statements or vulnerability reports for your
  mirrored repositories or customized images.
- Docker doesn't turn on Docker Scout image analysis for your mirrored
  repositories or customized images in the EU region. If you turn on Docker
  Scout image analysis for a repository in the EU region, the data that Docker
  Scout processes is stored in the US.
@z
