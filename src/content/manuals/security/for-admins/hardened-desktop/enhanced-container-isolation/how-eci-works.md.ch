%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: How Enhanced Container Isolation works
title: How does it work?
keywords: set up, enhanced container isolation, rootless, security
@y
description: How Enhanced Container Isolation works
title: How does it work?
keywords: set up, enhanced container isolation, rootless, security
@z

@x
Docker implements Enhanced Container Isolation by using the [Sysbox
container runtime](https://github.com/nestybox/sysbox). Sysbox is a fork of the
standard OCI runc runtime that was modified to enhance standard container isolation and
workloads. For more details see [Under the hood](#under-the-hood).
@y
Docker implements Enhanced Container Isolation by using the [Sysbox
container runtime](https://github.com/nestybox/sysbox). Sysbox is a fork of the
standard OCI runc runtime that was modified to enhance standard container isolation and
workloads. For more details see [Under the hood](#under-the-hood).
@z

@x
When [Enhanced Container Isolation is enabled](index.md#how-do-i-enable-enhanced-container-isolation), containers
created by users through `docker run` or `docker create` are automatically
launched using Sysbox instead of the standard OCI runc runtime. Users need not
do anything else and can continue to use containers as usual. For exceptions,
see [FAQs](faq.md).
@y
When [Enhanced Container Isolation is enabled](index.md#how-do-i-enable-enhanced-container-isolation), containers
created by users through `docker run` or `docker create` are automatically
launched using Sysbox instead of the standard OCI runc runtime. Users need not
do anything else and can continue to use containers as usual. For exceptions,
see [FAQs](faq.md).
@z

@x
Even containers that use the insecure `--privileged` flag can now be run
securely with Enhanced Container Isolation, such that they can no longer be used
to breach the Docker Desktop Virtual Machine (VM) or other containers.
@y
Even containers that use the insecure `--privileged` flag can now be run
securely with Enhanced Container Isolation, such that they can no longer be used
to breach the Docker Desktop Virtual Machine (VM) or other containers.
@z

@x
> [!NOTE]
>
> When Enhanced Container Isolation is enabled in Docker Desktop, the Docker CLI
> `--runtime` flag is ignored. Docker's default runtime continues to be `runc`,
> but all user containers are implicitly launched with Sysbox.
@y
> [!NOTE]
>
> When Enhanced Container Isolation is enabled in Docker Desktop, the Docker CLI
> `--runtime` flag is ignored. Docker's default runtime continues to be `runc`,
> but all user containers are implicitly launched with Sysbox.
@z

@x
Enhanced Container Isolation is not the same as [Docker Engine's userns-remap mode or Rootless Docker](#enhanced-container-isolation-versus-user-namespace-remapping).
@y
Enhanced Container Isolation is not the same as [Docker Engine's userns-remap mode or Rootless Docker](#enhanced-container-isolation-versus-user-namespace-remapping).
@z

@x
### Under the hood
@y
### Under the hood
@z

@x
Sysbox enhances container isolation by using techniques such as:
@y
Sysbox enhances container isolation by using techniques such as:
@z

@x
* Enabling the Linux user-namespace on all containers (root user in the container maps to an unprivileged user in the Linux VM).
* Restricting the container from mounting sensitive VM directories.
* Vetting sensitive system-calls between the container and the Linux kernel.
* Mapping filesystem user/group IDs between the container's user-namespace and the Linux VM.
* Emulating portions of the `/proc` and `/sys` filesystems inside the container.
@y
* Enabling the Linux user-namespace on all containers (root user in the container maps to an unprivileged user in the Linux VM).
* Restricting the container from mounting sensitive VM directories.
* Vetting sensitive system-calls between the container and the Linux kernel.
* Mapping filesystem user/group IDs between the container's user-namespace and the Linux VM.
* Emulating portions of the `/proc` and `/sys` filesystems inside the container.
@z

@x
Some of these are made possible by recent advances in the Linux kernel which
Docker Desktop now incorporates. Sysbox applies these techniques with minimal
functional or performance impact to containers.
@y
Some of these are made possible by recent advances in the Linux kernel which
Docker Desktop now incorporates. Sysbox applies these techniques with minimal
functional or performance impact to containers.
@z

@x
These techniques complement Docker's traditional container security mechanisms
such as using other Linux namespaces, cgroups, restricted Linux Capabilities,
Seccomp, and AppArmor. They add a strong layer of isolation between the
container and the Linux kernel inside the Docker Desktop VM.
@y
These techniques complement Docker's traditional container security mechanisms
such as using other Linux namespaces, cgroups, restricted Linux Capabilities,
Seccomp, and AppArmor. They add a strong layer of isolation between the
container and the Linux kernel inside the Docker Desktop VM.
@z

@x
For more information, see [Key features and benefits](features-benefits.md).
@y
For more information, see [Key features and benefits](features-benefits.md).
@z

@x
### Enhanced Container Isolation versus user namespace remapping
@y
### Enhanced Container Isolation versus user namespace remapping
@z

@x
The Docker Engine includes a feature called [userns-remap mode](/engine/security/userns-remap/)
that enables the user namespace in all containers. However it suffers from a few
[limitations](/engine/security/userns-remap/) and it's
not supported within Docker Desktop.
@y
The Docker Engine includes a feature called [userns-remap mode](__SUBDIR__/engine/security/userns-remap/)
that enables the user namespace in all containers. However it suffers from a few
[limitations](__SUBDIR__/engine/security/userns-remap/) and it's
not supported within Docker Desktop.
@z

@x
Userns-remap mode is similar to Enhanced Container Isolation in that both improve
container isolation by leveraging the Linux user-namespace.
@y
Userns-remap mode is similar to Enhanced Container Isolation in that both improve
container isolation by leveraging the Linux user-namespace.
@z

@x
However, Enhanced Container Isolation is much more advanced since it assigns
exclusive user-namespace mappings per container automatically and adds several
other [container isolation features](#under-the-hood) meant to secure Docker
Desktop in organizations with stringent security requirements.
@y
However, Enhanced Container Isolation is much more advanced since it assigns
exclusive user-namespace mappings per container automatically and adds several
other [container isolation features](#under-the-hood) meant to secure Docker
Desktop in organizations with stringent security requirements.
@z

@x
### Enhanced Container Isolation versus Rootless Docker
@y
### Enhanced Container Isolation versus Rootless Docker
@z

@x
[Rootless Docker](/engine/security/rootless/) lets Docker Engine, and by
extension the containers, to run without root privileges natively on a Linux host. This
lets non-root users to install and run Docker natively on Linux.
@y
[Rootless Docker](__SUBDIR__/engine/security/rootless/) lets Docker Engine, and by
extension the containers, to run without root privileges natively on a Linux host. This
lets non-root users to install and run Docker natively on Linux.
@z

@x
Rootless Docker is not supported within Docker Desktop. While it's a valuable
feature when running Docker natively on Linux, its value within Docker Desktop
is reduced since Docker Desktop runs the Docker Engine within a Linux VM. That
is, Docker Desktop already lets non-root host users to run Docker and
isolates the Docker Engine from the host using a virtual machine.
@y
Rootless Docker is not supported within Docker Desktop. While it's a valuable
feature when running Docker natively on Linux, its value within Docker Desktop
is reduced since Docker Desktop runs the Docker Engine within a Linux VM. That
is, Docker Desktop already lets non-root host users to run Docker and
isolates the Docker Engine from the host using a virtual machine.
@z

@x
Unlike Rootless Docker, Enhanced Container Isolation does not run Docker Engine
within a Linux user-namespace. Rather it runs the containers generated by that
engine within a user-namespace. This has the advantage of bypassing [the
limitations](/engine/security/rootless/#known-limitations) of Rootless Docker
and creates a stronger boundary between the containers and the Docker Engine.
@y
Unlike Rootless Docker, Enhanced Container Isolation does not run Docker Engine
within a Linux user-namespace. Rather it runs the containers generated by that
engine within a user-namespace. This has the advantage of bypassing [the
limitations](__SUBDIR__/engine/security/rootless/#known-limitations) of Rootless Docker
and creates a stronger boundary between the containers and the Docker Engine.
@z

@x
Enhanced Container Isolation is meant to ensure containers launched with Docker
Desktop can't easily breach the Docker Desktop Linux VM and therefore modify
security settings within it.
@y
Enhanced Container Isolation is meant to ensure containers launched with Docker
Desktop can't easily breach the Docker Desktop Linux VM and therefore modify
security settings within it.
@z
