%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Expression evaluation in Bake
description: Learn about advanced Bake features, like user-defined functions
keywords: build, buildx, bake, buildkit, hcl, expressions, evaluation, math, arithmetic, conditionals
aliases:
  - /build/bake/advanced/
---
@y
---
title: Expression evaluation in Bake
description: Learn about advanced Bake features, like user-defined functions
keywords: build, buildx, bake, buildkit, hcl, expressions, evaluation, math, arithmetic, conditionals
aliases:
  - /build/bake/advanced/
---
@z

@x
Bake files in the HCL format support expression evaluation, which lets you
perform arithmetic operations, conditionally set values, and more.
@y
Bake files in the HCL format support expression evaluation, which lets you
perform arithmetic operations, conditionally set values, and more.
@z

@x
## Arithmetic operations
@y
## Arithmetic operations
@z

@x
You can perform arithmetic operations in expressions. The following example
shows how to multiply two numbers.
@y
You can perform arithmetic operations in expressions. The following example
shows how to multiply two numbers.
@z

@x
```hcl {title=docker-bake.hcl}
sum = 7*6
@y
```hcl {title=docker-bake.hcl}
sum = 7*6
@z

@x
target "default" {
  args = {
    answer = sum
  }
}
```
@y
target "default" {
  args = {
    answer = sum
  }
}
```
@z

@x
Printing the Bake file with the `--print` flag shows the evaluated value for
the `answer` build argument.
@y
Printing the Bake file with the `--print` flag shows the evaluated value for
the `answer` build argument.
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
  "target": {
    "default": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "args": {
        "answer": "42"
      }
    }
  }
}
```
@y
```json
{
  "target": {
    "default": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "args": {
        "answer": "42"
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
built-in `notequal` [function](./funcs.md).
@y
The following example adds a tag only when a variable is not empty, using the
built-in `notequal` [function](./funcs.md).
@z

@x
```hcl {title=docker-bake.hcl}
variable "TAG" {}
@y
```hcl {title=docker-bake.hcl}
variable "TAG" {}
@z

@x
target "default" {
  context="."
  dockerfile="Dockerfile"
  tags = [
    "my-image:latest",
    notequal("",TAG) ? "my-image:${TAG}": "",
  ]
}
```
@y
target "default" {
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
In this case, `TAG` is an empty string, so the resulting build configuration
only contains the hard-coded `my-image:latest` tag.
@y
In this case, `TAG` is an empty string, so the resulting build configuration
only contains the hard-coded `my-image:latest` tag.
@z

@x
```console
$ docker buildx bake --print
```
@y
```console
$ docker buildx bake --print
```
@z

@x
```json
{
  "group": {
    "default": {
      "targets": ["default"]
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
      "targets": ["default"]
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
## Expressions with variables
@y
## Expressions with variables
@z

@x
You can use expressions with [variables](./variables.md) to conditionally set
values, or to perform arithmetic operations.
@y
You can use expressions with [variables](./variables.md) to conditionally set
values, or to perform arithmetic operations.
@z

@x
The following example uses expressions to set values based on the value of
variables. The `v1` build argument is set to "higher" if the variable `FOO` is
greater than 5, otherwise it is set to "lower". The `v2` build argument is set
to "yes" if the `IS_FOO` variable is true, otherwise it is set to "no".
@y
The following example uses expressions to set values based on the value of
variables. The `v1` build argument is set to "higher" if the variable `FOO` is
greater than 5, otherwise it is set to "lower". The `v2` build argument is set
to "yes" if the `IS_FOO` variable is true, otherwise it is set to "no".
@z

@x
```hcl {title=docker-bake.hcl}
variable "FOO" {
  default = 3
}
@y
```hcl {title=docker-bake.hcl}
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
Printing the Bake file with the `--print` flag shows the evaluated values for
the `v1` and `v2` build arguments.
@y
Printing the Bake file with the `--print` flag shows the evaluated values for
the `v1` and `v2` build arguments.
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
