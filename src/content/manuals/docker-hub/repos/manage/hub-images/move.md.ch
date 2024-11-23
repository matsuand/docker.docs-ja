%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Discover how to move images between repositories.
keywords: Docker Hub, Hub, repository content, move
title: Move images between repositories
linkTitle: Move images
weight: 40
---
@y
---
description: Discover how to move images between repositories.
keywords: Docker Hub, Hub, repository content, move
title: Move images between repositories
linkTitle: Move images
weight: 40
---
@z

@x
Consolidating and organizing your Docker images across repositories can
streamline your workflows, whether you're managing personal projects or
contributing to an organization. This topic explains how to move images between
Docker Hub repositories, ensuring that your content remains accessible and
organized under the correct accounts or namespaces.
@y
Consolidating and organizing your Docker images across repositories can
streamline your workflows, whether you're managing personal projects or
contributing to an organization. This topic explains how to move images between
Docker Hub repositories, ensuring that your content remains accessible and
organized under the correct accounts or namespaces.
@z

@x
## Personal to personal
@y
## Personal to personal
@z

@x
When consolidating personal repositories, you can pull private images from the initial repository and push them into another repository owned by you. To avoid losing your private images, perform the following steps:
@y
When consolidating personal repositories, you can pull private images from the initial repository and push them into another repository owned by you. To avoid losing your private images, perform the following steps:
@z

@x
1. [Sign up](https://app.docker.com/signup) for a new Docker account with a personal subscription.
2. Sign in to [Docker](https://app.docker.com/login) using your original Docker account
3. Pull your images:
@y
1. [Sign up](https://app.docker.com/signup) for a new Docker account with a personal subscription.
2. Sign in to [Docker](https://app.docker.com/login) using your original Docker account
3. Pull your images:
@z

@x
   ```console
   $ docker pull namespace1/docker101tutorial
   ```
@y
   ```console
   $ docker pull namespace1/docker101tutorial
   ```
@z

@x
4. Tag your private images with your newly created Docker username, for example:
@y
4. Tag your private images with your newly created Docker username, for example:
@z

@x
   ```console
   $ docker tag namespace1/docker101tutorial new_namespace/docker101tutorial
   ```
5. Using `docker login` from the CLI, sign in with your newly created Docker account, and push your newly tagged private images to your new Docker account namespace:
@y
   ```console
   $ docker tag namespace1/docker101tutorial new_namespace/docker101tutorial
   ```
5. Using `docker login` from the CLI, sign in with your newly created Docker account, and push your newly tagged private images to your new Docker account namespace:
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
## Personal to an organization
@y
## Personal to an organization
@z

@x
To avoid losing your private images, you can pull your private images from your
personal account and push them to an organization that's owned by you.
@y
To avoid losing your private images, you can pull your private images from your
personal account and push them to an organization that's owned by you.
@z

@x
1. Navigate to [Docker Hub](https://hub.docker.com) and select **Organizations**.
2. Select the applicable organization and verify that your user account is a member of the organization.
3. Sign in to [Docker Hub](https://hub.docker.com) using your original Docker account, and pull your images:
@y
1. Navigate to [Docker Hub](https://hub.docker.com) and select **Organizations**.
2. Select the applicable organization and verify that your user account is a member of the organization.
3. Sign in to [Docker Hub](https://hub.docker.com) using your original Docker account, and pull your images:
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
