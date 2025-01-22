%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Manage Docker Hub image access with Image Access Management, restricting developers to trusted images for enhanced security
keywords: image, access, management, trusted content, permissions, Docker Business feature, security, admin
title: Image Access Management
@y
description: Manage Docker Hub image access with Image Access Management, restricting developers to trusted images for enhanced security
keywords: image, access, management, trusted content, permissions, Docker Business feature, security, admin
title: Image Access Management
@z

@x
{{< summary-bar feature_name="Hardened Docker Desktop" >}}
@y
{{< summary-bar feature_name="Hardened Docker Desktop" >}}
@z

@x
Image Access Management gives you control over which types of images, such as Docker Official Images, Docker Verified Publisher Images, or community images, your developers can pull from Docker Hub.
@y
Image Access Management gives you control over which types of images, such as Docker Official Images, Docker Verified Publisher Images, or community images, your developers can pull from Docker Hub.
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
You first need to [enforce sign-in](/manuals/security/for-admins/enforce-sign-in/_index.md) to ensure that all Docker Desktop developers authenticate with your organization. Since Image Access Management requires a Docker Business subscription, enforced sign-in guarantees that only authenticated users have access and that the feature consistently takes effect across all users, even though it may still work without enforced sign-in.
@y
You first need to [enforce sign-in](manuals/security/for-admins/enforce-sign-in/_index.md) to ensure that all Docker Desktop developers authenticate with your organization. Since Image Access Management requires a Docker Business subscription, enforced sign-in guarantees that only authenticated users have access and that the feature consistently takes effect across all users, even though it may still work without enforced sign-in.
@z

@x
## Configure
@y
## Configure
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
