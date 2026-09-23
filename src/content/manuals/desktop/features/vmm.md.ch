%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Virtual Machine Manager
linkTitle: Virtual Machine Manager
keywords: virtualization software, resource allocation, mac, windows, docker desktop, vm performance, apple silicon, wsl, hyper-v
description: Learn about Docker Desktop's Virtual Machine Manager options, including Docker VMM for Mac and Windows
@y
title: Virtual Machine Manager
linkTitle: Virtual Machine Manager
keywords: virtualization software, resource allocation, mac, windows, docker desktop, vm performance, apple silicon, wsl, hyper-v
description: Learn about Docker Desktop's Virtual Machine Manager options, including Docker VMM for Mac and Windows
@z

@x
Docker Desktop supports multiple Virtual Machine Managers (VMMs) to power the Linux VM that runs containers. The options available depend on your platform.
@y
Docker Desktop supports multiple Virtual Machine Managers (VMMs) to power the Linux VM that runs containers. The options available depend on your platform.
@z

@x
## Docker VMM
@y
## Docker VMM
@z

@x
{{< summary-bar feature_name="VMM" >}}
@y
{{< summary-bar feature_name="VMM" >}}
@z

@x
Docker VMM is a container-optimized virtual machine manager. Starting with
Docker Desktop 4.86, it uses Docker's own VMM implementation instead of
`libkrun`, which was used in versions 4.35 through 4.85 on Mac. Built specifically for container workloads, Docker VMM:
@y
Docker VMM is a container-optimized virtual machine manager. Starting with
Docker Desktop 4.86, it uses Docker's own VMM implementation instead of
`libkrun`, which was used in versions 4.35 through 4.85 on Mac. Built specifically for container workloads, Docker VMM:
@z

@x
- Returns idle memory to the host when containers aren't active, so Docker Desktop doesn't hold RAM it's not using
- Improves file I/O between container and host, reducing latency in the edit-compile-test loop
- Reduces engine and container start-up time
@y
- Returns idle memory to the host when containers aren't active, so Docker Desktop doesn't hold RAM it's not using
- Improves file I/O between container and host, reducing latency in the edit-compile-test loop
- Reduces engine and container start-up time
@z

@x
Because Docker controls the virtualization layer, it can be monitored and governed in ways that aren't possible with third-party backends. On Windows, Docker VMM provides a stable alternative to WSL 2 with a real VM boundary between the container environment and the host.
@y
Because Docker controls the virtualization layer, it can be monitored and governed in ways that aren't possible with third-party backends. On Windows, Docker VMM provides a stable alternative to WSL 2 with a real VM boundary between the container environment and the host.
@z

@x
### Switch to Docker VMM
@y
### Switch to Docker VMM
@z

@x
Docker VMM requires a minimum of 4 GB of memory allocated to the Docker Linux VM. Increase memory in **Settings** > **Resources** before switching.
@y
Docker VMM requires a minimum of 4 GB of memory allocated to the Docker Linux VM. Increase memory in **Settings** > **Resources** before switching.
@z

@x
{{< tabs >}}
{{< tab name="Mac (Apple Silicon)" >}}
@y
{{< tabs >}}
{{< tab name="Mac (Apple Silicon)" >}}
@z

@x
1. Go to **Settings** > **General** > **Virtual Machine Manager**.
2. Select **Docker VMM**.
3. Select **Apply & restart**.
@y
1. Go to **Settings** > **General** > **Virtual Machine Manager**.
2. Select **Docker VMM**.
3. Select **Apply & restart**.
@z

@x
If you previously had Docker VMM selected, which engine runs depends on your version:
@y
If you previously had Docker VMM selected, which engine runs depends on your version:
@z

@x
- Docker Desktop 4.35 and earlier is backed by `libkrun`
- Docker Desktop 4.86 and later uses Docker's own VMM implementation
@y
- Docker Desktop 4.35 and earlier is backed by `libkrun`
- Docker Desktop 4.86 and later uses Docker's own VMM implementation
@z

@x
If you're upgrading from version 4.35 onwards, your setting is preserved and Docker Desktop switches to the new Docker VMM automatically on restart.
@y
If you're upgrading from version 4.35 onwards, your setting is preserved and Docker Desktop switches to the new Docker VMM automatically on restart.
@z

