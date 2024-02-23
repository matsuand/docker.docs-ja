%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Custom Dockerfile syntax
description: Dive deep into the Dockerfile frontend, and learn about custom frontends
keywords: build, buildkit, dockerfile, frontend
aliases:
  - /build/buildkit/dockerfile-frontend/
---
@y
---
title: Custom Dockerfile syntax
description: Dive deep into the Dockerfile frontend, and learn about custom frontends
keywords: build, buildkit, dockerfile, frontend
aliases:
  - /build/buildkit/dockerfile-frontend/
---
@z

@x
## Dockerfile frontend
@y
## Dockerfile frontend
@z

@x
BuildKit supports loading frontends dynamically from container images. To use
an external Dockerfile frontend, the first line of your [Dockerfile](../../reference/dockerfile.md)
needs to set the [`syntax` directive](../../reference/dockerfile.md#syntax)
pointing to the specific image you want to use:
@y
BuildKit supports loading frontends dynamically from container images. To use
an external Dockerfile frontend, the first line of your [Dockerfile](../../reference/dockerfile.md)
needs to set the [`syntax` directive](../../reference/dockerfile.md#syntax)
pointing to the specific image you want to use:
@z

@x
```dockerfile
# syntax=[remote image reference]
```
@y
```dockerfile
# syntax=[remote image reference]
```
@z

@x
For example:
@y
For example:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
# syntax=docker.io/docker/dockerfile:1
# syntax=example.com/user/repo:tag@sha256:abcdef...
```
@y
```dockerfile
# syntax=docker/dockerfile:1
# syntax=docker.io/docker/dockerfile:1
# syntax=example.com/user/repo:tag@sha256:abcdef...
```
@z

@x
This defines the location of the Dockerfile syntax that is used to build the
Dockerfile. The BuildKit backend allows seamlessly using external
implementations that are distributed as Docker images and execute inside a
container sandbox environment.
@y
This defines the location of the Dockerfile syntax that is used to build the
Dockerfile. The BuildKit backend allows seamlessly using external
implementations that are distributed as Docker images and execute inside a
container sandbox environment.
@z

@x
Custom Dockerfile implementations allow you to:
@y
Custom Dockerfile implementations allow you to:
@z

@x
- Automatically get bugfixes without updating the Docker daemon
- Make sure all users are using the same implementation to build your Dockerfile
- Use the latest features without updating the Docker daemon
- Try out new features or third-party features before they are integrated in the Docker daemon
- Use [alternative build definitions, or create your own](https://github.com/moby/buildkit#exploring-llb)
@y
- Automatically get bugfixes without updating the Docker daemon
- Make sure all users are using the same implementation to build your Dockerfile
- Use the latest features without updating the Docker daemon
- Try out new features or third-party features before they are integrated in the Docker daemon
- Use [alternative build definitions, or create your own](https://github.com/moby/buildkit#exploring-llb)
@z

@x
> **Note**
>
> BuildKit also ships with a built-in Dockerfile frontend, but it's recommended
> to use an external image to make sure that all users use the same version on
> the builder and to pick up bugfixes automatically without waiting for a new
> version of BuildKit or Docker Engine.
@y
> **Note**
>
> BuildKit also ships with a built-in Dockerfile frontend, but it's recommended
> to use an external image to make sure that all users use the same version on
> the builder and to pick up bugfixes automatically without waiting for a new
> version of BuildKit or Docker Engine.
@z

@x
## Official releases
@y
## Official releases
@z

@x
Docker distributes official versions of the images that can be used for building
Dockerfiles under `docker/dockerfile` repository on Docker Hub. There are two
channels where new images are released: `stable` and `labs`.
@y
Docker distributes official versions of the images that can be used for building
Dockerfiles under `docker/dockerfile` repository on Docker Hub. There are two
channels where new images are released: `stable` and `labs`.
@z

@x
### Stable channel
@y
### Stable channel
@z

@x
The `stable` channel follows [semantic versioning](https://semver.org).
For example:
@y
The `stable` channel follows [semantic versioning](https://semver.org).
For example:
@z

@x
- `docker/dockerfile:1` - kept updated with the latest `1.x.x` minor _and_ patch
  release.
- `docker/dockerfile:1.2` - kept updated with the latest `1.2.x` patch release,
  and stops receiving updates once version `1.3.0` is released.
- `docker/dockerfile:1.2.1` - immutable: never updated.
@y
- `docker/dockerfile:1` - kept updated with the latest `1.x.x` minor _and_ patch
  release.
- `docker/dockerfile:1.2` - kept updated with the latest `1.2.x` patch release,
  and stops receiving updates once version `1.3.0` is released.
- `docker/dockerfile:1.2.1` - immutable: never updated.
@z

@x
We recommend using `docker/dockerfile:1`, which always points to the latest
stable release of the version 1 syntax, and receives both "minor" and "patch"
updates for the version 1 release cycle. BuildKit automatically checks for
updates of the syntax when performing a build, making sure you are using the
most current version.
@y
We recommend using `docker/dockerfile:1`, which always points to the latest
stable release of the version 1 syntax, and receives both "minor" and "patch"
updates for the version 1 release cycle. BuildKit automatically checks for
updates of the syntax when performing a build, making sure you are using the
most current version.
@z

@x
If a specific version is used, such as `1.2` or `1.2.1`, the Dockerfile needs
to be updated manually to continue receiving bugfixes and new features. Old
versions of the Dockerfile remain compatible with the new versions of the
builder.
@y
If a specific version is used, such as `1.2` or `1.2.1`, the Dockerfile needs
to be updated manually to continue receiving bugfixes and new features. Old
versions of the Dockerfile remain compatible with the new versions of the
builder.
@z

@x
### Labs channel
@y
### Labs channel
@z

@x
The `labs` channel provides early access to Dockerfile features that are not yet
available in the `stable` channel. `labs` images are released at the same time
as stable releases, and follow the same version pattern, but use the `-labs`
suffix, for example:
@y
The `labs` channel provides early access to Dockerfile features that are not yet
available in the `stable` channel. `labs` images are released at the same time
as stable releases, and follow the same version pattern, but use the `-labs`
suffix, for example:
@z

@x
- `docker/dockerfile:labs` - latest release on `labs` channel.
- `docker/dockerfile:1-labs` - same as `dockerfile:1`, with experimental
  features enabled.
- `docker/dockerfile:1.2-labs` - same as `dockerfile:1.2`, with experimental
  features enabled.
- `docker/dockerfile:1.2.1-labs` - immutable: never updated. Same as
  `dockerfile:1.2.1`, with experimental features enabled.
@y
- `docker/dockerfile:labs` - latest release on `labs` channel.
- `docker/dockerfile:1-labs` - same as `dockerfile:1`, with experimental
  features enabled.
- `docker/dockerfile:1.2-labs` - same as `dockerfile:1.2`, with experimental
  features enabled.
- `docker/dockerfile:1.2.1-labs` - immutable: never updated. Same as
  `dockerfile:1.2.1`, with experimental features enabled.
@z

@x
Choose a channel that best fits your needs. If you want to benefit from
new features, use the `labs` channel. Images in the `labs` channel contain
all the features in the `stable` channel, plus early access features.
Stable features in the `labs` channel follow [semantic versioning](https://semver.org),
but early access features don't, and newer releases may not be backwards
compatible. Pin the version to avoid having to deal with breaking changes.
@y
Choose a channel that best fits your needs. If you want to benefit from
new features, use the `labs` channel. Images in the `labs` channel contain
all the features in the `stable` channel, plus early access features.
Stable features in the `labs` channel follow [semantic versioning](https://semver.org),
but early access features don't, and newer releases may not be backwards
compatible. Pin the version to avoid having to deal with breaking changes.
@z

@x
## Other resources
@y
## Other resources
@z

@x
For documentation on `labs` features, master builds, and nightly feature
releases, refer to the description in [the BuildKit source repository on GitHub](https://github.com/moby/buildkit/blob/master/README.md).
For a full list of available images, visit the [`docker/dockerfile` repository on Docker Hub](https://hub.docker.com/r/docker/dockerfile),
and the [`docker/dockerfile-upstream` repository on Docker Hub](https://hub.docker.com/r/docker/dockerfile-upstream)
for development builds.
@y
For documentation on `labs` features, master builds, and nightly feature
releases, refer to the description in [the BuildKit source repository on GitHub](https://github.com/moby/buildkit/blob/master/README.md).
For a full list of available images, visit the [`docker/dockerfile` repository on Docker Hub](https://hub.docker.com/r/docker/dockerfile),
and the [`docker/dockerfile-upstream` repository on Docker Hub](https://hub.docker.com/r/docker/dockerfile-upstream)
for development builds.
@z
