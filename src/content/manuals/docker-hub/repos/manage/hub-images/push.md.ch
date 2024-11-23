%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn how to add content to a repository on Docker Hub.
keywords: Docker Hub, Hub, repository content, push
title: Push images to a repository
linkTitle: Push images
weight: 30
---
@y
---
description: Learn how to add content to a repository on Docker Hub.
keywords: Docker Hub, Hub, repository content, push
title: Push images to a repository
linkTitle: Push images
weight: 30
---
@z

@x
To add content to a repository on Docker Hub, you need to tag your Docker image
and then push it to your repository. This process lets you share your
images with others or use them in different environments.
@y
To add content to a repository on Docker Hub, you need to tag your Docker image
and then push it to your repository. This process lets you share your
images with others or use them in different environments.
@z

@x
1. Tag your Docker image.
@y
1. Tag your Docker image.
@z

@x
   The `docker tag` command assigns a tag to your Docker image, which includes
   your Docker Hub namespace and the repository name. The general syntax is:
@y
   The `docker tag` command assigns a tag to your Docker image, which includes
   your Docker Hub namespace and the repository name. The general syntax is:
@z

@x
   ```console
   $ docker tag [SOURCE_IMAGE[:TAG]] [NAMESPACE/REPOSITORY[:TAG]]
   ```
@y
   ```console
   $ docker tag [SOURCE_IMAGE[:TAG]] [NAMESPACE/REPOSITORY[:TAG]]
   ```
@z

@x
   Example:
@y
   Example:
@z

@x
   If your local image is called `my-app` and you want to tag it for the
   repository `my-namespace/my-repo` with the tag `v1.0`, run:
@y
   If your local image is called `my-app` and you want to tag it for the
   repository `my-namespace/my-repo` with the tag `v1.0`, run:
@z

@x
   ```console
   $ docker tag my-app my-namespace/my-repo:v1.0
   ```
@y
   ```console
   $ docker tag my-app my-namespace/my-repo:v1.0
   ```
@z

@x
2. Push the image to Docker Hub.
@y
2. Push the image to Docker Hub.
@z

@x
   Use the `docker push` command to upload your tagged image to the specified
   repository on Docker Hub.
@y
   Use the `docker push` command to upload your tagged image to the specified
   repository on Docker Hub.
@z

@x
   Example:
@y
   Example:
@z

@x
   ```console
   $ docker push my-app my-namespace/my-repo:v1.0
   ```
@y
   ```console
   $ docker push my-app my-namespace/my-repo:v1.0
   ```
@z

@x
   This command pushes the image tagged `v1.0` to the `my-namespace/my-repo` repository.
@y
   This command pushes the image tagged `v1.0` to the `my-namespace/my-repo` repository.
@z

@x
3. Verify the image on Docker Hub.
@y
3. Verify the image on Docker Hub.
@z
