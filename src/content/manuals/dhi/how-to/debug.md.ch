%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Debug a Docker Hardened Image container
linkTitle: Debug a container
@y
title: Debug a Docker Hardened Image container
linkTitle: Debug a container
@z

@x
keywords: debug, hardened images, DHI, troubleshooting, ephemeral container, docker debug
description: Learn how to use Docker Debug to troubleshoot Docker Hardened Images (DHI) locally or in production.
keywords: docker debug, ephemeral container, non-root containers, hardened container image, debug secure container
@y
keywords: debug, hardened images, DHI, troubleshooting, ephemeral container, docker debug
description: Learn how to use Docker Debug to troubleshoot Docker Hardened Images (DHI) locally or in production.
keywords: docker debug, ephemeral container, non-root containers, hardened container image, debug secure container
@z

@x
{{< summary-bar feature_name="Docker Hardened Images" >}}
@y
{{< summary-bar feature_name="Docker Hardened Images" >}}
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
This guide shows how to debug Docker Hardened Images locally during
development. You can also debug containers remotely using the `--host` option.
@y
This guide shows how to debug Docker Hardened Images locally during
development. You can also debug containers remotely using the `--host` option.
@z

@x
The following example uses a mirrored `dhi-python:3.13` image, but the same steps apply to any image.
@y
The following example uses a mirrored `dhi-python:3.13` image, but the same steps apply to any image.
@z

@x
## Step 1: Run a container from a Hardened Image
@y
## Step 1: Run a container from a Hardened Image
@z

@x
Start with a DHI-based container that simulates an issue:
@y
Start with a DHI-based container that simulates an issue:
@z

@x
```console
$ docker run -d --name myapp <YOUR_ORG>/dhi-python:3.13 python -c "import time; time.sleep(300)"
```
@y
```console
$ docker run -d --name myapp <YOUR_ORG>/dhi-python:3.13 python -c "import time; time.sleep(300)"
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
## Step 2: Use Docker Debug to inspect the container
@y
## Step 2: Use Docker Debug to inspect the container
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
Exit the debug session with:
@y
Exit the debug session with:
@z

@x
```console
$ exit
```
@y
```console
$ exit
```
@z

@x
## What's next
@y
## What's next
@z

@x
Docker Debug helps you troubleshoot hardened containers without compromising the
integrity of the original image. Because the debug container is ephemeral and
separate, it avoids introducing security risks into production environments.
@y
Docker Debug helps you troubleshoot hardened containers without compromising the
integrity of the original image. Because the debug container is ephemeral and
separate, it avoids introducing security risks into production environments.
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
