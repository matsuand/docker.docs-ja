%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Learn about Docker Hub's trusted content.
keywords: Docker Hub, Hub, trusted content
title: Trusted content
@y
description: Learn about Docker Hub's trusted content.
keywords: Docker Hub, Hub, trusted content
title: Trusted content
@z

@x
Docker Hub's trusted content provides a curated selection of high-quality,
secure images designed to give developers confidence in the reliability and
security of the resources they use. These images are stable, regularly updated,
and adhere to industry best practices, making them a strong foundation for
building and deploying applications. Docker Hub's trusted content includes,
Docker Official Images, Verified Publisher images, and Docker-Sponsored Open
Source Software images.
@y
Docker Hub's trusted content provides a curated selection of high-quality,
secure images designed to give developers confidence in the reliability and
security of the resources they use. These images are stable, regularly updated,
and adhere to industry best practices, making them a strong foundation for
building and deploying applications. Docker Hub's trusted content includes,
Docker Official Images, Verified Publisher images, and Docker-Sponsored Open
Source Software images.
@z

@x
## Docker Official Images
@y
## Docker Official Images
@z

@x
The Docker Official Images are a curated set of Docker repositories hosted on
Docker Hub.
@y
The Docker Official Images are a curated set of Docker repositories hosted on
Docker Hub.
@z

@x
Docker recommends you use the Docker Official Images in your projects. These
images have clear documentation, promote best practices, and are regularly
updated. Docker Official Images support most common use cases, making them
perfect for new Docker users. Advanced users can benefit from more specialized
image variants as well as review Docker Official Images as part of your
`Dockerfile` learning process.
@y
Docker recommends you use the Docker Official Images in your projects. These
images have clear documentation, promote best practices, and are regularly
updated. Docker Official Images support most common use cases, making them
perfect for new Docker users. Advanced users can benefit from more specialized
image variants as well as review Docker Official Images as part of your
`Dockerfile` learning process.
@z

