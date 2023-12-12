%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: FAQs
description: Frequently asked questions for Enhanced Container Isolation
keywords: enhanced container isolation, security, faq, sysbox, Docker Desktop
toc_max: 2
aliases:
- /desktop/hardened-desktop/enhanced-container-isolation/faq/
---
@y
---
title: FAQs
description: Frequently asked questions for Enhanced Container Isolation
keywords: enhanced container isolation, security, faq, sysbox, Docker Desktop
toc_max: 2
aliases:
- /desktop/hardened-desktop/enhanced-container-isolation/faq/
---
@z

@x
### Do I need to change the way I use Docker when Enhanced Container Isolation is switched on?
@y
### Do I need to change the way I use Docker when Enhanced Container Isolation is switched on?
@z

@x
No, you can continue to use Docker as usual. 
@y
No, you can continue to use Docker as usual. 
@z

@x
### Do all container workloads work well with Enhanced Container Isolation?
@y
### Do all container workloads work well with Enhanced Container Isolation?
@z

@x
The great majority of container workloads run fine with ECI, but a few do not
(yet). For the few workloads that don't yet work with Enhanced Container
Isolation, Docker is continuing to improve the feature to reduce this to a
minimum.
@y
The great majority of container workloads run fine with ECI, but a few do not
(yet). For the few workloads that don't yet work with Enhanced Container
Isolation, Docker is continuing to improve the feature to reduce this to a
minimum.
@z

@x
### Can I run privileged containers with Enhanced Container Isolation?
@y
### Can I run privileged containers with Enhanced Container Isolation?
@z

