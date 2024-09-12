%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Functions
weight: 60
description: Learn about built-in and user-defined HCL functions with Bake
keywords: build, buildx, bake, buildkit, hcl, functions, user-defined, built-in, custom, gocty
aliases:
  - /build/customize/bake/hcl-funcs/
  - /build/bake/hcl-funcs/
---
@y
---
title: Functions
weight: 60
description: Learn about built-in and user-defined HCL functions with Bake
keywords: build, buildx, bake, buildkit, hcl, functions, user-defined, built-in, custom, gocty
aliases:
  - /build/customize/bake/hcl-funcs/
  - /build/bake/hcl-funcs/
---
@z

@x
HCL functions are great for when you need to manipulate values in your build
configuration in more complex ways than just concatenation or interpolation.
@y
HCL functions are great for when you need to manipulate values in your build
configuration in more complex ways than just concatenation or interpolation.
@z

@x
## Standard library
@y
## Standard library
@z

@x
Bake ships with built-in support for the [`go-cty` standard library functions](https://github.com/zclconf/go-cty/tree/main/cty/function/stdlib).
The following example shows the `add` function.
@y
Bake ships with built-in support for the [`go-cty` standard library functions](https://github.com/zclconf/go-cty/tree/main/cty/function/stdlib).
The following example shows the `add` function.
@z

@x
```hcl {title=docker-bake.hcl}
variable "TAG" {
  default = "latest"
}
@y
```hcl {title=docker-bake.hcl}
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
```hcl {title=docker-bake.hcl}
function "increment" {
  params = [number]
  result = number + 1
}
@y
```hcl {title=docker-bake.hcl}
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
## Variables in functions
@y
## Variables in functions
@z

@x
You can make references to [variables](./variables) and standard library
functions inside your functions.
@y
You can make references to [variables](./variables) and standard library
functions inside your functions.
@z

@x
You can't reference user-defined functions from other functions.
@y
You can't reference user-defined functions from other functions.
@z

@x
The following example uses a global variable (`REPO`) in a custom function.
@y
The following example uses a global variable (`REPO`) in a custom function.
@z

@x
```hcl {title=docker-bake.hcl}
# docker-bake.hcl
variable "REPO" {
  default = "user/repo"
}
@y
```hcl {title=docker-bake.hcl}
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
Printing the Bake file with the `--print` flag shows that the `tag` function
uses the value of `REPO` to set the prefix of the tag.
@y
Printing the Bake file with the `--print` flag shows that the `tag` function
uses the value of `REPO` to set the prefix of the tag.
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
