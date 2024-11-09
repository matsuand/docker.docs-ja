%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Limitations
description: Limitations of Enhanced Container Isolation
keywords: enhanced container isolation, security, sysbox, known issues, Docker Desktop
@y
title: Limitations
description: Limitations of Enhanced Container Isolation
keywords: enhanced container isolation, security, sysbox, known issues, Docker Desktop
@z

@x
### ECI support for WSL
@y
### ECI support for WSL
@z

@x
Prior to Docker Desktop 4.20, Enhanced Container Isolation (ECI) on
Windows hosts was only supported when Docker Desktop was configured to use
Hyper-V to create the Docker Desktop Linux VM. ECI was not supported when Docker
Desktop was configured to use Windows Subsystem for Linux (aka WSL).
@y
Prior to Docker Desktop 4.20, Enhanced Container Isolation (ECI) on
Windows hosts was only supported when Docker Desktop was configured to use
Hyper-V to create the Docker Desktop Linux VM. ECI was not supported when Docker
Desktop was configured to use Windows Subsystem for Linux (aka WSL).
@z

@x
Starting with Docker Desktop 4.20, ECI is supported when Docker Desktop is
configured to use either Hyper-V or WSL 2.
@y
Starting with Docker Desktop 4.20, ECI is supported when Docker Desktop is
configured to use either Hyper-V or WSL 2.
@z

@x
>**Note**
>
> Docker Desktop requires WSL 2 version 1.1.3.0 or later. To get the current
> version of WSL on your host, type `wsl --version`. If the command fails or if
> it returns a version number prior to 1.1.3.0, update WSL to the latest version
> by typing `wsl --update` in a Windows command or PowerShell terminal.
@y
>**Note**
>
> Docker Desktop requires WSL 2 version 1.1.3.0 or later. To get the current
> version of WSL on your host, type `wsl --version`. If the command fails or if
> it returns a version number prior to 1.1.3.0, update WSL to the latest version
> by typing `wsl --update` in a Windows command or PowerShell terminal.
@z

@x
Note however that ECI on WSL is not as secure as on Hyper-V because:
@y
Note however that ECI on WSL is not as secure as on Hyper-V because:
@z

@x
* While ECI on WSL still hardens containers so that malicious workloads can't
  easily breach Docker Desktop's Linux VM, ECI on WSL can't prevent Docker
  Desktop users from breaching the Docker Desktop Linux VM. Such users can
  trivially access that VM (as root) with the `wsl -d docker-desktop` command,
  and use that access to modify Docker Engine settings inside the VM. This gives
  Docker Desktop users control of the Docker Desktop VM and allows them to
  bypass Docker Desktop configs set by admins via the
  [settings-management](../settings-management/_index.md) feature. In contrast,
  ECI on Hyper-V does not allow Docker Desktop users to breach the Docker
  Desktop Linux VM.
@y
* While ECI on WSL still hardens containers so that malicious workloads can't
  easily breach Docker Desktop's Linux VM, ECI on WSL can't prevent Docker
  Desktop users from breaching the Docker Desktop Linux VM. Such users can
  trivially access that VM (as root) with the `wsl -d docker-desktop` command,
  and use that access to modify Docker Engine settings inside the VM. This gives
  Docker Desktop users control of the Docker Desktop VM and allows them to
  bypass Docker Desktop configs set by admins via the
  [settings-management](../settings-management/_index.md) feature. In contrast,
  ECI on Hyper-V does not allow Docker Desktop users to breach the Docker
  Desktop Linux VM.
@z

@x
* With WSL 2, all WSL 2 distributions on the same Windows host share the same instance
  of the Linux kernel. As a result, Docker Desktop can't ensure the integrity of
  the kernel in the Docker Desktop Linux VM since another WSL 2 distribution could
  modify shared kernel settings. In contrast, when using Hyper-V, the Docker
  Desktop Linux VM has a dedicated kernel that is solely under the control of
  Docker Desktop.
@y
* With WSL 2, all WSL 2 distributions on the same Windows host share the same instance
  of the Linux kernel. As a result, Docker Desktop can't ensure the integrity of
  the kernel in the Docker Desktop Linux VM since another WSL 2 distribution could
  modify shared kernel settings. In contrast, when using Hyper-V, the Docker
  Desktop Linux VM has a dedicated kernel that is solely under the control of
  Docker Desktop.
