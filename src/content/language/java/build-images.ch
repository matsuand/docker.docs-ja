%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Build your Java image
keywords: Java, build, images, dockerfile
description: Learn how to build your first Docker image by writing a Dockerfile
---
@y
---
title: Build your Java image
keywords: Java, build, images, dockerfile
description: Learn how to build your first Docker image by writing a Dockerfile
---
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
* You understand basic [Docker concepts](../../get-started/overview.md).
* You're familiar with the [Dockerfile format](../../build/building/packaging.md#dockerfile).
* You have [enabled BuildKit](../../build/buildkit/index.md#getting-started)
  on your machine.
@y
* You understand basic [Docker concepts](../../get-started/overview.md).
* You're familiar with the [Dockerfile format](../../build/building/packaging.md#dockerfile).
* You have [enabled BuildKit](../../build/buildkit/index.md#getting-started)
  on your machine.
@z

@x
## Overview
@y
## Overview
@z

@x
Now that you have a good overview of containers and the Docker platform, take a look at building your first image. An image includes everything needed to run an application - the code or binary, runtime, dependencies, and any other file system objects required.
@y
Now that you have a good overview of containers and the Docker platform, take a look at building your first image. An image includes everything needed to run an application - the code or binary, runtime, dependencies, and any other file system objects required.
@z

@x
To complete this tutorial, you need the following:
@y
To complete this tutorial, you need the following:
@z

@x
- Docker running locally. Follow the instructions to [download and install Docker](../../get-docker.md)
- A Git client
- An IDE or a text editor to edit files. Docker recommends using [IntelliJ Community Edition](https://www.jetbrains.com/idea/download/).
@y
- Docker running locally. Follow the instructions to [download and install Docker](../../get-docker.md)
- A Git client
- An IDE or a text editor to edit files. Docker recommends using [IntelliJ Community Edition](https://www.jetbrains.com/idea/download/).
@z

@x
## Sample application
@y
## Sample application
@z

@x
Clone the sample application that you'll be using in this module to your local development machine. Run the following commands in a terminal to clone the repository.
@y
Clone the sample application that you'll be using in this module to your local development machine. Run the following commands in a terminal to clone the repository.
@z

@x
```console
$ cd /path/to/working/directory
$ git clone https://github.com/spring-projects/spring-petclinic.git
$ cd spring-petclinic
```
@y
```console
$ cd /path/to/working/directory
$ git clone https://github.com/spring-projects/spring-petclinic.git
$ cd spring-petclinic
```
@z

@x
## Create a Dockerfile for Java
@y
## Create a Dockerfile for Java
@z

@x
Create a file named `Dockerfile` in the root of your project folder.
@y
Create a file named `Dockerfile` in the root of your project folder.
@z

@x
Next, you need to add a line in your Dockerfile that tells Docker what base
image you would like to use for your application. Open the `Dockerfile` in an IDE or text editor, and then add the following contents.
@y
Next, you need to add a line in your Dockerfile that tells Docker what base
image you would like to use for your application. Open the `Dockerfile` in an IDE or text editor, and then add the following contents.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
FROM eclipse-temurin:17-jdk-jammy
```
@y
FROM eclipse-temurin:17-jdk-jammy
```
@z

@x
Docker images can be inherited from other images. For this guide, you use Eclipse Temurin, one of the most popular official images with a build-worthy JDK.
@y
Docker images can be inherited from other images. For this guide, you use Eclipse Temurin, one of the most popular official images with a build-worthy JDK.
@z

@x
To make things easier when running the rest of your commands, set the image's
working directory. This instructs Docker to use this path as the default location
for all subsequent commands. By doing this, you don't have to type out full file
paths but can use relative paths based on the working directory.
@y
To make things easier when running the rest of your commands, set the image's
working directory. This instructs Docker to use this path as the default location
for all subsequent commands. By doing this, you don't have to type out full file
paths but can use relative paths based on the working directory.
@z

@x
```dockerfile
WORKDIR /app
```
@y
```dockerfile
WORKDIR /app
```
@z

@x
Usually, the first thing you do once you’ve downloaded a project written in
Java which is using Maven for project management is to install dependencies.
@y
Usually, the first thing you do once you’ve downloaded a project written in
Java which is using Maven for project management is to install dependencies.
@z

@x
Before you can run `mvnw dependency`, you need to get the Maven wrapper and your
`pom.xml` file into your image. You'll use the `COPY` command to do this. The
`COPY` command takes two parameters. The first parameter tells Docker what
file(s) you would like to copy into the image. The second parameter tells Docker
where you want that file(s) to be copied to. You'll copy all those files and
directories into your working directory - `/app`.
@y
Before you can run `mvnw dependency`, you need to get the Maven wrapper and your
`pom.xml` file into your image. You'll use the `COPY` command to do this. The
`COPY` command takes two parameters. The first parameter tells Docker what
file(s) you would like to copy into the image. The second parameter tells Docker
where you want that file(s) to be copied to. You'll copy all those files and
directories into your working directory - `/app`.
@z

@x
```dockerfile
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
```
@y
```dockerfile
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
```
@z

@x
Once you have your `pom.xml` file inside the image, you can use the `RUN`
command to run the command `mvnw dependency:resolve`. This works exactly the
same way as if you were running `mvnw` (or `mvn`) dependency locally on your
machine, but this time the dependencies will be installed into the image.
@y
Once you have your `pom.xml` file inside the image, you can use the `RUN`
command to run the command `mvnw dependency:resolve`. This works exactly the
same way as if you were running `mvnw` (or `mvn`) dependency locally on your
machine, but this time the dependencies will be installed into the image.
@z

@x
```dockerfile
RUN ./mvnw dependency:resolve
```
@y
```dockerfile
RUN ./mvnw dependency:resolve
```
@z

@x
At this point, you have an Eclipse Temurin image that's based on OpenJDK version 17, and you have also installed your dependencies. The next thing you need to do is to add your source code into the image. You'll use the `COPY` command just like you did with your `pom.xml` file in the previous steps.
@y
At this point, you have an Eclipse Temurin image that's based on OpenJDK version 17, and you have also installed your dependencies. The next thing you need to do is to add your source code into the image. You'll use the `COPY` command just like you did with your `pom.xml` file in the previous steps.
@z

@x
```dockerfile
COPY src ./src
```
@y
```dockerfile
COPY src ./src
```
@z

@x
This `COPY` command takes all the files located in the current directory and copies them into the image. Now, all you have to do is to tell Docker what command you want to run when your image is ran inside a container. You do this using the `CMD` command.
@y
This `COPY` command takes all the files located in the current directory and copies them into the image. Now, all you have to do is to tell Docker what command you want to run when your image is ran inside a container. You do this using the `CMD` command.
@z

@x
```dockerfile
CMD ["./mvnw", "spring-boot:run"]
```
@y
```dockerfile
CMD ["./mvnw", "spring-boot:run"]
```
@z

@x
Here's the complete Dockerfile.
@y
Here's the complete Dockerfile.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
FROM eclipse-temurin:17-jdk-jammy
@y
FROM eclipse-temurin:17-jdk-jammy
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:resolve
@y
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:resolve
@z

@x
COPY src ./src
@y
COPY src ./src
@z

@x
CMD ["./mvnw", "spring-boot:run"]
```
@y
CMD ["./mvnw", "spring-boot:run"]
```
@z

@x
### Create a `.dockerignore` file
@y
### Create a `.dockerignore` file
@z

@x
To increase the performance of the build, and as a general best practice, Docker recommends that you create a `.dockerignore` file in the same directory as the Dockerfile. For this tutorial, your `.dockerignore` file should contain just one line:
@y
To increase the performance of the build, and as a general best practice, Docker recommends that you create a `.dockerignore` file in the same directory as the Dockerfile. For this tutorial, your `.dockerignore` file should contain just one line:
@z

@x
```text
target
```
@y
```text
target
```
@z

@x
This line excludes the `target` directory, which contains output from Maven,
from the Docker [build context](../../build/building/context.md). There are many
good reasons to carefully structure a `.dockerignore` file, but this one-line
file is good enough for now.
@y
This line excludes the `target` directory, which contains output from Maven,
from the Docker [build context](../../build/building/context.md). There are many
good reasons to carefully structure a `.dockerignore` file, but this one-line
file is good enough for now.
@z

@x
## Build an image
@y
## Build an image
@z

@x
Now that you’ve created our Dockerfile, build your image. To do this, you use the `docker build` command. The `docker build` command builds Docker images from a Dockerfile and a “context”. A build’s context is the set of files located in the specified PATH or URL. The Docker build process can access any of the files located in this context.
@y
Now that you’ve created our Dockerfile, build your image. To do this, you use the `docker build` command. The `docker build` command builds Docker images from a Dockerfile and a “context”. A build’s context is the set of files located in the specified PATH or URL. The Docker build process can access any of the files located in this context.
@z

@x
The build command optionally takes a `--tag` flag. The tag is used to set the name of the image and an optional tag in the format `name:tag`. You'll leave off the optional `tag` for now to help simplify things. If you don't pass a tag, Docker uses “latest” as its default tag. You can see this in the last line of the build output.
@y
The build command optionally takes a `--tag` flag. The tag is used to set the name of the image and an optional tag in the format `name:tag`. You'll leave off the optional `tag` for now to help simplify things. If you don't pass a tag, Docker uses “latest” as its default tag. You can see this in the last line of the build output.
@z

@x
Build your first Docker image.
@y
Build your first Docker image.
@z

@x
```console
$ docker build --tag java-docker .
```
@y
```console
$ docker build --tag java-docker .
```
@z

@x
```console
Sending build context to Docker daemon  5.632kB
Step 1/7 : FROM eclipse-temurin:17-jdk-jammy
Step 2/7 : WORKDIR /app
...
Successfully built a0bb458aabd0
Successfully tagged java-docker:latest
```
@y
```console
Sending build context to Docker daemon  5.632kB
Step 1/7 : FROM eclipse-temurin:17-jdk-jammy
Step 2/7 : WORKDIR /app
...
Successfully built a0bb458aabd0
Successfully tagged java-docker:latest
```
@z

@x
## View local images
@y
## View local images
@z

@x
To see a list of images you have on our local machine, you have two options. One is to use the CLI and the other is to use [Docker Desktop](../../desktop/use-desktop/images.md). As you are currently working in the terminal, list the images using the CLI.
@y
To see a list of images you have on our local machine, you have two options. One is to use the CLI and the other is to use [Docker Desktop](../../desktop/use-desktop/images.md). As you are currently working in the terminal, list the images using the CLI.
@z

@x
To list images, run the `docker images` command.
@y
To list images, run the `docker images` command.
@z

@x
```console
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED          SIZE
java-docker         latest              b1b5f29f74f0        47 minutes ago   567MB
```
@y
```console
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED          SIZE
java-docker         latest              b1b5f29f74f0        47 minutes ago   567MB
```
@z

@x
You should see at least the image you just built `java-docker:latest`.
@y
You should see at least the image you just built `java-docker:latest`.
@z

@x
## Tag images
@y
## Tag images
@z

@x
An image name is made up of slash-separated name components. Name components may contain lowercase letters, digits, and separators. A separator is defined as a period, one or two underscores, or one or more dashes. A name component may not start or end with a separator.
@y
An image name is made up of slash-separated name components. Name components may contain lowercase letters, digits, and separators. A separator is defined as a period, one or two underscores, or one or more dashes. A name component may not start or end with a separator.
@z

@x
An image is made up of a manifest and a list of layers. Don't worry too much about manifests and layers at this point other than a “tag” points to a combination of these artifacts. You can have multiple tags for an image. Create a second tag for the image you built and take a look at its layers.
@y
An image is made up of a manifest and a list of layers. Don't worry too much about manifests and layers at this point other than a “tag” points to a combination of these artifacts. You can have multiple tags for an image. Create a second tag for the image you built and take a look at its layers.
@z

@x
To create a new tag for the image you’ve built in the previous steps, run the following command:
@y
To create a new tag for the image you’ve built in the previous steps, run the following command:
@z

@x
```console
$ docker tag java-docker:latest java-docker:v1.0.0
```
@y
```console
$ docker tag java-docker:latest java-docker:v1.0.0
```
@z

@x
The `docker tag` command creates a new tag for an image. It doesn't create a new image. The tag points to the same image and is just another way to reference the image.
@y
The `docker tag` command creates a new tag for an image. It doesn't create a new image. The tag points to the same image and is just another way to reference the image.
@z

@x
Now, run the `docker images` command to see a list of your local images.
@y
Now, run the `docker images` command to see a list of your local images.
@z

@x
```console
$ docker images
REPOSITORY    TAG      IMAGE ID		  CREATED		  SIZE
java-docker   latest   b1b5f29f74f0	  59 minutes ago	567MB
java-docker   v1.0.0   b1b5f29f74f0	  59 minutes ago	567MB
```
@y
```console
$ docker images
REPOSITORY    TAG      IMAGE ID		  CREATED		  SIZE
java-docker   latest   b1b5f29f74f0	  59 minutes ago	567MB
java-docker   v1.0.0   b1b5f29f74f0	  59 minutes ago	567MB
```
@z

@x
You can see that you have two images that start with `java-docker`. You know they're the same image because if you take a look at the `IMAGE ID` column, you can see that the values are the same for the two images.
@y
You can see that you have two images that start with `java-docker`. You know they're the same image because if you take a look at the `IMAGE ID` column, you can see that the values are the same for the two images.
@z

@x
Remove the tag that you just created. To do this, you’ll use the `rmi` command. The `rmi` command stands for “remove image”.
@y
Remove the tag that you just created. To do this, you’ll use the `rmi` command. The `rmi` command stands for “remove image”.
@z

@x
```console
$ docker rmi java-docker:v1.0.0
Untagged: java-docker:v1.0.0
```
@y
```console
$ docker rmi java-docker:v1.0.0
Untagged: java-docker:v1.0.0
```
@z

@x
Note that the response from Docker tells you that the image hasn't been removed but only “untagged”. You can check this by running the `docker images` command.
@y
Note that the response from Docker tells you that the image hasn't been removed but only “untagged”. You can check this by running the `docker images` command.
@z

@x
```console
$ docker images
REPOSITORY      TAG     IMAGE ID        CREATED              SIZE
java-docker    	latest	b1b5f29f74f0	59 minutes ago	     567MB
```
@y
```console
$ docker images
REPOSITORY      TAG     IMAGE ID        CREATED              SIZE
java-docker    	latest	b1b5f29f74f0	59 minutes ago	     567MB
```
@z

@x
Your image that was tagged with `:v1.0.0` has been removed, but you still have the `java-docker:latest` tag available on your machine.
@y
Your image that was tagged with `:v1.0.0` has been removed, but you still have the `java-docker:latest` tag available on your machine.
@z

@x
## Next steps
@y
## Next steps
@z

@x
In this module, you took a look at setting up an example Java application that you'll use for the rest of the tutorial. You also created a Dockerfile that you used to build your Docker image. Then, you took a look at tagging your images and removing images. In the next module, you’ll take a look at how to run your image as a container.
@y
In this module, you took a look at setting up an example Java application that you'll use for the rest of the tutorial. You also created a Dockerfile that you used to build your Docker image. Then, you took a look at tagging your images and removing images. In the next module, you’ll take a look at how to run your image as a container.
@z

@x
{{< button text="Run your image as a container" url="run-containers.md" >}}
@y
{{< button text="Run your image as a container" url="run-containers.md" >}}
@z
