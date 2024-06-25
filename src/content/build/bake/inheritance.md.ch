%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Inheritance in Bake
description: Learn how to inherit attributes from other targets in Bake
keywords: buildx, buildkit, bake, inheritance, targets, attributes
---
@y
---
title: Inheritance in Bake
description: Learn how to inherit attributes from other targets in Bake
keywords: buildx, buildkit, bake, inheritance, targets, attributes
---
@z

@x
Targets can inherit attributes from other targets, using the `inherits`
attribute. For example, imagine that you have a target that builds a Docker
image for a development environment:
@y
Targets can inherit attributes from other targets, using the `inherits`
attribute. For example, imagine that you have a target that builds a Docker
image for a development environment:
@z

@x
```hcl
target "app-dev" {
  args = {
    GO_VERSION = "{{% param example_go_version %}}"
  }
  tags = ["docker.io/username/myapp:dev"]
  labels = {
    "org.opencontainers.image.source" = "https://github.com/username/myapp"
    "org.opencontainers.image.author" = "moby.whale@example.com"
  }
}
```
@y
```hcl
target "app-dev" {
  args = {
    GO_VERSION = "{{% param example_go_version %}}"
  }
  tags = ["docker.io/username/myapp:dev"]
  labels = {
    "org.opencontainers.image.source" = "https://github.com/username/myapp"
    "org.opencontainers.image.author" = "moby.whale@example.com"
  }
}
```
@z

@x
You can create a new target that uses the same build configuration, but with
slightly different attributes for a production build. In this example, the
`app-release` target inherits the `app-dev` target, but overrides the `tags`
attribute and adds a new `platforms` attribute:
@y
You can create a new target that uses the same build configuration, but with
slightly different attributes for a production build. In this example, the
`app-release` target inherits the `app-dev` target, but overrides the `tags`
attribute and adds a new `platforms` attribute:
@z

@x
```hcl
target "app-release" {
  inherits = ["app-dev"]
  tags = ["docker.io/username/myapp:latest"]
  platforms = ["linux/amd64", "linux/arm64"]
}
```
@y
```hcl
target "app-release" {
  inherits = ["app-dev"]
  tags = ["docker.io/username/myapp:latest"]
  platforms = ["linux/amd64", "linux/arm64"]
}
```
@z

@x
## Common reusable targets
@y
## Common reusable targets
@z

@x
One common inheritance pattern is to define a common target that contains
shared attributes for all or many of the build targets in the project. For
example, the following `_common` target defines a common set of build
arguments:
@y
One common inheritance pattern is to define a common target that contains
shared attributes for all or many of the build targets in the project. For
example, the following `_common` target defines a common set of build
arguments:
@z

@x
```hcl
target "_common" {
  args = {
    GO_VERSION = "{{% param example_go_version %}}"
    BUILDKIT_CONTEXT_KEEP_GIT_DIR = 1
  }
}
```
@y
```hcl
target "_common" {
  args = {
    GO_VERSION = "{{% param example_go_version %}}"
    BUILDKIT_CONTEXT_KEEP_GIT_DIR = 1
  }
}
```
@z

@x
You can then inherit the `_common` target in other targets to apply the shared
attributes:
@y
You can then inherit the `_common` target in other targets to apply the shared
attributes:
@z

@x
```hcl
target "lint" {
  inherits = ["_common"]
  dockerfile = "./dockerfiles/lint.Dockerfile"
  output = ["type=cacheonly"]
}
@y
```hcl
target "lint" {
  inherits = ["_common"]
  dockerfile = "./dockerfiles/lint.Dockerfile"
  output = ["type=cacheonly"]
}
@z

@x
target "docs" {
  inherits = ["_common"]
  dockerfile = "./dockerfiles/docs.Dockerfile"
  output = ["./docs/reference"]
}
@y
target "docs" {
  inherits = ["_common"]
  dockerfile = "./dockerfiles/docs.Dockerfile"
  output = ["./docs/reference"]
}
@z

@x
target "test" {
  inherits = ["_common"]
  target = "test-output"
  output = ["./test"]
}
@y
target "test" {
  inherits = ["_common"]
  target = "test-output"
  output = ["./test"]
}
@z

@x
target "binaries" {
  inherits = ["_common"]
  target = "binaries"
  output = ["./build"]
  platforms = ["local"]
}
```
@y
target "binaries" {
  inherits = ["_common"]
  target = "binaries"
  output = ["./build"]
  platforms = ["local"]
}
```
@z

@x
## Overriding inherited attributes
@y
## Overriding inherited attributes
@z

@x
When a target inherits another target, it can override any of the inherited
attributes. For example, the following target overrides the `args` attribute
from the inherited target:
@y
When a target inherits another target, it can override any of the inherited
attributes. For example, the following target overrides the `args` attribute
from the inherited target:
@z

@x
```hcl
target "app-dev" {
  inherits = ["_common"]
  args = {
    GO_VERSION = "1.17"
  }
  tags = ["docker.io/username/myapp:dev"]
}
```
@y
```hcl
target "app-dev" {
  inherits = ["_common"]
  args = {
    GO_VERSION = "1.17"
  }
  tags = ["docker.io/username/myapp:dev"]
}
```
@z

