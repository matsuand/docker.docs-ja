%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
﻿amd64: |
  AMD64 is AMD's 64-bit extension of Intel's x86 architecture, and is also
  referred to as x86_64 (or x86-64).
@y
amd64: |
  AMD64 is AMD's 64-bit extension of Intel's x86 architecture, and is also
  referred to as x86_64 (or x86-64).
@z

@x
arm64: |
  ARM64 is the 64-bit extension of the ARM CPU architecture. arm64 architecture
  is used in Apple silicon machines.
@y
arm64: |
  ARM64 is the 64-bit extension of the ARM CPU architecture. arm64 architecture
  is used in Apple silicon machines.
@z

@x
btrfs: |
  btrfs (B-tree file system) is a Linux [filesystem](#filesystem) that Docker
  supports as a storage backend. It is a [copy-on-write](https://en.wikipedia.org/wiki/Copy-on-write) filesystem.
@y
btrfs: |
  btrfs (B-tree file system) is a Linux [filesystem](#filesystem) that Docker
  supports as a storage backend. It is a [copy-on-write](https://en.wikipedia.org/wiki/Copy-on-write) filesystem.
@z

@x
build: |
  Build is the process of building Docker images using a [Dockerfile](#dockerfile).
  The build uses a Dockerfile and a "context". The context is the set of files in the directory in which the image is built.
@y
build: |
  Build is the process of building Docker images using a [Dockerfile](#dockerfile).
  The build uses a Dockerfile and a "context". The context is the set of files in the directory in which the image is built.
@z

@x
cgroups: |
  cgroups is a Linux kernel feature that limits, accounts for, and isolates
  the resource usage (CPU, memory, disk I/O, network, etc.) of a collection
  of processes. Docker relies on cgroups to control and isolate resource limits.

  *Also known as control groups*
@y
cgroups: |
  cgroups is a Linux kernel feature that limits, accounts for, and isolates
  the resource usage (CPU, memory, disk I/O, network, etc.) of a collection
  of processes. Docker relies on cgroups to control and isolate resource limits.

  *Also known as control groups*
@z

@x
cluster: |
  A cluster is a group of machines that work together to run workloads and provide high availability.
@y
cluster: |
  A cluster is a group of machines that work together to run workloads and provide high availability.
@z

@x
Compose: |
  [Compose](https://github.com/docker/compose) is a tool for defining and
  running complex applications with Docker. With Compose, you define a
  multi-container application in a single file, then spin your
  application up in a single command which does everything that needs to
  be done to get it running.

  *Also known as Docker Compose*
@y
Compose: |
  [Compose](https://github.com/docker/compose) is a tool for defining and
  running complex applications with Docker. With Compose, you define a
  multi-container application in a single file, then spin your
  application up in a single command which does everything that needs to
  be done to get it running.

  *Also known as Docker Compose*
@z

@x
copy-on-write: |
  Docker uses a
  [copy-on-write](/engine/storage/drivers/#the-copy-on-write-cow-strategy)
  technique and a [union file system](#union-file-system) for both images and
  containers to optimize resources and speed performance. Multiple copies of an
  entity share the same instance and each one makes only specific changes to its
  unique layer.
@y
copy-on-write: |
  Docker uses a
  [copy-on-write](__SUBDIR__/engine/storage/drivers/#the-copy-on-write-cow-strategy)
  technique and a [union file system](#union-file-system) for both images and
  containers to optimize resources and speed performance. Multiple copies of an
  entity share the same instance and each one makes only specific changes to its
  unique layer.
@z

@x
  Multiple containers can share access to the same image, and make
  container-specific changes on a writable layer which is deleted when
  the container is removed. This speeds up container start times and performance.
@y
  Multiple containers can share access to the same image, and make
  container-specific changes on a writable layer which is deleted when
  the container is removed. This speeds up container start times and performance.
@z

@x
  Images are essentially layers of filesystems typically predicated on a base
  image under a writable layer, and built up with layers of differences from the
  base image. This minimizes the footprint of the image and enables shared
  development.
@y
  Images are essentially layers of filesystems typically predicated on a base
  image under a writable layer, and built up with layers of differences from the
  base image. This minimizes the footprint of the image and enables shared
  development.
@z

@x
  For more about copy-on-write in the context of Docker, see [Understand images,
  containers, and storage
  drivers](/engine/storage/drivers/).
@y
  For more about copy-on-write in the context of Docker, see [Understand images,
  containers, and storage
  drivers](__SUBDIR__/engine/storage/drivers/).
@z

@x
container: |
  A container is a runtime instance of a [docker image](#image).
@y
container: |
  A container is a runtime instance of a [docker image](#image).
@z

@x
  A Docker container consists of
@y
  A Docker container consists of
@z

@x
  - A Docker image
  - An execution environment
  - A standard set of instructions
@y
  - A Docker image
  - An execution environment
  - A standard set of instructions
@z

@x
  The concept is borrowed from shipping containers, which define a standard to ship goods globally. Docker defines a standard to ship software.
@y
  The concept is borrowed from shipping containers, which define a standard to ship goods globally. Docker defines a standard to ship software.
@z

@x
container image: |
   Docker images are the basis of containers. An image is an ordered collection of root filesystem changes and the corresponding execution parameters for use within a container runtime. An image typically contains a union of layered filesystems stacked on top of each other.
@y
container image: |
   Docker images are the basis of containers. An image is an ordered collection of root filesystem changes and the corresponding execution parameters for use within a container runtime. An image typically contains a union of layered filesystems stacked on top of each other.
@z

@x
Docker: |
  The term Docker can refer to

  - The Docker project as a whole, which is a platform for developers and sysadmins to develop, ship, and run applications
  - The docker daemon process running on the host which manages images and containers (also called Docker Engine)
@y
Docker: |
  The term Docker can refer to

  - The Docker project as a whole, which is a platform for developers and sysadmins to develop, ship, and run applications
  - The docker daemon process running on the host which manages images and containers (also called Docker Engine)
@z

@x
Docker Business: |
  Docker Business is a Docker subscription. Docker Business offers centralized management and advanced security features for enterprises that use Docker at scale. It empowers leaders to manage their Docker development environments and accelerate their secure software supply chain initiatives.
@y
Docker Business: |
  Docker Business is a Docker subscription. Docker Business offers centralized management and advanced security features for enterprises that use Docker at scale. It empowers leaders to manage their Docker development environments and accelerate their secure software supply chain initiatives.
@z

@x
Docker Desktop: |
  Docker Desktop is an easy-to-install, lightweight
  Docker development environment. Docker Desktop is available for [Mac](#docker-desktop-for-mac), [Windows](#docker-desktop-for-windows), and [Linux](#docker-desktop-for-linux), providing developers a consistent experience across platforms. Docker Desktop includes Docker Engine, Docker CLI client, Docker Compose, Docker Content Trust, Kubernetes, and Credential Helper.

  Docker Desktop works with your choice of development tools and languages and gives you access to a vast library of certified images and templates in Docker Hub. This enables development teams to extend their environment to rapidly auto-build, continuously integrate, and collaborate using a secure repository.
@y
Docker Desktop: |
  Docker Desktop is an easy-to-install, lightweight
  Docker development environment. Docker Desktop is available for [Mac](#docker-desktop-for-mac), [Windows](#docker-desktop-for-windows), and [Linux](#docker-desktop-for-linux), providing developers a consistent experience across platforms. Docker Desktop includes Docker Engine, Docker CLI client, Docker Compose, Docker Content Trust, Kubernetes, and Credential Helper.

  Docker Desktop works with your choice of development tools and languages and gives you access to a vast library of certified images and templates in Docker Hub. This enables development teams to extend their environment to rapidly auto-build, continuously integrate, and collaborate using a secure repository.
@z

@x
Docker Desktop for Mac: |
  Docker Desktop for Mac is an easy-to-install, lightweight
  Docker development environment designed specifically for the Mac. A native
  Mac application, Docker Desktop for Mac uses the macOS Hypervisor
  framework, networking, and filesystem. It's the best solution if you want
  to build, debug, test, package, and ship Dockerized applications on a
  Mac.
@y
Docker Desktop for Mac: |
  Docker Desktop for Mac is an easy-to-install, lightweight
  Docker development environment designed specifically for the Mac. A native
  Mac application, Docker Desktop for Mac uses the macOS Hypervisor
  framework, networking, and filesystem. It's the best solution if you want
  to build, debug, test, package, and ship Dockerized applications on a
  Mac.
@z

@x
Docker Desktop for Windows: |
  Docker Desktop for Windows is an
  easy-to-install, lightweight Docker development environment designed
  specifically for Windows systems that support WSL 2 and Microsoft Hyper-V.
  Docker Desktop for Windows uses WSL 2 or Hyper-V for
  virtualization. Docker Desktop for Windows is the best solution if you want to build, debug, test, package, and ship Dockerized applications from Windows machines.
@y
Docker Desktop for Windows: |
  Docker Desktop for Windows is an
  easy-to-install, lightweight Docker development environment designed
  specifically for Windows systems that support WSL 2 and Microsoft Hyper-V.
  Docker Desktop for Windows uses WSL 2 or Hyper-V for
  virtualization. Docker Desktop for Windows is the best solution if you want to build, debug, test, package, and ship Dockerized applications from Windows machines.
@z

@x
Docker Desktop for Linux: |
  Docker Desktop for Linux is an easy-to-install, lightweight Docker development environment designed specifically for Linux machines. It's the best solution if you want to build, debug, test, package, and ship Dockerized applications on a Linux machine.
@y
Docker Desktop for Linux: |
  Docker Desktop for Linux is an easy-to-install, lightweight Docker development environment designed specifically for Linux machines. It's the best solution if you want to build, debug, test, package, and ship Dockerized applications on a Linux machine.
@z

@x
Docker Hub: |
  [Docker Hub](https://hub.docker.com/) is a centralized resource for working with Docker and its components. It provides the following services:
@y
Docker Hub: |
  [Docker Hub](https://hub.docker.com/) is a centralized resource for working with Docker and its components. It provides the following services:
@z

@x
  - A registry to host Docker images
  - User authentication
  - Automated image builds and workflow tools such as build triggers and web hooks
  - Integration with GitHub and Bitbucket
  - Security vulnerability scanning
Docker ID: |
  Your free Docker ID grants you access to Docker Hub repositories and some beta programs. All you need is an email address.
Docker Official Images: |
  The Docker Official Images are a curated set of Docker repositories hosted on [Docker Hub](#docker-hub). Docker, Inc. sponsors a dedicated team that is responsible for reviewing and publishing all content in the Docker Official Images. This team works in collaboration with upstream software maintainers, security experts, and the broader Docker community.
Docker Open Source Images: |
  Docker Open Source Images are published and maintained by organizations that are a member of the Docker Open Source Program.
Docker Personal: |
  Docker Personal is a [Docker subscription](#docker-subscription). With its focus on the open-source communities, individual developers, education, and small businesses, Docker Personal will continue to allow free use of Docker components - including the Docker CLI, Docker Compose, Docker Engine, Docker Desktop, Docker Hub, Kubernetes, Docker Build and Docker BuildKit, Docker Official Images, Docker Scan, and more.
Docker Pro: |
  Docker Pro is a [Docker subscription](#docker-subscription). Docker Pro enables individual developers to get more control of their development environment and provides an integrated and reliable developer experience. It reduces the amount of time developers spend on mundane and repetitive tasks and empowers developers to spend more time creating value for their customers.
Docker subscription: |
  Docker subscription tiers, sometimes referred to as plans, include [Personal](#docker-personal), [Pro](#docker-pro), [Team](#docker-team), and [Business](#docker-business). For more details, see [Docker subscription overview](/subscription/details/).
Docker Team: |
  Docker Team is a [Docker subscription](#docker-subscription). Docker Team offers capabilities for collaboration, productivity, and security across organizations. It enables groups of developers to unlock the full power of collaboration and sharing combined with essential security features and team management capabilities.
Docker Trusted Content Program: |
  The Docker Trusted Content Program verifies content through four programs, [Docker Official Images](#docker-official-images), [Docker Verified Publisher Images](#docker-verified-publisher-images), [Docker Open Source Images](#docker-open-source-images), and Custom Official Images.
Docker Verified Publisher Images: |
  Docker Verified Publisher Images are confirmed by Docker to be from a trusted software publishers that are partners in the Verified Publisher program. Docker Verified Publisher Images are identified by the Verified Publisher badge included on the Docker Hub repositories.
Dockerfile: |
  A Dockerfile is a text document that contains all the commands you would
  normally execute manually in order to build a Docker image. Docker can
  build images automatically by reading the instructions from a Dockerfile.
ENTRYPOINT: |
  In a Dockerfile, an `ENTRYPOINT` is an optional definition for the first part
  of the command to be run. If you want your Dockerfile to be runnable without
  specifying additional arguments to the `docker run` command, you must specify
  either `ENTRYPOINT`, `CMD`, or both.
@y
  - A registry to host Docker images
  - User authentication
  - Automated image builds and workflow tools such as build triggers and web hooks
  - Integration with GitHub and Bitbucket
  - Security vulnerability scanning
Docker ID: |
  Your free Docker ID grants you access to Docker Hub repositories and some beta programs. All you need is an email address.
Docker Official Images: |
  The Docker Official Images are a curated set of Docker repositories hosted on [Docker Hub](#docker-hub). Docker, Inc. sponsors a dedicated team that is responsible for reviewing and publishing all content in the Docker Official Images. This team works in collaboration with upstream software maintainers, security experts, and the broader Docker community.
Docker Open Source Images: |
  Docker Open Source Images are published and maintained by organizations that are a member of the Docker Open Source Program.
Docker Personal: |
  Docker Personal is a [Docker subscription](#docker-subscription). With its focus on the open-source communities, individual developers, education, and small businesses, Docker Personal will continue to allow free use of Docker components - including the Docker CLI, Docker Compose, Docker Engine, Docker Desktop, Docker Hub, Kubernetes, Docker Build and Docker BuildKit, Docker Official Images, Docker Scan, and more.
Docker Pro: |
  Docker Pro is a [Docker subscription](#docker-subscription). Docker Pro enables individual developers to get more control of their development environment and provides an integrated and reliable developer experience. It reduces the amount of time developers spend on mundane and repetitive tasks and empowers developers to spend more time creating value for their customers.
Docker subscription: |
  Docker subscription tiers, sometimes referred to as plans, include [Personal](#docker-personal), [Pro](#docker-pro), [Team](#docker-team), and [Business](#docker-business). For more details, see [Docker subscription overview](__SUBDIR__/subscription/details/).
Docker Team: |
  Docker Team is a [Docker subscription](#docker-subscription). Docker Team offers capabilities for collaboration, productivity, and security across organizations. It enables groups of developers to unlock the full power of collaboration and sharing combined with essential security features and team management capabilities.
Docker Trusted Content Program: |
  The Docker Trusted Content Program verifies content through four programs, [Docker Official Images](#docker-official-images), [Docker Verified Publisher Images](#docker-verified-publisher-images), [Docker Open Source Images](#docker-open-source-images), and Custom Official Images.
Docker Verified Publisher Images: |
  Docker Verified Publisher Images are confirmed by Docker to be from a trusted software publishers that are partners in the Verified Publisher program. Docker Verified Publisher Images are identified by the Verified Publisher badge included on the Docker Hub repositories.
Dockerfile: |
  A Dockerfile is a text document that contains all the commands you would
  normally execute manually in order to build a Docker image. Docker can
  build images automatically by reading the instructions from a Dockerfile.
ENTRYPOINT: |
  In a Dockerfile, an `ENTRYPOINT` is an optional definition for the first part
  of the command to be run. If you want your Dockerfile to be runnable without
  specifying additional arguments to the `docker run` command, you must specify
  either `ENTRYPOINT`, `CMD`, or both.
@z

@x
  - If `ENTRYPOINT` is specified, it is set to a single command. Most official
    Docker images have an `ENTRYPOINT` of `/bin/sh` or `/bin/bash`. Even if you
    do not specify `ENTRYPOINT`, you may inherit it from the base image that you
    specify using the `FROM` keyword in your Dockerfile. To override the
    `ENTRYPOINT` at runtime, you can use `--entrypoint`. The following example
    overrides the entrypoint to be `/bin/ls` and sets the `CMD` to `-l /tmp`.
@y
  - If `ENTRYPOINT` is specified, it is set to a single command. Most official
    Docker images have an `ENTRYPOINT` of `/bin/sh` or `/bin/bash`. Even if you
    do not specify `ENTRYPOINT`, you may inherit it from the base image that you
    specify using the `FROM` keyword in your Dockerfile. To override the
    `ENTRYPOINT` at runtime, you can use `--entrypoint`. The following example
    overrides the entrypoint to be `/bin/ls` and sets the `CMD` to `-l /tmp`.
@z

@x
    ```bash
    $ docker run --entrypoint=/bin/ls ubuntu -l /tmp
    ```
@y
    ```bash
    $ docker run --entrypoint=/bin/ls ubuntu -l /tmp
    ```
@z

@x
  - `CMD` is appended to the `ENTRYPOINT`. The `CMD` can be any arbitrary string
    that is valid in terms of the `ENTRYPOINT`, which allows you to pass
    multiple commands or flags at once. To override the `CMD` at runtime, just
    add it after the container name or ID. In the following example, the `CMD`
    is overridden to be `/bin/ls -l /tmp`.
@y
  - `CMD` is appended to the `ENTRYPOINT`. The `CMD` can be any arbitrary string
    that is valid in terms of the `ENTRYPOINT`, which allows you to pass
    multiple commands or flags at once. To override the `CMD` at runtime, just
    add it after the container name or ID. In the following example, the `CMD`
    is overridden to be `/bin/ls -l /tmp`.
@z

@x
    ```bash
    $ docker run ubuntu /bin/ls -l /tmp
    ```
@y
    ```bash
    $ docker run ubuntu /bin/ls -l /tmp
    ```
@z

@x
  In practice, `ENTRYPOINT` is not often overridden. However, specifying the
  `ENTRYPOINT` can make your images more flexible and easier to reuse.
filesystem: |
  A file system is the method an operating system uses to name files
  and assign them locations for efficient storage and retrieval.
@y
  In practice, `ENTRYPOINT` is not often overridden. However, specifying the
  `ENTRYPOINT` can make your images more flexible and easier to reuse.
filesystem: |
  A file system is the method an operating system uses to name files
  and assign them locations for efficient storage and retrieval.
@z

@x
  Examples :
@y
  Examples :
@z

@x
  - Linux : overlay2, extfs, btrfs, zfs
  - Windows : NTFS
  - macOS : APFS
@y
  - Linux : overlay2, extfs, btrfs, zfs
  - Windows : NTFS
  - macOS : APFS
@z

@x
image: |
  Docker images are the basis of [containers](#container). An Image is an
  ordered collection of root filesystem changes and the corresponding
  execution parameters for use within a container runtime. An image typically
  contains a union of layered filesystems stacked on top of each other. An image
  does not have state and it never changes.
@y
image: |
  Docker images are the basis of [containers](#container). An Image is an
  ordered collection of root filesystem changes and the corresponding
  execution parameters for use within a container runtime. An image typically
  contains a union of layered filesystems stacked on top of each other. An image
  does not have state and it never changes.
@z

@x
invitee: |
  People who have been invited to join an [organization](#organization), but have not yet accepted their invitation.
@y
invitee: |
  People who have been invited to join an [organization](#organization), but have not yet accepted their invitation.
@z

@x
layer: |
  In an image, a layer is modification to the image, represented by an instruction in the Dockerfile. Layers are applied in sequence to the base image to create the final image.
  When an image is updated or rebuilt, only layers that change need to be updated, and unchanged layers are cached locally. This is part of why Docker images are so fast and lightweight. The sizes of each layer add up to equal the size of the final image.
@y
layer: |
  In an image, a layer is modification to the image, represented by an instruction in the Dockerfile. Layers are applied in sequence to the base image to create the final image.
  When an image is updated or rebuilt, only layers that change need to be updated, and unchanged layers are cached locally. This is part of why Docker images are so fast and lightweight. The sizes of each layer add up to equal the size of the final image.
@z

@x
libcontainer: |
  libcontainer provides a native Go implementation for creating containers with
  namespaces, cgroups, capabilities, and filesystem access controls. It allows
  you to manage the lifecycle of the container performing additional operations
  after the container is created.
@y
libcontainer: |
  libcontainer provides a native Go implementation for creating containers with
  namespaces, cgroups, capabilities, and filesystem access controls. It allows
  you to manage the lifecycle of the container performing additional operations
  after the container is created.
@z

@x
libnetwork: |
  libnetwork provides a native Go implementation for creating and managing container network namespaces and other network resources. It manages the networking lifecycle of the container performing additional operations after the container is created.
@y
libnetwork: |
  libnetwork provides a native Go implementation for creating and managing container network namespaces and other network resources. It manages the networking lifecycle of the container performing additional operations after the container is created.
@z

@x
member: |
  The people who have received and accepted invitations to join an [organization](#organization). Member can also refer to members of a [team](#team) within an organization.
@y
member: |
  The people who have received and accepted invitations to join an [organization](#organization). Member can also refer to members of a [team](#team) within an organization.
@z

@x
namespace: |
  A [Linux namespace](https://man7.org/linux/man-pages/man7/namespaces.7.html)
  is a Linux kernel feature that isolates and virtualizes system resources. Processes which are restricted to a namespace can only interact with resources or processes that are part of the same namespace. Namespaces
  are an important part of Docker's isolation model. Namespaces exist for each type of resource, including `net` (networking), `mnt` (storage), `pid` (processes), `uts` (hostname control), and `user` (UID mapping). For more information about namespaces, see [Docker run reference](/engine/containers/run/) and [Isolate containers with a user namespace](/engine/security/userns-remap/).
@y
namespace: |
  A [Linux namespace](https://man7.org/linux/man-pages/man7/namespaces.7.html)
  is a Linux kernel feature that isolates and virtualizes system resources. Processes which are restricted to a namespace can only interact with resources or processes that are part of the same namespace. Namespaces
  are an important part of Docker's isolation model. Namespaces exist for each type of resource, including `net` (networking), `mnt` (storage), `pid` (processes), `uts` (hostname control), and `user` (UID mapping). For more information about namespaces, see [Docker run reference](__SUBDIR__/engine/containers/run/) and [Isolate containers with a user namespace](__SUBDIR__/engine/security/userns-remap/).
@z

@x
node: |
  A [node](/engine/swarm/how-swarm-mode-works/nodes/) is a physical or virtual
  machine running an instance of the Docker Engine in [swarm mode](#swarm-mode).
@y
node: |
  A [node](__SUBDIR__/engine/swarm/how-swarm-mode-works/nodes/) is a physical or virtual
  machine running an instance of the Docker Engine in [swarm mode](#swarm-mode).
@z

@x
  Manager nodes perform swarm management and orchestration duties. By default manager nodes are also worker nodes.
@y
  Manager nodes perform swarm management and orchestration duties. By default manager nodes are also worker nodes.
@z

@x
  Worker nodes execute tasks.
organization: |
  An organization is a collection of teams and repositories that can be managed together. Docker users become members of an organization when they are assigned to at least one team in the organization.
organization name: |
  The organization name, sometimes referred to as the organization namespace or the org ID, is the unique identifier of a Docker organization.
overlay network driver: |
  Overlay network driver provides out of the box multi-host network connectivity
  for Docker containers in a cluster.
overlay storage driver: |
  OverlayFS is a [filesystem](#filesystem) service for Linux which implements a
  [union mount](https://en.wikipedia.org/wiki/Union_mount) for other file systems.
  It is supported by the Docker daemon as a storage driver.
base image: |
  A base image is an image you designate in a `FROM` directive in a Dockerfile.
  It defines the starting point for your build.
  Dockerfile instructions create additional layers on top of the base image.
  A Dockerfile with the `FROM scratch` directive uses an empty base image.
persistent storage: |
  Persistent storage or volume storage provides a way for a user to add a
  persistent layer to the running container's file system. This persistent layer
  could live on the container host or an external device. The lifecycle of this
  persistent layer is not connected to the lifecycle of the container, allowing
  a user to retain state.
registry: |
  A Registry is a hosted service containing [repositories](#repository) of [images](#image) which responds to the Registry API.
@y
  Worker nodes execute tasks.
organization: |
  An organization is a collection of teams and repositories that can be managed together. Docker users become members of an organization when they are assigned to at least one team in the organization.
organization name: |
  The organization name, sometimes referred to as the organization namespace or the org ID, is the unique identifier of a Docker organization.
overlay network driver: |
  Overlay network driver provides out of the box multi-host network connectivity
  for Docker containers in a cluster.
overlay storage driver: |
  OverlayFS is a [filesystem](#filesystem) service for Linux which implements a
  [union mount](https://en.wikipedia.org/wiki/Union_mount) for other file systems.
  It is supported by the Docker daemon as a storage driver.
base image: |
  A base image is an image you designate in a `FROM` directive in a Dockerfile.
  It defines the starting point for your build.
  Dockerfile instructions create additional layers on top of the base image.
  A Dockerfile with the `FROM scratch` directive uses an empty base image.
persistent storage: |
  Persistent storage or volume storage provides a way for a user to add a
  persistent layer to the running container's file system. This persistent layer
  could live on the container host or an external device. The lifecycle of this
  persistent layer is not connected to the lifecycle of the container, allowing
  a user to retain state.
registry: |
  A Registry is a hosted service containing [repositories](#repository) of [images](#image) which responds to the Registry API.
@z

@x
  The default registry can be accessed using a browser at [Docker Hub](#docker-hub) or using the `docker search` command.
repository: |
  A repository is a set of Docker images. A repository can be shared by pushing it to a [registry](#registry) server. The different images in the repository can be labeled using [tags](#tag).
@y
  The default registry can be accessed using a browser at [Docker Hub](#docker-hub) or using the `docker search` command.
repository: |
  A repository is a set of Docker images. A repository can be shared by pushing it to a [registry](#registry) server. The different images in the repository can be labeled using [tags](#tag).
@z

@x
  Here is an example of the shared [nginx repository](https://hub.docker.com/_/nginx/) and its [tags](https://hub.docker.com/r/library/nginx/tags/).
SSH: |
  SSH (secure shell) is a secure protocol for accessing remote machines and applications.
  It provides authentication and encrypts data communication over insecure networks such as the Internet. SSH uses public/private key pairs to authenticate logins.
seats: |
  The number of seats refers to the number of planned members within an [organization](#organization).
service: |
  A [service](/engine/swarm/how-swarm-mode-works/services/) is the definition of how you want to run your application containers in a swarm. At the most basic level, a service  defines which container image to run in the swarm and which commands to run in the container. For orchestration purposes, the service defines the "desired state", meaning how many containers to run as tasks and constraints for deploying the containers.
@y
  Here is an example of the shared [nginx repository](https://hub.docker.com/_/nginx/) and its [tags](https://hub.docker.com/r/library/nginx/tags/).
SSH: |
  SSH (secure shell) is a secure protocol for accessing remote machines and applications.
  It provides authentication and encrypts data communication over insecure networks such as the Internet. SSH uses public/private key pairs to authenticate logins.
seats: |
  The number of seats refers to the number of planned members within an [organization](#organization).
service: |
  A [service](__SUBDIR__/engine/swarm/how-swarm-mode-works/services/) is the definition of how you want to run your application containers in a swarm. At the most basic level, a service  defines which container image to run in the swarm and which commands to run in the container. For orchestration purposes, the service defines the "desired state", meaning how many containers to run as tasks and constraints for deploying the containers.
@z

@x
  Frequently a service is a microservice within the context of some larger
  application. Examples of services might include an HTTP server, a database, or
  any other type of executable program that you wish to run in a distributed
  environment.
@y
  Frequently a service is a microservice within the context of some larger
  application. Examples of services might include an HTTP server, a database, or
  any other type of executable program that you wish to run in a distributed
  environment.
@z

@x
service account: |
  A service account is a Docker ID used for automated management of container images or containerized applications. Service accounts are typically used in automated workflows, and do not share Docker IDs with the members in a Docker Team or Docker Business subscription plan.
@y
service account: |
  A service account is a Docker ID used for automated management of container images or containerized applications. Service accounts are typically used in automated workflows, and do not share Docker IDs with the members in a Docker Team or Docker Business subscription plan.
@z

@x
service discovery: |
  Swarm mode [container discovery](/engine/network/drivers/overlay/#container-discovery) is a DNS component internal to the swarm that automatically assigns each service on an overlay network in the swarm a VIP and DNS entry. Containers on the network share DNS mappings for the service through gossip so any container on the network can access the service through its service name.
@y
service discovery: |
  Swarm mode [container discovery](__SUBDIR__/engine/network/drivers/overlay/#container-discovery) is a DNS component internal to the swarm that automatically assigns each service on an overlay network in the swarm a VIP and DNS entry. Containers on the network share DNS mappings for the service through gossip so any container on the network can access the service through its service name.
@z

@x
  You don’t need to expose service-specific ports to make the service available to other services on the same overlay network. The swarm’s internal load balancer automatically distributes requests to the service VIP among the active tasks.
swarm: |
  A [swarm](/engine/swarm/) is a cluster of one or more Docker Engines running in [swarm mode](#swarm-mode).
swarm mode: |
  [Swarm mode](/engine/swarm/) refers to cluster management and orchestration
  features embedded in Docker Engine. When you initialize a new swarm (cluster) or join nodes to a swarm, the Docker Engine runs in swarm mode.
tag: |
  A tag is a label applied to a Docker image in a [repository](#repository).
  Tags are how various images in a repository are distinguished from each other.
task: |
  A [task](/engine/swarm/how-swarm-mode-works/services/#tasks-and-scheduling) is the atomic unit of scheduling within a swarm. A task carries a Docker container and the commands to run inside the container. Manager nodes assign tasks to worker nodes according to the number of replicas set in the service scale.
team: |
  A team is a group of Docker users that belong to an [organization](#organization). An organization can have multiple teams.
Union file system: |
  Union file systems implement a [union
  mount](https://en.wikipedia.org/wiki/Union_mount) and operate by creating
  layers. Docker uses union file systems in conjunction with
  [copy-on-write](#copy-on-write) techniques to provide the building blocks for
  containers, making them very lightweight and fast.
@y
  You don’t need to expose service-specific ports to make the service available to other services on the same overlay network. The swarm’s internal load balancer automatically distributes requests to the service VIP among the active tasks.
swarm: |
  A [swarm](__SUBDIR__/engine/swarm/) is a cluster of one or more Docker Engines running in [swarm mode](#swarm-mode).
swarm mode: |
  [Swarm mode](__SUBDIR__/engine/swarm/) refers to cluster management and orchestration
  features embedded in Docker Engine. When you initialize a new swarm (cluster) or join nodes to a swarm, the Docker Engine runs in swarm mode.
tag: |
  A tag is a label applied to a Docker image in a [repository](#repository).
  Tags are how various images in a repository are distinguished from each other.
task: |
  A [task](__SUBDIR__/engine/swarm/how-swarm-mode-works/services/#tasks-and-scheduling) is the atomic unit of scheduling within a swarm. A task carries a Docker container and the commands to run inside the container. Manager nodes assign tasks to worker nodes according to the number of replicas set in the service scale.
team: |
  A team is a group of Docker users that belong to an [organization](#organization). An organization can have multiple teams.
Union file system: |
  Union file systems implement a [union
  mount](https://en.wikipedia.org/wiki/Union_mount) and operate by creating
  layers. Docker uses union file systems in conjunction with
  [copy-on-write](#copy-on-write) techniques to provide the building blocks for
  containers, making them very lightweight and fast.
@z

@x
  For more on Docker and union file systems, see [Docker and OverlayFS in
  practice](/engine/storage/drivers/overlayfs-driver/).
@y
  For more on Docker and union file systems, see [Docker and OverlayFS in
  practice](__SUBDIR__/engine/storage/drivers/overlayfs-driver/).
@z

@x
  Example implementations of union file systems are
  [UnionFS](https://en.wikipedia.org/wiki/UnionFS) and
  [OverlayFS](https://en.wikipedia.org/wiki/OverlayFS).
virtual machine: |
  A virtual machine is a program that emulates a complete computer and imitates dedicated hardware.
  It shares physical hardware resources with other users but isolates the operating system. The end user has the same experience on a Virtual Machine as they would have on dedicated hardware.
@y
  Example implementations of union file systems are
  [UnionFS](https://en.wikipedia.org/wiki/UnionFS) and
  [OverlayFS](https://en.wikipedia.org/wiki/OverlayFS).
virtual machine: |
  A virtual machine is a program that emulates a complete computer and imitates dedicated hardware.
  It shares physical hardware resources with other users but isolates the operating system. The end user has the same experience on a Virtual Machine as they would have on dedicated hardware.
@z

@x
  Compared to containers, a virtual machine is heavier to run, provides more isolation, gets its own set of resources and does minimal sharing.
@y
  Compared to containers, a virtual machine is heavier to run, provides more isolation, gets its own set of resources and does minimal sharing.
@z

@x
  *Also known as VM*
volume: |
  A volume is a specially-designated directory within one or more containers
  that bypasses the Union File System. Volumes are designed to persist data,
  independent of the container's life cycle. Docker therefore never automatically deletes volumes when you remove a container, nor will it "garbage collect" volumes that are no longer referenced by a container.
  *Also known as: data volume*
@y
  *Also known as VM*
volume: |
  A volume is a specially-designated directory within one or more containers
  that bypasses the Union File System. Volumes are designed to persist data,
  independent of the container's life cycle. Docker therefore never automatically deletes volumes when you remove a container, nor will it "garbage collect" volumes that are no longer referenced by a container.
  *Also known as: data volume*
@z

@x
  There are three types of volumes: *host, anonymous, and named*:
@y
  There are three types of volumes: *host, anonymous, and named*:
@z

@x
  - A **host volume** lives on the Docker host's filesystem and can be accessed from within the container.
@y
  - A **host volume** lives on the Docker host's filesystem and can be accessed from within the container.
@z

@x
  - A **named volume** is a volume which Docker manages where on disk the volume is created, but it is given a name.
@y
  - A **named volume** is a volume which Docker manages where on disk the volume is created, but it is given a name.
@z

@x
  - An **anonymous volume** is similar to a named volume, however, it can be difficult to refer to the same volume over time when it is an anonymous volume. Docker handles where the files are stored.
x86_64: |
  x86_64 (or x86-64) refers to a 64-bit instruction set invented by AMD as an
  extension of Intel's x86 architecture. AMD calls its x86_64 architecture,
  AMD64, and Intel calls its implementation, Intel 64.
@y
  - An **anonymous volume** is similar to a named volume, however, it can be difficult to refer to the same volume over time when it is an anonymous volume. Docker handles where the files are stored.
x86_64: |
  x86_64 (or x86-64) refers to a 64-bit instruction set invented by AMD as an
  extension of Intel's x86 architecture. AMD calls its x86_64 architecture,
  AMD64, and Intel calls its implementation, Intel 64.
@z
