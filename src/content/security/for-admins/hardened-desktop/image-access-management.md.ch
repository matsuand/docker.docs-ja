%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リン クへの (no slash) 対応

@x
description: Image Access Management
keywords: image, access, management, trusted content, permissions, Docker Business feature
title: Image Access Management
@y
description: Image Access Management
keywords: image, access, management, trusted content, permissions, Docker Business feature
title: Image Access Management
@z

@x
> [!NOTE]
>
> Image Access Management is available to [Docker Business](/subscription/core-subscription/details.md#docker-business) customers only.
@y
> [!NOTE]
>
> Image Access Management is available to [Docker Business](subscription/core-subscription/details.md#docker-business) customers only.
@z

@x
Image Access Management gives administrators control over which types of images, such as Docker Official Images, Docker Verified Publisher Images, or community images, their developers can pull from Docker Hub.
@y
Image Access Management gives administrators control over which types of images, such as Docker Official Images, Docker Verified Publisher Images, or community images, their developers can pull from Docker Hub.
@z

@x
For example, a developer, who is part of an organization, building a new containerized application could accidentally use an untrusted, community image as a component of their application. This image could be malicious and pose a security risk to the company. Using Image Access Management, the organization owner can ensure that the developer can only access trusted content like Docker Official Images, Docker Verified Publisher Images, or the organization’s own images, preventing such a risk.
@y
For example, a developer, who is part of an organization, building a new containerized application could accidentally use an untrusted, community image as a component of their application. This image could be malicious and pose a security risk to the company. Using Image Access Management, the organization owner can ensure that the developer can only access trusted content like Docker Official Images, Docker Verified Publisher Images, or the organization’s own images, preventing such a risk.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
You need to [enforce sign-in](../enforce-sign-in/_index.md). For Image Access
Management to take effect, Docker Desktop users must authenticate to your
organization. Enforcing sign-in ensures that your Docker Desktop developers
always authenticate to your organization, even though they can authenticate
without it and the feature will take effect. Enforcing sign-in guarantees the
feature always takes effect.
@y
You need to [enforce sign-in](../enforce-sign-in/_index.md). For Image Access
Management to take effect, Docker Desktop users must authenticate to your
organization. Enforcing sign-in ensures that your Docker Desktop developers
always authenticate to your organization, even though they can authenticate
without it and the feature will take effect. Enforcing sign-in guarantees the
feature always takes effect.
@z

@x
## Configure Image Access Management permissions
@y
## Configure Image Access Management permissions
@z

@x
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@y
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@z

@x
{{% admin-image-access product="hub" %}}
@y
{{% admin-image-access product="hub" %}}
@z

@x
{{< /tab >}}
{{< tab name="Admin Console" >}}
@y
{{< /tab >}}
{{< tab name="Admin Console" >}}
@z

@x
{{< include "admin-early-access.md" >}}
@y
{{< include "admin-early-access.md" >}}
@z

@x
{{% admin-image-access product="admin" %}}
@y
{{% admin-image-access product="admin" %}}
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## More resources
@y
## More resources
@z

@x
- [Video: Hardened Desktop Image Access Management](https://www.youtube.com/watch?v=r3QRKHA1A5U)
@y
- [Video: Hardened Desktop Image Access Management](https://www.youtube.com/watch?v=r3QRKHA1A5U)
@z