@x
{{< /tab >}}
{{< tab name="Windows" >}}
@y
{{< /tab >}}
{{< tab name="Windows" >}}
@z

@x
1. Go to **Settings** > **General** > **Virtual Machine Manager**.
2. Select **Docker VMM**.
3. Select **Apply & restart**.
@y
1. Go to **Settings** > **General** > **Virtual Machine Manager**.
2. Select **Docker VMM**.
3. Select **Apply & restart**.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Known issues
@y
### Known issues
@z

@x
- A restart of Docker Desktop may be required after switching to Docker VMM.
- Docker VMM does not support bind mount auto-shares. If you see a `file is not shared from the host` error, go to **Settings** > **Resources** > **File sharing** and add the directory you want to share.
@y
- A restart of Docker Desktop may be required after switching to Docker VMM.
- Docker VMM does not support bind mount auto-shares. If you see a `file is not shared from the host` error, go to **Settings** > **Resources** > **File sharing** and add the directory you want to share.
@z

@x
#### Mac only
@y
#### Mac only
@z

@x
- Docker VMM does not currently support Rosetta, so emulation of amd64 architectures is slow. Docker is exploring potential solutions.
- Certain databases, such as MongoDB and Cassandra, may fail when using virtiofs with Docker VMM. This issue is expected to be resolved in a future release.
@y
- Docker VMM does not currently support Rosetta, so emulation of amd64 architectures is slow. Docker is exploring potential solutions.
- Certain databases, such as MongoDB and Cassandra, may fail when using virtiofs with Docker VMM. This issue is expected to be resolved in a future release.
@z

@x
## Alternative VMMs for Mac
@y
## Alternative VMMs for Mac
@z

@x
### Apple Virtualization framework
@y
### Apple Virtualization framework
@z

@x
The Apple Virtualization framework is a stable and well-established option for managing virtual machines on Mac. It has been a reliable choice for many Mac users over the years.
@y
The Apple Virtualization framework is a stable and well-established option for managing virtual machines on Mac. It has been a reliable choice for many Mac users over the years.
@z

@x
### HyperKit (Legacy) for Intel-based Macs
@y
### HyperKit (Legacy) for Intel-based Macs
@z

@x
> [!NOTE]
>
> HyperKit is deprecated. Docker recommends switching to the Apple Virtualization framework.
@y
> [!NOTE]
>
> HyperKit is deprecated. Docker recommends switching to the Apple Virtualization framework.
@z

@x
HyperKit is a legacy virtualization option for Intel-based Macs. Docker recommends switching to modern alternatives for better performance and to future-proof your setup.
@y
HyperKit is a legacy virtualization option for Intel-based Macs. Docker recommends switching to modern alternatives for better performance and to future-proof your setup.
@z

@x
## Alternative VMMs for Windows
@y
## Alternative VMMs for Windows
@z

@x
### WSL 2
@y
### WSL 2
@z

@x
WSL 2 (Windows Subsystem for Linux 2) is the default Windows backend for Docker Desktop. It runs a full Linux kernel inside a lightweight VM with tight integration into the Windows host file system and networking. WSL 2 is available in both per-user and all-users installation modes and does not require administrator privileges.
@y
WSL 2 (Windows Subsystem for Linux 2) is the default Windows backend for Docker Desktop. It runs a full Linux kernel inside a lightweight VM with tight integration into the Windows host file system and networking. WSL 2 is available in both per-user and all-users installation modes and does not require administrator privileges.
@z

@x
For more information, see [Docker Desktop WSL 2 backend](/manuals/desktop/features/wsl/_index.md).
@y
For more information, see [Docker Desktop WSL 2 backend](manuals/desktop/features/wsl/_index.md).
@z

@x
### Hyper-V
@y
### Hyper-V
@z

@x
Hyper-V is Windows' native hypervisor. It runs the Docker Linux VM in a fully isolated virtual machine, providing a strong boundary between the container environment and the Windows host. Hyper-V is only available in all-users installation mode and requires administrator privileges.
@y
Hyper-V is Windows' native hypervisor. It runs the Docker Linux VM in a fully isolated virtual machine, providing a strong boundary between the container environment and the Windows host. Hyper-V is only available in all-users installation mode and requires administrator privileges.
@z
