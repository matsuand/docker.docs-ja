%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
title: Build your Rust image
linkTitle: Build images
@y
title: Build your Rust image
linkTitle: Build images
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
## Choose a base image
@y
## Choose a base image
@z

@x
> [!TIP]
>
> [Gordon](/ai/gordon/), Docker's AI assistant, can generate Docker assets for your project. Ask Gordon to create a Dockerfile, Compose file, and `.dockerignore` tailored to your application.
@y
> [!TIP]
>
> [Gordon](__SUBDIR__/ai/gordon/), Docker's AI assistant, can generate Docker assets for your project. Ask Gordon to create a Dockerfile, Compose file, and `.dockerignore` tailored to your application.
@z

@x
Before editing your Dockerfile, you need to choose a base image. You can use the [Rust Docker Official Image](https://hub.docker.com/_/rust),  
or a [Docker Hardened Image (DHI)](https://hub.docker.com/hardened-images/catalog/dhi/rust).
@y
Before editing your Dockerfile, you need to choose a base image. You can use the [Rust Docker Official Image](https://hub.docker.com/_/rust),  
or a [Docker Hardened Image (DHI)](https://hub.docker.com/hardened-images/catalog/dhi/rust).
@z

@x
Docker Hardened Images (DHIs) are minimal, secure, and production-ready base images maintained by Docker.  
They help reduce vulnerabilities and simplify compliance. For more details, see [Docker Hardened Images](/dhi/).
@y
Docker Hardened Images (DHIs) are minimal, secure, and production-ready base images maintained by Docker.  
They help reduce vulnerabilities and simplify compliance. For more details, see [Docker Hardened Images](__SUBDIR__/dhi/).
@z

@x
{{< tabs >}}
{{< tab name="Using Docker Hardened Images" >}}
@y
{{< tabs >}}
{{< tab name="Using Docker Hardened Images" >}}
@z

@x
Docker Hardened Images (DHIs) are publicly available and can be used directly as base images.
To pull Docker Hardened Images, authenticate once with Docker:
@y
Docker Hardened Images (DHIs) are publicly available and can be used directly as base images.
To pull Docker Hardened Images, authenticate once with Docker:
@z

% snip command...

@x
Use DHIs from the dhi.io registry, for example:
@y
Use DHIs from the dhi.io registry, for example:
@z

% snip command...

@x
The following Dockerfile uses a Rust DHI as the build base image:
@y
The following Dockerfile uses a Rust DHI as the build base image:
@z

@x within code
# Make sure RUST_VERSION matches the Rust version
@y
# Make sure RUST_VERSION matches the Rust version
@z
@x
# Create a stage for building the application.
@y
# Create a stage for building the application.
@z
@x
# Install host build dependencies.
@y
# Install host build dependencies.
@z
@x
# Build the application.
@y
# Build the application.
@z
@x
# Create a new stage for running the application that contains the minimal
# We use dhi.io/static for the final stage because it’s a minimal Docker Hardened Image runtime (basically “just # enough OS to run the binary”), which helps keep the image small and with a lower attack surface compared to a # # full Alpine/Debian runtime.
@y
# Create a new stage for running the application that contains the minimal
# We use dhi.io/static for the final stage because it’s a minimal Docker Hardened Image runtime (basically “just # enough OS to run the binary”), which helps keep the image small and with a lower attack surface compared to a # # full Alpine/Debian runtime.
@z
@x
# Copy the executable from the "build" stage.
@y
# Copy the executable from the "build" stage.
@z
@x
# Configure rocket to listen on all interfaces.
@y
# Configure rocket to listen on all interfaces.
@z
@x
# Expose the port that the application listens on.
@y
# Expose the port that the application listens on.
@z
@x
# What the container should run when it is started.
@y
# What the container should run when it is started.
@z

@x
{{< /tab >}}
{{< tab name="Using the Docker Official Images" >}}
@y
{{< /tab >}}
{{< tab name="Using the Docker Official Images" >}}
@z

@x within code
# Pin the Rust toolchain version used in the build stage.
@y
# Pin the Rust toolchain version used in the build stage.
@z
@x
# Name of the compiled binary produced by Cargo (must match Cargo.toml package name).
@y
# Name of the compiled binary produced by Cargo (must match Cargo.toml package name).
@z
@x
# Build stage (DOI Rust image)
# This stage compiles the application.
@y
# Build stage (DOI Rust image)
# This stage compiles the application.
@z
@x
# Re-declare args inside the stage if you want to use them here.
@y
# Re-declare args inside the stage if you want to use them here.
@z
@x
# All build steps happen inside /app.
@y
# All build steps happen inside /app.
@z
@x
# Install build dependencies needed to compile Rust crates on Alpine
@y
# Install build dependencies needed to compile Rust crates on Alpine
@z
@x
# Build the application 
@y
# Build the application 
@z
@x
# Runtime stage (DOI Alpine image)
# This stage runs the already-compiled binary with minimal dependencies.
@y
# Runtime stage (DOI Alpine image)
# This stage runs the already-compiled binary with minimal dependencies.
@z
@x
# Create a non-privileged user (recommended best practice)
@y
# Create a non-privileged user (recommended best practice)
@z
@x
# Drop privileges for runtime.
@y
# Drop privileges for runtime.
@z
@x
# Copy only the compiled binary from the build stage.
@y
# Copy only the compiled binary from the build stage.
@z
@x
# Rocket: listen on all interfaces inside the container.
@y
# Rocket: listen on all interfaces inside the container.
@z
@x
# Document the port your app listens on.
@y
# Document the port your app listens on.
@z
@x
# Start the application.
@y
# Start the application.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
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
The [`.dockerignore`](/reference/dockerfile.md#dockerignore-file) file specifies patterns and paths that you don't want copied into the image in order to keep the image as small as possible. Open up the `.dockerignore` file in your favorite IDE or text editor to review its contents.
@y
The [`.dockerignore`](reference/dockerfile.md#dockerignore-file) file specifies patterns and paths that you don't want copied into the image in order to keep the image as small as possible. Open up the `.dockerignore` file in your favorite IDE or text editor to review its contents.
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
You should see at least one image listed, including the image you just built `docker-rust-image-dhi:latest`.
@y
You should see at least one image listed, including the image you just built `docker-rust-image-dhi:latest`.
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
You can see that two images start with `docker-rust-image-dhi`. You know they're the same image because if you take a look at the `IMAGE ID` column, you can see that the values are the same for the two images.
@y
You can see that two images start with `docker-rust-image-dhi`. You know they're the same image because if you take a look at the `IMAGE ID` column, you can see that the values are the same for the two images.
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
Docker removed the image tagged with `:v1.0.0`, but the `docker-rust-image-dhi:latest` tag is available on your machine.
@y
Docker removed the image tagged with `:v1.0.0`, but the `docker-rust-image-dhi:latest` tag is available on your machine.
@z

@x
## Summary
@y
## Summary
@z

@x
This section showed how to create a Dockerfile and `.dockerignore` file for a Rust application, build an image, and tag and list images.
@y
This section showed how to create a Dockerfile and `.dockerignore` file for a Rust application, build an image, and tag and list images.
@z

@x
Related information:
@y
Related information:
@z

@x
- [Dockerfile reference](/reference/dockerfile.md)
- [.dockerignore file](/reference/dockerfile.md#dockerignore-file)
- [docker build CLI reference](/reference/cli/docker/buildx/build/)
- [Docker Hardened Images](/dhi/)
@y
- [Dockerfile reference](reference/dockerfile.md)
- [.dockerignore file](reference/dockerfile.md#dockerignore-file)
- [docker build CLI reference](__SUBDIR__/reference/cli/docker/buildx/build/)
- [Docker Hardened Images](__SUBDIR__/dhi/)
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
