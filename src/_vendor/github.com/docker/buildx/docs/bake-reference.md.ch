%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# Bake file reference
@y
# Bake file reference
@z

@x
The Bake file is a file for defining workflows that you run using `docker buildx bake`.
@y
The Bake file is a file for defining workflows that you run using `docker buildx bake`.
@z

@x
## File format
@y
## File format
@z

@x
You can define your Bake file in the following file formats:
@y
You can define your Bake file in the following file formats:
@z

@x
- HashiCorp Configuration Language (HCL)
- JSON
- YAML (Compose file)
@y
- HashiCorp Configuration Language (HCL)
- JSON
- YAML (Compose file)
@z

@x
By default, Bake uses the following lookup order to find the configuration file:
@y
By default, Bake uses the following lookup order to find the configuration file:
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
You can specify the file location explicitly using the `--file` flag:
@y
You can specify the file location explicitly using the `--file` flag:
@z

@x
```console
$ docker buildx bake --file ../docker/bake.hcl --print
```
@y
```console
$ docker buildx bake --file ../docker/bake.hcl --print
```
@z

@x
If you don't specify a file explicitly, Bake searches for the file in the
current working directory. If more than one Bake file is found, all files are
merged into a single definition. Files are merged according to the lookup
order. That means that if your project contains both a `compose.yaml` file and
a `docker-bake.hcl` file, Bake loads the `compose.yaml` file first, and then
the `docker-bake.hcl` file.
@y
If you don't specify a file explicitly, Bake searches for the file in the
current working directory. If more than one Bake file is found, all files are
merged into a single definition. Files are merged according to the lookup
order. That means that if your project contains both a `compose.yaml` file and
a `docker-bake.hcl` file, Bake loads the `compose.yaml` file first, and then
the `docker-bake.hcl` file.
@z

@x
If merged files contain duplicate attribute definitions, those definitions are
either merged or overridden by the last occurrence, depending on the attribute.
The following attributes are overridden by the last occurrence:
@y
If merged files contain duplicate attribute definitions, those definitions are
either merged or overridden by the last occurrence, depending on the attribute.
The following attributes are overridden by the last occurrence:
@z

@x
- `target.cache-to`
- `target.dockerfile-inline`
- `target.dockerfile`
- `target.outputs`
- `target.platforms`
- `target.pull`
- `target.tags`
- `target.target`
@y
- `target.cache-to`
- `target.dockerfile-inline`
- `target.dockerfile`
- `target.outputs`
- `target.platforms`
- `target.pull`
- `target.tags`
- `target.target`
@z

@x
For example, if `compose.yaml` and `docker-bake.hcl` both define the `tags`
attribute, the `docker-bake.hcl` is used.
@y
For example, if `compose.yaml` and `docker-bake.hcl` both define the `tags`
attribute, the `docker-bake.hcl` is used.
@z

@x
```console
$ cat compose.yaml
services:
  webapp:
    build:
      context: .
      tags:
        - bar
$ cat docker-bake.hcl
target "webapp" {
  tags = ["foo"]
}
$ docker buildx bake --print webapp
{
  "group": {
    "default": {
      "targets": [
        "webapp"
      ]
    }
  },
  "target": {
    "webapp": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "tags": [
        "foo"
      ]
    }
  }
}
```
@y
```console
$ cat compose.yaml
services:
  webapp:
    build:
      context: .
      tags:
        - bar
$ cat docker-bake.hcl
target "webapp" {
  tags = ["foo"]
}
$ docker buildx bake --print webapp
{
  "group": {
    "default": {
      "targets": [
        "webapp"
      ]
    }
  },
  "target": {
    "webapp": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "tags": [
        "foo"
      ]
    }
  }
}
```
@z

@x
All other attributes are merged. For example, if `compose.yaml` and
`docker-bake.hcl` both define unique entries for the `labels` attribute, all
entries are included. Duplicate entries for the same label are overridden.
@y
All other attributes are merged. For example, if `compose.yaml` and
`docker-bake.hcl` both define unique entries for the `labels` attribute, all
entries are included. Duplicate entries for the same label are overridden.
@z

@x
```console
$ cat compose.yaml
services:
  webapp:
    build:
      context: .
      labels: 
        com.example.foo: "foo"
        com.example.name: "Alice"
$ cat docker-bake.hcl
target "webapp" {
  labels = {
    "com.example.bar" = "bar"
    "com.example.name" = "Bob"
  }
}
$ docker buildx bake --print webapp
{
  "group": {
    "default": {
      "targets": [
        "webapp"
      ]
    }
  },
  "target": {
    "webapp": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "labels": {
        "com.example.foo": "foo",
        "com.example.bar": "bar",
        "com.example.name": "Bob"
      }
    }
  }
}
```
@y
```console
$ cat compose.yaml
services:
  webapp:
    build:
      context: .
      labels: 
        com.example.foo: "foo"
        com.example.name: "Alice"
$ cat docker-bake.hcl
target "webapp" {
  labels = {
    "com.example.bar" = "bar"
    "com.example.name" = "Bob"
  }
}
$ docker buildx bake --print webapp
{
  "group": {
    "default": {
      "targets": [
        "webapp"
      ]
    }
  },
  "target": {
    "webapp": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "labels": {
        "com.example.foo": "foo",
        "com.example.bar": "bar",
        "com.example.name": "Bob"
      }
    }
  }
}
```
@z

@x
## Syntax
@y
## Syntax
@z

@x
The Bake file supports the following property types:
@y
The Bake file supports the following property types:
@z

@x
- `target`: build targets
- `group`: collections of build targets
- `variable`: build arguments and variables
- `function`: custom Bake functions
@y
- `target`: build targets
- `group`: collections of build targets
- `variable`: build arguments and variables
- `function`: custom Bake functions
@z

@x
You define properties as hierarchical blocks in the Bake file.
You can assign one or more attributes to a property.
@y
You define properties as hierarchical blocks in the Bake file.
You can assign one or more attributes to a property.
@z

