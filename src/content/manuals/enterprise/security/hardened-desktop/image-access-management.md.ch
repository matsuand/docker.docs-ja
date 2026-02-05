%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Image Access Management
description: Control which Docker Hub images developers can access with Image Access Management for enhanced supply chain security
keywords: image access management, docker official images, verified publisher, supply chain security, docker business, allow list
@y
title: Image Access Management
description: Control which Docker Hub images developers can access with Image Access Management for enhanced supply chain security
keywords: image access management, docker official images, verified publisher, supply chain security, docker business, allow list
@z

@x
{{< summary-bar feature_name="Hardened Docker Desktop" >}}
@y
{{< summary-bar feature_name="Hardened Docker Desktop" >}}
@z

@x
Image Access Management lets administrators control which types of images developers can pull from Docker Hub. This prevents developers from accidentally using untrusted community images that could pose security risks to your organization.
@y
Image Access Management lets administrators control which types of images developers can pull from Docker Hub. This prevents developers from accidentally using untrusted community images that could pose security risks to your organization.
@z

@x
With Image Access Management, you can restrict access to:
@y
With Image Access Management, you can restrict access to:
@z

@x
- Docker Official Images: Curated images maintained by Docker
- Docker Verified Publisher Images: Images from trusted commercial publishers
- Organization images: Your organization's private repositories
- Community images: Public images from individual developers
@y
- Docker Official Images: Curated images maintained by Docker
- Docker Verified Publisher Images: Images from trusted commercial publishers
- Organization images: Your organization's private repositories
- Community images: Public images from individual developers
@z

@x
You can also use a repository allow list to approve specific repositories that bypass all other access controls.
@y
You can also use a repository allow list to approve specific repositories that bypass all other access controls.
@z

@x
## Who should use Image Access Management?
@y
## Who should use Image Access Management?
@z

@x
Image Access Management helps prevent supply chain attacks by ensuring developers only use trusted container images. For example, a developer building a new application might accidentally use a malicious community image as a component. Image Access Management prevents this by restricting access to only approved image types.
@y
Image Access Management helps prevent supply chain attacks by ensuring developers only use trusted container images. For example, a developer building a new application might accidentally use a malicious community image as a component. Image Access Management prevents this by restricting access to only approved image types.
@z

@x
Common security scenarios include:
@y
Common security scenarios include:
@z

@x
- Prevent use of unmaintained or malicious community images
- Ensure developers use only vetted, official base images
- Control access to commercial third-party images
- Maintain consistent security standards across development teams
@y
- Prevent use of unmaintained or malicious community images
- Ensure developers use only vetted, official base images
- Control access to commercial third-party images
- Maintain consistent security standards across development teams
@z

@x
Use the repository allow list when you need to:
@y
Use the repository allow list when you need to:
@z

@x
- Grant access to specific vetted community images
- Allow essential third-party tools that don't fall under official categories
- Provide exceptions to general image access policies for specific business requirements
@y
- Grant access to specific vetted community images
- Allow essential third-party tools that don't fall under official categories
- Provide exceptions to general image access policies for specific business requirements
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before configuring Image Access Management, you must:
@y
Before configuring Image Access Management, you must:
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
> Image Access Management only takes effect when users are signed in to Docker Desktop with organization credentials.
@y
> [!IMPORTANT]
>
> Image Access Management only takes effect when users are signed in to Docker Desktop with organization credentials.
@z

@x
## Configure image access
@y
## Configure image access
@z

@x
To configure Image Access Management:
@y
To configure Image Access Management:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your organization from the top-left account drop-down.
1. Select **Admin Console**, then **Image access**.
1. Use the **toggle** to enable image access.
1. Select which image types to allow:
    - **Organization images**: Images from your organization (always allowed by default). These can be public or private images created by members within your organization.
    - **Community images**: Images contributed by various users that may pose security risks. This category includes Docker-Sponsored Open Source images and is turned off by default.
    - **Docker Verified Publisher Images**: Images from Docker partners in the Verified Publisher program, qualified for secure supply chains.
    - **Docker Official Images**: Curated Docker repositories that provide OS repositories, best practices for Dockerfiles, drop-in solutions, and timely security updates.
    - **Repository allow list**: A list of specific repositories that should be
      allowed. Configure in the next step.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your organization from the top-left account drop-down.
1. Select **Admin Console**, then **Image access**.
1. Use the **toggle** to enable image access.
1. Select which image types to allow:
    - **Organization images**: Images from your organization (always allowed by default). These can be public or private images created by members within your organization.
    - **Community images**: Images contributed by various users that may pose security risks. This category includes Docker-Sponsored Open Source images and is turned off by default.
    - **Docker Verified Publisher Images**: Images from Docker partners in the Verified Publisher program, qualified for secure supply chains.
    - **Docker Official Images**: Curated Docker repositories that provide OS repositories, best practices for Dockerfiles, drop-in solutions, and timely security updates.
    - **Repository allow list**: A list of specific repositories that should be
      allowed. Configure in the next step.
@z

@x
1. Optionally, when **Repository allow list** is enabled in the previous step,
   you can add or remove specific repositories in the allow list:
    - To add repositories, in the **Repository allow list** section, select
      **Add repositories to allow list** and follow the on-screen instructions.
    - To remove a repository, in the **Repository allow list** section, select
      the trashcan icon next to it.