@x
The `GO_VERSION` argument in `app-release` is set to `1.17`, overriding the
`GO_VERSION` argument from the `app-dev` target.
@y
The `GO_VERSION` argument in `app-release` is set to `1.17`, overriding the
`GO_VERSION` argument from the `app-dev` target.
@z

@x
For more information about overriding attributes, see the [Overriding
configurations](./overrides.md) page.
@y
For more information about overriding attributes, see the [Overriding
configurations](./overrides.md) page.
@z

@x
## Inherit from multiple targets
@y
## Inherit from multiple targets
@z

@x
The `inherits` attribute is a list, meaning you can reuse attributes from
multiple other targets. In the following example, the app-release target reuses
attributes from both the `app-dev` and `_common` targets.
@y
The `inherits` attribute is a list, meaning you can reuse attributes from
multiple other targets. In the following example, the app-release target reuses
attributes from both the `app-dev` and `_common` targets.
@z

@x
```hcl
target "_common" {
  args = {
    GO_VERSION = "{{% param example_go_version %}}"
    BUILDKIT_CONTEXT_KEEP_GIT_DIR = 1
  }
}
@y
```hcl
target "_common" {
  args = {
    GO_VERSION = "{{% param example_go_version %}}"
    BUILDKIT_CONTEXT_KEEP_GIT_DIR = 1
  }
}
@z

@x
target "app-dev" {
  inherits = ["_common"]
  args = {
    BUILDKIT_CONTEXT_KEEP_GIT_DIR = 0
  }
  tags = ["docker.io/username/myapp:dev"]
  labels = {
    "org.opencontainers.image.source" = "https://github.com/username/myapp"
    "org.opencontainers.image.author" = "moby.whale@example.com"
  }
}
@y
target "app-dev" {
  inherits = ["_common"]
  args = {
    BUILDKIT_CONTEXT_KEEP_GIT_DIR = 0
  }
  tags = ["docker.io/username/myapp:dev"]
  labels = {
    "org.opencontainers.image.source" = "https://github.com/username/myapp"
    "org.opencontainers.image.author" = "moby.whale@example.com"
  }
}
@z

@x
target "app-release" {
  inherits = ["app-dev", "_common"]
  tags = ["docker.io/username/myapp:latest"]
  platforms = ["linux/amd64", "linux/arm64"]
}
```
@y
target "app-release" {
  inherits = ["app-dev", "_common"]
  tags = ["docker.io/username/myapp:latest"]
  platforms = ["linux/amd64", "linux/arm64"]
}
```
@z

@x
When inheriting attributes from multiple targets and there's a conflict, the
target that appears last in the inherits list takes precedence. The previous
example defines the `BUILDKIT_CONTEXT_KEEP_GIT_DIR` in the `_common` target and
overrides it in the `app-dev` target.
@y
When inheriting attributes from multiple targets and there's a conflict, the
target that appears last in the inherits list takes precedence. The previous
example defines the `BUILDKIT_CONTEXT_KEEP_GIT_DIR` in the `_common` target and
overrides it in the `app-dev` target.
@z

@x
The `app-release` target inherits both `app-dev` target and the `_common` target.
The `BUILDKIT_CONTEXT_KEEP_GIT_DIR` argument is set to 0 in the `app-dev` target
and 1 in the `_common` target. The `BUILDKIT_CONTEXT_KEEP_GIT_DIR` argument in
the `app-release` target is set to 1, not 0, because the `_common` target appears
last in the inherits list.
@y
The `app-release` target inherits both `app-dev` target and the `_common` target.
The `BUILDKIT_CONTEXT_KEEP_GIT_DIR` argument is set to 0 in the `app-dev` target
and 1 in the `_common` target. The `BUILDKIT_CONTEXT_KEEP_GIT_DIR` argument in
the `app-release` target is set to 1, not 0, because the `_common` target appears
last in the inherits list.
@z

@x
## Reusing single attributes from targets
@y
## Reusing single attributes from targets
@z

@x
If you only want to inherit a single attribute from a target, you can reference
an attribute from another target using dot notation. For example, in the
following Bake file, the `bar` target reuses the `tags` attribute from the
`foo` target:
@y
If you only want to inherit a single attribute from a target, you can reference
an attribute from another target using dot notation. For example, in the
following Bake file, the `bar` target reuses the `tags` attribute from the
`foo` target:
@z

@x
```hcl {title=docker-bake.hcl}
target "foo" {
  dockerfile = "foo.Dockerfile"
  tags       = ["myapp:latest"]
}
target "bar" {
  dockerfile = "bar.Dockerfile"
  tags       = target.foo.tags
}
```
@y
```hcl {title=docker-bake.hcl}
target "foo" {
  dockerfile = "foo.Dockerfile"
  tags       = ["myapp:latest"]
}
target "bar" {
  dockerfile = "bar.Dockerfile"
  tags       = target.foo.tags
}
```
@z
