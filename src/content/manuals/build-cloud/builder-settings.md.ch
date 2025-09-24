%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
title: Builder settings
description: Set your builder settings relating to private registries, disk allocation .
keywords: build, cloud build, optimize, remote, local, cloud, registry, package repository, vpn
@y
title: Builder settings
description: Set your builder settings relating to private registries, disk allocation .
keywords: build, cloud build, optimize, remote, local, cloud, registry, package repository, vpn
@z

@x
The **Builder settings** page in Docker Build Cloud lets you configure disk allocation, private resource access, and firewall settings for your cloud builders in your organization. These configurations help optimize storage, enable access to private registries, and secure outbound network traffic.
@y
The **Builder settings** page in Docker Build Cloud lets you configure disk allocation, private resource access, and firewall settings for your cloud builders in your organization. These configurations help optimize storage, enable access to private registries, and secure outbound network traffic.
@z

@x
## Storage and cache management
@y
## Storage and cache management
@z

@x
### Disk allocation
@y
### Disk allocation
@z

@x
The **Disk allocation** setting lets you control how much of the available
storage is dedicated to the build cache. A lower allocation increases
storage available for active builds.
@y
The **Disk allocation** setting lets you control how much of the available
storage is dedicated to the build cache. A lower allocation increases
storage available for active builds.
@z

@x
To make disk allocation changes, navigate to **Builder settings** in Docker
Build Cloud and then adjust the **Disk allocation** slider to specify the
percentage of storage used for build caching.
@y
To make disk allocation changes, navigate to **Builder settings** in Docker
Build Cloud and then adjust the **Disk allocation** slider to specify the
percentage of storage used for build caching.
@z

@x
Any changes take effect immediately.
@y
Any changes take effect immediately.
@z

@x
### Build cache space
@y
### Build cache space
@z

@x
Your subscription includes the following Build cache space:
@y
Your subscription includes the following Build cache space:
@z

@x
| Subscription | Build cache space |
|--------------|-------------------|
| Personal     | N/A               |
| Pro          | 50GB              |
| Team         | 100GB             |
| Business     | 200GB             |
@y
| Subscription | Build cache space |
|--------------|-------------------|
| Personal     | N/A               |
| Pro          | 50GB              |
| Team         | 100GB             |
| Business     | 200GB             |
@z

@x
### Multi-architecture storage allocation
@y
### Multi-architecture storage allocation
@z

@x
Docker Build Cloud automatically provisions builders for both amd64 and arm64 architectures. Your total build cache space is split equally between these
two builders:
@y
Docker Build Cloud automatically provisions builders for both amd64 and arm64 architectures. Your total build cache space is split equally between these
two builders:
@z

@x
- Pro (50GB total): 25GB for amd64 builder + 25GB for arm64 builder
- Team (100GB total): 50GB for amd64 builder + 50GB for arm64 builder
- Business (200GB total): 100GB for amd64 builder + 100GB for arm64 builder
@y
- Pro (50GB total): 25GB for amd64 builder + 25GB for arm64 builder
- Team (100GB total): 50GB for amd64 builder + 50GB for arm64 builder
- Business (200GB total): 100GB for amd64 builder + 100GB for arm64 builder
@z

@x
> [!IMPORTANT]
>
> If you only build for one architecture, be aware that your effective cache
space is half of your subscription's total allocation.
@y
> [!IMPORTANT]
>
> If you only build for one architecture, be aware that your effective cache
space is half of your subscription's total allocation.
@z

@x
### Get more build cache space
@y
### Get more build cache space
@z

@x
To get more Build cache space, [upgrade your subscription](/manuals/subscription/scale.md).
@y
To get more Build cache space, [upgrade your subscription](manuals/subscription/scale.md).
@z

@x
> [!TIP]
>
> If you build large images, consider allocating less storage for caching to
leave more space for active builds.
@y
> [!TIP]
>
> If you build large images, consider allocating less storage for caching to
leave more space for active builds.
@z

@x
## Private resource access
@y
## Private resource access
@z

@x
Private resource access lets cloud builders pull images and packages from private resources. This feature is useful when builds rely on self-hosted artifact repositories or private OCI registries.
@y
Private resource access lets cloud builders pull images and packages from private resources. This feature is useful when builds rely on self-hosted artifact repositories or private OCI registries.
@z

@x
For example, if your organization hosts a private [PyPI](https://pypi.org/) repository on a private network, Docker Build Cloud would not be able to access it by default, since the cloud builder is not connected to your private network.
@y
For example, if your organization hosts a private [PyPI](https://pypi.org/) repository on a private network, Docker Build Cloud would not be able to access it by default, since the cloud builder is not connected to your private network.
@z

@x
To enable your cloud builders to access your private resources, enter the host name and port of your private resource and then select **Add**.
@y
To enable your cloud builders to access your private resources, enter the host name and port of your private resource and then select **Add**.
@z

@x
### Authentication
@y
### Authentication
@z

@x
If your internal artifacts require authentication, make sure that you
authenticate with the repository either before or during the build. For
internal package repositories for npm or PyPI, use [build secrets](/manuals/build/building/secrets.md)
to authenticate during the build. For internal OCI registries, use `docker
login` to authenticate before building.
@y
If your internal artifacts require authentication, make sure that you
authenticate with the repository either before or during the build. For
internal package repositories for npm or PyPI, use [build secrets](manuals/build/building/secrets.md)
to authenticate during the build. For internal OCI registries, use `docker
login` to authenticate before building.
@z

@x
Note that if you use a private registry that requires authentication, you will
need to authenticate with `docker login` twice before building. This is because
the cloud builder needs to authenticate with Docker to use the cloud builder,
and then again to authenticate with the private registry.
@y
Note that if you use a private registry that requires authentication, you will
need to authenticate with `docker login` twice before building. This is because
the cloud builder needs to authenticate with Docker to use the cloud builder,
and then again to authenticate with the private registry.
@z

% snip command...

@x
## Firewall
@y
## Firewall
@z

@x
Firewall settings let you restrict cloud builder egress traffic to specific IP addresses. This helps enhance security by limiting external network egress from the builder.
@y
Firewall settings let you restrict cloud builder egress traffic to specific IP addresses. This helps enhance security by limiting external network egress from the builder.
@z

@x
1. Select the **Enable firewall: Restrict cloud builder egress to specific public IP address** checkbox.
2. Enter the IP address you want to allow.
3. Select **Add** to apply the restriction.
@y
1. Select the **Enable firewall: Restrict cloud builder egress to specific public IP address** checkbox.
2. Enter the IP address you want to allow.
3. Select **Add** to apply the restriction.
@z
