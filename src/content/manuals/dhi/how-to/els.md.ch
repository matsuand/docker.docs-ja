%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: 'Use Extended Lifecycle Support for Docker Hardened Images <span class="not-prose bg-blue-500 dark:bg-blue-400 rounded-sm px-1 text-xs text-white whitespace-nowrap">DHI Enterprise</span>'
linktitle: Use Extended Lifecycle Support
description: Learn how to use Extended Lifecycle Support with Docker Hardened Images.
@y
title: 'Use Extended Lifecycle Support for Docker Hardened Images <span class="not-prose bg-blue-500 dark:bg-blue-400 rounded-sm px-1 text-xs text-white whitespace-nowrap">DHI Enterprise</span>'
linktitle: Use Extended Lifecycle Support
description: Learn how to use Extended Lifecycle Support with Docker Hardened Images.
@z

@x
keywords: extended lifecycle support, docker hardened images, container security, image lifecycle, vulnerability management
@y
keywords: extended lifecycle support, docker hardened images, container security, image lifecycle, vulnerability management
@z

@x
{{< summary-bar feature_name="Docker Hardened Images" >}}
@y
{{< summary-bar feature_name="Docker Hardened Images" >}}
@z

@x
With a Docker Hardened Images subscription add-on, you can use Extended
Lifecycle Support (ELS) for Docker Hardened Images. ELS provides security
patches for end-of-life (EOL) image versions, letting you maintain secure,
compliant operations while planning upgrades on your own timeline. You can use
ELS images like any other Docker Hardened Image, but you must enable ELS for
each repository you want to use with ELS.
@y
With a Docker Hardened Images subscription add-on, you can use Extended
Lifecycle Support (ELS) for Docker Hardened Images. ELS provides security
patches for end-of-life (EOL) image versions, letting you maintain secure,
compliant operations while planning upgrades on your own timeline. You can use
ELS images like any other Docker Hardened Image, but you must enable ELS for
each repository you want to use with ELS.
@z

@x
## Discover repositories with ELS support
@y
## Discover repositories with ELS support
@z

@x
To find images with ELS support:
@y
To find images with ELS support:
@z

@x
1. Go to [Docker Hub](https://hub.docker.com) and sign in.
2. Select **My Hub**.
3. In the namespace drop-down, select your organization.
4. Select **Hardened Images** > **Catalog**.
5. In **Filter by**, select **Extended Lifecycle Support**.
@y
1. Go to [Docker Hub](https://hub.docker.com) and sign in.
2. Select **My Hub**.
3. In the namespace drop-down, select your organization.
4. Select **Hardened Images** > **Catalog**.
5. In **Filter by**, select **Extended Lifecycle Support**.
@z

@x
## Enable ELS for a repository
@y
## Enable ELS for a repository
@z

@x
To enable ELS for a repository, an organization owner must [mirror](./mirror.md)
the repository to your organization.
@y
To enable ELS for a repository, an organization owner must [mirror](./mirror.md)
the repository to your organization.
@z

@x
To enable ELS when mirroring:
@y
To enable ELS when mirroring:
@z

@x
1. Go to [Docker Hub](https://hub.docker.com) and sign in.
2. Select **My Hub**.
3. In the namespace drop-down, select your organization.
4. Select **Hardened Images** > **Catalog**.
5. Select a DHI repository to view its details.
6. Select **Use this image** > **Mirror repository**
7. Select **Enable support for end-of-life versions** and then follow the
   on-screen instructions.
@y
1. Go to [Docker Hub](https://hub.docker.com) and sign in.
2. Select **My Hub**.
3. In the namespace drop-down, select your organization.
4. Select **Hardened Images** > **Catalog**.
5. Select a DHI repository to view its details.
6. Select **Use this image** > **Mirror repository**
7. Select **Enable support for end-of-life versions** and then follow the
   on-screen instructions.
@z

@x
## Disable ELS for a repository
@y
## Disable ELS for a repository
@z

@x
To disable ELS for a repository, you must uncheck the ELS option in the mirrored
repository's **Settings** tab, or stop mirroring the repository. To stop mirroring, see
[Stop mirroring a repository](./mirror.md#stop-mirroring-a-repository).
@y
To disable ELS for a repository, you must uncheck the ELS option in the mirrored
repository's **Settings** tab, or stop mirroring the repository. To stop mirroring, see
[Stop mirroring a repository](./mirror.md#stop-mirroring-a-repository).
@z

@x
To update settings:
@y
To update settings:
@z

@x
1. Go to [Docker Hub](https://hub.docker.com) and sign in.
2. Select **My Hub**.
3. In the namespace drop-down, select your organization.
4. Select **Repositories** and then select the mirrored repository.
5. Select the **Settings** tab.
6. Uncheck the **Mirror end-of-life images** option.
@y
1. Go to [Docker Hub](https://hub.docker.com) and sign in.
2. Select **My Hub**.
3. In the namespace drop-down, select your organization.
4. Select **Repositories** and then select the mirrored repository.
5. Select the **Settings** tab.
6. Uncheck the **Mirror end-of-life images** option.
@z

@x
## Manage ELS repositories
@y
## Manage ELS repositories
@z

@x
You can view and manage your mirrored repositories with ELS like any other
mirrored DHI repository. For more details, see [Manage images](./manage.md).
@y
You can view and manage your mirrored repositories with ELS like any other
mirrored DHI repository. For more details, see [Manage images](./manage.md).
@z
