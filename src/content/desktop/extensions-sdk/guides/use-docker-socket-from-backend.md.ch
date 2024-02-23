%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
---
title: Use the Docker socket from the extension backend
description: Docker extension metadata
keywords: Docker, extensions, sdk, metadata
---
@y
---
title: Use the Docker socket from the extension backend
description: Docker extension metadata
keywords: Docker, extensions, sdk, metadata
---
@z

@x
Extensions can invoke Docker commands directly from the frontend with the SDK. 
@y
Extensions can invoke Docker commands directly from the frontend with the SDK. 
@z

@x
In some cases, it is useful to also
interact with the Docker Engine from the backend. Extension backend containers can mount the Docker socket and use it to
interact with the Docker engine from the extension backend logic. Learn more about the [Docker Engine socket](/reference/cli/dockerd/#examples)
@y
In some cases, it is useful to also
interact with the Docker Engine from the backend. Extension backend containers can mount the Docker socket and use it to
interact with the Docker engine from the extension backend logic. Learn more about the [Docker Engine socket](__SUBDIR__/reference/cli/dockerd/#examples)
@z

@x
However, when mounting the Docker socket from an extension container that lives in the Desktop virtual machine, you want
to mount the Docker socket from inside the VM, and not mount `/var/run/docker.sock` from the host filesystem (using
the Docker socket from the host can lead to permission issues in containers).
@y
However, when mounting the Docker socket from an extension container that lives in the Desktop virtual machine, you want
to mount the Docker socket from inside the VM, and not mount `/var/run/docker.sock` from the host filesystem (using
the Docker socket from the host can lead to permission issues in containers).
@z

@x
In order to do so, you can use `/var/run/docker.sock.raw`. Docker Desktop mounts the socket that lives in the Desktop VM, and not from the host.
@y
In order to do so, you can use `/var/run/docker.sock.raw`. Docker Desktop mounts the socket that lives in the Desktop VM, and not from the host.
@z

@x
```yaml
services:
  myExtension:
    image: ${DESKTOP_PLUGIN_IMAGE}
    volumes:
      - /var/run/docker.sock.raw:/var/run/docker.sock
```
@y
```yaml
services:
  myExtension:
    image: ${DESKTOP_PLUGIN_IMAGE}
    volumes:
      - /var/run/docker.sock.raw:/var/run/docker.sock
```
@z
