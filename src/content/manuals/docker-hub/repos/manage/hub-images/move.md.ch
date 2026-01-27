%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
description: Discover how to move images between repositories.
keywords: Docker Hub, Hub, repository content, move
title: Move images between repositories
linkTitle: Move images
@y
description: Discover how to move images between repositories.
keywords: Docker Hub, Hub, repository content, move
title: Move images between repositories
linkTitle: Move images
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
> [!NOTE]
>
> For bulk migrations, multi-arch images, or scripted workflows, see [Bulk
> migrate Docker images](/manuals/docker-hub/repos/manage/hub-images/bulk-migrate.md).
@y
> [!NOTE]
>
> For bulk migrations, multi-arch images, or scripted workflows, see [Bulk
> migrate Docker images](manuals/docker-hub/repos/manage/hub-images/bulk-migrate.md).
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
1. [Sign up](https://app.docker.com/signup) for a new Docker account with a personal subscription. (Be sure to verify your account after you've signed up.)
2. Sign in to [Docker](https://app.docker.com/login) using your original Docker account
3. Pull your images:
@y
1. [Sign up](https://app.docker.com/signup) for a new Docker account with a personal subscription. (Be sure to verify your account after you've signed up.)
2. Sign in to [Docker](https://app.docker.com/login) using your original Docker account
3. Pull your images:
@z

% snip command...

@x
4. Tag your private images with your newly created Docker username, for example:
@y
4. Tag your private images with your newly created Docker username, for example:
@z

% snip command...

@x
5. Using `docker login` from the CLI, sign in with your newly created Docker account, and push your newly tagged private images to your new Docker account namespace:
@y
5. Using `docker login` from the CLI, sign in with your newly created Docker account, and push your newly tagged private images to your new Docker account namespace:
@z

% snip command...

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
1. Navigate to [Docker Hub](https://hub.docker.com) and select **My Hub**.
2. Select the applicable organization and verify that your user account is a member of the organization.
3. Sign in to [Docker Hub](https://hub.docker.com) using your original Docker account, and pull your images:
@y
1. Navigate to [Docker Hub](https://hub.docker.com) and select **My Hub**.
2. Select the applicable organization and verify that your user account is a member of the organization.
3. Sign in to [Docker Hub](https://hub.docker.com) using your original Docker account, and pull your images:
@z

% snip command...

@x
4. Tag your images with your new organization namespace:
@y
4. Tag your images with your new organization namespace:
@z

% snip command...

@x
5. Push your newly tagged images to your new org namespace:
@y
5. Push your newly tagged images to your new org namespace:
@z

% snip command...

@x
The private images that existed in your user account are now available for your organization.
@y
The private images that existed in your user account are now available for your organization.
@z
