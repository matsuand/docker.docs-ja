%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Troubleshoot
description: Resolve common issues when building, running, or debugging Docker Hardened Images, such as non-root behavior, missing shells, and port access.
@y
title: Troubleshoot
description: Resolve common issues when building, running, or debugging Docker Hardened Images, such as non-root behavior, missing shells, and port access.
@z

@x
keywords: troubleshoot hardened image, docker debug container, non-root permission issue, missing shell error, no package manager
@y
keywords: troubleshoot hardened image, docker debug container, non-root permission issue, missing shell error, no package manager
@z

@x
The following are common issues you may encounter while migrating to or using
Docker Hardened Images (DHIs), along with recommended solutions.
@y
The following are common issues you may encounter while migrating to or using
Docker Hardened Images (DHIs), along with recommended solutions.
@z

@x
## General debugging
@y
## General debugging
@z

@x
Docker Hardened Images are optimized for security and runtime performance. As
such, they typically don't include a shell or standard debugging tools. The
recommended way to troubleshoot containers built on DHIs is by using [Docker
Debug](./how-to/debug.md).
@y
Docker Hardened Images are optimized for security and runtime performance. As
such, they typically don't include a shell or standard debugging tools. The
recommended way to troubleshoot containers built on DHIs is by using [Docker
Debug](./how-to/debug.md).
@z

@x
Docker Debug allows you to:
@y
Docker Debug allows you to:
@z

@x
- Attach a temporary debug container to your existing container.
- Use a shell and familiar tools such as `curl`, `ps`, `netstat`, and `strace`.
- Install additional tools as needed in a writable, ephemeral layer that
  disappears after the session.
@y
- Attach a temporary debug container to your existing container.
- Use a shell and familiar tools such as `curl`, `ps`, `netstat`, and `strace`.
- Install additional tools as needed in a writable, ephemeral layer that
  disappears after the session.
@z

@x
## Permissions
@y
## Permissions
@z

@x
DHIs run as a nonroot user by default for enhanced security. This can result in
permission issues when accessing files or directories. Ensure your application
files and runtime directories are owned by the expected UID/GID or have
appropriate permissions.
@y
DHIs run as a nonroot user by default for enhanced security. This can result in
permission issues when accessing files or directories. Ensure your application
files and runtime directories are owned by the expected UID/GID or have
appropriate permissions.
@z

@x
To find out which user a DHI runs as, check the repository page for the image on
Docker Hub. See [View image variant
details](./how-to/explore.md#view-image-variant-details) for more information.
@y
To find out which user a DHI runs as, check the repository page for the image on
Docker Hub. See [View image variant
details](./how-to/explore.md#view-image-variant-details) for more information.
@z

@x
## Privileged ports
@y
## Privileged ports
@z

@x
Nonroot containers cannot bind to ports below 1024 by default. This is enforced
by both the container runtime and the kernel (especially in Kubernetes and
Docker Engine < 20.10).
@y
Nonroot containers cannot bind to ports below 1024 by default. This is enforced
by both the container runtime and the kernel (especially in Kubernetes and
Docker Engine < 20.10).
@z

@x
Inside the container, configure your application to listen on an unprivileged
port (1025 or higher). For example `docker run -p 80:8080 my-image` maps
port 8080 in the container to port 80 on the host, allowing you to access it
without needing root privileges.
@y
Inside the container, configure your application to listen on an unprivileged
port (1025 or higher). For example `docker run -p 80:8080 my-image` maps
port 8080 in the container to port 80 on the host, allowing you to access it
without needing root privileges.
@z

@x
## No shell
@y
## No shell
@z

@x
Runtime DHIs omit interactive shells like `sh` or `bash`. If your build or
tooling assumes a shell is present (e.g., for `RUN` instructions), use a `dev`
variant of the image in an earlier build stage and copy the final artifact into
the runtime image.
@y
Runtime DHIs omit interactive shells like `sh` or `bash`. If your build or
tooling assumes a shell is present (e.g., for `RUN` instructions), use a `dev`
variant of the image in an earlier build stage and copy the final artifact into
the runtime image.
@z

@x
To find out which shell, if any, a DHI has, check the repository page for the
image on Docker Hub. See [View image variant
details](./how-to/explore.md#view-image-variant-details) for more information.
@y
To find out which shell, if any, a DHI has, check the repository page for the
image on Docker Hub. See [View image variant
details](./how-to/explore.md#view-image-variant-details) for more information.
@z

@x
Also, use [Docker Debug](./how-to/debug.md) when you need shell
access to a running container.
@y
Also, use [Docker Debug](./how-to/debug.md) when you need shell
access to a running container.
@z

@x
## Entry point differences
@y
## Entry point differences
@z

@x
DHIs may define different entry points compared to Docker Official Images (DOIs)
or other community images.
@y
DHIs may define different entry points compared to Docker Official Images (DOIs)
or other community images.
@z

@x
To find out the ENTRYPOINT or CMD for a DHI, check the repository page for the
image on Docker Hub. See [View image variant
details](./how-to/explore.md#view-image-variant-details) for more information.
@y
To find out the ENTRYPOINT or CMD for a DHI, check the repository page for the
image on Docker Hub. See [View image variant
details](./how-to/explore.md#view-image-variant-details) for more information.
@z

@x
## No package manager
@y
## No package manager
@z

@x
Runtime Docker Hardened Images are stripped down for security and minimal attack
surface. As a result, they don't include a package manager such as `apk` or
`apt`. This means you can't install additional software directly in the runtime
image.
@y
Runtime Docker Hardened Images are stripped down for security and minimal attack
surface. As a result, they don't include a package manager such as `apk` or
`apt`. This means you can't install additional software directly in the runtime
image.
@z

@x
If your build or application setup requires installing packages (for example, to
compile code, install runtime dependencies, or add diagnostic tools), use a `dev`
variant of the image in a build stage. Then, copy only the necessary artifacts
into the final runtime image.
@y
If your build or application setup requires installing packages (for example, to
compile code, install runtime dependencies, or add diagnostic tools), use a `dev`
variant of the image in a build stage. Then, copy only the necessary artifacts
into the final runtime image.
@z