@x
The following snippet shows a JSON representation of a simple Bake file.
This Bake file defines three properties: a variable, a group, and a target.
@y
The following snippet shows a JSON representation of a simple Bake file.
This Bake file defines three properties: a variable, a group, and a target.
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
      "dockerfile": "Dockerfile",
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
      "dockerfile": "Dockerfile",
      "tags": ["docker.io/username/webapp:${TAG}"]
    }
  }
}
```
@z

@x
In the JSON representation of a Bake file, properties are objects,
and attributes are values assigned to those objects.
@y
In the JSON representation of a Bake file, properties are objects,
and attributes are values assigned to those objects.
@z

@x
The following example shows the same Bake file in the HCL format:
@y
The following example shows the same Bake file in the HCL format:
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
  dockerfile = "Dockerfile"
  tags = ["docker.io/username/webapp:${TAG}"]
}
```
@y
target "webapp" {
  dockerfile = "Dockerfile"
  tags = ["docker.io/username/webapp:${TAG}"]
}
```
@z

@x
HCL is the preferred format for Bake files.
Aside from syntactic differences,
HCL lets you use features that the JSON and YAML formats don't support.
@y
HCL is the preferred format for Bake files.
Aside from syntactic differences,
HCL lets you use features that the JSON and YAML formats don't support.
@z

@x
The examples in this document use the HCL format.
@y
The examples in this document use the HCL format.
@z

@x
## Target
@y
## Target
@z

@x
A target reflects a single `docker build` invocation.
Consider the following build command:
@y
A target reflects a single `docker build` invocation.
Consider the following build command:
@z

@x
```console
$ docker build \
  --file=Dockerfile.webapp \
  --tag=docker.io/username/webapp:latest \
  https://github.com/username/webapp
```
@y
```console
$ docker build \
  --file=Dockerfile.webapp \
  --tag=docker.io/username/webapp:latest \
  https://github.com/username/webapp
