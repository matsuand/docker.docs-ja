%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Enhanced Container Isolation - benefits, why use it, how it differs to
  Docker rootless, who it is for
keywords: containers, rootless, security, sysbox, runtime
title: What is Enhanced Container Isolation?
---
@y
---
description: Enhanced Container Isolation - benefits, why use it, how it differs to
  Docker rootless, who it is for
keywords: containers, rootless, security, sysbox, runtime
title: What is Enhanced Container Isolation?
---
@z

@x
> **Note**
>
> Enhanced Container Isolation is available to Docker Business customers only.
@y
> **Note**
>
> Enhanced Container Isolation is available to Docker Business customers only.
@z

@x
Enhanced Container Isolation provides an additional layer of security to prevent malicious workloads running in containers from compromising Docker Desktop or the host.
@y
Enhanced Container Isolation provides an additional layer of security to prevent malicious workloads running in containers from compromising Docker Desktop or the host.
@z

@x
It uses a variety of advanced techniques to harden container isolation, but without impacting developer productivity. It is available with [Docker Desktop 4.13.0 and later](../../release-notes.md).
@y
It uses a variety of advanced techniques to harden container isolation, but without impacting developer productivity. It is available with [Docker Desktop 4.13.0 and later](../../release-notes.md).
@z

@x
These techniques include:
- Running all containers unprivileged through the Linux user-namespace, even those launched with the `--privileged` flag. This makes it harder for malicious container workloads to escape the container and infect the Docker Desktop VM and host.
- Ensuring Docker Desktop VM immutability (e.g., its internal settings can't be modified by containers or users).
- Vetting some critical system calls to prevent container escapes, and partially virtualizing portions of `/proc` and `/sys` inside the container for further isolation.
- Preventing user console access to the Docker Desktop VM.
@y
These techniques include:
- Running all containers unprivileged through the Linux user-namespace, even those launched with the `--privileged` flag. This makes it harder for malicious container workloads to escape the container and infect the Docker Desktop VM and host.
- Ensuring Docker Desktop VM immutability (e.g., its internal settings can't be modified by containers or users).
- Vetting some critical system calls to prevent container escapes, and partially virtualizing portions of `/proc` and `/sys` inside the container for further isolation.
- Preventing user console access to the Docker Desktop VM.
@z

@x
When Enhanced Container Isolation is enabled, these mechanisms are applied automatically and with minimal functional or performance impact to developers. Developers continue to use Docker Desktop as usual, but the containers they launch are more strongly isolated.
@y
When Enhanced Container Isolation is enabled, these mechanisms are applied automatically and with minimal functional or performance impact to developers. Developers continue to use Docker Desktop as usual, but the containers they launch are more strongly isolated.
@z

@x
Enhanced Container Isolation ensures stronger container isolation and also locks in any security configurations that have been created by IT admins, for instance through [Registry Access Management policies](../../../security/for-admins/registry-access-management.md) or with [Settings Management](../settings-management/index.md).
@y
Enhanced Container Isolation ensures stronger container isolation and also locks in any security configurations that have been created by IT admins, for instance through [Registry Access Management policies](../../../security/for-admins/registry-access-management.md) or with [Settings Management](../settings-management/index.md).
@z

@x
> **Note**
>
> Enhanced Container Isolation is in addition to other container security techniques used by Docker. For example, reduced Linux Capabilities, Seccomp, AppArmor.
@y
> **Note**
>
> Enhanced Container Isolation is in addition to other container security techniques used by Docker. For example, reduced Linux Capabilities, Seccomp, AppArmor.
@z

@x
### Who is it for?
@y
### Who is it for?
@z

@x
- For organizations and developers that want to prevent container attacks and reduce vulnerabilities in developer environments.
- For organizations that want to ensure stronger container isolation that is easy and intuitive to implement on developers' machines.
@y
- For organizations and developers that want to prevent container attacks and reduce vulnerabilities in developer environments.
- For organizations that want to ensure stronger container isolation that is easy and intuitive to implement on developers' machines.
@z

@x
### What happens when Enhanced Container Isolation is turned on?
@y
### What happens when Enhanced Container Isolation is turned on?
@z

@x
When Enhanced Container Isolation is turned on, the following features are enabled:
@y
When Enhanced Container Isolation is turned on, the following features are enabled:
@z

@x
- All user containers are automatically run in Linux User Namespaces which ensures stronger isolation. Each container runs in a dedicated Linux user-namespace.
- The root user in the container maps to an unprivileged user inside the Docker Desktop Linux VM.
- Containers become harder to breach. For example, sensitive system calls are vetted and portions of `/proc` and `/sys` are emulated.
- Users can continue using containers as usual, including bind mounting host directories, volumes, etc.
- No change in the way developers run containers, and no special container images are required.
- Privileged containers (e.g., `--privileged` flag) work, but they are only privileged within the container's Linux User Namespace, not in the Docker Desktop VM. Therefore they can't be used to breach the Docker Desktop VM.
- Docker-in-Docker and even Kubernetes-in-Docker works, but run unprivileged inside the Docker Desktop Linux VM.
@y
- All user containers are automatically run in Linux User Namespaces which ensures stronger isolation. Each container runs in a dedicated Linux user-namespace.
- The root user in the container maps to an unprivileged user inside the Docker Desktop Linux VM.
- Containers become harder to breach. For example, sensitive system calls are vetted and portions of `/proc` and `/sys` are emulated.
- Users can continue using containers as usual, including bind mounting host directories, volumes, etc.
- No change in the way developers run containers, and no special container images are required.
- Privileged containers (e.g., `--privileged` flag) work, but they are only privileged within the container's Linux User Namespace, not in the Docker Desktop VM. Therefore they can't be used to breach the Docker Desktop VM.
- Docker-in-Docker and even Kubernetes-in-Docker works, but run unprivileged inside the Docker Desktop Linux VM.
@z

@x
In addition, the following restrictions are imposed:
@y
In addition, the following restrictions are imposed:
@z

@x
- Containers can no longer share namespaces with the Docker Desktop VM (e.g., `--network=host`, `--pid=host` are disallowed).
- Containers can no longer modify configuration files inside the Docker Desktop VM (e.g., mounting any VM directory into the container is disallowed).
- Containers can no longer access the Docker engine (e.g., mounting the Docker engine's socket into the container is restricted); this prevents malicious containers from gaining control of the Docker engine. Admins can relax this for [trusted container images](config.md).
- Console access to the Docker Desktop VM is forbidden for all users.
@y
- Containers can no longer share namespaces with the Docker Desktop VM (e.g., `--network=host`, `--pid=host` are disallowed).
- Containers can no longer modify configuration files inside the Docker Desktop VM (e.g., mounting any VM directory into the container is disallowed).
- Containers can no longer access the Docker engine (e.g., mounting the Docker engine's socket into the container is restricted); this prevents malicious containers from gaining control of the Docker engine. Admins can relax this for [trusted container images](config.md).
- Console access to the Docker Desktop VM is forbidden for all users.
@z

@x
These features and restrictions ensure that containers are better secured at runtime, with minimal impact to developer experience and productivity.
@y
These features and restrictions ensure that containers are better secured at runtime, with minimal impact to developer experience and productivity.
@z

@x
For more information on how Enhanced Container Isolation work, see [How does it work](how-eci-works.md).
@y
For more information on how Enhanced Container Isolation work, see [How does it work](how-eci-works.md).
@z

@x
> **Important**
>
> Enhanced Container Isolation does not protect Kubernetes pods. For more information on known limitations and workarounds, see [FAQs](../../../faq/security/eci-faq.md).
{ .important }
@y
> **Important**
>
> Enhanced Container Isolation does not protect Kubernetes pods. For more information on known limitations and workarounds, see [FAQs](../../../faq/security/eci-faq.md).
{ .important }
@z

@x
### What host OSes / platforms is Enhanced Container Isolation supported on?
@y
### What host OSes / platforms is Enhanced Container Isolation supported on?
@z

@x
Enhanced Container Isolation (ECI) was introduced in Docker Desktop 4.13, for all platforms (Windows, Mac, and Linux).
@y
Enhanced Container Isolation (ECI) was introduced in Docker Desktop 4.13, for all platforms (Windows, Mac, and Linux).
@z

@x
For Windows hosts, ECI works with both the Docker Desktop Hyper-V and WSL 2 backends, as follows:
@y
For Windows hosts, ECI works with both the Docker Desktop Hyper-V and WSL 2 backends, as follows:
@z

@x
- Docker Desktop 4.19 or prior: ECI only works with Hyper-V.
- Docker Desktop 4.20 or later: ECI Works with both Hyper-V and WSL 2 (with WSL version 1.1.3.0 and above).
@y
- Docker Desktop 4.19 or prior: ECI only works with Hyper-V.
- Docker Desktop 4.20 or later: ECI Works with both Hyper-V and WSL 2 (with WSL version 1.1.3.0 and above).
@z

@x
See [ECI Support for WSL](limitations.md#eci-support-for-wsl) for further info as well as security caveats when using Enhanced Container Isolation on WSL 2.
@y
See [ECI Support for WSL](limitations.md#eci-support-for-wsl) for further info as well as security caveats when using Enhanced Container Isolation on WSL 2.
@z

@x
### How do I enable Enhanced Container Isolation?
@y
### How do I enable Enhanced Container Isolation?
@z

@x
#### As a developer
@y
#### As a developer
@z

@x
To enable Enhanced Container Isolation as a developer:
1. Ensure your organization has a Docker Business subscription.
2. Log in to your organization in Docker Desktop. This will ensure the ECI feature is available to you in Docker Desktop's Settings menu.
3. Stop and remove all existing containers.
4. Navigate to **Settings** > **General** in Docker Desktop.
5. Next to **Use Enhanced Container Isolation**, select the checkbox.
6. Select **Apply and restart** to save your settings.
@y
To enable Enhanced Container Isolation as a developer:
1. Ensure your organization has a Docker Business subscription.
2. Log in to your organization in Docker Desktop. This will ensure the ECI feature is available to you in Docker Desktop's Settings menu.
3. Stop and remove all existing containers.
4. Navigate to **Settings** > **General** in Docker Desktop.
5. Next to **Use Enhanced Container Isolation**, select the checkbox.
6. Select **Apply and restart** to save your settings.
@z

@x
> **Important**
>
> Enhanced Container Isolation does not protect containers created prior to enabling ECI. For more information on known limitations and workarounds, see [FAQs](../../../faq/security/eci-faq.md).
{ .important }
@y
> **Important**
>
> Enhanced Container Isolation does not protect containers created prior to enabling ECI. For more information on known limitations and workarounds, see [FAQs](../../../faq/security/eci-faq.md).
{ .important }
@z

@x
#### As an admin
@y
#### As an admin
@z

@x
To enable Enhanced Container Isolation as an admin, you first need to [configure a `registry.json` file to enforce sign-in](../../../security/for-admins/configure-sign-in.md).
This is because the Enhanced Container Isolation feature requires a Docker
Business subscription and therefore your Docker Desktop users must authenticate
to your organization for this configuration to take effect.
@y
To enable Enhanced Container Isolation as an admin, you first need to [configure a `registry.json` file to enforce sign-in](../../../security/for-admins/configure-sign-in.md).
This is because the Enhanced Container Isolation feature requires a Docker
Business subscription and therefore your Docker Desktop users must authenticate
to your organization for this configuration to take effect.
@z

@x
Next, you must [create and configure the `admin-settings.json` file](../settings-management/configure.md) and specify:
@y
Next, you must [create and configure the `admin-settings.json` file](../settings-management/configure.md) and specify:
@z

@x
```json
{
  "configurationFileVersion": 2,
  "enhancedContainerIsolation": {
    "value": true,
    "locked": true
  }
}
```
@y
```json
{
  "configurationFileVersion": 2,
  "enhancedContainerIsolation": {
    "value": true,
    "locked": true
  }
}
```
@z

@x
By setting `"value": true`, the admin ensures ECI is enabled by default. By
setting `"locked": true`, the admin ensures ECI can't be disabled by
developers. If you wish to give developers the ability to disable the feature,
set `"locked": false`.
@y
By setting `"value": true`, the admin ensures ECI is enabled by default. By
setting `"locked": true`, the admin ensures ECI can't be disabled by
developers. If you wish to give developers the ability to disable the feature,
set `"locked": false`.
@z

@x
In addition, starting with Docker Desktop 4.27, admins can also configure Docker
socket mount permissions for containers, as described [here](config.md).
@y
In addition, starting with Docker Desktop 4.27, admins can also configure Docker
socket mount permissions for containers, as described [here](config.md).
@z

@x
For this to take effect:
@y
For this to take effect:
@z

@x
- On a new install, developers need to launch Docker Desktop and authenticate to their organization.
- On an existing install, developers need to quit Docker Desktop through the Docker menu, and then relaunch Docker Desktop. If they are already signed in, they don’t need to sign in again for the changes to take effect.
@y
- On a new install, developers need to launch Docker Desktop and authenticate to their organization.
- On an existing install, developers need to quit Docker Desktop through the Docker menu, and then relaunch Docker Desktop. If they are already signed in, they don’t need to sign in again for the changes to take effect.
@z

@x
> **Important**
>
> Selecting **Restart** from the Docker menu isn't enough as it only restarts some components of Docker Desktop.
{ .important }
@y
> **Important**
>
> Selecting **Restart** from the Docker menu isn't enough as it only restarts some components of Docker Desktop.
{ .important }
@z

@x
### What do users see when this setting is enforced by an admin?
@y
### What do users see when this setting is enforced by an admin?
@z

@x
When Enhanced Container Isolation is enabled, users see:
- **Use Enhanced Container Isolation** toggled on in **Settings** > **General**.
- Containers run within a Linux user namespace.
@y
When Enhanced Container Isolation is enabled, users see:
- **Use Enhanced Container Isolation** toggled on in **Settings** > **General**.
- Containers run within a Linux user namespace.
@z

@x
To check, run:
@y
To check, run:
@z

@x
```console
$ docker run --rm alpine cat /proc/self/uid_map
```
@y
```console
$ docker run --rm alpine cat /proc/self/uid_map
```
@z

@x
The following output displays:
@y
The following output displays:
@z

@x
```text
         0     100000      65536
```
@y
```text
         0     100000      65536
```
@z

@x
This indicates that the container's root user (0) maps to unprivileged user
(100000) in the Docker Desktop VM, and that the mapping extends for a range of
64K user-IDs. If a container process were to escape the container, it would
find itself without privileges at the VM level. The user-ID mapping varies with
each new container, as each container gets an exclusive range of host User-IDs
for isolation. User-ID mapping is automatically managed by Docker Desktop. For
further details, see [How Enhanced Container Isolation works](how-eci-works.md).
@y
This indicates that the container's root user (0) maps to unprivileged user
(100000) in the Docker Desktop VM, and that the mapping extends for a range of
64K user-IDs. If a container process were to escape the container, it would
find itself without privileges at the VM level. The user-ID mapping varies with
each new container, as each container gets an exclusive range of host User-IDs
for isolation. User-ID mapping is automatically managed by Docker Desktop. For
further details, see [How Enhanced Container Isolation works](how-eci-works.md).
@z

@x
In contrast, without ECI the Linux user namespace is not used for containers, the following displays:
@y
In contrast, without ECI the Linux user namespace is not used for containers, the following displays:
@z

@x
```text
         0          0 4294967295
```
@y
```text
         0          0 4294967295
```
@z

@x
This means that the root user in the container (0) is in fact the root user in the Docker Desktop VM (0) which reduces container isolation.
@y
This means that the root user in the container (0) is in fact the root user in the Docker Desktop VM (0) which reduces container isolation.
@z

@x
Since Enhanced Container Isolation [uses the Sysbox container runtime](how-eci-works.md) embedded in the Docker Desktop Linux VM, another way to determine if a container is running with Enhanced Container Isolation is by using `docker inspect`:
@y
Since Enhanced Container Isolation [uses the Sysbox container runtime](how-eci-works.md) embedded in the Docker Desktop Linux VM, another way to determine if a container is running with Enhanced Container Isolation is by using `docker inspect`:
@z

@x
```console
$ docker inspect --format='{{.HostConfig.Runtime}}' my_container
```
@y
```console
$ docker inspect --format='{{.HostConfig.Runtime}}' my_container
```
@z

@x
It outputs:
@y
It outputs:
@z

@x
```text
sysbox-runc
```
@y
```text
sysbox-runc
```
@z

@x
Without Enhanced Container Isolation, `docker inspect` outputs `runc`, which is the standard OCI runtime.
@y
Without Enhanced Container Isolation, `docker inspect` outputs `runc`, which is the standard OCI runtime.
@z
