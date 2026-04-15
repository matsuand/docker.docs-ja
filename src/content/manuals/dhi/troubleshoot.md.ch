%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Troubleshoot
description: Resolve common issues when building, running, or debugging Docker Hardened Images, such as non-root behavior, missing shells, and port access.
@y
title: トラブルシューティング
description: Resolve common issues when building, running, or debugging Docker Hardened Images, such as non-root behavior, missing shells, and port access.
@z

@x
tags: [Troubleshooting]
keywords: troubleshoot hardened image, docker debug container, non-root permission issue, missing shell error, no package manager, debug, hardened images, DHI, troubleshooting, ephemeral container, docker debug, non-root containers, hardened container image, debug secure container
@y
tags: [Troubleshooting]
keywords: troubleshoot hardened image, docker debug container, non-root permission issue, missing shell error, no package manager, debug, hardened images, DHI, troubleshooting, ephemeral container, docker debug, non-root containers, hardened container image, debug secure container
@z

@x
This page covers debugging techniques and common issues you may encounter while
migrating to or using Docker Hardened Images (DHIs).
@y
This page covers debugging techniques and common issues you may encounter while
migrating to or using Docker Hardened Images (DHIs).
@z

@x
## General debugging
@y
## General debugging
@z

@x
Docker Hardened Images prioritize minimalism and security, which means
they intentionally leave out many common debugging tools (like shells or package
managers). This makes direct troubleshooting difficult without introducing risk.
To address this, you can use [Docker
Debug](/reference/cli/docker/debug/), a secure workflow that
temporarily attaches an ephemeral debug container to a running service or image
without modifying the original image.
@y
Docker Hardened Images prioritize minimalism and security, which means
they intentionally leave out many common debugging tools (like shells or package
managers). This makes direct troubleshooting difficult without introducing risk.
To address this, you can use [Docker
Debug](__SUBDIR__/reference/cli/docker/debug/), a secure workflow that
temporarily attaches an ephemeral debug container to a running service or image
without modifying the original image.
@z

@x
This section shows how to debug Docker Hardened Images locally during development.
With Docker Debug, you can also debug containers remotely using the `--host`
option.
@y
This section shows how to debug Docker Hardened Images locally during development.
With Docker Debug, you can also debug containers remotely using the `--host`
option.
@z

@x
### Use Docker Debug
@y
### Use Docker Debug
@z

@x
#### Step 1: Run a container from a Hardened Image
@y
#### Step 1: Run a container from a Hardened Image
@z

@x
Start with a DHI-based container that simulates an issue:
@y
Start with a DHI-based container that simulates an issue:
@z

@x
```console
$ docker run -d --name myapp dhi.io/python:3.13 python -c "import time; time.sleep(300)"
```
@y
```console
$ docker run -d --name myapp dhi.io/python:3.13 python -c "import time; time.sleep(300)"
```
@z

@x
This container doesn't include a shell or tools like `ps`, `top`, or `cat`.
@y
This container doesn't include a shell or tools like `ps`, `top`, or `cat`.
@z

@x
If you try:
@y
If you try:
@z

@x
```console
$ docker exec -it myapp sh
```
@y
```console
$ docker exec -it myapp sh
```
@z

@x
You'll see:
@y
You'll see:
@z

@x
```console
exec: "sh": executable file not found in $PATH
```
@y
```console
exec: "sh": executable file not found in $PATH
```
@z

@x
#### Step 2: Use Docker Debug to inspect the container
@y
#### Step 2: Use Docker Debug to inspect the container
@z

@x
Use the `docker debug` command to attach a temporary, tool-rich debug container to the running instance.
@y
Use the `docker debug` command to attach a temporary, tool-rich debug container to the running instance.
@z

@x
```console
$ docker debug myapp
```
@y
```console
$ docker debug myapp
```
@z

@x
From here, you can inspect running processes, network status, or mounted files.
@y
From here, you can inspect running processes, network status, or mounted files.
@z

@x
For example, to check running processes:
@y
For example, to check running processes:
@z

@x
```console
$ ps aux
```
@y
```console
$ ps aux
```
@z

@x
Type `exit` to leave the container when done.
@y
Type `exit` to leave the container when done.
@z

@x
### Alternative debugging approaches
@y
### Alternative debugging approaches
@z

@x
In addition to using Docker Debug, you can also use the following approaches for
debugging DHI containers.
@y
In addition to using Docker Debug, you can also use the following approaches for
debugging DHI containers.
@z

@x
#### Use the -dev variant
@y
#### Use the -dev variant
@z