@z

@x
The table below summarizes this.
@y
The table below summarizes this.
@z

@x
| Security Feature                                   | ECI on WSL   | ECI on Hyper-V   | Comment               |
| -------------------------------------------------- | ------------ | ---------------- | --------------------- |
| Strongly secure containers                         | Yes          | Yes              | Makes it harder for malicious container workloads to breach the Docker Desktop Linux VM and host. |
| Docker Desktop Linux VM protected from user access | No           | Yes              | On WSL, users can access Docker Engine directly or bypass Docker Desktop security settings. |
| Docker Desktop Linux VM has a dedicated kernel     | No           | Yes              | On WSL, Docker Desktop can't guarantee the integrity of kernel level configs. |
@y
| Security Feature                                   | ECI on WSL   | ECI on Hyper-V   | Comment               |
| -------------------------------------------------- | ------------ | ---------------- | --------------------- |
| Strongly secure containers                         | Yes          | Yes              | Makes it harder for malicious container workloads to breach the Docker Desktop Linux VM and host. |
| Docker Desktop Linux VM protected from user access | No           | Yes              | On WSL, users can access Docker Engine directly or bypass Docker Desktop security settings. |
| Docker Desktop Linux VM has a dedicated kernel     | No           | Yes              | On WSL, Docker Desktop can't guarantee the integrity of kernel level configs. |
@z

