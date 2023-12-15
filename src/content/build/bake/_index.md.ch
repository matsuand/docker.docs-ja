%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: High-level builds with Bake
keywords: build, buildx, bake, buildkit, hcl, json, compose
aliases:
  - /build/customize/bake/
---
@y
---
title: High-level builds with Bake
keywords: build, buildx, bake, buildkit, hcl, json, compose
aliases:
  - /build/customize/bake/
---
@z

@x
> **Experimental**
>
> Bake is an experimental feature, and we are looking for
> [feedback from users](https://github.com/docker/buildx/issues).
{ .experimental }
@y
> **Experimental**
>
> Bake is an experimental feature, and we are looking for
> [feedback from users](https://github.com/docker/buildx/issues).
{ .experimental }
@z

@x
Buildx provides support for high-level build orchestration that goes beyond
invoking a single build command. Bake lets you build all the images in your
application together. You can define all of the build jobs for your projects in
a file that can then be easily invoked by anyone.
@y
Buildx provides support for high-level build orchestration that goes beyond
invoking a single build command. Bake lets you build all the images in your
application together. You can define all of the build jobs for your projects in
a file that can then be easily invoked by anyone.
@z

@x
You can think of Bake as a task runner for Docker builds.
[BuildKit](https://github.com/moby/buildkit) efficiently handles multiple
concurrent build requests and de-duplicating work. You can invoke your builds
using general-purpose task runners, like `make`. However, such tools generally
invoke builds in a sequence. Therefore they aren't leveraging the full
potential of BuildKit parallelization. Bake solves this problem.
@y
You can think of Bake as a task runner for Docker builds.
[BuildKit](https://github.com/moby/buildkit) efficiently handles multiple
concurrent build requests and de-duplicating work. You can invoke your builds
using general-purpose task runners, like `make`. However, such tools generally
invoke builds in a sequence. Therefore they aren't leveraging the full
potential of BuildKit parallelization. Bake solves this problem.
@z

@x
The `docker buildx bake` command supports building images from a configuration
file in HCL, JSON or YAML format. The YAML format extends the Compose
Specification, and it's similar to `docker compose build`, except it builds all
of your services concurrently as part of a single request.
@y
The `docker buildx bake` command supports building images from a configuration
file in HCL, JSON or YAML format. The YAML format extends the Compose
Specification, and it's similar to `docker compose build`, except it builds all
of your services concurrently as part of a single request.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Bake file reference](./reference.md)
- [Configuring builds](./configuring-build.md)
- [User defined HCL functions](./advanced.md)
- [Defining additional build contexts and linking targets](./build-contexts.md)
- [Building from Compose file](./compose-file.md)
@y
- [Bake file reference](./reference.md)
- [Configuring builds](./configuring-build.md)
- [User defined HCL functions](./advanced.md)
- [Defining additional build contexts and linking targets](./build-contexts.md)
- [Building from Compose file](./compose-file.md)
@z
