%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Hints, tips and guidelines for writing clean, reliable Dockerfiles
keywords: parent image, images, dockerfile, best practices, hub, official image
title: General best practices for writing Dockerfiles
---
@y
---
description: Hints, tips and guidelines for writing clean, reliable Dockerfiles
keywords: parent image, images, dockerfile, best practices, hub, official image
title: General best practices for writing Dockerfiles
---
@z

@x
## Use multi-stage builds
@y
## Use multi-stage builds
@z

@x
Multi-stage builds let you reduce the size of your final image, by creating a
cleaner separation between the building of your image and the final output.
Split your Dockerfile instructions into distinct stages to make sure that the
resulting output only contains the files that's needed to run the application.
@y
Multi-stage builds let you reduce the size of your final image, by creating a
cleaner separation between the building of your image and the final output.
Split your Dockerfile instructions into distinct stages to make sure that the
resulting output only contains the files that's needed to run the application.
@z

@x
Using multiple stages can also let you build more efficiently by executing
build steps in parallel.
@y
Using multiple stages can also let you build more efficiently by executing
build steps in parallel.
@z

@x
See [Multi-stage builds](../../build/building/multi-stage.md) for more
information.
@y
See [Multi-stage builds](../../build/building/multi-stage.md) for more
information.
@z

@x
## Exclude with .dockerignore
@y
## Exclude with .dockerignore
@z

