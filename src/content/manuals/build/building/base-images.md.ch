%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Base images
@y
title: Base images
@z

@x
description: Learn about base images and how they're created
keywords: images, base image, examples
@y
description: Learn about base images and how they're created
keywords: images, base image, examples
@z

@x
All Dockerfiles start from a base image.
A base is the image that your image extends.
It refers to the contents of the `FROM` instruction in the Dockerfile.
@y
All Dockerfiles start from a base image.
A base is the image that your image extends.
It refers to the contents of the `FROM` instruction in the Dockerfile.
@z

@x
```dockerfile
FROM debian
```
@y
```dockerfile
FROM debian
```
@z

@x
For most cases, you don't need to create your own base image. Docker Hub
contains a vast library of Docker images that are suitable for use as a base
image in your build. [Docker Official
Images](../../docker-hub/image-library/trusted-content.md#docker-official-images)
have clear documentation, promote best practices, and are regularly updated.
There are also [Docker Verified
Publisher](../../docker-hub/image-library/trusted-content.md#verified-publisher-images)
images, created by trusted publishing partners, verified by Docker.
@y
For most cases, you don't need to create your own base image. Docker Hub
contains a vast library of Docker images that are suitable for use as a base
image in your build. [Docker Official
Images](../../docker-hub/image-library/trusted-content.md#docker-official-images)
have clear documentation, promote best practices, and are regularly updated.
There are also [Docker Verified
Publisher](../../docker-hub/image-library/trusted-content.md#verified-publisher-images)
images, created by trusted publishing partners, verified by Docker.
@z

@x
## Create a base image
@y
## Create a base image
@z

@x
If you need to completely control the contents of your image, you can create
your own base image from a Linux distribution of your choosing, or use the
special `FROM scratch` base:
@y
If you need to completely control the contents of your image, you can create
your own base image from a Linux distribution of your choosing, or use the
special `FROM scratch` base:
@z

@x
```dockerfile
FROM scratch
```
@y
```dockerfile
FROM scratch
```
@z

@x
The `scratch` image is typically used to create minimal images containing only
just what an application needs. See [Create a minimal base image using scratch](#create-a-minimal-base-image-using-scratch).
@y
The `scratch` image is typically used to create minimal images containing only
just what an application needs. See [Create a minimal base image using scratch](#create-a-minimal-base-image-using-scratch).
@z

@x
To create a distribution base image, you can use a root filesystem, packaged as
a `tar` file, and import it to Docker with `docker import`. The process for
creating your own base image depends on the Linux distribution you want to
package. See [Create a full image using tar](#create-a-full-image-using-tar).
@y
To create a distribution base image, you can use a root filesystem, packaged as
a `tar` file, and import it to Docker with `docker import`. The process for
creating your own base image depends on the Linux distribution you want to
package. See [Create a full image using tar](#create-a-full-image-using-tar).
@z

@x
## Create a minimal base image using scratch
@y
## Create a minimal base image using scratch
@z

@x
The reserved, minimal `scratch` image serves as a starting point for
building containers. Using the `scratch` image signals to the build process
that you want the next command in the `Dockerfile` to be the first filesystem
layer in your image.
@y
The reserved, minimal `scratch` image serves as a starting point for
building containers. Using the `scratch` image signals to the build process
that you want the next command in the `Dockerfile` to be the first filesystem
layer in your image.
@z

@x
While `scratch` appears in Docker's [repository on Docker Hub](https://hub.docker.com/_/scratch),
you can't pull it, run it, or tag any image with the name `scratch`.
Instead, you can refer to it in your `Dockerfile`.
For example, to create a minimal container using `scratch`:
@y
While `scratch` appears in Docker's [repository on Docker Hub](https://hub.docker.com/_/scratch),
you can't pull it, run it, or tag any image with the name `scratch`.
Instead, you can refer to it in your `Dockerfile`.
For example, to create a minimal container using `scratch`:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM scratch
ADD hello /
CMD ["/hello"]
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM scratch
ADD hello /
CMD ["/hello"]
```
@z

@x
Assuming an executable binary named `hello` exists at the root of the [build context](/manuals/build/concepts/context.md).
You can build this Docker image using the following `docker build` command:
@y
Assuming an executable binary named `hello` exists at the root of the [build context](manuals/build/concepts/context.md).
You can build this Docker image using the following `docker build` command:
@z

@x
```console
$ docker build --tag hello .
```
@y
```console
$ docker build --tag hello .
```
@z

@x
To run your new image, use the `docker run` command:
@y
To run your new image, use the `docker run` command:
@z

@x
```console
$ docker run --rm hello
```
@y
```console
$ docker run --rm hello
```
@z

@x
This example image can only be successfully executed as long as the `hello` binary
doesn't have any runtime dependencies. Computer programs tend to depend on
certain other programs or resources to exist in the runtime environment. For
example:
@y
This example image can only be successfully executed as long as the `hello` binary
doesn't have any runtime dependencies. Computer programs tend to depend on
certain other programs or resources to exist in the runtime environment. For
example:
@z

@x
- Programming language runtimes
- Dynamically linked C libraries
- CA certificates
@y
- Programming language runtimes
- Dynamically linked C libraries
- CA certificates
@z

@x
When building a base image, or any image, this is an important aspect to
consider. And this is why creating a base image using `FROM scratch` can be
difficult, for anything other than small, simple programs. On the other hand,
it's also important to include only the things you need in your image, to
reduce the image size and attack surface.
@y
When building a base image, or any image, this is an important aspect to
consider. And this is why creating a base image using `FROM scratch` can be
difficult, for anything other than small, simple programs. On the other hand,
it's also important to include only the things you need in your image, to
reduce the image size and attack surface.
@z

@x
## Create a full image using tar
@y
## Create a full image using tar
@z

@x
In general, start with a working machine that is running
the distribution you'd like to package as a base image, though that is
not required for some tools like Debian's [Debootstrap](https://wiki.debian.org/Debootstrap),
which you can also use to build Ubuntu images.
@y
In general, start with a working machine that is running
the distribution you'd like to package as a base image, though that is
not required for some tools like Debian's [Debootstrap](https://wiki.debian.org/Debootstrap),
which you can also use to build Ubuntu images.
@z

@x
For example, to create an Ubuntu base image:
@y
For example, to create an Ubuntu base image:
@z

@x
```dockerfile
$ sudo debootstrap focal focal > /dev/null
$ sudo tar -C focal -c . | docker import - focal
@y
```dockerfile
$ sudo debootstrap focal focal > /dev/null
$ sudo tar -C focal -c . | docker import - focal
@z

@x
sha256:81ec9a55a92a5618161f68ae691d092bf14d700129093158297b3d01593f4ee3
@y
sha256:81ec9a55a92a5618161f68ae691d092bf14d700129093158297b3d01593f4ee3
@z

@x
$ docker run focal cat /etc/lsb-release
@y
$ docker run focal cat /etc/lsb-release
@z

@x
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=20.04
DISTRIB_CODENAME=focal
DISTRIB_DESCRIPTION="Ubuntu 20.04 LTS"
```
@y
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=20.04
DISTRIB_CODENAME=focal
DISTRIB_DESCRIPTION="Ubuntu 20.04 LTS"
```
@z

@x
There are more example scripts for creating base images in
[the Moby GitHub repository](https://github.com/moby/moby/blob/master/contrib).
@y
There are more example scripts for creating base images in
[the Moby GitHub repository](https://github.com/moby/moby/blob/master/contrib).
@z

@x
## More resources
@y
## More resources
@z

@x
For more information about building images and writing Dockerfiles, see:
@y
For more information about building images and writing Dockerfiles, see:
@z

@x
* [Dockerfile reference](/reference/dockerfile.md)
* [Dockerfile best practices](/manuals/build/building/best-practices.md)
* [Docker Official Images](../../docker-hub/image-library/trusted-content.md#docker-official-images)
@y
* [Dockerfile reference](reference/dockerfile.md)
* [Dockerfile best practices](manuals/build/building/best-practices.md)
* [Docker Official Images](../../docker-hub/image-library/trusted-content.md#docker-official-images)
@z
