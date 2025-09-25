%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Registry Access Management
description: Control access to approved container registries with Registry Access Management for secure Docker Desktop usage
keywords: registry access management, container registry, security controls, docker business, admin controls
@y
title: Registry Access Management
description: Control access to approved container registries with Registry Access Management for secure Docker Desktop usage
keywords: registry access management, container registry, security controls, docker business, admin controls
@z

@x
{{< summary-bar feature_name="Registry access management" >}}
@y
{{< summary-bar feature_name="Registry access management" >}}
@z

@x
Registry Access Management (RAM) lets administrators control which container registries developers can access through Docker Desktop. This DNS-level filtering ensures developers only pull and push images from approved registries, improving supply chain security.
@y
Registry Access Management (RAM) lets administrators control which container registries developers can access through Docker Desktop. This DNS-level filtering ensures developers only pull and push images from approved registries, improving supply chain security.
@z

@x
RAM works with all registry types including cloud services, on-premises registries, and registry mirrors. You can allow any hostname or domain, but must include redirect domains (like `s3.amazonaws.com` for some registries) in your allowlist.
@y
RAM works with all registry types including cloud services, on-premises registries, and registry mirrors. You can allow any hostname or domain, but must include redirect domains (like `s3.amazonaws.com` for some registries) in your allowlist.
@z

@x
## Supported registries
@y
## Supported registries
@z

@x
Registry Access Management works with any container registry, including:
@y
Registry Access Management works with any container registry, including:
@z

@x
 - Docker Hub (allowed by default)
- Cloud registries: Amazon ECR, Google Container Registry, Azure Container Registry
- Git-based registries: GitHub Container Registry, GitLab Container Registry
- On-premises solutions: Nexus, Artifactory, Harbor
- Registry mirrors: Including Docker Hub mirrors
@y
 - Docker Hub (allowed by default)
- Cloud registries: Amazon ECR, Google Container Registry, Azure Container Registry
- Git-based registries: GitHub Container Registry, GitLab Container Registry
- On-premises solutions: Nexus, Artifactory, Harbor
- Registry mirrors: Including Docker Hub mirrors
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before configuring Registry Access Management, you must:
@y
Before configuring Registry Access Management, you must:
@z

