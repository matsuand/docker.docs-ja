%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Bake
weight: 50
keywords: build, buildx, bake, buildkit, hcl, json, compose
@y
title: Bake
weight: 50
keywords: build, buildx, bake, buildkit, hcl, json, compose
@z

@x
Bake is a feature of Docker Buildx that lets you define your build configuration
using a declarative file, as opposed to specifying a complex CLI expression. It
also lets you run multiple builds concurrently with a single invocation.
@y
Bake is a feature of Docker Buildx that lets you define your build configuration
using a declarative file, as opposed to specifying a complex CLI expression. It
also lets you run multiple builds concurrently with a single invocation.
@z

@x
A Bake file can be written in HCL, JSON, or YAML formats, where the YAML format
is an extension of a Docker Compose file. Here's an example Bake file in HCL
format:
@y
A Bake file can be written in HCL, JSON, or YAML formats, where the YAML format
is an extension of a Docker Compose file. Here's an example Bake file in HCL
format:
@z

@x
```hcl {title=docker-bake.hcl}
group "default" {
  targets = ["frontend", "backend"]
}
@y
```hcl {title=docker-bake.hcl}
group "default" {
  targets = ["frontend", "backend"]
}
@z

@x
target "frontend" {
  context = "./frontend"
  dockerfile = "frontend.Dockerfile"
  args = {
    NODE_VERSION = "22"
  }
  tags = ["myapp/frontend:latest"]
}
@y
target "frontend" {
  context = "./frontend"
  dockerfile = "frontend.Dockerfile"
  args = {
    NODE_VERSION = "22"
  }
  tags = ["myapp/frontend:latest"]
}
@z

@x
target "backend" {
  context = "./backend"
  dockerfile = "backend.Dockerfile"
  args = {
    GO_VERSION = "{{% param "example_go_version" %}}"
  }
  tags = ["myapp/backend:latest"]
}
```
@y
target "backend" {
  context = "./backend"
  dockerfile = "backend.Dockerfile"
  args = {
    GO_VERSION = "{{% param "example_go_version" %}}"
  }
  tags = ["myapp/backend:latest"]
}
```
@z

@x
The `group` block defines a group of targets that can be built concurrently.
Each `target` block defines a build target with its own configuration, such as
the build context, Dockerfile, and tags.
@y
The `group` block defines a group of targets that can be built concurrently.
Each `target` block defines a build target with its own configuration, such as
the build context, Dockerfile, and tags.
@z

@x
To invoke a build using the above Bake file, you can run:
@y
To invoke a build using the above Bake file, you can run:
@z

@x
```console
$ docker buildx bake
```
@y
```console
$ docker buildx bake
```
@z

@x
This executes the `default` group, which builds the `frontend` and `backend`
targets concurrently.
@y
This executes the `default` group, which builds the `frontend` and `backend`
targets concurrently.
@z

@x
## Get started
@y
## Get started
@z

@x
To learn how to get started with Bake, head over to the [Bake introduction](./introduction.md).
@y
To learn how to get started with Bake, head over to the [Bake introduction](./introduction.md).
@z
