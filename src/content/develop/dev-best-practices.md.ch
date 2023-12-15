%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker development best practices
description: Rules of thumb for making your life easier as a Docker application developer
keywords: application, development
---
@y
---
title: Docker development best practices
description: Rules of thumb for making your life easier as a Docker application developer
keywords: application, development
---
@z

@x
The following development patterns have proven to be helpful for people
building applications with Docker. 
@y
The following development patterns have proven to be helpful for people
building applications with Docker. 
@z

@x
<!-- markdownlint-disable-next-line -->
If you have discovered something we should add, [let us know]({{% param "repo" %}}/issues/new?template=doc_issue.yml&labels=status%2Ftriage).
@y
<!-- markdownlint-disable-next-line -->
If you have discovered something we should add, [let us know]({{% param "repo" %}}/issues/new?template=doc_issue.yml&labels=status%2Ftriage).
@z

@x
## How to keep your images small
@y
## How to keep your images small
@z

@x
Small images are faster to pull over the network and faster to load into
memory when starting containers or services. There are a few rules of thumb to
keep image size small:
@y
Small images are faster to pull over the network and faster to load into
memory when starting containers or services. There are a few rules of thumb to
keep image size small:
@z

@x
- Start with an appropriate base image. For instance, if you need a JDK,
  consider basing your image on a Docker Official Image which includes OpenJDK,
  such as `eclipse-temurin`, rather than building your own image from scratch.
@y
- Start with an appropriate base image. For instance, if you need a JDK,
  consider basing your image on a Docker Official Image which includes OpenJDK,
  such as `eclipse-temurin`, rather than building your own image from scratch.
@z

@x
- [Use multistage builds](../build/building/multi-stage.md). For
  instance, you can use the `maven` image to build your Java application, then
  reset to the `tomcat` image and copy the Java artifacts into the correct
  location to deploy your app, all in the same Dockerfile. This means that your
  final image doesn't include all of the libraries and dependencies pulled in by
  the build, but only the artifacts and the environment needed to run them.
@y
- [Use multistage builds](../build/building/multi-stage.md). For
  instance, you can use the `maven` image to build your Java application, then
  reset to the `tomcat` image and copy the Java artifacts into the correct
  location to deploy your app, all in the same Dockerfile. This means that your
  final image doesn't include all of the libraries and dependencies pulled in by
  the build, but only the artifacts and the environment needed to run them.
@z

@x
  - If you need to use a version of Docker that does not include multistage
    builds, try to reduce the number of layers in your image by minimizing the
    number of separate `RUN` commands in your Dockerfile. You can do this by
    consolidating multiple commands into a single `RUN` line and using your
    shell's mechanisms to combine them together. Consider the following two
    fragments. The first creates two layers in the image, while the second
    only creates one.
@y
  - If you need to use a version of Docker that does not include multistage
    builds, try to reduce the number of layers in your image by minimizing the
    number of separate `RUN` commands in your Dockerfile. You can do this by
    consolidating multiple commands into a single `RUN` line and using your
    shell's mechanisms to combine them together. Consider the following two
    fragments. The first creates two layers in the image, while the second
    only creates one.
@z

@x
    ```dockerfile
    RUN apt-get -y update
    RUN apt-get install -y python
    ```
@y
    ```dockerfile
    RUN apt-get -y update
    RUN apt-get install -y python
    ```
@z

@x
    ```dockerfile
    RUN apt-get -y update && apt-get install -y python
    ```
@y
    ```dockerfile
    RUN apt-get -y update && apt-get install -y python
    ```
@z

@x
- If you have multiple images with a lot in common, consider creating your own
  [base image](../build/building/base-images.md) with the shared
  components, and basing your unique images on that. Docker only needs to load
  the common layers once, and they are cached. This means that your
  derivative images use memory on the Docker host more efficiently and load more
  quickly.
@y
- If you have multiple images with a lot in common, consider creating your own
  [base image](../build/building/base-images.md) with the shared
  components, and basing your unique images on that. Docker only needs to load
  the common layers once, and they are cached. This means that your
  derivative images use memory on the Docker host more efficiently and load more
  quickly.
@z

@x
- To keep your production image lean but allow for debugging, consider using the
  production image as the base image for the debug image. Additional testing or
  debugging tooling can be added on top of the production image.
