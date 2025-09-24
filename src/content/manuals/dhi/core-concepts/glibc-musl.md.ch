%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: glibc and musl support in Docker Hardened Images
linktitle: glibc and musl
description: Compare glibc and musl variants of DHIs to choose the right base image for your application’s compatibility, size, and performance needs.
keywords: glibc vs musl, alpine musl image, debian glibc container, docker hardened images compatibility, c library in containers
@y
title: glibc and musl support in Docker Hardened Images
linktitle: glibc and musl
description: Compare glibc and musl variants of DHIs to choose the right base image for your application’s compatibility, size, and performance needs.
keywords: glibc vs musl, alpine musl image, debian glibc container, docker hardened images compatibility, c library in containers
@z

@x
Docker Hardened Images (DHI) are built to prioritize security without
sacrificing compatibility with the broader open source and enterprise software
ecosystem. A key aspect of this compatibility is support for common Linux
standard libraries: `glibc` and `musl`.
@y
Docker Hardened Images (DHI) are built to prioritize security without
sacrificing compatibility with the broader open source and enterprise software
ecosystem. A key aspect of this compatibility is support for common Linux
standard libraries: `glibc` and `musl`.
@z

@x
## What are glibc and musl?
@y
## What are glibc and musl?
@z

@x
When you run Linux-based containers, the image's C library plays a key role in
how applications interact with the operating system. Most modern Linux
distributions rely on one of the following standard C libraries:
@y
When you run Linux-based containers, the image's C library plays a key role in
how applications interact with the operating system. Most modern Linux
distributions rely on one of the following standard C libraries:
@z

@x
- `glibc` (GNU C Library): The standard C library on mainstream distributions
  like Debian, Ubuntu, and Red Hat Enterprise Linux. It is widely supported and
  typically considered the most compatible option across languages, frameworks,
  and enterprise software.
@y
- `glibc` (GNU C Library): The standard C library on mainstream distributions
  like Debian, Ubuntu, and Red Hat Enterprise Linux. It is widely supported and
  typically considered the most compatible option across languages, frameworks,
  and enterprise software.
@z

@x
- `musl`: A lightweight alternative to `glibc`, commonly used in minimal
  distributions like Alpine Linux. While it offers smaller image sizes and
  performance benefits, `musl` is not always fully compatible with software that
  expects `glibc`.
@y
- `musl`: A lightweight alternative to `glibc`, commonly used in minimal
  distributions like Alpine Linux. While it offers smaller image sizes and
  performance benefits, `musl` is not always fully compatible with software that
  expects `glibc`.
@z

@x
## DHI compatibility
@y
## DHI compatibility
@z

@x
DHI images are available in both `glibc`-based (e.g., Debian) and `musl`-based
(e.g., Alpine) variants. For enterprise applications and language runtimes where
compatibility is critical, we recommend using DHI images based on glibc.
@y
DHI images are available in both `glibc`-based (e.g., Debian) and `musl`-based
(e.g., Alpine) variants. For enterprise applications and language runtimes where
compatibility is critical, we recommend using DHI images based on glibc.
@z

@x
## What to choose, glibc or musl?
@y
## What to choose, glibc or musl?
@z

@x
Docker Hardened Images are available in both glibc-based (Debian) and musl-based
(Alpine) variants, allowing you to choose the best fit for your workload.
@y
Docker Hardened Images are available in both glibc-based (Debian) and musl-based
(Alpine) variants, allowing you to choose the best fit for your workload.
@z

@x
Choose Debian-based (`glibc`) images if:
@y
Choose Debian-based (`glibc`) images if:
@z

@x
- You need broad compatibility with enterprise workloads, language runtimes, or
  proprietary software.
- You're using ecosystems like .NET, Java, or Python with native extensions that
  depend on `glibc`.
- You want to minimize the risk of runtime errors due to library
  incompatibilities.
@y
- You need broad compatibility with enterprise workloads, language runtimes, or
  proprietary software.
- You're using ecosystems like .NET, Java, or Python with native extensions that
  depend on `glibc`.
- You want to minimize the risk of runtime errors due to library
  incompatibilities.
@z

@x
Choose Alpine-based (`musl`) images if:
@y
Choose Alpine-based (`musl`) images if:
@z

@x
- You want a minimal footprint with smaller image sizes and reduced surface
  area.
- You're building a custom or tightly controlled application stack where
  dependencies are known and tested.
- You prioritize startup speed and lean deployments over maximum compatibility.
@y
- You want a minimal footprint with smaller image sizes and reduced surface
  area.
- You're building a custom or tightly controlled application stack where
  dependencies are known and tested.
- You prioritize startup speed and lean deployments over maximum compatibility.
@z

@x
If you're unsure, start with a Debian-based image to ensure compatibility, and
evaluate Alpine once you're confident in your application's dependencies.
@y
If you're unsure, start with a Debian-based image to ensure compatibility, and
evaluate Alpine once you're confident in your application's dependencies.
@z