@x
Docker Hardened Images offer a `-dev` variant that includes a shell
and a package manager to install debugging tools. Simply replace the image tag
with `-dev`:
@y
Docker Hardened Images offer a `-dev` variant that includes a shell
and a package manager to install debugging tools. Simply replace the image tag
with `-dev`:
@z

@x
```console
$ docker run -it --rm dhi.io/python:3.13-dev sh
```
@y
```console
$ docker run -it --rm dhi.io/python:3.13-dev sh
```
@z

@x
Type `exit` to leave the container when done. Note that using the `-dev` variant
increases the attack surface and it is not recommended as a runtime for
production environments.
@y
Type `exit` to leave the container when done. Note that using the `-dev` variant
increases the attack surface and it is not recommended as a runtime for
production environments.
@z

@x
#### Mount debugging tools with image mounts
@y
#### Mount debugging tools with image mounts
@z

@x
You can use the image mount feature to mount debugging tools into your container
without modifying the base image.
@y
You can use the image mount feature to mount debugging tools into your container
without modifying the base image.
@z

@x
##### Step 1: Run a container from a hardened image
@y
##### Step 1: Run a container from a hardened image
@z

@x
Start with a DHI-based container that simulates an issue:
@y
Start with a DHI-based container that simulates an issue:
@z

@x
```console
$ docker run -d --name myapp dhi.io/python:3.13 python -c "import time; time.sleep(300)"
```
@y
```console
$ docker run -d --name myapp dhi.io/python:3.13 python -c "import time; time.sleep(300)"
```
@z

@x
##### Step 2: Mount debugging tools into the container
@y
##### Step 2: Mount debugging tools into the container
@z

@x
Run a new container that mounts a tool-rich image (like `busybox`) into
the running container's namespace:
@y
Run a new container that mounts a tool-rich image (like `busybox`) into
the running container's namespace:
@z

@x
```console
$ docker run --rm -it --pid container:myapp \
  --mount type=image,source=busybox,destination=/dbg,ro \
  dhi.io/python:3.13 /dbg/bin/sh
```
@y
```console
$ docker run --rm -it --pid container:myapp \
  --mount type=image,source=busybox,destination=/dbg,ro \
  dhi.io/python:3.13 /dbg/bin/sh
```
@z

@x
This mounts the BusyBox image at `/dbg`, giving you access to its tools while
keeping your original container image unchanged. Since the hardened Python image
doesn't include standard utilities, you need to use the full path to the mounted
tools:
@y
This mounts the BusyBox image at `/dbg`, giving you access to its tools while
keeping your original container image unchanged. Since the hardened Python image
doesn't include standard utilities, you need to use the full path to the mounted
tools:
@z

@x
```console
$ /dbg/bin/ls /
$ /dbg/bin/ps aux
$ /dbg/bin/cat /etc/os-release
```
@y
```console
$ /dbg/bin/ls /
$ /dbg/bin/ps aux
$ /dbg/bin/cat /etc/os-release
```
@z

@x
Type `exit` to leave the container when done.
@y
Type `exit` to leave the container when done.
@z

@x
## Common issues
@y
## Common issues
@z

@x
The following are specific issues you may encounter when working with Docker
Hardened Images, along with recommended solutions.
@y
The following are specific issues you may encounter when working with Docker
Hardened Images, along with recommended solutions.
@z

@x
### Permissions
@y
### Permissions
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
details](./how-to/explore.md#image-variant-details) for more information.
@y
To find out which user a DHI runs as, check the repository page for the image on
Docker Hub. See [View image variant
details](./how-to/explore.md#image-variant-details) for more information.
@z

@x
### Privileged ports
@y
### Privileged ports
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
### No shell
@y
### No shell
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
details](./how-to/explore.md#image-variant-details) for more information.
@y
To find out which shell, if any, a DHI has, check the repository page for the
image on Docker Hub. See [View image variant
details](./how-to/explore.md#image-variant-details) for more information.
@z

@x
Also, use Docker Debug when you need shell access to a running container. For
more details, see [General debugging](#general-debugging).
@y
Also, use Docker Debug when you need shell access to a running container. For
more details, see [General debugging](#general-debugging).
@z

@x
### Entry point differences
@y
### Entry point differences
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
details](./how-to/explore.md#image-variant-details) for more information.
@y
To find out the ENTRYPOINT or CMD for a DHI, check the repository page for the
image on Docker Hub. See [View image variant
details](./how-to/explore.md#image-variant-details) for more information.
@z

@x
### No package manager
@y
### No package manager
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