```
@z

@x
You can express this command in a Bake file as follows:
@y
You can express this command in a Bake file as follows:
@z

@x
```hcl
target "webapp" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  context = "https://github.com/username/webapp"
}
```
@y
```hcl
target "webapp" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  context = "https://github.com/username/webapp"
}
```
@z

@x
The following table shows the complete list of attributes that you can assign to a target:
@y
The following table shows the complete list of attributes that you can assign to a target:
@z

@x
| Name                                            | Type    | Description                                                          |
| ----------------------------------------------- | ------- | -------------------------------------------------------------------- |
| [`args`](#targetargs)                           | Map     | Build arguments                                                      |
| [`annotations`](#targetannotations)             | List    | Exporter annotations                                                 |
| [`attest`](#targetattest)                       | List    | Build attestations                                                   |
| [`cache-from`](#targetcache-from)               | List    | External cache sources                                               |
| [`cache-to`](#targetcache-to)                   | List    | External cache destinations                                          |
| [`context`](#targetcontext)                     | String  | Set of files located in the specified path or URL                    |
| [`contexts`](#targetcontexts)                   | Map     | Additional build contexts                                            |
| [`dockerfile-inline`](#targetdockerfile-inline) | String  | Inline Dockerfile string                                             |
| [`dockerfile`](#targetdockerfile)               | String  | Dockerfile location                                                  |
| [`inherits`](#targetinherits)                   | List    | Inherit attributes from other targets                                |
| [`labels`](#targetlabels)                       | Map     | Metadata for images                                                  |
| [`matrix`](#targetmatrix)                       | Map     | Define a set of variables that forks a target into multiple targets. |
| [`name`](#targetname)                           | String  | Override the target name when using a matrix.                        |
| [`no-cache-filter`](#targetno-cache-filter)     | List    | Disable build cache for specific stages                              |
| [`no-cache`](#targetno-cache)                   | Boolean | Disable build cache completely                                       |
| [`output`](#targetoutput)                       | List    | Output destinations                                                  |
| [`platforms`](#targetplatforms)                 | List    | Target platforms                                                     |
| [`pull`](#targetpull)                           | Boolean | Always pull images                                                   |
| [`secret`](#targetsecret)                       | List    | Secrets to expose to the build                                       |
| [`ssh`](#targetssh)                             | List    | SSH agent sockets or keys to expose to the build                     |
| [`tags`](#targettags)                           | List    | Image names and tags                                                 |
| [`target`](#targettarget)                       | String  | Target build stage                                                   |
@y
| Name                                            | Type    | Description                                                          |
| ----------------------------------------------- | ------- | -------------------------------------------------------------------- |
| [`args`](#targetargs)                           | Map     | Build arguments                                                      |
| [`annotations`](#targetannotations)             | List    | Exporter annotations                                                 |
| [`attest`](#targetattest)                       | List    | Build attestations                                                   |
| [`cache-from`](#targetcache-from)               | List    | External cache sources                                               |
| [`cache-to`](#targetcache-to)                   | List    | External cache destinations                                          |
| [`context`](#targetcontext)                     | String  | Set of files located in the specified path or URL                    |
| [`contexts`](#targetcontexts)                   | Map     | Additional build contexts                                            |
| [`dockerfile-inline`](#targetdockerfile-inline) | String  | Inline Dockerfile string                                             |
| [`dockerfile`](#targetdockerfile)               | String  | Dockerfile location                                                  |
| [`inherits`](#targetinherits)                   | List    | Inherit attributes from other targets                                |
| [`labels`](#targetlabels)                       | Map     | Metadata for images                                                  |
| [`matrix`](#targetmatrix)                       | Map     | Define a set of variables that forks a target into multiple targets. |
| [`name`](#targetname)                           | String  | Override the target name when using a matrix.                        |
| [`no-cache-filter`](#targetno-cache-filter)     | List    | Disable build cache for specific stages                              |
| [`no-cache`](#targetno-cache)                   | Boolean | Disable build cache completely                                       |
| [`output`](#targetoutput)                       | List    | Output destinations                                                  |
| [`platforms`](#targetplatforms)                 | List    | Target platforms                                                     |
| [`pull`](#targetpull)                           | Boolean | Always pull images                                                   |
| [`secret`](#targetsecret)                       | List    | Secrets to expose to the build                                       |
| [`ssh`](#targetssh)                             | List    | SSH agent sockets or keys to expose to the build                     |
| [`tags`](#targettags)                           | List    | Image names and tags                                                 |
| [`target`](#targettarget)                       | String  | Target build stage                                                   |
@z

@x
### `target.args`
@y
### `target.args`
@z

@x
Use the `args` attribute to define build arguments for the target.
This has the same effect as passing a [`--build-arg`][build-arg] flag to the build command.
@y
Use the `args` attribute to define build arguments for the target.
This has the same effect as passing a [`--build-arg`][build-arg] flag to the build command.
@z

@x
```hcl
target "default" {
  args = {
    VERSION = "0.0.0+unknown"
  }
}
```
@y
```hcl
target "default" {
  args = {
    VERSION = "0.0.0+unknown"
  }
}
```
@z

@x
You can set `args` attributes to use `null` values.
Doing so forces the `target` to use the `ARG` value specified in the Dockerfile.
@y
You can set `args` attributes to use `null` values.
Doing so forces the `target` to use the `ARG` value specified in the Dockerfile.
@z

@x
```hcl
variable "GO_VERSION" {
  default = "1.20.3"
}
@y
```hcl
variable "GO_VERSION" {
  default = "1.20.3"
}
@z

@x
target "webapp" {
  dockerfile = "webapp.Dockerfile"
  tags = ["docker.io/username/webapp"]
}
@y
target "webapp" {
  dockerfile = "webapp.Dockerfile"
  tags = ["docker.io/username/webapp"]
}
@z

@x
target "db" {
  args = {
    GO_VERSION = null
  }
  dockerfile = "db.Dockerfile"
  tags = ["docker.io/username/db"]
}
```
@y
target "db" {
  args = {
    GO_VERSION = null
  }
  dockerfile = "db.Dockerfile"
  tags = ["docker.io/username/db"]
}
```
@z

@x
### `target.annotations`
@y
### `target.annotations`
@z

@x
The `annotations` attribute lets you add annotations to images built with bake.
The key takes a list of annotations, in the format of `KEY=VALUE`.
@y
The `annotations` attribute lets you add annotations to images built with bake.
The key takes a list of annotations, in the format of `KEY=VALUE`.
@z

@x
```hcl
target "default" {
  output = ["type=image,name=foo"]
  annotations = ["org.opencontainers.image.authors=dvdksn"]
}
```
@y
```hcl
target "default" {
  output = ["type=image,name=foo"]
  annotations = ["org.opencontainers.image.authors=dvdksn"]
}
```
@z

@x
is the same as
@y
is the same as
@z

@x
```hcl
target "default" {
  output = ["type=image,name=foo,annotation.org.opencontainers.image.authors=dvdksn"]
}
```
@y
```hcl
target "default" {
  output = ["type=image,name=foo,annotation.org.opencontainers.image.authors=dvdksn"]
}
```
@z

@x
By default, the annotation is added to image manifests. You can configure the
level of the annotations by adding a prefix to the annotation, containing a
comma-separated list of all the levels that you want to annotate. The following
example adds annotations to both the image index and manifests.
@y
By default, the annotation is added to image manifests. You can configure the
level of the annotations by adding a prefix to the annotation, containing a
comma-separated list of all the levels that you want to annotate. The following
example adds annotations to both the image index and manifests.
@z

@x
```hcl
target "default" {
  output = ["type=image,name=foo"]
  annotations = ["index,manifest:org.opencontainers.image.authors=dvdksn"]
}
```
@y
```hcl
target "default" {
  output = ["type=image,name=foo"]
  annotations = ["index,manifest:org.opencontainers.image.authors=dvdksn"]
}
```
@z

@x
Read about the supported levels in
[Specifying annotation levels](https://docs.docker.com/build/building/annotations/#specifying-annotation-levels).
@y
Read about the supported levels in
[Specifying annotation levels](https://docs.docker.com/build/building/annotations/#specifying-annotation-levels).
@z

@x
### `target.attest`
@y
### `target.attest`
@z

@x
The `attest` attribute lets you apply [build attestations][attestations] to the target.
This attribute accepts the long-form CSV version of attestation parameters.
@y
The `attest` attribute lets you apply [build attestations][attestations] to the target.
This attribute accepts the long-form CSV version of attestation parameters.
@z

@x
```hcl
target "default" {
  attest = [
    "type=provenance,mode=min",
    "type=sbom"
  ]
}
```
@y
```hcl
target "default" {
  attest = [
    "type=provenance,mode=min",
    "type=sbom"
  ]
}
```
@z

@x
### `target.cache-from`
@y
### `target.cache-from`
@z

@x
Build cache sources.
The builder imports cache from the locations you specify.
It uses the [Buildx cache storage backends][cache-backends],
and it works the same way as the [`--cache-from`][cache-from] flag.
This takes a list value, so you can specify multiple cache sources.
@y
Build cache sources.
The builder imports cache from the locations you specify.
It uses the [Buildx cache storage backends][cache-backends],
and it works the same way as the [`--cache-from`][cache-from] flag.
This takes a list value, so you can specify multiple cache sources.
@z

@x
```hcl
target "app" {
  cache-from = [
    "type=s3,region=eu-west-1,bucket=mybucket",
    "user/repo:cache",
  ]
}
```
@y
```hcl
target "app" {
  cache-from = [
    "type=s3,region=eu-west-1,bucket=mybucket",
    "user/repo:cache",
  ]
}
```
@z

@x
### `target.cache-to`
@y
### `target.cache-to`
@z

@x
Build cache export destinations.
The builder exports its build cache to the locations you specify.
It uses the [Buildx cache storage backends][cache-backends],
and it works the same way as the [`--cache-to` flag][cache-to].
This takes a list value, so you can specify multiple cache export targets.
@y
Build cache export destinations.
The builder exports its build cache to the locations you specify.
It uses the [Buildx cache storage backends][cache-backends],
and it works the same way as the [`--cache-to` flag][cache-to].
This takes a list value, so you can specify multiple cache export targets.
@z

@x
```hcl
target "app" {
  cache-to = [
    "type=s3,region=eu-west-1,bucket=mybucket",
    "type=inline"
  ]
}
```
@y
```hcl
target "app" {
  cache-to = [
    "type=s3,region=eu-west-1,bucket=mybucket",
    "type=inline"
  ]
}
```
@z

@x
### `target.context`
@y
### `target.context`
@z

@x
Specifies the location of the build context to use for this target.
Accepts a URL or a directory path.
This is the same as the [build context][context] positional argument
that you pass to the build command.
@y
Specifies the location of the build context to use for this target.
Accepts a URL or a directory path.
This is the same as the [build context][context] positional argument
that you pass to the build command.
@z

@x
```hcl
target "app" {
  context = "./src/www"
}
```
@y
```hcl
target "app" {
  context = "./src/www"
}
```
@z

@x
This resolves to the current working directory (`"."`) by default.
@y
This resolves to the current working directory (`"."`) by default.
@z

@x
```console
$ docker buildx bake --print -f - <<< 'target "default" {}'
[+] Building 0.0s (0/0)
{
  "target": {
    "default": {
      "context": ".",
      "dockerfile": "Dockerfile"
    }
  }
}
```
@y
```console
$ docker buildx bake --print -f - <<< 'target "default" {}'
[+] Building 0.0s (0/0)
{
  "target": {
    "default": {
      "context": ".",
      "dockerfile": "Dockerfile"
    }
  }
}
```
@z

@x
### `target.contexts`
@y
### `target.contexts`
@z

@x
Additional build contexts.
This is the same as the [`--build-context` flag][build-context].
This attribute takes a map, where keys result in named contexts that you can
reference in your builds.
@y
Additional build contexts.
This is the same as the [`--build-context` flag][build-context].
This attribute takes a map, where keys result in named contexts that you can
reference in your builds.
@z

@x
You can specify different types of contexts, such local directories, Git URLs,
and even other Bake targets. Bake automatically determines the type of
a context based on the pattern of the context value.
@y
You can specify different types of contexts, such local directories, Git URLs,
and even other Bake targets. Bake automatically determines the type of
a context based on the pattern of the context value.
@z

@x
| Context type    | Example                                   |
| --------------- | ----------------------------------------- |
| Container image | `docker-image://alpine@sha256:0123456789` |
| Git URL         | `https://github.com/user/proj.git`        |
| HTTP URL        | `https://example.com/files`               |
| Local directory | `../path/to/src`                          |
| Bake target     | `target:base`                             |
@y
| Context type    | Example                                   |
| --------------- | ----------------------------------------- |
| Container image | `docker-image://alpine@sha256:0123456789` |
| Git URL         | `https://github.com/user/proj.git`        |
| HTTP URL        | `https://example.com/files`               |
| Local directory | `../path/to/src`                          |
| Bake target     | `target:base`                             |
@z

