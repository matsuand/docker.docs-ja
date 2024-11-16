%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Building Compose projects with Bake
description: Learn how to build Docker Compose projects with Docker Buildx Bake
summary: |
  This guide demonstrates how you can use Bake to build production-grade images for Docker Compose projects.
@y
title: Building Compose projects with Bake
description: Learn how to build Docker Compose projects with Docker Buildx Bake
summary: |
  This guide demonstrates how you can use Bake to build production-grade images for Docker Compose projects.
@z

@x
tags: [devops]
@y
tags: [devops]
@z

% params:
@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
This guide explores how you can use Bake to build images for Docker Compose
projects with multiple services.
@y
This guide explores how you can use Bake to build images for Docker Compose
projects with multiple services.
@z

@x
[Docker Buildx Bake](/manuals/build/bake/_index.md) is a build orchestration
tool that enables declarative configuration for your builds, much like Docker
Compose does for defining runtime stacks. For projects where Docker Compose is
used to spin up services for local development, Bake offers a way of seamlessly
extending the project with a production-ready build configuration.
@y
[Docker Buildx Bake](manuals/build/bake/_index.md) is a build orchestration
tool that enables declarative configuration for your builds, much like Docker
Compose does for defining runtime stacks. For projects where Docker Compose is
used to spin up services for local development, Bake offers a way of seamlessly
extending the project with a production-ready build configuration.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
This guide assumes that you're familiar with
@y
This guide assumes that you're familiar with
@z

@x
- Docker Compose
- [Multi-stage builds](/manuals/build/building/multi-stage.md)
- [Multi-platform builds](/manuals/build/building/multi-platform.md)
@y
- Docker Compose
- [Multi-stage builds](manuals/build/building/multi-stage.md)
- [Multi-platform builds](manuals/build/building/multi-platform.md)
@z

@x
## Orientation
@y
## Orientation
@z

