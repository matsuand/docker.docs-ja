%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Configure builds with Bake
description: Learn how to create a flexible build configuration with Bake
keywords: build, buildx, bake, buildkit, hcl, json
aliases:
  - /build/customize/bake/configuring-build/
---
@y
---
title: Configure builds with Bake
description: Learn how to create a flexible build configuration with Bake
keywords: build, buildx, bake, buildkit, hcl, json
aliases:
  - /build/customize/bake/configuring-build/
---
@z

@x
Bake supports loading build definitions from files, but sometimes you need even
more flexibility to configure these definitions.
@y
Bake supports loading build definitions from files, but sometimes you need even
more flexibility to configure these definitions.
@z

@x
For this use case, you can define variables inside the bake files that can be
set by the user with environment variables or by [attribute definitions](#global-scope-attributes)
in other bake files. If you wish to change a specific value for a single
invocation you can use the `--set` flag [from the command line](#from-command-line).
@y
For this use case, you can define variables inside the bake files that can be
set by the user with environment variables or by [attribute definitions](#global-scope-attributes)
in other bake files. If you wish to change a specific value for a single
invocation you can use the `--set` flag [from the command line](#from-command-line).
@z

@x
## Global scope attributes
@y
## Global scope attributes
@z

@x
You can define global scope attributes in HCL/JSON and use them for code reuse
and setting values for variables. This means you can do a "data-only" HCL file
with the values you want to set/override and use it in the list of regular
output files.
@y
You can define global scope attributes in HCL/JSON and use them for code reuse
and setting values for variables. This means you can do a "data-only" HCL file
with the values you want to set/override and use it in the list of regular
output files.
@z

@x
```hcl
# docker-bake.hcl
variable "FOO" {
  default = "abc"
}
@y
```hcl
# docker-bake.hcl
variable "FOO" {
  default = "abc"
}
@z

@x
target "app" {
  args = {
    v1 = "pre-${FOO}"
  }
}
```
@y
target "app" {
  args = {
    v1 = "pre-${FOO}"
  }
}
```
@z

@x
You can use this file directly:
@y
You can use this file directly:
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
        "v1": "pre-abc"
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
        "v1": "pre-abc"
      }
    }
  }
}
```
@z

@x
Or create an override configuration file:
@y
Or create an override configuration file:
@z

@x
```hcl
# env.hcl
WHOAMI="myuser"
FOO="def-${WHOAMI}"
```
@y
```hcl
# env.hcl
WHOAMI="myuser"
FOO="def-${WHOAMI}"
```
@z

@x
And invoke bake together with both of the files:
@y
And invoke bake together with both of the files:
@z

@x
```console
$ docker buildx bake -f docker-bake.hcl -f env.hcl --print app
```
@y
```console
$ docker buildx bake -f docker-bake.hcl -f env.hcl --print app
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
        "v1": "pre-def-myuser"
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
        "v1": "pre-def-myuser"
      }
    }
  }
}
```
@z

@x
## Resource interpolation
@y
## Resource interpolation
@z

@x
You can also refer to attributes defined as part of other targets, to help
reduce duplication between targets.
@y
You can also refer to attributes defined as part of other targets, to help
reduce duplication between targets.
@z

@x
```hcl
# docker-bake.hcl
target "foo" {
  dockerfile = "${target.foo.name}.Dockerfile"
  tags       = [target.foo.name]
}
target "bar" {
  dockerfile = "${target.foo.name}.Dockerfile"
  tags       = [target.bar.name]
}
```
@y
```hcl
# docker-bake.hcl
target "foo" {
  dockerfile = "${target.foo.name}.Dockerfile"
  tags       = [target.foo.name]
}
target "bar" {
  dockerfile = "${target.foo.name}.Dockerfile"
  tags       = [target.bar.name]
}
```
@z

@x
You can use this file directly:
@y
You can use this file directly:
@z

@x
```console
$ docker buildx bake --print foo bar
```
@y
```console
$ docker buildx bake --print foo bar
```
@z

@x
```json
{
  "group": {
    "default": {
      "targets": ["foo", "bar"]
    }
  },
  "target": {
    "foo": {
      "context": ".",
      "dockerfile": "foo.Dockerfile",
      "tags": ["foo"]
    },
    "bar": {
      "context": ".",
      "dockerfile": "foo.Dockerfile",
      "tags": ["bar"]
    }
  }
}
```
@y
```json
{
  "group": {
    "default": {
      "targets": ["foo", "bar"]
    }
  },
  "target": {
    "foo": {
      "context": ".",
      "dockerfile": "foo.Dockerfile",
      "tags": ["foo"]
    },
    "bar": {
      "context": ".",
      "dockerfile": "foo.Dockerfile",
      "tags": ["bar"]
    }
  }
}
```
@z

@x
## From command line
@y
## From command line
@z

@x
You can also override target configurations from the command line with the
[`--set` flag](../../reference/cli/docker/buildx/bake.md#set):
@y
You can also override target configurations from the command line with the
[`--set` flag](../../reference/cli/docker/buildx/bake.md#set):
@z

@x
```hcl
# docker-bake.hcl
target "app" {
  args = {
    mybuildarg = "foo"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "app" {
  args = {
    mybuildarg = "foo"
  }
}
```
@z

@x
```console
$ docker buildx bake --set app.args.mybuildarg=bar --set app.platform=linux/arm64 app --print
```
@y
```console
$ docker buildx bake --set app.args.mybuildarg=bar --set app.platform=linux/arm64 app --print
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
        "mybuildarg": "bar"
      },
      "platforms": ["linux/arm64"]
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
        "mybuildarg": "bar"
      },
      "platforms": ["linux/arm64"]
    }
  }
}
```
@z

@x
Pattern matching syntax defined in [https://golang.org/pkg/path/#Match](https://golang.org/pkg/path/#Match)
is also supported:
@y
Pattern matching syntax defined in [https://golang.org/pkg/path/#Match](https://golang.org/pkg/path/#Match)
is also supported:
@z

@x
```console
$ docker buildx bake --set foo*.args.mybuildarg=value  # overrides build arg for all targets starting with "foo"
$ docker buildx bake --set *.platform=linux/arm64      # overrides platform for all targets
$ docker buildx bake --set foo*.no-cache               # bypass caching only for targets starting with "foo"
```
@y
```console
$ docker buildx bake --set foo*.args.mybuildarg=value  # overrides build arg for all targets starting with "foo"
$ docker buildx bake --set *.platform=linux/arm64      # overrides platform for all targets
$ docker buildx bake --set foo*.no-cache               # bypass caching only for targets starting with "foo"
```
@z

@x
Complete list of overridable fields:
@y
Complete list of overridable fields:
@z

@x
- `args`
- `cache-from`
- `cache-to`
- `context`
- `dockerfile`
- `labels`
- `no-cache`
- `output`
- `platform`
- `pull`
- `secrets`
- `ssh`
- `tags`
- `target`
@y
- `args`
- `cache-from`
- `cache-to`
- `context`
- `dockerfile`
- `labels`
- `no-cache`
- `output`
- `platform`
- `pull`
- `secrets`
- `ssh`
- `tags`
- `target`
@z

@x
## Using variables in variables across files
@y
## Using variables in variables across files
@z

@x
When multiple files are specified, one file can use variables defined in
another file.
@y
When multiple files are specified, one file can use variables defined in
another file.
@z

@x
```hcl
# docker-bake1.hcl
variable "FOO" {
  default = upper("${BASE}def")
}
@y
```hcl
# docker-bake1.hcl
variable "FOO" {
  default = upper("${BASE}def")
}
@z

@x
variable "BAR" {
  default = "-${FOO}-"
}
@y
variable "BAR" {
  default = "-${FOO}-"
}
@z

@x
target "app" {
  args = {
    v1 = "pre-${BAR}"
  }
}
```
@y
target "app" {
  args = {
    v1 = "pre-${BAR}"
  }
}
```
@z

@x
```hcl
# docker-bake2.hcl
variable "BASE" {
  default = "abc"
}
@y
```hcl
# docker-bake2.hcl
variable "BASE" {
  default = "abc"
}
@z

@x
target "app" {
  args = {
    v2 = "${FOO}-post"
  }
}
```
@y
target "app" {
  args = {
    v2 = "${FOO}-post"
  }
}
```
@z

@x
```console
$ docker buildx bake -f docker-bake1.hcl -f docker-bake2.hcl --print app
```
@y
```console
$ docker buildx bake -f docker-bake1.hcl -f docker-bake2.hcl --print app
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
        "v1": "pre--ABCDEF-",
        "v2": "ABCDEF-post"
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
        "v1": "pre--ABCDEF-",
        "v2": "ABCDEF-post"
      }
    }
  }
}
```
@z
