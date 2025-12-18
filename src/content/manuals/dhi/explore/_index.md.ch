%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
linktitle: Explore
title: Explore Docker Hardened Images
description: Learn about Docker Hardened Images, their purpose, how they are built and tested, and the shared responsibility model for security.
@y
linktitle: Explore
title: Explore Docker Hardened Images
description: Learn about Docker Hardened Images, their purpose, how they are built and tested, and the shared responsibility model for security.
@z

% grid_about:

@x
    - title: What are hardened images and why use them?
      description: Learn what a hardened image is, how Docker Hardened Images are built, what sets them apart from typical base and application images, and why you should use them.
      icon: info
      link: /dhi/explore/what/
@y
    - title: What are hardened images and why use them?
      description: Learn what a hardened image is, how Docker Hardened Images are built, what sets them apart from typical base and application images, and why you should use them.
      icon: info
      link: __SUBDIR__/dhi/explore/what/
@z

@x
    - title: Build process
      description: Learn how Docker builds, tests, and maintains Docker Hardened Images through an automated, security-focused pipeline.
      icon: build
      link: /dhi/explore/build-process/
@y
    - title: Build process
      description: Learn how Docker builds, tests, and maintains Docker Hardened Images through an automated, security-focused pipeline.
      icon: build
      link: __SUBDIR__/dhi/explore/build-process/
@z

@x
    - title: Image testing
      description: See how Docker Hardened Images are automatically tested for standards compliance, functionality, and security.
      icon: science
      link: /dhi/explore/test/
@y
    - title: Image testing
      description: See how Docker Hardened Images are automatically tested for standards compliance, functionality, and security.
      icon: science
      link: __SUBDIR__/dhi/explore/test/
@z

@x
    - title: Responsibility overview
      description: Understand Docker's role and your responsibilities when using Docker Hardened Images as part of your secure software supply chain.
      icon: group
      link: /dhi/explore/responsibility/
@y
    - title: Responsibility overview
      description: Understand Docker's role and your responsibilities when using Docker Hardened Images as part of your secure software supply chain.
      icon: group
      link: __SUBDIR__/dhi/explore/responsibility/
@z

@x
    - title: Image types
      description: Learn about the different image types, distributions, and variants offered in the Docker Hardened Images catalog.
      icon: view_module
      link: /dhi/explore/available/
@y
    - title: Image types
      description: Learn about the different image types, distributions, and variants offered in the Docker Hardened Images catalog.
      icon: view_module
      link: __SUBDIR__/dhi/explore/available/
@z

@x
    - title: Give feedback
      icon: question_exchange
      description: Docker welcomes all contributions and feedback.
      link: /dhi/explore/feedback
@y
    - title: Give feedback
      icon: question_exchange
      description: Docker welcomes all contributions and feedback.
      link: __SUBDIR__/dhi/explore/feedback
@z

@x
Docker Hardened Images (DHI) are minimal, secure, and production-ready container
base and application images maintained by Docker. Designed to reduce
vulnerabilities and simplify compliance, DHI integrates easily into your
existing Docker-based workflows with little to no retooling required.
@y
Docker Hardened Images (DHI) are minimal, secure, and production-ready container
base and application images maintained by Docker. Designed to reduce
vulnerabilities and simplify compliance, DHI integrates easily into your
existing Docker-based workflows with little to no retooling required.
@z

@x
This section helps you understand what Docker Hardened Images are, how they're
built and tested, the different types available, and how responsibility is
shared between Docker and you as a user. For a complete list of DHI features and
capabilities, see [Features](/dhi/features/).
@y
This section helps you understand what Docker Hardened Images are, how they're
built and tested, the different types available, and how responsibility is
shared between Docker and you as a user. For a complete list of DHI features and
capabilities, see [Features](__SUBDIR__/dhi/features/).
@z

@x
## Learn more about Docker Hardened Images
@y
## Learn more about Docker Hardened Images
@z

@x
{{< grid
  items="grid_about"
>}}
@y
{{< grid
  items="grid_about"
>}}
@z
