%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Containerize your application
keywords: get started, quick start, intro, concepts
description: Learn how to containerize your application.
---
@y
---
title: Containerize your application
keywords: get started, quick start, intro, concepts
description: Learn how to containerize your application.
---
@z

@x
When working with containers, you typically need to create a `Dockerfile` to define your image and a `compose.yaml` file to define how to run it.
@y
When working with containers, you typically need to create a `Dockerfile` to define your image and a `compose.yaml` file to define how to run it.
@z

@x
To help you create these files, Docker Desktop has the `docker init` command. Run this command in a terminal within your project folder. `docker init` creates all the required files to containerize your application. This walkthrough shows you how this works.
@y
To help you create these files, Docker Desktop has the `docker init` command. Run this command in a terminal within your project folder. `docker init` creates all the required files to containerize your application. This walkthrough shows you how this works.
@z

@x
{{< include "guides-get-docker.md" >}}
@y
{{< include "guides-get-docker.md" >}}
@z

@x
## Step 1: Run the command to create Docker assets
@y
## Step 1: Run the command to create Docker assets
@z

@x
Choose one of your own applications that you would like to containerize, and in a terminal, run the following commands. Replace `/path/to/your/project/` with the directory containing your project.
@y
Choose one of your own applications that you would like to containerize, and in a terminal, run the following commands. Replace `/path/to/your/project/` with the directory containing your project.
@z

@x
{{< include "open-terminal.md" >}}
@y
{{< include "open-terminal.md" >}}
@z

@x
```console
$ cd /path/to/your/project/
```
```console
$ docker init
```
@y
```console
$ cd /path/to/your/project/
```
```console
$ docker init
```
@z

@x
## Step 2: Follow the on-screen prompts
@y
## Step 2: Follow the on-screen prompts
@z

@x
`docker init` walks you through a few questions to configure your project with sensible defaults. Specify your answers and press `Enter`.
@y
`docker init` walks you through a few questions to configure your project with sensible defaults. Specify your answers and press `Enter`.
@z

@x
## Step 3: Try to run your application
@y
## Step 3: Try to run your application
@z

@x
Once you have answered all the questions, run the following commands in a terminal to run your project. Replace `/path/to/your/project/` with the directory containing your project.
@y
Once you have answered all the questions, run the following commands in a terminal to run your project. Replace `/path/to/your/project/` with the directory containing your project.
@z

@x
```console
$ cd /path/to/your/project/
```
```console
$ docker compose up
```
@y
```console
$ cd /path/to/your/project/
```
```console
$ docker compose up
```
@z

@x
## Step 4: Update the Docker assets
@y
## Step 4: Update the Docker assets
@z

@x
The `docker init` command tries its best to do the heavy lifting for you, but sometimes there's some assembly required. In this case, you can refer to the [Dockerfile reference⁠](/engine/reference/builder/) and [Compose file reference](/compose/compose-file/)⁠ to learn how to update the files created by `docker init`.
@y
The `docker init` command tries its best to do the heavy lifting for you, but sometimes there's some assembly required. In this case, you can refer to the [Dockerfile reference⁠](__SUBDIR__/engine/reference/builder/) and [Compose file reference](__SUBDIR__/compose/compose-file/)⁠ to learn how to update the files created by `docker init`.
@z

@x
## Summary
@y
## Summary
@z

@x
In this walkthrough, you learned how to containerize your own application.
@y
In this walkthrough, you learned how to containerize your own application.
@z

@x
Related information:
@y
Related information:
@z

@x
- Read more about [docker init](../../engine/reference/commandline/init.md)
- Learn more about Docker assets in the [Dockerfile reference⁠](/engine/reference/builder/) and [Compose file reference](/compose/compose-file/)
@y
- Read more about [docker init](__SUBDIR__/engine/reference/commandline/init.md)
- Learn more about Docker assets in the [Dockerfile reference⁠](/engine/reference/builder/) and [Compose file reference](/compose/compose-file/)
@z

@x
## Next steps
@y
## Next steps
@z

@x
Continue to the next walkthrough to learn how to publish an application as an image on Docker Hub.
@y
Continue to the next walkthrough to learn how to publish an application as an image on Docker Hub.
@z

@x
{{< button url="./publish-your-image.md" text="Publish your image" >}}
@y
{{< button url="./publish-your-image.md" text="Publish your image" >}}
@z