@y
1. Optionally, when **Repository allow list** is enabled in the previous step,
   you can add or remove specific repositories in the allow list:
    - To add repositories, in the **Repository allow list** section, select
      **Add repositories to allow list** and follow the on-screen instructions.
    - To remove a repository, in the **Repository allow list** section, select
      the trashcan icon next to it.
@z

@x
    Repositories in the allow list are accessible to all organization members regardless of the image type restrictions configured in the previous steps.
@y
    Repositories in the allow list are accessible to all organization members regardless of the image type restrictions configured in the previous steps.
@z

@x
Once restrictions are applied, organization members can view the permissions page in read-only format.
@y
Once restrictions are applied, organization members can view the permissions page in read-only format.
@z

@x
> [!NOTE]
>
> Image Access Management is turned off by default. Organization owners have access to all images regardless of policy settings.
@y
> [!NOTE]
>
> Image Access Management is turned off by default. Organization owners have access to all images regardless of policy settings.
@z

@x
## Verify access restrictions
@y
## Verify access restrictions
@z

@x
After configuring Image Access Management, test that restrictions work correctly.
@y
After configuring Image Access Management, test that restrictions work correctly.
@z

@x
When developers pull allowed image types:
@y
When developers pull allowed image types:
@z

@x
```console
$ docker pull nginx  # Docker Official Image
# Pull succeeds if Docker Official Images are allowed
```
@y
```console
$ docker pull nginx  # Docker Official Image
# Pull succeeds if Docker Official Images are allowed
```
@z

@x
When developers pull blocked image types:
@y
When developers pull blocked image types:
@z

@x
```console
$ docker pull someuser/custom-image  # Community image
Error response from daemon: image access denied: community images not allowed
```
@y
```console
$ docker pull someuser/custom-image  # Community image
Error response from daemon: image access denied: community images not allowed
```
@z

@x
Image access restrictions apply to all Docker Hub operations including pulls, builds using `FROM` instructions, and Docker Compose services.
@y
Image access restrictions apply to all Docker Hub operations including pulls, builds using `FROM` instructions, and Docker Compose services.
@z

@x
## Security implementation
@y
## Security implementation
@z

@x
Start with the most restrictive policy and gradually expand based on legitimate business needs:
@y
Start with the most restrictive policy and gradually expand based on legitimate business needs:
@z

@x
1. Start with: Docker Official Images and Organization images
2. Add if needed: Docker Verified Publisher Images for commercial tools
3. Carefully evaluate: Community images only for specific, vetted use cases
4. Use the repository allow list sparingly: Only add repositories that have been thoroughly vetted and approved through your organization's security review process
@y
1. Start with: Docker Official Images and Organization images
2. Add if needed: Docker Verified Publisher Images for commercial tools
3. Carefully evaluate: Community images only for specific, vetted use cases
4. Use the repository allow list sparingly: Only add repositories that have been thoroughly vetted and approved through your organization's security review process
@z

@x
Other security recommendations include:
@y
Other security recommendations include:
@z

@x
- Monitor usage patterns: Review which images developers are attempting to pull, identify legitimate requests for additional image types, regularly audit approved image categories for continued relevance, and use Docker Desktop analytics to monitor usage patterns.
- Regularly review the repository allow list: Periodically audit the repositories in your allow list to ensure they remain necessary and trustworthy, and remove any that are no longer needed or maintained.
- Layer security controls: Image Access Management works best with Registry Access Management to control which registries developers can access, Enhanced Container Isolation to secure containers at runtime, and Settings Management to control Docker Desktop configuration.
@y
- Monitor usage patterns: Review which images developers are attempting to pull, identify legitimate requests for additional image types, regularly audit approved image categories for continued relevance, and use Docker Desktop analytics to monitor usage patterns.
- Regularly review the repository allow list: Periodically audit the repositories in your allow list to ensure they remain necessary and trustworthy, and remove any that are no longer needed or maintained.
- Layer security controls: Image Access Management works best with Registry Access Management to control which registries developers can access, Enhanced Container Isolation to secure containers at runtime, and Settings Management to control Docker Desktop configuration.
@z

@x
## Scope and bypass considerations
@y
## Scope and bypass considerations
@z

@x
- Image Access Management only controls access to Docker Hub images. Images from other registries aren't affected by these policies. Use [Registry Access Management](/manuals/enterprise/security/hardened-desktop/registry-access-management.md) to control access to other registries.
- Users can potentially bypass Image Access Management by signing out of Docker Desktop (unless sign-in is enforced), using images from other registries that aren't restricted, or using registry mirrors or proxies. Enforce sign-in and combine with Registry Access Management for comprehensive control.
- Image restrictions apply to Dockerfile `FROM` instructions, Docker Compose services using restricted images will fail, multi-stage builds may be affected if intermediate images are restricted, and CI/CD pipelines using diverse image types may be impacted.
@y
- Image Access Management only controls access to Docker Hub images. Images from other registries aren't affected by these policies. Use [Registry Access Management](manuals/enterprise/security/hardened-desktop/registry-access-management.md) to control access to other registries.
- Users can potentially bypass Image Access Management by signing out of Docker Desktop (unless sign-in is enforced), using images from other registries that aren't restricted, or using registry mirrors or proxies. Enforce sign-in and combine with Registry Access Management for comprehensive control.
- Image restrictions apply to Dockerfile `FROM` instructions, Docker Compose services using restricted images will fail, multi-stage builds may be affected if intermediate images are restricted, and CI/CD pipelines using diverse image types may be impacted.
@z