@x
Yes, you can use the `--privileged` flag in containers but unlike privileged
containers without Enhanced Container Isolation, the container can only use it's elevated privileges to
access resources assigned to the container. It can't access global kernel
resources in the Docker Desktop Linux VM. This allows you to run privileged
containers securely (including Docker-in-Docker). For more information, see [Key features and benefits](features-benefits.md#privileged-containers-are-also-secured).
@y
Yes, you can use the `--privileged` flag in containers but unlike privileged
containers without Enhanced Container Isolation, the container can only use it's elevated privileges to
access resources assigned to the container. It can't access global kernel
resources in the Docker Desktop Linux VM. This allows you to run privileged
containers securely (including Docker-in-Docker). For more information, see [Key features and benefits](features-benefits.md#privileged-containers-are-also-secured).
@z

@x
### Will all privileged container workloads run with Enhanced Container Isolation?
@y
### Will all privileged container workloads run with Enhanced Container Isolation?
@z

@x
No. Privileged container workloads that wish to access global kernel resources
inside the Docker Desktop Linux VM won't work. For example, you can't use a
privileged container to load a kernel module.
@y
No. Privileged container workloads that wish to access global kernel resources
inside the Docker Desktop Linux VM won't work. For example, you can't use a
privileged container to load a kernel module.
@z

@x
### Why not just restrict usage of the `--privileged` flag?
@y
### Why not just restrict usage of the `--privileged` flag?
@z

@x
Privileged containers are typically used to run advanced workloads in
containers, for example Docker-in-Docker or Kubernetes-in-Docker, to
perform kernel operations such as loading modules, or to access hardware
devices.
@y
Privileged containers are typically used to run advanced workloads in
containers, for example Docker-in-Docker or Kubernetes-in-Docker, to
perform kernel operations such as loading modules, or to access hardware
devices.
@z

@x
Enhanced Container Isolation allows the running of advanced workloads, but denies the ability to perform
kernel operations or access hardware devices.
@y
Enhanced Container Isolation allows the running of advanced workloads, but denies the ability to perform
kernel operations or access hardware devices.
@z

@x
### Does Enhanced Container Isolation restrict bind mounts inside the container?
@y
### Does Enhanced Container Isolation restrict bind mounts inside the container?
@z

@x
Yes, it restricts bind mounts of directories located in the Docker Desktop Linux
VM into the container.
@y
Yes, it restricts bind mounts of directories located in the Docker Desktop Linux
VM into the container.
@z

@x
It doesn't restrict bind mounts of your host machine files into the container,
as configured via Docker Desktop's **Settings** > **Resources** > **File Sharing**.
@y
It doesn't restrict bind mounts of your host machine files into the container,
as configured via Docker Desktop's **Settings** > **Resources** > **File Sharing**.
@z

@x
### Does Enhanced Container Isolation protect all containers launched with Docker Desktop?
@y
### Does Enhanced Container Isolation protect all containers launched with Docker Desktop?
@z

@x
It protects all containers launched by users via `docker create` and `docker run`. It does not yet protect Docker Desktop Kubernetes pods, ExtensioncContainers, and Dev Environments.
@y
It protects all containers launched by users via `docker create` and `docker run`. It does not yet protect Docker Desktop Kubernetes pods, ExtensioncContainers, and Dev Environments.
@z

@x
### Does Enhanced Container Isolation protect containers launched prior to enabling ECI?
@y
### Does Enhanced Container Isolation protect containers launched prior to enabling ECI?
@z

@x
No. Containers created prior to switching on ECI are not protected. Therefore, we
recommend removing all containers prior to switching on ECI. 
@y
No. Containers created prior to switching on ECI are not protected. Therefore, we
recommend removing all containers prior to switching on ECI. 
@z

@x
### Does Enhanced Container Isolation affect the performance of containers?
@y
### Does Enhanced Container Isolation affect the performance of containers?
@z

@x
Enhanced Container Isolation has very little impact on the performance of
containers. The exception is for containers that perform lots of `mount` and
`umount` system calls, as these are trapped and vetted by the Sysbox container
runtime to ensure they are not being used to breach the container's filesystem.
@y
Enhanced Container Isolation has very little impact on the performance of
containers. The exception is for containers that perform lots of `mount` and
`umount` system calls, as these are trapped and vetted by the Sysbox container
runtime to ensure they are not being used to breach the container's filesystem.
@z

@x
### With Enhanced Container Isolation, can the user still override the `--runtime` flag from the CLI ?
@y
### With Enhanced Container Isolation, can the user still override the `--runtime` flag from the CLI ?
@z

@x
No. With Enhanced Container Isolation enabled, Sysbox is set as the default (and only) runtime for
containers deployed by Docker Desktop users. If a user attempts to override the
runtime (e.g., `docker run --runtime=runc`), this request is ignored and the
container is created through the Sysbox runtime.
@y
No. With Enhanced Container Isolation enabled, Sysbox is set as the default (and only) runtime for
containers deployed by Docker Desktop users. If a user attempts to override the
runtime (e.g., `docker run --runtime=runc`), this request is ignored and the
container is created through the Sysbox runtime.
@z

@x
The reason `runc` is disallowed with Enhanced Container Isolation because it
allows users to run as "true root" on the Docker Desktop Linux VM, thereby
providing them with implicit control of the VM and the ability to modify the
administrative configurations for Docker Desktop, for example.
@y
The reason `runc` is disallowed with Enhanced Container Isolation because it
allows users to run as "true root" on the Docker Desktop Linux VM, thereby
providing them with implicit control of the VM and the ability to modify the
administrative configurations for Docker Desktop, for example.
@z

@x
### How is ECI different from Docker Engine's userns-remap mode?
@y
### How is ECI different from Docker Engine's userns-remap mode?
@z

@x
See [How does it work](how-eci-works.md#enhanced-container-isolation-vs-docker-userns-remap-mode).
@y
See [How does it work](how-eci-works.md#enhanced-container-isolation-vs-docker-userns-remap-mode).
@z

@x
### How is ECI different from Rootless Docker?
@y
### How is ECI different from Rootless Docker?
@z

@x
See [How does it work](how-eci-works.md#enhanced-container-isolation-vs-rootless-docker)
@y
See [How does it work](how-eci-works.md#enhanced-container-isolation-vs-rootless-docker)
@z
