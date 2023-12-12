%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Advanced Bake patterns and functions
description: Learn about advanced Bake features, like user-defined functions
keywords: build, buildx, bake, buildkit, hcl
aliases:
  - /build/customize/bake/hcl-funcs/
  - /build/bake/hcl-funcs/
---
@y
---
title: Advanced Bake patterns and functions
description: Learn about advanced Bake features, like user-defined functions
keywords: build, buildx, bake, buildkit, hcl
aliases:
  - /build/customize/bake/hcl-funcs/
  - /build/bake/hcl-funcs/
---
@z

@x
HCL functions are great for when you need to manipulate values in more complex ways than just concatenating or appending values.
@y
HCL functions are great for when you need to manipulate values in more complex ways than just concatenating or appending values.
@z

@x
The following sections contain some examples on custom functions and other
advanced use cases:
@y
The following sections contain some examples on custom functions and other
advanced use cases:
@z

@x
- [Interpolate environment variables](#interpolate-environment-variables)
- [Built-in functions](#built-in-functions)
- [User-defined functions](#user-defined-functions)
- [Ternary operators](#ternary-operators)
- [Variables in functions](#variables-in-functions)
- [Typed variables](#typed-variables)
@y
- [Interpolate environment variables](#interpolate-environment-variables)
- [Built-in functions](#built-in-functions)
- [User-defined functions](#user-defined-functions)
- [Ternary operators](#ternary-operators)
- [Variables in functions](#variables-in-functions)
- [Typed variables](#typed-variables)
@z

@x
## Interpolate environment variables
@y
## Interpolate environment variables
@z

@x
As shown in the [Bake file reference](reference.md#variable) page, Bake
supports variable blocks which are assigned to matching environment variables
or default values.
@y
As shown in the [Bake file reference](reference.md#variable) page, Bake
supports variable blocks which are assigned to matching environment variables
or default values.
@z

@x
The following example shows how you can interpolate a `TAG` environment
variable to populate a variable in the Bake configuration.
@y
The following example shows how you can interpolate a `TAG` environment
variable to populate a variable in the Bake configuration.
@z

@x
{{< tabs >}}
{{< tab name="HCL" >}}
@y
{{< tabs >}}
{{< tab name="HCL" >}}
@z

@x
```hcl
# docker-bake.hcl
variable "TAG" {
  default = "latest"
}
@y
```hcl
# docker-bake.hcl
variable "TAG" {
  default = "latest"
}
@z

@x
group "default" {
  targets = ["webapp"]
}
@y
group "default" {
  targets = ["webapp"]
}
@z

@x
target "webapp" {
  tags = ["docker.io/username/webapp:${TAG}"]
}
```
@y
target "webapp" {
  tags = ["docker.io/username/webapp:${TAG}"]
}
```
@z

@x
{{< /tab >}}
{{< tab name="JSON" >}}
@y
{{< /tab >}}
{{< tab name="JSON" >}}
@z

@x
```json
{
  "variable": {
    "TAG": {
      "default": "latest"
    }
  },
  "group": {
    "default": {
      "targets": ["webapp"]
    }
  },
  "target": {
    "webapp": {
      "tags": ["docker.io/username/webapp:${TAG}"]
    }
  }
}
```
@y
```json
{
  "variable": {
    "TAG": {
      "default": "latest"
    }
  },
  "group": {
    "default": {
      "targets": ["webapp"]
    }
  },
  "target": {
    "webapp": {
      "tags": ["docker.io/username/webapp:${TAG}"]
    }
  }
}
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
```console
$ docker buildx bake --print webapp
```
@y
```console
$ docker buildx bake --print webapp
```
@z

@x
```json
{
  "group": {
    "default": {
      "targets": ["webapp"]
    }
  },
  "target": {
    "webapp": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "tags": ["docker.io/username/webapp:latest"]
    }
  }
}
```
@y
```json
{
  "group": {
    "default": {
      "targets": ["webapp"]
    }
  },
  "target": {
    "webapp": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "tags": ["docker.io/username/webapp:latest"]
    }
  }
}
```
@z

@x
```console
$ TAG=$(git rev-parse --short HEAD) docker buildx bake --print webapp
```
@y
```console
$ TAG=$(git rev-parse --short HEAD) docker buildx bake --print webapp
```
@z

@x
```json
{
  "group": {
    "default": {
      "targets": ["webapp"]
    }
  },
  "target": {
    "webapp": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "tags": ["docker.io/username/webapp:985e9e9"]
    }
  }
}
```
@y
```json
{
  "group": {
    "default": {
      "targets": ["webapp"]
    }
  },
  "target": {
    "webapp": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "tags": ["docker.io/username/webapp:985e9e9"]
    }
  }
}
```
@z

@x
## Built-in functions
@y
## Built-in functions
@z

@x
You can use [`go-cty` standard library functions](https://github.com/zclconf/go-cty/tree/main/cty/function/stdlib).
The following example shows the `add` function.
@y
You can use [`go-cty` standard library functions](https://github.com/zclconf/go-cty/tree/main/cty/function/stdlib).
The following example shows the `add` function.
@z

@x
```hcl
# docker-bake.hcl
variable "TAG" {
  default = "latest"
}
@y
```hcl
# docker-bake.hcl
variable "TAG" {
  default = "latest"
}
@z

@x
group "default" {
  targets = ["webapp"]
}
@y
group "default" {
  targets = ["webapp"]
}
@z

@x
target "webapp" {
  args = {
    buildno = "${add(123, 1)}"
  }
}
```
@y
target "webapp" {
  args = {
    buildno = "${add(123, 1)}"
  }
}
```
@z

@x
```console
$ docker buildx bake --print webapp
```
@y
```console
$ docker buildx bake --print webapp
```
@z

@x
```json
{
  "group": {
    "default": {
      "targets": ["webapp"]
    }
  },
  "target": {
    "webapp": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "args": {
        "buildno": "124"
      }
    }
  }
}
```
@y
```json
{
  "group": {
    "default": {
      "targets": ["webapp"]
    }
  },
  "target": {
    "webapp": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "args": {
        "buildno": "124"
      }
    }
  }
}
```
@z

@x
## User-defined functions
@y
## User-defined functions
@z

@x
You can create [user-defined functions](https://github.com/hashicorp/hcl/tree/main/ext/userfunc)
that do just what you want, if the built-in standard library functions don't
meet your needs.
@y
You can create [user-defined functions](https://github.com/hashicorp/hcl/tree/main/ext/userfunc)
that do just what you want, if the built-in standard library functions don't
meet your needs.
@z

@x
The following example defines an `increment` function.
@y
The following example defines an `increment` function.
@z

@x
```hcl
# docker-bake.hcl
function "increment" {
  params = [number]
  result = number + 1
}
@y
```hcl
# docker-bake.hcl
function "increment" {
  params = [number]
  result = number + 1
}
@z

@x
group "default" {
  targets = ["webapp"]
}
@y
group "default" {
  targets = ["webapp"]
}
@z

@x
target "webapp" {
  args = {
    buildno = "${increment(123)}"
  }
}
```
@y
target "webapp" {
  args = {
    buildno = "${increment(123)}"
  }
}
```
@z

@x
```console
$ docker buildx bake --print webapp
```
@y
```console
$ docker buildx bake --print webapp
```
@z

@x
```json
{
  "group": {
    "default": {
      "targets": ["webapp"]
    }
  },
  "target": {
    "webapp": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "args": {
        "buildno": "124"
      }
    }
  }
}
```
@y
```json
{
  "group": {
    "default": {
      "targets": ["webapp"]
    }
  },
  "target": {
    "webapp": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "args": {
        "buildno": "124"
      }
    }
  }
}
```
@z

@x
## Ternary operators
@y
## Ternary operators
@z

@x
You can use ternary operators to conditionally register a value.
@y
You can use ternary operators to conditionally register a value.
@z

@x
The following example adds a tag only when a variable is not empty, using the
`notequal` function.
@y
The following example adds a tag only when a variable is not empty, using the
`notequal` function.
@z

@x
```hcl
# docker-bake.hcl
variable "TAG" {default="" }
@y
```hcl
# docker-bake.hcl
variable "TAG" {default="" }
@z

@x
group "default" {
  targets = [
    "webapp",
  ]
}
@y
group "default" {
  targets = [
    "webapp",
  ]
}
@z

@x
target "webapp" {
  context="."
  dockerfile="Dockerfile"
  tags = [
    "my-image:latest",
    notequal("",TAG) ? "my-image:${TAG}": "",
  ]
}
```
@y
target "webapp" {
  context="."
  dockerfile="Dockerfile"
  tags = [
    "my-image:latest",
    notequal("",TAG) ? "my-image:${TAG}": "",
  ]
}
```
@z

@x
```console
$ docker buildx bake --print webapp
```
@y
```console
$ docker buildx bake --print webapp
```
@z

@x
```json
{
  "group": {
    "default": {
      "targets": ["webapp"]
    }
  },
  "target": {
    "webapp": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "tags": ["my-image:latest"]
    }
  }
}
```
@y
```json
{
  "group": {
    "default": {
      "targets": ["webapp"]
    }
  },
  "target": {
    "webapp": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "tags": ["my-image:latest"]
    }
  }
}
```
@z

@x
## Variables in functions
@y
## Variables in functions
@z

@x
You can make references to variables and standard library functions inside your
functions.
@y
You can make references to variables and standard library functions inside your
functions.
@z

@x
You can't reference user-defined functions from other functions.
@y
You can't reference user-defined functions from other functions.
@z

@x
```hcl
# docker-bake.hcl
variable "REPO" {
  default = "user/repo"
}
@y
```hcl
# docker-bake.hcl
variable "REPO" {
  default = "user/repo"
}
@z

@x
function "tag" {
  params = [tag]
  result = ["${REPO}:${tag}"]
}
@y
function "tag" {
  params = [tag]
  result = ["${REPO}:${tag}"]
}
@z

@x
target "webapp" {
  tags = tag("v1")
}
```
@y
target "webapp" {
  tags = tag("v1")
}
```
@z

@x
```console
$ docker buildx bake --print webapp
```
@y
```console
$ docker buildx bake --print webapp
```
@z

@x
```json
{
  "group": {
    "default": {
      "targets": ["webapp"]
    }
  },
  "target": {
    "webapp": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "tags": ["user/repo:v1"]
    }
  }
}
```
@y
```json
{
  "group": {
    "default": {
      "targets": ["webapp"]
    }
  },
  "target": {
    "webapp": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "tags": ["user/repo:v1"]
    }
  }
}
```
@z

@x
## Typed variables
@y
## Typed variables
@z

@x
Non-string variables are supported. Values passed as environment variables are
coerced into suitable types first.
@y
Non-string variables are supported. Values passed as environment variables are
coerced into suitable types first.
@z

@x
```hcl
# docker-bake.hcl
variable "FOO" {
  default = 3
}
@y
```hcl
# docker-bake.hcl
variable "FOO" {
  default = 3
}
@z

@x
variable "IS_FOO" {
  default = true
}
@y
variable "IS_FOO" {
  default = true
}
@z

@x
target "app" {
  args = {
    v1 = FOO > 5 ? "higher" : "lower"
    v2 = IS_FOO ? "yes" : "no"
  }
}
```
@y
target "app" {
  args = {
    v1 = FOO > 5 ? "higher" : "lower"
    v2 = IS_FOO ? "yes" : "no"
  }
}
```
@z

@x
```console
$ docker buildx bake --print app
```
@y
```console
$ docker buildx bake --print app
```
@z

@x
```json
{
  "group": {
    "default": {
      "targets": ["app"]
    }
  },
  "target": {
    "app": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "args": {
        "v1": "lower",
        "v2": "yes"
      }
    }
  }
}
```
@y
```json
{
  "group": {
    "default": {
      "targets": ["app"]
    }
  },
  "target": {
    "app": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "args": {
        "v1": "lower",
        "v2": "yes"
      }
    }
  }
}
```
@z
