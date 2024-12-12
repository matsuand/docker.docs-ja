%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Registry Access Management
keywords: registry, access, management, permissions, Docker Business feature
title: Registry Access Management
@y
description: Registry Access Management
keywords: registry, access, management, permissions, Docker Business feature
title: Registry Access Management
@z

@x
> [!NOTE]
>
> Registry Access Management is available to [Docker Business](/manuals/subscription/details.md) customers only.
@y
> [!NOTE]
>
> Registry Access Management is available to [Docker Business](manuals/subscription/details.md) customers only.
@z

@x
With Registry Access Management (RAM), administrators can ensure that their developers using Docker Desktop only access allowed registries. This is done through the Registry Access Management dashboard in Docker Hub or the Docker Admin Console.
@y
With Registry Access Management (RAM), administrators can ensure that their developers using Docker Desktop only access allowed registries. This is done through the Registry Access Management dashboard in Docker Hub or the Docker Admin Console.
@z

@x
Registry Access Management supports both cloud and on-prem registries. This feature operates at the DNS level and therefore is compatible with all registries. You can add any hostname or domain name you’d like to include in the list of allowed registries. However, if the registry redirects to other domains such as `s3.amazon.com`, then you must add those domains to the list.
@y
Registry Access Management supports both cloud and on-prem registries. This feature operates at the DNS level and therefore is compatible with all registries. You can add any hostname or domain name you’d like to include in the list of allowed registries. However, if the registry redirects to other domains such as `s3.amazon.com`, then you must add those domains to the list.
@z

@x
Example registries administrators can allow include:
@y
Example registries administrators can allow include:
@z

@x
 - Docker Hub. This is enabled by default.
 - Amazon ECR
 - GitHub Container Registry
 - Google Container Registry
 - GitLab Container Registry
 - Nexus
 - Artifactory
@y
 - Docker Hub. This is enabled by default.
 - Amazon ECR
 - GitHub Container Registry
 - Google Container Registry
 - GitLab Container Registry
 - Nexus
 - Artifactory
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
You need to [enforce sign-in](../enforce-sign-in/_index.md). For Registry Access
Management to take effect, Docker Desktop users must authenticate to your
organization. Enforcing sign-in ensures that your Docker Desktop developers
always authenticate to your organization, even though they can authenticate
without it and the feature will take effect. Enforcing sign-in guarantees the
feature always takes effect.
@y
You need to [enforce sign-in](../enforce-sign-in/_index.md). For Registry Access
Management to take effect, Docker Desktop users must authenticate to your
organization. Enforcing sign-in ensures that your Docker Desktop developers
always authenticate to your organization, even though they can authenticate
without it and the feature will take effect. Enforcing sign-in guarantees the
feature always takes effect.
@z

@x
## Configure Registry Access Management permissions
@y
## Configure Registry Access Management permissions
@z

@x
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@y
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@z

@x
{{% admin-registry-access product="hub" %}}
@y
{{% admin-registry-access product="hub" %}}
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
{{% admin-registry-access product="admin" %}}
@y
{{% admin-registry-access product="admin" %}}
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Verify the restrictions
@y
## Verify the restrictions
@z

@x
The new Registry Access Management policy takes effect after the developer successfully authenticates to Docker Desktop using their organization credentials. If a developer attempts to pull an image from a disallowed registry via the Docker CLI, they receive an error message that the organization has disallowed this registry.
@y
The new Registry Access Management policy takes effect after the developer successfully authenticates to Docker Desktop using their organization credentials. If a developer attempts to pull an image from a disallowed registry via the Docker CLI, they receive an error message that the organization has disallowed this registry.
@z

@x
## Caveats
@y
## Caveats
@z

@x
There are certain limitations when using Registry Access Management:
@y
There are certain limitations when using Registry Access Management:
@z

@x
- Windows image pulls and image builds are not restricted by default. For Registry Access Management to take effect on Windows Container mode, you must allow the Windows Docker daemon to use Docker Desktop's internal proxy by selecting the [Use proxy for Windows Docker daemon](/manuals/desktop/settings-and-maintenance/settings.md#proxies) setting.
- Builds such as `docker buildx` using a Kubernetes driver are not restricted
- Builds such as `docker buildx` using a custom docker-container driver are not restricted
- Blocking is DNS-based; you must use a registry's access control mechanisms to distinguish between “push” and “pull”
- WSL 2 requires at least a 5.4 series Linux kernel (this does not apply to earlier Linux kernel series)
- Under the WSL 2 network, traffic from all Linux distributions is restricted (this will be resolved in the updated 5.15 series Linux kernel)
@y
- Windows image pulls and image builds are not restricted by default. For Registry Access Management to take effect on Windows Container mode, you must allow the Windows Docker daemon to use Docker Desktop's internal proxy by selecting the [Use proxy for Windows Docker daemon](manuals/desktop/settings-and-maintenance/settings.md#proxies) setting.
- Builds such as `docker buildx` using a Kubernetes driver are not restricted
- Builds such as `docker buildx` using a custom docker-container driver are not restricted
- Blocking is DNS-based; you must use a registry's access control mechanisms to distinguish between “push” and “pull”
- WSL 2 requires at least a 5.4 series Linux kernel (this does not apply to earlier Linux kernel series)
- Under the WSL 2 network, traffic from all Linux distributions is restricted (this will be resolved in the updated 5.15 series Linux kernel)
@z

@x
Also, Registry Access Management operates on the level of hosts, not IP addresses. Developers can bypass this restriction within their domain resolution, for example by running Docker against a local proxy or modifying their operating system's `sts` file. Blocking these forms of manipulation is outside the remit of Docker Desktop.
@y
Also, Registry Access Management operates on the level of hosts, not IP addresses. Developers can bypass this restriction within their domain resolution, for example by running Docker against a local proxy or modifying their operating system's `sts` file. Blocking these forms of manipulation is outside the remit of Docker Desktop.
@z

@x
## More resources
@y
## More resources
@z

@x
- [Video: Hardened Desktop Registry Access Management](https://www.youtube.com/watch?v=l9Z6WJdJC9A)
@y
- [Video: Hardened Desktop Registry Access Management](https://www.youtube.com/watch?v=l9Z6WJdJC9A)
@z
