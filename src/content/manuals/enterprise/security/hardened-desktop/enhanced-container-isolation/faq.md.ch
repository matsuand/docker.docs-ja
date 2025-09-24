%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Enhanced Container Isolation FAQs
linkTitle: FAQs
description: Frequently asked questions about Enhanced Container Isolation
keywords: enhanced container isolation, faq, troubleshooting, docker desktop
@y
title: Enhanced Container Isolation FAQs
linkTitle: FAQs
description: Frequently asked questions about Enhanced Container Isolation
keywords: enhanced container isolation, faq, troubleshooting, docker desktop
@z

@x
{{< summary-bar feature_name="Hardened Docker Desktop" >}}
@y
{{< summary-bar feature_name="Hardened Docker Desktop" >}}
@z

@x
This page answers common questions about Enhanced Container Isolation (ECI) that aren't covered in the main documentation.
@y
This page answers common questions about Enhanced Container Isolation (ECI) that aren't covered in the main documentation.
@z

@x
## Do I need to change the way I use Docker when ECI is switched on?
@y
## Do I need to change the way I use Docker when ECI is switched on?
@z

@x
No. ECI works automatically in the background by creating more secure containers. You can continue using all your existing Docker commands, workflows, and development tools without any changes.
@y
No. ECI works automatically in the background by creating more secure containers. You can continue using all your existing Docker commands, workflows, and development tools without any changes.
@z

@x
## Do all container workloads work well with ECI?
@y
## Do all container workloads work well with ECI?
@z

@x
Most container workloads run without issues when ECI is turned on. However, some advanced workloads that require specific kernel-level access may not work. For details about which workloads are affected, see [ECI limitations](/manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/limitations.md).
@y
Most container workloads run without issues when ECI is turned on. However, some advanced workloads that require specific kernel-level access may not work. For details about which workloads are affected, see [ECI limitations](manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/limitations.md).
@z

@x
## Why not just restrict usage of the `--privileged` flag?
@y
## Why not just restrict usage of the `--privileged` flag?
@z

@x
Privileged containers serve legitimate purposes like Docker-in-Docker, Kubernetes-in-Docker, and accessing hardware devices. ECI provides a better solution by allowing these advanced workloads to run securely while preventing them from compromising the Docker Desktop VM.
@y
Privileged containers serve legitimate purposes like Docker-in-Docker, Kubernetes-in-Docker, and accessing hardware devices. ECI provides a better solution by allowing these advanced workloads to run securely while preventing them from compromising the Docker Desktop VM.
@z

@x
## Does ECI affect container performance?
@y
## Does ECI affect container performance?
@z

@x
ECI has minimal impact on container performance. The only exception is containers that perform many `mount` and `umount` system calls, as these are inspected by the Sysbox runtime for security. Most development workloads see no noticeable performance difference.
@y
ECI has minimal impact on container performance. The only exception is containers that perform many `mount` and `umount` system calls, as these are inspected by the Sysbox runtime for security. Most development workloads see no noticeable performance difference.
@z

@x
## Can I override the container runtime with ECI turned on?
@y
## Can I override the container runtime with ECI turned on?
@z

@x
No. When ECI is turned on, all containers use the Sysbox runtime regardless of any `--runtime` flags:
@y
No. When ECI is turned on, all containers use the Sysbox runtime regardless of any `--runtime` flags:
@z

@x
```console
$ docker run --runtime=runc alpine echo "test"
# This still uses sysbox-runc, not runc
```
@y
```console
$ docker run --runtime=runc alpine echo "test"
# This still uses sysbox-runc, not runc
```
@z

@x
The `--runtime` flag is ignored to prevent users from bypassing ECI security by running containers as true root in the Docker Desktop VM.
@y
The `--runtime` flag is ignored to prevent users from bypassing ECI security by running containers as true root in the Docker Desktop VM.
@z

@x
## Does ECI protect containers created before turning it on?
@y
## Does ECI protect containers created before turning it on?
@z

@x
No. ECI only protects containers created after it's turned on. Remove existing containers before turning on ECI:
@y
No. ECI only protects containers created after it's turned on. Remove existing containers before turning on ECI:
@z

@x
```console
$ docker stop $(docker ps -q)
$ docker rm $(docker ps -aq)
```
@y
```console
$ docker stop $(docker ps -q)
$ docker rm $(docker ps -aq)
```
@z

@x
For more details, see [Enable Enhanced Container Isolation](/manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/enable-eci.md).
@y
For more details, see [Enable Enhanced Container Isolation](manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/enable-eci.md).
@z

@x
## Which containers does ECI protect?
@y
## Which containers does ECI protect?
@z

@x
ECI protection varies by container type and Docker Desktop version:
@y
ECI protection varies by container type and Docker Desktop version:
@z

@x
### Always protected
@y
### Always protected
@z

@x
- Containers created with `docker run` and `docker create`
- Containers using the `docker-container` build driver
@y
- Containers created with `docker run` and `docker create`
- Containers using the `docker-container` build driver
@z

@x
### Version dependent
@y
### Version dependent
@z

@x
- Docker Build: Protected in Docker Desktop 4.30+ (except WSL 2)
- Kubernetes: Protected in Docker Desktop 4.38+ when using the kind provisioner
@y
- Docker Build: Protected in Docker Desktop 4.30+ (except WSL 2)
- Kubernetes: Protected in Docker Desktop 4.38+ when using the kind provisioner
@z

@x
### Not protected
@y
### Not protected
@z

@x
- Docker Extensions
- Docker Debug containers
- Kubernetes with Kubeadm provisioner
@y
- Docker Extensions
- Docker Debug containers
- Kubernetes with Kubeadm provisioner
@z

@x
For complete details, see [ECI limitations](/manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/limitations.md).
@y
For complete details, see [ECI limitations](manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/limitations.md).
@z

@x
## Can I mount the Docker socket with ECI turned on?
@y
## Can I mount the Docker socket with ECI turned on?
@z

@x
By default, no. ECI blocks Docker socket bind mounts for security. However, you can configure exceptions for trusted images like Testcontainers.
@y
By default, no. ECI blocks Docker socket bind mounts for security. However, you can configure exceptions for trusted images like Testcontainers.
@z

@x
For configuration details, see [Configure Docker socket exceptions](/manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/config.md).
@y
For configuration details, see [Configure Docker socket exceptions](manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/config.md).
@z

@x
## What bind mounts does ECI restrict?
@y
## What bind mounts does ECI restrict?
@z

@x
ECI restricts bind mounts of Docker Desktop VM directories but allows host directory mounts configured in Docker Desktop Settings.
@y
ECI restricts bind mounts of Docker Desktop VM directories but allows host directory mounts configured in Docker Desktop Settings.
@z
