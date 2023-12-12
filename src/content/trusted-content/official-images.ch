%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Guidelines for Official Images on Docker Hub
keywords: Docker, docker, registry, accounts, plans, Dockerfile, Docker Hub, docs,
  official,image, documentation
title: Docker Official Images
aliases:
- /docker-hub/official_repos/
- /docker-hub/official_images/
---
@y
---
description: Guidelines for Official Images on Docker Hub
keywords: Docker, docker, registry, accounts, plans, Dockerfile, Docker Hub, docs,
  official,image, documentation
title: Docker Official Images
aliases:
- /docker-hub/official_repos/
- /docker-hub/official_images/
---
@z

@x
The [Docker Official Images](https://hub.docker.com/search?q=&type=image&image_filter=official) are a
curated set of Docker repositories hosted on Docker Hub.
@y
The [Docker Official Images](https://hub.docker.com/search?q=&type=image&image_filter=official) are a
curated set of Docker repositories hosted on Docker Hub.
@z

@x
These images provide essential base repositories that serve as the starting point for the majority of users.
@y
These images provide essential base repositories that serve as the starting point for the majority of users.
@z

@x
These include operating systems such as [Ubuntu](https://hub.docker.com/_/ubuntu/) and [Alpine](https://hub.docker.com/_/alpine/), programming languages such as [Python](https://hub.docker.com/_/python) and [Node](https://hub.docker.com/_/node), and other essential tools such as [Redis](https://hub.docker.com/_/redis) and [MySQL](https://hub.docker.com/_/mysql).
@y
These include operating systems such as [Ubuntu](https://hub.docker.com/_/ubuntu/) and [Alpine](https://hub.docker.com/_/alpine/), programming languages such as [Python](https://hub.docker.com/_/python) and [Node](https://hub.docker.com/_/node), and other essential tools such as [Redis](https://hub.docker.com/_/redis) and [MySQL](https://hub.docker.com/_/mysql).
@z

@x
The images are some of the most secure images on Docker Hub. This is particularly important as Docker Official Images are some of the most popular on Docker Hub. Typically, Docker Official images have few or no vulnerabilities.
@y
The images are some of the most secure images on Docker Hub. This is particularly important as Docker Official Images are some of the most popular on Docker Hub. Typically, Docker Official images have few or no vulnerabilities.
@z

@x
The images exemplify [`Dockerfile` best practices](/engine/userguide/eng-image/dockerfile_best-practices/) and provide clear documentation to serve as a reference for other `Dockerfile` authors.
@y
The images exemplify [`Dockerfile` best practices](/engine/userguide/eng-image/dockerfile_best-practices/) and provide clear documentation to serve as a reference for other `Dockerfile` authors.
@z

@x
Images that are part of this program have a special badge on Docker Hub making it easier for you to identify projects that are official Docker images.
@y
Images that are part of this program have a special badge on Docker Hub making it easier for you to identify projects that are official Docker images.
@z

@x
![Docker official image badge](images/official-image-badge-iso.png)
@y
![Docker official image badge](images/official-image-badge-iso.png)
@z

@x
## When to use Docker Official Images
@y
## When to use Docker Official Images
@z

@x
If you are new to Docker, it's recommended you use the Docker Official Images in your
projects. These images have clear documentation, promote best practices,
and are designed for the most common use cases. Advanced users can
review Docker Official Images as part of your `Dockerfile` learning process.
@y
If you are new to Docker, it's recommended you use the Docker Official Images in your
projects. These images have clear documentation, promote best practices,
and are designed for the most common use cases. Advanced users can
review Docker Official Images as part of your `Dockerfile` learning process.
@z

@x
A common rationale for diverging from Docker Official Images is to optimize for
image size. For instance, many of the programming language stack images contain
a complete build toolchain to support installation of modules that depend on
optimized code. An advanced user could build a custom image with just the
necessary pre-compiled libraries to save space.
@y
A common rationale for diverging from Docker Official Images is to optimize for
image size. For instance, many of the programming language stack images contain
a complete build toolchain to support installation of modules that depend on
optimized code. An advanced user could build a custom image with just the
necessary pre-compiled libraries to save space.
@z

@x
A number of language stacks such as
[Python](https://hub.docker.com/_/python/) and
[Ruby](https://hub.docker.com/_/ruby/) have `-slim` tag variants
designed to fill the need for optimization. Even when these "slim" variants are
insufficient, it's still recommended to inherit from an Official Image
base OS image to leverage the ongoing maintenance work, rather than duplicating
these efforts.
@y
A number of language stacks such as
[Python](https://hub.docker.com/_/python/) and
[Ruby](https://hub.docker.com/_/ruby/) have `-slim` tag variants
designed to fill the need for optimization. Even when these "slim" variants are
insufficient, it's still recommended to inherit from an Official Image
base OS image to leverage the ongoing maintenance work, rather than duplicating
these efforts.
@z

@x
## Submitting feedback for Docker Official Images
@y
## Submitting feedback for Docker Official Images
@z

@x
All Docker Official Images contain a **User Feedback** section in their
documentation which covers the details for that specific repository. In most
cases, the GitHub repository which contains the Dockerfiles for an Official
Repository also has an active issue tracker. General feedback and support
questions should be directed to `#docker-library` on [Libera.Chat IRC](https://libera.chat).
@y
All Docker Official Images contain a **User Feedback** section in their
documentation which covers the details for that specific repository. In most
cases, the GitHub repository which contains the Dockerfiles for an Official
Repository also has an active issue tracker. General feedback and support
questions should be directed to `#docker-library` on [Libera.Chat IRC](https://libera.chat).
@z

@x
## For content publishers
@y
## For content publishers
@z

@x
Docker, Inc. sponsors a dedicated team that's responsible for reviewing and
publishing all content in Docker Official Images. This team works in
collaboration with upstream software maintainers, security experts, and the
broader Docker community.
@y
Docker, Inc. sponsors a dedicated team that's responsible for reviewing and
publishing all content in Docker Official Images. This team works in
collaboration with upstream software maintainers, security experts, and the
broader Docker community.
@z

@x
While it's preferable to have upstream software authors maintaining their
Docker Official Images, this isn't a strict requirement. Creating
and maintaining images for Docker Official Images is a collaborative process. It takes
place openly on GitHub where participation is encouraged. Anyone can provide
feedback, contribute code, suggest process changes, or even propose a new
Official Image.
@y
While it's preferable to have upstream software authors maintaining their
Docker Official Images, this isn't a strict requirement. Creating
and maintaining images for Docker Official Images is a collaborative process. It takes
place openly on GitHub where participation is encouraged. Anyone can provide
feedback, contribute code, suggest process changes, or even propose a new
Official Image.
@z

@x
> **Note**
>
> Docker Official Images are an intellectual property of Docker.
@y
> **Note**
>
> Docker Official Images are an intellectual property of Docker.
@z

@x
### Creating a Docker Official Image
@y
### Creating a Docker Official Image
@z

@x
From a high level, an Official Image starts out as a proposal in the form
of a set of GitHub pull requests. The following GitHub repositories detail the proposal requirements:
@y
From a high level, an Official Image starts out as a proposal in the form
of a set of GitHub pull requests. The following GitHub repositories detail the proposal requirements:
@z

@x
- [docker-library/official-images](https://github.com/docker-library/official-images)
- [docker-library/docs](https://github.com/docker-library/docs)
@y
- [docker-library/official-images](https://github.com/docker-library/official-images)
- [docker-library/docs](https://github.com/docker-library/docs)
@z

@x
The Docker Official Images team, with help from community contributors, formally
review each proposal and provide feedback to the author. This initial review
process may require a bit of back-and-forth before the proposal is accepted.
@y
The Docker Official Images team, with help from community contributors, formally
review each proposal and provide feedback to the author. This initial review
process may require a bit of back-and-forth before the proposal is accepted.
@z

@x
There are subjective considerations during the review process. These
subjective concerns boil down to the basic question: "is this image generally
useful?" For example, the [Python](https://hub.docker.com/_/python/)
Docker Official Image is "generally useful" to the larger Python developer
community, whereas an obscure text adventure game written in Python last week is
not.
@y
There are subjective considerations during the review process. These
subjective concerns boil down to the basic question: "is this image generally
useful?" For example, the [Python](https://hub.docker.com/_/python/)
Docker Official Image is "generally useful" to the larger Python developer
community, whereas an obscure text adventure game written in Python last week is
not.
@z

@x
Once a new proposal is accepted, the author is responsible for keeping
their images up-to-date and responding to user feedback. The Official
Repositories team becomes responsible for publishing the images and
documentation on Docker Hub. Updates to the Docker Official Image follow the same pull request process, though with less review. The Docker Official Images team ultimately acts as a gatekeeper for all changes, which helps mitigate the risk of quality and security issues from being introduced.
@y
Once a new proposal is accepted, the author is responsible for keeping
their images up-to-date and responding to user feedback. The Official
Repositories team becomes responsible for publishing the images and
documentation on Docker Hub. Updates to the Docker Official Image follow the same pull request process, though with less review. The Docker Official Images team ultimately acts as a gatekeeper for all changes, which helps mitigate the risk of quality and security issues from being introduced.
@z
