%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Configure Docker Offload
linktitle: Configure
@y
title: Configure Docker Offload
linktitle: Configure
@z

@x
description: Learn how to configure build settings for Docker Offload.
keywords: cloud, configuration, settings, cloud builder, GPU, disk allocation, private resources, firewall
@y
description: Learn how to configure build settings for Docker Offload.
keywords: cloud, configuration, settings, cloud builder, GPU, disk allocation, private resources, firewall
@z

@x
To use Docker Offload, you must start it in Docker Desktop. For more details,
see the [Docker Offload quickstart](/offload/quickstart/).
@y
To use Docker Offload, you must start it in Docker Desktop. For more details,
see the [Docker Offload quickstart](__SUBDIR__/offload/quickstart/).
@z

@x
Settings for the cloud builders in Docker Offload can be further configured, in
addition to settings for an entire organization, through **Offload settings** in
the Docker Offload dashboard.
@y
Settings for the cloud builders in Docker Offload can be further configured, in
addition to settings for an entire organization, through **Offload settings** in
the Docker Offload dashboard.
@z

@x
> [!NOTE]
>
> To view usage and configure billing for Docker Offload, see [Docker Offload
> usage and billing](/offload/usage/).
@y
> [!NOTE]
>
> To view usage and configure billing for Docker Offload, see [Docker Offload
> usage and billing](__SUBDIR__/offload/usage/).
@z

@x
## Offload settings
@y
## Offload settings
@z

@x
The **Offload settings** page in Docker Home lets you configure disk
allocation, private resource access, and firewall settings for your cloud
builders in your organization.
@y
The **Offload settings** page in Docker Home lets you configure disk
allocation, private resource access, and firewall settings for your cloud
builders in your organization.
@z

@x
To view the **Offload settings** page:
@y
To view the **Offload settings** page:
@z

@x
1. Go to [Docker Home](https://app.docker.com/).
2. Select the account for which you want to manage Docker Offload.
3. Select **Offload** > **Offload settings**.
@y
1. Go to [Docker Home](https://app.docker.com/).
2. Select the account for which you want to manage Docker Offload.
3. Select **Offload** > **Offload settings**.
@z

@x
The following sections describe the available settings.
@y
The following sections describe the available settings.
@z

@x
### Disk allocation
@y
### Disk allocation
@z

@x
The **Disk allocation** setting lets you control how much of the available
storage is dedicated to the build cache. A lower allocation increases storage
available for active builds.
@y
The **Disk allocation** setting lets you control how much of the available
storage is dedicated to the build cache. A lower allocation increases storage
available for active builds.
@z

@x
Adjust the **Disk allocation** slider to specify the percentage of storage used
for build caching.
@y
Adjust the **Disk allocation** slider to specify the percentage of storage used
for build caching.
@z

@x
Any changes take effect immediately.
@y
Any changes take effect immediately.
@z

@x
> [!TIP]
>
> If you build very large images, consider allocating less storage for caching.
@y
> [!TIP]
>
> If you build very large images, consider allocating less storage for caching.
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
To get more Build cache space, [upgrade your subscription](/manuals/subscription/change.md).
@y
To get more Build cache space, [upgrade your subscription](manuals/subscription/change.md).
@z

@x
### Private resource access
@y
### Private resource access
@z

@x
Private resource access lets cloud builders pull images and packages from
private resources. This feature is useful when builds rely on self-hosted
artifact repositories or private OCI registries.
@y
Private resource access lets cloud builders pull images and packages from
private resources. This feature is useful when builds rely on self-hosted
artifact repositories or private OCI registries.
@z

@x
For example, if your organization hosts a private [PyPI](https://pypi.org/)
repository on a private network, Docker Build Cloud would not be able to access
it by default, since the cloud builder is not connected to your private network.
@y
For example, if your organization hosts a private [PyPI](https://pypi.org/)
repository on a private network, Docker Build Cloud would not be able to access
it by default, since the cloud builder is not connected to your private network.
@z

@x
To enable your cloud builders to access your private resources, enter the host
name and port of your private resource and then select **Add**.
@y
To enable your cloud builders to access your private resources, enter the host
name and port of your private resource and then select **Add**.
@z

@x
#### Authentication
@y
#### Authentication
@z

@x
If your internal artifacts require authentication, make sure that you
authenticate with the repository either before or during the build. For internal
package repositories for npm or PyPI, use [build
secrets](/manuals/build/building/secrets.md) to authenticate during the build.
For internal OCI registries, use `docker login` to authenticate before building.
@y
If your internal artifacts require authentication, make sure that you
authenticate with the repository either before or during the build. For internal
package repositories for npm or PyPI, use [build
secrets](manuals/build/building/secrets.md) to authenticate during the build.
For internal OCI registries, use `docker login` to authenticate before building.
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

@x
```console
$ echo $DOCKER_PAT | docker login docker.io -u <username> --password-stdin
$ echo $REGISTRY_PASSWORD | docker login registry.example.com -u <username> --password-stdin
$ docker build --builder <cloud-builder> --tag registry.example.com/<image> --push .
```
@y
```console
$ echo $DOCKER_PAT | docker login docker.io -u <username> --password-stdin
$ echo $REGISTRY_PASSWORD | docker login registry.example.com -u <username> --password-stdin
$ docker build --builder <cloud-builder> --tag registry.example.com/<image> --push .
```
@z

@x
### Firewall
@y
### Firewall
@z

@x
Firewall settings let you restrict cloud builder egress traffic to specific IP
addresses. This helps enhance security by limiting external network egress from
the builder.
@y
Firewall settings let you restrict cloud builder egress traffic to specific IP
addresses. This helps enhance security by limiting external network egress from
the builder.
@z

@x
1. Select **Enable firewall: Restrict cloud builder egress to specific public IP address**.
2. Enter the IP address you want to allow.
3. Select **Add** to apply the restriction.
@y
1. Select **Enable firewall: Restrict cloud builder egress to specific public IP address**.
2. Enter the IP address you want to allow.
3. Select **Add** to apply the restriction.
@z