@x
In general, using ECI with Hyper-V is more secure than with WSL 2. But WSL 2
offers advantages for performance and resource utilization on the host machine,
and it's an excellent way for users to run their favorite Linux distribution on
Windows hosts and access Docker from within (see Docker Desktop's WSL distribution
integration feature, enabled via the Dashboard's **Settings** > **Resources** > **WSL Integration**).
@y
In general, using ECI with Hyper-V is more secure than with WSL 2. But WSL 2
offers advantages for performance and resource utilization on the host machine,
and it's an excellent way for users to run their favorite Linux distribution on
Windows hosts and access Docker from within (see Docker Desktop's WSL distribution
integration feature, enabled via the Dashboard's **Settings** > **Resources** > **WSL Integration**).
@z

@x
### ECI protection for Docker Builds with the "Docker" driver
@y
### ECI protection for Docker Builds with the "Docker" driver
@z

@x
Prior to Docker Desktop 4.30, `docker build` commands that use the buildx
`docker` driver (the default) are not protected by ECI (i.e., the build runs
rootful inside the Docker Desktop VM).
@y
Prior to Docker Desktop 4.30, `docker build` commands that use the buildx
`docker` driver (the default) are not protected by ECI (i.e., the build runs
rootful inside the Docker Desktop VM).
@z

@x
Starting with Docker Desktop 4.30, `docker build` commands that use the buildx
`docker` driver are protected by ECI (i.e., the build runs rootless inside
the Docker Desktop VM), except when Docker Desktop is configured to use WSL 2
(on Windows hosts). We expect to improve on this in future versions of Docker
Desktop.
@y
Starting with Docker Desktop 4.30, `docker build` commands that use the buildx
`docker` driver are protected by ECI (i.e., the build runs rootless inside
the Docker Desktop VM), except when Docker Desktop is configured to use WSL 2
(on Windows hosts). We expect to improve on this in future versions of Docker
Desktop.
@z

@x
Note that `docker build` commands that use the `docker-container` driver are
always protected by ECI (i.e., the build runs inside a rootless Docker
container). This is true since Docker Desktop 4.19 (when ECI was introduced) and
on all platforms where Docker Desktop is supported (Windows with WSL or Hyper-V,
Mac, and Linux).
@y
Note that `docker build` commands that use the `docker-container` driver are
always protected by ECI (i.e., the build runs inside a rootless Docker
container). This is true since Docker Desktop 4.19 (when ECI was introduced) and
on all platforms where Docker Desktop is supported (Windows with WSL or Hyper-V,
Mac, and Linux).
@z

@x
### Docker Build and Buildx have some restrictions
@y
### Docker Build and Buildx have some restrictions
@z

@x
With ECI enabled, Docker build `--network=host` and Docker Buildx entitlements
(`network.host`, `security.insecure`) are not allowed. Builds that require
these won't work properly.
@y
With ECI enabled, Docker build `--network=host` and Docker Buildx entitlements
(`network.host`, `security.insecure`) are not allowed. Builds that require
these won't work properly.
@z

@x
### Kubernetes pods are not yet protected
@y
### Kubernetes pods are not yet protected
@z

@x
When using the Docker Desktop integrated Kubernetes, pods are not yet protected
by ECI. Therefore a malicious or privileged pod can compromise the Docker
Desktop Linux VM and bypass security controls.
@y
When using the Docker Desktop integrated Kubernetes, pods are not yet protected
by ECI. Therefore a malicious or privileged pod can compromise the Docker
Desktop Linux VM and bypass security controls.
@z

@x
As an alternative, you can use the [K8s.io KinD](https://kind.sigs.k8s.io/) tool
with ECI. In this case, each Kubernetes node runs inside an ECI-protected
container, thereby more strongly isolating the Kubernetes cluster away from the
underlying Docker Desktop Linux VM (and Docker Engine within). No special
arrangements are needed, just enable ECI and run the KinD tool as usual.
@y
As an alternative, you can use the [K8s.io KinD](https://kind.sigs.k8s.io/) tool
with ECI. In this case, each Kubernetes node runs inside an ECI-protected
container, thereby more strongly isolating the Kubernetes cluster away from the
underlying Docker Desktop Linux VM (and Docker Engine within). No special
arrangements are needed, just enable ECI and run the KinD tool as usual.
@z

@x
### Extension containers are not yet protected
@y
### Extension containers are not yet protected
@z

@x
Extension containers are also not yet protected by ECI. Ensure you extension
containers come from trusted entities to avoid issues.
@y
Extension containers are also not yet protected by ECI. Ensure you extension
containers come from trusted entities to avoid issues.
@z

@x
### Docker Desktop dev environments are not yet protected
@y
### Docker Desktop dev environments are not yet protected
@z

@x
Containers launched by the Docker Desktop Dev Environments feature are not yet
protected either. We expect to improve on this in future versions of Docker
Desktop.
@y
Containers launched by the Docker Desktop Dev Environments feature are not yet
protected either. We expect to improve on this in future versions of Docker
Desktop.
@z

@x
### Docker Debug containers are not yet protected
@y
### Docker Debug containers are not yet protected
@z

@x
[Docker Debug](https://docs.docker.com/reference/cli/docker/debug/) containers
are not yet protected by ECI. We expect to improve on this in future versions of
Docker Desktop.
@y
[Docker Debug](https://docs.docker.com/reference/cli/docker/debug/) containers
are not yet protected by ECI. We expect to improve on this in future versions of
Docker Desktop.
@z

@x
### Native Windows containers are not supported
@y
### Native Windows containers are not supported
@z

@x
ECI only works when Docker Desktop is in Linux containers mode (the default,
most common mode). It's not supported when Docker Desktop is configured in
native Windows containers mode (i.e., it's not supported on Windows hosts, when
Docker Desktop is switched from its default Linux mode to native Windows mode).
@y
ECI only works when Docker Desktop is in Linux containers mode (the default,
most common mode). It's not supported when Docker Desktop is configured in
native Windows containers mode (i.e., it's not supported on Windows hosts, when
Docker Desktop is switched from its default Linux mode to native Windows mode).
@z

@x
### Use in production
@y
### Use in production
@z

@x
In general users should not experience differences between running a container
in Docker Desktop with ECI enabled, which uses the Sysbox runtime, and running
that same container in production, through the standard OCI `runc` runtime.
@y
In general users should not experience differences between running a container
in Docker Desktop with ECI enabled, which uses the Sysbox runtime, and running
that same container in production, through the standard OCI `runc` runtime.
@z

@x
However in some cases, typically when running advanced or privileged workloads in
containers, users may experience some differences. In particular, the container
may run with ECI but not with `runc`, or vice-versa.
@y
However in some cases, typically when running advanced or privileged workloads in
containers, users may experience some differences. In particular, the container
may run with ECI but not with `runc`, or vice-versa.
@z