@x
#### Pin an image version
@y
#### Pin an image version
@z

@x
```hcl
# docker-bake.hcl
target "app" {
    contexts = {
        alpine = "docker-image://alpine:3.13"
    }
}
```
@y
```hcl
# docker-bake.hcl
target "app" {
    contexts = {
        alpine = "docker-image://alpine:3.13"
    }
}
```
@z

@x
```Dockerfile
# Dockerfile
FROM alpine
RUN echo "Hello world"
```
@y
```Dockerfile
# Dockerfile
FROM alpine
RUN echo "Hello world"
```
@z

@x
#### Use a local directory
@y
#### Use a local directory
@z

@x
```hcl
# docker-bake.hcl
target "app" {
    contexts = {
        src = "../path/to/source"
    }
}
```
@y
```hcl
# docker-bake.hcl
target "app" {
    contexts = {
        src = "../path/to/source"
    }
}
```
@z

@x
```Dockerfile
# Dockerfile
FROM scratch AS src
FROM golang
COPY --from=src . .
```
@y
```Dockerfile
# Dockerfile
FROM scratch AS src
FROM golang
COPY --from=src . .
```
@z

@x
#### Use another target as base
@y
#### Use another target as base
@z

@x
> **Note**
>
> You should prefer to use regular multi-stage builds over this option. You can
> Use this feature when you have multiple Dockerfiles that can't be easily
> merged into one.
@y
> **Note**
>
> You should prefer to use regular multi-stage builds over this option. You can
> Use this feature when you have multiple Dockerfiles that can't be easily
> merged into one.
@z

@x
```hcl
# docker-bake.hcl
target "base" {
    dockerfile = "baseapp.Dockerfile"
}
target "app" {
    contexts = {
        baseapp = "target:base"
    }
}
```
@y
```hcl
# docker-bake.hcl
target "base" {
    dockerfile = "baseapp.Dockerfile"
}
target "app" {
    contexts = {
        baseapp = "target:base"
    }
}
```
@z

@x
```Dockerfile
# Dockerfile
FROM baseapp
RUN echo "Hello world"
```
@y
```Dockerfile
# Dockerfile
FROM baseapp
RUN echo "Hello world"
```
@z

@x
### `target.dockerfile-inline`
@y
### `target.dockerfile-inline`
@z

@x
Uses the string value as an inline Dockerfile for the build target.
@y
Uses the string value as an inline Dockerfile for the build target.
@z

@x
```hcl
target "default" {
  dockerfile-inline = "FROM alpine\nENTRYPOINT [\"echo\", \"hello\"]"
}
```
@y
```hcl
target "default" {
  dockerfile-inline = "FROM alpine\nENTRYPOINT [\"echo\", \"hello\"]"
}
```
@z

@x
The `dockerfile-inline` takes precedence over the `dockerfile` attribute.
If you specify both, Bake uses the inline version.
@y
The `dockerfile-inline` takes precedence over the `dockerfile` attribute.
If you specify both, Bake uses the inline version.
@z

@x
### `target.dockerfile`
@y
### `target.dockerfile`
@z

@x
Name of the Dockerfile to use for the build.
This is the same as the [`--file` flag][file] for the `docker build` command.
@y
Name of the Dockerfile to use for the build.
This is the same as the [`--file` flag][file] for the `docker build` command.
@z

@x
```hcl
target "default" {
  dockerfile = "./src/www/Dockerfile"
}
```
@y
```hcl
target "default" {
  dockerfile = "./src/www/Dockerfile"
}
```
@z

@x
Resolves to `"Dockerfile"` by default.
@y
Resolves to `"Dockerfile"` by default.
@z

@x
```console
$ docker buildx bake --print -f - <<< 'target "default" {}'
[+] Building 0.0s (0/0)
{
  "target": {
    "default": {
      "context": ".",
      "dockerfile": "Dockerfile"
    }
  }
}
```
@y
```console
$ docker buildx bake --print -f - <<< 'target "default" {}'
[+] Building 0.0s (0/0)
{
  "target": {
    "default": {
      "context": ".",
      "dockerfile": "Dockerfile"
    }
  }
}
```
@z

@x
### `target.inherits`
@y
### `target.inherits`
@z

