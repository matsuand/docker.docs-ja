%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Layers
description: Improving the initial Dockerfile using layers
keywords: build, buildkit, buildx, guide, tutorial, layers
---
@y
---
title: Layers
description: Improving the initial Dockerfile using layers
keywords: build, buildkit, buildx, guide, tutorial, layers
---
@z

@x
The order of Dockerfile instructions matters. A Docker build consists of a series
of ordered build instructions. Each instruction in a Dockerfile roughly translates
to an image layer. The following diagram illustrates how a Dockerfile translates
into a stack of layers in a container image.
@y
The order of Dockerfile instructions matters. A Docker build consists of a series
of ordered build instructions. Each instruction in a Dockerfile roughly translates
to an image layer. The following diagram illustrates how a Dockerfile translates
into a stack of layers in a container image.
@z

@x
![From Dockerfile to layers](./images/layers.png)
@y
![From Dockerfile to layers](./images/layers.png)
@z

@x
## Cached layers
@y
## Cached layers
@z

@x
When you run a build, the builder attempts to reuse layers from earlier builds.
If a layer of an image is unchanged, then the builder picks it up from the build cache.
If a layer has changed since the last build, that layer, and all layers that follow, must be rebuilt.
@y
When you run a build, the builder attempts to reuse layers from earlier builds.
If a layer of an image is unchanged, then the builder picks it up from the build cache.
If a layer has changed since the last build, that layer, and all layers that follow, must be rebuilt.
@z

@x
The Dockerfile from the previous section copies all project files to the
container (`COPY . .`) and then downloads application dependencies in the
following step (`RUN go mod download`). If you were to change any of the project
files, then that would invalidate the cache for the `COPY` layer. It also invalidates
the cache for all of the layers that follow.
@y
The Dockerfile from the previous section copies all project files to the
container (`COPY . .`) and then downloads application dependencies in the
following step (`RUN go mod download`). If you were to change any of the project
files, then that would invalidate the cache for the `COPY` layer. It also invalidates
the cache for all of the layers that follow.
@z

@x
![Layer cache is bust](./images/cache-bust.png)
@y
![Layer cache is bust](./images/cache-bust.png)
@z

@x
Because of the current order of the Dockerfile instructions, the builder must
download the Go modules again, despite none of the packages having changed since
the last time.
@y
Because of the current order of the Dockerfile instructions, the builder must
download the Go modules again, despite none of the packages having changed since
the last time.
@z

@x
## Update the instruction order
@y
## Update the instruction order
@z

@x
You can avoid this redundancy by reordering the instructions in the Dockerfile.
Change the order of the instructions so that downloading and installing dependencies
occur before the source code is copied over to the container. In that way, the
builder can reuse the "dependencies" layer from the cache, even when you
make changes to your source code.
@y
You can avoid this redundancy by reordering the instructions in the Dockerfile.
Change the order of the instructions so that downloading and installing dependencies
occur before the source code is copied over to the container. In that way, the
builder can reuse the "dependencies" layer from the cache, even when you
make changes to your source code.
@z

@x
Go uses two files, called `go.mod` and `go.sum`, to track dependencies for a project.
These files are to Go, what `package.json` and `package-lock.json` are to JavaScript.
For Go to know which dependencies to download, you need to copy the `go.mod` and
`go.sum` files to the container. Add another `COPY` instruction before
`RUN go mod download`, this time copying only the `go.mod` and `go.sum` files.
@y
Go uses two files, called `go.mod` and `go.sum`, to track dependencies for a project.
These files are to Go, what `package.json` and `package-lock.json` are to JavaScript.
For Go to know which dependencies to download, you need to copy the `go.mod` and
`go.sum` files to the container. Add another `COPY` instruction before
`RUN go mod download`, this time copying only the `go.mod` and `go.sum` files.
@z

@x
```diff
  # syntax=docker/dockerfile:1
  FROM golang:{{% param "example_go_version" %}}-alpine
  WORKDIR /src
- COPY . .
+ COPY go.mod go.sum .
  RUN go mod download
+ COPY . .
  RUN go build -o /bin/client ./cmd/client
  RUN go build -o /bin/server ./cmd/server
  ENTRYPOINT [ "/bin/server" ]
```
@y
```diff
  # syntax=docker/dockerfile:1
  FROM golang:{{% param "example_go_version" %}}-alpine
  WORKDIR /src
- COPY . .
+ COPY go.mod go.sum .
  RUN go mod download
+ COPY . .
  RUN go build -o /bin/client ./cmd/client
  RUN go build -o /bin/server ./cmd/server
  ENTRYPOINT [ "/bin/server" ]
```
@z

@x
Now if you edit your source code, building the image won't cause the
builder to download the dependencies each time. The `COPY . .` instruction
appears after the package management instructions, so the builder can reuse the
`RUN go mod download` layer.
@y
Now if you edit your source code, building the image won't cause the
builder to download the dependencies each time. The `COPY . .` instruction
appears after the package management instructions, so the builder can reuse the
`RUN go mod download` layer.
@z

@x
![Reordered](./images/reordered-layers.png)
@y
![Reordered](./images/reordered-layers.png)
@z

@x
## Summary
@y
## Summary
@z

@x
Ordering your Dockerfile instructions appropriately helps you avoid unnecessary
work at build time.
@y
Ordering your Dockerfile instructions appropriately helps you avoid unnecessary
work at build time.
@z

@x
Related information:
@y
Related information:
@z

@x
- [Optimizing builds with cache](../cache/index.md)
- [Dockerfile best practices](../../develop/develop-images/dockerfile_best-practices.md)
@y
- [Optimizing builds with cache](../cache/index.md)
- [Dockerfile best practices](../../develop/develop-images/dockerfile_best-practices.md)
@z

@x
## Next steps
@y
## Next steps
@z

@x
The next section shows how you can make the build run faster, and make the
resulting output smaller, using multi-stage builds.
@y
The next section shows how you can make the build run faster, and make the
resulting output smaller, using multi-stage builds.
@z

@x
{{< button text="Multi-stage" url="multi-stage.md" >}}
@y
{{< button text="Multi-stage" url="multi-stage.md" >}}
@z
