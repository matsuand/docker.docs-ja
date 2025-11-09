%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Optimize Docker Offload usage
linktitle: Optimize usage
@y
title: Optimize Docker Offload usage
linktitle: Optimize usage
@z

@x
description: Learn how to optimize your Docker Offload usage.
keywords: cloud, optimize, performance, offload
@y
description: Learn how to optimize your Docker Offload usage.
keywords: cloud, optimize, performance, offload
@z

@x
Docker Offload builds and runs your containers remotely, not on the machine where you invoke the
commands. This means that files must be transferred from your local system to the
cloud over the network.
@y
Docker Offload builds and runs your containers remotely, not on the machine where you invoke the
commands. This means that files must be transferred from your local system to the
cloud over the network.
@z

@x
Transferring files over the network introduces higher latency and lower
bandwidth compared to local transfers.
@y
Transferring files over the network introduces higher latency and lower
bandwidth compared to local transfers.
@z

@x
Even with optimizations, large projects or slower network connections can lead to longer transfer times. Here are
several ways to optimize your setup for Docker Offload:
@y
Even with optimizations, large projects or slower network connections can lead to longer transfer times. Here are
several ways to optimize your setup for Docker Offload:
@z

@x
- [Use `.dockerignore` files](#dockerignore-files)
- [Choose slim base images](#slim-base-images)
- [Use multi-stage builds](#multi-stage-builds)
- [Fetch remote files during the build](#fetch-remote-files-in-build)
- [Leverage multi-threaded tools](#multi-threaded-tools)
@y
- [Use `.dockerignore` files](#dockerignore-files)
- [Choose slim base images](#slim-base-images)
- [Use multi-stage builds](#multi-stage-builds)
- [Fetch remote files during the build](#fetch-remote-files-in-build)
- [Leverage multi-threaded tools](#multi-threaded-tools)
@z

@x
For general Dockerfile tips, see [Building best practices](/manuals/build/building/best-practices.md).
@y
For general Dockerfile tips, see [Building best practices](manuals/build/building/best-practices.md).
@z

@x
## dockerignore files
@y
## dockerignore files
@z

@x
A [`.dockerignore` file](/manuals/build/concepts/context.md#dockerignore-files)
lets you specify which local files should *not* be included in the build
context. Files excluded by these patterns won’t be uploaded to Docker Offload
during a build.
@y
A [`.dockerignore` file](manuals/build/concepts/context.md#dockerignore-files)
lets you specify which local files should *not* be included in the build
context. Files excluded by these patterns won’t be uploaded to Docker Offload
during a build.
@z

@x
Typical items to ignore:
@y
Typical items to ignore:
@z

@x
- `.git` – avoids transferring your version history. (Note: you won’t be able to run `git` commands in the build.)
- Build artifacts or locally generated binaries.
- Dependency folders such as `node_modules`, if those are restored in the build
  process.
@y
- `.git` – avoids transferring your version history. (Note: you won’t be able to run `git` commands in the build.)
- Build artifacts or locally generated binaries.
- Dependency folders such as `node_modules`, if those are restored in the build
  process.
@z

@x
As a rule of thumb, your `.dockerignore` should be similar to your `.gitignore`.
@y
As a rule of thumb, your `.dockerignore` should be similar to your `.gitignore`.
@z

@x
## Slim base images
@y
## Slim base images
@z

@x
Smaller base images in your `FROM` instructions can reduce final image size and
improve build performance. The [`alpine`](https://hub.docker.com/_/alpine) image
is a good example of a minimal base.
@y
Smaller base images in your `FROM` instructions can reduce final image size and
improve build performance. The [`alpine`](https://hub.docker.com/_/alpine) image
is a good example of a minimal base.
@z

@x
For fully static binaries, you can use [`scratch`](https://hub.docker.com/_/scratch), which is an empty base image.
@y
For fully static binaries, you can use [`scratch`](https://hub.docker.com/_/scratch), which is an empty base image.
@z

@x
## Multi-stage builds
@y
## Multi-stage builds
@z

@x
[Multi-stage builds](/build/building/multi-stage/) let you separate build-time
and runtime environments in your Dockerfile. This not only reduces the size of
the final image but also allows for parallel stage execution during the build.
@y
[Multi-stage builds](__SUBDIR__/build/building/multi-stage/) let you separate build-time
and runtime environments in your Dockerfile. This not only reduces the size of
the final image but also allows for parallel stage execution during the build.
@z

@x
Use `COPY --from` to copy files from earlier stages or external images. This
approach helps minimize unnecessary layers and reduce final image size.
@y
Use `COPY --from` to copy files from earlier stages or external images. This
approach helps minimize unnecessary layers and reduce final image size.
@z

@x
## Fetch remote files in build
@y
## Fetch remote files in build
@z

@x
When possible, download large files from the internet during the build itself
instead of bundling them in your local context. This avoids network transfer
from your client to Docker Offload.
@y
When possible, download large files from the internet during the build itself
instead of bundling them in your local context. This avoids network transfer
from your client to Docker Offload.
@z

@x
You can do this using:
@y
You can do this using:
@z

@x
- The Dockerfile [`ADD` instruction](/reference/dockerfile/#add)
- `RUN` commands like `wget`, `curl`, or `rsync`
@y
- The Dockerfile [`ADD` instruction](__SUBDIR__/reference/dockerfile/#add)
- `RUN` commands like `wget`, `curl`, or `rsync`
@z

@x
### Multi-threaded tools
@y
### Multi-threaded tools
@z

@x
Some build tools, such as `make`, are single-threaded by default. If the tool
supports it, configure it to run in parallel. For example, use `make --jobs=4`
to run four jobs simultaneously.
@y
Some build tools, such as `make`, are single-threaded by default. If the tool
supports it, configure it to run in parallel. For example, use `make --jobs=4`
to run four jobs simultaneously.
@z

@x
Taking advantage of available CPU resources in the cloud can significantly
improve build time.
@y
Taking advantage of available CPU resources in the cloud can significantly
improve build time.
@z
