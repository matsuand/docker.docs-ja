%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Configure Docker socket exceptions and advanced settings
linkTitle: Configure advanced settings
description: Configure Docker socket exceptions and advanced settings for Enhanced Container Isolation
keywords: enhanced container isolation, docker socket, configuration, testcontainers, admin settings
@y
title: Configure Docker socket exceptions and advanced settings
linkTitle: Configure advanced settings
description: Configure Docker socket exceptions and advanced settings for Enhanced Container Isolation
keywords: enhanced container isolation, docker socket, configuration, testcontainers, admin settings
@z

@x
{{< summary-bar feature_name="Hardened Docker Desktop" >}}
@y
{{< summary-bar feature_name="Hardened Docker Desktop" >}}
@z

@x
This page shows you how to configure Docker socket exceptions and other advanced settings for Enhanced Container Isolation (ECI). These configurations enable trusted tools like Testcontainers to work with ECI while maintaining security.
@y
This page shows you how to configure Docker socket exceptions and other advanced settings for Enhanced Container Isolation (ECI). These configurations enable trusted tools like Testcontainers to work with ECI while maintaining security.
@z

@x
## Docker socket mount permissions
@y
## Docker socket mount permissions
@z

@x
By default, Enhanced Container Isolation blocks containers from mounting the Docker socket to prevent malicious access to Docker Engine. However, some tools require Docker socket access.
@y
By default, Enhanced Container Isolation blocks containers from mounting the Docker socket to prevent malicious access to Docker Engine. However, some tools require Docker socket access.
@z

@x
Common scenarios requiring Docker socket access include:
@y
Common scenarios requiring Docker socket access include:
@z

@x
- Testing frameworks: Testcontainers, which manages test containers
- Build tools: Paketo buildpacks that create ephemeral build containers
- CI/CD tools: Tools that manage containers as part of deployment pipelines
- Development utilities: Docker CLI containers for container management
@y
- Testing frameworks: Testcontainers, which manages test containers
- Build tools: Paketo buildpacks that create ephemeral build containers
- CI/CD tools: Tools that manage containers as part of deployment pipelines
- Development utilities: Docker CLI containers for container management
@z

@x
## Configure socket exceptions
@y
## Configure socket exceptions
@z

@x
Configure Docker socket exceptions using Settings Management:
@y
Configure Docker socket exceptions using Settings Management:
@z

@x
{{< tabs >}}
{{< tab name="Admin Console" >}}
@y
{{< tabs >}}
{{< tab name="Admin Console" >}}
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your organization from the top-left account drop-down.
1. Go to **Admin Console** > **Desktop Settings Management**.
1. [Create or edit a setting policy](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md).
1. Find **Enhanced Container Isolation** settings.
1. Configure **Docker socket access control** with your trusted images and
command restrictions.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your organization from the top-left account drop-down.
1. Go to **Admin Console** > **Desktop Settings Management**.
1. [Create or edit a setting policy](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md).
1. Find **Enhanced Container Isolation** settings.
1. Configure **Docker socket access control** with your trusted images and
command restrictions.
@z

@x
{{< /tab >}}
{{< tab name="JSON file" >}}
@y
{{< /tab >}}
{{< tab name="JSON file" >}}
@z

@x
Create an [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md) and add:
@y
Create an [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md) and add:
@z

% snip code...

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Image allowlist configuration
@y
## Image allowlist configuration
@z

@x
The `imageList` defines which container images can mount the Docker socket.
@y
The `imageList` defines which container images can mount the Docker socket.
@z

@x
### Image reference formats
@y
### Image reference formats
@z

@x
| Format  | Description |
| :---------------------- | :---------- |
| `<image_name>[:<tag>]`  | Name of the image, with optional tag. If the tag is omitted, the `:latest` tag is used. If the tag is the wildcard `*`, then it means "any tag for that image." |
| `<image_name>@<digest>` | Name of the image, with a specific repository digest (e.g., as reported by `docker buildx imagetools inspect <image>`). This means only the image that matches that name and digest is allowed. |
@y
| Format  | Description |
| :---------------------- | :---------- |
| `<image_name>[:<tag>]`  | Name of the image, with optional tag. If the tag is omitted, the `:latest` tag is used. If the tag is the wildcard `*`, then it means "any tag for that image." |
| `<image_name>@<digest>` | Name of the image, with a specific repository digest (e.g., as reported by `docker buildx imagetools inspect <image>`). This means only the image that matches that name and digest is allowed. |
@z

@x
### Example configurations
@y
### Example configurations
@z

@x
Basic allowlist for testing tools:
@y
Basic allowlist for testing tools:
@z

% snip code...

@x
Wildcard allowlist (Docker Desktop 4.36 and later):
@y
Wildcard allowlist (Docker Desktop 4.36 and later):
@z

% snip code...

@x
> [!WARNING]
>
> Using `"*"` allows all containers to mount the Docker socket, which reduces security. Only use this when explicitly listing allowed images isn't feasible.
@y
> [!WARNING]
>
> Using `"*"` allows all containers to mount the Docker socket, which reduces security. Only use this when explicitly listing allowed images isn't feasible.
@z

@x
### Security validation
@y
### Security validation
@z

@x
Docker Desktop validates allowed images by:
@y
Docker Desktop validates allowed images by:
@z

@x
1. Downloading image digests from registries for allowed images
1. Comparing container image digests against the allowlist when containers start
1. Blocking containers whose digests don't match allowed images
@y
1. Downloading image digests from registries for allowed images
1. Comparing container image digests against the allowlist when containers start
1. Blocking containers whose digests don't match allowed images
@z