@x
To exclude files not relevant to the build, without restructuring your source
repository, use a `.dockerignore` file. This file supports exclusion patterns
similar to `.gitignore` files. For information on creating one, see
[Dockerignore file](../../build/building/context.md#dockerignore-files).
@y
To exclude files not relevant to the build, without restructuring your source
repository, use a `.dockerignore` file. This file supports exclusion patterns
similar to `.gitignore` files. For information on creating one, see
[Dockerignore file](../../build/building/context.md#dockerignore-files).
@z

@x
## Create ephemeral containers
@y
## Create ephemeral containers
@z

@x
The image defined by your Dockerfile should generate containers that are as
ephemeral as possible. Ephemeral means that the container can be stopped
and destroyed, then rebuilt and replaced with an absolute minimum set up and
configuration.
@y
The image defined by your Dockerfile should generate containers that are as
ephemeral as possible. Ephemeral means that the container can be stopped
and destroyed, then rebuilt and replaced with an absolute minimum set up and
configuration.
@z

@x
Refer to [Processes](https://12factor.net/processes) under _The Twelve-factor App_
methodology to get a feel for the motivations of running containers in such a
stateless fashion.
@y
Refer to [Processes](https://12factor.net/processes) under _The Twelve-factor App_
methodology to get a feel for the motivations of running containers in such a
stateless fashion.
@z

@x
## Don't install unnecessary packages
@y
## Don't install unnecessary packages
@z

@x
Avoid installing extra or unnecessary packages just because they might be nice to have. For example, you don’t need to include a text editor in a database image.
@y
Avoid installing extra or unnecessary packages just because they might be nice to have. For example, you don’t need to include a text editor in a database image.
@z

@x
When you avoid installing extra or unnecessary packages, your images have reduced complexity, reduced dependencies, reduced file sizes, and reduced build times.
@y
When you avoid installing extra or unnecessary packages, your images have reduced complexity, reduced dependencies, reduced file sizes, and reduced build times.
@z

@x
## Decouple applications
@y
## Decouple applications
@z

@x
Each container should have only one concern. Decoupling applications into
multiple containers makes it easier to scale horizontally and reuse containers.
For instance, a web application stack might consist of three separate
containers, each with its own unique image, to manage the web application,
database, and an in-memory cache in a decoupled manner.
@y
Each container should have only one concern. Decoupling applications into
multiple containers makes it easier to scale horizontally and reuse containers.
For instance, a web application stack might consist of three separate
containers, each with its own unique image, to manage the web application,
database, and an in-memory cache in a decoupled manner.
@z

@x
Limiting each container to one process is a good rule of thumb, but it's not a
hard and fast rule. For example, not only can containers be
[spawned with an init process](../../engine/reference/run.md#specify-an-init-process),
some programs might spawn additional processes of their own accord. For
instance, [Celery](https://docs.celeryproject.org/) can spawn multiple worker
processes, and [Apache](https://httpd.apache.org/) can create one process per
request.
@y
Limiting each container to one process is a good rule of thumb, but it's not a
hard and fast rule. For example, not only can containers be
[spawned with an init process](../../engine/reference/run.md#specify-an-init-process),
some programs might spawn additional processes of their own accord. For
instance, [Celery](https://docs.celeryproject.org/) can spawn multiple worker
processes, and [Apache](https://httpd.apache.org/) can create one process per
request.
@z

@x
Use your best judgment to keep containers as clean and modular as possible. If
containers depend on each other, you can use [Docker container networks](../../network/index.md)
to ensure that these containers can communicate.
@y
Use your best judgment to keep containers as clean and modular as possible. If
containers depend on each other, you can use [Docker container networks](../../network/index.md)
to ensure that these containers can communicate.
@z

@x
## Sort multi-line arguments
@y
## Sort multi-line arguments
@z

@x
Whenever possible, sort multi-line arguments alphanumerically to make maintenance easier.
This helps to avoid duplication of packages and make the
list much easier to update. This also makes PRs a lot easier to read and
review. Adding a space before a backslash (`\`) helps as well.
@y
Whenever possible, sort multi-line arguments alphanumerically to make maintenance easier.
This helps to avoid duplication of packages and make the
list much easier to update. This also makes PRs a lot easier to read and
review. Adding a space before a backslash (`\`) helps as well.
@z

@x
Here’s an example from the [buildpack-deps image](https://github.com/docker-library/buildpack-deps):
@y
Here’s an example from the [buildpack-deps image](https://github.com/docker-library/buildpack-deps):
@z

@x
```dockerfile
RUN apt-get update && apt-get install -y \
  bzr \
  cvs \
  git \
  mercurial \
  subversion \
  && rm -rf /var/lib/apt/lists/*
```
@y
```dockerfile
RUN apt-get update && apt-get install -y \
  bzr \
  cvs \
  git \
  mercurial \
  subversion \
  && rm -rf /var/lib/apt/lists/*
```
@z

@x
## Leverage build cache
@y
## Leverage build cache
@z

@x
When building an image, Docker steps through the instructions in your
Dockerfile, executing each in the order specified. For each instruction, Docker
checks whether it can reuse the instruction from the build cache.
@y
When building an image, Docker steps through the instructions in your
Dockerfile, executing each in the order specified. For each instruction, Docker
checks whether it can reuse the instruction from the build cache.
@z

@x
The basic rules of build cache invalidation are as follows:
@y
The basic rules of build cache invalidation are as follows:
@z

@x
- Starting with a parent image that's already in the cache, the next
  instruction is compared against all child images derived from that base
  image to see if one of them was built using the exact same instruction. If
  not, the cache is invalidated.
@y
- Starting with a parent image that's already in the cache, the next
  instruction is compared against all child images derived from that base
  image to see if one of them was built using the exact same instruction. If
  not, the cache is invalidated.
@z

@x
- In most cases, simply comparing the instruction in the Dockerfile with one
  of the child images is sufficient. However, certain instructions require more
  examination and explanation.
@y
- In most cases, simply comparing the instruction in the Dockerfile with one
  of the child images is sufficient. However, certain instructions require more
  examination and explanation.
@z

@x
- For the `ADD` and `COPY` instructions, the modification time and size file
  metadata is used to determine whether cache is valid. During cache lookup,
  cache is invalidated if the file metadata has changed for any of the files
  involved.
@y
- For the `ADD` and `COPY` instructions, the modification time and size file
  metadata is used to determine whether cache is valid. During cache lookup,
  cache is invalidated if the file metadata has changed for any of the files
  involved.
@z

@x
- Aside from the `ADD` and `COPY` commands, cache checking doesn't look at the
  files in the container to determine a cache match. For example, when processing
  a `RUN apt-get -y update` command the files updated in the container
  aren't examined to determine if a cache hit exists. In that case just
  the command string itself is used to find a match.
@y
- Aside from the `ADD` and `COPY` commands, cache checking doesn't look at the
  files in the container to determine a cache match. For example, when processing
  a `RUN apt-get -y update` command the files updated in the container
  aren't examined to determine if a cache hit exists. In that case just
  the command string itself is used to find a match.
@z

@x
Once the cache is invalidated, all subsequent Dockerfile commands generate new
images and the cache isn't used.
@y
Once the cache is invalidated, all subsequent Dockerfile commands generate new
images and the cache isn't used.
@z

@x
If your build contains several layers and you want to ensure the build cache is
reusable, order the instructions from less frequently changed to more
frequently changed where possible.
@y
If your build contains several layers and you want to ensure the build cache is
reusable, order the instructions from less frequently changed to more
frequently changed where possible.
@z

@x
For more information about the Docker build cache and how to optimize your
builds, see [cache management](../../build/cache/_index.md).
@y
For more information about the Docker build cache and how to optimize your
builds, see [cache management](../../build/cache/_index.md).
@z
