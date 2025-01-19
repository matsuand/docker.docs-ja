%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
title: Overriding configurations
description: Learn how to override configurations in Bake files to build with different attributes.
keywords: build, buildx, bake, buildkit, hcl, json, overrides, configuration
@y
title: Overriding configurations
description: Learn how to override configurations in Bake files to build with different attributes.
keywords: build, buildx, bake, buildkit, hcl, json, overrides, configuration
@z

@x
Bake supports loading build definitions from files, but sometimes you need even
more flexibility to configure these definitions. For example, you might want to
override an attribute when building in a particular environment or for a
specific target.
@y
Bake supports loading build definitions from files, but sometimes you need even
more flexibility to configure these definitions. For example, you might want to
override an attribute when building in a particular environment or for a
specific target.
@z

@x
The following list of attributes can be overridden:
@y
The following list of attributes can be overridden:
@z

% snip attributes...

@x
To override these attributes, you can use the following methods:
@y
To override these attributes, you can use the following methods:
@z

@x
- [File overrides](#file-overrides)
- [CLI overrides](#command-line)
- [Environment variable overrides](#environment-variables)
@y
- [File overrides](#file-overrides)
- [CLI overrides](#command-line)
- [Environment variable overrides](#environment-variables)
@z

@x
## File overrides
@y
## File overrides
@z

@x
You can load multiple Bake files that define build configurations for your
targets. This is useful when you want to separate configurations into different
files for better organization, or to conditionally override configurations
based on which files are loaded.
@y
You can load multiple Bake files that define build configurations for your
targets. This is useful when you want to separate configurations into different
files for better organization, or to conditionally override configurations
based on which files are loaded.
@z

@x
### Default file lookup
@y
### Default file lookup
@z

@x
You can use the `--file` or `-f` flag to specify which files to load.
If you don't specify any files, Bake will use the following lookup order:
@y
You can use the `--file` or `-f` flag to specify which files to load.
If you don't specify any files, Bake will use the following lookup order:
@z

@x
1. `compose.yaml`
2. `compose.yml`
3. `docker-compose.yml`
4. `docker-compose.yaml`
5. `docker-bake.json`
6. `docker-bake.override.json`
7. `docker-bake.hcl`
8. `docker-bake.override.hcl`
@y
1. `compose.yaml`
2. `compose.yml`
3. `docker-compose.yml`
4. `docker-compose.yaml`
5. `docker-bake.json`
6. `docker-bake.override.json`
7. `docker-bake.hcl`
8. `docker-bake.override.hcl`
@z

@x
If more than one Bake file is found, all files are loaded and merged into a
single definition. Files are merged according to the lookup order.
@y
If more than one Bake file is found, all files are loaded and merged into a
single definition. Files are merged according to the lookup order.
@z

@x
```console
$ docker buildx bake bake --print
[+] Building 0.0s (1/1) FINISHED                                                                                                                                                                                            
 => [internal] load local bake definitions                                                                                                                                                                             0.0s
 => => reading compose.yaml 45B / 45B                                                                                                                                                                                  0.0s
 => => reading docker-bake.hcl 113B / 113B                                                                                                                                                                             0.0s
 => => reading docker-bake.override.hcl 65B / 65B
```
@y
```console
$ docker buildx bake bake --print
[+] Building 0.0s (1/1) FINISHED                                                                                                                                                                                            
 => [internal] load local bake definitions                                                                                                                                                                             0.0s
 => => reading compose.yaml 45B / 45B                                                                                                                                                                                  0.0s
 => => reading docker-bake.hcl 113B / 113B                                                                                                                                                                             0.0s
 => => reading docker-bake.override.hcl 65B / 65B
```
@z

@x
If merged files contain duplicate attribute definitions, those definitions are
either merged or overridden by the last occurrence, depending on the attribute.
@y
If merged files contain duplicate attribute definitions, those definitions are
either merged or overridden by the last occurrence, depending on the attribute.
@z

@x
Bake will attempt to load all of the files in the order they are found. If
multiple files define the same target, attributes are either merged or
overridden. In the case of overrides, the last one loaded takes precedence.
@y
Bake will attempt to load all of the files in the order they are found. If
multiple files define the same target, attributes are either merged or
overridden. In the case of overrides, the last one loaded takes precedence.
@z

@x
For example, given the following files:
@y
For example, given the following files:
@z

@x
```hcl {title=docker-bake.hcl}
variable "TAG" {
  default = "foo"
}
@y
```hcl {title=docker-bake.hcl}
variable "TAG" {
  default = "foo"
}
@z

@x
target "default" {
  tags = ["username/my-app:${TAG}"]
}
```
@y
target "default" {
  tags = ["username/my-app:${TAG}"]
}
```
@z

@x
```hcl {title=docker-bake.override.hcl}
variable "TAG" {
  default = "bar"
}
```
@y
```hcl {title=docker-bake.override.hcl}
variable "TAG" {
  default = "bar"
}
```
@z

@x
Since `docker-bake.override.hcl` is loaded last in the default lookup order,
the `TAG` variable is overridden with the value `bar`.
@y
Since `docker-bake.override.hcl` is loaded last in the default lookup order,
the `TAG` variable is overridden with the value `bar`.
@z

@x
```console
$ docker buildx bake --print
{
  "target": {
    "default": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "tags": ["username/my-app:bar"]
    }
  }
}
```
@y
```console
$ docker buildx bake --print
{
  "target": {
    "default": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "tags": ["username/my-app:bar"]
    }
  }
}
```
@z

@x
### Manual file overrides
@y
### Manual file overrides
@z

@x
You can use the `--file` flag to explicitly specify which files to load,
and use this as a way to conditionally apply override files.
@y
You can use the `--file` flag to explicitly specify which files to load,
and use this as a way to conditionally apply override files.
@z

@x
For example, you can create a file that defines a set of configurations for a
specific environment, and load it only when building for that environment. The
following example shows how to load an `override.hcl` file that sets the `TAG`
variable to `bar`. The `TAG` variable is then used in the `default` target.
@y
For example, you can create a file that defines a set of configurations for a
specific environment, and load it only when building for that environment. The
following example shows how to load an `override.hcl` file that sets the `TAG`
variable to `bar`. The `TAG` variable is then used in the `default` target.
@z

@x
```hcl {title=docker-bake.hcl}
variable "TAG" {
  default = "foo"
}
@y
```hcl {title=docker-bake.hcl}
variable "TAG" {
  default = "foo"
}
@z

@x
target "default" {
  tags = ["username/my-app:${TAG}"]
}
```
@y
target "default" {
  tags = ["username/my-app:${TAG}"]
}
```
@z

@x
```hcl {title=overrides.hcl}
variable "TAG" {
  default = "bar"
}
```
@y
```hcl {title=overrides.hcl}
variable "TAG" {
  default = "bar"
}
```
@z

@x
Printing the build configuration without the `--file` flag shows the `TAG`
variable is set to the default value `foo`.
@y
Printing the build configuration without the `--file` flag shows the `TAG`
variable is set to the default value `foo`.
@z

@x
```console
$ docker buildx bake --print
{
  "target": {
    "default": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "tags": [
        "username/my-app:foo"
      ]
    }
  }
}
```
@y
```console
$ docker buildx bake --print
{
  "target": {
    "default": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "tags": [
        "username/my-app:foo"
      ]
    }
  }
}
```
@z

@x
Using the `--file` flag to load the `overrides.hcl` file overrides the `TAG`
variable with the value `bar`.
@y
Using the `--file` flag to load the `overrides.hcl` file overrides the `TAG`
variable with the value `bar`.
@z

@x
```console
$ docker buildx bake -f docker-bake.hcl -f overrides.hcl --print
{
  "target": {
    "default": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "tags": [
        "username/my-app:bar"
      ]
    }
  }
}
```
@y
```console
$ docker buildx bake -f docker-bake.hcl -f overrides.hcl --print
{
  "target": {
    "default": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "tags": [
        "username/my-app:bar"
      ]
    }
  }
}
```
@z

@x
## Command line
@y
## Command line
@z

@x
You can also override target configurations from the command line with the
[`--set` flag](/reference/cli/docker/buildx/bake.md#set):
@y
You can also override target configurations from the command line with the
[`--set` flag](reference/cli/docker/buildx/bake.md#set):
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
Complete list of attributes that can be overridden with `--set` are:
@y
Complete list of attributes that can be overridden with `--set` are:
@z

% snip attributes...

@x
## Environment variables
@y
## Environment variables
@z

@x
You can also use environment variables to override configurations.
@y
You can also use environment variables to override configurations.
@z

@x
Bake lets you use environment variables to override the value of a `variable`
block. Only `variable` blocks can be overridden with environment variables.
This means you need to define the variables in the bake file and then set the
environment variable with the same name to override it.
@y
Bake lets you use environment variables to override the value of a `variable`
block. Only `variable` blocks can be overridden with environment variables.
This means you need to define the variables in the bake file and then set the
environment variable with the same name to override it.
@z

@x
The following example shows how you can define a `TAG` variable with a default
value in the Bake file, and override it with an environment variable.
@y
The following example shows how you can define a `TAG` variable with a default
value in the Bake file, and override it with an environment variable.
@z

@x
```hcl
variable "TAG" {
  default = "latest"
}
@y
```hcl
variable "TAG" {
  default = "latest"
}
@z

@x
target "default" {
  context = "."
  dockerfile = "Dockerfile"
  tags = ["docker.io/username/webapp:${TAG}"]
}
```
@y
target "default" {
  context = "."
  dockerfile = "Dockerfile"
  tags = ["docker.io/username/webapp:${TAG}"]
}
```
@z

@x
```console
$ export TAG=$(git rev-parse --short HEAD)
$ docker buildx bake --print webapp
```
@y
```console
$ export TAG=$(git rev-parse --short HEAD)
$ docker buildx bake --print webapp
```
@z

@x
The `TAG` variable is overridden with the value of the environment variable,
which is the short commit hash generated by `git rev-parse --short HEAD`.
@y
The `TAG` variable is overridden with the value of the environment variable,
which is the short commit hash generated by `git rev-parse --short HEAD`.
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
### Type coercion
@y
### Type coercion
@z

@x
Overriding non-string variables with environment variables is supported. Values
passed as environment variables are coerced into suitable types first.
@y
Overriding non-string variables with environment variables is supported. Values
passed as environment variables are coerced into suitable types first.
@z

@x
The following example defines a `PORT` variable. The `backend` target uses the
`PORT` variable as-is, and the `frontend` target uses the value of `PORT`
incremented by one.
@y
The following example defines a `PORT` variable. The `backend` target uses the
`PORT` variable as-is, and the `frontend` target uses the value of `PORT`
incremented by one.
@z

@x
```hcl
variable "PORT" {
  default = 3000
}
@y
```hcl
variable "PORT" {
  default = 3000
}
@z

@x
group "default" {
  targets = ["backend", "frontend"]
}
@y
group "default" {
  targets = ["backend", "frontend"]
}
@z

@x
target "backend" {
  args = {
    PORT = PORT
  }
}
@y
target "backend" {
  args = {
    PORT = PORT
  }
}
@z

@x
target "frontend" {
  args = {
    PORT = add(PORT, 1)
  }
}
```
@y
target "frontend" {
  args = {
    PORT = add(PORT, 1)
  }
}
```
@z

@x
Overriding `PORT` using an environment variable will first coerce the value
into the expected type, an integer, before the expression in the `frontend`
target runs.
@y
Overriding `PORT` using an environment variable will first coerce the value
into the expected type, an integer, before the expression in the `frontend`
target runs.
@z

@x
```console
$ PORT=7070 docker buildx bake --print
```
@y
```console
$ PORT=7070 docker buildx bake --print
```
@z

@x
```json
{
  "group": {
    "default": {
      "targets": [
        "backend",
        "frontend"
      ]
    }
  },
  "target": {
    "backend": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "args": {
        "PORT": "7070"
      }
    },
    "frontend": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "args": {
        "PORT": "7071"
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
      "targets": [
        "backend",
        "frontend"
      ]
    }
  },
  "target": {
    "backend": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "args": {
        "PORT": "7070"
      }
    },
    "frontend": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "args": {
        "PORT": "7071"
      }
    }
  }
}
```
@z
