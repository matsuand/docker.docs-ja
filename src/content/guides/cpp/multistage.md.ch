%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Create a multi-stage build for your C++ application
linkTitle: Containerize your app using a multi-stage build
@y
title: Create a multi-stage build for your C++ application
linkTitle: Containerize your app using a multi-stage build
@z

@x
keywords: C++, containerize, multi-stage
description: Learn how to create a multi-stage build for a C++ application.
@y
keywords: C++, containerize, multi-stage
description: Learn how to create a multi-stage build for a C++ application.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- You have a [Git client](https://git-scm.com/downloads). The examples in this section use a command-line based Git client, but you can use any client.
@y
- You have a [Git client](https://git-scm.com/downloads). The examples in this section use a command-line based Git client, but you can use any client.
@z

@x
## Overview
@y
## Overview
@z

@x
This section walks you through creating a multi-stage Docker build for a C++ application.
A multi-stage build is a Docker feature that allows you to use different base images for different stages of the build process,
so you can optimize the size of your final image and separate build dependencies from runtime dependencies.
@y
This section walks you through creating a multi-stage Docker build for a C++ application.
A multi-stage build is a Docker feature that allows you to use different base images for different stages of the build process,
so you can optimize the size of your final image and separate build dependencies from runtime dependencies.
@z

@x
The standard practice for compiled languages like C++ is to have a build stage that compiles the code and a runtime stage that runs the compiled binary,
because the build dependencies are not needed at runtime.
@y
The standard practice for compiled languages like C++ is to have a build stage that compiles the code and a runtime stage that runs the compiled binary,
because the build dependencies are not needed at runtime.
@z

@x
## Get the sample application
@y
## Get the sample application
@z

@x
Let's use a simple C++ application that prints `Hello, World!` to the terminal. To do so, clone the sample repository to use with this guide:
@y
Let's use a simple C++ application that prints `Hello, World!` to the terminal. To do so, clone the sample repository to use with this guide:
@z

% snip command...

@x
The example for this section is under the `hello` directory in the repository. Get inside it and take a look at the files:
@y
The example for this section is under the `hello` directory in the repository. Get inside it and take a look at the files:
@z

% snip command...

@x
You should see the following files:
@y
You should see the following files:
@z

% snip output...

@x
## Check the Dockerfile
@y
## Check the Dockerfile
@z

@x
Open the `Dockerfile` in an IDE or text editor. The `Dockerfile` contains the instructions for building the Docker image.
@y
Open the `Dockerfile` in an IDE or text editor. The `Dockerfile` contains the instructions for building the Docker image.
@z

@x within code
# Stage 1: Build stage
@y
# Stage 1: Build stage
@z
@x
# Install build-essential for compiling C++ code
@y
# Install build-essential for compiling C++ code
@z
@x
# Set the working directory
@y
# Set the working directory
@z
@x
# Copy the source code into the container
@y
# Copy the source code into the container
@z
@x
# Compile the C++ code statically to ensure it doesn't depend on runtime libraries
@y
# Compile the C++ code statically to ensure it doesn't depend on runtime libraries
@z
@x
# Stage 2: Runtime stage
@y
# Stage 2: Runtime stage
@z
@x
# Copy the static binary from the build stage
@y
# Copy the static binary from the build stage
@z
@x
# Command to run the binary
@y
# Command to run the binary
@z

@x
The `Dockerfile` has two stages:
@y
The `Dockerfile` has two stages:
@z

@x
1. **Build stage**: This stage uses the `ubuntu:latest` image to compile the C++ code and create a static binary.
2. **Runtime stage**: This stage uses the `scratch` image, which is an empty image, to copy the static binary from the build stage and run it.
@y
1. **Build stage**: This stage uses the `ubuntu:latest` image to compile the C++ code and create a static binary.
2. **Runtime stage**: This stage uses the `scratch` image, which is an empty image, to copy the static binary from the build stage and run it.
@z

@x
## Build the Docker image
@y
## Build the Docker image
@z

@x
To build the Docker image, run the following command in the `hello` directory:
@y
To build the Docker image, run the following command in the `hello` directory:
@z

% snip command...

@x
The `-t` flag tags the image with the name `hello`.
@y
The `-t` flag tags the image with the name `hello`.
@z

@x
## Run the Docker container
@y
## Run the Docker container
@z

@x
To run the Docker container, use the following command:
@y
To run the Docker container, use the following command:
@z

% snip command...

@x
You should see the output `Hello, World!` in the terminal.
@y
You should see the output `Hello, World!` in the terminal.
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you learned how to create a multi-stage build for a C++ application. Multi-stage builds help you optimize the size of your final image and separate build dependencies from runtime dependencies.
In this example, the final image only contains the static binary and doesn't include any build dependencies.
@y
In this section, you learned how to create a multi-stage build for a C++ application. Multi-stage builds help you optimize the size of your final image and separate build dependencies from runtime dependencies.
In this example, the final image only contains the static binary and doesn't include any build dependencies.
@z

@x
As the image has an empty base, the usual OS tools are also absent. So, for example, you can't run a simple `ls` command in the container:
@y
As the image has an empty base, the usual OS tools are also absent. So, for example, you can't run a simple `ls` command in the container:
@z

% snip command...

@x
This makes the image very lightweight and secure.
@y
This makes the image very lightweight and secure.
@z
