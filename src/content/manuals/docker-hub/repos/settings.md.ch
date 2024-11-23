%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn about personal repository settings in Docker Hub
keywords: Docker Hub, Hub, repositories, settings
title: Personal settings for repositories
linkTitle: Personal settings
toc_max: 3
weight: 50
---
@y
---
description: Learn about personal repository settings in Docker Hub
keywords: Docker Hub, Hub, repositories, settings
title: Personal settings for repositories
linkTitle: Personal settings
toc_max: 3
weight: 50
---
@z

@x
For your account, you can set personal settings for repositories, including
default repository privacy and autobuild notifications.
@y
For your account, you can set personal settings for repositories, including
default repository privacy and autobuild notifications.
@z

@x
## Default repository privacy
@y
## Default repository privacy
@z

@x
When creating a new repository in Docker Hub, you are able to specify the
repository visibility. You can also change the visibility at any time in Docker Hub.
@y
When creating a new repository in Docker Hub, you are able to specify the
repository visibility. You can also change the visibility at any time in Docker Hub.
@z

@x
The default setting is useful if you use the `docker push` command to push to a
repository that doesn't exist yet. In this case, Docker Hub automatically
creates the repository with your default repository privacy.
@y
The default setting is useful if you use the `docker push` command to push to a
repository that doesn't exist yet. In this case, Docker Hub automatically
creates the repository with your default repository privacy.
@z

@x
### Configure default repository privacy
@y
### Configure default repository privacy
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **Repositories**.
3. Near the top-right corner, select the settings icon and then **Repository Settings**.
4. Select the **Default privacy** for any new repository created.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **Repositories**.
3. Near the top-right corner, select the settings icon and then **Repository Settings**.
4. Select the **Default privacy** for any new repository created.
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
5. Select **Save**.
@y
5. Select **Save**.
@z

@x
## Autobuild notifications
@y
## Autobuild notifications
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
2. Select **Repositories**.
3. Near the top-right corner, select the settings icon and then **Repository Settings**.
4. Select the **Notifications**
5. Select the notifications to receive by email.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **Repositories**.
3. Near the top-right corner, select the settings icon and then **Repository Settings**.
4. Select the **Notifications**
5. Select the notifications to receive by email.
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
