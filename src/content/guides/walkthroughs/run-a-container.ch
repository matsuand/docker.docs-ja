%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: How do I run a container?
keywords: get started, quick start, intro, concepts
description: Learn how to build your own image and run it as a container
aliases:
- /get-started/run-your-own-container/
---
@y
---
title: コンテナーの起動方法
keywords: get started, quick start, intro, concepts
description: Learn how to build your own image and run it as a container
aliases:
- /get-started/run-your-own-container/
---
@z

@x
In this walkthrough, you'll learn the basic steps of building an image and running your own container. This walkthrough uses a sample Node.js application, but it's not necessary to know Node.js.
@y
In this walkthrough, you'll learn the basic steps of building an image and running your own container. This walkthrough uses a sample Node.js application, but it's not necessary to know Node.js.
@z

@x
![Running an image in Docker Desktop](images/getting-started-run-intro.webp?w=450&border=true)
@y
![Running an image in Docker Desktop](images/getting-started-run-intro.webp?w=450&border=true)
@z

@x
{{< include "guides-get-docker.md" >}}
@y
{{< include "guides-get-docker.md" >}}
@z

@x
## Step 1: Get the sample application
@y
## Step 1: Get the sample application
@z

@x
If you have git, you can clone the repository for the sample application. Otherwise, you can download the sample application. Choose one of the following options.
@y
If you have git, you can clone the repository for the sample application. Otherwise, you can download the sample application. Choose one of the following options.
@z

@x
{{< tabs >}}
{{< tab name="Clone with git" >}}
@y
{{< tabs >}}
{{< tab name="Clone with git" >}}
@z

@x
Use the following command in a terminal to clone the sample application repository.
@y
Use the following command in a terminal to clone the sample application repository.
@z

@x
```console
$ git clone https://github.com/docker/welcome-to-docker
```
@y
```console
$ git clone https://github.com/docker/welcome-to-docker
```
@z

@x
{{< /tab >}}
{{< tab name="Download" >}}
@y
{{< /tab >}}
{{< tab name="Download" >}}
@z

@x
Download the source and extract it.
@y
Download the source and extract it.
@z

@x
{{< button url="https://github.com/docker/welcome-to-docker/archive/refs/heads/main.zip" text="Download the source" >}}
@y
{{< button url="https://github.com/docker/welcome-to-docker/archive/refs/heads/main.zip" text="Download the source" >}}
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Step 2: View the Dockerfile in your project folder
@y
## Step 2: View the Dockerfile in your project folder
@z

@x
To run your code in a container, the most fundamental thing you need is a
Dockerfile. A Dockerfile describes what goes into a container. This sample already contains a `Dockerfile`. For your own projects, you'll need to create your own `Dockerfile`. You can open the `Dockerfile` in a code or text editor and explore its contents.
@y
To run your code in a container, the most fundamental thing you need is a
Dockerfile. A Dockerfile describes what goes into a container. This sample already contains a `Dockerfile`. For your own projects, you'll need to create your own `Dockerfile`. You can open the `Dockerfile` in a code or text editor and explore its contents.
@z

@x
## Step 3: Build your first image
@y
## Step 3: Build your first image
@z

@x
You always need an image to run a container. In a terminal, run the following commands to build the image. Replace `/path/to/welcome-to-docker/` with the path to your `welcome-to-docker` directory.
@y
You always need an image to run a container. In a terminal, run the following commands to build the image. Replace `/path/to/welcome-to-docker/` with the path to your `welcome-to-docker` directory.
@z

@x
{{< include "open-terminal.md" >}}
@y
{{< include "open-terminal.md" >}}
@z

@x
```console
$ cd /path/to/welcome-to-docker/
```
```console
$ docker build -t welcome-to-docker .
```
@y
```console
$ cd /path/to/welcome-to-docker/
```
```console
$ docker build -t welcome-to-docker .
```
@z

@x
In the previous command, the `-t` flag tags your image with a name,
`welcome-to-docker` in this case. And the `.` lets Docker know where it can find
the Dockerfile.
@y
In the previous command, the `-t` flag tags your image with a name,
`welcome-to-docker` in this case. And the `.` lets Docker know where it can find
the Dockerfile.
@z

@x
Building the image may take some time. After your image is built, you can view your image in the **Images** tab in Docker Desktop.
@y
Building the image may take some time. After your image is built, you can view your image in the **Images** tab in Docker Desktop.
@z

@x
## Step 4: Run your container
@y
## Step 4: Run your container
@z

@x
To run your image as a container:
@y
To run your image as a container:
@z

@x
1. In Docker Desktop, go to the **Images** tab.
2. Next to your image, select **Run**.
3. Expand the **Optional settings**.
4. In **Host port**, specify `8089`.
   ![Specifying host port 8089](images/getting-started-run-image.webp?w=500&border=true)
5. Select **Run**.
@y
1. In Docker Desktop, go to the **Images** tab.
2. Next to your image, select **Run**.
3. Expand the **Optional settings**.
4. In **Host port**, specify `8089`.
   ![Specifying host port 8089](images/getting-started-run-image.webp?w=500&border=true)
5. Select **Run**.
@z

@x
## Step 5: View the frontend
@y
## Step 5: View the frontend
@z

@x
You can use Docker Desktop to access your running container. Select the link next to your container in Docker Desktop or go to [http://localhost:8089](http://localhost:8089) to view the frontend.
@y
You can use Docker Desktop to access your running container. Select the link next to your container in Docker Desktop or go to [http://localhost:8089](http://localhost:8089) to view the frontend.
@z

@x
![Selecting the container link](images/getting-started-frontend-2.webp?border=true)
@y
![Selecting the container link](images/getting-started-frontend-2.webp?border=true)
@z

@x
## Summary
@y
## Summary
@z

@x
In this walkthrough, you built your own image and ran it as a container. In addition to building and running your own images, you can run images from Docker Hub.
@y
In this walkthrough, you built your own image and ran it as a container. In addition to building and running your own images, you can run images from Docker Hub.
@z

@x
Related information:
@y
Related information:
@z

@x
- Deep dive into building images in the [Build with Docker guide](../../build/guide/_index.md)
@y
- Deep dive into building images in the [Build with Docker guide](../../build/guide/_index.md)
@z

@x
## Next steps
@y
## Next steps
@z

@x
Continue to the next walkthrough to learn how you can run one of over 100,000 pre-made images from Docker Hub.
@y
Continue to the next walkthrough to learn how you can run one of over 100,000 pre-made images from Docker Hub.
@z

@x
{{< button url="./run-hub-images.md" text="Run Docker Hub images" >}}
@y
{{< button url="./run-hub-images.md" text="Run Docker Hub images" >}}
@z
