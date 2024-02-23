%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: Learn how to create repositories on Docker Hub
keywords: Docker, docker, trusted, registry, accounts, plans, Dockerfile, Docker Hub,
  webhooks, docs, documentation, manage, repos
title: Create repositories
@y
description: Learn how to create repositories on Docker Hub
keywords: Docker, docker, trusted, registry, accounts, plans, Dockerfile, Docker Hub,
  webhooks, docs, documentation, manage, repos
title: リポジトリの生成
@z

@x
Repositories let you share container images with your team,
customers, or the Docker community at large.
@y
Repositories let you share container images with your team,
customers, or the Docker community at large.
@z

@x
A single Docker Hub repository can hold many Docker images which are stored as **tags**. You can push Docker images to Docker Hub with the [`docker push`](/reference/cli/docker/image/push/)command.
@y
A single Docker Hub repository can hold many Docker images which are stored as **tags**. You can push Docker images to Docker Hub with the [`docker push`](__SUBDIR__/reference/cli/docker/image/push/)command.
@z

@x
## Create a repository
@y
## リポジトリの生成 {#create-a-repository}
@z

@x
1. Sign in to Docker Hub.
2. Select **Repositories**.
3. Near the top-right corner, select **Create Repository**.
@y
1. Docker Hub へサインインします。
2. **Repositories** (リポジトリ) を選びます。
3. 右上隅にある **Create Repository** (リポジトリの生成) をクリックします。
@z

@x
When creating a new repository:
@y
When creating a new repository:
@z

@x
- You can choose to locate it under your own user account, or under any
  [organization](../../admin/organization//orgs.md) where you are an [owner](../../admin/organization/manage-a-team.md#organization-owner) or [editor](../../security/for-admins/roles-and-permissions.md).
- The repository name needs to:
    - Be unique
    - Have between 2 and 255 characters
    - Only contain lowercase letters, numbers, hyphens (`-`), and underscores (`_`)
@y
- You can choose to locate it under your own user account, or under any
  [organization](../../admin/organization//orgs.md) where you are an [owner](../../admin/organization/manage-a-team.md#organization-owner) or [editor](../../security/for-admins/roles-and-permissions.md).
- The repository name needs to:
    - Be unique
    - Have between 2 and 255 characters
    - Only contain lowercase letters, numbers, hyphens (`-`), and underscores (`_`)
@z

@x
  > **Note**
  >
  > You can't rename a Docker Hub repository once it's created.
@y
  > **Note**
  >
  > You can't rename a Docker Hub repository once it's created.
@z

@x
- The description can be up to 100 characters. It's used in the search results.
- If you're a Docker Verified Publisher (DVP) or Docker-Sponsored Open Source (DSOS) organization, you can also add a logo to a repository. The maximum size in pixels is 1000x1000.
- You can link a GitHub or Bitbucket account now, or choose to do it later in
  the repository settings.
- You can set the repository's default visibility to public or private.
@y
- The description can be up to 100 characters. It's used in the search results.
- If you're a Docker Verified Publisher (DVP) or Docker-Sponsored Open Source (DSOS) organization, you can also add a logo to a repository. The maximum size in pixels is 1000x1000.
- You can link a GitHub or Bitbucket account now, or choose to do it later in
  the repository settings.
- You can set the repository's default visibility to public or private.
@z

@x
  > **Note**
  >
  > For organizations creating a new repository, it's recommended you select **Private**.
@y
  > **Note**
  >
  > For organizations creating a new repository, it's recommended you select **Private**.
@z

@x
### Add a repository overview
@y
### Add a repository overview {#add-a-repository-overview}
@z

@x
Once you have created a repository, add an overview to the **Repository overview** field. This describes what your image does and how to use it. 
@y
Once you have created a repository, add an overview to the **Repository overview** field. This describes what your image does and how to use it. 
@z

@x
Consider the following repository overview best practices.
@y
Consider the following repository overview best practices.
@z

@x
- Describe what the image is, the features it offers, and why it should be used. Can include examples of usage or the team behind the project.
- Explain how to get started with running a container using the image. You can include a minimal example of how to use the image in a Dockerfile.
- List the key image variants and tags to use them, as well as use cases for the variants.
- Link to documentation or support sites, communities, or mailing lists for additional resources.
- Provide contact information for the image maintainers.
- Include the license for the image and where to find more details if needed.
@y
- Describe what the image is, the features it offers, and why it should be used. Can include examples of usage or the team behind the project.
- Explain how to get started with running a container using the image. You can include a minimal example of how to use the image in a Dockerfile.
- List the key image variants and tags to use them, as well as use cases for the variants.
- Link to documentation or support sites, communities, or mailing lists for additional resources.
- Provide contact information for the image maintainers.
- Include the license for the image and where to find more details if needed.
@z

@x
## Push a Docker container image to Docker Hub
@y
## Push a Docker container image to Docker Hub
@z

@x
Once you have created a repository, you can start using `docker push` to push
images.
@y
Once you have created a repository, you can start using `docker push` to push
images.
@z

@x
To push an image to Docker Hub, you must first name your local image using your
Docker ID and the repository name that you created.
@y
To push an image to Docker Hub, you must first name your local image using your
Docker ID and the repository name that you created.
@z

@x
If you want to add multiple images to a repository, add a specific `:<tag>` to them, for example `docs/base:testing`. If it's not specified, the tag defaults to `latest`.
@y
If you want to add multiple images to a repository, add a specific `:<tag>` to them, for example `docs/base:testing`. If it's not specified, the tag defaults to `latest`.
@z

@x
Name your local images using one of these methods:
@y
Name your local images using one of these methods:
@z

@x
- When you build them, using `docker build -t <hub-user>/<repo-name>[:<tag>`
- By re-tagging the existing local image with `docker tag <existing-image> <hub-user>/<repo-name>[:<tag>]`.
- By using `docker commit <existing-container> <hub-user>/<repo-name>[:<tag>]` to commit changes.
@y
- When you build them, using `docker build -t <hub-user>/<repo-name>[:<tag>`
- By re-tagging the existing local image with `docker tag <existing-image> <hub-user>/<repo-name>[:<tag>]`.
- By using `docker commit <existing-container> <hub-user>/<repo-name>[:<tag>]` to commit changes.
@z

@x
Then, you can push this image to the repository designated by its name or tag:
@y
Then, you can push this image to the repository designated by its name or tag:
@z

@x
```console
$ docker push <hub-user>/<repo-name>:<tag>
```
@y
```console
$ docker push <hub-user>/<repo-name>:<tag>
```
@z

@x
The image is then uploaded and available for use by your teammates and/or the community.
@y
The image is then uploaded and available for use by your teammates and/or the community.
@z