@x
This guide will use the
[dvdksn/example-voting-app](https://github.com/dvdksn/example-voting-app)
repository as an example of a monorepo using Docker Compose that can be
extended with Bake.
@y
This guide will use the
[dvdksn/example-voting-app](https://github.com/dvdksn/example-voting-app)
repository as an example of a monorepo using Docker Compose that can be
extended with Bake.
@z

@x
```console
$ git clone https://github.com/dvdksn/example-voting-app.git
$ cd example-voting-app
```
@y
```console
$ git clone https://github.com/dvdksn/example-voting-app.git
$ cd example-voting-app
```
@z

@x
This repository uses Docker Compose to define the runtime configurations for
running the application, in the `compose.yaml` file. This app consists of the
following services:
@y
This repository uses Docker Compose to define the runtime configurations for
running the application, in the `compose.yaml` file. This app consists of the
following services:
@z

@x
| Service  | Description                                                            |
| -------- | ---------------------------------------------------------------------- |
| `vote`   | A front-end web app in Python which lets you vote between two options. |
| `result` | A Node.js web app which shows the results of the voting in real time.  |
| `worker` | A .NET worker which consumes votes and stores them in the database.    |
| `db`     | A Postgres database backed by a Docker volume.                         |
| `redis`  | A Redis instance which collects new votes.                             |
| `seed`   | A utility container that seeds the database with mock data.            |
@y
| Service  | Description                                                            |
| -------- | ---------------------------------------------------------------------- |
| `vote`   | A front-end web app in Python which lets you vote between two options. |
| `result` | A Node.js web app which shows the results of the voting in real time.  |
| `worker` | A .NET worker which consumes votes and stores them in the database.    |
| `db`     | A Postgres database backed by a Docker volume.                         |
| `redis`  | A Redis instance which collects new votes.                             |
| `seed`   | A utility container that seeds the database with mock data.            |
@z

@x
The `vote`, `result`, and `worker` services are built from code in this
repository, whereas `db` and `redis` use pre-existing Postgres and Redis images
from Docker Hub. The `seed` service is a utility that invokes requests against
the front-end service to populate the database, for testing purposes.
@y
The `vote`, `result`, and `worker` services are built from code in this
repository, whereas `db` and `redis` use pre-existing Postgres and Redis images
from Docker Hub. The `seed` service is a utility that invokes requests against
the front-end service to populate the database, for testing purposes.
@z

@x
## Build with Compose
@y
## Build with Compose
@z

@x
When you spin up a Docker Compose project, any services that define the `build`
property are automatically built before the service is started. Here's the
build configuration for the `vote` service in the example repository:
@y
When you spin up a Docker Compose project, any services that define the `build`
property are automatically built before the service is started. Here's the
build configuration for the `vote` service in the example repository:
@z

@x
```yaml {title="compose.yaml"}
services:
  vote:
    build:
      context: ./vote # Build context
      target: dev # Dockerfile stage
```
@y
```yaml {title="compose.yaml"}
services:
  vote:
    build:
      context: ./vote # Build context
      target: dev # Dockerfile stage
```
@z

@x
The `vote`, `result`, and `worker` services all have a build configuration
specified. Running `docker compose up` will trigger a build of these services.
@y
The `vote`, `result`, and `worker` services all have a build configuration
specified. Running `docker compose up` will trigger a build of these services.
@z

@x
Did you know that you can also use Compose just to build the service images?
The `docker compose build` command lets you invoke a build using the build
configuration specified in the Compose file. For example, to build the `vote`
service with this configuration, run:
@y
Did you know that you can also use Compose just to build the service images?
The `docker compose build` command lets you invoke a build using the build
configuration specified in the Compose file. For example, to build the `vote`
service with this configuration, run:
@z

@x
```console
$ docker compose build vote
```
@y
```console
$ docker compose build vote
```
@z

@x
Omit the service name to build all services at once:
@y
Omit the service name to build all services at once:
@z

@x
```console
$ docker compose build
```
@y
```console
$ docker compose build
```
@z

@x
The `docker compose build` command is useful when you only need to build images
without running services.
@y
The `docker compose build` command is useful when you only need to build images
without running services.
@z

@x
The Compose file format supports a number of properties for defining your
build's configuration. For example, to specify the tag name for the images, set
the `image` property on the service.
@y
The Compose file format supports a number of properties for defining your
build's configuration. For example, to specify the tag name for the images, set
the `image` property on the service.
@z

@x
```yaml
services:
  vote:
    image: username/vote
    build:
      context: ./vote
      target: dev
    #...
@y
```yaml
services:
  vote:
    image: username/vote
    build:
      context: ./vote
      target: dev
    #...
@z

@x
  result:
    image: username/result
    build:
      context: ./result
    #...
@y
  result:
    image: username/result
    build:
      context: ./result
    #...
@z

@x
  worker:
    image: username/worker
    build:
      context: ./worker
    #...
```
@y
  worker:
    image: username/worker
    build:
      context: ./worker
    #...
```
@z

@x
Running `docker compose build` creates three service images with fully
qualified image names that you can push to Docker Hub.
@y
Running `docker compose build` creates three service images with fully
qualified image names that you can push to Docker Hub.
@z

@x
The `build` property supports a [wide range](/reference/compose-file/build.md)
of options for configuring builds. However, building production-grade images
are often different from images used in local development. To avoid cluttering
your Compose file with build configurations that might not be desirable for
local builds, consider separating the production builds from the local builds
by using Bake to build images for release. This approach separates concerns:
using Compose for local development and Bake for production-ready builds, while
still reusing service definitions and fundamental build configurations.
@y
The `build` property supports a [wide range](reference/compose-file/build.md)
of options for configuring builds. However, building production-grade images
are often different from images used in local development. To avoid cluttering
your Compose file with build configurations that might not be desirable for
local builds, consider separating the production builds from the local builds
by using Bake to build images for release. This approach separates concerns:
using Compose for local development and Bake for production-ready builds, while
still reusing service definitions and fundamental build configurations.
@z

@x
## Build with Bake
@y
## Build with Bake
@z

@x
Like Compose, Bake parses the build definition for a project from a
configuration file. Bake supports HashiCorp Configuration Language (HCL), JSON,
and the Docker Compose YAML format. When you use Bake with multiple files, it
will find and merge all of the applicable configuration files into one unified
build configuration. The build options defined in your Compose file are
extended, or in some cases overridden, by options specified in the Bake file.
@y
Like Compose, Bake parses the build definition for a project from a
configuration file. Bake supports HashiCorp Configuration Language (HCL), JSON,
and the Docker Compose YAML format. When you use Bake with multiple files, it
will find and merge all of the applicable configuration files into one unified
build configuration. The build options defined in your Compose file are
extended, or in some cases overridden, by options specified in the Bake file.
@z

@x
The following section explores how you can use Bake to extend the build options
defined in your Compose file for production.
@y
The following section explores how you can use Bake to extend the build options
defined in your Compose file for production.
@z

@x
### View the build configuration
@y
### View the build configuration
@z

@x
Bake automatically creates a build configuration from the `build` properties of
your services. Use the `--print` flag for Bake to view the build configuration
for a given Compose file. This flag evaluates the build configuration and
outputs the build definition in JSON format.
@y
Bake automatically creates a build configuration from the `build` properties of
your services. Use the `--print` flag for Bake to view the build configuration
for a given Compose file. This flag evaluates the build configuration and
outputs the build definition in JSON format.
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
The JSON-formatted output shows the group that would be executed, and all the
targets of that group. A group is a collection of builds, and a target
represents a single build.
@y
The JSON-formatted output shows the group that would be executed, and all the
targets of that group. A group is a collection of builds, and a target
represents a single build.
@z

@x
```json
{
  "group": {
    "default": {
      "targets": [
        "vote",
        "result",
        "worker",
        "seed"
      ]
    }
  },
  "target": {
    "result": {
      "context": "result",
      "dockerfile": "Dockerfile",
      "network": ""
    },
    "seed": {
      "context": "seed-data",
      "dockerfile": "Dockerfile",
      "network": ""
    },
    "vote": {
      "context": "vote",
      "dockerfile": "Dockerfile",
      "target": "dev",
      "network": ""
    },
    "worker": {
      "context": "worker",
      "dockerfile": "Dockerfile",
      "network": ""
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
        "vote",
        "result",
        "worker",
        "seed"
      ]
    }
  },
  "target": {
    "result": {
      "context": "result",
      "dockerfile": "Dockerfile",
      "network": ""
    },
    "seed": {
      "context": "seed-data",
      "dockerfile": "Dockerfile",
      "network": ""
    },
    "vote": {
      "context": "vote",
      "dockerfile": "Dockerfile",
      "target": "dev",
      "network": ""
    },
    "worker": {
      "context": "worker",
      "dockerfile": "Dockerfile",
      "network": ""
    }
  }
}
```
@z

@x
As you can see, Bake has created a `default` group that includes four targets:
@y
As you can see, Bake has created a `default` group that includes four targets:
@z

@x
- `seed`
- `vote`
- `result`
- `worker`
@y
- `seed`
- `vote`
- `result`
- `worker`
@z

@x
This group is created automatically from your Compose file; it includes all of
your services containing a build configuration. To build this group of services
with Bake, run:
@y
This group is created automatically from your Compose file; it includes all of
your services containing a build configuration. To build this group of services
with Bake, run:
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
### Customize the build group
@y
### Customize the build group
@z

@x
Start by redefining the default build group that Bake executes. The current
default group includes a `seed` target — a Compose service used solely to
populate the database with mock data. Since this target doesn't produce a
production image, it doesn’t need to be included in the build group.
@y
Start by redefining the default build group that Bake executes. The current
default group includes a `seed` target — a Compose service used solely to
populate the database with mock data. Since this target doesn't produce a
production image, it doesn’t need to be included in the build group.
@z

@x
To customize the build configuration that Bake uses, create a new file at the
root of the repository, alongside your `compose.yaml` file, named
`docker-bake.hcl`.
@y
To customize the build configuration that Bake uses, create a new file at the
root of the repository, alongside your `compose.yaml` file, named
`docker-bake.hcl`.
@z

@x
```console
$ touch docker-bake.hcl
```
@y
```console
$ touch docker-bake.hcl
```
@z

@x
Open the Bake file and add the following configuration:
@y
Open the Bake file and add the following configuration:
@z

@x
```hcl {title=docker-bake.hcl}
group "default" {
  targets = ["vote", "result", "worker"]
}
```
@y
```hcl {title=docker-bake.hcl}
group "default" {
  targets = ["vote", "result", "worker"]
}
```
@z

@x
Save the file and print your Bake definition again.
@y
Save the file and print your Bake definition again.
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
The JSON output shows that the `default` group only includes the targets you
care about.
@y
The JSON output shows that the `default` group only includes the targets you
care about.
@z

@x
```json
{
  "group": {
    "default": {
      "targets": ["vote", "result", "worker"]
    }
  },
  "target": {
    "result": {
      "context": "result",
      "dockerfile": "Dockerfile",
      "tags": ["username/result"]
    },
    "vote": {
      "context": "vote",
      "dockerfile": "Dockerfile",
      "tags": ["username/vote"],
      "target": "dev"
    },
    "worker": {
      "context": "worker",
      "dockerfile": "Dockerfile",
      "tags": ["username/worker"]
    }
  }
}
```
@y
```json
{
  "group": {
    "default": {
      "targets": ["vote", "result", "worker"]
    }
  },
  "target": {
    "result": {
      "context": "result",
      "dockerfile": "Dockerfile",
      "tags": ["username/result"]
    },
    "vote": {
      "context": "vote",
      "dockerfile": "Dockerfile",
      "tags": ["username/vote"],
      "target": "dev"
    },
    "worker": {
      "context": "worker",
      "dockerfile": "Dockerfile",
      "tags": ["username/worker"]
    }
  }
}
```
@z

@x
Here, the build configuration for each target (context, tags, etc.) is picked
up from the `compose.yaml` file. The group is defined by the `docker-bake.hcl`
file.
@y
Here, the build configuration for each target (context, tags, etc.) is picked
up from the `compose.yaml` file. The group is defined by the `docker-bake.hcl`
file.
@z

@x
### Customize targets
@y
### Customize targets
@z

@x
The Compose file currently defines the `dev` stage as the build target for the
`vote` service. That's appropriate for the image that you would run in local
development, because the `dev` stage includes additional development
dependencies and configurations. For the production image, however, you'll want
to target the `final` image instead.
@y
The Compose file currently defines the `dev` stage as the build target for the
`vote` service. That's appropriate for the image that you would run in local
development, because the `dev` stage includes additional development
dependencies and configurations. For the production image, however, you'll want
to target the `final` image instead.
@z

@x
To modify the target stage used by the `vote` service, add the following
configuration to the Bake file:
@y
To modify the target stage used by the `vote` service, add the following
configuration to the Bake file:
@z

@x
```hcl
target "vote" {
  target = "final"
}
```
@y
```hcl
target "vote" {
  target = "final"
}
```
@z

@x
This overrides the `target` property specified in the Compose file with a
different value when you run the build with Bake. The other build options in
the Compose file (tag, context) remain unmodified. You can verify by inspecting
the build configuration for the `vote` target with `docker buildx bake --print
vote`:
@y
This overrides the `target` property specified in the Compose file with a
different value when you run the build with Bake. The other build options in
the Compose file (tag, context) remain unmodified. You can verify by inspecting
the build configuration for the `vote` target with `docker buildx bake --print
vote`:
@z

@x
```json
{
  "group": {
    "default": {
      "targets": ["vote"]
    }
  },
  "target": {
    "vote": {
      "context": "vote",
      "dockerfile": "Dockerfile",
      "tags": ["username/vote"],
      "target": "final"
    }
  }
}
```
@y
```json
{
  "group": {
    "default": {
      "targets": ["vote"]
    }
  },
  "target": {
    "vote": {
      "context": "vote",
      "dockerfile": "Dockerfile",
      "tags": ["username/vote"],
      "target": "final"
    }
  }
}
```
@z

@x
### Additional build features
@y
### Additional build features
@z

@x
Production-grade builds often have different characteristics from development
builds. Here are a few examples of things you might want to add for production
images.
@y
Production-grade builds often have different characteristics from development
builds. Here are a few examples of things you might want to add for production
images.
@z

@x
Multi-platform
: For local development, you only need to build images for your local platform,
since those images are just going to run on your machine. But for images that
are pushed to a registry, it's often a good idea to build for multiple
platforms, arm64 and amd64 in particular.
@y
Multi-platform
: For local development, you only need to build images for your local platform,
since those images are just going to run on your machine. But for images that
are pushed to a registry, it's often a good idea to build for multiple
platforms, arm64 and amd64 in particular.
@z

@x
Attestations
: [Attestations](/manuals/build/metadata/attestations/_index.md) are manifests
attached to the image that describe how the image was created and what
components it contains. Attaching attestations to your images helps ensure that
your images follow software supply chain best practices.
@y
Attestations
: [Attestations](manuals/build/metadata/attestations/_index.md) are manifests
attached to the image that describe how the image was created and what
components it contains. Attaching attestations to your images helps ensure that
your images follow software supply chain best practices.
@z

@x
Annotations
: [Annotations](/manuals/build/metadata/annotations.md) provide descriptive
metadata for images. Use annotations to record arbitrary information and attach
it to your image, which helps consumers and tools understand the origin,
contents, and how to use the image.
@y
Annotations
: [Annotations](manuals/build/metadata/annotations.md) provide descriptive
metadata for images. Use annotations to record arbitrary information and attach
it to your image, which helps consumers and tools understand the origin,
contents, and how to use the image.
@z

@x
> [!TIP]
> Why not just define these additional build options in the Compose file
> directly?
>
> The `build` property in the Compose file format does not support all build
> features. Additionally, some features, like multi-platform builds, can
> drastically increase the time it takes to build a service. For local
> development, you're better off keeping your build step simple and fast,
> saving the bells and whistles for release builds.
@y
> [!TIP]
> Why not just define these additional build options in the Compose file
> directly?
>
> The `build` property in the Compose file format does not support all build
> features. Additionally, some features, like multi-platform builds, can
> drastically increase the time it takes to build a service. For local
> development, you're better off keeping your build step simple and fast,
> saving the bells and whistles for release builds.
@z

@x
To add these properties to the images you build with Bake, update the Bake file
as follows:
@y
To add these properties to the images you build with Bake, update the Bake file
as follows:
@z

@x
```hcl
group "default" {
  targets = ["vote", "result", "worker"]
}
@y
```hcl
group "default" {
  targets = ["vote", "result", "worker"]
}
@z

@x
target "_common" {
  annotations = ["org.opencontainers.image.authors=username"]
  platforms = ["linux/amd64", "linux/arm64"]
  attest = [
    "type=provenance,mode=max",
    "type=sbom"
  ]
}
@y
target "_common" {
  annotations = ["org.opencontainers.image.authors=username"]
  platforms = ["linux/amd64", "linux/arm64"]
  attest = [
    "type=provenance,mode=max",
    "type=sbom"
  ]
}
@z

@x
target "vote" {
  inherits = ["_common"]
  target = "final"
}
@y
target "vote" {
  inherits = ["_common"]
  target = "final"
}
@z

@x
target "result" {
  inherits = ["_common"]
}
@y
target "result" {
  inherits = ["_common"]
}
@z

@x
target "worker" {
  inherits = ["_common"]
}
```
@y
target "worker" {
  inherits = ["_common"]
}
```
@z

@x
This defines a new `_common` target that defines reusable build configuration
for adding multi-platform support, annotations, and attestations to your
images. The reusable target is inherited by the build targets.
@y
This defines a new `_common` target that defines reusable build configuration
for adding multi-platform support, annotations, and attestations to your
images. The reusable target is inherited by the build targets.
@z

@x
With these changes, building the project with Bake produces three sets of
multi-platform images for the `linux/amd64` and `linux/arm64` architectures.
Each image is decorated with an author annotation, and both SBOM and provenance
attestation records.
@y
With these changes, building the project with Bake produces three sets of
multi-platform images for the `linux/amd64` and `linux/arm64` architectures.
Each image is decorated with an author annotation, and both SBOM and provenance
attestation records.
@z

@x
## Conclusions
@y
## Conclusions
@z

@x
The pattern demonstrated in this guide provides a useful approach for managing
production-ready Docker images in projects using Docker Compose. Using Bake
gives you access to all the powerful features of Buildx and BuildKit, and also
helps separate your development and build configuration in a reasonable way.
@y
The pattern demonstrated in this guide provides a useful approach for managing
production-ready Docker images in projects using Docker Compose. Using Bake
gives you access to all the powerful features of Buildx and BuildKit, and also
helps separate your development and build configuration in a reasonable way.
@z

@x
### Further reading
@y
### Further reading
@z

@x
For more information about how to use Bake, check out these resources:
@y
For more information about how to use Bake, check out these resources:
@z

@x
- [Bake documentation](/manuals/build/bake/_index.md)
- [Building with Bake from a Compose file](/manuals/build/bake/compose-file.md)
- [Bake file reference](/manuals/build/bake/reference.md)
- [Mastering multi-platform builds, testing, and more with Docker Buildx Bake](/guides/bake/index.md)
- [Bake GitHub Action](https://github.com/docker/bake-action)
@y
- [Bake documentation](manuals/build/bake/_index.md)
- [Building with Bake from a Compose file](manuals/build/bake/compose-file.md)
- [Bake file reference](manuals/build/bake/reference.md)
- [Mastering multi-platform builds, testing, and more with Docker Buildx Bake](guides/bake/index.md)
- [Bake GitHub Action](https://github.com/docker/bake-action)
@z
