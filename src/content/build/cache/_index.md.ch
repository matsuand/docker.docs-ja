%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker build cache
description: Improve your build speed with effective use of the build cache
keywords: build, buildx, buildkit, dockerfile, image layers, build instructions, build context
aliases:
  - /build/building/cache/
---
@y
---
title: Docker build cache
description: Improve your build speed with effective use of the build cache
keywords: build, buildx, buildkit, dockerfile, image layers, build instructions, build context
aliases:
  - /build/building/cache/
---
@z

@x
When you build the same Docker image multiple times, knowing how to optimize
the build cache is a great tool for making sure the builds run fast.
@y
When you build the same Docker image multiple times, knowing how to optimize
the build cache is a great tool for making sure the builds run fast.
@z

@x
## How the build cache works
@y
## How the build cache works
@z

@x
Understanding Docker's build cache helps you write better Dockerfiles that
result in faster builds.
@y
Understanding Docker's build cache helps you write better Dockerfiles that
result in faster builds.
@z

@x
The following example shows a small Dockerfile for a program written in C.
@y
The following example shows a small Dockerfile for a program written in C.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM ubuntu:latest
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM ubuntu:latest
@z

@x
RUN apt-get update && apt-get install -y build-essentials
COPY main.c Makefile /src/
WORKDIR /src/
RUN make build
```
@y
RUN apt-get update && apt-get install -y build-essentials
COPY main.c Makefile /src/
WORKDIR /src/
RUN make build
```
@z

@x
Each instruction in this Dockerfile translates to a layer in your final image.
You can think of image layers as a stack, with each layer adding more content
on top of the layers that came before it:
@y
Each instruction in this Dockerfile translates to a layer in your final image.
You can think of image layers as a stack, with each layer adding more content
on top of the layers that came before it:
@z

@x
![Image layer diagram](../images/cache-stack.png)
@y
![Image layer diagram](../images/cache-stack.png)
@z

@x
Whenever a layer changes, that layer will need to be re-built. For example,
suppose you make a change to your program in the `main.c` file. After this
change, the `COPY` command will have to run again in order for those changes to
appear in the image. In other words, Docker will invalidate the cache for this
layer.
@y
Whenever a layer changes, that layer will need to be re-built. For example,
suppose you make a change to your program in the `main.c` file. After this
change, the `COPY` command will have to run again in order for those changes to
appear in the image. In other words, Docker will invalidate the cache for this
layer.
@z

@x
If a layer changes, all other layers that come after it are also affected. When
the layer with the `COPY` command gets invalidated, all layers that follow will
need to run again, too:
@y
If a layer changes, all other layers that come after it are also affected. When
the layer with the `COPY` command gets invalidated, all layers that follow will
need to run again, too:
@z

@x
![Image layer diagram, showing cache invalidation](../images/cache-stack-invalidated.png)
@y
![Image layer diagram, showing cache invalidation](../images/cache-stack-invalidated.png)
@z

@x
And that's the Docker build cache in a nutshell. Once a layer changes, then all
downstream layers need to be rebuilt as well. Even if they wouldn't build
anything differently, they still need to re-run.
@y
And that's the Docker build cache in a nutshell. Once a layer changes, then all
downstream layers need to be rebuilt as well. Even if they wouldn't build
anything differently, they still need to re-run.
@z

@x
For more details about how cache invalidation works, see [Cache invalidation](invalidation.md).
@y
For more details about how cache invalidation works, see [Cache invalidation](invalidation.md).
@z

@x
## Optimizing how you use the build cache
@y
## Optimizing how you use the build cache
@z

@x
Now that you understand how the cache works, you can begin to use the cache to
your advantage. While the cache will automatically work on any `docker build`
that you run, you can often refactor your Dockerfile to get even better
performance. These optimizations can save precious seconds (or even minutes)
off of your builds.
@y
Now that you understand how the cache works, you can begin to use the cache to
your advantage. While the cache will automatically work on any `docker build`
that you run, you can often refactor your Dockerfile to get even better
performance. These optimizations can save precious seconds (or even minutes)
off of your builds.
@z

@x
### Order your layers
@y
### Order your layers
@z

@x
Putting the commands in your Dockerfile into a logical order is a great place
to start. Because a change causes a rebuild for steps that follow, try to make
expensive steps appear near the beginning of the Dockerfile. Steps that change
often should appear near the end of the Dockerfile, to avoid triggering
rebuilds of layers that haven't changed.
@y
Putting the commands in your Dockerfile into a logical order is a great place
to start. Because a change causes a rebuild for steps that follow, try to make
expensive steps appear near the beginning of the Dockerfile. Steps that change
often should appear near the end of the Dockerfile, to avoid triggering
rebuilds of layers that haven't changed.
@z

