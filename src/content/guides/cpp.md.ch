%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: C++ language-specific guide
linkTitle: C++
description: Containerize and develop C++ applications using Docker.
keywords: getting started, c++
summary: |
  This guide explains how to containerize C++ applications using Docker.
@y
title: C++ language-specific guide
linkTitle: C++
description: Containerize and develop C++ applications using Docker.
keywords: getting started, c++
summary: |
  This guide explains how to containerize C++ applications using Docker.
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
The C++ getting started guide teaches you how to create a containerized C++ application using Docker. In this guide, you'll learn how to:
@y
The C++ getting started guide teaches you how to create a containerized C++ application using Docker. In this guide, you'll learn how to:
@z

@x
> **Acknowledgment**
>
> Docker would like to thank [Pradumna Saraf](https://twitter.com/pradumna_saraf) and [Mohammad-Ali A'râbi](https://twitter.com/MohammadAliEN) for their contribution to this guide.
@y
> **Acknowledgment**
>
> Docker would like to thank [Pradumna Saraf](https://twitter.com/pradumna_saraf) and [Mohammad-Ali A'râbi](https://twitter.com/MohammadAliEN) for their contribution to this guide.
@z

@x
- Containerize and run a C++ application using a multi-stage Docker build
- Build and run a C++ application using Docker Compose
- Set up a local environment to develop a C++ application using containers
@y
- Containerize and run a C++ application using a multi-stage Docker build
- Build and run a C++ application using Docker Compose
- Set up a local environment to develop a C++ application using containers
@z

@x
After completing the C++ getting started modules, you should be able to containerize your own C++ application based on the examples and instructions provided in this guide.
@y
After completing the C++ getting started modules, you should be able to containerize your own C++ application based on the examples and instructions provided in this guide.
@z

@x
Start by containerizing an existing C++ application.
@y
Start by containerizing an existing C++ application.
@z

@x
## Create a multi-stage build for your C++ application
@y
## Create a multi-stage build for your C++ application
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
- You have a [Git client](https://git-scm.com/downloads). The examples in this section use a command-line based Git client, but you can use any client.
@y
- You have a [Git client](https://git-scm.com/downloads). The examples in this section use a command-line based Git client, but you can use any client.
@z

@x
### Overview
@y
### Overview
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
### Get the sample application
@y
### Get the sample application
@z

@x
Let's use a simple C++ application that prints `Hello, World!` to the terminal. To do so, clone the sample repository to use with this guide:
@y
Let's use a simple C++ application that prints `Hello, World!` to the terminal. To do so, clone the sample repository to use with this guide:
@z

@x
```bash
$ git clone https://github.com/dockersamples/c-plus-plus-docker.git
```
@y
```bash
$ git clone https://github.com/dockersamples/c-plus-plus-docker.git
```
@z

@x
The example for this section is under the `hello` directory in the repository. Get inside it and take a look at the files:
@y
The example for this section is under the `hello` directory in the repository. Get inside it and take a look at the files:
@z

@x
```bash
$ cd c-plus-plus-docker/hello
$ ls
```
@y
```bash
$ cd c-plus-plus-docker/hello
$ ls
```
@z

@x
You should see the following files:
@y
You should see the following files:
@z

@x
```text
Dockerfile  hello.cpp
```
@y
```text
Dockerfile  hello.cpp
```
@z

@x
### Check the Dockerfile
@y
### Check the Dockerfile
@z

@x
Open the `Dockerfile` in an IDE or text editor. The `Dockerfile` contains the instructions for building the Docker image.
@y
Open the `Dockerfile` in an IDE or text editor. The `Dockerfile` contains the instructions for building the Docker image.
@z

@x
```Dockerfile
# Stage 1: Build stage
FROM ubuntu:latest AS build
@y
```Dockerfile
# Stage 1: Build stage
FROM ubuntu:latest AS build
@z

@x
# Install build-essential for compiling C++ code
RUN apt-get update && apt-get install -y build-essential
@y
# Install build-essential for compiling C++ code
RUN apt-get update && apt-get install -y build-essential
@z

@x
# Set the working directory
WORKDIR /app
@y
# Set the working directory
WORKDIR /app
@z

@x
# Copy the source code into the container
COPY hello.cpp .
@y
# Copy the source code into the container
COPY hello.cpp .
@z

@x
# Compile the C++ code statically to ensure it doesn't depend on runtime libraries
RUN g++ -o hello hello.cpp -static
@y
# Compile the C++ code statically to ensure it doesn't depend on runtime libraries
RUN g++ -o hello hello.cpp -static
@z

@x
# Stage 2: Runtime stage
FROM scratch
@y
# Stage 2: Runtime stage
FROM scratch
@z

@x
# Copy the static binary from the build stage
COPY --from=build /app/hello /hello
@y
# Copy the static binary from the build stage
COPY --from=build /app/hello /hello
@z

@x
# Command to run the binary
CMD ["/hello"]
```
@y
# Command to run the binary
CMD ["/hello"]
```
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
### Build the Docker image
@y
### Build the Docker image
@z

@x
To build the Docker image, run the following command in the `hello` directory:
@y
To build the Docker image, run the following command in the `hello` directory:
@z

@x
```bash
$ docker build -t hello .
```
@y
```bash
$ docker build -t hello .
```
@z

@x
The `-t` flag tags the image with the name `hello`.
@y
The `-t` flag tags the image with the name `hello`.
@z

@x
### Run the Docker container
@y
### Run the Docker container
@z

@x
To run the Docker container, use the following command:
@y
To run the Docker container, use the following command:
@z

@x
```bash
$ docker run hello
```
@y
```bash
$ docker run hello
```
@z

@x
You should see the output `Hello, World!` in the terminal.
@y
You should see the output `Hello, World!` in the terminal.
@z

@x
Because the final image uses an empty `scratch` base, it contains only the
static binary and none of the build dependencies or usual OS tools. For
example, you can't run a simple `ls` command in the container:
@y
Because the final image uses an empty `scratch` base, it contains only the
static binary and none of the build dependencies or usual OS tools. For
example, you can't run a simple `ls` command in the container:
@z

@x
```bash
$ docker run hello ls
```
@y
```bash
$ docker run hello ls
```
@z

@x
The absence of a shell and other tools keeps the image small and reduces its
attack surface.
@y
The absence of a shell and other tools keeps the image small and reduces its
attack surface.
@z

@x
## Containerize a C++ application
@y
## Containerize a C++ application
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
- You have a [Git client](https://git-scm.com/downloads). The examples in this section use a command-line based Git client, but you can use any client.
@y
- You have a [Git client](https://git-scm.com/downloads). The examples in this section use a command-line based Git client, but you can use any client.
@z

@x
### Overview
@y
### Overview
@z

@x
This section walks you through containerizing and running a C++ application, using Docker Compose.
@y
This section walks you through containerizing and running a C++ application, using Docker Compose.
@z

@x
### Get the sample application
@y
### Get the sample application
@z

@x
We're using the same sample repository that you used in the previous sections of this guide. If you haven't already cloned the repository, clone it now:
@y
We're using the same sample repository that you used in the previous sections of this guide. If you haven't already cloned the repository, clone it now:
@z

@x
```console
$ git clone https://github.com/dockersamples/c-plus-plus-docker.git
```
@y
```console
$ git clone https://github.com/dockersamples/c-plus-plus-docker.git
```
@z

@x
You should now have the following contents in your `c-plus-plus-docker` (root)
directory.
@y
You should now have the following contents in your `c-plus-plus-docker` (root)
directory.
@z

@x
```text
├── c-plus-plus-docker/
│ ├── compose.yml
│ ├── Dockerfile
│ ├── LICENSE
│ ├── ok_api.cpp
│ └── README.md
@y
```text
├── c-plus-plus-docker/
│ ├── compose.yml
│ ├── Dockerfile
│ ├── LICENSE
│ ├── ok_api.cpp
│ └── README.md
@z

@x
```
@y
```
@z

@x
To learn more about the files in the repository, see the following:
@y
To learn more about the files in the repository, see the following:
@z

@x
- [Dockerfile](/reference/dockerfile.md)
- [.dockerignore](/reference/dockerfile.md#dockerignore-file)
- [compose.yml](/reference/compose-file/_index.md)
@y
- [Dockerfile](reference/dockerfile.md)
- [.dockerignore](reference/dockerfile.md#dockerignore-file)
- [compose.yml](reference/compose-file/_index.md)
@z

@x
### Run the application
@y
### Run the application
@z

@x
Inside the `c-plus-plus-docker` directory, run the following command in a
terminal.
@y
Inside the `c-plus-plus-docker` directory, run the following command in a
terminal.
@z

@x
```console
$ docker compose up --build
```
@y
```console
$ docker compose up --build
```
@z

@x
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You will see a message `{"Status" : "OK"}` in the browser.
@y
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You will see a message `{"Status" : "OK"}` in the browser.
@z

@x
In the terminal, press `ctrl`+`c` to stop the application.
@y
In the terminal, press `ctrl`+`c` to stop the application.
@z

@x
#### Run the application in the background
@y
#### Run the application in the background
@z

@x
You can run the application detached from the terminal by adding the `-d`
option. Inside the `c-plus-plus-docker` directory, run the following command
in a terminal.
@y
You can run the application detached from the terminal by adding the `-d`
option. Inside the `c-plus-plus-docker` directory, run the following command
in a terminal.
@z

@x
```console
$ docker compose up --build -d
```
@y
```console
$ docker compose up --build -d
```
@z

@x
Open a browser and view the application at [http://localhost:8080](http://localhost:8080).
@y
Open a browser and view the application at [http://localhost:8080](http://localhost:8080).
@z

@x
In the terminal, run the following command to stop the application.
@y
In the terminal, run the following command to stop the application.
@z

@x
```console
$ docker compose down
```
@y
```console
$ docker compose down
```
@z

@x
For more information about Compose commands, see the [Compose CLI
reference](/reference/cli/docker/compose/).
@y
For more information about Compose commands, see the [Compose CLI
reference](__SUBDIR__/reference/cli/docker/compose/).
@z

@x
## Use containers for C++ development
@y
## Use containers for C++ development
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Complete [Containerize a C++ application](#containerize-a-c-application).
@y
Complete [Containerize a C++ application](#containerize-a-c-application).
@z

@x
### Overview
@y
### Overview
@z

@x
In this section, you'll learn how to set up a development environment for your containerized application. This includes:
@y
In this section, you'll learn how to set up a development environment for your containerized application. This includes:
@z

@x
- Configuring Compose to automatically update your running Compose services as you edit and save your code
@y
- Configuring Compose to automatically update your running Compose services as you edit and save your code
@z

@x
### Get the sample application
@y
### Get the sample application
@z

@x
Clone the sample application to use with this guide. Open a terminal, change directory to a directory that you want to work in, and run the following command to clone the repository:
@y
Clone the sample application to use with this guide. Open a terminal, change directory to a directory that you want to work in, and run the following command to clone the repository:
@z

@x
```console
$ git clone https://github.com/dockersamples/c-plus-plus-docker.git && cd c-plus-plus-docker
```
@y
```console
$ git clone https://github.com/dockersamples/c-plus-plus-docker.git && cd c-plus-plus-docker
```
@z

@x
### Automatically update services
@y
### Automatically update services
@z

@x
Use Compose Watch to automatically update your running Compose services as you
edit and save your code. For more details about Compose Watch, see [Use Compose
Watch](/manuals/compose/how-tos/file-watch.md).
@y
Use Compose Watch to automatically update your running Compose services as you
edit and save your code. For more details about Compose Watch, see [Use Compose
Watch](manuals/compose/how-tos/file-watch.md).
@z

@x
Open your `compose.yml` file in an IDE or text editor and then add the Compose Watch instructions. The following example shows how to add Compose Watch to your `compose.yml` file.
@y
Open your `compose.yml` file in an IDE or text editor and then add the Compose Watch instructions. The following example shows how to add Compose Watch to your `compose.yml` file.
@z

@x
```yaml {hl_lines="11-14",linenos=true}
services:
  ok-api:
    image: ok-api
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "8080:8080"
    develop:
      watch:
        - action: rebuild
          path: .
```
@y
```yaml {hl_lines="11-14",linenos=true}
services:
  ok-api:
    image: ok-api
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "8080:8080"
    develop:
      watch:
        - action: rebuild
          path: .
```
@z

@x
Run the following command to run your application with Compose Watch.
@y
Run the following command to run your application with Compose Watch.
@z

@x
```console
$ docker compose watch
```
@y
```console
$ docker compose watch
```
@z

@x
Now, if you modify your `ok_api.cpp` you will see the changes in real time without re-building the image.
@y
Now, if you modify your `ok_api.cpp` you will see the changes in real time without re-building the image.
@z

@x
To test it out, open the `ok_api.cpp` file in your favorite text editor and change the message from `{"Status" : "OK"}` to `{"Status" : "Updated"}`. Save the file and refresh your browser at [http://localhost:8080](http://localhost:8080). You should see the updated message.
@y
To test it out, open the `ok_api.cpp` file in your favorite text editor and change the message from `{"Status" : "OK"}` to `{"Status" : "Updated"}`. Save the file and refresh your browser at [http://localhost:8080](http://localhost:8080). You should see the updated message.
@z

@x
Press `ctrl+c` in the terminal to stop your application.
@y
Press `ctrl+c` in the terminal to stop your application.
@z

@x
### Summary
@y
### Summary
@z

@x
In this section, you also learned how to use Compose Watch to automatically rebuild and run your container when you update your code.
@y
In this section, you also learned how to use Compose Watch to automatically rebuild and run your container when you update your code.
@z

@x
Related information:
@y
Related information:
@z

@x
- [Compose file reference](/reference/compose-file/)
- [Compose file watch](/manuals/compose/how-tos/file-watch.md)
- [Multi-stage builds](/manuals/build/building/multi-stage.md)
@y
- [Compose file reference](__SUBDIR__/reference/compose-file/)
- [Compose file watch](manuals/compose/how-tos/file-watch.md)
- [Multi-stage builds](manuals/build/building/multi-stage.md)
@z
