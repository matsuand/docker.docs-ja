%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Container security FAQs
linkTitle: Container
description: Frequently asked questions about Docker container security and isolation
keywords: container security, docker desktop isolation, enhanced container isolation, file sharing
@y
title: Container security FAQs
linkTitle: Container
description: Frequently asked questions about Docker container security and isolation
keywords: container security, docker desktop isolation, enhanced container isolation, file sharing
@z

@x
## How are containers isolated from the host in Docker Desktop?
@y
## How are containers isolated from the host in Docker Desktop?
@z

@x
Docker Desktop runs all containers inside a customized Linux virtual machine (except for native Windows containers). This adds strong isolation between containers and the host machine, even when containers run as root.
@y
Docker Desktop runs all containers inside a customized Linux virtual machine (except for native Windows containers). This adds strong isolation between containers and the host machine, even when containers run as root.
@z

@x
Important considerations include:
@y
Important considerations include:
@z

@x
- Containers have access to host files configured for file sharing via Docker Desktop settings
- Containers run as root with limited capabilities inside the Docker Desktop VM by default
- Privileged containers (`--privileged`, `--pid=host`, `--cap-add`) run with elevated privileges inside the VM, giving them access to VM internals and Docker Engine
@y
- Containers have access to host files configured for file sharing via Docker Desktop settings
- Containers run as root with limited capabilities inside the Docker Desktop VM by default
- Privileged containers (`--privileged`, `--pid=host`, `--cap-add`) run with elevated privileges inside the VM, giving them access to VM internals and Docker Engine
@z

@x
With Enhanced Container Isolation turned on, each container runs in a dedicated Linux user namespace inside the Docker Desktop VM. Even privileged containers only have privileges within their container boundary, not the VM. ECI uses advanced techniques to prevent containers from breaching the Docker Desktop VM and Docker Engine.
@y
With Enhanced Container Isolation turned on, each container runs in a dedicated Linux user namespace inside the Docker Desktop VM. Even privileged containers only have privileges within their container boundary, not the VM. ECI uses advanced techniques to prevent containers from breaching the Docker Desktop VM and Docker Engine.
@z

@x
## Which portions of the host filesystem can containers access?
@y
## Which portions of the host filesystem can containers access?
@z

@x
Containers can only access host files that are:
@y
Containers can only access host files that are:
@z

@x
1. Shared using Docker Desktop settings
1. Explicitly bind-mounted into the container (e.g., `docker run -v /path/to/host/file:/mnt`)
@y
1. Shared using Docker Desktop settings
1. Explicitly bind-mounted into the container (e.g., `docker run -v /path/to/host/file:/mnt`)
@z

@x
## Can containers running as root access admin-owned files on the host?
@y
## Can containers running as root access admin-owned files on the host?
@z

@x
No. Host file sharing uses a user-space file server (running in `com.docker.backend` as the Docker Desktop user), so containers can only access files that the Docker Desktop user already has permission to access.
@y
No. Host file sharing uses a user-space file server (running in `com.docker.backend` as the Docker Desktop user), so containers can only access files that the Docker Desktop user already has permission to access.
@z
