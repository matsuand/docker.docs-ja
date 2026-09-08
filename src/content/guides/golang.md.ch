%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Go language-specific guide
linkTitle: Go
description: Containerize Go apps using Docker
keywords: docker, getting started, go, golang, language, dockerfile
summary: |
  This guide teaches you how to containerize Go applications using Docker.
@y
title: Go language-specific guide
linkTitle: Go
description: Containerize Go apps using Docker
keywords: docker, getting started, go, golang, language, dockerfile
summary: |
  This guide teaches you how to containerize Go applications using Docker.
@z

@x
  time: 30 minutes
@y
  time: 30 分
@z

@x
This guide will show you how to create, test, and deploy containerized Go applications using Docker.
@y
This guide will show you how to create, test, and deploy containerized Go applications using Docker.
@z

@x
> **Acknowledgment**
>
> Docker would like to thank [Oliver Frolovs](https://www.linkedin.com/in/ofr/) for his contribution to this guide.
@y
> **Acknowledgment**
>
> Docker would like to thank [Oliver Frolovs](https://www.linkedin.com/in/ofr/) for his contribution to this guide.
@z

@x
## What will you learn?
@y
## What will you learn?
@z

@x
In this guide, you’ll learn how to:
@y
In this guide, you’ll learn how to:
@z

@x
- Create a `Dockerfile` which contains the instructions for building a container image for a program written in Go.
- Run the image as a container in your local Docker instance and manage the container's lifecycle.
- Use multi-stage builds for building small images efficiently while keeping your Dockerfiles easy to read and maintain.
- Use Docker Compose to orchestrate running of multiple related containers together in a development environment.
@y
- Create a `Dockerfile` which contains the instructions for building a container image for a program written in Go.
- Run the image as a container in your local Docker instance and manage the container's lifecycle.
- Use multi-stage builds for building small images efficiently while keeping your Dockerfiles easy to read and maintain.
- Use Docker Compose to orchestrate running of multiple related containers together in a development environment.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Some basic understanding of Go and its toolchain is assumed. This isn't a Go tutorial. If you are new to the : languages:,
the [Go website](https://golang.org/) is a great place to explore,
so _go_ (pun intended) check it out!
@y
Some basic understanding of Go and its toolchain is assumed. This isn't a Go tutorial. If you are new to the : languages:,
the [Go website](https://golang.org/) is a great place to explore,
so _go_ (pun intended) check it out!
@z

@x
You also must know some basic [Docker concepts](/get-started/docker-concepts/the-basics/what-is-a-container.md) as well as to
be at least vaguely familiar with the [Dockerfile format](/manuals/build/concepts/dockerfile.md).
@y
You also must know some basic [Docker concepts](get-started/docker-concepts/the-basics/what-is-a-container.md) as well as to
be at least vaguely familiar with the [Dockerfile format](manuals/build/concepts/dockerfile.md).
@z

@x
Your Docker set-up must have BuildKit enabled. BuildKit is enabled by default for all users on [Docker Desktop](/manuals/desktop/_index.md).
If you have installed Docker Desktop, you don’t have to manually enable BuildKit. If you are running Docker on Linux,
please check out BuildKit [getting started](/manuals/build/buildkit/_index.md#getting-started) page.
@y
Your Docker set-up must have BuildKit enabled. BuildKit is enabled by default for all users on [Docker Desktop](manuals/desktop/_index.md).
If you have installed Docker Desktop, you don’t have to manually enable BuildKit. If you are running Docker on Linux,
please check out BuildKit [getting started](manuals/build/buildkit/_index.md#getting-started) page.
@z

@x
Some familiarity with the command line is also expected.
@y
Some familiarity with the command line is also expected.
@z

@x
## What's next?
@y
## What's next?
@z

@x
The aim of this guide is to provide enough examples and instructions for you to containerize your own Go application and deploy it into the Cloud.
@y
The aim of this guide is to provide enough examples and instructions for you to containerize your own Go application and deploy it into the Cloud.
@z

@x
Start by building your first Go image.
@y
Start by building your first Go image.
@z

@x
## Build your Go image
@y
## Build your Go image
@z

@x
### Overview
@y
### Overview
@z

@x
In this section you're going to build a container image. The image includes
everything you need to run your application – the compiled application binary
file, the runtime, the libraries, and all other resources required by your
application.
@y
In this section you're going to build a container image. The image includes
everything you need to run your application – the compiled application binary
file, the runtime, the libraries, and all other resources required by your
application.
@z

@x
### Required software
@y
### Required software
@z

@x
To complete this tutorial, you need the following:
@y
To complete this tutorial, you need the following:
@z

@x
- Docker running locally. Follow the [instructions to download and install Docker](/manuals/desktop/_index.md).
- An IDE or a text editor to edit files. [Visual Studio Code](https://code.visualstudio.com/) is a free and popular choice but you can use anything you feel comfortable with.
- A Git client. This guide uses a command-line based `git` client, but you are free to use whatever works for you.
- A command-line terminal application. The examples shown in this module are from the Linux shell, but they should work in PowerShell, Windows Command Prompt, or OS X Terminal with minimal, if any, modifications.
@y
- Docker running locally. Follow the [instructions to download and install Docker](manuals/desktop/_index.md).
- An IDE or a text editor to edit files. [Visual Studio Code](https://code.visualstudio.com/) is a free and popular choice but you can use anything you feel comfortable with.
- A Git client. This guide uses a command-line based `git` client, but you are free to use whatever works for you.
- A command-line terminal application. The examples shown in this module are from the Linux shell, but they should work in PowerShell, Windows Command Prompt, or OS X Terminal with minimal, if any, modifications.
@z

@x
### Meet the example application
@y
### Meet the example application
@z

@x
The example application is a caricature of a microservice. It is purposefully trivial to keep focus on learning the basics of containerization for Go applications.
@y
The example application is a caricature of a microservice. It is purposefully trivial to keep focus on learning the basics of containerization for Go applications.
@z

@x
The application offers two HTTP endpoints:
@y
The application offers two HTTP endpoints:
@z

@x
- It responds with a string containing a heart symbol (`<3`) to requests to `/`.
- It responds with `{"Status" : "OK"}` JSON to a request to `/health`.
@y
- It responds with a string containing a heart symbol (`<3`) to requests to `/`.
- It responds with `{"Status" : "OK"}` JSON to a request to `/health`.
@z

@x
It responds with HTTP error 404 to any other request.
@y
It responds with HTTP error 404 to any other request.
@z

@x
The application listens on a TCP port defined by the value of environment variable `PORT`. The default value is `8080`.
@y
The application listens on a TCP port defined by the value of environment variable `PORT`. The default value is `8080`.
@z

@x
The application is stateless.
@y
The application is stateless.
@z

@x
The complete source code for the application is on GitHub: [github.com/docker/docker-gs-ping](https://github.com/docker/docker-gs-ping). You are encouraged to fork it and experiment with it as much as you like.
@y
The complete source code for the application is on GitHub: [github.com/docker/docker-gs-ping](https://github.com/docker/docker-gs-ping). You are encouraged to fork it and experiment with it as much as you like.
@z

@x
To continue, clone the application repository to your local machine:
@y
To continue, clone the application repository to your local machine:
@z

@x
```console
$ git clone https://github.com/docker/docker-gs-ping
```
@y
```console
$ git clone https://github.com/docker/docker-gs-ping
```
@z

@x
The application's `main.go` file is straightforward, if you are familiar with Go:
@y
The application's `main.go` file is straightforward, if you are familiar with Go:
@z

@x
```go
package main
@y
```go
package main
@z

@x
import (
	"net/http"
	"os"
@y
import (
	"net/http"
	"os"
@z

@x
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)
@y
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)
@z

@x
func main() {
@y
func main() {
@z

@x
	e := echo.New()
@y
	e := echo.New()
@z

@x
	e.Use(middleware.Logger())
	e.Use(middleware.Recover())
@y
	e.Use(middleware.Logger())
	e.Use(middleware.Recover())
@z

@x
	e.GET("/", func(c echo.Context) error {
		return c.HTML(http.StatusOK, "Hello, Docker! <3")
	})
@y
	e.GET("/", func(c echo.Context) error {
		return c.HTML(http.StatusOK, "Hello, Docker! <3")
	})
@z

@x
	e.GET("/health", func(c echo.Context) error {
		return c.JSON(http.StatusOK, struct{ Status string }{Status: "OK"})
	})
@y
	e.GET("/health", func(c echo.Context) error {
		return c.JSON(http.StatusOK, struct{ Status string }{Status: "OK"})
	})
@z

@x
	httpPort := os.Getenv("PORT")
	if httpPort == "" {
		httpPort = "8080"
	}
@y
	httpPort := os.Getenv("PORT")
	if httpPort == "" {
		httpPort = "8080"
	}
@z

@x
	e.Logger.Fatal(e.Start(":" + httpPort))
}
@y
	e.Logger.Fatal(e.Start(":" + httpPort))
}
@z

@x
// Simple implementation of an integer minimum
// Adapted from: https://gobyexample.com/testing-and-benchmarking
func IntMin(a, b int) int {
	if a < b {
		return a
	}
	return b
}
```
@y
// Simple implementation of an integer minimum
// Adapted from: https://gobyexample.com/testing-and-benchmarking
func IntMin(a, b int) int {
	if a < b {
		return a
	}
	return b
}
```
@z

@x
### Create a Dockerfile for the application
@y
### Create a Dockerfile for the application
@z

@x
To build a container image with Docker, a `Dockerfile` with build instructions is required.
@y
To build a container image with Docker, a `Dockerfile` with build instructions is required.
@z

@x
Begin your `Dockerfile` with the (optional) parser directive line that instructs BuildKit to
interpret your file according to the grammar rules for the specified version of the syntax.
@y
Begin your `Dockerfile` with the (optional) parser directive line that instructs BuildKit to
interpret your file according to the grammar rules for the specified version of the syntax.
@z

@x
You then tell Docker what base image you would like to use for your application:
@y
You then tell Docker what base image you would like to use for your application:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
FROM golang:1.19
```
@y
FROM golang:1.19
```
@z

@x
Docker images can be inherited from other images. Therefore, instead of creating
your own base image from scratch, you can use the official Go image that already
has all necessary tools and libraries to compile and run a Go application.
@y
Docker images can be inherited from other images. Therefore, instead of creating
your own base image from scratch, you can use the official Go image that already
has all necessary tools and libraries to compile and run a Go application.
@z

@x
> [!NOTE]
>
> If you are curious about creating your own base images, you can check out the following section of this guide: [creating base images](/manuals/build/building/base-images.md#create-a-base-image).
> Note, however, that this isn't necessary to continue with your task at hand.
@y
> [!NOTE]
>
> If you are curious about creating your own base images, you can check out the following section of this guide: [creating base images](manuals/build/building/base-images.md#create-a-base-image).
> Note, however, that this isn't necessary to continue with your task at hand.
@z

@x
Now that you have defined the base image for your upcoming container image, you
can begin building on top of it.
@y
Now that you have defined the base image for your upcoming container image, you
can begin building on top of it.
@z

@x
To make things easier when running the rest of your commands, create a directory
inside the image that you're building. This also instructs Docker to use this
directory as the default destination for all subsequent commands. This way you
don't have to type out full file paths in the `Dockerfile`, the relative paths
will be based on this directory.
@y
To make things easier when running the rest of your commands, create a directory
inside the image that you're building. This also instructs Docker to use this
directory as the default destination for all subsequent commands. This way you
don't have to type out full file paths in the `Dockerfile`, the relative paths
will be based on this directory.
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
Usually the very first thing you do once you’ve downloaded a project written in
Go is to install the modules necessary to compile it. Note, that the base image
has the toolchain already, but your source code isn't in it yet.
@y
Usually the very first thing you do once you’ve downloaded a project written in
Go is to install the modules necessary to compile it. Note, that the base image
has the toolchain already, but your source code isn't in it yet.
@z

@x
So before you can run `go mod download` inside your image, you need to get your
`go.mod` and `go.sum` files copied into it. Use the `COPY` command to do this.
@y
So before you can run `go mod download` inside your image, you need to get your
`go.mod` and `go.sum` files copied into it. Use the `COPY` command to do this.
@z

@x
In its simplest form, the `COPY` command takes two parameters. The first
parameter tells Docker what files you want to copy into the image. The last
parameter tells Docker where you want that file to be copied to.
@y
In its simplest form, the `COPY` command takes two parameters. The first
parameter tells Docker what files you want to copy into the image. The last
parameter tells Docker where you want that file to be copied to.
@z

@x
Copy the `go.mod` and `go.sum` file into your project directory `/app` which,
owing to your use of `WORKDIR`, is the current directory (`./`) inside the
image. Unlike some modern shells that appear to be indifferent to the use of
trailing slash (`/`), and can figure out what the user meant (most of the time),
Docker's `COPY` command is quite sensitive in its interpretation of the trailing
slash.
@y
Copy the `go.mod` and `go.sum` file into your project directory `/app` which,
owing to your use of `WORKDIR`, is the current directory (`./`) inside the
image. Unlike some modern shells that appear to be indifferent to the use of
trailing slash (`/`), and can figure out what the user meant (most of the time),
Docker's `COPY` command is quite sensitive in its interpretation of the trailing
slash.
@z

@x
```dockerfile
COPY go.mod go.sum ./
```
@y
```dockerfile
COPY go.mod go.sum ./
```
@z

@x
> [!NOTE]
>
> If you'd like to familiarize yourself with the trailing slash treatment by the
> `COPY` command, see [Dockerfile
> reference](/reference/dockerfile.md#copy). This trailing slash can
> cause issues in more ways than you can imagine.
@y
> [!NOTE]
>
> If you'd like to familiarize yourself with the trailing slash treatment by the
> `COPY` command, see [Dockerfile
> reference](reference/dockerfile.md#copy). This trailing slash can
> cause issues in more ways than you can imagine.
@z

@x
Now that you have the module files inside the Docker image that you are
building, you can use the `RUN` command to run the command `go mod download`
there as well. This works exactly the same as if you were running `go` locally
on your machine, but this time these Go modules will be installed into a
directory inside the image.
@y
Now that you have the module files inside the Docker image that you are
building, you can use the `RUN` command to run the command `go mod download`
there as well. This works exactly the same as if you were running `go` locally
on your machine, but this time these Go modules will be installed into a
directory inside the image.
@z

@x
```dockerfile
RUN go mod download
```
@y
```dockerfile
RUN go mod download
```
@z

@x
At this point, you have a Go toolchain version 1.19.x and all your Go
dependencies installed inside the image.
@y
At this point, you have a Go toolchain version 1.19.x and all your Go
dependencies installed inside the image.
@z

@x
The next thing you need to do is to copy your source code into the image. You’ll
use the `COPY` command just like you did with your module files before.
@y
The next thing you need to do is to copy your source code into the image. You’ll
use the `COPY` command just like you did with your module files before.
@z

@x
```dockerfile
COPY *.go ./
```
@y
```dockerfile
COPY *.go ./
```
@z

@x
This `COPY` command uses a wildcard to copy all files with `.go` extension
located in the current directory on the host (the directory where the `Dockerfile`
is located) into the current directory inside the image.
@y
This `COPY` command uses a wildcard to copy all files with `.go` extension
located in the current directory on the host (the directory where the `Dockerfile`
is located) into the current directory inside the image.
@z

@x
`COPY *.go ./` only matches `.go` files in that one directory. Packages
under `pkg/` or other subdirectories are left out, so `go build` then
fails to find them. For a multi-package module, copy the module root
instead (`COPY . .`) and use a `.dockerignore` file to keep the context
small.
@y
`COPY *.go ./` only matches `.go` files in that one directory. Packages
under `pkg/` or other subdirectories are left out, so `go build` then
fails to find them. For a multi-package module, copy the module root
instead (`COPY . .`) and use a `.dockerignore` file to keep the context
small.
@z

@x
Now, to compile your application, use the familiar `RUN` command:
@y
Now, to compile your application, use the familiar `RUN` command:
@z

@x
```dockerfile
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-gs-ping
```
@y
```dockerfile
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-gs-ping
```
@z

@x
This should be familiar. The result of that command will be a static application
binary named `docker-gs-ping` and located in the root of the filesystem of the
image that you are building. You could have put the binary into any other place
you desire inside that image, the root directory has no special meaning in this
regard. It's convenient to use it to keep the file paths short for improved
readability.
@y
This should be familiar. The result of that command will be a static application
binary named `docker-gs-ping` and located in the root of the filesystem of the
image that you are building. You could have put the binary into any other place
you desire inside that image, the root directory has no special meaning in this
regard. It's convenient to use it to keep the file paths short for improved
readability.
@z

@x
Now, all that is left to do is to tell Docker what command to run when your
image is used to start a container.
@y
Now, all that is left to do is to tell Docker what command to run when your
image is used to start a container.
@z

@x
You do this with the `CMD` command:
@y
You do this with the `CMD` command:
@z

@x
```dockerfile
CMD ["/docker-gs-ping"]
```
@y
```dockerfile
CMD ["/docker-gs-ping"]
```
@z

@x
Here's the complete `Dockerfile`:
@y
Here's the complete `Dockerfile`:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
FROM golang:1.19
@y
FROM golang:1.19
@z

@x
# Set destination for COPY
WORKDIR /app
@y
# Set destination for COPY
WORKDIR /app
@z

@x
# Download Go modules
COPY go.mod go.sum ./
RUN go mod download
@y
# Download Go modules
COPY go.mod go.sum ./
RUN go mod download
@z

@x
# Copy the source code. Note the slash at the end, as explained in
# https://docs.docker.com/reference/dockerfile/#copy
COPY *.go ./
@y
# Copy the source code. Note the slash at the end, as explained in
# https://docs.docker.com/reference/dockerfile/#copy
COPY *.go ./
@z

@x
# Build
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-gs-ping
@y
# Build
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-gs-ping
@z

@x
# Optional:
# To bind to a TCP port, runtime parameters must be supplied to the docker command.
# But we can document in the Dockerfile what ports
# the application is going to listen on by default.
# https://docs.docker.com/reference/dockerfile/#expose
EXPOSE 8080
@y
# Optional:
# To bind to a TCP port, runtime parameters must be supplied to the docker command.
# But we can document in the Dockerfile what ports
# the application is going to listen on by default.
# https://docs.docker.com/reference/dockerfile/#expose
EXPOSE 8080
@z

@x
# Run
CMD ["/docker-gs-ping"]
```
@y
# Run
CMD ["/docker-gs-ping"]
```
@z

@x
The `Dockerfile` may also contain comments. They always begin with a `#` symbol,
and must be at the beginning of a line. Comments are there for your convenience
to allow documenting your `Dockerfile`.
@y
The `Dockerfile` may also contain comments. They always begin with a `#` symbol,
and must be at the beginning of a line. Comments are there for your convenience
to allow documenting your `Dockerfile`.
@z

@x
There is also a concept of Dockerfile directives, such as the `syntax` directive
you added. The directives must always be at the very top of the `Dockerfile`, so
when adding comments, make sure that the comments follow after any directives
that you may have used:
@y
There is also a concept of Dockerfile directives, such as the `syntax` directive
you added. The directives must always be at the very top of the `Dockerfile`, so
when adding comments, make sure that the comments follow after any directives
that you may have used:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
# A sample microservice in Go packaged into a container image.
@y
```dockerfile
# syntax=docker/dockerfile:1
# A sample microservice in Go packaged into a container image.
@z

@x
FROM golang:1.19
@y
FROM golang:1.19
@z

@x
# ...
```
@y
# ...
```
@z

@x
### Build the image
@y
### Build the image
@z

@x
Now that you've created your `Dockerfile`, build an image from it. The `docker
build` command creates Docker images from the `Dockerfile` and a context. A
build context is the set of files located in the specified path or URL. The
Docker build process can access any of the files located in the context.
@y
Now that you've created your `Dockerfile`, build an image from it. The `docker
build` command creates Docker images from the `Dockerfile` and a context. A
build context is the set of files located in the specified path or URL. The
Docker build process can access any of the files located in the context.
@z

@x
The build command optionally takes a `--tag` flag. This flag is used to label
the image with a string value, which is easy for humans to read and recognize.
If you don't pass a `--tag`, Docker will use `latest` as the default value.
@y
The build command optionally takes a `--tag` flag. This flag is used to label
the image with a string value, which is easy for humans to read and recognize.
If you don't pass a `--tag`, Docker will use `latest` as the default value.
@z

@x
Build your first Docker image.
@y
Build your first Docker image.
@z

@x
```console
$ docker build --tag docker-gs-ping .
```
@y
```console
$ docker build --tag docker-gs-ping .
```
@z

@x
The build process will print some diagnostic messages as it goes through the build steps.
The following is an example of what these messages may look like.
@y
The build process will print some diagnostic messages as it goes through the build steps.
The following is an example of what these messages may look like.
@z

@x
```console
[+] Building 2.2s (15/15) FINISHED
 => [internal] load build definition from Dockerfile                                                                                       0.0s
 => => transferring dockerfile: 701B                                                                                                       0.0s
 => [internal] load .dockerignore                                                                                                          0.0s
 => => transferring context: 2B                                                                                                            0.0s
 => resolve image config for docker.io/docker/dockerfile:1                                                                                 1.1s
 => CACHED docker-image://docker.io/docker/dockerfile:1@sha256:39b85bbfa7536a5feceb7372a0817649ecb2724562a38360f4d6a7782a409b14            0.0s
 => [internal] load build definition from Dockerfile                                                                                       0.0s
 => [internal] load .dockerignore                                                                                                          0.0s
 => [internal] load metadata for docker.io/library/golang:1.19                                                                             0.7s
 => [1/6] FROM docker.io/library/golang:1.19@sha256:5d947843dde82ba1df5ac1b2ebb70b203d106f0423bf5183df3dc96f6bc5a705                       0.0s
 => [internal] load build context                                                                                                          0.0s
 => => transferring context: 6.08kB                                                                                                        0.0s
 => CACHED [2/6] WORKDIR /app                                                                                                              0.0s
 => CACHED [3/6] COPY go.mod go.sum ./                                                                                                     0.0s
 => CACHED [4/6] RUN go mod download                                                                                                       0.0s
 => CACHED [5/6] COPY *.go ./                                                                                                              0.0s
 => CACHED [6/6] RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-gs-ping                                                                  0.0s
 => exporting to image                                                                                                                     0.0s
 => => exporting layers                                                                                                                    0.0s
 => => writing image sha256:ede8ff889a0d9bc33f7a8da0673763c887a258eb53837dd52445cdca7b7df7e3                                               0.0s
 => => naming to docker.io/library/docker-gs-ping                                                                                          0.0s
```
@y
```console
[+] Building 2.2s (15/15) FINISHED
 => [internal] load build definition from Dockerfile                                                                                       0.0s
 => => transferring dockerfile: 701B                                                                                                       0.0s
 => [internal] load .dockerignore                                                                                                          0.0s
 => => transferring context: 2B                                                                                                            0.0s
 => resolve image config for docker.io/docker/dockerfile:1                                                                                 1.1s
 => CACHED docker-image://docker.io/docker/dockerfile:1@sha256:39b85bbfa7536a5feceb7372a0817649ecb2724562a38360f4d6a7782a409b14            0.0s
 => [internal] load build definition from Dockerfile                                                                                       0.0s
 => [internal] load .dockerignore                                                                                                          0.0s
 => [internal] load metadata for docker.io/library/golang:1.19                                                                             0.7s
 => [1/6] FROM docker.io/library/golang:1.19@sha256:5d947843dde82ba1df5ac1b2ebb70b203d106f0423bf5183df3dc96f6bc5a705                       0.0s
 => [internal] load build context                                                                                                          0.0s
 => => transferring context: 6.08kB                                                                                                        0.0s
 => CACHED [2/6] WORKDIR /app                                                                                                              0.0s
 => CACHED [3/6] COPY go.mod go.sum ./                                                                                                     0.0s
 => CACHED [4/6] RUN go mod download                                                                                                       0.0s
 => CACHED [5/6] COPY *.go ./                                                                                                              0.0s
 => CACHED [6/6] RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-gs-ping                                                                  0.0s
 => exporting to image                                                                                                                     0.0s
 => => exporting layers                                                                                                                    0.0s
 => => writing image sha256:ede8ff889a0d9bc33f7a8da0673763c887a258eb53837dd52445cdca7b7df7e3                                               0.0s
 => => naming to docker.io/library/docker-gs-ping                                                                                          0.0s
```
@z

@x
Your exact output will vary, but provided there aren't any errors, you should
see the word `FINISHED` in the first line of output. This means Docker has
successfully built your image named `docker-gs-ping`.
@y
Your exact output will vary, but provided there aren't any errors, you should
see the word `FINISHED` in the first line of output. This means Docker has
successfully built your image named `docker-gs-ping`.
@z

@x
### View local images
@y
### View local images
@z

@x
To see the list of images you have on your local machine, you have two options.
One is to use the CLI and the other is to use [Docker
Desktop](/manuals/desktop/_index.md). Since you're working in the
terminal, take a look at listing images with the CLI.
@y
To see the list of images you have on your local machine, you have two options.
One is to use the CLI and the other is to use [Docker
Desktop](manuals/desktop/_index.md). Since you're working in the
terminal, take a look at listing images with the CLI.
@z

@x
To list images, run the `docker image ls`command (or the `docker images` shorthand):
@y
To list images, run the `docker image ls`command (or the `docker images` shorthand):
@z

@x
```console
$ docker image ls
@y
```console
$ docker image ls
@z

@x
REPOSITORY                       TAG       IMAGE ID       CREATED         SIZE
docker-gs-ping                   latest    7f153fbcc0a8   2 minutes ago   1.11GB
...
```
@y
REPOSITORY                       TAG       IMAGE ID       CREATED         SIZE
docker-gs-ping                   latest    7f153fbcc0a8   2 minutes ago   1.11GB
...
```
@z

@x
Your exact output may vary, but you should see the `docker-gs-ping` image with
the `latest` tag. Because you didn't specify a custom tag when you built your
image, Docker assumed that the tag would be `latest`, which is a special value.
@y
Your exact output may vary, but you should see the `docker-gs-ping` image with
the `latest` tag. Because you didn't specify a custom tag when you built your
image, Docker assumed that the tag would be `latest`, which is a special value.
@z

@x
### Tag images
@y
### Tag images
@z

@x
An image name is made up of slash-separated name components. Name components may
contain lowercase letters, digits, and separators. A separator is defined as a
period, one or two underscores, or one or more dashes. A name component may not
start or end with a separator.
@y
An image name is made up of slash-separated name components. Name components may
contain lowercase letters, digits, and separators. A separator is defined as a
period, one or two underscores, or one or more dashes. A name component may not
start or end with a separator.
@z

@x
An image is made up of a manifest and a list of layers. In simple terms, a tag
points to a combination of these artifacts. You can have multiple tags for the
image and, in fact, most images have multiple tags. Create a second tag
for the image you built and take a look at its layers.
@y
An image is made up of a manifest and a list of layers. In simple terms, a tag
points to a combination of these artifacts. You can have multiple tags for the
image and, in fact, most images have multiple tags. Create a second tag
for the image you built and take a look at its layers.
@z

@x
Use the `docker image tag` (or `docker tag` shorthand) command to create a new
tag for your image. This command takes two arguments; the first argument is the
source image, and the second is the new tag to create. The following command
creates a new `docker-gs-ping:v1.0` tag for the `docker-gs-ping:latest` you
built:
@y
Use the `docker image tag` (or `docker tag` shorthand) command to create a new
tag for your image. This command takes two arguments; the first argument is the
source image, and the second is the new tag to create. The following command
creates a new `docker-gs-ping:v1.0` tag for the `docker-gs-ping:latest` you
built:
@z

@x
```console
$ docker image tag docker-gs-ping:latest docker-gs-ping:v1.0
```
@y
```console
$ docker image tag docker-gs-ping:latest docker-gs-ping:v1.0
```
@z

@x
The Docker `tag` command creates a new tag for the image. It doesn't create a
new image. The tag points to the same image and is another way to reference
the image.
@y
The Docker `tag` command creates a new tag for the image. It doesn't create a
new image. The tag points to the same image and is another way to reference
the image.
@z

@x
Now run the `docker image ls` command again to see the updated list of local
images:
@y
Now run the `docker image ls` command again to see the updated list of local
images:
@z

@x
```console
$ docker image ls
@y
```console
$ docker image ls
@z

@x
REPOSITORY                       TAG       IMAGE ID       CREATED         SIZE
docker-gs-ping                   latest    7f153fbcc0a8   6 minutes ago   1.11GB
docker-gs-ping                   v1.0      7f153fbcc0a8   6 minutes ago   1.11GB
...
```
@y
REPOSITORY                       TAG       IMAGE ID       CREATED         SIZE
docker-gs-ping                   latest    7f153fbcc0a8   6 minutes ago   1.11GB
docker-gs-ping                   v1.0      7f153fbcc0a8   6 minutes ago   1.11GB
...
```
@z

@x
You can see that you have two images that start with `docker-gs-ping`. You know
they're the same image because if you look at the `IMAGE ID` column, you can
see that the values are the same for the two images. This value is a unique
identifier Docker uses internally to identify the image.
@y
You can see that you have two images that start with `docker-gs-ping`. You know
they're the same image because if you look at the `IMAGE ID` column, you can
see that the values are the same for the two images. This value is a unique
identifier Docker uses internally to identify the image.
@z

@x
Remove the tag that you just created. To do this, you’ll use the
`docker image rm` command, or the shorthand `docker rmi` (which stands for
"remove image"):
@y
Remove the tag that you just created. To do this, you’ll use the
`docker image rm` command, or the shorthand `docker rmi` (which stands for
"remove image"):
@z

@x
```console
$ docker image rm docker-gs-ping:v1.0
Untagged: docker-gs-ping:v1.0
```
@y
```console
$ docker image rm docker-gs-ping:v1.0
Untagged: docker-gs-ping:v1.0
```
@z

@x
Notice that the response from Docker tells you that the image hasn't been
removed but only untagged.
@y
Notice that the response from Docker tells you that the image hasn't been
removed but only untagged.
@z

@x
Verify this by running the following command:
@y
Verify this by running the following command:
@z

@x
```console
$ docker image ls
```
@y
```console
$ docker image ls
```
@z

@x
You will see that the tag `v1.0` is no longer in the list of images kept by your Docker instance.
@y
You will see that the tag `v1.0` is no longer in the list of images kept by your Docker instance.
@z

@x
```text
REPOSITORY                       TAG       IMAGE ID       CREATED         SIZE
docker-gs-ping                   latest    7f153fbcc0a8   7 minutes ago   1.11GB
...
```
@y
```text
REPOSITORY                       TAG       IMAGE ID       CREATED         SIZE
docker-gs-ping                   latest    7f153fbcc0a8   7 minutes ago   1.11GB
...
```
@z

@x
The tag `v1.0` has been removed but you still have the `docker-gs-ping:latest`
tag available on your machine, so the image is there.
@y
The tag `v1.0` has been removed but you still have the `docker-gs-ping:latest`
tag available on your machine, so the image is there.
@z

@x
### Multi-stage builds
@y
### Multi-stage builds
@z

@x
You may have noticed that your `docker-gs-ping` image weighs in at over a
gigabyte, which is a lot for a tiny compiled Go application. You may also be
wondering what happened to the full suite of Go tools, including the compiler,
after you had built your image.
@y
You may have noticed that your `docker-gs-ping` image weighs in at over a
gigabyte, which is a lot for a tiny compiled Go application. You may also be
wondering what happened to the full suite of Go tools, including the compiler,
after you had built your image.
@z

@x
The answer is that the full toolchain is still there, in the container image.
Not only this is inconvenient because of the large file size, but it may also
present a security risk when the container is deployed.
@y
The answer is that the full toolchain is still there, in the container image.
Not only this is inconvenient because of the large file size, but it may also
present a security risk when the container is deployed.
@z

@x
These two issues can be solved by using [multi-stage builds](/manuals/build/building/multi-stage.md).
@y
These two issues can be solved by using [multi-stage builds](manuals/build/building/multi-stage.md).
@z

@x
In a nutshell, a multi-stage build can carry over the artifacts from one build stage into another,
and every build stage can be instantiated from a different base image.
@y
In a nutshell, a multi-stage build can carry over the artifacts from one build stage into another,
and every build stage can be instantiated from a different base image.
@z

@x
Thus, in the following example, you are going to use a full-scale official Go
image to build your application. Then you'll copy the application binary into
another image whose base is very lean and doesn't include the Go toolchain or
other optional components.
@y
Thus, in the following example, you are going to use a full-scale official Go
image to build your application. Then you'll copy the application binary into
another image whose base is very lean and doesn't include the Go toolchain or
other optional components.
@z

@x
The `Dockerfile.multistage` in the sample application's repository has the
following content:
@y
The `Dockerfile.multistage` in the sample application's repository has the
following content:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
# Build the application from source
FROM golang:1.19 AS build-stage
@y
# Build the application from source
FROM golang:1.19 AS build-stage
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
COPY go.mod go.sum ./
RUN go mod download
@y
COPY go.mod go.sum ./
RUN go mod download
@z

@x
COPY *.go ./
@y
COPY *.go ./
@z

@x
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-gs-ping
@y
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-gs-ping
@z

@x
# Run the tests in the container
FROM build-stage AS run-test-stage
RUN go test -v ./...
@y
# Run the tests in the container
FROM build-stage AS run-test-stage
RUN go test -v ./...
@z

@x
# Deploy the application binary into a lean image
FROM gcr.io/distroless/base-debian11 AS build-release-stage
@y
# Deploy the application binary into a lean image
FROM gcr.io/distroless/base-debian11 AS build-release-stage
@z

@x
WORKDIR /
@y
WORKDIR /
@z

@x
COPY --from=build-stage /docker-gs-ping /docker-gs-ping
@y
COPY --from=build-stage /docker-gs-ping /docker-gs-ping
@z

@x
EXPOSE 8080
@y
EXPOSE 8080
@z

@x
USER nonroot:nonroot
@y
USER nonroot:nonroot
@z

@x
ENTRYPOINT ["/docker-gs-ping"]
```
@y
ENTRYPOINT ["/docker-gs-ping"]
```
@z

@x
Since you have two Dockerfiles now, you have to tell Docker what Dockerfile
you'd like to use to build the image. Tag the new image with `multistage`. This
tag (like any other, apart from `latest`) has no special meaning for Docker,
it's something you chose.
@y
Since you have two Dockerfiles now, you have to tell Docker what Dockerfile
you'd like to use to build the image. Tag the new image with `multistage`. This
tag (like any other, apart from `latest`) has no special meaning for Docker,
it's something you chose.
@z

@x
```console
$ docker build -t docker-gs-ping:multistage -f Dockerfile.multistage .
```
@y
```console
$ docker build -t docker-gs-ping:multistage -f Dockerfile.multistage .
```
@z

@x
Comparing the sizes of `docker-gs-ping:multistage` and `docker-gs-ping:latest`
you see a few orders-of-magnitude difference.
@y
Comparing the sizes of `docker-gs-ping:multistage` and `docker-gs-ping:latest`
you see a few orders-of-magnitude difference.
@z

@x
```console
$ docker image ls
REPOSITORY       TAG          IMAGE ID       CREATED              SIZE
docker-gs-ping   multistage   e3fdde09f172   About a minute ago   28.1MB
docker-gs-ping   latest       336a3f164d0f   About an hour ago    1.11GB
```
@y
```console
$ docker image ls
REPOSITORY       TAG          IMAGE ID       CREATED              SIZE
docker-gs-ping   multistage   e3fdde09f172   About a minute ago   28.1MB
docker-gs-ping   latest       336a3f164d0f   About an hour ago    1.11GB
```
@z

@x
This is so because the ["distroless"](https://github.com/GoogleContainerTools/distroless)
base image that you have used in the second stage of the build is very barebones and is designed for lean deployments of static binaries.
@y
This is so because the ["distroless"](https://github.com/GoogleContainerTools/distroless)
base image that you have used in the second stage of the build is very barebones and is designed for lean deployments of static binaries.
@z

@x
There's much more to multi-stage builds, including the possibility of multi-architecture builds,
so feel free to check out [multi-stage builds](/manuals/build/building/multi-stage.md). This is, however, not essential for your progress here.
@y
There's much more to multi-stage builds, including the possibility of multi-architecture builds,
so feel free to check out [multi-stage builds](manuals/build/building/multi-stage.md). This is, however, not essential for your progress here.
@z

@x
## Run your Go image as a container
@y
## Run your Go image as a container
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Work through the steps to containerize a Go application in [Build your Go image](#build-your-go-image).
@y
Work through the steps to containerize a Go application in [Build your Go image](#build-your-go-image).
@z

@x
### Overview
@y
### Overview
@z

@x
In the previous module you created a `Dockerfile` for your example application and then you created your Docker image using the command `docker build`. Now that you have the image, you can run that image and see if your application is running correctly.
@y
In the previous module you created a `Dockerfile` for your example application and then you created your Docker image using the command `docker build`. Now that you have the image, you can run that image and see if your application is running correctly.
@z

@x
A container is a normal operating system process except that this process is isolated and has its own file system, its own networking, and its own isolated process tree separate from the host.
@y
A container is a normal operating system process except that this process is isolated and has its own file system, its own networking, and its own isolated process tree separate from the host.
@z

@x
To run an image inside of a container, you use the `docker run` command. It requires one parameter and that's the image name. Start your image and make sure it's running correctly. Run the following command in your terminal.
@y
To run an image inside of a container, you use the `docker run` command. It requires one parameter and that's the image name. Start your image and make sure it's running correctly. Run the following command in your terminal.
@z

@x
```console
$ docker run docker-gs-ping
```
@y
```console
$ docker run docker-gs-ping
```
@z

@x
```text
   ____    __
  / __/___/ /  ___
 / _// __/ _ \/ _ \
/___/\__/_//_/\___/ v4.10.2
High performance, minimalist Go web framework
https://echo.labstack.com
____________________________________O/_______
                                    O\
⇨ http server started on [::]:8080
```
@y
```text
   ____    __
  / __/___/ /  ___
 / _// __/ _ \/ _ \
/___/\__/_//_/\___/ v4.10.2
High performance, minimalist Go web framework
https://echo.labstack.com
____________________________________O/_______
                                    O\
⇨ http server started on [::]:8080
```
@z

@x
When you run this command, you’ll notice that you weren't returned to the command prompt. This is because your application is a REST server and will run in a loop waiting for incoming requests without returning control back to the OS until you stop the container.
@y
When you run this command, you’ll notice that you weren't returned to the command prompt. This is because your application is a REST server and will run in a loop waiting for incoming requests without returning control back to the OS until you stop the container.
@z

@x
Make a GET request to the server using the curl command.
@y
Make a GET request to the server using the curl command.
@z

@x
```console
$ curl http://localhost:8080/
curl: (7) Failed to connect to localhost port 8080: Connection refused
```
@y
```console
$ curl http://localhost:8080/
curl: (7) Failed to connect to localhost port 8080: Connection refused
```
@z

@x
Your curl command failed because the connection to your server was refused.
Meaning that you weren't able to connect to localhost on port 8080. This is
expected because your container is running in isolation which includes
networking. Stop the container and restart with port 8080 published on your
local network.
@y
Your curl command failed because the connection to your server was refused.
Meaning that you weren't able to connect to localhost on port 8080. This is
expected because your container is running in isolation which includes
networking. Stop the container and restart with port 8080 published on your
local network.
@z

@x
To stop the container, press ctrl-c. This will return you to the terminal prompt.
@y
To stop the container, press ctrl-c. This will return you to the terminal prompt.
@z

@x
To publish a port for your container, you’ll use the `--publish` flag (`-p` for short) on the `docker run` command. The format of the `--publish` command is `[host_port]:[container_port]`. So if you wanted to expose port `8080` inside the container to port `3000` outside the container, you would pass `3000:8080` to the `--publish` flag.
@y
To publish a port for your container, you’ll use the `--publish` flag (`-p` for short) on the `docker run` command. The format of the `--publish` command is `[host_port]:[container_port]`. So if you wanted to expose port `8080` inside the container to port `3000` outside the container, you would pass `3000:8080` to the `--publish` flag.
@z

@x
Start the container and expose port `8080` to port `8080` on the host.
@y
Start the container and expose port `8080` to port `8080` on the host.
@z

@x
```console
$ docker run --publish 8080:8080 docker-gs-ping
```
@y
```console
$ docker run --publish 8080:8080 docker-gs-ping
```
@z

@x
Now, rerun the curl command.
@y
Now, rerun the curl command.
@z

@x
```console
$ curl http://localhost:8080/
Hello, Docker! <3
```
@y
```console
$ curl http://localhost:8080/
Hello, Docker! <3
```
@z

@x
Success! You were able to connect to the application running inside of your container on port 8080. Switch back to the terminal where your container is running and you should see the `GET` request logged to the console.
@y
Success! You were able to connect to the application running inside of your container on port 8080. Switch back to the terminal where your container is running and you should see the `GET` request logged to the console.
@z

@x
Press `ctrl-c` to stop the container.
@y
Press `ctrl-c` to stop the container.
@z

@x
### Run in detached mode
@y
### Run in detached mode
@z

@x
This is great so far, but your sample application is a web server and you
shouldn't have to have your terminal connected to the container. Docker can run
your container in detached mode in the background. To do this, you can use the
`--detach` or `-d` for short. Docker will start your container the same as
before but this time will detach from the container and return you to the
terminal prompt.
@y
This is great so far, but your sample application is a web server and you
shouldn't have to have your terminal connected to the container. Docker can run
your container in detached mode in the background. To do this, you can use the
`--detach` or `-d` for short. Docker will start your container the same as
before but this time will detach from the container and return you to the
terminal prompt.
@z

@x
```console
$ docker run -d -p 8080:8080 docker-gs-ping
d75e61fcad1e0c0eca69a3f767be6ba28a66625ce4dc42201a8a323e8313c14e
```
@y
```console
$ docker run -d -p 8080:8080 docker-gs-ping
d75e61fcad1e0c0eca69a3f767be6ba28a66625ce4dc42201a8a323e8313c14e
```
@z

@x
Docker started your container in the background and printed the container ID on the terminal.
@y
Docker started your container in the background and printed the container ID on the terminal.
@z

@x
Again, make sure that your container is running. Run the same `curl` command:
@y
Again, make sure that your container is running. Run the same `curl` command:
@z

@x
```console
$ curl http://localhost:8080/
Hello, Docker! <3
```
@y
```console
$ curl http://localhost:8080/
Hello, Docker! <3
```
@z

@x
### List containers
@y
### List containers
@z

@x
Since you ran your container in the background, how do you know if your container is running or what other containers are running on your machine? Well, to see a list of containers running on your machine, run `docker ps`. This is similar to how the ps command is used to see a list of processes on a Linux machine.
@y
Since you ran your container in the background, how do you know if your container is running or what other containers are running on your machine? Well, to see a list of containers running on your machine, run `docker ps`. This is similar to how the ps command is used to see a list of processes on a Linux machine.
@z

@x
```console
$ docker ps
@y
```console
$ docker ps
@z

@x
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                    NAMES
d75e61fcad1e   docker-gs-ping   "/docker-gs-ping"   41 seconds ago   Up 40 seconds   0.0.0.0:8080->8080/tcp   inspiring_ishizaka
```
@y
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                    NAMES
d75e61fcad1e   docker-gs-ping   "/docker-gs-ping"   41 seconds ago   Up 40 seconds   0.0.0.0:8080->8080/tcp   inspiring_ishizaka
```
@z

@x
The `ps` command tells you a bunch of stuff about your running containers. You can see the container ID, the image running inside the container, the command that was used to start the container, when it was created, the status, ports that are exposed, and the names of the container.
@y
The `ps` command tells you a bunch of stuff about your running containers. You can see the container ID, the image running inside the container, the command that was used to start the container, when it was created, the status, ports that are exposed, and the names of the container.
@z

@x
You are probably wondering where the name of your container is coming from. Since you didn’t provide a name for the container when you started it, Docker generated a random name. You'll fix this in a minute but first you need to stop the container. To stop the container, run the `docker stop` command, passing the container's name or ID.
@y
You are probably wondering where the name of your container is coming from. Since you didn’t provide a name for the container when you started it, Docker generated a random name. You'll fix this in a minute but first you need to stop the container. To stop the container, run the `docker stop` command, passing the container's name or ID.
@z

@x
```console
$ docker stop inspiring_ishizaka
inspiring_ishizaka
```
@y
```console
$ docker stop inspiring_ishizaka
inspiring_ishizaka
```
@z

@x
Now rerun the `docker ps` command to see a list of running containers.
@y
Now rerun the `docker ps` command to see a list of running containers.
@z

@x
```console
$ docker ps
@y
```console
$ docker ps
@z

@x
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```
@y
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```
@z

@x
### Stop, start, and name containers
@y
### Stop, start, and name containers
@z

@x
Docker containers can be started, stopped and restarted. When you stop a container, it's not removed but the status is changed to stopped and the process inside of the container is stopped. When you ran the `docker ps` command, the default output is to only show running containers. If you pass the `--all` or `-a` for short, you will see all containers on your system, including stopped containers and running containers.
@y
Docker containers can be started, stopped and restarted. When you stop a container, it's not removed but the status is changed to stopped and the process inside of the container is stopped. When you ran the `docker ps` command, the default output is to only show running containers. If you pass the `--all` or `-a` for short, you will see all containers on your system, including stopped containers and running containers.
@z

@x
```console
$ docker ps --all
@y
```console
$ docker ps --all
@z

@x
CONTAINER ID   IMAGE            COMMAND                  CREATED              STATUS                      PORTS     NAMES
d75e61fcad1e   docker-gs-ping   "/docker-gs-ping"        About a minute ago   Exited (2) 23 seconds ago             inspiring_ishizaka
f65dbbb9a548   docker-gs-ping   "/docker-gs-ping"        3 minutes ago        Exited (2) 2 minutes ago              wizardly_joliot
aade1bf3d330   docker-gs-ping   "/docker-gs-ping"        3 minutes ago        Exited (2) 3 minutes ago              magical_carson
52d5ce3c15f0   docker-gs-ping   "/docker-gs-ping"        9 minutes ago        Exited (2) 3 minutes ago              gifted_mestorf
```
@y
CONTAINER ID   IMAGE            COMMAND                  CREATED              STATUS                      PORTS     NAMES
d75e61fcad1e   docker-gs-ping   "/docker-gs-ping"        About a minute ago   Exited (2) 23 seconds ago             inspiring_ishizaka
f65dbbb9a548   docker-gs-ping   "/docker-gs-ping"        3 minutes ago        Exited (2) 2 minutes ago              wizardly_joliot
aade1bf3d330   docker-gs-ping   "/docker-gs-ping"        3 minutes ago        Exited (2) 3 minutes ago              magical_carson
52d5ce3c15f0   docker-gs-ping   "/docker-gs-ping"        9 minutes ago        Exited (2) 3 minutes ago              gifted_mestorf
```
@z

@x
If you’ve been following along, you should see several containers listed. These are containers that you started and stopped but haven't removed yet.
@y
If you’ve been following along, you should see several containers listed. These are containers that you started and stopped but haven't removed yet.
@z

@x
Restart the container that you have just stopped. Locate the name of the container and replace the name of the container in the following `restart` command:
@y
Restart the container that you have just stopped. Locate the name of the container and replace the name of the container in the following `restart` command:
@z

@x
```console
$ docker restart inspiring_ishizaka
```
@y
```console
$ docker restart inspiring_ishizaka
```
@z

@x
Now, list all the containers again using the `ps` command:
@y
Now, list all the containers again using the `ps` command:
@z

@x
```console
$ docker ps -a
@y
```console
$ docker ps -a
@z

@x
CONTAINER ID   IMAGE            COMMAND                  CREATED          STATUS                     PORTS                    NAMES
d75e61fcad1e   docker-gs-ping   "/docker-gs-ping"        2 minutes ago    Up 5 seconds               0.0.0.0:8080->8080/tcp   inspiring_ishizaka
f65dbbb9a548   docker-gs-ping   "/docker-gs-ping"        4 minutes ago    Exited (2) 2 minutes ago                            wizardly_joliot
aade1bf3d330   docker-gs-ping   "/docker-gs-ping"        4 minutes ago    Exited (2) 4 minutes ago                            magical_carson
52d5ce3c15f0   docker-gs-ping   "/docker-gs-ping"        10 minutes ago   Exited (2) 4 minutes ago                            gifted_mestorf
```
@y
CONTAINER ID   IMAGE            COMMAND                  CREATED          STATUS                     PORTS                    NAMES
d75e61fcad1e   docker-gs-ping   "/docker-gs-ping"        2 minutes ago    Up 5 seconds               0.0.0.0:8080->8080/tcp   inspiring_ishizaka
f65dbbb9a548   docker-gs-ping   "/docker-gs-ping"        4 minutes ago    Exited (2) 2 minutes ago                            wizardly_joliot
aade1bf3d330   docker-gs-ping   "/docker-gs-ping"        4 minutes ago    Exited (2) 4 minutes ago                            magical_carson
52d5ce3c15f0   docker-gs-ping   "/docker-gs-ping"        10 minutes ago   Exited (2) 4 minutes ago                            gifted_mestorf
```
@z

@x
Notice that the container you just restarted has been started in detached mode and has port `8080` exposed. Also, note that the status of the container is `Up X seconds`. When you restart a container, it will be started with the same flags or commands that it was originally started with.
@y
Notice that the container you just restarted has been started in detached mode and has port `8080` exposed. Also, note that the status of the container is `Up X seconds`. When you restart a container, it will be started with the same flags or commands that it was originally started with.
@z

@x
Stop and remove all of your containers and take a look at fixing the random naming issue.
@y
Stop and remove all of your containers and take a look at fixing the random naming issue.
@z

@x
Stop the container you just started. Find the name of your running container and replace the name in the following command with the name of the container on your system:
@y
Stop the container you just started. Find the name of your running container and replace the name in the following command with the name of the container on your system:
@z

@x
```console
$ docker stop inspiring_ishizaka
inspiring_ishizaka
```
@y
```console
$ docker stop inspiring_ishizaka
inspiring_ishizaka
```
@z

@x
Now that all of your containers are stopped, remove them. When a container is removed, it's no longer running nor is it in the stopped state. Instead, the process inside the container is terminated and the metadata for the container is removed.
@y
Now that all of your containers are stopped, remove them. When a container is removed, it's no longer running nor is it in the stopped state. Instead, the process inside the container is terminated and the metadata for the container is removed.
@z

@x
To remove a container, run the `docker rm` command passing the container name. You can pass multiple container names to the command in one command.
@y
To remove a container, run the `docker rm` command passing the container name. You can pass multiple container names to the command in one command.
@z

@x
Again, make sure you replace the containers names in the following command with the container names from your system:
@y
Again, make sure you replace the containers names in the following command with the container names from your system:
@z

@x
```console
$ docker rm inspiring_ishizaka wizardly_joliot magical_carson gifted_mestorf
@y
```console
$ docker rm inspiring_ishizaka wizardly_joliot magical_carson gifted_mestorf
@z

@x
inspiring_ishizaka
wizardly_joliot
magical_carson
gifted_mestorf
```
@y
inspiring_ishizaka
wizardly_joliot
magical_carson
gifted_mestorf
```
@z

@x
Run the `docker ps --all` command again to verify that all containers are gone.
@y
Run the `docker ps --all` command again to verify that all containers are gone.
@z

@x
Now, address the pesky random name issue. Standard practice is to name your containers for the simple reason that it's easier to identify what's running in the container and what application or service it's associated with. Just like good naming conventions for variables in your code makes it simpler to read. So goes naming your containers.
@y
Now, address the pesky random name issue. Standard practice is to name your containers for the simple reason that it's easier to identify what's running in the container and what application or service it's associated with. Just like good naming conventions for variables in your code makes it simpler to read. So goes naming your containers.
@z

@x
To name a container, you must pass the `--name` flag to the `run` command:
@y
To name a container, you must pass the `--name` flag to the `run` command:
@z

@x
```console
$ docker run -d -p 8080:8080 --name rest-server docker-gs-ping
3bbc6a3102ea368c8b966e1878a5ea9b1fc61187afaac1276c41db22e4b7f48f
```
@y
```console
$ docker run -d -p 8080:8080 --name rest-server docker-gs-ping
3bbc6a3102ea368c8b966e1878a5ea9b1fc61187afaac1276c41db22e4b7f48f
```
@z

@x
```console
$ docker ps
@y
```console
$ docker ps
@z

@x
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                    NAMES
3bbc6a3102ea   docker-gs-ping   "/docker-gs-ping"   25 seconds ago   Up 24 seconds   0.0.0.0:8080->8080/tcp   rest-server
```
@y
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                    NAMES
3bbc6a3102ea   docker-gs-ping   "/docker-gs-ping"   25 seconds ago   Up 24 seconds   0.0.0.0:8080->8080/tcp   rest-server
```
@z

@x
Now, you can easily identify your container based on the name.
@y
Now, you can easily identify your container based on the name.
@z

@x
## Use containers for Go development
@y
## Use containers for Go development
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Work through the steps of the [run your image as a container](#run-your-go-image-as-a-container) module to learn how to manage the lifecycle of your containers.
@y
Work through the steps of the [run your image as a container](#run-your-go-image-as-a-container) module to learn how to manage the lifecycle of your containers.
@z

@x
### Introduction
@y
### Introduction
@z

@x
In this module, you'll take a look at running a database engine in a container and connecting it to the extended version of the example application. You are going to see some options for keeping persistent data and for wiring up the containers to talk to one another. Finally, you'll learn how to use Docker Compose to manage such multi-container local development environments effectively.
@y
In this module, you'll take a look at running a database engine in a container and connecting it to the extended version of the example application. You are going to see some options for keeping persistent data and for wiring up the containers to talk to one another. Finally, you'll learn how to use Docker Compose to manage such multi-container local development environments effectively.
@z

@x
### Local database and containers
@y
### Local database and containers
@z

@x
The database engine you are going to use is called [CockroachDB](https://www.cockroachlabs.com/product/). It is a modern, Cloud-native, distributed SQL database.
@y
The database engine you are going to use is called [CockroachDB](https://www.cockroachlabs.com/product/). It is a modern, Cloud-native, distributed SQL database.
@z

@x
Instead of compiling CockroachDB from the source code or using the operating system's native package manager to install CockroachDB, you are going to use the [Docker image for CockroachDB](https://hub.docker.com/r/cockroachdb/cockroach) and run it in a container.
@y
Instead of compiling CockroachDB from the source code or using the operating system's native package manager to install CockroachDB, you are going to use the [Docker image for CockroachDB](https://hub.docker.com/r/cockroachdb/cockroach) and run it in a container.
@z

@x
CockroachDB is compatible with PostgreSQL to a significant extent, and shares many conventions with the latter, particularly the default names for the environment variables. So, if you are familiar with Postgres, don't be surprised if you see some familiar environment variable names. The Go modules that work with Postgres, such as [pgx](https://pkg.go.dev/github.com/jackc/pgx), [pq](https://pkg.go.dev/github.com/lib/pq), [GORM](https://gorm.io/index.html), and [upper/db](https://upper.io/v4/) also work with CockroachDB.
@y
CockroachDB is compatible with PostgreSQL to a significant extent, and shares many conventions with the latter, particularly the default names for the environment variables. So, if you are familiar with Postgres, don't be surprised if you see some familiar environment variable names. The Go modules that work with Postgres, such as [pgx](https://pkg.go.dev/github.com/jackc/pgx), [pq](https://pkg.go.dev/github.com/lib/pq), [GORM](https://gorm.io/index.html), and [upper/db](https://upper.io/v4/) also work with CockroachDB.
@z

@x
For more information on the relation between Go and CockroachDB, refer to the [CockroachDB documentation](https://www.cockroachlabs.com/docs/v20.2/build-a-go-app-with-cockroachdb.html), although this isn't necessary to continue with the present guide.
@y
For more information on the relation between Go and CockroachDB, refer to the [CockroachDB documentation](https://www.cockroachlabs.com/docs/v20.2/build-a-go-app-with-cockroachdb.html), although this isn't necessary to continue with the present guide.
@z

@x
#### Storage
@y
#### Storage
@z

@x
The point of a database is to have a persistent store of data. [Volumes](/manuals/engine/storage/volumes.md) are the preferred mechanism for persisting data generated by and used by Docker containers. Thus, before you start CockroachDB, create the volume for it.
@y
The point of a database is to have a persistent store of data. [Volumes](manuals/engine/storage/volumes.md) are the preferred mechanism for persisting data generated by and used by Docker containers. Thus, before you start CockroachDB, create the volume for it.
@z

@x
To create a managed volume, run :
@y
To create a managed volume, run :
@z

@x
```console
$ docker volume create roach
roach
```
@y
```console
$ docker volume create roach
roach
```
@z

@x
You can view the list of all managed volumes in your Docker instance with the following command:
@y
You can view the list of all managed volumes in your Docker instance with the following command:
@z

@x
```console
$ docker volume list
DRIVER    VOLUME NAME
local     roach
```
@y
```console
$ docker volume list
DRIVER    VOLUME NAME
local     roach
```
@z

@x
#### Networking
@y
#### Networking
@z

@x
The example application and the database engine are going to talk to one another over the network. There are different kinds of network configuration possible, and you're going to use what's called a user-defined bridge network. It is going to provide you with a DNS lookup service so that you can refer to your database engine container by its hostname.
@y
The example application and the database engine are going to talk to one another over the network. There are different kinds of network configuration possible, and you're going to use what's called a user-defined bridge network. It is going to provide you with a DNS lookup service so that you can refer to your database engine container by its hostname.
@z

@x
The following command creates a new bridge network named `mynet`:
@y
The following command creates a new bridge network named `mynet`:
@z

@x
```console
$ docker network create -d bridge mynet
51344edd6430b5acd121822cacc99f8bc39be63dd125a3b3cd517b6485ab7709
```
@y
```console
$ docker network create -d bridge mynet
51344edd6430b5acd121822cacc99f8bc39be63dd125a3b3cd517b6485ab7709
```
@z

@x
As it was the case with the managed volumes, there is a command to list all networks set up in your Docker instance:
@y
As it was the case with the managed volumes, there is a command to list all networks set up in your Docker instance:
@z

@x
```console
$ docker network list
NETWORK ID     NAME          DRIVER    SCOPE
0ac2b1819fa4   bridge        bridge    local
51344edd6430   mynet         bridge    local
daed20bbecce   host          host      local
6aee44f40a39   none          null      local
```
@y
```console
$ docker network list
NETWORK ID     NAME          DRIVER    SCOPE
0ac2b1819fa4   bridge        bridge    local
51344edd6430   mynet         bridge    local
daed20bbecce   host          host      local
6aee44f40a39   none          null      local
```
@z

@x
Your bridge network `mynet` has been created successfully. The other three networks, named `bridge`, `host`, and `none` are the default networks and they had been created by the Docker itself. While it's not relevant to this guide, you can learn more about Docker networking in the [networking overview](/manuals/engine/network/_index.md) section.
@y
Your bridge network `mynet` has been created successfully. The other three networks, named `bridge`, `host`, and `none` are the default networks and they had been created by the Docker itself. While it's not relevant to this guide, you can learn more about Docker networking in the [networking overview](manuals/engine/network/_index.md) section.
@z

@x
#### Choose good names for volumes and networks
@y
#### Choose good names for volumes and networks
@z

@x
As the saying goes, there are only two hard things in Computer Science: cache invalidation and naming things. And off-by-one errors.
@y
As the saying goes, there are only two hard things in Computer Science: cache invalidation and naming things. And off-by-one errors.
@z

@x
When choosing a name for a network or a managed volume, it's best to choose a name that's indicative of the intended purpose. This guide aims for brevity, so it used short, generic names.
@y
When choosing a name for a network or a managed volume, it's best to choose a name that's indicative of the intended purpose. This guide aims for brevity, so it used short, generic names.
@z

@x
#### Start the database engine
@y
#### Start the database engine
@z

@x
Now that the housekeeping chores are done, you can run CockroachDB in a container and attach it to the volume and network you had just created. When you run the following command, Docker will pull the image from Docker Hub and run it for you locally:
@y
Now that the housekeeping chores are done, you can run CockroachDB in a container and attach it to the volume and network you had just created. When you run the following command, Docker will pull the image from Docker Hub and run it for you locally:
@z

@x
```console
$ docker run -d \
  --name roach \
  --hostname db \
  --network mynet \
  -p 26257:26257 \
  -p 8080:8080 \
  -v roach:/cockroach/cockroach-data \
  cockroachdb/cockroach:latest-v25.4 start-single-node \
  --insecure
@y
```console
$ docker run -d \
  --name roach \
  --hostname db \
  --network mynet \
  -p 26257:26257 \
  -p 8080:8080 \
  -v roach:/cockroach/cockroach-data \
  cockroachdb/cockroach:latest-v25.4 start-single-node \
  --insecure
@z

@x
# ... output omitted ...
```
@y
# ... output omitted ...
```
@z

@x
Notice a clever use of the tag `latest-v25.4` to make sure that you're pulling the latest patch version of 25.4. The diversity of available tags depend on the image maintainer. Here, your intent was to have the latest patched version of CockroachDB while not straying too far away from the known working version as the time goes by. To see the tags available for the CockroachDB image, you can go to the [CockroachDB page on Docker Hub](https://hub.docker.com/r/cockroachdb/cockroach/tags).
@y
Notice a clever use of the tag `latest-v25.4` to make sure that you're pulling the latest patch version of 25.4. The diversity of available tags depend on the image maintainer. Here, your intent was to have the latest patched version of CockroachDB while not straying too far away from the known working version as the time goes by. To see the tags available for the CockroachDB image, you can go to the [CockroachDB page on Docker Hub](https://hub.docker.com/r/cockroachdb/cockroach/tags).
@z

@x
#### Configure the database engine
@y
#### Configure the database engine
@z

@x
Now that the database engine is live, there is some configuration to do before your application can begin using it. Fortunately, it's not a lot. You must:
@y
Now that the database engine is live, there is some configuration to do before your application can begin using it. Fortunately, it's not a lot. You must:
@z

@x
1. Create a blank database.
2. Register a new user account with the database engine.
3. Grant that new user access rights to the database.
@y
1. Create a blank database.
2. Register a new user account with the database engine.
3. Grant that new user access rights to the database.
@z

@x
You can do that with the help of CockroachDB built-in SQL shell. To start the SQL shell in the same container where the database engine is running, type:
@y
You can do that with the help of CockroachDB built-in SQL shell. To start the SQL shell in the same container where the database engine is running, type:
@z

@x
```console
$ docker exec -it roach ./cockroach sql --insecure
```
@y
```console
$ docker exec -it roach ./cockroach sql --insecure
```
@z

@x
1. In the SQL shell, create the database that the example application is going to use:
@y
1. In the SQL shell, create the database that the example application is going to use:
@z

@x
   ```sql
   CREATE DATABASE mydb;
   ```
@y
   ```sql
   CREATE DATABASE mydb;
   ```
@z

@x
2. Register a new SQL user account with the database engine. Use the username `totoro`.
@y
2. Register a new SQL user account with the database engine. Use the username `totoro`.
@z

@x
   ```sql
   CREATE USER totoro;
   ```
@y
   ```sql
   CREATE USER totoro;
   ```
@z

@x
3. Give the new user the necessary permissions:
@y
3. Give the new user the necessary permissions:
@z

@x
   ```sql
   GRANT ALL ON DATABASE mydb TO totoro;
   ```
@y
   ```sql
   GRANT ALL ON DATABASE mydb TO totoro;
   ```
@z

@x
4. Type `quit` to exit the shell.
@y
4. Type `quit` to exit the shell.
@z

@x
The following is an example of interaction with the SQL shell.
@y
The following is an example of interaction with the SQL shell.
@z

@x
```console
$ sudo docker exec -it roach ./cockroach sql --insecure
#
# Welcome to the CockroachDB SQL shell.
# All statements must be terminated by a semicolon.
# To exit, type: \q.
#
# Server version: CockroachDB CCL v20.1.15 (x86_64-unknown-linux-gnu, built 2021/04/26 16:11:58, go1.13.9) (same version as client)
# Cluster ID: 7f43a490-ccd6-4c2a-9534-21f393ca80ce
#
# Enter \? for a brief introduction.
#
root@:26257/defaultdb> CREATE DATABASE mydb;
CREATE DATABASE
@y
```console
$ sudo docker exec -it roach ./cockroach sql --insecure
#
# Welcome to the CockroachDB SQL shell.
# All statements must be terminated by a semicolon.
# To exit, type: \q.
#
# Server version: CockroachDB CCL v20.1.15 (x86_64-unknown-linux-gnu, built 2021/04/26 16:11:58, go1.13.9) (same version as client)
# Cluster ID: 7f43a490-ccd6-4c2a-9534-21f393ca80ce
#
# Enter \? for a brief introduction.
#
root@:26257/defaultdb> CREATE DATABASE mydb;
CREATE DATABASE
@z

@x
Time: 22.985478ms
@y
Time: 22.985478ms
@z

@x
root@:26257/defaultdb> CREATE USER totoro;
CREATE ROLE
@y
root@:26257/defaultdb> CREATE USER totoro;
CREATE ROLE
@z

@x
Time: 13.921659ms
@y
Time: 13.921659ms
@z

@x
root@:26257/defaultdb> GRANT ALL ON DATABASE mydb TO totoro;
GRANT
@y
root@:26257/defaultdb> GRANT ALL ON DATABASE mydb TO totoro;
GRANT
@z

@x
Time: 14.217559ms
@y
Time: 14.217559ms
@z

@x
root@:26257/defaultdb> quit
oliver@hki:~$
```
@y
root@:26257/defaultdb> quit
oliver@hki:~$
```
@z

@x
#### Meet the example application
@y
#### Meet the example application
@z

@x
Now that you have started and configured the database engine, you can switch your attention to the application.
@y
Now that you have started and configured the database engine, you can switch your attention to the application.
@z

@x
The example application for this module is an extended version of `docker-gs-ping` application you've used in the previous modules. You have two options:
@y
The example application for this module is an extended version of `docker-gs-ping` application you've used in the previous modules. You have two options:
@z

@x
- You can update your local copy of `docker-gs-ping` to match the new extended version presented in this chapter; or
- You can clone the [docker/docker-gs-ping-dev](https://github.com/docker/docker-gs-ping-dev) repository. This latter approach is recommended.
@y
- You can update your local copy of `docker-gs-ping` to match the new extended version presented in this chapter; or
- You can clone the [docker/docker-gs-ping-dev](https://github.com/docker/docker-gs-ping-dev) repository. This latter approach is recommended.
@z

@x
To checkout the example application, run:
@y
To checkout the example application, run:
@z

@x
```console
$ git clone https://github.com/docker/docker-gs-ping-dev.git
# ... output omitted ...
```
@y
```console
$ git clone https://github.com/docker/docker-gs-ping-dev.git
# ... output omitted ...
```
@z

@x
The application's `main.go` now includes database initialization code, as well as the code to implement a new business requirement:
@y
The application's `main.go` now includes database initialization code, as well as the code to implement a new business requirement:
@z

@x
- An HTTP `POST` request to `/send` containing a `{ "value" : string }` JSON must save the value to the database.
@y
- An HTTP `POST` request to `/send` containing a `{ "value" : string }` JSON must save the value to the database.
@z

@x
You also have an update for another business requirement. The requirement was:
@y
You also have an update for another business requirement. The requirement was:
@z

@x
- The application responds with a text message containing a heart symbol ("`<3`") on requests to `/`.
@y
- The application responds with a text message containing a heart symbol ("`<3`") on requests to `/`.
@z

@x
And now it's going to be:
@y
And now it's going to be:
@z

@x
- The application responds with the string containing the count of messages stored in the database, enclosed in the parentheses.
@y
- The application responds with the string containing the count of messages stored in the database, enclosed in the parentheses.
@z

@x
  Example output: `Hello, Docker! (7)`
@y
  Example output: `Hello, Docker! (7)`
@z

@x
The full source code listing of `main.go` follows.
@y
The full source code listing of `main.go` follows.
@z

@x
```go
package main
@y
```go
package main
@z

@x
import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"net/http"
	"os"
@y
import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"net/http"
	"os"
@z

@x
	"github.com/cenkalti/backoff/v4"
	"github.com/cockroachdb/cockroach-go/v2/crdb"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)
@y
	"github.com/cenkalti/backoff/v4"
	"github.com/cockroachdb/cockroach-go/v2/crdb"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)
@z

@x
func main() {
@y
func main() {
@z

@x
	e := echo.New()
@y
	e := echo.New()
@z

@x
	e.Use(middleware.Logger())
	e.Use(middleware.Recover())
@y
	e.Use(middleware.Logger())
	e.Use(middleware.Recover())
@z

@x
	db, err := initStore()
	if err != nil {
		log.Fatalf("failed to initialize the store: %s", err)
	}
	defer db.Close()
@y
	db, err := initStore()
	if err != nil {
		log.Fatalf("failed to initialize the store: %s", err)
	}
	defer db.Close()
@z

@x
	e.GET("/", func(c echo.Context) error {
		return rootHandler(db, c)
	})
@y
	e.GET("/", func(c echo.Context) error {
		return rootHandler(db, c)
	})
@z

@x
	e.GET("/ping", func(c echo.Context) error {
		return c.JSON(http.StatusOK, struct{ Status string }{Status: "OK"})
	})
@y
	e.GET("/ping", func(c echo.Context) error {
		return c.JSON(http.StatusOK, struct{ Status string }{Status: "OK"})
	})
@z

@x
	e.POST("/send", func(c echo.Context) error {
		return sendHandler(db, c)
	})
@y
	e.POST("/send", func(c echo.Context) error {
		return sendHandler(db, c)
	})
@z

@x
	httpPort := os.Getenv("HTTP_PORT")
	if httpPort == "" {
		httpPort = "8080"
	}
@y
	httpPort := os.Getenv("HTTP_PORT")
	if httpPort == "" {
		httpPort = "8080"
	}
@z

@x
	e.Logger.Fatal(e.Start(":" + httpPort))
}
@y
	e.Logger.Fatal(e.Start(":" + httpPort))
}
@z

@x
type Message struct {
	Value string `json:"value"`
}
@y
type Message struct {
	Value string `json:"value"`
}
@z

@x
func initStore() (*sql.DB, error) {
@y
func initStore() (*sql.DB, error) {
@z

@x
	pgConnString := fmt.Sprintf("host=%s port=%s dbname=%s user=%s password=%s sslmode=disable",
		os.Getenv("PGHOST"),
		os.Getenv("PGPORT"),
		os.Getenv("PGDATABASE"),
		os.Getenv("PGUSER"),
		os.Getenv("PGPASSWORD"),
	)
@y
	pgConnString := fmt.Sprintf("host=%s port=%s dbname=%s user=%s password=%s sslmode=disable",
		os.Getenv("PGHOST"),
		os.Getenv("PGPORT"),
		os.Getenv("PGDATABASE"),
		os.Getenv("PGUSER"),
		os.Getenv("PGPASSWORD"),
	)
@z

@x
	var (
		db  *sql.DB
		err error
	)
	openDB := func() error {
		db, err = sql.Open("postgres", pgConnString)
		return err
	}
@y
	var (
		db  *sql.DB
		err error
	)
	openDB := func() error {
		db, err = sql.Open("postgres", pgConnString)
		return err
	}
@z

@x
	err = backoff.Retry(openDB, backoff.NewExponentialBackOff())
	if err != nil {
		return nil, err
	}
@y
	err = backoff.Retry(openDB, backoff.NewExponentialBackOff())
	if err != nil {
		return nil, err
	}
@z

@x
	if _, err := db.Exec(
		"CREATE TABLE IF NOT EXISTS message (value TEXT PRIMARY KEY)"); err != nil {
		return nil, err
	}
@y
	if _, err := db.Exec(
		"CREATE TABLE IF NOT EXISTS message (value TEXT PRIMARY KEY)"); err != nil {
		return nil, err
	}
@z

@x
	return db, nil
}
@y
	return db, nil
}
@z

@x
func rootHandler(db *sql.DB, c echo.Context) error {
	r, err := countRecords(db)
	if err != nil {
		return c.HTML(http.StatusInternalServerError, err.Error())
	}
	return c.HTML(http.StatusOK, fmt.Sprintf("Hello, Docker! (%d)\n", r))
}
@y
func rootHandler(db *sql.DB, c echo.Context) error {
	r, err := countRecords(db)
	if err != nil {
		return c.HTML(http.StatusInternalServerError, err.Error())
	}
	return c.HTML(http.StatusOK, fmt.Sprintf("Hello, Docker! (%d)\n", r))
}
@z

@x
func sendHandler(db *sql.DB, c echo.Context) error {
@y
func sendHandler(db *sql.DB, c echo.Context) error {
@z

@x
	m := &Message{}
@y
	m := &Message{}
@z

@x
	if err := c.Bind(m); err != nil {
		return c.JSON(http.StatusInternalServerError, err)
	}
@y
	if err := c.Bind(m); err != nil {
		return c.JSON(http.StatusInternalServerError, err)
	}
@z

@x
	err := crdb.ExecuteTx(context.Background(), db, nil,
		func(tx *sql.Tx) error {
			_, err := tx.Exec(
				"INSERT INTO message (value) VALUES ($1) ON CONFLICT (value) DO UPDATE SET value = excluded.value",
				m.Value,
			)
			if err != nil {
				return c.JSON(http.StatusInternalServerError, err)
			}
			return nil
		})
@y
	err := crdb.ExecuteTx(context.Background(), db, nil,
		func(tx *sql.Tx) error {
			_, err := tx.Exec(
				"INSERT INTO message (value) VALUES ($1) ON CONFLICT (value) DO UPDATE SET value = excluded.value",
				m.Value,
			)
			if err != nil {
				return c.JSON(http.StatusInternalServerError, err)
			}
			return nil
		})
@z

@x
	if err != nil {
		return c.JSON(http.StatusInternalServerError, err)
	}
@y
	if err != nil {
		return c.JSON(http.StatusInternalServerError, err)
	}
@z

@x
	return c.JSON(http.StatusOK, m)
}
@y
	return c.JSON(http.StatusOK, m)
}
@z

@x
func countRecords(db *sql.DB) (int, error) {
@y
func countRecords(db *sql.DB) (int, error) {
@z

@x
	rows, err := db.Query("SELECT COUNT(*) FROM message")
	if err != nil {
		return 0, err
	}
	defer rows.Close()
@y
	rows, err := db.Query("SELECT COUNT(*) FROM message")
	if err != nil {
		return 0, err
	}
	defer rows.Close()
@z

@x
	count := 0
	for rows.Next() {
		if err := rows.Scan(&count); err != nil {
			return 0, err
		}
		rows.Close()
	}
@y
	count := 0
	for rows.Next() {
		if err := rows.Scan(&count); err != nil {
			return 0, err
		}
		rows.Close()
	}
@z

@x
	return count, nil
}
```
@y
	return count, nil
}
```
@z

@x
The repository also includes the `Dockerfile`, which is almost exactly the same as the multi-stage `Dockerfile` introduced in the previous modules. It uses the official Docker Go image to build the application and then builds the final image by placing the compiled binary into the much slimmer, distroless image.
@y
The repository also includes the `Dockerfile`, which is almost exactly the same as the multi-stage `Dockerfile` introduced in the previous modules. It uses the official Docker Go image to build the application and then builds the final image by placing the compiled binary into the much slimmer, distroless image.
@z

@x
Regardless of whether you had updated the old example application, or checked out the new one, this new Docker image has to be built to reflect the changes to the application source code.
@y
Regardless of whether you had updated the old example application, or checked out the new one, this new Docker image has to be built to reflect the changes to the application source code.
@z

@x
#### Build the application
@y
#### Build the application
@z

@x
You can build the image with the familiar `build` command:
@y
You can build the image with the familiar `build` command:
@z

@x
```console
$ docker build --tag docker-gs-ping-roach .
```
@y
```console
$ docker build --tag docker-gs-ping-roach .
```
@z

@x
#### Run the application
@y
#### Run the application
@z

@x
Now, run your container. This time you'll need to set some environment variables so that your application knows how to access the database. For now, you’ll do this right in the `docker run` command. Later you'll see a more convenient method with Docker Compose.
@y
Now, run your container. This time you'll need to set some environment variables so that your application knows how to access the database. For now, you’ll do this right in the `docker run` command. Later you'll see a more convenient method with Docker Compose.
@z

@x
> [!NOTE]
>
> Since you're running your CockroachDB cluster in insecure mode, the value for the password can be anything.
>
> In production, don't run in insecure mode.
@y
> [!NOTE]
>
> Since you're running your CockroachDB cluster in insecure mode, the value for the password can be anything.
>
> In production, don't run in insecure mode.
@z

@x
```console
$ docker run -it --rm -d \
  --network mynet \
  --name rest-server \
  -p 80:8080 \
  -e PGUSER=totoro \
  -e PGPASSWORD=myfriend \
  -e PGHOST=db \
  -e PGPORT=26257 \
  -e PGDATABASE=mydb \
  docker-gs-ping-roach
```
@y
```console
$ docker run -it --rm -d \
  --network mynet \
  --name rest-server \
  -p 80:8080 \
  -e PGUSER=totoro \
  -e PGPASSWORD=myfriend \
  -e PGHOST=db \
  -e PGPORT=26257 \
  -e PGDATABASE=mydb \
  docker-gs-ping-roach
```
@z

@x
There are a few points to note about this command.
@y
There are a few points to note about this command.
@z

@x
- You map container port `8080` to host port `80` this time. Thus, for `GET` requests you can get away with literally `curl localhost`:
@y
- You map container port `8080` to host port `80` this time. Thus, for `GET` requests you can get away with literally `curl localhost`:
@z

@x
  ```console
  $ curl localhost
  Hello, Docker! (0)
  ```
@y
  ```console
  $ curl localhost
  Hello, Docker! (0)
  ```
@z

@x
  Or, if you prefer, a proper URL would work just as well:
@y
  Or, if you prefer, a proper URL would work just as well:
@z

@x
  ```console
  $ curl http://localhost/
  Hello, Docker! (0)
  ```
@y
  ```console
  $ curl http://localhost/
  Hello, Docker! (0)
  ```
@z

@x
- The total number of stored messages is `0` for now. This is fine, because you haven't posted anything to your application yet.
- You refer to the database container by its hostname, which is `db`. This is why you had `--hostname db` when you started the database container.
@y
- The total number of stored messages is `0` for now. This is fine, because you haven't posted anything to your application yet.
- You refer to the database container by its hostname, which is `db`. This is why you had `--hostname db` when you started the database container.
@z

@x
- The actual password doesn't matter, but it must be set to something to avoid confusing the example application.
- The container you've just run is named `rest-server`. These names are useful for managing the container lifecycle:
@y
- The actual password doesn't matter, but it must be set to something to avoid confusing the example application.
- The container you've just run is named `rest-server`. These names are useful for managing the container lifecycle:
@z

@x
  ```console
  # Don't do this just yet, it's only an example:
  $ docker container rm --force rest-server
  ```
@y
  ```console
  # Don't do this just yet, it's only an example:
  $ docker container rm --force rest-server
  ```
@z

@x
#### Test the application
@y
#### Test the application
@z

@x
In the previous section, you've already tested querying your application with `GET` and it returned zero for the stored message counter. Now, post some messages to it:
@y
In the previous section, you've already tested querying your application with `GET` and it returned zero for the stored message counter. Now, post some messages to it:
@z

@x
```console
$ curl --request POST \
  --url http://localhost/send \
  --header 'content-type: application/json' \
  --data '{"value": "Hello, Docker!"}'
```
@y
```console
$ curl --request POST \
  --url http://localhost/send \
  --header 'content-type: application/json' \
  --data '{"value": "Hello, Docker!"}'
```
@z

@x
The application responds with the contents of the message, which means it has been saved in the database:
@y
The application responds with the contents of the message, which means it has been saved in the database:
@z

@x
```json
{ "value": "Hello, Docker!" }
```
@y
```json
{ "value": "Hello, Docker!" }
```
@z

@x
Send another message:
@y
Send another message:
@z

@x
```console
$ curl --request POST \
  --url http://localhost/send \
  --header 'content-type: application/json' \
  --data '{"value": "Hello, Oliver!"}'
```
@y
```console
$ curl --request POST \
  --url http://localhost/send \
  --header 'content-type: application/json' \
  --data '{"value": "Hello, Oliver!"}'
```
@z

@x
And again, you get the value of the message back:
@y
And again, you get the value of the message back:
@z

@x
```json
{ "value": "Hello, Oliver!" }
```
@y
```json
{ "value": "Hello, Oliver!" }
```
@z

@x
Run curl and see what the message counter says:
@y
Run curl and see what the message counter says:
@z

@x
```console
$ curl localhost
Hello, Docker! (2)
```
@y
```console
$ curl localhost
Hello, Docker! (2)
```
@z

@x
In this example, you sent two messages and the database kept them. Or has it? Stop and remove all your containers, but not the volumes, and try again.
@y
In this example, you sent two messages and the database kept them. Or has it? Stop and remove all your containers, but not the volumes, and try again.
@z

@x
First, stop the containers:
@y
First, stop the containers:
@z

@x
```console
$ docker container stop rest-server roach
rest-server
roach
```
@y
```console
$ docker container stop rest-server roach
rest-server
roach
```
@z

@x
Then, remove them:
@y
Then, remove them:
@z

@x
```console
$ docker container rm rest-server roach
rest-server
roach
```
@y
```console
$ docker container rm rest-server roach
rest-server
roach
```
@z

@x
Verify that they're gone:
@y
Verify that they're gone:
@z

@x
```console
$ docker container list --all
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```
@y
```console
$ docker container list --all
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```
@z

@x
And start them again, database first:
@y
And start them again, database first:
@z

@x
```console
$ docker run -d \
  --name roach \
  --hostname db \
  --network mynet \
  -p 26257:26257 \
  -p 8080:8080 \
  -v roach:/cockroach/cockroach-data \
  cockroachdb/cockroach:latest-v25.4 start-single-node \
  --insecure
```
@y
```console
$ docker run -d \
  --name roach \
  --hostname db \
  --network mynet \
  -p 26257:26257 \
  -p 8080:8080 \
  -v roach:/cockroach/cockroach-data \
  cockroachdb/cockroach:latest-v25.4 start-single-node \
  --insecure
```
@z

@x
And the service next:
@y
And the service next:
@z

@x
```console
$ docker run -it --rm -d \
  --network mynet \
  --name rest-server \
  -p 80:8080 \
  -e PGUSER=totoro \
  -e PGPASSWORD=myfriend \
  -e PGHOST=db \
  -e PGPORT=26257 \
  -e PGDATABASE=mydb \
  docker-gs-ping-roach
```
@y
```console
$ docker run -it --rm -d \
  --network mynet \
  --name rest-server \
  -p 80:8080 \
  -e PGUSER=totoro \
  -e PGPASSWORD=myfriend \
  -e PGHOST=db \
  -e PGPORT=26257 \
  -e PGDATABASE=mydb \
  docker-gs-ping-roach
```
@z

@x
Lastly, query your service:
@y
Lastly, query your service:
@z

@x
```console
$ curl localhost
Hello, Docker! (2)
```
@y
```console
$ curl localhost
Hello, Docker! (2)
```
@z

@x
Great! The count of records from the database is correct although you haven't only stopped the containers, but you've also removed them before starting new instances. The difference is in the managed volume for CockroachDB, which you reused. The new CockroachDB container has read the database files from the disk, just as it normally would if it were running outside the container.
@y
Great! The count of records from the database is correct although you haven't only stopped the containers, but you've also removed them before starting new instances. The difference is in the managed volume for CockroachDB, which you reused. The new CockroachDB container has read the database files from the disk, just as it normally would if it were running outside the container.
@z

@x
#### Wind down everything
@y
#### Wind down everything
@z

@x
Remember, that you're running CockroachDB in insecure mode. Now that you've built and tested your application, it's time to wind everything down before moving on. You can list the containers that you are running with the `list` command:
@y
Remember, that you're running CockroachDB in insecure mode. Now that you've built and tested your application, it's time to wind everything down before moving on. You can list the containers that you are running with the `list` command:
@z

@x
```console
$ docker container list
```
@y
```console
$ docker container list
```
@z

@x
Now that you know the container IDs, you can use `docker container stop` and `docker container rm`, as demonstrated in the previous modules.
@y
Now that you know the container IDs, you can use `docker container stop` and `docker container rm`, as demonstrated in the previous modules.
@z

@x
Stop the CockroachDB and `docker-gs-ping-roach` containers before moving on.
@y
Stop the CockroachDB and `docker-gs-ping-roach` containers before moving on.
@z

@x
### Better productivity with Docker Compose
@y
### Better productivity with Docker Compose
@z

@x
At this point, you might be wondering if there is a way to avoid having to deal with long lists of arguments to the `docker` command. The toy example you used in this series requires five environment variables to define the connection to the database. A real application might need many, many more. Then there is also a question of dependencies. Ideally, you want to make sure that the database is started before your application is run. And spinning up the database instance may require another Docker command with many options. But there is a better way to orchestrate these deployments for local development purposes.
@y
At this point, you might be wondering if there is a way to avoid having to deal with long lists of arguments to the `docker` command. The toy example you used in this series requires five environment variables to define the connection to the database. A real application might need many, many more. Then there is also a question of dependencies. Ideally, you want to make sure that the database is started before your application is run. And spinning up the database instance may require another Docker command with many options. But there is a better way to orchestrate these deployments for local development purposes.
@z

@x
In this section, you'll create a Docker Compose file to start your `docker-gs-ping-roach` application and CockroachDB database engine with a single command.
@y
In this section, you'll create a Docker Compose file to start your `docker-gs-ping-roach` application and CockroachDB database engine with a single command.
@z

@x
#### Configure Docker Compose
@y
#### Configure Docker Compose
@z

@x
In your application's directory, create a new text file named `compose.yaml` with the following content.
@y
In your application's directory, create a new text file named `compose.yaml` with the following content.
@z

@x
```yaml
services:
  docker-gs-ping-roach:
    depends_on:
      - roach
    build:
      context: .
    container_name: rest-server
    hostname: rest-server
    networks:
      - mynet
    ports:
      - 80:8080
    environment:
      - PGUSER=${PGUSER:-totoro}
      - PGPASSWORD=${PGPASSWORD:?database password not set}
      - PGHOST=${PGHOST:-db}
      - PGPORT=${PGPORT:-26257}
      - PGDATABASE=${PGDATABASE:-mydb}
    deploy:
      restart_policy:
        condition: on-failure
  roach:
    image: cockroachdb/cockroach:latest-v25.4
    container_name: roach
    hostname: db
    networks:
      - mynet
    ports:
      - 26257:26257
      - 8080:8080
    volumes:
      - roach:/cockroach/cockroach-data
    command: start-single-node --insecure
@y
```yaml
services:
  docker-gs-ping-roach:
    depends_on:
      - roach
    build:
      context: .
    container_name: rest-server
    hostname: rest-server
    networks:
      - mynet
    ports:
      - 80:8080
    environment:
      - PGUSER=${PGUSER:-totoro}
      - PGPASSWORD=${PGPASSWORD:?database password not set}
      - PGHOST=${PGHOST:-db}
      - PGPORT=${PGPORT:-26257}
      - PGDATABASE=${PGDATABASE:-mydb}
    deploy:
      restart_policy:
        condition: on-failure
  roach:
    image: cockroachdb/cockroach:latest-v25.4
    container_name: roach
    hostname: db
    networks:
      - mynet
    ports:
      - 26257:26257
      - 8080:8080
    volumes:
      - roach:/cockroach/cockroach-data
    command: start-single-node --insecure
@z

@x
volumes:
  roach:
@y
volumes:
  roach:
@z

@x
networks:
  mynet:
    driver: bridge
```
@y
networks:
  mynet:
    driver: bridge
```
@z

@x
This Docker Compose configuration is super convenient as you don't have to type all the parameters to pass to the `docker run` command. You can declaratively do that in the Docker Compose file. The [Docker Compose documentation pages](/manuals/compose/_index.md) are quite extensive and include a full reference for the Docker Compose file format.
@y
This Docker Compose configuration is super convenient as you don't have to type all the parameters to pass to the `docker run` command. You can declaratively do that in the Docker Compose file. The [Docker Compose documentation pages](manuals/compose/_index.md) are quite extensive and include a full reference for the Docker Compose file format.
@z

@x
#### The `.env` file
@y
#### The `.env` file
@z

@x
Docker Compose will automatically read environment variables from a `.env` file if it's available. Since your Compose file requires `PGPASSWORD` to be set, add the following content to the `.env` file:
@y
Docker Compose will automatically read environment variables from a `.env` file if it's available. Since your Compose file requires `PGPASSWORD` to be set, add the following content to the `.env` file:
@z

@x
```bash
PGPASSWORD=whatever
```
@y
```bash
PGPASSWORD=whatever
```
@z

@x
The exact value doesn't really matter for this example, because you run CockroachDB in insecure mode. Make sure you set the variable to some value to avoid getting an error.
@y
The exact value doesn't really matter for this example, because you run CockroachDB in insecure mode. Make sure you set the variable to some value to avoid getting an error.
@z

@x
#### Merging Compose files
@y
#### Merging Compose files
@z

@x
The filename `compose.yaml` is the default filename which `docker compose` command recognizes if no `-f` flag is provided. This means you can have multiple Docker Compose files if your environment has such requirements. Furthermore, Docker Compose files are composable, so multiple files can be specified on the command line to merge parts of the configuration together. The following list shows a few examples of scenarios where such a feature would be useful:
@y
The filename `compose.yaml` is the default filename which `docker compose` command recognizes if no `-f` flag is provided. This means you can have multiple Docker Compose files if your environment has such requirements. Furthermore, Docker Compose files are composable, so multiple files can be specified on the command line to merge parts of the configuration together. The following list shows a few examples of scenarios where such a feature would be useful:
@z

@x
- Using a bind mount for the source code for local development but not when running the CI tests;
- Switching between using a pre-built image for the frontend for some API application vs creating a bind mount for source code;
- Adding additional services for integration testing;
- And many more...
@y
- Using a bind mount for the source code for local development but not when running the CI tests;
- Switching between using a pre-built image for the frontend for some API application vs creating a bind mount for source code;
- Adding additional services for integration testing;
- And many more...
@z

@x
You aren't going to cover any of these advanced use cases here.
@y
You aren't going to cover any of these advanced use cases here.
@z

@x
#### Variable substitution in Docker Compose
@y
#### Variable substitution in Docker Compose
@z

@x
One of the really cool features of Docker Compose is [variable substitution](/reference/compose-file/interpolation.md). You can see some examples in the Compose file, `environment` section. By means of an example:
@y
One of the really cool features of Docker Compose is [variable substitution](reference/compose-file/interpolation.md). You can see some examples in the Compose file, `environment` section. By means of an example:
@z

@x
- `PGUSER=${PGUSER:-totoro}` means that inside the container, the environment variable `PGUSER` shall be set to the same value as it has on the host machine where Docker Compose is run. If there is no environment variable with this name on the host machine, the variable inside the container gets the default value of `totoro`.
- `PGPASSWORD=${PGPASSWORD:?database password not set}` means that if the environment variable `PGPASSWORD` isn't set on the host, Docker Compose will display an error. This is OK, because you don't want to hard-code default values for the password. You set the password value in the `.env` file, which is local to your machine. It is always a good idea to add `.env` to `.gitignore` to prevent the secrets being checked into the version control.
@y
- `PGUSER=${PGUSER:-totoro}` means that inside the container, the environment variable `PGUSER` shall be set to the same value as it has on the host machine where Docker Compose is run. If there is no environment variable with this name on the host machine, the variable inside the container gets the default value of `totoro`.
- `PGPASSWORD=${PGPASSWORD:?database password not set}` means that if the environment variable `PGPASSWORD` isn't set on the host, Docker Compose will display an error. This is OK, because you don't want to hard-code default values for the password. You set the password value in the `.env` file, which is local to your machine. It is always a good idea to add `.env` to `.gitignore` to prevent the secrets being checked into the version control.
@z

@x
Other ways of dealing with undefined or empty values exist, as documented in the [variable substitution](/reference/compose-file/interpolation.md) section of the Docker documentation.
@y
Other ways of dealing with undefined or empty values exist, as documented in the [variable substitution](reference/compose-file/interpolation.md) section of the Docker documentation.
@z

@x
#### Validating Docker Compose configuration
@y
#### Validating Docker Compose configuration
@z

@x
Before you apply changes made to a Compose configuration file, there is an opportunity to validate the content of the configuration file with the following command:
@y
Before you apply changes made to a Compose configuration file, there is an opportunity to validate the content of the configuration file with the following command:
@z

@x
```console
$ docker compose config
```
@y
```console
$ docker compose config
```
@z

@x
When this command is run, Docker Compose reads the file `compose.yaml`, parses it into a data structure in memory, validates where possible, and prints back the reconstruction of that configuration file from its internal representation. If this isn't possible due to errors, Docker prints an error message instead.
@y
When this command is run, Docker Compose reads the file `compose.yaml`, parses it into a data structure in memory, validates where possible, and prints back the reconstruction of that configuration file from its internal representation. If this isn't possible due to errors, Docker prints an error message instead.
@z

@x
#### Build and run the application using Docker Compose
@y
#### Build and run the application using Docker Compose
@z

@x
Start your application and confirm that it's running.
@y
Start your application and confirm that it's running.
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
You passed the `--build` flag so Docker will compile your image and then start it.
@y
You passed the `--build` flag so Docker will compile your image and then start it.
@z

@x
> [!NOTE]
>
> Docker Compose is a useful tool, but it has its own quirks. For example, no rebuild is triggered on the update to the source code unless the `--build` flag is provided. It is a very common pitfall to edit one's source code, and forget to use the `--build` flag when running `docker compose up`.
@y
> [!NOTE]
>
> Docker Compose is a useful tool, but it has its own quirks. For example, no rebuild is triggered on the update to the source code unless the `--build` flag is provided. It is a very common pitfall to edit one's source code, and forget to use the `--build` flag when running `docker compose up`.
@z

@x
Since your set-up is now run by Docker Compose, it has assigned it a project name, so you get a new volume for your CockroachDB instance. This means that your application will fail to connect to the database, because the database doesn't exist in this new volume. The terminal displays an authentication error for the database:
@y
Since your set-up is now run by Docker Compose, it has assigned it a project name, so you get a new volume for your CockroachDB instance. This means that your application will fail to connect to the database, because the database doesn't exist in this new volume. The terminal displays an authentication error for the database:
@z

@x
```text
# ... omitted output ...
rest-server             | 2021/05/10 00:54:25 failed to initialise the store: pq: password authentication failed for user totoro
roach                   | *
roach                   | * INFO: Replication was disabled for this cluster.
roach                   | * When/if adding nodes in the future, update zone configurations to increase the replication factor.
roach                   | *
roach                   | CockroachDB node starting at 2021-05-10 00:54:26.398177 +0000 UTC (took 3.0s)
roach                   | build:               CCL v20.1.15 @ 2021/04/26 16:11:58 (go1.13.9)
roach                   | webui:               http://db:8080
roach                   | sql:                 postgresql://root@db:26257?sslmode=disable
roach                   | RPC client flags:    /cockroach/cockroach <client cmd> --host=db:26257 --insecure
roach                   | logs:                /cockroach/cockroach-data/logs
roach                   | temp dir:            /cockroach/cockroach-data/cockroach-temp349434348
roach                   | external I/O path:   /cockroach/cockroach-data/extern
roach                   | store[0]:            path=/cockroach/cockroach-data
roach                   | storage engine:      rocksdb
roach                   | status:              initialized new cluster
roach                   | clusterID:           b7b1cb93-558f-4058-b77e-8a4ddb329a88
roach                   | nodeID:              1
rest-server exited with code 0
rest-server             | 2021/05/10 00:54:25 failed to initialise the store: pq: password authentication failed for user totoro
rest-server             | 2021/05/10 00:54:26 failed to initialise the store: pq: password authentication failed for user totoro
rest-server             | 2021/05/10 00:54:29 failed to initialise the store: pq: password authentication failed for user totoro
rest-server             | 2021/05/10 00:54:25 failed to initialise the store: pq: password authentication failed for user totoro
rest-server             | 2021/05/10 00:54:26 failed to initialise the store: pq: password authentication failed for user totoro
rest-server             | 2021/05/10 00:54:29 failed to initialise the store: pq: password authentication failed for user totoro
rest-server exited with code 1
# ... omitted output ...
```
@y
```text
# ... omitted output ...
rest-server             | 2021/05/10 00:54:25 failed to initialise the store: pq: password authentication failed for user totoro
roach                   | *
roach                   | * INFO: Replication was disabled for this cluster.
roach                   | * When/if adding nodes in the future, update zone configurations to increase the replication factor.
roach                   | *
roach                   | CockroachDB node starting at 2021-05-10 00:54:26.398177 +0000 UTC (took 3.0s)
roach                   | build:               CCL v20.1.15 @ 2021/04/26 16:11:58 (go1.13.9)
roach                   | webui:               http://db:8080
roach                   | sql:                 postgresql://root@db:26257?sslmode=disable
roach                   | RPC client flags:    /cockroach/cockroach <client cmd> --host=db:26257 --insecure
roach                   | logs:                /cockroach/cockroach-data/logs
roach                   | temp dir:            /cockroach/cockroach-data/cockroach-temp349434348
roach                   | external I/O path:   /cockroach/cockroach-data/extern
roach                   | store[0]:            path=/cockroach/cockroach-data
roach                   | storage engine:      rocksdb
roach                   | status:              initialized new cluster
roach                   | clusterID:           b7b1cb93-558f-4058-b77e-8a4ddb329a88
roach                   | nodeID:              1
rest-server exited with code 0
rest-server             | 2021/05/10 00:54:25 failed to initialise the store: pq: password authentication failed for user totoro
rest-server             | 2021/05/10 00:54:26 failed to initialise the store: pq: password authentication failed for user totoro
rest-server             | 2021/05/10 00:54:29 failed to initialise the store: pq: password authentication failed for user totoro
rest-server             | 2021/05/10 00:54:25 failed to initialise the store: pq: password authentication failed for user totoro
rest-server             | 2021/05/10 00:54:26 failed to initialise the store: pq: password authentication failed for user totoro
rest-server             | 2021/05/10 00:54:29 failed to initialise the store: pq: password authentication failed for user totoro
rest-server exited with code 1
# ... omitted output ...
```
@z

@x
Because of the way you set up your deployment using `restart_policy`, the failing container is being restarted every 20 seconds. So, in order to fix the problem, you need to log in to the database engine and create the user. You've done it before in [Configure the database engine](#configure-the-database-engine).
@y
Because of the way you set up your deployment using `restart_policy`, the failing container is being restarted every 20 seconds. So, in order to fix the problem, you need to log in to the database engine and create the user. You've done it before in [Configure the database engine](#configure-the-database-engine).
@z

@x
This isn't a big deal. All you have to do is to connect to CockroachDB instance and run the three SQL commands to create the database and the user, as described in [Configure the database engine](#configure-the-database-engine).
@y
This isn't a big deal. All you have to do is to connect to CockroachDB instance and run the three SQL commands to create the database and the user, as described in [Configure the database engine](#configure-the-database-engine).
@z

@x
So, log in to the database engine from another terminal:
@y
So, log in to the database engine from another terminal:
@z

@x
```console
$ docker exec -it roach ./cockroach sql --insecure
```
@y
```console
$ docker exec -it roach ./cockroach sql --insecure
```
@z

@x
And run the same commands as before to create the database `mydb`, the user `totoro`, and to grant that user necessary permissions. Once you do that (and the example application container is automatically restarts), the `rest-service` stops failing and restarting and the console goes quiet.
@y
And run the same commands as before to create the database `mydb`, the user `totoro`, and to grant that user necessary permissions. Once you do that (and the example application container is automatically restarts), the `rest-service` stops failing and restarting and the console goes quiet.
@z

@x
It would have been possible to connect the volume that you had previously used, but for the purposes of this example it's more trouble than it's worth and it also provided an opportunity to show how to introduce resilience into your deployment via the `restart_policy` Compose file feature.
@y
It would have been possible to connect the volume that you had previously used, but for the purposes of this example it's more trouble than it's worth and it also provided an opportunity to show how to introduce resilience into your deployment via the `restart_policy` Compose file feature.
@z

@x
#### Testing the application
@y
#### Testing the application
@z

@x
Now, test your API endpoint. In the new terminal, run the following command:
@y
Now, test your API endpoint. In the new terminal, run the following command:
@z

@x
```console
$ curl http://localhost/
```
@y
```console
$ curl http://localhost/
```
@z

@x
You should receive the following response:
@y
You should receive the following response:
@z

@x
```json
Hello, Docker! (0)
```
@y
```json
Hello, Docker! (0)
```
@z

@x
#### Shutting down
@y
#### Shutting down
@z

@x
To stop the containers started by Docker Compose, press `ctrl+c` in the terminal where you ran `docker compose up`. To remove those containers after they've been stopped, run `docker compose down`.
@y
To stop the containers started by Docker Compose, press `ctrl+c` in the terminal where you ran `docker compose up`. To remove those containers after they've been stopped, run `docker compose down`.
@z

@x
#### Detached mode
@y
#### Detached mode
@z

@x
You can run containers started by the `docker compose` command in detached mode, just as you would with the `docker` command, by using the `-d` flag.
@y
You can run containers started by the `docker compose` command in detached mode, just as you would with the `docker` command, by using the `-d` flag.
@z

@x
To start the stack, defined by the Compose file in detached mode, run:
@y
To start the stack, defined by the Compose file in detached mode, run:
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
Then, you can use `docker compose stop` to stop the containers and `docker compose down` to remove them.
@y
Then, you can use `docker compose stop` to stop the containers and `docker compose down` to remove them.
@z

@x
### Further exploration
@y
### Further exploration
@z

@x
You can run `docker compose` to see what other commands are available.
@y
You can run `docker compose` to see what other commands are available.
@z

@x
### Wrap up
@y
### Wrap up
@z

@x
There are some tangential, yet interesting points that were purposefully not covered in this chapter. For the more adventurous reader, this section offers some pointers for further study.
@y
There are some tangential, yet interesting points that were purposefully not covered in this chapter. For the more adventurous reader, this section offers some pointers for further study.
@z

@x
#### Persistent storage
@y
#### Persistent storage
@z

@x
A managed volume isn't the only way to provide your container with persistent storage. It is highly recommended to get acquainted with available storage options and their use cases, covered in [Manage data in Docker](/manuals/engine/storage/_index.md).
@y
A managed volume isn't the only way to provide your container with persistent storage. It is highly recommended to get acquainted with available storage options and their use cases, covered in [Manage data in Docker](manuals/engine/storage/_index.md).
@z

@x
#### CockroachDB clusters
@y
#### CockroachDB clusters
@z

@x
You ran a single instance of CockroachDB, which was enough for this example. But, it's possible to run a CockroachDB cluster, which is made of multiple instances of CockroachDB, each instance running in its own container. Since CockroachDB engine is distributed by design, it would have taken surprisingly little change to your procedure to run a cluster with multiple nodes.
@y
You ran a single instance of CockroachDB, which was enough for this example. But, it's possible to run a CockroachDB cluster, which is made of multiple instances of CockroachDB, each instance running in its own container. Since CockroachDB engine is distributed by design, it would have taken surprisingly little change to your procedure to run a cluster with multiple nodes.
@z

@x
Such distributed set-up offers interesting possibilities, such as applying Chaos Engineering techniques to simulate parts of the cluster failing and evaluating your application's ability to cope with such failures.
@y
Such distributed set-up offers interesting possibilities, such as applying Chaos Engineering techniques to simulate parts of the cluster failing and evaluating your application's ability to cope with such failures.
@z

@x
If you are interested in experimenting with CockroachDB clusters, check out:
@y
If you are interested in experimenting with CockroachDB clusters, check out:
@z

@x
- [Start a CockroachDB Cluster in Docker](https://www.cockroachlabs.com/docs/v20.2/start-a-local-cluster-in-docker-mac.html) article; and
- Documentation for Docker Compose keywords [`deploy`](/reference/compose-file/legacy-versions.md) and [`replicas`](/reference/compose-file/legacy-versions.md).
@y
- [Start a CockroachDB Cluster in Docker](https://www.cockroachlabs.com/docs/v20.2/start-a-local-cluster-in-docker-mac.html) article; and
- Documentation for Docker Compose keywords [`deploy`](reference/compose-file/legacy-versions.md) and [`replicas`](reference/compose-file/legacy-versions.md).
@z

@x
#### Other databases
@y
#### Other databases
@z

@x
Since you didn't run a cluster of CockroachDB instances, you might be wondering whether you could have used a non-distributed database engine. The answer is 'yes', and if you were to pick a more traditional SQL database, such as [PostgreSQL](https://www.postgresql.org/), the process described in this chapter would have been very similar.
@y
Since you didn't run a cluster of CockroachDB instances, you might be wondering whether you could have used a non-distributed database engine. The answer is 'yes', and if you were to pick a more traditional SQL database, such as [PostgreSQL](https://www.postgresql.org/), the process described in this chapter would have been very similar.
@z

@x
## Run your tests using Go test
@y
## Run your tests using Go test
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Complete the [Build your Go image](#build-your-go-image) section of this guide.
@y
Complete the [Build your Go image](#build-your-go-image) section of this guide.
@z

@x
### Overview
@y
### Overview
@z

@x
Testing is an essential part of modern software development. Testing can mean a
lot of things to different development teams. There are unit tests, integration
tests and end-to-end testing. In this guide you take a look at running your unit
tests in Docker when building.
@y
Testing is an essential part of modern software development. Testing can mean a
lot of things to different development teams. There are unit tests, integration
tests and end-to-end testing. In this guide you take a look at running your unit
tests in Docker when building.
@z

@x
For this section, use the `docker-gs-ping` project that you cloned in [Build
your Go image](#build-your-go-image).
@y
For this section, use the `docker-gs-ping` project that you cloned in [Build
your Go image](#build-your-go-image).
@z

@x
### Run tests when building
@y
### Run tests when building
@z

@x
To run your tests when building, you need to add a test stage to the
`Dockerfile.multistage`. The `Dockerfile.multistage` in the sample application's
repository already has the following content:
@y
To run your tests when building, you need to add a test stage to the
`Dockerfile.multistage`. The `Dockerfile.multistage` in the sample application's
repository already has the following content:
@z

@x
```dockerfile {hl_lines="15-17"}
# syntax=docker/dockerfile:1
@y
```dockerfile {hl_lines="15-17"}
# syntax=docker/dockerfile:1
@z

@x
# Build the application from source
FROM golang:1.19 AS build-stage
@y
# Build the application from source
FROM golang:1.19 AS build-stage
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
COPY go.mod go.sum ./
RUN go mod download
@y
COPY go.mod go.sum ./
RUN go mod download
@z

@x
COPY *.go ./
@y
COPY *.go ./
@z

@x
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-gs-ping
@y
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-gs-ping
@z

@x
# Run the tests in the container
FROM build-stage AS run-test-stage
RUN go test -v ./...
@y
# Run the tests in the container
FROM build-stage AS run-test-stage
RUN go test -v ./...
@z

@x
# Deploy the application binary into a lean image
FROM gcr.io/distroless/base-debian11 AS build-release-stage
@y
# Deploy the application binary into a lean image
FROM gcr.io/distroless/base-debian11 AS build-release-stage
@z

@x
WORKDIR /
@y
WORKDIR /
@z

@x
COPY --from=build-stage /docker-gs-ping /docker-gs-ping
@y
COPY --from=build-stage /docker-gs-ping /docker-gs-ping
@z

@x
EXPOSE 8080
@y
EXPOSE 8080
@z

@x
USER nonroot:nonroot
@y
USER nonroot:nonroot
@z

@x
ENTRYPOINT ["/docker-gs-ping"]
```
@y
ENTRYPOINT ["/docker-gs-ping"]
```
@z

@x
Run the following command to build an image using the `run-test-stage` stage as the target and view the test results. Include `--progress plain` to view the build output, `--no-cache` to ensure the tests always run, and `--target run-test-stage` to target the test stage.
@y
Run the following command to build an image using the `run-test-stage` stage as the target and view the test results. Include `--progress plain` to view the build output, `--no-cache` to ensure the tests always run, and `--target run-test-stage` to target the test stage.
@z

@x
```console
$ docker build -f Dockerfile.multistage -t docker-gs-ping-test --progress plain --no-cache --target run-test-stage .
```
@y
```console
$ docker build -f Dockerfile.multistage -t docker-gs-ping-test --progress plain --no-cache --target run-test-stage .
```
@z

@x
You should see output containing the following.
@y
You should see output containing the following.
@z

@x
```text
#13 [run-test-stage 1/1] RUN go test -v ./...
#13 4.915 === RUN   TestIntMinBasic
#13 4.915 --- PASS: TestIntMinBasic (0.00s)
#13 4.915 === RUN   TestIntMinTableDriven
#13 4.915 === RUN   TestIntMinTableDriven/0,1
#13 4.915 === RUN   TestIntMinTableDriven/1,0
#13 4.915 === RUN   TestIntMinTableDriven/2,-2
#13 4.915 === RUN   TestIntMinTableDriven/0,-1
#13 4.915 === RUN   TestIntMinTableDriven/-1,0
#13 4.915 --- PASS: TestIntMinTableDriven (0.00s)
#13 4.915     --- PASS: TestIntMinTableDriven/0,1 (0.00s)
#13 4.915     --- PASS: TestIntMinTableDriven/1,0 (0.00s)
#13 4.915     --- PASS: TestIntMinTableDriven/2,-2 (0.00s)
#13 4.915     --- PASS: TestIntMinTableDriven/0,-1 (0.00s)
#13 4.915     --- PASS: TestIntMinTableDriven/-1,0 (0.00s)
#13 4.915 PASS
```
@y
```text
#13 [run-test-stage 1/1] RUN go test -v ./...
#13 4.915 === RUN   TestIntMinBasic
#13 4.915 --- PASS: TestIntMinBasic (0.00s)
#13 4.915 === RUN   TestIntMinTableDriven
#13 4.915 === RUN   TestIntMinTableDriven/0,1
#13 4.915 === RUN   TestIntMinTableDriven/1,0
#13 4.915 === RUN   TestIntMinTableDriven/2,-2
#13 4.915 === RUN   TestIntMinTableDriven/0,-1
#13 4.915 === RUN   TestIntMinTableDriven/-1,0
#13 4.915 --- PASS: TestIntMinTableDriven (0.00s)
#13 4.915     --- PASS: TestIntMinTableDriven/0,1 (0.00s)
#13 4.915     --- PASS: TestIntMinTableDriven/1,0 (0.00s)
#13 4.915     --- PASS: TestIntMinTableDriven/2,-2 (0.00s)
#13 4.915     --- PASS: TestIntMinTableDriven/0,-1 (0.00s)
#13 4.915     --- PASS: TestIntMinTableDriven/-1,0 (0.00s)
#13 4.915 PASS
```
@z