@x
A target can inherit attributes from other targets.
Use `inherits` to reference from one target to another.
@y
A target can inherit attributes from other targets.
Use `inherits` to reference from one target to another.
@z

@x
In the following example,
the `app-dev` target specifies an image name and tag.
The `app-release` target uses `inherits` to reuse the tag name.
@y
In the following example,
the `app-dev` target specifies an image name and tag.
The `app-release` target uses `inherits` to reuse the tag name.
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
target "app-dev" {
  tags = ["docker.io/username/myapp:${TAG}"]
}
@y
target "app-dev" {
  tags = ["docker.io/username/myapp:${TAG}"]
}
@z

@x
target "app-release" {
  inherits = ["app-dev"]
  platforms = ["linux/amd64", "linux/arm64"]
}
```
@y
target "app-release" {
  inherits = ["app-dev"]
  platforms = ["linux/amd64", "linux/arm64"]
}
```
@z

@x
The `inherits` attribute is a list,
meaning you can reuse attributes from multiple other targets.
In the following example, the `app-release` target reuses attributes
from both the `app-dev` and `_release` targets.
@y
The `inherits` attribute is a list,
meaning you can reuse attributes from multiple other targets.
In the following example, the `app-release` target reuses attributes
from both the `app-dev` and `_release` targets.
@z

@x
```hcl
target "app-dev" {
  args = {
    GO_VERSION = "1.20"
    BUILDX_EXPERIMENTAL = 1
  }
  tags = ["docker.io/username/myapp"]
  dockerfile = "app.Dockerfile"
  labels = {
    "org.opencontainers.image.source" = "https://github.com/username/myapp"
  }
}
@y
```hcl
target "app-dev" {
  args = {
    GO_VERSION = "1.20"
    BUILDX_EXPERIMENTAL = 1
  }
  tags = ["docker.io/username/myapp"]
  dockerfile = "app.Dockerfile"
  labels = {
    "org.opencontainers.image.source" = "https://github.com/username/myapp"
  }
}
@z

@x
target "_release" {
  args = {
    BUILDKIT_CONTEXT_KEEP_GIT_DIR = 1
    BUILDX_EXPERIMENTAL = 0
  }
}
@y
target "_release" {
  args = {
    BUILDKIT_CONTEXT_KEEP_GIT_DIR = 1
    BUILDX_EXPERIMENTAL = 0
  }
}
@z

@x
target "app-release" {
  inherits = ["app-dev", "_release"]
  platforms = ["linux/amd64", "linux/arm64"]
}
```
@y
target "app-release" {
  inherits = ["app-dev", "_release"]
  platforms = ["linux/amd64", "linux/arm64"]
}
```
@z

@x
When inheriting attributes from multiple targets and there's a conflict,
the target that appears last in the `inherits` list takes precedence.
The previous example defines the `BUILDX_EXPERIMENTAL` argument twice for the `app-release` target.
It resolves to `0` because the `_release` target appears last in the inheritance chain:
@y
When inheriting attributes from multiple targets and there's a conflict,
the target that appears last in the `inherits` list takes precedence.
The previous example defines the `BUILDX_EXPERIMENTAL` argument twice for the `app-release` target.
It resolves to `0` because the `_release` target appears last in the inheritance chain:
@z

@x
```console
$ docker buildx bake --print app-release
[+] Building 0.0s (0/0)
{
  "group": {
    "default": {
      "targets": [
        "app-release"
      ]
    }
  },
  "target": {
    "app-release": {
      "context": ".",
      "dockerfile": "app.Dockerfile",
      "args": {
        "BUILDKIT_CONTEXT_KEEP_GIT_DIR": "1",
        "BUILDX_EXPERIMENTAL": "0",
        "GO_VERSION": "1.20"
      },
      "labels": {
        "org.opencontainers.image.source": "https://github.com/username/myapp"
      },
      "tags": [
        "docker.io/username/myapp"
      ],
      "platforms": [
        "linux/amd64",
        "linux/arm64"
      ]
    }
  }
}
```
@y
```console
$ docker buildx bake --print app-release
[+] Building 0.0s (0/0)
{
  "group": {
    "default": {
      "targets": [
        "app-release"
      ]
    }
  },
  "target": {
    "app-release": {
      "context": ".",
      "dockerfile": "app.Dockerfile",
      "args": {
        "BUILDKIT_CONTEXT_KEEP_GIT_DIR": "1",
        "BUILDX_EXPERIMENTAL": "0",
        "GO_VERSION": "1.20"
      },
      "labels": {
        "org.opencontainers.image.source": "https://github.com/username/myapp"
      },
      "tags": [
        "docker.io/username/myapp"
      ],
      "platforms": [
        "linux/amd64",
        "linux/arm64"
      ]
    }
  }
}
```
@z

@x
### `target.labels`
@y
### `target.labels`
@z

@x
Assigns image labels to the build.
This is the same as the `--label` flag for `docker build`.
@y
Assigns image labels to the build.
This is the same as the `--label` flag for `docker build`.
@z

@x
```hcl
target "default" {
  labels = {
    "org.opencontainers.image.source" = "https://github.com/username/myapp"
    "com.docker.image.source.entrypoint" = "Dockerfile"
  }
}
```
@y
```hcl
target "default" {
  labels = {
    "org.opencontainers.image.source" = "https://github.com/username/myapp"
    "com.docker.image.source.entrypoint" = "Dockerfile"
  }
}
```
@z

@x
It's possible to use a `null` value for labels.
If you do, the builder uses the label value specified in the Dockerfile.
@y
It's possible to use a `null` value for labels.
If you do, the builder uses the label value specified in the Dockerfile.
@z

@x
### `target.matrix`
@y
### `target.matrix`
@z

@x
A matrix strategy lets you fork a single target into multiple different
variants, based on parameters that you specify.
This works in a similar way to [Matrix strategies for GitHub Actions].
You can use this to reduce duplication in your bake definition.
@y
A matrix strategy lets you fork a single target into multiple different
variants, based on parameters that you specify.
This works in a similar way to [Matrix strategies for GitHub Actions].
You can use this to reduce duplication in your bake definition.
@z

@x
The `matrix` attribute is a map of parameter names to lists of values.
Bake builds each possible combination of values as a separate target.
@y
The `matrix` attribute is a map of parameter names to lists of values.
Bake builds each possible combination of values as a separate target.
@z