@x
- [Enforce sign-in](/manuals/enterprise/security/enforce-sign-in/_index.md) to ensure users authenticate with your organization
- Use [personal access tokens (PATs)](/manuals/security/access-tokens.md) for authentication (Organization access tokens aren't supported)
- Have a Docker Business subscription
@y
- [Enforce sign-in](manuals/enterprise/security/enforce-sign-in/_index.md) to ensure users authenticate with your organization
- Use [personal access tokens (PATs)](manuals/security/access-tokens.md) for authentication (Organization access tokens aren't supported)
- Have a Docker Business subscription
@z

@x
> [!IMPORTANT]
>
> Registry Access Management only takes effect when users are signed in to Docker Desktop with organization credentials.
@y
> [!IMPORTANT]
>
> Registry Access Management only takes effect when users are signed in to Docker Desktop with organization credentials.
@z

@x
## Configure registry permissions
@y
## Configure registry permissions
@z

@x
To configure registry permissions:
@y
To configure registry permissions:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your organization from the top-left account drop-down.
1. Select **Admin Console**, then **Registry access**.
1. Use the **toggle** to enable registry access. By default, Docker Hub is enabled
in the registry list.
1. To add additional registries, select **Add registry** and provide
a **Registry address** and **Registry nickname**.
1. Select **Create**. You can add up to 100 registries.
1. Verify your registry appears in the registry list and select **Save changes**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your organization from the top-left account drop-down.
1. Select **Admin Console**, then **Registry access**.
1. Use the **toggle** to enable registry access. By default, Docker Hub is enabled
in the registry list.
1. To add additional registries, select **Add registry** and provide
a **Registry address** and **Registry nickname**.
1. Select **Create**. You can add up to 100 registries.
1. Verify your registry appears in the registry list and select **Save changes**.
@z

@x
Changes can take up to 24 hours to take effect. To apply them sooner,
have developers sign out and back in to Docker Desktop.
@y
Changes can take up to 24 hours to take effect. To apply them sooner,
have developers sign out and back in to Docker Desktop.
@z

@x
> [!IMPORTANT]
>
> Starting with Docker Desktop 4.36, if a developer belongs to multiple organizations with different RAM policies, only the policy for the first organization in the configuration file is enforced.
@y
> [!IMPORTANT]
>
> Starting with Docker Desktop 4.36, if a developer belongs to multiple organizations with different RAM policies, only the policy for the first organization in the configuration file is enforced.
@z

@x
> [!TIP]
>
> RAM restrictions also apply to Dockerfile `ADD` instructions that fetch content via URL. Include trusted registry domains in your allowlist when using `ADD` with URLs.
><br><br>
> RAM is designed for container registries, not general-purpose URLs like package mirrors or storage services. Adding too many domains may cause errors or hit system limits.
@y
> [!TIP]
>
> RAM restrictions also apply to Dockerfile `ADD` instructions that fetch content via URL. Include trusted registry domains in your allowlist when using `ADD` with URLs.
><br><br>
> RAM is designed for container registries, not general-purpose URLs like package mirrors or storage services. Adding too many domains may cause errors or hit system limits.
@z

@x
## Verify restrictions are working
@y
## Verify restrictions are working
@z

@x
After users sign in to Docker Desktop with their organization credentials, Registry Access Management takes effect immediately.
@y
After users sign in to Docker Desktop with their organization credentials, Registry Access Management takes effect immediately.
@z

@x
When users try to pull from a blocked registry:
@y
When users try to pull from a blocked registry:
@z

@x
```console
$ docker pull blocked-registry.com/image:tag
Error response from daemon: registry access to blocked-registry.com is not allowed
```
@y
```console
$ docker pull blocked-registry.com/image:tag
Error response from daemon: registry access to blocked-registry.com is not allowed
```
@z

@x
Allowed registry access works normally:
@y
Allowed registry access works normally:
@z

@x
```console
$ docker pull allowed-registry.com/image:tag
# Pull succeeds
```
@y
```console
$ docker pull allowed-registry.com/image:tag
# Pull succeeds
```
@z

@x
Registry restrictions apply to all Docker operations including pulls, pushes,
and builds that reference external registries.
@y
Registry restrictions apply to all Docker operations including pulls, pushes,
and builds that reference external registries.
@z

@x
## Registry limits and platform constraints
@y
## Registry limits and platform constraints
@z

@x
Registry Access Management has these limits and platform-specific behaviors:
@y
Registry Access Management has these limits and platform-specific behaviors:
@z

@x
- Maximum allowlist size: 100 registries or domains per organization
- DNS-based filtering: Restrictions work at the hostname level, not IP addresses
- Redirect domains required: Must include all domains a registry redirects to (CDN endpoints, storage services)
- Windows containers: Windows image operations aren't restricted by default. Turn on **Use proxy for Windows Docker daemon** in Docker Desktop settings to apply restrictions
- WSL 2 requirements: Requires Linux kernel 5.4 or later, restrictions apply to all WSL 2 distributions
@y
- Maximum allowlist size: 100 registries or domains per organization
- DNS-based filtering: Restrictions work at the hostname level, not IP addresses
- Redirect domains required: Must include all domains a registry redirects to (CDN endpoints, storage services)
- Windows containers: Windows image operations aren't restricted by default. Turn on **Use proxy for Windows Docker daemon** in Docker Desktop settings to apply restrictions
- WSL 2 requirements: Requires Linux kernel 5.4 or later, restrictions apply to all WSL 2 distributions
@z

@x
## Build and deployment restrictions
@y
## Build and deployment restrictions
@z

@x
These scenarios are not restricted by Registry Access Management:
@y
These scenarios are not restricted by Registry Access Management:
@z

@x
- Docker buildx with Kubernetes driver
- Docker buildx with custom docker-container driver
- Some Docker Debug and Kubernetes image pulls (even if Docker Hub is blocked)
- Images previously cached by registry mirrors may still be blocked if the source registry is restricted
@y
- Docker buildx with Kubernetes driver
- Docker buildx with custom docker-container driver
- Some Docker Debug and Kubernetes image pulls (even if Docker Hub is blocked)
- Images previously cached by registry mirrors may still be blocked if the source registry is restricted
@z

@x
## Security bypass considerations
@y
## Security bypass considerations
@z

@x
Users can potentially bypass Registry Access Management through:
@y
Users can potentially bypass Registry Access Management through:
@z

@x
- Local proxies or DNS manipulation
- Signing out of Docker Desktop (unless sign-in is enforced)
- Network-level modifications outside Docker Desktop's control
@y
- Local proxies or DNS manipulation
- Signing out of Docker Desktop (unless sign-in is enforced)
- Network-level modifications outside Docker Desktop's control
@z

@x
To maximize security effectiveness:
@y
To maximize security effectiveness:
@z

@x
- [Enforce sign-in](/manuals/enterprise/security/enforce-sign-in/_index.md) to prevent bypass through sign-out
- Implement additional network-level controls for complete protection
- Use Registry Access Management as part of a broader security strategy
@y
- [Enforce sign-in](manuals/enterprise/security/enforce-sign-in/_index.md) to prevent bypass through sign-out
- Implement additional network-level controls for complete protection
- Use Registry Access Management as part of a broader security strategy
@z

@x
## Registry allowlist best practices
@y
## Registry allowlist best practices
@z

@x
- Include all registry domains: Some registries redirect to multiple
domains. For AWS ECR, include:
@y
- Include all registry domains: Some registries redirect to multiple
domains. For AWS ECR, include:
@z

@x
    ```text
    your-account.dkr.ecr.us-west-2.amazonaws.com
    amazonaws.com
    s3.amazonaws.com
    ```
@y
    ```text
    your-account.dkr.ecr.us-west-2.amazonaws.com
    amazonaws.com
    s3.amazonaws.com
    ```
@z

@x
- Practice regular allowlist maintenance:
    - Remove unused registries periodically
    - Add newly approved registries as needed
    - Update domain names that may have changed
    - Monitor registry usage through Docker Desktop analytics
- Test configuration changes:
    - Verify registry access after making allowlist updates
    - Check that all necessary redirect domains are included
    - Ensure development workflows aren't disrupted
    - Combine with [Enhanced Container Isolation](/manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/_index.md) for comprehensive protection
@y
- Practice regular allowlist maintenance:
    - Remove unused registries periodically
    - Add newly approved registries as needed
    - Update domain names that may have changed
    - Monitor registry usage through Docker Desktop analytics
- Test configuration changes:
    - Verify registry access after making allowlist updates
    - Check that all necessary redirect domains are included
    - Ensure development workflows aren't disrupted
    - Combine with [Enhanced Container Isolation](manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/_index.md) for comprehensive protection
@z