@y
- To keep your production image lean but allow for debugging, consider using the
  production image as the base image for the debug image. Additional testing or
  debugging tooling can be added on top of the production image.
@z

@x
- When building images, always tag them with useful tags which codify version
  information, intended destination (`prod` or `test`, for instance), stability,
  or other information that's useful when deploying the application in
  different environments. Don't rely on the automatically-created `latest` tag.
@y
- When building images, always tag them with useful tags which codify version
  information, intended destination (`prod` or `test`, for instance), stability,
  or other information that's useful when deploying the application in
  different environments. Don't rely on the automatically-created `latest` tag.
@z

@x
## Where and how to persist application data
@y
## Where and how to persist application data
@z

@x
- Avoid storing application data in your container's writable layer using
  [storage drivers](../storage/storagedriver/select-storage-driver.md). This increases the
  size of your container and is less efficient from an I/O perspective than
  using volumes or bind mounts.
- Instead, store data using [volumes](../storage/volumes.md).
- One case where it's appropriate to use
  [bind mounts](../storage/bind-mounts.md) is during development,
  when you may want to mount your source directory or a binary you just built
  into your container. For production, use a volume instead, mounting it into
  the same location as you mounted a bind mount during development.
- For production, use [secrets](../engine/swarm/secrets.md) to store sensitive
  application data used by services, and use [configs](../engine/swarm/configs.md)
  for non-sensitive data such as configuration files. If you currently use
  standalone containers, consider migrating to use single-replica services, so
  that you can take advantage of these service-only features.
@y
- Avoid storing application data in your container's writable layer using
  [storage drivers](../storage/storagedriver/select-storage-driver.md). This increases the
  size of your container and is less efficient from an I/O perspective than
  using volumes or bind mounts.
- Instead, store data using [volumes](../storage/volumes.md).
- One case where it's appropriate to use
  [bind mounts](../storage/bind-mounts.md) is during development,
  when you may want to mount your source directory or a binary you just built
  into your container. For production, use a volume instead, mounting it into
  the same location as you mounted a bind mount during development.
- For production, use [secrets](../engine/swarm/secrets.md) to store sensitive
  application data used by services, and use [configs](../engine/swarm/configs.md)
  for non-sensitive data such as configuration files. If you currently use
  standalone containers, consider migrating to use single-replica services, so
  that you can take advantage of these service-only features.
@z

@x
## Use CI/CD for testing and deployment
@y
## Use CI/CD for testing and deployment
@z

@x
- When you check in a change to source control or create a pull request, use
  [Docker Hub](../docker-hub/builds/index.md) or
  another CI/CD pipeline to automatically build and tag a Docker image and test
  it.
@y
- When you check in a change to source control or create a pull request, use
  [Docker Hub](../docker-hub/builds/index.md) or
  another CI/CD pipeline to automatically build and tag a Docker image and test
  it.
@z

@x
- Take this even further by requiring your development, testing, and
  security teams to [sign images](../engine/reference/commandline/trust.md)
  before the teams deploy the images into production. This way, before an image is
  deployed into production, it has been tested and signed off by, for instance,
  development, quality, and security teams.
@y
- Take this even further by requiring your development, testing, and
  security teams to [sign images](../engine/reference/commandline/trust.md)
  before the teams deploy the images into production. This way, before an image is
  deployed into production, it has been tested and signed off by, for instance,
  development, quality, and security teams.
@z

@x
## Differences in development and production environments
@y
## Differences in development and production environments
@z

@x
| Development                                                         | Production                                                                                                                                                                                                                                       |
|:--------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Use bind mounts to give your container access to your source code.  | Use volumes to store container data.                                                                                                                                                                                                             |
| Use Docker Desktop for Mac, Linux, or Windows.           | Use Docker Engine, if possible with [userns mapping](../engine/security/userns-remap.md) for greater isolation of Docker processes from host processes.                                                                                          |
@y
| Development                                                         | Production                                                                                                                                                                                                                                       |
|:--------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Use bind mounts to give your container access to your source code.  | Use volumes to store container data.                                                                                                                                                                                                             |
| Use Docker Desktop for Mac, Linux, or Windows.           | Use Docker Engine, if possible with [userns mapping](../engine/security/userns-remap.md) for greater isolation of Docker processes from host processes.                                                                                          |
@z
