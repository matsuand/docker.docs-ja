%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
linkTitle: Limitations
title: Enhanced Container Isolation limitations
description: Known limitations and platform-specific considerations for Enhanced Container Isolation
keywords: enhanced container isolation, limitations, wsl, hyper-v, kubernetes, docker build
@y
linkTitle: Limitations
title: Enhanced Container Isolation limitations
description: Known limitations and platform-specific considerations for Enhanced Container Isolation
keywords: enhanced container isolation, limitations, wsl, hyper-v, kubernetes, docker build
@z

@x
{{< summary-bar feature_name="Hardened Docker Desktop" >}}
@y
{{< summary-bar feature_name="Hardened Docker Desktop" >}}
@z

@x
Enhanced Container Isolation has some platform-specific limitations and feature constraints. Understanding these limitations helps you plan your security strategy and set appropriate expectations.
@y
Enhanced Container Isolation has some platform-specific limitations and feature constraints. Understanding these limitations helps you plan your security strategy and set appropriate expectations.
@z

@x
## WSL 2 security considerations
@y
## WSL 2 security considerations
@z

@x
> [!NOTE]
>
> Docker Desktop requires WSL 2 version 2.1.5 or later. Check your version with `wsl --version` and update with `wsl --update` if needed.
@y
> [!NOTE]
>
> Docker Desktop requires WSL 2 version 2.1.5 or later. Check your version with `wsl --version` and update with `wsl --update` if needed.
@z

@x
Enhanced Container Isolation provides different security levels depending on your Windows backend configuration.
@y
Enhanced Container Isolation provides different security levels depending on your Windows backend configuration.
@z

@x
The following table compares ECI on WSL 2 and ECI on Hyper-V:
@y
The following table compares ECI on WSL 2 and ECI on Hyper-V:
@z

@x
| Security feature                                   | ECI on WSL   | ECI on Hyper-V   | Comment               |
| -------------------------------------------------- | ------------ | ---------------- | --------------------- |
| Strongly secure containers                         | Yes          | Yes              | Makes it harder for malicious container workloads to breach the Docker Desktop Linux VM and host. |
| Docker Desktop Linux VM protected from user access | No           | Yes              | On WSL, users can access Docker Engine directly or bypass Docker Desktop security settings. |
| Docker Desktop Linux VM has a dedicated kernel     | No           | Yes              | On WSL, Docker Desktop can't guarantee the integrity of kernel level configs. |
@y
| Security feature                                   | ECI on WSL   | ECI on Hyper-V   | Comment               |
| -------------------------------------------------- | ------------ | ---------------- | --------------------- |
| Strongly secure containers                         | Yes          | Yes              | Makes it harder for malicious container workloads to breach the Docker Desktop Linux VM and host. |
| Docker Desktop Linux VM protected from user access | No           | Yes              | On WSL, users can access Docker Engine directly or bypass Docker Desktop security settings. |
| Docker Desktop Linux VM has a dedicated kernel     | No           | Yes              | On WSL, Docker Desktop can't guarantee the integrity of kernel level configs. |
@z

@x
WSL 2 security gaps include:
@y
WSL 2 security gaps include:
@z

@x
- Direct VM access: Users can bypass Docker Desktop security by accessing the VM directly: `wsl -d docker-desktop`. This gives users root access to modify Docker Engine settings and bypass
Settings Management configurations.
- Shared kernel vulnerability: All WSL 2 distributions share the same Linux kernel instance. Other WSL distributions can modify kernel settings that affect Docker Desktop's security.
@y
- Direct VM access: Users can bypass Docker Desktop security by accessing the VM directly: `wsl -d docker-desktop`. This gives users root access to modify Docker Engine settings and bypass
Settings Management configurations.
- Shared kernel vulnerability: All WSL 2 distributions share the same Linux kernel instance. Other WSL distributions can modify kernel settings that affect Docker Desktop's security.
@z

@x
### Recommendation
@y
### Recommendation
@z

@x
Use Hyper-V backend for maximum security. WSL 2 offers better performance and resource
utilization, but provides reduced security isolation.
@y
Use Hyper-V backend for maximum security. WSL 2 offers better performance and resource
utilization, but provides reduced security isolation.
@z

@x
## Windows containers not supported
@y
## Windows containers not supported
@z

