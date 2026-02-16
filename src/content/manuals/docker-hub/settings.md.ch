%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Learn about settings in Docker Hub
keywords: Docker Hub, Hub, repositories, settings
title: Settings
@y
description: Learn about settings in Docker Hub
keywords: Docker Hub, Hub, repositories, settings
title: Settings
@z

@x
You can configure the following settings in Docker Hub:
@y
You can configure the following settings in Docker Hub:
@z

@x
- [Default privacy](#default-privacy): Settings for all repositories within each
  namespace
- [Notifications](#notifications): Personal settings for autobuild notifications
@y
- [Default privacy](#default-privacy): Settings for all repositories within each
  namespace
- [Notifications](#notifications): Personal settings for autobuild notifications
@z

@x
## Default privacy
@y
## Default privacy
@z

@x
You can configure the following default privacy settings for all repositories in
a namespace:
@y
You can configure the following default privacy settings for all repositories in
a namespace:
@z

@x
- [Disable creation of public repos](#disable-creation-of-public-repos): Prevent
  organization users from creating public repositories (organization namespaces
  only)
- [Configure default repository privacy](#configure-default-repository-privacy):
  Set the default repository privacy for new repositories
@y
- [Disable creation of public repos](#disable-creation-of-public-repos): Prevent
  organization users from creating public repositories (organization namespaces
  only)
- [Configure default repository privacy](#configure-default-repository-privacy):
  Set the default repository privacy for new repositories
@z

@x
### Disable creation of public repos
@y
### Disable creation of public repos
@z

@x
{{< summary-bar feature_name="Disable public repositories" >}}
@y
{{< summary-bar feature_name="Disable public repositories" >}}
@z

@x
Organization owners and editors can prevent creating public repositories within
organization namespaces. You cannot configure this setting for personal account
namespaces.
@y
Organization owners and editors can prevent creating public repositories within
organization namespaces. You cannot configure this setting for personal account
namespaces.
@z

@x
> [!NOTE]
>
> Enabling this feature does not affect existing public repositories. Any public
> repositories that already exist will remain public. To make them private, you
> must change their visibility in the individual repository settings.
@y
> [!NOTE]
>
> Enabling this feature does not affect existing public repositories. Any public
> repositories that already exist will remain public. To make them private, you
> must change their visibility in the individual repository settings.
@z

@x
To configure the disable public repositories setting for an organization
namespace:
@y
To configure the disable public repositories setting for an organization
namespace:
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub**.
3. Select your organization from the top-left account drop-down.
4. Select **Settings** > **Default privacy**.
5. Toggle **Disable public repositories** to your desired setting.
6. Select **Save**.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub**.
3. Select your organization from the top-left account drop-down.
4. Select **Settings** > **Default privacy**.
5. Toggle **Disable public repositories** to your desired setting.
6. Select **Save**.
@z

@x
### Configure default repository privacy
@y
### Configure default repository privacy
@z

@x
Use the default repository privacy setting to automatically set privacy for
repositories created via `docker push` commands when the repository doesn't
exist yet. In this case, Docker Hub automatically creates the repository with
the default repository privacy for that namespace.
@y
Use the default repository privacy setting to automatically set privacy for
repositories created via `docker push` commands when the repository doesn't
exist yet. In this case, Docker Hub automatically creates the repository with
the default repository privacy for that namespace.
@z

@x
> [!NOTE]
>
> You cannot configure the default repository privacy setting when **Disable
> public repositories** is enabled.
@y
> [!NOTE]
>
> You cannot configure the default repository privacy setting when **Disable
> public repositories** is enabled.
@z

@x
To configure the default repository privacy for a namespace:
@y
To configure the default repository privacy for a namespace:
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub**.
3. Select your organization or account from the top-left account drop-down.
4. Select **Settings** > **Default privacy**.
5. In **Default repository privacy**, select the desired default privacy setting:
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub**.
3. Select your organization or account from the top-left account drop-down.
4. Select **Settings** > **Default privacy**.
5. In **Default repository privacy**, select the desired default privacy setting:
@z

@x
   - **Public**: All new repositories appear in Docker Hub search results and can be
     pulled by everyone.
   - **Private**: All new repositories don't appear in Docker Hub search results
     and are only accessible to you and collaborators. In addition, if the
     repository is created in an organization's namespace, then the repository
     is accessible to those with applicable roles or permissions.
@y
   - **Public**: All new repositories appear in Docker Hub search results and can be
     pulled by everyone.
   - **Private**: All new repositories don't appear in Docker Hub search results
     and are only accessible to you and collaborators. In addition, if the
     repository is created in an organization's namespace, then the repository
     is accessible to those with applicable roles or permissions.
@z

@x
6. Select **Save**.
@y
6. Select **Save**.
@z

@x
## Notifications
@y
## Notifications
@z

@x
You can send notifications to your email for all your repositories using
autobuilds.
@y
You can send notifications to your email for all your repositories using
autobuilds.
@z

@x
### Configure autobuild notifications
@y
### Configure autobuild notifications
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub**.
3. Select your personal account from the top-left account drop-down.
4. Select **Settings** > **Notifications**.
5. Select the notifications to receive by email:
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub**.
3. Select your personal account from the top-left account drop-down.
4. Select **Settings** > **Notifications**.
5. Select the notifications to receive by email:
@z

@x
   - **Off**: No notifications.
   - **Only failures**: Only notifications about failed builds.
   - **Everything**: Notifications for successful and failed builds.
@y
   - **Off**: No notifications.
   - **Only failures**: Only notifications about failed builds.
   - **Everything**: Notifications for successful and failed builds.
@z

@x
6. Select **Save**.
@y
6. Select **Save**.
@z
