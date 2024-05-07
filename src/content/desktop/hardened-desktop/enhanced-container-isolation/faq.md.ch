%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Enhanced Container Isolation (ECI) FAQs
description: Frequently asked questions for Enhanced Container Isolation
keywords: enhanced container isolation, security, faq, sysbox, Docker Desktop
toc_max: 2
---
@y
---
title: Enhanced Container Isolation (ECI) FAQs
description: Frequently asked questions for Enhanced Container Isolation
keywords: enhanced container isolation, security, faq, sysbox, Docker Desktop
toc_max: 2
---
@z

@x
### Do I need to change the way I use Docker when ECI is switched on?
@y
### Do I need to change the way I use Docker when ECI is switched on?
@z

@x
No, you can continue to use Docker as usual. ECI works under the covers by
creating a more secure container.
@y
No, you can continue to use Docker as usual. ECI works under the covers by
creating a more secure container.
@z

@x
### Do all container workloads work well with ECI?
@y
### Do all container workloads work well with ECI?
@z

@x
The great majority of container workloads run fine with ECI enabled, but a few
do not (yet). For the few workloads that don't yet work with Enhanced Container
Isolation, Docker is continuing to improve the feature to reduce this to a
minimum.
@y
The great majority of container workloads run fine with ECI enabled, but a few
do not (yet). For the few workloads that don't yet work with Enhanced Container
Isolation, Docker is continuing to improve the feature to reduce this to a
minimum.
@z

@x
### Can I run privileged containers with ECI?
@y
### Can I run privileged containers with ECI?
@z

@x
Yes, you can use the `--privileged` flag in containers but unlike privileged
containers without ECI, the container can only use it's elevated privileges to
access resources assigned to the container. It can't access global kernel
resources in the Docker Desktop Linux VM. This allows you to run privileged
containers securely (including Docker-in-Docker). For more information, see [Key features and benefits](features-benefits.md#privileged-containers-are-also-secured).
@y
Yes, you can use the `--privileged` flag in containers but unlike privileged
containers without ECI, the container can only use it's elevated privileges to
access resources assigned to the container. It can't access global kernel
resources in the Docker Desktop Linux VM. This allows you to run privileged
containers securely (including Docker-in-Docker). For more information, see [Key features and benefits](features-benefits.md#privileged-containers-are-also-secured).
@z

@x
### Will all privileged container workloads run with ECI?
@y
### Will all privileged container workloads run with ECI?
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
ECI allows the running of advanced workloads, but denies the ability to perform
kernel operations or access hardware devices.
@y
ECI allows the running of advanced workloads, but denies the ability to perform
kernel operations or access hardware devices.
@z

@x
### Does ECI restrict bind mounts inside the container?
@y
### Does ECI restrict bind mounts inside the container?
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
### Can I mount the host's Docker Socket into a container when ECI is enabled?
@y
### Can I mount the host's Docker Socket into a container when ECI is enabled?
@z

@x
By default, ECI blocks bind-mounting the host's Docker socket into containers,
for security reasons. However, there are legitimate use cases for this, such as
when using [Testcontainers](https://testcontainers.com/) for local testing.
@y
By default, ECI blocks bind-mounting the host's Docker socket into containers,
for security reasons. However, there are legitimate use cases for this, such as
when using [Testcontainers](https://testcontainers.com/) for local testing.
@z

@x
To enable such use cases, it's possible to configure ECI to allow Docker socket
mounts into containers, but only for your chosen (i.e,. trusted) container images, and
even restrict what commands the container can send to the Docker engine via the socket.
See [ECI Docker socket mount permissions](config.md#docker-socket-mount-permissions).
@y
To enable such use cases, it's possible to configure ECI to allow Docker socket
mounts into containers, but only for your chosen (i.e,. trusted) container images, and
even restrict what commands the container can send to the Docker engine via the socket.
See [ECI Docker socket mount permissions](config.md#docker-socket-mount-permissions).
@z

@x
### Does ECI protect all containers launched with Docker Desktop?
@y
### Does ECI protect all containers launched with Docker Desktop?
@z

@x
Not yet. It protects all containers launched by users via `docker create` and
`docker run`.
@y
Not yet. It protects all containers launched by users via `docker create` and
`docker run`.
@z

@x
Prior to Docker Desktop 4.30, it did not protect containers implicitly used by
`docker build` with the `docker` build driver (the default driver). Starting
with Docker Desktop 4.30, it protects such containers, except for Docker Desktop
on WSL 2 (Windows hosts).
@y
Prior to Docker Desktop 4.30, it did not protect containers implicitly used by
`docker build` with the `docker` build driver (the default driver). Starting
with Docker Desktop 4.30, it protects such containers, except for Docker Desktop
on WSL 2 (Windows hosts).
@z

@x
Note that ECI always protects containers used by `docker build`, when using the
[docker-container build driver](../../../build/drivers/_index.md), since Docker
Desktop 4.19 and on all supported platforms (Windows with WSL 2 or Hyper-V, Mac,
and Linux).
@y
Note that ECI always protects containers used by `docker build`, when using the
[docker-container build driver](../../../build/drivers/_index.md), since Docker
Desktop 4.19 and on all supported platforms (Windows with WSL 2 or Hyper-V, Mac,
and Linux).
@z

@x
ECI does not yet protect Docker Desktop Kubernetes pods, Extension containers,
and [Dev Environments containers](../../../desktop/dev-environments/_index.md).
@y
ECI does not yet protect Docker Desktop Kubernetes pods, Extension containers,
and [Dev Environments containers](../../../desktop/dev-environments/_index.md).
@z

@x
### Does ECI protect containers launched prior to enabling ECI?
@y
### Does ECI protect containers launched prior to enabling ECI?
@z

@x
No. Containers created prior to switching on ECI are not protected. Therefore, we
recommend removing all containers prior to switching on ECI.
@y
No. Containers created prior to switching on ECI are not protected. Therefore, we
recommend removing all containers prior to switching on ECI.
@z

@x
### Does ECI affect the performance of containers?
@y
### Does ECI affect the performance of containers?
@z

@x
ECI has very little impact on the performance of
containers. The exception is for containers that perform lots of `mount` and
`umount` system calls, as these are trapped and vetted by the Sysbox container
runtime to ensure they are not being used to breach the container's filesystem.
@y
ECI has very little impact on the performance of
containers. The exception is for containers that perform lots of `mount` and
`umount` system calls, as these are trapped and vetted by the Sysbox container
runtime to ensure they are not being used to breach the container's filesystem.
@z

@x
### With ECI, can the user still override the `--runtime` flag from the CLI ?
@y
### With ECI, can the user still override the `--runtime` flag from the CLI ?
@z

@x
No. With ECI enabled, Sysbox is set as the default (and only) runtime for
containers deployed by Docker Desktop users. If a user attempts to override the
runtime (e.g., `docker run --runtime=runc`), this request is ignored and the
container is created through the Sysbox runtime.
@y
No. With ECI enabled, Sysbox is set as the default (and only) runtime for
containers deployed by Docker Desktop users. If a user attempts to override the
runtime (e.g., `docker run --runtime=runc`), this request is ignored and the
container is created through the Sysbox runtime.
@z

@x
The reason `runc` is disallowed with ECI because it allows users to run as "true
root" on the Docker Desktop Linux VM, thereby providing them with implicit
control of the VM and the ability to modify the administrative configurations
for Docker Desktop, for example.
@y
The reason `runc` is disallowed with ECI because it allows users to run as "true
root" on the Docker Desktop Linux VM, thereby providing them with implicit
control of the VM and the ability to modify the administrative configurations
for Docker Desktop, for example.
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
