%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: What's next 
keywords: concepts, build, images, container, docker desktop
description: Explore step-by-step guides to hep you understand core Docker concepts, building images, and running containers.
summary: |
  Now that you have set up Docker Desktop, developed with containers, and built
  and pushed your first image, you are ready to take the next step and dive
  deep into what a container is and how it works.
notoc: true
weight: 4
@y
---
title: What's next 
keywords: concepts, build, images, container, docker desktop
description: Explore step-by-step guides to hep you understand core Docker concepts, building images, and running containers.
summary: |
  Now that you have set up Docker Desktop, developed with containers, and built
  and pushed your first image, you are ready to take the next step and dive
  deep into what a container is and how it works.
notoc: true
weight: 4
@z

@x
the-basics:
- title: What is a container?
  description: Learn how to run your first container.
  link: /guides/docker-concepts/the-basics/what-is-a-container/
- title: What is an image?
  description: Learn the basics of image layers. 
  link: /guides/docker-concepts/the-basics/what-is-an-image/
- title: What is a registry?
  description: Learn about container registries, explore their interoperability, and interact with registries. 
  link: /guides/docker-concepts/the-basics/what-is-a-registry/
- title: What is Docker Compose?
  description: Gain a better understanding of Docker Compose.
  link: /guides/docker-concepts/the-basics/what-is-docker-compose/
@y
the-basics:
- title: What is a container?
  description: Learn how to run your first container.
  link: /guides/docker-concepts/the-basics/what-is-a-container/
- title: What is an image?
  description: Learn the basics of image layers. 
  link: /guides/docker-concepts/the-basics/what-is-an-image/
- title: What is a registry?
  description: Learn about container registries, explore their interoperability, and interact with registries. 
  link: /guides/docker-concepts/the-basics/what-is-a-registry/
- title: What is Docker Compose?
  description: Gain a better understanding of Docker Compose.
  link: /guides/docker-concepts/the-basics/what-is-docker-compose/
@z

@x
building-images:
- title: Understanding image layers 
  description: Learn about the layers of container images.
  link: /guides/docker-concepts/building-images/understanding-image-layers/
- title: Writing a Dockerfile
  description: Learn how to create an image using a Dockerfile.
  link: /guides/docker-concepts/building-images/writing-a-dockerfile/
- title: Build, tag and publish an image
  description: Learn how to build, tag, and publish an image to Docker Hub or any other registry.
  link: /guides/docker-concepts/building-images/build-tag-and-publish-an-image/
- title: Using the build cache
  description: Learn about the build cache, what changes invalidate the cache, and how to effectively use the build cache.
  link: /guides/docker-concepts/building-images/using-the-build-cache/
- title: Multi-stage builds
  description: Get a better understanding of multi-stage builds and their benefits.
  link: /guides/docker-concepts/building-images/multi-stage-builds/
@y
building-images:
- title: Understanding image layers 
  description: Learn about the layers of container images.
  link: /guides/docker-concepts/building-images/understanding-image-layers/
- title: Writing a Dockerfile
  description: Learn how to create an image using a Dockerfile.
  link: /guides/docker-concepts/building-images/writing-a-dockerfile/
- title: Build, tag and publish an image
  description: Learn how to build, tag, and publish an image to Docker Hub or any other registry.
  link: /guides/docker-concepts/building-images/build-tag-and-publish-an-image/
- title: Using the build cache
  description: Learn about the build cache, what changes invalidate the cache, and how to effectively use the build cache.
  link: /guides/docker-concepts/building-images/using-the-build-cache/
- title: Multi-stage builds
  description: Get a better understanding of multi-stage builds and their benefits.
  link: /guides/docker-concepts/building-images/multi-stage-builds/
@z

@x
running-containers:
- title: Publishing ports
  description: Understand the significance of publishing and exposing ports in Docker.
  link: /guides/docker-concepts/running-containers/publishing-ports/
- title: Overriding container defaults
  description: Learn how to override the container defaults using the `docker run` command.
  link: /guides/docker-concepts/running-containers/overriding-container-defaults/
- title: Persisting container data
  description: Learn the significance of data persistence in Docker.
  link: /guides/docker-concepts/running-containers/persisting-container-data/
- title: Sharing local files with containers
  description: Explore the various storage options available in Docker and their common usage.
  link: /guides/docker-concepts/running-containers/sharing-local-files/
- title: Multi-container applications
  description: Learn the significance of multi-container applications and how they're different from single-container applications.
  link: /guides/docker-concepts/running-containers/multi-container-applications/
---
@y
running-containers:
- title: Publishing ports
  description: Understand the significance of publishing and exposing ports in Docker.
  link: /guides/docker-concepts/running-containers/publishing-ports/
- title: Overriding container defaults
  description: Learn how to override the container defaults using the `docker run` command.
  link: /guides/docker-concepts/running-containers/overriding-container-defaults/
- title: Persisting container data
  description: Learn the significance of data persistence in Docker.
  link: /guides/docker-concepts/running-containers/persisting-container-data/
- title: Sharing local files with containers
  description: Explore the various storage options available in Docker and their common usage.
  link: /guides/docker-concepts/running-containers/sharing-local-files/
- title: Multi-container applications
  description: Learn the significance of multi-container applications and how they're different from single-container applications.
  link: /guides/docker-concepts/running-containers/multi-container-applications/
---
@z

@x
The following sections provide step-by-step guides to help you understand core Docker concepts, building images, and running containers.
@y
The following sections provide step-by-step guides to help you understand core Docker concepts, building images, and running containers.
@z

@x
## The basics
@y
## The basics
@z

@x
Get started learning the core concepts of containers, images, registries, and Docker Compose.
@y
Get started learning the core concepts of containers, images, registries, and Docker Compose.
@z

@x
{{< grid items="the-basics" >}}
@y
{{< grid items="the-basics" >}}
@z

@x
## Building images
@y
## Building images
@z

@x
Craft optimized container images with Dockerfiles, build cache, and multi-stage builds.
@y
Craft optimized container images with Dockerfiles, build cache, and multi-stage builds.
@z

@x
{{< grid items="building-images" >}}
@y
{{< grid items="building-images" >}}
@z

@x
## Running containers
@y
## Running containers
@z

@x
Master essential techniques for exposing ports, overriding defaults, persisting data, sharing files, and managing multi-container applications.
@y
Master essential techniques for exposing ports, overriding defaults, persisting data, sharing files, and managing multi-container applications.
@z

@x
{{< grid items="running-containers" >}}
@y
{{< grid items="running-containers" >}}
@z
