%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Build your Rust image
keywords: rust, build, images, dockerfile
description: Learn how to build your first Rust Docker image
---
@y
---
title: Build your Rust image
keywords: rust, build, images, dockerfile
description: Learn how to build your first Rust Docker image
---
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
* You have installed the latest version of [Docker Desktop](../../get-docker.md).
* You have a [git client](https://git-scm.com/downloads). The examples in this section use a command-line based git client, but you can use any client.
@y
* You have installed the latest version of [Docker Desktop](../../get-docker.md).
* You have a [git client](https://git-scm.com/downloads). The examples in this section use a command-line based git client, but you can use any client.
@z

@x
## Overview
@y
## Overview
@z

@x
This guide walks you through building your first Rust image. An image
includes everything needed to run an application - the code or binary, runtime,
dependencies, and any other file system objects required.
@y
This guide walks you through building your first Rust image. An image
includes everything needed to run an application - the code or binary, runtime,
dependencies, and any other file system objects required.
@z

@x
## Get the sample application
@y
## Get the sample application
@z

@x
Clone the sample application to use with this guide. Open a terminal, change directory to a directory that you want to work in, and run the following command to clone the repository:
@y
Clone the sample application to use with this guide. Open a terminal, change directory to a directory that you want to work in, and run the following command to clone the repository:
@z

@x
```console
$ git clone https://github.com/docker/docker-rust-hello
```
@y
```console
$ git clone https://github.com/docker/docker-rust-hello
```
@z

@x
## Create a Dockerfile for Rust
@y
## Create a Dockerfile for Rust
@z

@x
Now that you have an application, you can use `docker init` to create a
Dockerfile for it. Inside the `docker-rust-hello` directory, run the `docker
init` command. `docker init` provides some default configuration, but you'll
need to answer a few questions about your application. Refer to the following
example to answer the prompts from `docker init` and use the same answers for
your prompts.
@y
Now that you have an application, you can use `docker init` to create a
Dockerfile for it. Inside the `docker-rust-hello` directory, run the `docker
init` command. `docker init` provides some default configuration, but you'll
need to answer a few questions about your application. Refer to the following
example to answer the prompts from `docker init` and use the same answers for
your prompts.
@z

@x
```console
$ docker init
Welcome to the Docker Init CLI!
@y
```console
$ docker init
Welcome to the Docker Init CLI!
@z

@x
This utility will walk you through creating the following files with sensible defaults for your project:
  - .dockerignore
  - Dockerfile
  - compose.yaml
  - README.Docker.md
@y
This utility will walk you through creating the following files with sensible defaults for your project:
  - .dockerignore
  - Dockerfile
  - compose.yaml
  - README.Docker.md
@z

@x
Let's get started!
@y
Let's get started!
@z

@x
? What application platform does your project use? Rust
? What version of Rust do you want to use? 1.70.0
? What port does your server listen on? 8000
```
@y
? What application platform does your project use? Rust
? What version of Rust do you want to use? 1.70.0
? What port does your server listen on? 8000
```
@z

@x
You should now have the following new files in your `docker-rust-hello`
directory:
 - Dockerfile
 - .dockerignore
 - compose.yaml
 - README.Docker.md
@y
You should now have the following new files in your `docker-rust-hello`
directory:
 - Dockerfile
 - .dockerignore
 - compose.yaml
 - README.Docker.md
@z

@x
For building an image, only the Dockerfile is necessary. Open the Dockerfile
in your favorite IDE or text editor and see what it contains. To learn more
about Dockerfiles, see the [Dockerfile reference](../../engine/reference/builder.md).
@y
For building an image, only the Dockerfile is necessary. Open the Dockerfile
in your favorite IDE or text editor and see what it contains. To learn more
about Dockerfiles, see the [Dockerfile reference](../../engine/reference/builder.md).
@z

@x
## .dockerignore file
@y
## .dockerignore file
@z

@x
When you run `docker init`, it also creates a [`.dockerignore`](../../engine/reference/builder.md#dockerignore-file) file. Use the `.dockerignore` file to specify patterns and paths that you don't want copied into the image in order to keep the image as small as possible. Open up the `.dockerignore` file in your favorite IDE or text editor and see what's inside already.
@y
When you run `docker init`, it also creates a [`.dockerignore`](../../engine/reference/builder.md#dockerignore-file) file. Use the `.dockerignore` file to specify patterns and paths that you don't want copied into the image in order to keep the image as small as possible. Open up the `.dockerignore` file in your favorite IDE or text editor and see what's inside already.
@z

@x
## Build an image
@y
## Build an image
@z

@x
Now that you’ve created the Dockerfile, you can build the image. To do this, use
the `docker build` command. The `docker build` command builds Docker images from
a Dockerfile and a context. A build's context is the set of files located in
the specified PATH or URL. The Docker build process can access any of the files
located in this context.
@y
Now that you’ve created the Dockerfile, you can build the image. To do this, use
the `docker build` command. The `docker build` command builds Docker images from
a Dockerfile and a context. A build's context is the set of files located in
the specified PATH or URL. The Docker build process can access any of the files
located in this context.
@z

@x
The build command optionally takes a `--tag` flag. The tag sets the name of the
image and an optional tag in the format `name:tag`. If you don't pass a tag,
Docker uses "latest" as its default tag.
@y
The build command optionally takes a `--tag` flag. The tag sets the name of the
image and an optional tag in the format `name:tag`. If you don't pass a tag,
Docker uses "latest" as its default tag.
@z

@x
Build the Docker image.
@y
Build the Docker image.
@z

@x
```console
$ docker build --tag docker-rust-image .
```
@y
```console
$ docker build --tag docker-rust-image .
```
@z

@x
You should see output like the following.
@y
You should see output like the following.
@z

@x
```console
[+] Building 62.6s (14/14) FINISHED
 => [internal] load .dockerignore                                                                                                    0.1s
 => => transferring context: 2B                                                                                                      0.0s 
 => [internal] load build definition from Dockerfile                                                                                 0.1s
 => => transferring dockerfile: 2.70kB                                                                                               0.0s 
 => resolve image config for docker.io/docker/dockerfile:1                                                                           2.3s
 => CACHED docker-image://docker.io/docker/dockerfile:1@sha256:39b85bbfa7536a5feceb7372a0817649ecb2724562a38360f4d6a7782a409b14      0.0s
 => [internal] load metadata for docker.io/library/debian:bullseye-slim                                                              1.9s
 => [internal] load metadata for docker.io/library/rust:1.70.0-slim-bullseye                                                         1.7s 
 => [build 1/3] FROM docker.io/library/rust:1.70.0-slim-bullseye@sha256:585eeddab1ec712dade54381e115f676bba239b1c79198832ddda397c1f  0.0s
 => [internal] load build context                                                                                                    0.0s 
 => => transferring context: 35.29kB                                                                                                 0.0s 
 => [final 1/3] FROM docker.io/library/debian:bullseye-slim@sha256:7606bef5684b393434f06a50a3d1a09808fee5a0240d37da5d181b1b121e7637  0.0s 
 => CACHED [build 2/3] WORKDIR /app                                                                                                  0.0s
 => [build 3/3] RUN --mount=type=bind,source=src,target=src     --mount=type=bind,source=Cargo.toml,target=Cargo.toml     --mount=  57.7s 
 => CACHED [final 2/3] RUN adduser     --disabled-password     --gecos ""     --home "/nonexistent"     --shell "/sbin/nologin"      0.0s
 => CACHED [final 3/3] COPY --from=build /bin/server /bin/                                                                           0.0s
 => exporting to image                                                                                                               0.0s
 => => exporting layers                                                                                                              0.0s
 => => writing image sha256:f1aa4a9f58d2ecf73b0c2b7f28a6646d9849b32c3921e42adc3ab75e12a3de14                                         0.0s
 => => naming to docker.io/library/docker-rust-image
```
@y
```console
[+] Building 62.6s (14/14) FINISHED
 => [internal] load .dockerignore                                                                                                    0.1s
 => => transferring context: 2B                                                                                                      0.0s 
 => [internal] load build definition from Dockerfile                                                                                 0.1s
 => => transferring dockerfile: 2.70kB                                                                                               0.0s 
 => resolve image config for docker.io/docker/dockerfile:1                                                                           2.3s
 => CACHED docker-image://docker.io/docker/dockerfile:1@sha256:39b85bbfa7536a5feceb7372a0817649ecb2724562a38360f4d6a7782a409b14      0.0s
 => [internal] load metadata for docker.io/library/debian:bullseye-slim                                                              1.9s
 => [internal] load metadata for docker.io/library/rust:1.70.0-slim-bullseye                                                         1.7s 
 => [build 1/3] FROM docker.io/library/rust:1.70.0-slim-bullseye@sha256:585eeddab1ec712dade54381e115f676bba239b1c79198832ddda397c1f  0.0s
 => [internal] load build context                                                                                                    0.0s 
 => => transferring context: 35.29kB                                                                                                 0.0s 
 => [final 1/3] FROM docker.io/library/debian:bullseye-slim@sha256:7606bef5684b393434f06a50a3d1a09808fee5a0240d37da5d181b1b121e7637  0.0s 
 => CACHED [build 2/3] WORKDIR /app                                                                                                  0.0s
 => [build 3/3] RUN --mount=type=bind,source=src,target=src     --mount=type=bind,source=Cargo.toml,target=Cargo.toml     --mount=  57.7s 
 => CACHED [final 2/3] RUN adduser     --disabled-password     --gecos ""     --home "/nonexistent"     --shell "/sbin/nologin"      0.0s
 => CACHED [final 3/3] COPY --from=build /bin/server /bin/                                                                           0.0s
 => exporting to image                                                                                                               0.0s
 => => exporting layers                                                                                                              0.0s
 => => writing image sha256:f1aa4a9f58d2ecf73b0c2b7f28a6646d9849b32c3921e42adc3ab75e12a3de14                                         0.0s
 => => naming to docker.io/library/docker-rust-image
```
@z

@x
## View local images
@y
## View local images
@z

@x
To see a list of images you have on your local machine, you have two options. One is to use the Docker CLI and the other is to use [Docker Desktop](../../desktop/use-desktop/images.md). As you are working in the terminal already, take a look at listing images using the CLI.
@y
To see a list of images you have on your local machine, you have two options. One is to use the Docker CLI and the other is to use [Docker Desktop](../../desktop/use-desktop/images.md). As you are working in the terminal already, take a look at listing images using the CLI.
@z

@x
To list images, run the `docker images` command.
@y
To list images, run the `docker images` command.
@z

@x
```console
$ docker images
REPOSITORY                TAG               IMAGE ID       CREATED         SIZE
docker-rust-image         latest            8cae92a8fbd6   3 minutes ago   123MB
```
@y
```console
$ docker images
REPOSITORY                TAG               IMAGE ID       CREATED         SIZE
docker-rust-image         latest            8cae92a8fbd6   3 minutes ago   123MB
```
@z

@x
You should see at least one image listed, including the image you just built `docker-rust-image:latest`.
@y
You should see at least one image listed, including the image you just built `docker-rust-image:latest`.
@z

@x
## Tag images
@y
## Tag images
@z

@x
As mentioned earlier, an image name is made up of slash-separated name components. Name components may contain lowercase letters, digits, and separators. A separator can include a period, one or two underscores, or one or more dashes. A name component may not start or end with a separator.
@y
As mentioned earlier, an image name is made up of slash-separated name components. Name components may contain lowercase letters, digits, and separators. A separator can include a period, one or two underscores, or one or more dashes. A name component may not start or end with a separator.
@z

@x
An image is made up of a manifest and a list of layers. Don't worry too much about manifests and layers at this point other than a "tag" points to a combination of these artifacts. You can have multiple tags for an image. Create a second tag for the image you built and take a look at its layers.
@y
An image is made up of a manifest and a list of layers. Don't worry too much about manifests and layers at this point other than a "tag" points to a combination of these artifacts. You can have multiple tags for an image. Create a second tag for the image you built and take a look at its layers.
@z

@x
To create a new tag for the image you built, run the following command.
@y
To create a new tag for the image you built, run the following command.
@z

@x
```console
$ docker tag docker-rust-image:latest docker-rust-image:v1.0.0
```
@y
```console
$ docker tag docker-rust-image:latest docker-rust-image:v1.0.0
```
@z

@x
The `docker tag` command creates a new tag for an image. It doesn't create a new image. The tag points to the same image and is just another way to reference the image.
@y
The `docker tag` command creates a new tag for an image. It doesn't create a new image. The tag points to the same image and is just another way to reference the image.
@z

@x
Now, run the `docker images` command to see a list of the local images.
@y
Now, run the `docker images` command to see a list of the local images.
@z

@x
```console
$ docker images
REPOSITORY                TAG               IMAGE ID       CREATED         SIZE
docker-rust-image         latest            8cae92a8fbd6   4 minutes ago   123MB
docker-rust-image         v1.0.0            8cae92a8fbd6   4 minutes ago   123MB
rust                      latest            be5d294735c6   4 minutes ago   113MB
```
@y
```console
$ docker images
REPOSITORY                TAG               IMAGE ID       CREATED         SIZE
docker-rust-image         latest            8cae92a8fbd6   4 minutes ago   123MB
docker-rust-image         v1.0.0            8cae92a8fbd6   4 minutes ago   123MB
rust                      latest            be5d294735c6   4 minutes ago   113MB
```
@z

@x
You can see that two images start with `docker-rust-image`. You know they're the same image because if you take a look at the `IMAGE ID` column, you can see that the values are the same for the two images.
@y
You can see that two images start with `docker-rust-image`. You know they're the same image because if you take a look at the `IMAGE ID` column, you can see that the values are the same for the two images.
@z

@x
Remove the tag you just created. To do this, use the `rmi` command. The `rmi` command stands for remove image.
@y
Remove the tag you just created. To do this, use the `rmi` command. The `rmi` command stands for remove image.
@z

@x
```console
$ docker rmi docker-rust-image:v1.0.0
Untagged: docker-rust-image:v1.0.0
```
@y
```console
$ docker rmi docker-rust-image:v1.0.0
Untagged: docker-rust-image:v1.0.0
```
@z

@x
Note that the response from Docker tells you that Docker didn't remove the image, but only "untagged" it. You can check this by running the `docker images` command.
@y
Note that the response from Docker tells you that Docker didn't remove the image, but only "untagged" it. You can check this by running the `docker images` command.
@z

@x
```console
$ docker images
REPOSITORY               TAG               IMAGE ID       CREATED         SIZE
docker-rust-image        latest            8cae92a8fbd6   6 minutes ago   123MB
rust                     latest            be5d294735c6   6 minutes ago   113MB
```
@y
```console
$ docker images
REPOSITORY               TAG               IMAGE ID       CREATED         SIZE
docker-rust-image        latest            8cae92a8fbd6   6 minutes ago   123MB
rust                     latest            be5d294735c6   6 minutes ago   113MB
```
@z

@x
Docker removed the image tagged with `:v1.0.0`, but the `docker-rust-image:latest` tag is available on your machine.
@y
Docker removed the image tagged with `:v1.0.0`, but the `docker-rust-image:latest` tag is available on your machine.
@z

@x
## Summary
@y
## Summary
@z

@x
This section showed how you can use `docker init` to create a Dockerfile and .dockerignore file for a Rust application. It then showed you how to build an image. And finally, it showed you how to tag an image and list all images.
@y
This section showed how you can use `docker init` to create a Dockerfile and .dockerignore file for a Rust application. It then showed you how to build an image. And finally, it showed you how to tag an image and list all images.
@z

@x
Related information:
 - [Dockerfile reference](../../engine/reference/builder.md)
 - [.dockerignore file](../../engine/reference/builder.md#dockerignore-file)
 - [docker init CLI reference](../../engine/reference/commandline/init.md)
 - [docker build CLI reference](../../engine/reference/commandline/build.md)
@y
Related information:
 - [Dockerfile reference](../../engine/reference/builder.md)
 - [.dockerignore file](../../engine/reference/builder.md#dockerignore-file)
 - [docker init CLI reference](../../engine/reference/commandline/init.md)
 - [docker build CLI reference](../../engine/reference/commandline/build.md)
@z

@x
## Next steps
@y
## Next steps
@z

@x
In the next section learn how to run your image as a container.
@y
In the next section learn how to run your image as a container.
@z

@x
{{< button text="Run the image as a container" url="run-containers.md" >}}
@y
{{< button text="Run the image as a container" url="run-containers.md" >}}
@z