@x
ECI only works with Linux containers (Docker Desktop's default mode). Native Windows
containers mode isn't supported.
@y
ECI only works with Linux containers (Docker Desktop's default mode). Native Windows
containers mode isn't supported.
@z

@x
## Docker Build protection varies
@y
## Docker Build protection varies
@z

@x
Docker Build protection depends on the driver and Docker Desktop version:
@y
Docker Build protection depends on the driver and Docker Desktop version:
@z

@x
| Build drive | Protection | Version requirements |
|:------------|:-----------|:---------------------|
| `docker` (default) | Protected | Docker Desktop 4.30 and later (except WSL 2) |
| `docker` (legacy) | Not protected | Docker Desktop versions before 4.30 |
| `docker-container` | Always protected | All Docker Desktop versions |
@y
| Build drive | Protection | Version requirements |
|:------------|:-----------|:---------------------|
| `docker` (default) | Protected | Docker Desktop 4.30 and later (except WSL 2) |
| `docker` (legacy) | Not protected | Docker Desktop versions before 4.30 |
| `docker-container` | Always protected | All Docker Desktop versions |
@z

@x
The following Docker Build features don't work with ECI:
@y
The following Docker Build features don't work with ECI:
@z

@x
- `docker build --network=host`
- Docker Buildx entitlements: `network.host`, `security.insecure`
@y
- `docker build --network=host`
- Docker Buildx entitlements: `network.host`, `security.insecure`
@z

@x
### Recommendation
@y
### Recommendation
@z

@x
Use `docker-container` build driver for builds requiring these features:
@y
Use `docker-container` build driver for builds requiring these features:
@z

@x
```console
$ docker buildx create --driver docker-container --use
$ docker buildx build --network=host .
```
@y
```console
$ docker buildx create --driver docker-container --use
$ docker buildx build --network=host .
```
@z

@x
## Docker Desktop Kubernetes not protected
@y
## Docker Desktop Kubernetes not protected
@z

@x
The integrated Kubernetes feature doesn't benefit from ECI protection. Malicious or privileged pods can compromise the Docker Desktop VM and bypass security controls.
@y
The integrated Kubernetes feature doesn't benefit from ECI protection. Malicious or privileged pods can compromise the Docker Desktop VM and bypass security controls.
@z

@x
### Recommendation
@y
### Recommendation
@z

@x
Use Kubernetes in Docker (KinD) for ECI-protected Kubernetes:
@y
Use Kubernetes in Docker (KinD) for ECI-protected Kubernetes:
@z

@x
```console
$ kind create cluster
```
@y
```console
$ kind create cluster
```
@z

@x
With ECI turned on, each Kubernetes node runs in an ECI-protected container, providing stronger isolation from the Docker Desktop VM.
@y
With ECI turned on, each Kubernetes node runs in an ECI-protected container, providing stronger isolation from the Docker Desktop VM.
@z

@x
## Unprotected container types
@y
## Unprotected container types
@z

@x
These container types currently don't benefit from ECI protection:
@y
These container types currently don't benefit from ECI protection:
@z

@x
- Docker Extensions: Extension containers run without ECI protection
- Docker Debug: Docker Debug containers bypass ECI restrictions
- Kubernetes pods: When using Docker Desktop's integrated Kubernetes
@y
- Docker Extensions: Extension containers run without ECI protection
- Docker Debug: Docker Debug containers bypass ECI restrictions
- Kubernetes pods: When using Docker Desktop's integrated Kubernetes
@z

@x
### Recommendation
@y
### Recommendation
@z

@x
Only use extensions from trusted sources and avoid Docker Debug in security-sensitive environments.
@y
Only use extensions from trusted sources and avoid Docker Debug in security-sensitive environments.
@z

@x
## Global command restrictions
@y
## Global command restrictions
@z

@x
Command lists apply to all containers allowed to mount the Docker socket. You can't configure different command restrictions per container image.
@y
Command lists apply to all containers allowed to mount the Docker socket. You can't configure different command restrictions per container image.
@z

@x
## Local-only images not supported
@y
## Local-only images not supported
@z

@x
You can't allow arbitrary local-only images (images not in a registry) to mount the Docker socket, unless they're:
@y
You can't allow arbitrary local-only images (images not in a registry) to mount the Docker socket, unless they're:
@z

@x
- Derived from an allowed base image (with `allowDerivedImages: true`)
- Using the wildcard allowlist (`"*"`, Docker Desktop 4.36 and later)
@y
- Derived from an allowed base image (with `allowDerivedImages: true`)
- Using the wildcard allowlist (`"*"`, Docker Desktop 4.36 and later)
@z

@x
## Unsupported Docker commands
@y
## Unsupported Docker commands
@z

@x
These Docker commands aren't yet supported in command list restrictions:
@y
These Docker commands aren't yet supported in command list restrictions:
@z

@x
- `compose`: Docker Compose commands
- `dev`: Development environment commands
- `extension`: Docker Extensions management
- `feedback`: Docker feedback submission
- `init`: Docker initialization commands
- `manifest`: Image manifest management
- `plugin`: Plugin management
- `sbom`: Software Bill of Materials
- `scout`: Docker Scout commands
- `trust`: Image trust management
@y
- `compose`: Docker Compose commands
- `dev`: Development environment commands
- `extension`: Docker Extensions management
- `feedback`: Docker feedback submission
- `init`: Docker initialization commands
- `manifest`: Image manifest management
- `plugin`: Plugin management
- `sbom`: Software Bill of Materials
- `scout`: Docker Scout commands
- `trust`: Image trust management
@z

@x
## Performance considerations
@y
## Performance considerations
@z

@x
### Derived images impact
@y
### Derived images impact
@z

@x
Enabling `allowDerivedImages: true` adds approximately 1 second to container startup time for image validation.
@y
Enabling `allowDerivedImages: true` adds approximately 1 second to container startup time for image validation.
@z

@x
### Registry dependencies
@y
### Registry dependencies
@z

@x
- Docker Desktop periodically fetches image digests from registries for validation
- Initial container starts require registry access to validate allowed images
- Network connectivity issues may cause delays in container startup
@y
- Docker Desktop periodically fetches image digests from registries for validation
- Initial container starts require registry access to validate allowed images
- Network connectivity issues may cause delays in container startup
@z

@x
### Image digest validation
@y
### Image digest validation
@z

@x
When allowed images are updated in registries, local containers may be unexpectedly blocked until you refresh the local image:
@y
When allowed images are updated in registries, local containers may be unexpectedly blocked until you refresh the local image:
@z

@x
```console
$ docker image rm <image>
$ docker pull <image>
```
@y
```console
$ docker image rm <image>
$ docker pull <image>
```
@z

@x
## Version compatibility
@y
## Version compatibility
@z

@x
ECI features have been introduced across different Docker Desktop versions:
@y
ECI features have been introduced across different Docker Desktop versions:
@z

@x
- Docker Desktop 4.36 and later: Wildcard allowlist support (`"*"`) and improved derived images handling
- Docker Desktop 4.34 and later: Derived images support (`allowDerivedImages`)
- Docker Desktop 4.30 and later: Docker Build protection with default driver (except WSL 2)
- Docker Desktop 4.13 and later: Core ECI functionality
@y
- Docker Desktop 4.36 and later: Wildcard allowlist support (`"*"`) and improved derived images handling
- Docker Desktop 4.34 and later: Derived images support (`allowDerivedImages`)
- Docker Desktop 4.30 and later: Docker Build protection with default driver (except WSL 2)
- Docker Desktop 4.13 and later: Core ECI functionality
@z

@x
For the latest feature availability, use the most recent Docker Desktop version.
@y
For the latest feature availability, use the most recent Docker Desktop version.
@z

@x
## Production compatibility
@y
## Production compatibility
@z

@x
### Container behavior differences
@y
### Container behavior differences
@z

@x
Most containers run identically with and without ECI. However, some advanced workloads may behave differently:
@y
Most containers run identically with and without ECI. However, some advanced workloads may behave differently:
@z

@x
- Containers requiring kernel module loading
- Workloads modifying global kernel settings (BPF, sysctl)
- Applications expecting specific privilege escalation behavior
- Tools requiring direct hardware device access
@y
- Containers requiring kernel module loading
- Workloads modifying global kernel settings (BPF, sysctl)
- Applications expecting specific privilege escalation behavior
- Tools requiring direct hardware device access
@z

@x
Test advanced workloads with ECI in development environments before production deployment to ensure compatibility.
@y
Test advanced workloads with ECI in development environments before production deployment to ensure compatibility.
@z

@x
### Runtime considerations
@y
### Runtime considerations
@z

@x
Containers using the Sysbox runtime (with ECI) may have subtle differences compared to standard OCI runc runtime in production. These differences typically only affect privileged or system-level operations.
@y
Containers using the Sysbox runtime (with ECI) may have subtle differences compared to standard OCI runc runtime in production. These differences typically only affect privileged or system-level operations.
@z
