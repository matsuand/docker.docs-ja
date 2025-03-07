%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
title: Build your Rust image
linkTitle: Build images
@y
title: Rust イメージのビルド
linkTitle: イメージのビルド
@z

@x
keywords: rust, build, images, dockerfile
description: Learn how to build your first Rust Docker image
@y
keywords: rust, build, images, dockerfile
description: Learn how to build your first Rust Docker image
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- You have installed the latest version of [Docker Desktop](/get-started/get-docker.md).
- You have a [git client](https://git-scm.com/downloads). The examples in this section use a command-line based git client, but you can use any client.
@y
- You have installed the latest version of [Docker Desktop](get-started/get-docker.md).
- You have a [git client](https://git-scm.com/downloads). The examples in this section use a command-line based git client, but you can use any client.
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

% snip command...

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

% snip command...

@x
You should now have the following new files in your `docker-rust-hello`
directory:
@y
You should now have the following new files in your `docker-rust-hello`
directory:
@z

@x
- Dockerfile
- .dockerignore
- compose.yaml
- README.Docker.md
@y
- Dockerfile
- .dockerignore
- compose.yaml
- README.Docker.md
@z

@x
For building an image, only the Dockerfile is necessary. Open the Dockerfile
in your favorite IDE or text editor and see what it contains. To learn more
about Dockerfiles, see the [Dockerfile reference](/reference/dockerfile.md).
@y
For building an image, only the Dockerfile is necessary. Open the Dockerfile
in your favorite IDE or text editor and see what it contains. To learn more
about Dockerfiles, see the [Dockerfile reference](reference/dockerfile.md).
@z

@x
## .dockerignore file
@y
## .dockerignore file
@z

@x
When you run `docker init`, it also creates a [`.dockerignore`](/reference/dockerfile.md#dockerignore-file) file. Use the `.dockerignore` file to specify patterns and paths that you don't want copied into the image in order to keep the image as small as possible. Open up the `.dockerignore` file in your favorite IDE or text editor and see what's inside already.
@y
When you run `docker init`, it also creates a [`.dockerignore`](reference/dockerfile.md#dockerignore-file) file. Use the `.dockerignore` file to specify patterns and paths that you don't want copied into the image in order to keep the image as small as possible. Open up the `.dockerignore` file in your favorite IDE or text editor and see what's inside already.
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

% snip command...

@x
You should see output like the following.
@y
You should see output like the following.
@z

% snip output...

@x
## View local images
@y
## View local images
@z

@x
To see a list of images you have on your local machine, you have two options. One is to use the Docker CLI and the other is to use [Docker Desktop](/manuals/desktop/use-desktop/images.md). As you are working in the terminal already, take a look at listing images using the CLI.
@y
To see a list of images you have on your local machine, you have two options. One is to use the Docker CLI and the other is to use [Docker Desktop](manuals/desktop/use-desktop/images.md). As you are working in the terminal already, take a look at listing images using the CLI.
@z

@x
To list images, run the `docker images` command.
@y
To list images, run the `docker images` command.
@z

% snip command...

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

% snip command...

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

% snip command...

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

% snip command...

@x
Note that the response from Docker tells you that Docker didn't remove the image, but only "untagged" it. You can check this by running the `docker images` command.
@y
Note that the response from Docker tells you that Docker didn't remove the image, but only "untagged" it. You can check this by running the `docker images` command.
@z

% snip command...

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
@y
Related information:
@z

@x
- [Dockerfile reference](/reference/dockerfile.md)
- [.dockerignore file](/reference/dockerfile.md#dockerignore-file)
- [docker init CLI reference](/reference/cli/docker/init.md)
- [docker build CLI reference](/reference/cli/docker/buildx/build.md)
@y
- [Dockerfile reference](reference/dockerfile.md)
- [.dockerignore file](reference/dockerfile.md#dockerignore-file)
- [docker init CLI reference](reference/cli/docker/init.md)
- [docker build CLI reference](reference/cli/docker/buildx/build.md)
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
