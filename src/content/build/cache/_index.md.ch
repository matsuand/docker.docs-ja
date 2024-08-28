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
- [Optimize build cache](optimization.md)
- [Garbage collection](garbage-collection.md)
- [Cache storage backends](./backends/_index.md)
@y
- [Cache invalidation](invalidation.md)
- [Optimize build cache](optimization.md)
- [Garbage collection](garbage-collection.md)
- [Cache storage backends](./backends/_index.md)
@z
