%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
linktitle: Image types
title: Available types of Docker Hardened Images
description: Learn about the different image types, distributions, and variants offered in the Docker Hardened Images catalog.
keywords: docker hardened images, distroless containers, distroless images, docker distroless, alpine base image, debian base image, development containers, runtime containers, secure base image, multi-stage builds
@y
linktitle: Image types
title: Available types of Docker Hardened Images
description: Learn about the different image types, distributions, and variants offered in the Docker Hardened Images catalog.
keywords: docker hardened images, distroless containers, distroless images, docker distroless, alpine base image, debian base image, development containers, runtime containers, secure base image, multi-stage builds
@z

@x
Docker Hardened Images (DHI) is a comprehensive catalog of
security-hardened container images built to meet diverse
development and production needs.
@y
Docker Hardened Images (DHI) is a comprehensive catalog of
security-hardened container images built to meet diverse
development and production needs.
@z

@x
## Framework and application images
@y
## Framework and application images
@z

@x
DHI includes a selection of popular frameworks and application images, each
hardened and maintained to ensure security and compliance. These images
integrate seamlessly into existing workflows, allowing developers to focus on
building applications without compromising on security.
@y
DHI includes a selection of popular frameworks and application images, each
hardened and maintained to ensure security and compliance. These images
integrate seamlessly into existing workflows, allowing developers to focus on
building applications without compromising on security.
@z

@x
For example, you might find repositories like the following in the DHI catalog:
@y
For example, you might find repositories like the following in the DHI catalog:
@z

@x
- `node`: framework for Node.js applications
- `python`: framework for Python applications
- `nginx`: web server image
@y
- `node`: framework for Node.js applications
- `python`: framework for Python applications
- `nginx`: web server image
@z

@x
## Compatibility options
@y
## Compatibility options
@z

@x
Docker Hardened Images are available in different base image options, giving you
flexibility to choose the best match for your environment and workload
requirements:
@y
Docker Hardened Images are available in different base image options, giving you
flexibility to choose the best match for your environment and workload
requirements:
@z

@x
- Debian-based images: A good fit if you're already working in glibc-based
  environments. Debian is widely used and offers strong compatibility across
  many language ecosystems and enterprise systems.
@y
- Debian-based images: A good fit if you're already working in glibc-based
  environments. Debian is widely used and offers strong compatibility across
  many language ecosystems and enterprise systems.
@z

@x
- Alpine-based images: A smaller and more lightweight option using musl libc.
  These images tend to be small and are therefore faster to pull and have a
  reduced footprint.
@y
- Alpine-based images: A smaller and more lightweight option using musl libc.
  These images tend to be small and are therefore faster to pull and have a
  reduced footprint.
@z

@x
Each image maintains a minimal and secure runtime layer by removing
non-essential components like shells, package managers, and debugging tools.
This helps reduce the attack surface while retaining compatibility with common
runtime environments.
@y
Each image maintains a minimal and secure runtime layer by removing
non-essential components like shells, package managers, and debugging tools.
This helps reduce the attack surface while retaining compatibility with common
runtime environments.
@z

@x
Example tags include:
@y
Example tags include:
@z

@x
- `3.9.23-alpine3.21`: Alpine-based image for Python 3.9.23
- `3.9.23-debian12`: Debian-based image for Python 3.9.23
@y
- `3.9.23-alpine3.21`: Alpine-based image for Python 3.9.23
- `3.9.23-debian12`: Debian-based image for Python 3.9.23
@z

@x
If you're not sure which to choose, start with the base you're already familiar
with. Debian tends to offer the broadest compatibility.
@y
If you're not sure which to choose, start with the base you're already familiar
with. Debian tends to offer the broadest compatibility.
@z

@x
## Development and runtime variants
@y
## Development and runtime variants
@z

@x
To accommodate different stages of the application lifecycle, DHI offers all
language framework images and select application images in two variants:
@y
To accommodate different stages of the application lifecycle, DHI offers all
language framework images and select application images in two variants:
@z

@x
- Development (dev) images: Equipped with necessary development tools and
libraries, these images facilitate the building and testing of applications in a
secure environment. They include a shell, package manager, a root user, and
other tools needed for development.
@y
- Development (dev) images: Equipped with necessary development tools and
libraries, these images facilitate the building and testing of applications in a
secure environment. They include a shell, package manager, a root user, and
other tools needed for development.
@z

@x
- Runtime images: Stripped of development tools, these images contain only the
essential components needed to run applications, ensuring a minimal attack
surface in production.
@y
- Runtime images: Stripped of development tools, these images contain only the
essential components needed to run applications, ensuring a minimal attack
surface in production.
@z

@x
This separation supports multi-stage builds, enabling developers to compile code
in a secure build environment and deploy it using a lean runtime image.
@y
This separation supports multi-stage builds, enabling developers to compile code
in a secure build environment and deploy it using a lean runtime image.
@z

@x
For example, you might find tags like the following in a DHI repository:
@y
For example, you might find tags like the following in a DHI repository:
@z

@x
- `3.9.23-debian12`: runtime image for Python 3.9.23
- `3.9.23-debian12-dev`: development image for Python 3.9.23
@y
- `3.9.23-debian12`: runtime image for Python 3.9.23
- `3.9.23-debian12-dev`: development image for Python 3.9.23
@z

@x
## FIPS variants
@y
## FIPS variants
@z

@x
Some Docker Hardened Images include a `-fips` variant. These variants use
cryptographic modules that have been validated under [FIPS
140](../core-concepts/fips.md), a U.S. government standard for secure
cryptographic operations.
@y
Some Docker Hardened Images include a `-fips` variant. These variants use
cryptographic modules that have been validated under [FIPS
140](../core-concepts/fips.md), a U.S. government standard for secure
cryptographic operations.
@z

@x
FIPS variants are designed to help organizations meet regulatory and compliance
requirements related to cryptographic use in sensitive or regulated
environments.
@y
FIPS variants are designed to help organizations meet regulatory and compliance
requirements related to cryptographic use in sensitive or regulated
environments.
@z

@x
You can recognize FIPS variants by their tag that includes `-fips`.
@y
You can recognize FIPS variants by their tag that includes `-fips`.
@z

@x
For example:
- `3.13-fips`: FIPS variant of the Python 3.13 image
- `3.9.23-debian12-fips`: FIPS variant of the Debian-based Python 3.9.23 image
@y
For example:
- `3.13-fips`: FIPS variant of the Python 3.13 image
- `3.9.23-debian12-fips`: FIPS variant of the Debian-based Python 3.9.23 image
@z

@x
FIPS variants can be used in the same way as any other Docker Hardened Image and
are ideal for teams operating in regulated industries or under compliance
frameworks that require cryptographic validation.
@y
FIPS variants can be used in the same way as any other Docker Hardened Image and
are ideal for teams operating in regulated industries or under compliance
frameworks that require cryptographic validation.
@z
