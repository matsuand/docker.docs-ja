%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
---
title: Optimize for building in the cloud
description: Building remotely is different from building locally. Here's how to optimize for remote builders.
keywords: build, cloud build, optimize, remote, local, cloud
aliases:
  - /hydrobuild/optimization/
---
@y
---
title: Optimize for building in the cloud
description: Building remotely is different from building locally. Here's how to optimize for remote builders.
keywords: build, cloud build, optimize, remote, local, cloud
aliases:
  - /hydrobuild/optimization/
---
@z

@x
Docker Build Cloud runs your builds remotely, and not on the machine where you
invoke the build. This means that file transfers between the client and builder
happen over the network.
@y
Docker Build Cloud runs your builds remotely, and not on the machine where you
invoke the build. This means that file transfers between the client and builder
happen over the network.
@z

@x
Transferring files over the network has a higher latency and lower bandwidth
than local transfers. Docker Build Cloud has several features to mitigate this:
@y
Transferring files over the network has a higher latency and lower bandwidth
than local transfers. Docker Build Cloud has several features to mitigate this:
@z

@x
- It uses attached storage volumes for build cache, which makes reading and
  writing cache very fast.
- Loading build results back to the client only pulls the layers that were
  changed compared to previous builds.
@y
- It uses attached storage volumes for build cache, which makes reading and
  writing cache very fast.
- Loading build results back to the client only pulls the layers that were
  changed compared to previous builds.
@z

@x
Despite these optimizations, building remotely can still yield slow context
transfers and image loads, for large projects or if the network connection is
slow. Here are some ways that you can optimize your builds to make the transfer
more efficient:
@y
Despite these optimizations, building remotely can still yield slow context
transfers and image loads, for large projects or if the network connection is
slow. Here are some ways that you can optimize your builds to make the transfer
more efficient:
@z

@x
- [Dockerignore files](#dockerignore-files)
- [Slim base images](#slim-base-images)
- [Multi-stage builds](#multi-stage-builds)
- [Fetch remote files in build](#fetch-remote-files-in-build)
- [Multi-threaded tools](#multi-threaded-tools)
@y
- [Dockerignore files](#dockerignore-files)
- [Slim base images](#slim-base-images)
- [Multi-stage builds](#multi-stage-builds)
- [Fetch remote files in build](#fetch-remote-files-in-build)
- [Multi-threaded tools](#multi-threaded-tools)
@z

@x
### Dockerignore files
@y
### Dockerignore files
@z

@x __SUBDIR__ 対応
Using a [`.dockerignore` file](/build/building/context/#dockerignore-files),
you can be explicit about which local files you don’t want to include in the
build context. Files caught by the glob patterns you specify in your
ignore-file aren't transferred to the remote builder.
@y
Using a [`.dockerignore` file](__SUBDIR__/build/building/context/#dockerignore-files),
you can be explicit about which local files you don’t want to include in the
build context. Files caught by the glob patterns you specify in your
ignore-file aren't transferred to the remote builder.
@z

@x
Some examples of things you might want to add to your `.dockerignore` file are:
@y
Some examples of things you might want to add to your `.dockerignore` file are:
@z

@x
- `.git` — skip sending the version control history in the build context. Note
  that this means you won’t be able to run Git commands in your build steps,
  such as `git rev-parse`.
- Directories containing build artifacts, such as binaries. Build artifacts
  created locally during development.
- Vendor directories for package managers, such as `node_modules`.
@y
- `.git` — skip sending the version control history in the build context. Note
  that this means you won’t be able to run Git commands in your build steps,
  such as `git rev-parse`.
- Directories containing build artifacts, such as binaries. Build artifacts
  created locally during development.
- Vendor directories for package managers, such as `node_modules`.
@z

@x
In general, the contents of your `.dockerignore` file should be similar to what
you have in your `.gitignore`.
@y
In general, the contents of your `.dockerignore` file should be similar to what
you have in your `.gitignore`.
@z

@x
### Slim base images
@y
### Slim base images
@z

@x
Selecting smaller images for your `FROM` instructions in your Dockerfile can
help reduce the size of the final image. The [Alpine image](https://hub.docker.com/_/alpine)
is a good example of a minimal Docker image that provides all of the OS
utilities you would expect from a Linux container.
@y
Selecting smaller images for your `FROM` instructions in your Dockerfile can
help reduce the size of the final image. The [Alpine image](https://hub.docker.com/_/alpine)
is a good example of a minimal Docker image that provides all of the OS
utilities you would expect from a Linux container.
@z

@x
There’s also the [special `scratch` image](https://hub.docker.com/_/scratch),
which contains nothing at all. Useful for creating images of statically linked
binaries, for example.
@y
There’s also the [special `scratch` image](https://hub.docker.com/_/scratch),
which contains nothing at all. Useful for creating images of statically linked
binaries, for example.
@z

@x
### Multi-stage builds
@y
### Multi-stage builds
@z

@x
[Multi-stage builds](/build/building/multi-stage/) can make your build run faster,
because stages can run in parallel. It can also make your end-result smaller.
Write your Dockerfile in such a way that the final runtime stage uses the
smallest possible base image, with only the resources that your program requires
to run.
@y
[Multi-stage builds](__SUBDIR__/build/building/multi-stage/) can make your build run faster,
because stages can run in parallel. It can also make your end-result smaller.
Write your Dockerfile in such a way that the final runtime stage uses the
smallest possible base image, with only the resources that your program requires
to run.
@z

@x
It’s also possible to
[copy resources from other images or stages](/build/building/multi-stage/#name-your-build-stages),
using the Dockerfile `COPY --from` instruction. This technique can reduce the
number of layers, and the size of those layers, in the final stage.
@y
It’s also possible to
[copy resources from other images or stages](__SUBDIR__/build/building/multi-stage/#name-your-build-stages),
using the Dockerfile `COPY --from` instruction. This technique can reduce the
number of layers, and the size of those layers, in the final stage.
@z

@x
### Fetch remote files in build
@y
### Fetch remote files in build
@z

@x
When possible, you should fetch files from a remote location in the build,
rather than bundling the files into the build context. Downloading files on the
Docker Build Cloud server directly is better, because it will likely be faster
than transferring the files with the build context.
@y
When possible, you should fetch files from a remote location in the build,
rather than bundling the files into the build context. Downloading files on the
Docker Build Cloud server directly is better, because it will likely be faster
than transferring the files with the build context.
@z

@x
You can fetch remote files during the build using the
[Dockerfile `ADD` instruction](/reference/dockerfile/#add),
or in your `RUN` instructions with tools like `wget` and `rsync`.
@y
You can fetch remote files during the build using the
[Dockerfile `ADD` instruction](__SUBDIR__/reference/dockerfile/#add),
or in your `RUN` instructions with tools like `wget` and `rsync`.
@z

@x
### Multi-threaded tools
@y
### Multi-threaded tools
@z

@x
Some tools that you use in your build instructions may not utilize multiple
cores by default. One such example is `make` which uses a single thread by
default, unless you specify the `make --jobs=<n>` option. For build steps
involving such tools, try checking if you can optimize the execution with
parallelization.
@y
Some tools that you use in your build instructions may not utilize multiple
cores by default. One such example is `make` which uses a single thread by
default, unless you specify the `make --jobs=<n>` option. For build steps
involving such tools, try checking if you can optimize the execution with
parallelization.
@z
