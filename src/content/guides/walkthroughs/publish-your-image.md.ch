%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Publish your image
keywords: get started, quick start, intro, concepts
description: Learn how to publish your image to Docker Hub
aliases:
- /get-started/publish-your-own-image/
---
@y
---
title: Publish your image
keywords: get started, quick start, intro, concepts
description: Learn how to publish your image to Docker Hub
aliases:
- /get-started/publish-your-own-image/
---
@z

@x
Follow this walkthrough to learn how to publish and share your images on Docker Hub.
@y
Follow this walkthrough to learn how to publish and share your images on Docker Hub.
@z

@x
{{< include "guides-get-docker.md" >}}
@y
{{< include "guides-get-docker.md" >}}
@z

@x
## Step 1: Get the example image
@y
## Step 1: Get the example image
@z

@x
To get the example image:
@y
To get the example image:
@z

@x
1. In Docker Desktop, select the search bar.
2. In the search bar, specify `docker/welcome-to-docker`.
3. Select **Pull** to pull the image from Docker Hub to you computer.
@y
1. In Docker Desktop, select the search bar.
2. In the search bar, specify `docker/welcome-to-docker`.
3. Select **Pull** to pull the image from Docker Hub to you computer.
@z

@x
![Search Docker Desktop for the welcome-to-docker image](images/getting-started-search.webp?w=650&border=true)
@y
![Search Docker Desktop for the welcome-to-docker image](images/getting-started-search.webp?w=650&border=true)
@z

@x
## Step 2: Sign in to Docker
@y
## Step 2: Sign in to Docker
@z

@x
Select **Sign in** on the top-right of Docker Desktop to either sign in or create a new Docker account.
@y
Select **Sign in** on the top-right of Docker Desktop to either sign in or create a new Docker account.
@z

@x
![Signing in to Docker Desktop](images/getting-started-signin.webp?w=300&border=true)
@y
![Signing in to Docker Desktop](images/getting-started-signin.webp?w=300&border=true)
@z

@x
## Step 3: Rename your image
@y
## Step 3: Rename your image
@z

@x
Before you can publish your image, you need to rename it so that Docker Hub knows that the image is yours. In a terminal, run the following command to rename your image. Replace `YOUR-USERNAME` with your Docker ID.
@y
Before you can publish your image, you need to rename it so that Docker Hub knows that the image is yours. In a terminal, run the following command to rename your image. Replace `YOUR-USERNAME` with your Docker ID.
@z

@x
{{< include "open-terminal.md" >}}
@y
{{< include "open-terminal.md" >}}
@z

@x
```console
$ docker tag docker/welcome-to-docker YOUR-USERNAME/welcome-to-docker
```
@y
```console
$ docker tag docker/welcome-to-docker YOUR-USERNAME/welcome-to-docker
```
@z

@x
## Step 4: Push your image to Docker Hub
@y
## Step 4: Push your image to Docker Hub
@z

@x
To push your image to Docker Hub:
@y
To push your image to Docker Hub:
@z

@x
1. In Docker Desktop, go to the **Images** tab
2. In the **Actions** column for your image, select the **Show image actions** icon.
3. Select **Push to Hub**.
@y
1. In Docker Desktop, go to the **Images** tab
2. In the **Actions** column for your image, select the **Show image actions** icon.
3. Select **Push to Hub**.
@z

@x
![Pushing an image to Docker Hub](images/getting-started-push.webp?border=true)
@y
![Pushing an image to Docker Hub](images/getting-started-push.webp?border=true)
@z

@x
Go to [Docker Hub](https://hub.docker.com)⁠ and verify that the list of your repositories now contains `YOUR-USERNAME/welcome-to-docker`.
@y
Go to [Docker Hub](https://hub.docker.com)⁠ and verify that the list of your repositories now contains `YOUR-USERNAME/welcome-to-docker`.
@z

@x
## Summary
@y
## Summary
@z

@x
In this walkthrough, you pushed and shared an image on Docker Hub.
@y
In this walkthrough, you pushed and shared an image on Docker Hub.
@z

@x
Related information:
@y
Related information:
@z

@x
- Deep dive into the [Docker Hub manual](../../docker-hub/_index.md)
- Learn more about the [docker tag](../../engine/reference/commandline/tag.md)
  command
@y
- Deep dive into the [Docker Hub manual](../../docker-hub/_index.md)
- Learn more about the [docker tag](../../engine/reference/commandline/tag.md)
  command
@z

@x
## Next steps
@y
## Next steps
@z

@x
Continue to the language-specific guides to learn how you can use Docker to containerize and develop applications in your favorite language. Choose one of the following guides.
@y
Continue to the language-specific guides to learn how you can use Docker to containerize and develop applications in your favorite language. Choose one of the following guides.
@z

@x
- [C# (.NET)](../../language/dotnet/_index.md)
- [Go](../../language/golang/_index.md)
- [Java](../../language/java/_index.md)
- [Node.js](../../language/nodejs/_index.md)
- [PHP](../../language/php/_index.md)
- [Python](../../language/python/_index.md)
- [Rust](../../language/rust/_index.md)
@y
- [C# (.NET)](../../language/dotnet/_index.md)
- [Go](../../language/golang/_index.md)
- [Java](../../language/java/_index.md)
- [Node.js](../../language/nodejs/_index.md)
- [PHP](../../language/php/_index.md)
- [Python](../../language/python/_index.md)
- [Rust](../../language/rust/_index.md)
@z