@x
Each generated target **must** have a unique name.
To specify how target names should resolve, use the `name` attribute.
@y
Each generated target **must** have a unique name.
To specify how target names should resolve, use the `name` attribute.
@z

@x
The following example resolves the `app` target to `app-foo` and `app-bar`.
It also uses the matrix value to define the [target build stage](#targettarget).
@y
The following example resolves the `app` target to `app-foo` and `app-bar`.
It also uses the matrix value to define the [target build stage](#targettarget).
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
#### Multiple axes
@y
#### Multiple axes
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
#### Multiple values per matrix target
@y
#### Multiple values per matrix target
@z

@x
If you want to differentiate the matrix on more than just a single value,
you can use maps as matrix values. Bake creates a target for each map,
and you can access the nested values using dot notation.
@y
If you want to differentiate the matrix on more than just a single value,
you can use maps as matrix values. Bake creates a target for each map,
and you can access the nested values using dot notation.
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

@x
### `target.name`
@y
### `target.name`
@z

@x
Specify name resolution for targets that use a matrix strategy.
The following example resolves the `app` target to `app-foo` and `app-bar`.
@y
Specify name resolution for targets that use a matrix strategy.
The following example resolves the `app` target to `app-foo` and `app-bar`.
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
### `target.no-cache-filter`
@y
### `target.no-cache-filter`
@z

@x
Don't use build cache for the specified stages.
This is the same as the `--no-cache-filter` flag for `docker build`.
The following example avoids build cache for the `foo` build stage.
@y
Don't use build cache for the specified stages.
This is the same as the `--no-cache-filter` flag for `docker build`.
The following example avoids build cache for the `foo` build stage.
@z

@x
```hcl
target "default" {
  no-cache-filter = ["foo"]
}
```
@y
```hcl
target "default" {
  no-cache-filter = ["foo"]
}
```
@z

@x
### `target.no-cache`
@y
### `target.no-cache`
@z

@x
Don't use cache when building the image.
This is the same as the `--no-cache` flag for `docker build`.
@y
Don't use cache when building the image.
This is the same as the `--no-cache` flag for `docker build`.
@z

@x
```hcl
target "default" {
  no-cache = 1
}
```
@y
```hcl
target "default" {
  no-cache = 1
}
```
@z

@x
### `target.output`
@y
### `target.output`
@z

@x
Configuration for exporting the build output.
This is the same as the [`--output` flag][output].
The following example configures the target to use a cache-only output,
@y
Configuration for exporting the build output.
This is the same as the [`--output` flag][output].
The following example configures the target to use a cache-only output,
@z

@x
```hcl
target "default" {
  output = ["type=cacheonly"]
}
```
@y
```hcl
target "default" {
  output = ["type=cacheonly"]
}
```
@z

@x
### `target.platforms`
@y
### `target.platforms`
@z

@x
Set target platforms for the build target.
This is the same as the [`--platform` flag][platform].
The following example creates a multi-platform build for three architectures.
@y
Set target platforms for the build target.
This is the same as the [`--platform` flag][platform].
The following example creates a multi-platform build for three architectures.
@z

@x
```hcl
target "default" {
  platforms = ["linux/amd64", "linux/arm64", "linux/arm/v7"]
}
```
@y
```hcl
target "default" {
  platforms = ["linux/amd64", "linux/arm64", "linux/arm/v7"]
}
```
@z

@x
### `target.pull`
@y
### `target.pull`
@z

@x
Configures whether the builder should attempt to pull images when building the target.
This is the same as the `--pull` flag for `docker build`.
The following example forces the builder to always pull all images referenced in the build target.
@y
Configures whether the builder should attempt to pull images when building the target.
This is the same as the `--pull` flag for `docker build`.
The following example forces the builder to always pull all images referenced in the build target.
@z

@x
```hcl
target "default" {
  pull = "always"
}
```
@y
```hcl
target "default" {
  pull = "always"
}
```
@z

@x
### `target.secret`
@y
### `target.secret`
@z

@x
Defines secrets to expose to the build target.
This is the same as the [`--secret` flag][secret].
@y
Defines secrets to expose to the build target.
This is the same as the [`--secret` flag][secret].
@z

@x
```hcl
variable "HOME" {
  default = null
}
@y
```hcl
variable "HOME" {
  default = null
}
@z

@x
target "default" {
  secret = [
    "type=env,id=KUBECONFIG",
    "type=file,id=aws,src=${HOME}/.aws/credentials"
  ]
}
```
@y
target "default" {
  secret = [
    "type=env,id=KUBECONFIG",
    "type=file,id=aws,src=${HOME}/.aws/credentials"
  ]
}
```
@z

@x
This lets you [mount the secret][run_mount_secret] in your Dockerfile.
@y
This lets you [mount the secret][run_mount_secret] in your Dockerfile.
@z

@x
```dockerfile
RUN --mount=type=secret,id=aws,target=/root/.aws/credentials \
    aws cloudfront create-invalidation ...
RUN --mount=type=secret,id=KUBECONFIG \
    KUBECONFIG=$(cat /run/secrets/KUBECONFIG) helm upgrade --install
```
@y
```dockerfile
RUN --mount=type=secret,id=aws,target=/root/.aws/credentials \
    aws cloudfront create-invalidation ...
RUN --mount=type=secret,id=KUBECONFIG \
    KUBECONFIG=$(cat /run/secrets/KUBECONFIG) helm upgrade --install
```
@z

@x
### `target.ssh`
@y
### `target.ssh`
@z

@x
Defines SSH agent sockets or keys to expose to the build.
This is the same as the [`--ssh` flag][ssh].
This can be useful if you need to access private repositories during a build.
@y
Defines SSH agent sockets or keys to expose to the build.
This is the same as the [`--ssh` flag][ssh].
This can be useful if you need to access private repositories during a build.
@z

@x
```hcl
target "default" {
  ssh = ["default"]
}
```
@y
```hcl
target "default" {
  ssh = ["default"]
}
```
@z

@x
```dockerfile
FROM alpine
RUN --mount=type=ssh \
    apk add git openssh-client \
    && install -m 0700 -d ~/.ssh \
    && ssh-keyscan github.com >> ~/.ssh/known_hosts \
    && git clone git@github.com:user/my-private-repo.git
```
@y
```dockerfile
FROM alpine
RUN --mount=type=ssh \
    apk add git openssh-client \
    && install -m 0700 -d ~/.ssh \
    && ssh-keyscan github.com >> ~/.ssh/known_hosts \
    && git clone git@github.com:user/my-private-repo.git
```
@z

@x
### `target.tags`
@y
### `target.tags`
@z

@x
Image names and tags to use for the build target.
This is the same as the [`--tag` flag][tag].
@y
Image names and tags to use for the build target.
This is the same as the [`--tag` flag][tag].
@z

@x
```hcl
target "default" {
  tags = [
    "org/repo:latest",
    "myregistry.azurecr.io/team/image:v1"
  ]
}
```
@y
```hcl
target "default" {
  tags = [
    "org/repo:latest",
    "myregistry.azurecr.io/team/image:v1"
  ]
}
```
@z

@x
### `target.target`
@y
### `target.target`
@z

@x
Set the target build stage to build.
This is the same as the [`--target` flag][target].
@y
Set the target build stage to build.
This is the same as the [`--target` flag][target].
@z

@x
```hcl
target "default" {
  target = "binaries"
}
```
@y
```hcl
target "default" {
  target = "binaries"
}
```
@z

@x
## Group
@y
## Group
@z

@x
Groups allow you to invoke multiple builds (targets) at once.
@y
Groups allow you to invoke multiple builds (targets) at once.
@z

@x
```hcl
group "default" {
  targets = ["db", "webapp-dev"]
}
@y
```hcl
group "default" {
  targets = ["db", "webapp-dev"]
}
@z

@x
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
}
@y
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
}
@z

