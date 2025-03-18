%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Discover how to manage repository tags on Docker Hub.
keywords: Docker Hub, Hub, repository content, tags
title: Tags on Docker Hub
linkTitle: Tags
@y
description: Discover how to manage repository tags on Docker Hub.
keywords: Docker Hub, Hub, repository content, tags
title: Tags on Docker Hub
linkTitle: Tags
@z

@x
Tags let you manage multiple versions of images within a single Docker Hub
repository. By adding a specific `:<tag>` to each image, such as
`docs/base:testing`, you can organize and differentiate image versions for
various use cases. If no tag is specified, the image defaults to the `latest`
tag.
@y
Tags let you manage multiple versions of images within a single Docker Hub
repository. By adding a specific `:<tag>` to each image, such as
`docs/base:testing`, you can organize and differentiate image versions for
various use cases. If no tag is specified, the image defaults to the `latest`
tag.
@z

@x
## Tag a local image
@y
## Tag a local image
@z

@x
To tag a local image, use one of the following methods:
@y
To tag a local image, use one of the following methods:
@z

@x
- When you build an image, use `docker build -t <org-or-user-namespace>/<repo-name>[:<tag>`.
- Re-tag an existing local image with `docker tag <existing-image> <org-or-user-namespace>/<repo-name>[:<tag>]`.
- When you commit changes, use `docker commit <existing-container> <org-or-user-namespace>/<repo-name>[:<tag>]`.
@y
- When you build an image, use `docker build -t <org-or-user-namespace>/<repo-name>[:<tag>`.
- Re-tag an existing local image with `docker tag <existing-image> <org-or-user-namespace>/<repo-name>[:<tag>]`.
- When you commit changes, use `docker commit <existing-container> <org-or-user-namespace>/<repo-name>[:<tag>]`.
@z

@x
Then, you can push this image to the repository designated by its name or tag:
@y
Then, you can push this image to the repository designated by its name or tag:
@z

@x
```console
$ docker push <org-or-user-namespace>/<repo-name>:<tag>
```
@y
```console
$ docker push <org-or-user-namespace>/<repo-name>:<tag>
```
@z

@x
The image is then uploaded and available for use in Docker Hub.
@y
The image is then uploaded and available for use in Docker Hub.
@z

@x
## View repository tags
@y
## View repository tags
@z

@x
You can view the available tags and the size of the associated image.
@y
You can view the available tags and the size of the associated image.
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub** > **Repositories**.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub** > **Repositories**.
@z

@x
   A list of your repositories appears.
@y
   A list of your repositories appears.
@z

@x
3. Select a repository.
@y
3. Select a repository.
@z

@x
   The **General** page for the repository appears.
@y
   The **General** page for the repository appears.
@z

@x
4. Select the **Tags** tab.
@y
4. Select the **Tags** tab.
@z

@x
You can select a tag's digest to see more details.
@y
You can select a tag's digest to see more details.
@z

@x
## Delete repository tags
@y
## Delete repository tags
@z

@x
Only the repository owner or other team members with granted permissions can
delete tags.
@y
Only the repository owner or other team members with granted permissions can
delete tags.
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub** > **Repositories**.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub** > **Repositories**.
@z

@x
   A list of your repositories appears.
@y
   A list of your repositories appears.
@z

@x
3. Select a repository.
@y
3. Select a repository.
@z

@x
   The **General** page for the repository appears.
@y
   The **General** page for the repository appears.
@z

@x
4. Select the **Tags** tab.
@y
4. Select the **Tags** tab.
@z

@x
5. Select the corresponding checkbox next to the tags to delete.
@y
5. Select the corresponding checkbox next to the tags to delete.
@z

@x
6. Select **Delete**.
@y
6. Select **Delete**.
@z

@x
   A confirmation dialog appears.
@y
   A confirmation dialog appears.
@z

@x
7. Select **Delete**.
@y
7. Select **Delete**.
@z
