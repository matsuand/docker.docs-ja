%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Security best practices
description: Image security best practices guide
keywords: docker, images, containers, vulnerability, cve
aliases:
- /develop/scan-images/
---
@y
---
title: Security best practices
description: Image security best practices guide
keywords: docker, images, containers, vulnerability, cve
aliases:
- /develop/scan-images/
---
@z

@x
You can take a few steps to improve the security of your
container. This includes:
@y
You can take a few steps to improve the security of your
container. This includes:
@z

@x
1. [Choosing the right base image](#choose-the-right-base-image) from a trusted source and keeping it small
2. [Using multi-stage builds](#use-multi-stage-builds)
3. [Rebuilding images](#rebuild-images)
4. [Checking your image for vulnerabilities](#check-your-image-for-vulnerabilities)
@y
1. [Choosing the right base image](#choose-the-right-base-image) from a trusted source and keeping it small
2. [Using multi-stage builds](#use-multi-stage-builds)
3. [Rebuilding images](#rebuild-images)
4. [Checking your image for vulnerabilities](#check-your-image-for-vulnerabilities)
@z

@x
### Choose the right base image
@y
### Choose the right base image
@z

@x
The first step towards achieving a secure image is to choose the right base
image. When choosing an image, ensure it's built from a trusted source and keep
it small.
@y
The first step towards achieving a secure image is to choose the right base
image. When choosing an image, ensure it's built from a trusted source and keep
it small.
@z

@x
Docker Hub has more than 8.3 million repositories. Some of these images are
[Official Images](../trusted-content/official-images.md), which are published by
Docker as a curated set of Docker open source and drop-in solution repositories.
Docker also offers images that are published by
[Verified Publishers](../trusted-content/dvp-program.md). These high-quality images
are published and maintained by the organizations partnering with Docker, with
Docker verifying the authenticity of the content in their repositories. When you
pick your base image, look out for the **Official Image** and **Verified Publisher**
badges.
@y
Docker Hub has more than 8.3 million repositories. Some of these images are
[Official Images](../trusted-content/official-images.md), which are published by
Docker as a curated set of Docker open source and drop-in solution repositories.
Docker also offers images that are published by
[Verified Publishers](../trusted-content/dvp-program.md). These high-quality images
are published and maintained by the organizations partnering with Docker, with
Docker verifying the authenticity of the content in their repositories. When you
pick your base image, look out for the **Official Image** and **Verified Publisher**
badges.
@z

@x
![Docker Hub Official and Verified Publisher images](images/hub-official-images.webp)
@y
![Docker Hub Official and Verified Publisher images](images/hub-official-images.webp)
@z

@x
When building your own image from a Dockerfile, ensure you choose a minimal base
image that matches your requirements. A smaller base image not only offers
portability and fast downloads, but also shrinks the size of your image and
minimizes the number of vulnerabilities introduced through the dependencies.
@y
When building your own image from a Dockerfile, ensure you choose a minimal base
image that matches your requirements. A smaller base image not only offers
portability and fast downloads, but also shrinks the size of your image and
minimizes the number of vulnerabilities introduced through the dependencies.
@z

@x
You should also consider using two types of base image: the first image for
development and unit testing and the second image for testing during the later
stages of development and production. In the later stages of development, your
image may not require build tools such as compilers, build systems, and
debugging tools. A small image with minimal dependencies can considerably
lower the attack surface.
@y
You should also consider using two types of base image: the first image for
development and unit testing and the second image for testing during the later
stages of development and production. In the later stages of development, your
image may not require build tools such as compilers, build systems, and
debugging tools. A small image with minimal dependencies can considerably
lower the attack surface.
@z

@x
### Use multi-stage builds
@y
### Use multi-stage builds
@z

@x
Multi-stage builds are designed to create an optimized Dockerfile that is easy
to read and maintain. With a multi-stage build, you can use multiple images and
selectively copy only the artifacts needed from a particular image.
@y
Multi-stage builds are designed to create an optimized Dockerfile that is easy
to read and maintain. With a multi-stage build, you can use multiple images and
selectively copy only the artifacts needed from a particular image.
@z

@x
You can use multiple `FROM` statements in your Dockerfile, and you can use a
different base image for each `FROM`. You can also selectively copy artifacts
from one stage to another, leaving behind things you don’t need in the final
image. This can result in a concise final image.
@y
You can use multiple `FROM` statements in your Dockerfile, and you can use a
different base image for each `FROM`. You can also selectively copy artifacts
from one stage to another, leaving behind things you don’t need in the final
image. This can result in a concise final image.
@z

@x
This method of creating a tiny image doesn't only significantly reduce
complexity, but also reduces the chance of implementing vulnerable artifacts in your
image. Therefore, instead of images that are built on images, that again are
built on other images, multi-stage builds let you 'cherry pick' your
artifacts without inheriting the vulnerabilities from the base images on which
they rely.
@y
This method of creating a tiny image doesn't only significantly reduce
complexity, but also reduces the chance of implementing vulnerable artifacts in your
image. Therefore, instead of images that are built on images, that again are
built on other images, multi-stage builds let you 'cherry pick' your
artifacts without inheriting the vulnerabilities from the base images on which
they rely.
@z

@x
For detailed information on how to configure multi-stage builds, see
[multi-stage builds](../build/building/multi-stage.md).
@y
For detailed information on how to configure multi-stage builds, see
[multi-stage builds](../build/building/multi-stage.md).
@z

@x
### Rebuild images
@y
### Rebuild images
@z

@x
A Docker image is built from a Dockerfile. A Dockerfile contains a set of
instructions which lets you automate the steps you would normally
(manually) take to create an image. Additionally, it can include some imported
libraries and install custom software. These appear as instructions in the
Dockerfile.
@y
A Docker image is built from a Dockerfile. A Dockerfile contains a set of
instructions which lets you automate the steps you would normally
(manually) take to create an image. Additionally, it can include some imported
libraries and install custom software. These appear as instructions in the
Dockerfile.
@z

@x
Building your image is a snapshot of that image at that moment. When
you depend on a base image without a tag, you’ll get a different base image
every time you rebuild. Also, when you install packages using a package
installer, rebuilding can change the image drastically. For example, a
Dockerfile containing the following entries can potentially have a different
binary with every rebuild.
@y
Building your image is a snapshot of that image at that moment. When
you depend on a base image without a tag, you’ll get a different base image
every time you rebuild. Also, when you install packages using a package
installer, rebuilding can change the image drastically. For example, a
Dockerfile containing the following entries can potentially have a different
binary with every rebuild.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM ubuntu:latest
RUN apt-get -y update && apt-get install -y python
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM ubuntu:latest
RUN apt-get -y update && apt-get install -y python
```
@z

@x
Docker recommends that you rebuild your Docker image regularly to prevent known
vulnerabilities that have been addressed. When rebuilding, use the option
`--no-cache` to avoid cache hits and to ensure a fresh download.
@y
Docker recommends that you rebuild your Docker image regularly to prevent known
vulnerabilities that have been addressed. When rebuilding, use the option
`--no-cache` to avoid cache hits and to ensure a fresh download.
@z

@x
For example:
@y
For example:
@z

@x
```console
$ docker build --no-cache -t myImage:myTag myPath/
```
@y
```console
$ docker build --no-cache -t myImage:myTag myPath/
```
@z

@x
Consider the following best practices when rebuilding an image:
@y
Consider the following best practices when rebuilding an image:
@z

@x
- Each container should have only one responsibility.
- Containers should be immutable, lightweight, and fast.
- Don’t store data in your containers. Use a shared data store instead.
- Containers should be easy to destroy and rebuild.
- Use a small base image (such as Linux Alpine). Smaller images are easier to
  distribute.
- Avoid installing unnecessary packages. This keeps the image clean and safe.
- Avoid cache hits when building.
- Auto-scan your image before deploying to avoid pushing vulnerable containers
  to production.
- Analyze your images daily both during development and production for
  vulnerabilities. Based on that, automate the rebuilding of images if necessary.
@y
- Each container should have only one responsibility.
- Containers should be immutable, lightweight, and fast.
- Don’t store data in your containers. Use a shared data store instead.
- Containers should be easy to destroy and rebuild.
- Use a small base image (such as Linux Alpine). Smaller images are easier to
  distribute.
- Avoid installing unnecessary packages. This keeps the image clean and safe.
- Avoid cache hits when building.
- Auto-scan your image before deploying to avoid pushing vulnerable containers
  to production.
- Analyze your images daily both during development and production for
  vulnerabilities. Based on that, automate the rebuilding of images if necessary.
@z

@x
For detailed best practices and methods for building efficient images, see
[Dockerfile best practices](develop-images/dockerfile_best-practices.md).
@y
For detailed best practices and methods for building efficient images, see
[Dockerfile best practices](develop-images/dockerfile_best-practices.md).
@z

@x
## Check your image for vulnerabilities
@y
## Check your image for vulnerabilities
@z

@x
In addition to following the best practices outlined on this page when
developing images, it's also important to continuously analyze and evaluate the
security posture of your images using vulnerability detection tools.
@y
In addition to following the best practices outlined on this page when
developing images, it's also important to continuously analyze and evaluate the
security posture of your images using vulnerability detection tools.
@z

@x
Docker tools come with features that help you to stay up to date about vulnerabilities
that affect images that you build or use.
@y
Docker tools come with features that help you to stay up to date about vulnerabilities
that affect images that you build or use.
@z

@x
- Docker Hub supports an automatic
  [vulnerability scanning](../docker-hub/vulnerability-scanning.md) feature,
  which when enabled automatically scans images when you push them to a Docker Hub
  repository. Requires a [Docker subscription](../subscription/index.md).
- Docker Hub also supports an early-access
  [advanced image analysis](../scout/image-analysis.md) feature, which extends
  the "core" vulnerability scanning solution with enhanced capabilities and more
  detailed and actionable insights.
- For the CLI, there's the
  [`docker scout` CLI plugin](../engine/reference/commandline/scout.md)
  which lets you explore vulnerabilities for images using the terminal.
- Docker Desktop has a detailed image view for images in your local image
  store, that visualizes all of the known vulnerabilities affecting an image.
@y
- Docker Hub supports an automatic
  [vulnerability scanning](../docker-hub/vulnerability-scanning.md) feature,
  which when enabled automatically scans images when you push them to a Docker Hub
  repository. Requires a [Docker subscription](../subscription/index.md).
- Docker Hub also supports an early-access
  [advanced image analysis](../scout/image-analysis.md) feature, which extends
  the "core" vulnerability scanning solution with enhanced capabilities and more
  detailed and actionable insights.
- For the CLI, there's the
  [`docker scout` CLI plugin](../engine/reference/commandline/scout.md)
  which lets you explore vulnerabilities for images using the terminal.
- Docker Desktop has a detailed image view for images in your local image
  store, that visualizes all of the known vulnerabilities affecting an image.
@z

@x
All of these security features are powered by the same technology:
[Docker Scout](../scout/index.md). These features help you to achieve a holistic
view of your supply chain security, and to provide actionable suggestions for
what you can do to remediate those vulnerabilities.
@y
All of these security features are powered by the same technology:
[Docker Scout](../scout/index.md). These features help you to achieve a holistic
view of your supply chain security, and to provide actionable suggestions for
what you can do to remediate those vulnerabilities.
@z

@x
## Conclusion
@y
## Conclusion
@z

@x
Building secure images is a continuous process. Consider the recommendations and
best practices highlighted in this guide to plan and build efficient, scalable,
and secure images.
@y
Building secure images is a continuous process. Consider the recommendations and
best practices highlighted in this guide to plan and build efficient, scalable,
and secure images.
@z

@x
To summarize the topics covered in this guide:
@y
To summarize the topics covered in this guide:
@z

@x
- Start with a base image that you trust. Pay attention to the Official image and
  Verified Publisher badges when you choose your base images.
- Secure your code and its dependencies.
- Select a minimal base image which contains only the required packages.
- Use multi-stage builds to optimize your image.
- Ensure you carefully monitor and manage the tools and dependencies you add to
  your image.
- Ensure you scan images at multiple stages during your development lifecycle.
- Check your images frequently for vulnerabilities.
@y
- Start with a base image that you trust. Pay attention to the Official image and
  Verified Publisher badges when you choose your base images.
- Secure your code and its dependencies.
- Select a minimal base image which contains only the required packages.
- Use multi-stage builds to optimize your image.
- Ensure you carefully monitor and manage the tools and dependencies you add to
  your image.
- Ensure you scan images at multiple stages during your development lifecycle.
- Check your images frequently for vulnerabilities.
@z