@x
target "db" {
  dockerfile = "Dockerfile.db"
  tags = ["docker.io/username/db"]
}
```
@y
target "db" {
  dockerfile = "Dockerfile.db"
  tags = ["docker.io/username/db"]
}
```
@z

@x
Groups take precedence over targets, if both exist with the same name.
The following bake file builds the `default` group.
Bake ignores the `default` target.
@y
Groups take precedence over targets, if both exist with the same name.
The following bake file builds the `default` group.
Bake ignores the `default` target.
@z

@x
```hcl
target "default" {
  dockerfile-inline = "FROM ubuntu"
}
@y
```hcl
target "default" {
  dockerfile-inline = "FROM ubuntu"
}
@z

@x
group "default" {
  targets = ["alpine", "debian"]
}
target "alpine" {
  dockerfile-inline = "FROM alpine"
}
target "debian" {
  dockerfile-inline = "FROM debian"
}
```
@y
group "default" {
  targets = ["alpine", "debian"]
}
target "alpine" {
  dockerfile-inline = "FROM alpine"
}
target "debian" {
  dockerfile-inline = "FROM debian"
}
```
@z

@x
## Variable
@y
## Variable
@z

@x
The HCL file format supports variable block definitions.
You can use variables as build arguments in your Dockerfile,
or interpolate them in attribute values in your Bake file.
@y
The HCL file format supports variable block definitions.
You can use variables as build arguments in your Dockerfile,
or interpolate them in attribute values in your Bake file.
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
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:${TAG}"]
}
```
@y
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:${TAG}"]
}
```
@z

@x
You can assign a default value for a variable in the Bake file,
or assign a `null` value to it. If you assign a `null` value,
Buildx uses the default value from the Dockerfile instead.
@y
You can assign a default value for a variable in the Bake file,
or assign a `null` value to it. If you assign a `null` value,
Buildx uses the default value from the Dockerfile instead.
@z

@x
You can override variable defaults set in the Bake file using environment variables.
The following example sets the `TAG` variable to `dev`,
overriding the default `latest` value shown in the previous example.
@y
You can override variable defaults set in the Bake file using environment variables.
The following example sets the `TAG` variable to `dev`,
overriding the default `latest` value shown in the previous example.
@z

@x
```console
$ TAG=dev docker buildx bake webapp-dev
```
@y
```console
$ TAG=dev docker buildx bake webapp-dev
```
@z

@x
### Built-in variables
@y
### Built-in variables
@z

@x
The following variables are built-ins that you can use with Bake without having
to define them.
@y
The following variables are built-ins that you can use with Bake without having
to define them.
@z

@x
| Variable              | Description                                                                         |
| --------------------- | ----------------------------------------------------------------------------------- |
| `BAKE_CMD_CONTEXT`    | Holds the main context when building using a remote Bake file.                      |
| `BAKE_LOCAL_PLATFORM` | Returns the current platform’s default platform specification (e.g. `linux/amd64`). |
@y
| Variable              | Description                                                                         |
| --------------------- | ----------------------------------------------------------------------------------- |
| `BAKE_CMD_CONTEXT`    | Holds the main context when building using a remote Bake file.                      |
| `BAKE_LOCAL_PLATFORM` | Returns the current platform’s default platform specification (e.g. `linux/amd64`). |
@z

@x
### Use environment variable as default
@y
### Use environment variable as default
@z

@x
You can set a Bake variable to use the value of an environment variable as a default value:
@y
You can set a Bake variable to use the value of an environment variable as a default value:
@z

@x
```hcl
variable "HOME" {
  default = "$HOME"
}
```
@y
```hcl
variable "HOME" {
  default = "$HOME"
}
```
@z

@x
### Interpolate variables into attributes
@y
### Interpolate variables into attributes
@z

@x
To interpolate a variable into an attribute string value,
you must use curly brackets.
The following doesn't work:
@y
To interpolate a variable into an attribute string value,
you must use curly brackets.
The following doesn't work:
@z

@x
```hcl
variable "HOME" {
  default = "$HOME"
}
@y
```hcl
variable "HOME" {
  default = "$HOME"
}
@z

@x
target "default" {
  ssh = ["default=$HOME/.ssh/id_rsa"]
}
```
@y
target "default" {
  ssh = ["default=$HOME/.ssh/id_rsa"]
}
```
@z

@x
Wrap the variable in curly brackets where you want to insert it:
@y
Wrap the variable in curly brackets where you want to insert it:
@z

@x
```diff
  variable "HOME" {
    default = "$HOME"
  }
@y
```diff
  variable "HOME" {
    default = "$HOME"
  }
@z

