%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Frequently asked Docker Desktop questions for all platforms
keywords: desktop, mac, windows, faqs
title: General FAQs for Desktop
aliases:
- /mackit/faqs/
- /docker-for-mac/faqs/
- /docker-for-windows/faqs/
- /desktop/faqs/
---
@y
---
description: Frequently asked Docker Desktop questions for all platforms
keywords: desktop, mac, windows, faqs
title: General FAQs for Desktop
aliases:
- /mackit/faqs/
- /docker-for-mac/faqs/
- /docker-for-windows/faqs/
- /desktop/faqs/
---
@z

@x
### Can I use Docker Desktop offline?
@y
### Can I use Docker Desktop offline?
@z

@x
Yes, you can use Docker Desktop offline. However, you
cannot access features that require an active internet
connection. Additionally, any functionality that requires you to sign in won't work while using Docker Desktop offline or in air-gapped environments.
This includes:
@y
Yes, you can use Docker Desktop offline. However, you
cannot access features that require an active internet
connection. Additionally, any functionality that requires you to sign in won't work while using Docker Desktop offline or in air-gapped environments.
This includes:
@z

@x
- The resources in the [Learning Center](../use-desktop/index.md)
- Pulling or pushing an image to Docker Hub
- [Image Access Management](../../security/for-developers/access-tokens.md)
- [Static vulnerability scanning](../../docker-hub/vulnerability-scanning.md)
- Viewing remote images in the Docker Dashboard
- Setting up [Dev Environments](../dev-environments/index.md)
- Docker Build when using [BuildKit](../../build/buildkit/index.md#getting-started).
  You can work around this by disabling BuildKit. Run `DOCKER_BUILDKIT=0 docker build .` to disable BuildKit.
- [Kubernetes](../kubernetes.md) (Images are download when you enable Kubernetes for the first time)
- Checking for updates
- [In-app diagnostics](../troubleshoot/overview.md#diagnose-from-the-app) (including the [Self-diagnose tool](../troubleshoot/overview.md#diagnose-from-the-app))
- Sending usage statistics
@y
- The resources in the [Learning Center](../use-desktop/index.md)
- Pulling or pushing an image to Docker Hub
- [Image Access Management](../../security/for-developers/access-tokens.md)
- [Static vulnerability scanning](../../docker-hub/vulnerability-scanning.md)
- Viewing remote images in the Docker Dashboard
- Setting up [Dev Environments](../dev-environments/index.md)
- Docker Build when using [BuildKit](../../build/buildkit/index.md#getting-started).
  You can work around this by disabling BuildKit. Run `DOCKER_BUILDKIT=0 docker build .` to disable BuildKit.
- [Kubernetes](../kubernetes.md) (Images are download when you enable Kubernetes for the first time)
- Checking for updates
- [In-app diagnostics](../troubleshoot/overview.md#diagnose-from-the-app) (including the [Self-diagnose tool](../troubleshoot/overview.md#diagnose-from-the-app))
- Sending usage statistics
@z

@x
### How do I connect to the remote Docker Engine API?
@y
### How do I connect to the remote Docker Engine API?
@z

@x
To connect to the remote Engine API, you might need to provide the location of the Engine API for Docker clients and development tools.
@y
To connect to the remote Engine API, you might need to provide the location of the Engine API for Docker clients and development tools.
@z

@x
Mac and Windows WSL 2 users can connect to the Docker Engine through a Unix socket: `unix:///var/run/docker.sock`.
@y
Mac and Windows WSL 2 users can connect to the Docker Engine through a Unix socket: `unix:///var/run/docker.sock`.
@z

@x
If you are working with applications like [Apache Maven](https://maven.apache.org/)
that expect settings for `DOCKER_HOST` and `DOCKER_CERT_PATH` environment
variables, specify these to connect to Docker instances through Unix sockets.
@y
If you are working with applications like [Apache Maven](https://maven.apache.org/)
that expect settings for `DOCKER_HOST` and `DOCKER_CERT_PATH` environment
variables, specify these to connect to Docker instances through Unix sockets.
@z

@x
For example:
@y
For example:
@z

@x
```console
$ export DOCKER_HOST=unix:///var/run/docker.sock
```
@y
```console
$ export DOCKER_HOST=unix:///var/run/docker.sock
```
@z

@x
Docker Desktop Windows users can connect to the Docker Engine through a **named pipe**: `npipe:////./pipe/docker_engine`, or **TCP socket** at this URL:
`tcp://localhost:2375`.
@y
Docker Desktop Windows users can connect to the Docker Engine through a **named pipe**: `npipe:////./pipe/docker_engine`, or **TCP socket** at this URL:
`tcp://localhost:2375`.
@z

@x
For details, see [Docker Engine API](../../engine/api/index.md).
@y
For details, see [Docker Engine API](../../engine/api/index.md).
@z

@x
### How do I connect from a container to a service on the host?
@y
### How do I connect from a container to a service on the host?
@z

@x
The host has a changing IP address, or none if you have no network access.
We recommend that you connect to the special DNS name `host.docker.internal`,
which resolves to the internal IP address used by the host.
@y
The host has a changing IP address, or none if you have no network access.
We recommend that you connect to the special DNS name `host.docker.internal`,
which resolves to the internal IP address used by the host.
@z

@x
For more information and examples, see [how to connect from a container to a service on the host](../networking.md#i-want-to-connect-from-a-container-to-a-service-on-the-host).
@y
For more information and examples, see [how to connect from a container to a service on the host](../networking.md#i-want-to-connect-from-a-container-to-a-service-on-the-host).
@z

@x
### Can I pass through a USB device to a container?
@y
### Can I pass through a USB device to a container?
@z

@x
It is not possible to pass through a USB device (or a
serial port) to a container as it requires support at the hypervisor level.
@y
It is not possible to pass through a USB device (or a
serial port) to a container as it requires support at the hypervisor level.
@z
