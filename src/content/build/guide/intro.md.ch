%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Introduction
description: An introduction to the Docker Build guide
keywords: build, buildkit, buildx, guide, tutorial, introduction
---
@y
---
title: Introduction
description: An introduction to the Docker Build guide
keywords: build, buildkit, buildx, guide, tutorial, introduction
---
@z

@x
The starting resources for this guide include a simple Go project and a
Dockerfile. From this starting point, the guide illustrates various ways that
you can improve how you build the application with Docker.
@y
The starting resources for this guide include a simple Go project and a
Dockerfile. From this starting point, the guide illustrates various ways that
you can improve how you build the application with Docker.
@z

@x
## Environment setup
@y
## Environment setup
@z

@x
To follow this guide:
@y
To follow this guide:
@z

@x
1. Install [Docker Desktop or Docker Engine](../../get-docker.md)
2. Clone or create a new repository from the
   [application example on GitHub](https://github.com/dockersamples/buildme)
@y
1. Install [Docker Desktop or Docker Engine](../../get-docker.md)
2. Clone or create a new repository from the
   [application example on GitHub](https://github.com/dockersamples/buildme)
@z

@x
## The application
@y
## The application
@z

@x
The example project for this guide is a client-server application for
translating messages to a fictional language.
@y
The example project for this guide is a client-server application for
translating messages to a fictional language.
@z

@x
Here’s an overview of the files included in the project:
@y
Here’s an overview of the files included in the project:
@z

@x
```text
.
├── Dockerfile
├── cmd
│   ├── client
│   │   ├── main.go
│   │   ├── request.go
│   │   └── ui.go
│   └── server
│       ├── main.go
│       └── translate.go
├── go.mod
└── go.sum
```
@y
```text
.
├── Dockerfile
├── cmd
│   ├── client
│   │   ├── main.go
│   │   ├── request.go
│   │   └── ui.go
│   └── server
│       ├── main.go
│       └── translate.go
├── go.mod
└── go.sum
```
@z

@x
The `cmd/` directory contains the code for the two application components:
client and server. The client is a user interface for writing, sending, and
receiving messages. The server receives messages from clients, translates them,
and sends them back to the client.
@y
The `cmd/` directory contains the code for the two application components:
client and server. The client is a user interface for writing, sending, and
receiving messages. The server receives messages from clients, translates them,
and sends them back to the client.
@z

@x
## The Dockerfile
@y
## The Dockerfile
@z

@x
A Dockerfile is a text document in which you define the build steps for your
application. You write the Dockerfile in a domain-specific language, called the
Dockerfile syntax.
@y
A Dockerfile is a text document in which you define the build steps for your
application. You write the Dockerfile in a domain-specific language, called the
Dockerfile syntax.
@z

@x
Here's the Dockerfile used as the starting point for this guide:
@y
Here's the Dockerfile used as the starting point for this guide:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM golang:{{% param "example_go_version" %}}-alpine
WORKDIR /src
COPY . .
RUN go mod download
RUN go build -o /bin/client ./cmd/client
RUN go build -o /bin/server ./cmd/server
ENTRYPOINT [ "/bin/server" ]
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM golang:{{% param "example_go_version" %}}-alpine
WORKDIR /src
COPY . .
RUN go mod download
RUN go build -o /bin/client ./cmd/client
RUN go build -o /bin/server ./cmd/server
ENTRYPOINT [ "/bin/server" ]
```
@z

@x
Here’s what this Dockerfile does:
@y
Here’s what this Dockerfile does:
@z

@x
1. `# syntax=docker/dockerfile:1`
@y
1. `# syntax=docker/dockerfile:1`
@z

@x
   This comment is a
   [Dockerfile parser directive](../../engine/reference/builder.md#parser-directives).
   It specifies which version of the Dockerfile syntax to use. This file uses
   the `dockerfile:1` syntax which is best practice: it ensures that you have
   access to the latest Docker build features.
@y
   This comment is a
   [Dockerfile parser directive](../../engine/reference/builder.md#parser-directives).
   It specifies which version of the Dockerfile syntax to use. This file uses
   the `dockerfile:1` syntax which is best practice: it ensures that you have
   access to the latest Docker build features.
@z

@x
2. `FROM golang:{{% param "example_go_version" %}}-alpine`
@y
2. `FROM golang:{{% param "example_go_version" %}}-alpine`
@z

@x
   The `FROM` instruction uses version `{{% param "example_go_version" %}}-alpine` of the `golang` official image.
@y
   The `FROM` instruction uses version `{{% param "example_go_version" %}}-alpine` of the `golang` official image.
@z

@x
3. `WORKDIR /src`
@y
3. `WORKDIR /src`
@z

@x
   Creates the `/src` working directory inside the container.
@y
   Creates the `/src` working directory inside the container.
@z

@x
4. `COPY . .`
@y
4. `COPY . .`
@z

@x
   Copies the files in the build context to the working directory in the
   container.
@y
   Copies the files in the build context to the working directory in the
   container.
@z

@x
5. `RUN go mod download`
@y
5. `RUN go mod download`
@z

@x
   Downloads the necessary Go modules to the container. Go modules is the
   dependency management tool for the Go programming language, similar to
   `npm install` for JavaScript, or `pip install` for Python.
@y
   Downloads the necessary Go modules to the container. Go modules is the
   dependency management tool for the Go programming language, similar to
   `npm install` for JavaScript, or `pip install` for Python.
@z

@x
6. `RUN go build -o /bin/client ./cmd/client`
@y
6. `RUN go build -o /bin/client ./cmd/client`
@z

@x
   Builds the `client` binary, which is used to send messages to be translated, into the
   `/bin` directory.
@y
   Builds the `client` binary, which is used to send messages to be translated, into the
   `/bin` directory.
@z

@x
7. `RUN go build -o /bin/server ./cmd/server`
@y
7. `RUN go build -o /bin/server ./cmd/server`
@z

@x
   Builds the `server` binary, which listens for client translation requests,
   into the `/bin` directory.
@y
   Builds the `server` binary, which listens for client translation requests,
   into the `/bin` directory.
@z

@x
8. `ENTRYPOINT [ "/bin/server" ]`
@y
8. `ENTRYPOINT [ "/bin/server" ]`
@z

@x
   Specifies a command to run when the container starts. Starts the server
   process.
@y
   Specifies a command to run when the container starts. Starts the server
   process.
@z

@x
## Build the image
@y
## Build the image
@z

@x
To build an image using a Dockerfile, you use the `docker` command-line tool.
The command for building an image is `docker build`.
@y
To build an image using a Dockerfile, you use the `docker` command-line tool.
The command for building an image is `docker build`.
@z

@x
Run the following command to build the image.
@y
Run the following command to build the image.
@z

@x
```console
$ docker build --tag=buildme .
```
@y
```console
$ docker build --tag=buildme .
```
@z

@x
This creates an image with the tag `buildme`. An image tag is the name of the
image.
@y
This creates an image with the tag `buildme`. An image tag is the name of the
image.
@z

@x
## Run the container
@y
## Run the container
@z

@x
The image you just built contains two binaries, one for the server and one for
the client. To see the translation service in action, run a container that hosts
the server component, and then run another container that invokes the client.
@y
The image you just built contains two binaries, one for the server and one for
the client. To see the translation service in action, run a container that hosts
the server component, and then run another container that invokes the client.
@z

@x
To run a container, you use the `docker run` command.
@y
To run a container, you use the `docker run` command.
@z

@x
1. Run a container from the image in detached mode.
@y
1. Run a container from the image in detached mode.
@z

@x
   ```console
   $ docker run --name=buildme --rm --detach buildme
   ```
@y
   ```console
   $ docker run --name=buildme --rm --detach buildme
   ```
@z

@x
   This starts a container named `buildme`.
@y
   This starts a container named `buildme`.
@z

@x
2. Run a new command in the `buildme` container that invokes the client binary.
@y
2. Run a new command in the `buildme` container that invokes the client binary.
@z

@x
   ```console
   $ docker exec -it buildme /bin/client
   ```
@y
   ```console
   $ docker exec -it buildme /bin/client
   ```
@z

@x
The `docker exec` command opens a terminal user interface where you can submit
messages for the backend (server) process to translate.
@y
The `docker exec` command opens a terminal user interface where you can submit
messages for the backend (server) process to translate.
@z

@x
When you're done testing, you can stop the container:
@y
When you're done testing, you can stop the container:
@z

@x
```console
$ docker stop buildme
```
@y
```console
$ docker stop buildme
```
@z

@x
## Summary
@y
## Summary
@z

@x
This section gave you an overview of the example application used in this guide,
an introduction to Dockerfiles and building. You've successfully built a
container image and created a container from it.
@y
This section gave you an overview of the example application used in this guide,
an introduction to Dockerfiles and building. You've successfully built a
container image and created a container from it.
@z

@x
Related information:
@y
Related information:
@z

@x
- [Dockerfile reference](../../engine/reference/builder.md)
- [`docker build` CLI reference](../../engine/reference/commandline/image_build.md)
- [`docker run` CLI reference](../../engine/reference/commandline/container_run.md)
@y
- [Dockerfile reference](../../engine/reference/builder.md)
- [`docker build` CLI reference](../../engine/reference/commandline/image_build.md)
- [`docker run` CLI reference](../../engine/reference/commandline/container_run.md)
@z

@x
## Next steps
@y
## Next steps
@z

@x
The next section explores how you can use layer cache to improve build speed.
@y
The next section explores how you can use layer cache to improve build speed.
@z

@x
{{< button text="Layers" url="layers.md" >}}
@y
{{< button text="Layers" url="layers.md" >}}
@z