@x
  target "default" {
-   ssh = ["default=$HOME/.ssh/id_rsa"]
+   ssh = ["default=${HOME}/.ssh/id_rsa"]
  }
```
@y
  target "default" {
-   ssh = ["default=$HOME/.ssh/id_rsa"]
+   ssh = ["default=${HOME}/.ssh/id_rsa"]
  }
```
@z

@x
Before you can interpolate a variable into an attribute,
first you must declare it in the bake file,
as demonstrated in the following example.
@y
Before you can interpolate a variable into an attribute,
first you must declare it in the bake file,
as demonstrated in the following example.
@z

@x
```console
$ cat docker-bake.hcl
target "default" {
  dockerfile-inline = "FROM ${BASE_IMAGE}"
}
$ docker buildx bake
[+] Building 0.0s (0/0)
docker-bake.hcl:2
--------------------
   1 |     target "default" {
   2 | >>>   dockerfile-inline = "FROM ${BASE_IMAGE}"
   3 |     }
   4 |
--------------------
ERROR: docker-bake.hcl:2,31-41: Unknown variable; There is no variable named "BASE_IMAGE"., and 1 other diagnostic(s)
$ cat >> docker-bake.hcl
@y
```console
$ cat docker-bake.hcl
target "default" {
  dockerfile-inline = "FROM ${BASE_IMAGE}"
}
$ docker buildx bake
[+] Building 0.0s (0/0)
docker-bake.hcl:2
--------------------
   1 |     target "default" {
   2 | >>>   dockerfile-inline = "FROM ${BASE_IMAGE}"
   3 |     }
   4 |
--------------------
ERROR: docker-bake.hcl:2,31-41: Unknown variable; There is no variable named "BASE_IMAGE"., and 1 other diagnostic(s)
$ cat >> docker-bake.hcl
@z

@x
variable "BASE_IMAGE" {
  default = "alpine"
}
@y
variable "BASE_IMAGE" {
  default = "alpine"
}
@z

@x
$ docker buildx bake
[+] Building 0.6s (5/5) FINISHED
```
@y
$ docker buildx bake
[+] Building 0.6s (5/5) FINISHED
```
@z

@x
## Function
@y
## Function
@z

@x
A [set of general-purpose functions][bake_stdlib]
provided by [go-cty][go-cty]
are available for use in HCL files:
@y
A [set of general-purpose functions][bake_stdlib]
provided by [go-cty][go-cty]
are available for use in HCL files:
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    buildno = "${add(123, 1)}"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    buildno = "${add(123, 1)}"
  }
}
```
@z

@x
In addition, [user defined functions][userfunc]
are also supported:
@y
In addition, [user defined functions][userfunc]
are also supported:
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
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    buildno = "${increment(123)}"
  }
}
```
@y
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    buildno = "${increment(123)}"
  }
}
```
@z

@x
> **Note**
>
> See [User defined HCL functions][hcl-funcs] page for more details.
@y
> **Note**
>
> See [User defined HCL functions][hcl-funcs] page for more details.
@z

@x
<!-- external links -->
@y
<!-- external links -->
@z

@x
[attestations]: https://docs.docker.com/build/attestations/
[bake_stdlib]: https://github.com/docker/buildx/blob/master/bake/hclparser/stdlib.go
[build-arg]: https://docs.docker.com/engine/reference/commandline/build/#build-arg
[build-context]: https://docs.docker.com/engine/reference/commandline/buildx_build/#build-context
[cache-backends]: https://docs.docker.com/build/cache/backends/
[cache-from]: https://docs.docker.com/engine/reference/commandline/buildx_build/#cache-from
[cache-to]: https://docs.docker.com/engine/reference/commandline/buildx_build/#cache-to
[context]: https://docs.docker.com/engine/reference/commandline/buildx_build/#build-context
[file]: https://docs.docker.com/engine/reference/commandline/build/#file
[go-cty]: https://github.com/zclconf/go-cty/tree/main/cty/function/stdlib
[hcl-funcs]: https://docs.docker.com/build/bake/hcl-funcs/
[output]: https://docs.docker.com/engine/reference/commandline/buildx_build/#output
[platform]: https://docs.docker.com/engine/reference/commandline/buildx_build/#platform
[run_mount_secret]: https://docs.docker.com/engine/reference/builder/#run---mounttypesecret
[secret]: https://docs.docker.com/engine/reference/commandline/buildx_build/#secret
[ssh]: https://docs.docker.com/engine/reference/commandline/buildx_build/#ssh
[tag]: https://docs.docker.com/engine/reference/commandline/build/#tag
[target]: https://docs.docker.com/engine/reference/commandline/build/#target
[userfunc]: https://github.com/hashicorp/hcl/tree/main/ext/userfunc
@y
[attestations]: https://docs.docker.com/build/attestations/
[bake_stdlib]: https://github.com/docker/buildx/blob/master/bake/hclparser/stdlib.go
[build-arg]: https://docs.docker.com/engine/reference/commandline/build/#build-arg
[build-context]: https://docs.docker.com/engine/reference/commandline/buildx_build/#build-context
[cache-backends]: https://docs.docker.com/build/cache/backends/
[cache-from]: https://docs.docker.com/engine/reference/commandline/buildx_build/#cache-from
[cache-to]: https://docs.docker.com/engine/reference/commandline/buildx_build/#cache-to
[context]: https://docs.docker.com/engine/reference/commandline/buildx_build/#build-context
[file]: https://docs.docker.com/engine/reference/commandline/build/#file
[go-cty]: https://github.com/zclconf/go-cty/tree/main/cty/function/stdlib
[hcl-funcs]: https://docs.docker.com/build/bake/hcl-funcs/
[output]: https://docs.docker.com/engine/reference/commandline/buildx_build/#output
[platform]: https://docs.docker.com/engine/reference/commandline/buildx_build/#platform
[run_mount_secret]: https://docs.docker.com/engine/reference/builder/#run---mounttypesecret
[secret]: https://docs.docker.com/engine/reference/commandline/buildx_build/#secret
[ssh]: https://docs.docker.com/engine/reference/commandline/buildx_build/#ssh
[tag]: https://docs.docker.com/engine/reference/commandline/build/#tag
[target]: https://docs.docker.com/engine/reference/commandline/build/#target
[userfunc]: https://github.com/hashicorp/hcl/tree/main/ext/userfunc
@z