@x
Consider the following example. A Dockerfile snippet that runs a JavaScript
build from the source files in the current directory:
@y
Consider the following example. A Dockerfile snippet that runs a JavaScript
build from the source files in the current directory:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM node
WORKDIR /app
COPY . .          # Copy over all files in the current directory
RUN npm install   # Install dependencies
RUN npm build     # Run build
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM node
WORKDIR /app
COPY . .          # Copy over all files in the current directory
RUN npm install   # Install dependencies
RUN npm build     # Run build
```
@z

@x
This Dockerfile is rather inefficient. Updating any file causes a reinstall of
all dependencies every time you build the Docker image even if the dependencies
didn't change since last time!
@y
This Dockerfile is rather inefficient. Updating any file causes a reinstall of
all dependencies every time you build the Docker image even if the dependencies
didn't change since last time!
@z

@x
Instead, the `COPY` command can be split in two. First, copy over the package
management files (in this case, `package.json` and `yarn.lock`). Then, install
the dependencies. Finally, copy over the project source code, which is subject
to frequent change.
@y
Instead, the `COPY` command can be split in two. First, copy over the package
management files (in this case, `package.json` and `yarn.lock`). Then, install
the dependencies. Finally, copy over the project source code, which is subject
to frequent change.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM node
WORKDIR /app
COPY package.json yarn.lock .    # Copy package management files
RUN npm install                  # Install dependencies
COPY . .                         # Copy over project files
RUN npm build                    # Run build
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM node
WORKDIR /app
COPY package.json yarn.lock .    # Copy package management files
RUN npm install                  # Install dependencies
COPY . .                         # Copy over project files
RUN npm build                    # Run build
```
@z

@x
By installing dependencies in earlier layers of the Dockerfile, there is no need
to rebuild those layers when a project file has changed.
@y
By installing dependencies in earlier layers of the Dockerfile, there is no need
to rebuild those layers when a project file has changed.
@z

@x
### Keep layers small
@y
### Keep layers small
@z

@x
One of the best things you can do to speed up image building is to just put less
stuff into your build. Fewer parts means the cache stay smaller, but also that
there should be fewer things that could be out-of-date and need rebuilding.
@y
One of the best things you can do to speed up image building is to just put less
stuff into your build. Fewer parts means the cache stay smaller, but also that
there should be fewer things that could be out-of-date and need rebuilding.
@z

@x
To get started, here are a few tips and tricks:
@y
To get started, here are a few tips and tricks:
@z

@x
#### Don't include unnecessary files
@y
#### Don't include unnecessary files
@z

@x
Be considerate of what files you add to the image.
@y
Be considerate of what files you add to the image.
@z

@x
Running a command like `COPY . /src` will copy your entire [build context](../building/context.md)
into the image. If you've got logs, package manager artifacts, or even previous
build results in your current directory, those will also be copied over. This
could make your image larger than it needs to be, especially as those files are
usually not useful.
@y
Running a command like `COPY . /src` will copy your entire [build context](../building/context.md)
into the image. If you've got logs, package manager artifacts, or even previous
build results in your current directory, those will also be copied over. This
could make your image larger than it needs to be, especially as those files are
usually not useful.
@z

@x
Avoid adding unnecessary files to your builds by explicitly stating the files or
directories you intend to copy over. For example, you might only want to add a
`Makefile` and your `src` directory to the image filesystem. In that case,
consider adding this to your Dockerfile:
@y
Avoid adding unnecessary files to your builds by explicitly stating the files or
directories you intend to copy over. For example, you might only want to add a
`Makefile` and your `src` directory to the image filesystem. In that case,
consider adding this to your Dockerfile:
@z

@x
```dockerfile
COPY ./src ./Makefile /src
```
@y
```dockerfile
COPY ./src ./Makefile /src
```
@z

@x
As opposed to this:
@y
As opposed to this:
@z

@x
```dockerfile
COPY . /src
```
@y
```dockerfile
COPY . /src
```
@z

