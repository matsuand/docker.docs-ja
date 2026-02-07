%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: Debug a Docker Hardened Image container
linkTitle: Debug a container
@y
title: Debug a Docker Hardened Image container
linkTitle: Debug a container
@z

@x
keywords: debug, hardened images, DHI, troubleshooting, ephemeral container, docker debug, non-root containers, hardened container image, debug secure container
description: Learn how to use Docker Debug to troubleshoot Docker Hardened Images (DHI) locally or in production.
@y
keywords: debug, hardened images, DHI, troubleshooting, ephemeral container, docker debug, non-root containers, hardened container image, debug secure container
description: Learn how to use Docker Debug to troubleshoot Docker Hardened Images (DHI) locally or in production.
@z

@x
Docker Hardened Images (DHI) prioritize minimalism and security, which means
they intentionally leave out many common debugging tools (like shells or package
managers). This makes direct troubleshooting difficult without introducing risk.
To address this, you can use [Docker
Debug](../../../reference/cli/docker/debug.md), a secure workflow that
temporarily attaches an ephemeral debug container to a running service or image
without modifying the original image.
@y
Docker Hardened Images (DHI) prioritize minimalism and security, which means
they intentionally leave out many common debugging tools (like shells or package
managers). This makes direct troubleshooting difficult without introducing risk.
To address this, you can use [Docker
Debug](../../../reference/cli/docker/debug.md), a secure workflow that
temporarily attaches an ephemeral debug container to a running service or image
without modifying the original image.
@z

@x
This guide shows how to debug Docker Hardened Images locally during development.
With Docker Debug, you can also debug containers remotely using the `--host`
option.
@y
This guide shows how to debug Docker Hardened Images locally during development.
With Docker Debug, you can also debug containers remotely using the `--host`
option.
@z

@x
## Use Docker Debug
@y
## Use Docker Debug
@z

@x
### Step 1: Run a container from a Hardened Image
@y
### Step 1: Run a container from a Hardened Image
@z

@x
Start with a DHI-based container that simulates an issue:
@y
Start with a DHI-based container that simulates an issue:
@z

% snip command...

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

% snip command...

@x
You'll see:
@y
You'll see:
@z

% snip output...

@x
### Step 2: Use Docker Debug to inspect the container
@y
### Step 2: Use Docker Debug to inspect the container
@z

@x
Use the `docker debug` command to attach a temporary, tool-rich debug container to the running instance.
@y
Use the `docker debug` command to attach a temporary, tool-rich debug container to the running instance.
@z

% snip command...

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

% snip command...

@x
Type `exit` to leave the container when done.
@y
Type `exit` to leave the container when done.
@z

@x
## Alternative debugging approaches
@y
## Alternative debugging approaches
@z

@x
In addition to using Docker Debug, you can also use the following approaches for
debugging DHI containers.
@y
In addition to using Docker Debug, you can also use the following approaches for
debugging DHI containers.
@z

@x
### Use the -dev variant
@y
### Use the -dev variant
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

% snip command...

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
### Mount debugging tools with image mounts
@y
### Mount debugging tools with image mounts
@z

@x
You can use the image mount feature to mount debugging tools into your container
without modifying the base image.
@y
You can use the image mount feature to mount debugging tools into your container
without modifying the base image.
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

% snip command...

@x
#### Step 2: Mount debugging tools into the container
@y
#### Step 2: Mount debugging tools into the container
@z

@x
Run a new container that mounts a tool-rich image (like `busybox`) into
the running container's namespace:
@y
Run a new container that mounts a tool-rich image (like `busybox`) into
the running container's namespace:
@z

% snip command...

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

% snip command...

@x
Type `exit` to leave the container when done.
@y
Type `exit` to leave the container when done.
@z

@x
## What's next
@y
## What's next
@z

@x
This guide covered three approaches for debugging Docker Hardened Images:
@y
This guide covered three approaches for debugging Docker Hardened Images:
@z

@x
- Docker Debug: Attach an ephemeral debug container without modifying the original image
- `-dev` variants: Use development images that include debugging tools
- Image mount: Mount tool-rich images like BusyBox to access debugging utilities
@y
- Docker Debug: Attach an ephemeral debug container without modifying the original image
- `-dev` variants: Use development images that include debugging tools
- Image mount: Mount tool-rich images like BusyBox to access debugging utilities
@z

@x
Each method helps you troubleshoot hardened containers while maintaining
security. Docker Debug and image mounts avoid modifying your production images,
while `-dev` variants provide convenience during development.
@y
Each method helps you troubleshoot hardened containers while maintaining
security. Docker Debug and image mounts avoid modifying your production images,
while `-dev` variants provide convenience during development.
@z

@x
If you encounter issues related to permissions, ports, missing shells, or
package managers, see [Troubleshoot Docker Hardened Images](../troubleshoot.md)
for recommended solutions and workarounds.
@y
If you encounter issues related to permissions, ports, missing shells, or
package managers, see [Troubleshoot Docker Hardened Images](../troubleshoot.md)
for recommended solutions and workarounds.
@z
