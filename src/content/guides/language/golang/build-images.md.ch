%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Build your Go image
linkTitle: Build images
weight: 5
keywords: containers, images, go, golang, dockerfiles, coding, build, push, run
description: Learn how to build your first Docker image by writing a Dockerfile
aliases:
- /get-started/golang/build-images/
- /language/golang/build-images/
---
@y
---
title: Build your Go image
linkTitle: Build images
weight: 5
keywords: containers, images, go, golang, dockerfiles, coding, build, push, run
description: Learn how to build your first Docker image by writing a Dockerfile
aliases:
- /get-started/golang/build-images/
- /language/golang/build-images/
---
@z

@x
## Overview
@y
## Overview
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
## Required software
@y
## Required software
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
## Meet the example application
@y
## Meet the example application
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
* It responds with a string containing a heart symbol (`<3`) to requests to `/`.
* It responds with `{"Status" : "OK"}` JSON to a request to `/health`.
@y
* It responds with a string containing a heart symbol (`<3`) to requests to `/`.
* It responds with `{"Status" : "OK"}` JSON to a request to `/health`.
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
## Create a Dockerfile for the application
@y
## Create a Dockerfile for the application
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
> reference](/reference/dockerfile.md#copy). This trailing slash can
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
regard. It's just convenient to use it to keep the file paths short for improved
readability.
@y
This should be familiar. The result of that command will be a static application
binary named `docker-gs-ping` and located in the root of the filesystem of the
image that you are building. You could have put the binary into any other place
you desire inside that image, the root directory has no special meaning in this
regard. It's just convenient to use it to keep the file paths short for improved
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
## Build the image
@y
## Build the image
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
the image with a string value, which is easy for humans to read and recognise.
If you don't pass a `--tag`, Docker will use `latest` as the default value.
@y
The build command optionally takes a `--tag` flag. This flag is used to label
the image with a string value, which is easy for humans to read and recognise.
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
The following is just an example of what these messages may look like.
@y
The build process will print some diagnostic messages as it goes through the build steps. 
The following is just an example of what these messages may look like.
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
## View local images
@y
## View local images
@z

@x
To see the list of images you have on your local machine, you have two options.
One is to use the CLI and the other is to use [Docker
Desktop](/manuals/desktop/_index.md). Since you're currently working in the
terminal, take a look at listing images with the CLI.
@y
To see the list of images you have on your local machine, you have two options.
One is to use the CLI and the other is to use [Docker
Desktop](manuals/desktop/_index.md). Since you're currently working in the
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
## Tag images
@y
## Tag images
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
new image. The tag points to the same image and is just another way to reference
the image.
@y
The Docker `tag` command creates a new tag for the image. It doesn't create a
new image. The tag points to the same image and is just another way to reference
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
## Multi-stage builds
@y
## Multi-stage builds
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
These two issues can be solved by using [multi-stage builds](/manuals/build/building/multi-stage.md).
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
it's just something you chose.
@y
Since you have two Dockerfiles now, you have to tell Docker what Dockerfile
you'd like to use to build the image. Tag the new image with `multistage`. This
tag (like any other, apart from `latest`) has no special meaning for Docker,
it's just something you chose.
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
so feel free to check out [multi-stage builds](/manuals/build/building/multi-stage.md). This is, however, not essential for your progress here.
@z

@x
## Next steps
@y
## Next steps
@z

@x
In this module, you met your example application and built and container image
for it.
@y
In this module, you met your example application and built and container image
for it.
@z

@x
In the next module, you’ll take a look at how to run your image as a container.
@y
In the next module, you’ll take a look at how to run your image as a container.
@z

@x
{{< button text="Run your image as a container" url="run-containers.md" >}}
@y
{{< button text="Run your image as a container" url="run-containers.md" >}}
@z