@x
This prevents bypassing restrictions by re-tagging unauthorized images:
@y
This prevents bypassing restrictions by re-tagging unauthorized images:
@z

% snip command...

@x
## Derived images support
@y
## Derived images support
@z

@x
For tools like Paketo buildpacks that create ephemeral local images, you can
allow images derived from trusted base images.
@y
For tools like Paketo buildpacks that create ephemeral local images, you can
allow images derived from trusted base images.
@z

@x
### Enable derived images
@y
### Enable derived images
@z

% snip code...

@x
When `allowDerivedImages` is true, local images built from allowed base images (using `FROM` in Dockerfile) also gain Docker socket access.
@y
When `allowDerivedImages` is true, local images built from allowed base images (using `FROM` in Dockerfile) also gain Docker socket access.
@z

@x
### Derived images requirements
@y
### Derived images requirements
@z

@x
- Local images only: Derived images must not exist in remote registries
- Base image available: The parent image must be pulled locally first
- Performance impact: Adds up to 1 second to container startup for validation
- Version compatibility: Full wildcard support requires Docker Desktop 4.36+
@y
- Local images only: Derived images must not exist in remote registries
- Base image available: The parent image must be pulled locally first
- Performance impact: Adds up to 1 second to container startup for validation
- Version compatibility: Full wildcard support requires Docker Desktop 4.36+
@z

@x
## Command restrictions
@y
## Command restrictions
@z

@x
### Deny list (recommended)
@y
### Deny list (recommended)
@z

@x
Blocks specified commands while allowing all others:
@y
Blocks specified commands while allowing all others:
@z

% snip code...

@x
### Allow list
@y
### Allow list
@z

@x
Only allows specified commands while blocking all others:
@y
Only allows specified commands while blocking all others:
@z

% snip code...

@x
### Command wildcards
@y
### Command wildcards
@z

@x
| Wildcard | Blocks/allows |
| :---------------- | :---------- |
| `"container\*"`     | All "docker container ..." commands |
| `"image\*"`         | All "docker image ..." commands |
| `"volume\*"`        | All "docker volume ..." commands |
| `"network\*"`       | All "docker network ..." commands |
| `"build\*"`         | All "docker build ..." commands |
| `"system\*"`        | All "docker system ..." commands |
@y
| Wildcard | Blocks/allows |
| :---------------- | :---------- |
| `"container\*"`     | All "docker container ..." commands |
| `"image\*"`         | All "docker image ..." commands |
| `"volume\*"`        | All "docker volume ..." commands |
| `"network\*"`       | All "docker network ..." commands |
| `"build\*"`         | All "docker build ..." commands |
| `"system\*"`        | All "docker system ..." commands |
@z

@x
### Command blocking example
@y
### Command blocking example
@z

@x
When a blocked command is executed:
@y
When a blocked command is executed:
@z

% snip command...

@x
## Common configuration examples
@y
## Common configuration examples
@z

@x
### Testcontainers setup
@y
### Testcontainers setup
@z

@x
For Java/Python testing with Testcontainers:
@y
For Java/Python testing with Testcontainers:
@z

% snip code...

@x
### CI/CD pipeline tools
@y
### CI/CD pipeline tools
@z

@x
For controlled CI/CD container management:
@y
For controlled CI/CD container management:
@z

% snip code...

@x
### Development environments
@y
### Development environments
@z

@x
For local development with Docker-in-Docker:
@y
For local development with Docker-in-Docker:
@z

% snip code...

@x
## Security recommendations
@y
## Security recommendations
@z

@x
### Image allowlist best practices
@y
### Image allowlist best practices
@z

@x
- Be restrictive: Only allow images you absolutely trust and need
- Use wildcards carefully: Tag wildcards (`*`) are convenient but less secure than specific tags
- Regular reviews: Periodically review and update your allowlist
- Digest pinning: Use digest references for maximum security in critical environments
@y
- Be restrictive: Only allow images you absolutely trust and need
- Use wildcards carefully: Tag wildcards (`*`) are convenient but less secure than specific tags
- Regular reviews: Periodically review and update your allowlist
- Digest pinning: Use digest references for maximum security in critical environments
@z

@x
### Command restrictions
@y
### Command restrictions
@z

@x
- Default to deny: Start with a deny list blocking dangerous commands like `push` and `build`
- Principle of least privilege: Only allow commands your tools actually need
- Monitor usage: Track which commands are being blocked to refine your configuration
@y
- Default to deny: Start with a deny list blocking dangerous commands like `push` and `build`
- Principle of least privilege: Only allow commands your tools actually need
- Monitor usage: Track which commands are being blocked to refine your configuration
@z

@x
### Monitoring and maintenance
@y
### Monitoring and maintenance
@z

@x
- Regular validation: Test your configuration after Docker Desktop updates, as image digests may change.
- Handle digest mismatches: If allowed images are unexpectedly blocked:
@y
- Regular validation: Test your configuration after Docker Desktop updates, as image digests may change.
- Handle digest mismatches: If allowed images are unexpectedly blocked:
@z

% snip command...

@x
This resolves digest mismatches when upstream images are updated.
@y
This resolves digest mismatches when upstream images are updated.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Review [Enhanced Container Isolation limitations](/manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/limitations.md).
- Review [Enhanced Container Isolation FAQs](/manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/faq.md).
@y
- Review [Enhanced Container Isolation limitations](manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/limitations.md).
- Review [Enhanced Container Isolation FAQs](manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/faq.md).
@z
