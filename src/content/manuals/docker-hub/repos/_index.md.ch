%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn how to manage repositories on Docker Hub
keywords: Docker, docker, trusted, registry, accounts, plans, Dockerfile, Docker Hub,
  webhooks, docs, documentation, manage, repos
title: Manage repositories
weight: 20
aliases:
- /engine/tutorials/dockerrepos/
---
@y
---
description: Learn how to manage repositories on Docker Hub
keywords: Docker, docker, trusted, registry, accounts, plans, Dockerfile, Docker Hub,
  webhooks, docs, documentation, manage, repos
title: Manage repositories
weight: 20
aliases:
- /engine/tutorials/dockerrepos/
---
@z

@x
## Manage default repository settings
@y
## Manage default repository settings
@z

@x
You can manage the default repository settings for your personal account in Docker Hub. Select the **Settings** icon, then select **Repository Settings**.
@y
You can manage the default repository settings for your personal account in Docker Hub. Select the **Settings** icon, then select **Repository Settings**.
@z

@x
![Repository settings menu](../images/docker-hub-repo-settings-menu.png)
@y
![Repository settings menu](../images/docker-hub-repo-settings-menu.png)
@z

@x
Here you can manage the following:
@y
Here you can manage the following:
@z

@x
- Default privacy: set the default repository privacy to either **Public** or **Private**.
- Linked accounts: for users with a Docker Pro, Team, or Business subscription, manage your source provider accounts to enable Automated Builds.
- Notifications: for users with a Docker Pro, Team, or Business subscription, manage how you receive notifications from autobuilds.
@y
- Default privacy: set the default repository privacy to either **Public** or **Private**.
- Linked accounts: for users with a Docker Pro, Team, or Business subscription, manage your source provider accounts to enable Automated Builds.
- Notifications: for users with a Docker Pro, Team, or Business subscription, manage how you receive notifications from autobuilds.
@z

@x
## Change a repository from public to private
@y
## Change a repository from public to private
@z

@x
1. Navigate to your repository.
2. Select the **Settings** tab.
3. Select **Make private**.
4. Enter the name of your repository to confirm. 
@y
1. Navigate to your repository.
2. Select the **Settings** tab.
3. Select **Make private**.
4. Enter the name of your repository to confirm. 
@z

@x
You get one free private repository with your Docker Hub user account (not
available for organizations you're a member of). If you need more private
repositories for your user account, upgrade your Docker Hub subscription from your [Billing Information](https://hub.docker.com/billing/plan) page.
@y
You get one free private repository with your Docker Hub user account (not
available for organizations you're a member of). If you need more private
repositories for your user account, upgrade your Docker Hub subscription from your [Billing Information](https://hub.docker.com/billing/plan) page.
@z

@x
## Move images between repositories
@y
## Move images between repositories
@z

@x
### Personal to personal
@y
### Personal to personal
@z

@x
When consolidating personal repositories, you can pull private images from the initial repository and push them into another repository owned by you. To avoid losing your private images, perform the following steps:
@y
When consolidating personal repositories, you can pull private images from the initial repository and push them into another repository owned by you. To avoid losing your private images, perform the following steps:
@z

@x
1. Navigate to [Docker Hub](https://hub.docker.com) create a new Docker ID and select a personal subscription.
2. Using `docker login` from the CLI, sign in using your original Docker ID and pull your private images.
3. Tag your private images with your newly created Docker ID, for example:
@y
1. Navigate to [Docker Hub](https://hub.docker.com) create a new Docker ID and select a personal subscription.
2. Using `docker login` from the CLI, sign in using your original Docker ID and pull your private images.
3. Tag your private images with your newly created Docker ID, for example:
@z

@x
   ```console
   $ docker tag namespace1/docker101tutorial new_namespace/docker101tutorial
   ```
4. Using `docker login` from the CLI, sign in with your newly created Docker ID, and push your newly tagged private images to your new Docker ID namespace:
@y
   ```console
   $ docker tag namespace1/docker101tutorial new_namespace/docker101tutorial
   ```
4. Using `docker login` from the CLI, sign in with your newly created Docker ID, and push your newly tagged private images to your new Docker ID namespace:
@z

@x
   ```console
   $ docker push new_namespace/docker101tutorial
   ```
@y
   ```console
   $ docker push new_namespace/docker101tutorial
   ```
@z

@x
The private images that existed in your previous account are now available in your new account.
@y
The private images that existed in your previous account are now available in your new account.
@z

@x
### Personal to an organization
@y
### Personal to an organization
@z

@x
To avoid losing your private images, you can pull your private images from your personal account and push them to an organization that's owned by you.
@y
To avoid losing your private images, you can pull your private images from your personal account and push them to an organization that's owned by you.
@z

@x
1. Navigate to [Docker Hub](https://hub.docker.com) and select **Organizations**.
2. Select the applicable organization and verify that your user account is a member of the organization.
3. Sign in to [Docker Hub](https://hub.docker.com) using your original Docker ID, and pull your images:
@y
1. Navigate to [Docker Hub](https://hub.docker.com) and select **Organizations**.
2. Select the applicable organization and verify that your user account is a member of the organization.
3. Sign in to [Docker Hub](https://hub.docker.com) using your original Docker ID, and pull your images:
@z

@x
   ```console
   $ docker pull namespace1/docker101tutorial
   ```
4. Tag your images with your new organization namespace:
@y
   ```console
   $ docker pull namespace1/docker101tutorial
   ```
4. Tag your images with your new organization namespace:
@z

@x
   ```console
   $ docker tag namespace1/docker101tutorial <new_org>/docker101tutorial
   ```
5. Push your newly tagged images to your new org namespace:
@y
   ```console
   $ docker tag namespace1/docker101tutorial <new_org>/docker101tutorial
   ```
5. Push your newly tagged images to your new org namespace:
@z

@x
   ```console
   $ docker push new_org/docker101tutorial
   ```
@y
   ```console
   $ docker push new_org/docker101tutorial
   ```
@z

@x
The private images that existed in your user account are now available for your organization.
@y
The private images that existed in your user account are now available for your organization.
@z

@x
## Delete a repository
@y
## Delete a repository
@z

@x
> [!WARNING]
>
> Deleting a repository deletes all the images it contains and its build settings. This action can't be undone.
@y
> [!WARNING]
>
> Deleting a repository deletes all the images it contains and its build settings. This action can't be undone.
@z

@x
1. Navigate to your repository.
2. Select the **Settings** tab.
3. Select **Delete repository**.
4. Enter the name of your repository to confirm.
@y
1. Navigate to your repository.
2. Select the **Settings** tab.
3. Select **Delete repository**.
4. Enter the name of your repository to confirm.
@z