@x
> [!NOTE]
>
> Use of Docker Official Images is subject to [Docker's Terms of Service](https://www.docker.com/legal/docker-terms-service/).
@y
> [!NOTE]
>
> Use of Docker Official Images is subject to [Docker's Terms of Service](https://www.docker.com/legal/docker-terms-service/).
@z

@x
These images provide essential base repositories that serve as the starting
point for the majority of users.
@y
These images provide essential base repositories that serve as the starting
point for the majority of users.
@z

@x
These include operating systems such as
[Ubuntu](https://hub.docker.com/_/ubuntu/) and
[Alpine](https://hub.docker.com/_/alpine/), programming language runtimes such as
[Python](https://hub.docker.com/_/python) and
[Node](https://hub.docker.com/_/node), and other essential tools such as
[memcached](https://hub.docker.com/_/memcached) and
[MySQL](https://hub.docker.com/_/mysql).
@y
These include operating systems such as
[Ubuntu](https://hub.docker.com/_/ubuntu/) and
[Alpine](https://hub.docker.com/_/alpine/), programming language runtimes such as
[Python](https://hub.docker.com/_/python) and
[Node](https://hub.docker.com/_/node), and other essential tools such as
[memcached](https://hub.docker.com/_/memcached) and
[MySQL](https://hub.docker.com/_/mysql).
@z

@x
The images are some of the [most secure images](https://www.docker.com/blog/enhancing-security-and-transparency-with-docker-official-images/)
on Docker Hub. This is particularly important as Docker Official Images are
some of the most popular on Docker Hub. Typically, Docker Official images have
few or no packages containing CVEs.
@y
The images are some of the [most secure images](https://www.docker.com/blog/enhancing-security-and-transparency-with-docker-official-images/)
on Docker Hub. This is particularly important as Docker Official Images are
some of the most popular on Docker Hub. Typically, Docker Official images have
few or no packages containing CVEs.
@z

@x
The images exemplify [Dockerfile best practices](/manuals/build/building/best-practices.md)
and provide clear documentation to serve as a reference for other Dockerfile authors.
@y
The images exemplify [Dockerfile best practices](manuals/build/building/best-practices.md)
and provide clear documentation to serve as a reference for other Dockerfile authors.
@z

@x
Images that are part of this program have a special badge on Docker Hub making
it easier for you to identify projects that are part of Docker Official Images.
@y
Images that are part of this program have a special badge on Docker Hub making
it easier for you to identify projects that are part of Docker Official Images.
@z

@x
![Docker official image badge](../images/official-image-badge-iso.png)
@y
![Docker official image badge](../images/official-image-badge-iso.png)
@z

@x
### Supported tags and respective Dockerfile links
@y
### Supported tags and respective Dockerfile links
@z

@x
The repository description for each Docker Official Image contains a
**Supported tags and respective Dockerfile links** section that lists all the
current tags with links to the Dockerfiles that created the image with those
tags. The purpose of this section is to show what image variants are available.
@y
The repository description for each Docker Official Image contains a
**Supported tags and respective Dockerfile links** section that lists all the
current tags with links to the Dockerfiles that created the image with those
tags. The purpose of this section is to show what image variants are available.
@z

@x
![Example: supported tags for Ubuntu](../images/supported_tags.webp)
@y
![Example: supported tags for Ubuntu](../images/supported_tags.webp)
@z

@x
Tags listed on the same line all refer to the same underlying image. Multiple
tags can point to the same image. For example, in the previous screenshot taken
from the `ubuntu` Docker Official Images repository, the tags `24.04`,
`noble-20240225`, `noble`, and `devel` all refer to the same image.
@y
Tags listed on the same line all refer to the same underlying image. Multiple
tags can point to the same image. For example, in the previous screenshot taken
from the `ubuntu` Docker Official Images repository, the tags `24.04`,
`noble-20240225`, `noble`, and `devel` all refer to the same image.
@z

@x
The `latest` tag for a Docker Official Image is often optimized for ease of use
and includes a wide variety of useful software, such as developer and build tools.
By tagging an image as `latest`, the image maintainers are essentially suggesting
that image be used as the default. In other words, if you do not know what tag to
use or are unfamiliar with the underlying software, you should probably start with
the `latest` image. As your understanding of the software and image variants advances,
you may find other image variants better suit your needs.
@y
The `latest` tag for a Docker Official Image is often optimized for ease of use
and includes a wide variety of useful software, such as developer and build tools.
By tagging an image as `latest`, the image maintainers are essentially suggesting
that image be used as the default. In other words, if you do not know what tag to
use or are unfamiliar with the underlying software, you should probably start with
the `latest` image. As your understanding of the software and image variants advances,
you may find other image variants better suit your needs.
@z

@x
### Slim images
@y
### Slim images
@z

@x
A number of language stacks such as
[Node.js](https://hub.docker.com/_/node/),
[Python](https://hub.docker.com/_/python/), and
[Ruby](https://hub.docker.com/_/ruby/) have `slim` tag variants
designed to provide a lightweight, production-ready base image
with fewer packages.
@y
A number of language stacks such as
[Node.js](https://hub.docker.com/_/node/),
[Python](https://hub.docker.com/_/python/), and
[Ruby](https://hub.docker.com/_/ruby/) have `slim` tag variants
designed to provide a lightweight, production-ready base image
with fewer packages.
@z

@x
A typical consumption pattern for `slim`
images is as the base image for the final stage of a
[multi-staged build](https://docs.docker.com/build/building/multi-stage/).
For example, you build your application in the first stage of the build
using the `latest` variant and then copy your application into the final
stage based upon the `slim` variant. Here is an example `Dockerfile`.
@y
A typical consumption pattern for `slim`
images is as the base image for the final stage of a
[multi-staged build](https://docs.docker.com/build/building/multi-stage/).
For example, you build your application in the first stage of the build
using the `latest` variant and then copy your application into the final
stage based upon the `slim` variant. Here is an example `Dockerfile`.
@z

@x
```dockerfile
FROM node:latest AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . ./
FROM node:slim
WORKDIR /app
COPY --from=build /app /app
CMD ["node", "app.js"]
```
@y
```dockerfile
FROM node:latest AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . ./
FROM node:slim
WORKDIR /app
COPY --from=build /app /app
CMD ["node", "app.js"]
```
@z

@x
### Alpine images
@y
### Alpine images
@z

@x
Many Docker Official Images repositories also offer `alpine` variants. These
images are built on top of the [Alpine Linux](https://www.alpinelinux.org/)
distribution rather than Debian or Ubuntu. Alpine Linux is focused on providing
a small, simple, and secure base for container images, and Docker Official
Images `alpine` variants typically aim to install only necessary packages. As a
result, Docker Official Images `alpine` variants are typically even smaller
than `slim` variants.
@y
Many Docker Official Images repositories also offer `alpine` variants. These
images are built on top of the [Alpine Linux](https://www.alpinelinux.org/)
distribution rather than Debian or Ubuntu. Alpine Linux is focused on providing
a small, simple, and secure base for container images, and Docker Official
Images `alpine` variants typically aim to install only necessary packages. As a
result, Docker Official Images `alpine` variants are typically even smaller
than `slim` variants.
@z

@x
The main caveat to note is that Alpine Linux uses [musl libc](https://musl.libc.org/)
instead of [glibc](https://www.gnu.org/software/libc/). Additionally, to
minimize image size, it's uncommon for Alpine-based images to include tools
such as Git or Bash by default. Depending on the depth of libc requirements or
assumptions in your programs, you may find yourself running into issues due to
missing libraries or tools.
@y
The main caveat to note is that Alpine Linux uses [musl libc](https://musl.libc.org/)
instead of [glibc](https://www.gnu.org/software/libc/). Additionally, to
minimize image size, it's uncommon for Alpine-based images to include tools
such as Git or Bash by default. Depending on the depth of libc requirements or
assumptions in your programs, you may find yourself running into issues due to
missing libraries or tools.
@z

@x
When you use Alpine images as a base, consider the following options in order
to make your program compatible with Alpine Linux and musl:
@y
When you use Alpine images as a base, consider the following options in order
to make your program compatible with Alpine Linux and musl:
@z

@x
- Compile your program against musl libc
- Statically link glibc libraries into your program
- Avoid C dependencies altogether (for example, build Go programs without CGO)
- Add the software you need yourself in your Dockerfile.
@y
- Compile your program against musl libc
- Statically link glibc libraries into your program
- Avoid C dependencies altogether (for example, build Go programs without CGO)
- Add the software you need yourself in your Dockerfile.
@z

@x
Refer to the `alpine` image [description](https://hub.docker.com/_/alpine) on
Docker Hub for examples on how to install packages if you are unfamiliar.
@y
Refer to the `alpine` image [description](https://hub.docker.com/_/alpine) on
Docker Hub for examples on how to install packages if you are unfamiliar.
@z

@x
### Codenames
@y
### Codenames
@z

@x
Tags with words that look like Toy Story characters (for example, `bookworm`,
`bullseye`, and `trixie`) or adjectives (such as `focal`, `jammy`, and
`noble`), indicate the codename of the Linux distribution they use as a base
image. Debian release codenames are [based on Toy Story characters](https://en.wikipedia.org/wiki/Debian_version_history#Naming_convention),
and Ubuntu's take the form of "Adjective Animal". For example, the
codename for Ubuntu 24.04 is "Noble Numbat".
@y
Tags with words that look like Toy Story characters (for example, `bookworm`,
`bullseye`, and `trixie`) or adjectives (such as `focal`, `jammy`, and
`noble`), indicate the codename of the Linux distribution they use as a base
image. Debian release codenames are [based on Toy Story characters](https://en.wikipedia.org/wiki/Debian_version_history#Naming_convention),
and Ubuntu's take the form of "Adjective Animal". For example, the
codename for Ubuntu 24.04 is "Noble Numbat".
@z

@x
Linux distribution indicators are helpful because many Docker Official Images
provide variants built upon multiple underlying distribution versions (for
example, `postgres:bookworm` and `postgres:bullseye`).
@y
Linux distribution indicators are helpful because many Docker Official Images
provide variants built upon multiple underlying distribution versions (for
example, `postgres:bookworm` and `postgres:bullseye`).
@z

@x
### Other tags
@y
### Other tags
@z

@x
Docker Official Images tags may contain other hints to the purpose of
their image variant in addition to those described here. Often these
tag variants are explained in the Docker Official Images repository
documentation. Reading through the "How to use this image" and
"Image Variants" sections will help you to understand how to use these
variants.
@y
Docker Official Images tags may contain other hints to the purpose of
their image variant in addition to those described here. Often these
tag variants are explained in the Docker Official Images repository
documentation. Reading through the "How to use this image" and
"Image Variants" sections will help you to understand how to use these
variants.
@z

@x
## Verified Publisher images
@y
## Verified Publisher images
@z

@x
The Docker Verified Publisher program provides high-quality images from
commercial publishers verified by Docker.
@y
The Docker Verified Publisher program provides high-quality images from
commercial publishers verified by Docker.
@z

@x
These images help development teams build secure software supply chains,
minimizing exposure to malicious content early in the process to save time and
money later.
@y
These images help development teams build secure software supply chains,
minimizing exposure to malicious content early in the process to save time and
money later.
@z

@x
Images that are part of this program have a special badge on Docker Hub making
it easier for users to identify projects that Docker has verified as
high-quality commercial publishers.
@y
Images that are part of this program have a special badge on Docker Hub making
it easier for users to identify projects that Docker has verified as
high-quality commercial publishers.
@z

@x
![Docker-Sponsored Open Source badge](../images/verified-publisher-badge-iso.png)
@y
![Docker-Sponsored Open Source badge](../images/verified-publisher-badge-iso.png)
@z

@x
## Docker-Sponsored Open Source Software images
@y
## Docker-Sponsored Open Source Software images
@z

@x
The Docker-Sponsored Open Source Software (OSS) program provides images that are
published and maintained by open-source projects sponsored by Docker.
@y
The Docker-Sponsored Open Source Software (OSS) program provides images that are
published and maintained by open-source projects sponsored by Docker.
@z

@x
Images that are part of this program have a special badge on Docker Hub making
it easier for users to identify projects that Docker has verified as trusted,
secure, and active open-source projects.
@y
Images that are part of this program have a special badge on Docker Hub making
it easier for users to identify projects that Docker has verified as trusted,
secure, and active open-source projects.
@z

@x
![Docker-Sponsored Open Source badge](../images/sponsored-badge-iso.png)
@y
![Docker-Sponsored Open Source badge](../images/sponsored-badge-iso.png)
@z