@x
You can also create a
[`.dockerignore` file](../../build/building/context.md#dockerignore-files),
and use that to specify which files and directories to exclude from the build
context.
@y
You can also create a
[`.dockerignore` file](../../build/building/context.md#dockerignore-files),
and use that to specify which files and directories to exclude from the build
context.
@z

@x
#### Use your package manager wisely
@y
#### Use your package manager wisely
@z

@x
Most Docker image builds involve using a package manager to help install
software into the image. Debian has `apt`, Alpine has `apk`, Python has `pip`,
NodeJS has `npm`, and so on.
@y
Most Docker image builds involve using a package manager to help install
software into the image. Debian has `apt`, Alpine has `apk`, Python has `pip`,
NodeJS has `npm`, and so on.
@z

@x
When installing packages, be considerate. Make sure to only install the packages
that you need. If you're not going to use them, don't install them. Remember
that this might be a different list for your local development environment and
your production environment. You can use multi-stage builds to split these up
efficiently.
@y
When installing packages, be considerate. Make sure to only install the packages
that you need. If you're not going to use them, don't install them. Remember
that this might be a different list for your local development environment and
your production environment. You can use multi-stage builds to split these up
efficiently.
@z

@x
#### Use the dedicated `RUN` cache
@y
#### Use the dedicated `RUN` cache
@z

@x
The `RUN` command supports a specialized cache, which you can use when you need
a more fine-grained cache between runs. For example, when installing packages,
you don't always need to fetch all of your packages from the internet each time.
You only need the ones that have changed.
@y
The `RUN` command supports a specialized cache, which you can use when you need
a more fine-grained cache between runs. For example, when installing packages,
you don't always need to fetch all of your packages from the internet each time.
You only need the ones that have changed.
@z

@x
To solve this problem, you can use `RUN --mount type=cache`. For example, for
your Debian-based image you might use the following:
@y
To solve this problem, you can use `RUN --mount type=cache`. For example, for
your Debian-based image you might use the following:
@z

@x
```dockerfile
RUN \
    --mount=type=cache,target=/var/cache/apt \
    apt-get update && apt-get install -y git
```
@y
```dockerfile
RUN \
    --mount=type=cache,target=/var/cache/apt \
    apt-get update && apt-get install -y git
```
@z

@x
Using the explicit cache with the `--mount` flag keeps the contents of the
`target` directory preserved between builds. When this layer needs to be
rebuilt, then it'll use the `apt` cache in `/var/cache/apt`.
@y
Using the explicit cache with the `--mount` flag keeps the contents of the
`target` directory preserved between builds. When this layer needs to be
rebuilt, then it'll use the `apt` cache in `/var/cache/apt`.
@z

@x
### Minimize the number of layers
@y
### Minimize the number of layers
@z

@x
Keeping your layers small is a good first step, and the logical next step is to
reduce the number of layers that you have. Fewer layers mean that you have less
to rebuild, when something in your Dockerfile changes, so your build will
complete faster.
@y
Keeping your layers small is a good first step, and the logical next step is to
reduce the number of layers that you have. Fewer layers mean that you have less
to rebuild, when something in your Dockerfile changes, so your build will
complete faster.
@z

@x
The following sections outline some tips you can use to keep the number of
layers to a minimum.
@y
The following sections outline some tips you can use to keep the number of
layers to a minimum.
@z

@x
#### Use an appropriate base image
@y
#### Use an appropriate base image
@z

@x
Docker provides over 170 pre-built [official images](https://hub.docker.com/search?q=&image_filter=official)
for almost every common development scenario. For example, if you're building a
Java web server, use a dedicated image such as [`eclipse-temurin`](https://hub.docker.com/_/eclipse-temurin/).
Even when there's not an official image for what you might want, Docker provides
images from [verified publishers](https://hub.docker.com/search?q=&image_filter=store)
and [open source partners](https://hub.docker.com/search?q=&image_filter=open_source)
that can help you on your way. The Docker community often produces third-party
images to use as well.
@y
Docker provides over 170 pre-built [official images](https://hub.docker.com/search?q=&image_filter=official)
for almost every common development scenario. For example, if you're building a
Java web server, use a dedicated image such as [`eclipse-temurin`](https://hub.docker.com/_/eclipse-temurin/).
Even when there's not an official image for what you might want, Docker provides
images from [verified publishers](https://hub.docker.com/search?q=&image_filter=store)
and [open source partners](https://hub.docker.com/search?q=&image_filter=open_source)
that can help you on your way. The Docker community often produces third-party
images to use as well.
@z

@x
Using official images saves you time and ensures you stay up to date and secure
by default.
@y
Using official images saves you time and ensures you stay up to date and secure
by default.
@z

@x
#### Use multi-stage builds
@y
#### Use multi-stage builds
@z

@x
[Multi-stage builds](../building/multi-stage.md) let you split up your
Dockerfile into multiple distinct stages. Each stage completes a step in the
build process, and you can bridge the different stages to create your final
image at the end. The Docker builder will work out dependencies between the
stages and run them using the most efficient strategy. This even allows you to
run multiple builds concurrently.
@y
[Multi-stage builds](../building/multi-stage.md) let you split up your
Dockerfile into multiple distinct stages. Each stage completes a step in the
build process, and you can bridge the different stages to create your final
image at the end. The Docker builder will work out dependencies between the
stages and run them using the most efficient strategy. This even allows you to
run multiple builds concurrently.
@z

@x
Multi-stage builds use two or more `FROM` commands. The following example
illustrates building a simple web server that serves HTML from your `docs`
directory in Git:
@y
Multi-stage builds use two or more `FROM` commands. The following example
illustrates building a simple web server that serves HTML from your `docs`
directory in Git:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
# stage 1
FROM alpine as git
RUN apk add git
@y
# stage 1
FROM alpine as git
RUN apk add git
@z

@x
# stage 2
FROM git as fetch
WORKDIR /repo
RUN git clone https://github.com/your/repository.git .
@y
# stage 2
FROM git as fetch
WORKDIR /repo
RUN git clone https://github.com/your/repository.git .
@z

@x
# stage 3
FROM nginx as site
COPY --from=fetch /repo/docs/ /usr/share/nginx/html
```
@y
# stage 3
FROM nginx as site
COPY --from=fetch /repo/docs/ /usr/share/nginx/html
```
@z

@x
This build has 3 stages: `git`, `fetch` and `site`. In this example, `git` is
the base for the `fetch` stage. It uses the `COPY --from` flag to copy the data
from the `docs/` directory into the Nginx server directory.
@y
This build has 3 stages: `git`, `fetch` and `site`. In this example, `git` is
the base for the `fetch` stage. It uses the `COPY --from` flag to copy the data
from the `docs/` directory into the Nginx server directory.
@z

@x
Each stage has only a few instructions, and when possible, Docker will run these
stages in parallel. Only the instructions in the `site` stage will end up as
layers in the final image. The entire `git` history doesn't get embedded into
the final result, which helps keep the image small and secure.
@y
Each stage has only a few instructions, and when possible, Docker will run these
stages in parallel. Only the instructions in the `site` stage will end up as
layers in the final image. The entire `git` history doesn't get embedded into
the final result, which helps keep the image small and secure.
@z

@x
#### Combine commands together wherever possible
@y
#### Combine commands together wherever possible
@z

@x
Most Dockerfile commands, and `RUN` commands in particular, can often be joined
together. For example, instead of using `RUN` like this:
@y
Most Dockerfile commands, and `RUN` commands in particular, can often be joined
together. For example, instead of using `RUN` like this:
@z

@x
```dockerfile
RUN echo "the first command"
RUN echo "the second command"
```
@y
```dockerfile
RUN echo "the first command"
RUN echo "the second command"
```
@z

@x
It's possible to run both of these commands inside a single `RUN`, which means
that they will share the same cache! This is achievable using the `&&` shell
operator to run one command after another:
@y
It's possible to run both of these commands inside a single `RUN`, which means
that they will share the same cache! This is achievable using the `&&` shell
operator to run one command after another:
@z

@x
```dockerfile
RUN echo "the first command" && echo "the second command"
# or to split to multiple lines
RUN echo "the first command" && \
    echo "the second command"
```
@y
```dockerfile
RUN echo "the first command" && echo "the second command"
# or to split to multiple lines
RUN echo "the first command" && \
    echo "the second command"
```
@z

@x
Another shell feature that allows you to simplify and concatenate commands in a
neat way are [`heredocs`](https://en.wikipedia.org/wiki/Here_document).
It enables you to create multi-line scripts with good readability:
@y
Another shell feature that allows you to simplify and concatenate commands in a
neat way are [`heredocs`](https://en.wikipedia.org/wiki/Here_document).
It enables you to create multi-line scripts with good readability:
@z

@x
```dockerfile
RUN <<EOF
set -e
echo "the first command"
echo "the second command"
EOF
```
@y
```dockerfile
RUN <<EOF
set -e
echo "the first command"
echo "the second command"
EOF
```
@z

@x
(Note the `set -e` command to exit immediately after any command fails, instead
of continuing.)
@y
(Note the `set -e` command to exit immediately after any command fails, instead
of continuing.)
@z

@x
## Other resources
@y
## Other resources
@z

@x
For more information on using cache to do efficient builds, see:
@y
For more information on using cache to do efficient builds, see:
@z

@x
- [Cache invalidation](invalidation.md)
- [Garbage collection](garbage-collection.md)
- [Cache storage backends](./backends/index.md)
@y
- [Cache invalidation](invalidation.md)
- [Garbage collection](garbage-collection.md)
- [Cache storage backends](./backends/index.md)
@z
