%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Matrix targets
description: Learn how to define and use matrix targets in Bake to fork a single target into multiple different variants
keywords: build, buildx, bake, buildkit, matrix, hcl, json
---
@y
---
title: Matrix targets
description: Learn how to define and use matrix targets in Bake to fork a single target into multiple different variants
keywords: build, buildx, bake, buildkit, matrix, hcl, json
---
@z

@x
A matrix strategy lets you fork a single target into multiple different
variants, based on parameters that you specify. This works in a similar way to
[Matrix strategies for GitHub Actions](https://docs.github.com/en/actions/using-jobs/using-a-matrix-for-your-jobs).
You can use this to reduce duplication in your Bake definition.
@y
A matrix strategy lets you fork a single target into multiple different
variants, based on parameters that you specify. This works in a similar way to
[Matrix strategies for GitHub Actions](https://docs.github.com/en/actions/using-jobs/using-a-matrix-for-your-jobs).
You can use this to reduce duplication in your Bake definition.
@z

@x
The matrix attribute is a map of parameter names to lists of values. Bake
builds each possible combination of values as a separate target.
@y
The matrix attribute is a map of parameter names to lists of values. Bake
builds each possible combination of values as a separate target.
@z

@x
Each generated target must have a unique name. To specify how target names
should resolve, use the name attribute.
@y
Each generated target must have a unique name. To specify how target names
should resolve, use the name attribute.
@z

@x
The following example resolves the app target to `app-foo` and `app-bar`. It
also uses the matrix value to define the [target build stage](/build/bake/reference/#targettarget).
@y
The following example resolves the app target to `app-foo` and `app-bar`. It
also uses the matrix value to define the [target build stage](__SUBDIR__/build/bake/reference/#targettarget).
@z

@x
```hcl
target "app" {
  name = "app-${tgt}"
  matrix = {
    tgt = ["foo", "bar"]
  }
  target = tgt
}
```
@y
```hcl
target "app" {
  name = "app-${tgt}"
  matrix = {
    tgt = ["foo", "bar"]
  }
  target = tgt
}
```
@z

@x
```console
$ docker buildx bake --print app
[+] Building 0.0s (0/0)
{
  "group": {
    "app": {
      "targets": [
        "app-foo",
        "app-bar"
      ]
    },
    "default": {
      "targets": [
        "app"
      ]
    }
  },
  "target": {
    "app-bar": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "target": "bar"
    },
    "app-foo": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "target": "foo"
    }
  }
}
```
@y
```console
$ docker buildx bake --print app
[+] Building 0.0s (0/0)
{
  "group": {
    "app": {
      "targets": [
        "app-foo",
        "app-bar"
      ]
    },
    "default": {
      "targets": [
        "app"
      ]
    }
  },
  "target": {
    "app-bar": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "target": "bar"
    },
    "app-foo": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "target": "foo"
    }
  }
}
```
@z

@x
## Multiple axes
@y
## Multiple axes
@z

@x
You can specify multiple keys in your matrix to fork a target on multiple axes.
When using multiple matrix keys, Bake builds every possible variant.
@y
You can specify multiple keys in your matrix to fork a target on multiple axes.
When using multiple matrix keys, Bake builds every possible variant.
@z

@x
The following example builds four targets:
@y
The following example builds four targets:
@z

@x
- `app-foo-1-0`
- `app-foo-2-0`
- `app-bar-1-0`
- `app-bar-2-0`
@y
- `app-foo-1-0`
- `app-foo-2-0`
- `app-bar-1-0`
- `app-bar-2-0`
@z

@x
```hcl
target "app" {
  name = "app-${tgt}-${replace(version, ".", "-")}"
  matrix = {
    tgt = ["foo", "bar"]
    version = ["1.0", "2.0"]
  }
  target = tgt
  args = {
    VERSION = version
  }
}
```
@y
```hcl
target "app" {
  name = "app-${tgt}-${replace(version, ".", "-")}"
  matrix = {
    tgt = ["foo", "bar"]
    version = ["1.0", "2.0"]
  }
  target = tgt
  args = {
    VERSION = version
  }
}
```
@z

@x
## Multiple values per matrix target
@y
## Multiple values per matrix target
@z

@x
If you want to differentiate the matrix on more than just a single value, you
can use maps as matrix values. Bake creates a target for each map, and you can
access the nested values using dot notation.
@y
If you want to differentiate the matrix on more than just a single value, you
can use maps as matrix values. Bake creates a target for each map, and you can
access the nested values using dot notation.
@z

@x
The following example builds two targets:
@y
The following example builds two targets:
@z

@x
- `app-foo-1-0`
- `app-bar-2-0`
@y
- `app-foo-1-0`
- `app-bar-2-0`
@z

@x
```hcl
target "app" {
  name = "app-${item.tgt}-${replace(item.version, ".", "-")}"
  matrix = {
    item = [
      {
        tgt = "foo"
        version = "1.0"
      },
      {
        tgt = "bar"
        version = "2.0"
      }
    ]
  }
  target = item.tgt
  args = {
    VERSION = item.version
  }
}
```
@y
```hcl
target "app" {
  name = "app-${item.tgt}-${replace(item.version, ".", "-")}"
  matrix = {
    item = [
      {
        tgt = "foo"
        version = "1.0"
      },
      {
        tgt = "bar"
        version = "2.0"
      }
    ]
  }
  target = item.tgt
  args = {
    VERSION = item.version
  }
}
```
@z
