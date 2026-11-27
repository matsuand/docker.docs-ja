%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Virtual Machine Manager
linkTitle: Virtual Machine Manager
keywords: virtualization software, resource allocation, mac, windows, linux, docker desktop, vm performance, apple silicon, wsl, hyper-v, qemu
description: Learn about Docker Desktop's Virtual Machine Manager options, including Docker VMM for Mac, Windows, and Linux
@y
title: Virtual Machine Manager
linkTitle: Virtual Machine Manager
keywords: virtualization software, resource allocation, mac, windows, linux, docker desktop, vm performance, apple silicon, wsl, hyper-v, qemu
description: Learn about Docker Desktop's Virtual Machine Manager options, including Docker VMM for Mac, Windows, and Linux
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
### Requirements
@y
### Requirements
@z

@x
- Mac: Apple silicon. For more information, see
  [Install Docker Desktop on Mac](/manuals/desktop/setup/install/mac-install.md).
- Windows: x86_64 (Arm isn't supported), with the Windows Hypervisor Platform
  and Virtual Machine Platform features turned on. For more information, see
  [Install Docker Desktop on Windows](/manuals/desktop/setup/install/windows-install.md).
- Linux: Docker Desktop 4.98 or later, and KVM access. For more information, see
  [Install Docker Desktop on Linux](/manuals/desktop/setup/install/linux/_index.md).
@y
- Mac: Apple silicon. For more information, see
  [Install Docker Desktop on Mac](/manuals/desktop/setup/install/mac-install.md).
- Windows: x86_64 (Arm isn't supported), with the Windows Hypervisor Platform
  and Virtual Machine Platform features turned on. For more information, see
  [Install Docker Desktop on Windows](/manuals/desktop/setup/install/windows-install.md).
- Linux: Docker Desktop 4.98 or later, and KVM access. For more information, see
  [Install Docker Desktop on Linux](/manuals/desktop/setup/install/linux/_index.md).
@z

@x
### Switch to Docker VMM
@y
### Switch to Docker VMM
@z

@x
Docker VMM requires at least 4 GB of memory allocated to the Docker Linux VM. If you
have less than that allocated, Docker Desktop asks you to confirm and then raises the
allocation to 4 GB for you.
@y
Docker VMM requires at least 4 GB of memory allocated to the Docker Linux VM. If you
have less than that allocated, Docker Desktop asks you to confirm and then raises the
allocation to 4 GB for you.
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
- Docker Desktop 4.35 through 4.85 is backed by `libkrun`
- Docker Desktop 4.86 and later uses Docker's own VMM implementation
@y
- Docker Desktop 4.35 through 4.85 is backed by `libkrun`
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
The all-users installer turns on the required Windows features when you choose Docker VMM. A per-user installation can't, so an administrator needs to enable Windows Hypervisor Platform if it isn't on already. To do this, run the following from an administrator PowerShell prompt, then restart Windows:
@y
The all-users installer turns on the required Windows features when you choose Docker VMM. A per-user installation can't, so an administrator needs to enable Windows Hypervisor Platform if it isn't on already. To do this, run the following from an administrator PowerShell prompt, then restart Windows:
@z

@x
```powershell
Enable-WindowsOptionalFeature -Online -FeatureName HypervisorPlatform -All
```
@y
```powershell
Enable-WindowsOptionalFeature -Online -FeatureName HypervisorPlatform -All
```
@z

@x
Hardware virtualization must also be enabled in your BIOS or UEFI settings. If you run Docker Desktop inside a virtual machine, the host must expose nested virtualization.
@y
Hardware virtualization must also be enabled in your BIOS or UEFI settings. If you run Docker Desktop inside a virtual machine, the host must expose nested virtualization.
@z

@x
To switch back, select **WSL 2**, or **Hyper-V** on all-users installations, in the same setting. Your images, containers, and volumes don't move between VMMs. For more information, see [Images, containers, and disk](#images-containers-and-disk).
@y
To switch back, select **WSL 2**, or **Hyper-V** on all-users installations, in the same setting. Your images, containers, and volumes don't move between VMMs. For more information, see [Images, containers, and disk](#images-containers-and-disk).
@z

@x
With Docker VMM, the Docker CLI works from PowerShell. It also works from within
your WSL distributions, with some limitations. For more information, see
[Use Docker from WSL distributions with Docker VMM](/manuals/desktop/features/wsl/_index.md#use-docker-from-wsl-distributions-with-docker-vmm).
@y
With Docker VMM, the Docker CLI works from PowerShell. It also works from within
your WSL distributions, with some limitations. For more information, see
[Use Docker from WSL distributions with Docker VMM](/manuals/desktop/features/wsl/_index.md#use-docker-from-wsl-distributions-with-docker-vmm).
@z

@x
{{< /tab >}}
{{< tab name="Linux" >}}
@y
{{< /tab >}}
{{< tab name="Linux" >}}
@z

@x
Docker VMM is available on Linux with Docker Desktop 4.98 and later.
@y
Docker VMM is available on Linux with Docker Desktop 4.98 and later.
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
If the option is unavailable, turn on **Beta features** in **Settings**.
@y
If the option is unavailable, turn on **Beta features** in **Settings**.
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
- On Windows, when a container bind mounts a directory that isn't shared, Docker
  Desktop asks you to share it. If you decline, you see a `not shared from the
  host` error. To share the directory, go to **Settings** > **Resources** >
  **File sharing** and add it.
- On Mac and Linux, to use a directory outside the default shared directories in
  a container, add it under **Settings** > **Resources** > **File sharing**.
@y
- A restart of Docker Desktop may be required after switching to Docker VMM.
- On Windows, when a container bind mounts a directory that isn't shared, Docker
  Desktop asks you to share it. If you decline, you see a `not shared from the
  host` error. To share the directory, go to **Settings** > **Resources** >
  **File sharing** and add it.
- On Mac and Linux, to use a directory outside the default shared directories in
  a container, add it under **Settings** > **Resources** > **File sharing**.
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
#### Windows only
@y
#### Windows only
@z

@x
- If you connect a drive while Docker Desktop is running, you must add it in **Settings** > **Resources** > **File sharing** and select **Apply & restart** before containers can use it. Accepting the file sharing prompt for that drive isn't enough.
- Creating a Unix domain socket in a bind-mounted directory fails with an `EINVAL` error if the socket's full Windows path is longer than 107 bytes.
@y
- If you connect a drive while Docker Desktop is running, you must add it in **Settings** > **Resources** > **File sharing** and select **Apply & restart** before containers can use it. Accepting the file sharing prompt for that drive isn't enough.
- Creating a Unix domain socket in a bind-mounted directory fails with an `EINVAL` error if the socket's full Windows path is longer than 107 bytes.
@z

@x
## Alternative VMM for Linux
@y
## Alternative VMM for Linux
@z

@x
### QEMU
@y
### QEMU
@z

@x
QEMU is the default VMM on Linux. It runs the Docker Desktop VM using KVM.
@y
QEMU is the default VMM on Linux. It runs the Docker Desktop VM using KVM.
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
For more information, see [Docker Desktop WSL 2 backend](/manuals/desktop/features/wsl/_index.md).
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

@x
### Compare Docker VMM with WSL 2 and Hyper-V
@y
### Compare Docker VMM with WSL 2 and Hyper-V
@z

@x
Docker VMM is designed specifically for running containers, and it can offer some advantages over the other VMMs on Windows:
@y
Docker VMM is designed specifically for running containers, and it can offer some advantages over the other VMMs on Windows:
@z

@x
- Faster start-up for the Docker Engine and for containers.
- Lower memory use when idle, with unused memory returned to Windows.
- Faster access to files on Windows drives through bind mounts, such as Git operations in large repositories.
- Faster network connections between containers and the host.
- Improved stability, because Docker controls the whole virtualization layer that runs your containers.
@y
- Faster start-up for the Docker Engine and for containers.
- Lower memory use when idle, with unused memory returned to Windows.
- Faster access to files on Windows drives through bind mounts, such as Git operations in large repositories.
- Faster network connections between containers and the host.
- Improved stability, because Docker controls the whole virtualization layer that runs your containers.
@z

@x
Unlike WSL 2, Docker VMM runs your containers in their own VM, separate from your WSL distributions, so updating or restarting WSL doesn't affect them. Your containers can also only access the Windows folders that you choose to share.
@y
Unlike WSL 2, Docker VMM runs your containers in their own VM, separate from your WSL distributions, so updating or restarting WSL doesn't affect them. Your containers can also only access the Windows folders that you choose to share.
@z

@x
Docker VMM also doesn't need administrator privileges, the privileged helper service, or `docker-users` group membership to run, and it's available on Windows Home and in per-user installations.
@y
Docker VMM also doesn't need administrator privileges, the privileged helper service, or `docker-users` group membership to run, and it's available on Windows Home and in per-user installations.
@z

@x
The following table summarizes how Docker VMM differs from WSL 2 and Hyper-V:
@y
The following table summarizes how Docker VMM differs from WSL 2 and Hyper-V:
@z

@x
|                                    | WSL 2                                             | Hyper-V                                       | Docker VMM                                    |
| ---------------------------------- | ------------------------------------------------- | --------------------------------------------- | --------------------------------------------- |
| Installation mode                  | Per-user or all-users                             | All-users only                                | Per-user or all-users                         |
| Windows Home                       | Supported                                         | Not supported                                 | Supported                                     |
| `docker-users` group membership    | Only if you turn on hosts file updates            | Required                                      | Not required                                  |
| Runs the Linux VM with             | The WSL 2 utility VM                              | Hyper-V                                       | Windows Hypervisor Platform                   |
| CPU, memory, and swap limits       | Set in `.wslconfig`                               | Set in **Settings** > **Resources**           | Set in **Settings** > **Resources**           |
| Docker in WSL distributions        | Full WSL integration                              | Not available                                 | Docker CLI only                               |
| GPU passthrough (`--gpus`)         | Supported, with NVIDIA GPUs                       | Not supported                                 | Not supported                                 |
@y
|                                    | WSL 2                                             | Hyper-V                                       | Docker VMM                                    |
| ---------------------------------- | ------------------------------------------------- | --------------------------------------------- | --------------------------------------------- |
| Installation mode                  | Per-user or all-users                             | All-users only                                | Per-user or all-users                         |
| Windows Home                       | Supported                                         | Not supported                                 | Supported                                     |
| `docker-users` group membership    | Only if you turn on hosts file updates            | Required                                      | Not required                                  |
| Runs the Linux VM with             | The WSL 2 utility VM                              | Hyper-V                                       | Windows Hypervisor Platform                   |
| CPU, memory, and swap limits       | Set in `.wslconfig`                               | Set in **Settings** > **Resources**           | Set in **Settings** > **Resources**           |
| Docker in WSL distributions        | Full WSL integration                              | Not available                                 | Docker CLI only                               |
| GPU passthrough (`--gpus`)         | Supported, with NVIDIA GPUs                       | Not supported                                 | Not supported                                 |
@z

@x
#### Memory and CPU with WSL distributions
@y
#### Memory and CPU with WSL distributions
@z

@x
With the WSL 2 engine, Docker Desktop runs in the same WSL 2 VM as your other WSL distributions, so they share one set of memory and CPU limits from your [`.wslconfig` file](https://learn.microsoft.com/en-us/windows/wsl/wsl-config#configure-global-options-with-wslconfig).
@y
With the WSL 2 engine, Docker Desktop runs in the same WSL 2 VM as your other WSL distributions, so they share one set of memory and CPU limits from your [`.wslconfig` file](https://learn.microsoft.com/en-us/windows/wsl/wsl-config#configure-global-options-with-wslconfig).
@z

@x
With Docker VMM, as with Hyper-V, Docker Desktop runs in its own VM, separate from WSL. If you also use WSL distributions, two Linux VMs run at the same time, each with its own limits:
@y
With Docker VMM, as with Hyper-V, Docker Desktop runs in its own VM, separate from WSL. If you also use WSL distributions, two Linux VMs run at the same time, each with its own limits:
@z

@x
- Docker VMM uses the **CPU limit**, **Memory limit**, and **Swap** settings in **Settings** > **Resources** > **Advanced**.
- Your WSL distributions keep using the limits in your `.wslconfig` file.
@y
- Docker VMM uses the **CPU limit**, **Memory limit**, and **Swap** settings in **Settings** > **Resources** > **Advanced**.
- Your WSL distributions keep using the limits in your `.wslconfig` file.
@z

@x
When you set either one, allow for the other, so that both VMs and Windows itself have enough memory.
@y
When you set either one, allow for the other, so that both VMs and Windows itself have enough memory.
@z

@x
#### File sharing
@y
#### File sharing
@z

@x
With the WSL 2 engine, containers can bind-mount any Windows path, and files inside your WSL distributions, without any setup.
@y
With the WSL 2 engine, containers can bind-mount any Windows path, and files inside your WSL distributions, without any setup.
@z

@x
With Docker VMM, containers can only bind-mount directories that are listed in **Settings** > **Resources** > **File sharing**. This list is empty until you add to it. Docker VMM adds the directory to the running VM, so you don't need to restart Docker Desktop. Hyper-V uses the same list of shared directories.
@y
With Docker VMM, containers can only bind-mount directories that are listed in **Settings** > **Resources** > **File sharing**. This list is empty until you add to it. Docker VMM adds the directory to the running VM, so you don't need to restart Docker Desktop. Hyper-V uses the same list of shared directories.
@z

@x
Docker VMM can't bind-mount files that are stored inside a WSL distribution, such as paths under `\\wsl.localhost\`. Keep projects that you bind-mount into containers on a Windows drive.
@y
Docker VMM can't bind-mount files that are stored inside a WSL distribution, such as paths under `\\wsl.localhost\`. Keep projects that you bind-mount into containers on a Windows drive.
@z

@x
#### WSL distributions
@y
#### WSL distributions
@z

@x
With Docker VMM, you can use the Docker CLI from your WSL 2 distributions, but not full WSL integration. `docker` and `docker compose` work without any setup, but there's no Docker socket in the distribution, and you can only bind-mount files that are stored on Windows drives. The **WSL integration** page in **Settings** > **Resources** applies only to the WSL 2 engine. For more information and the other limitations, see [Use Docker from WSL distributions with Docker VMM](/manuals/desktop/features/wsl/_index.md#use-docker-from-wsl-distributions-with-docker-vmm).
@y
With Docker VMM, you can use the Docker CLI from your WSL 2 distributions, but not full WSL integration. `docker` and `docker compose` work without any setup, but there's no Docker socket in the distribution, and you can only bind-mount files that are stored on Windows drives. The **WSL integration** page in **Settings** > **Resources** applies only to the WSL 2 engine. For more information and the other limitations, see [Use Docker from WSL distributions with Docker VMM](/manuals/desktop/features/wsl/_index.md#use-docker-from-wsl-distributions-with-docker-vmm).
@z

@x
#### Networking
@y
#### Networking
@z

@x
The **Add the \*.docker.internal names to the host's /etc/hosts file** setting is available only with the WSL 2 engine.
@y
The **Add the \*.docker.internal names to the host's /etc/hosts file** setting is available only with the WSL 2 engine.
@z

@x
#### GPU access
@y
#### GPU access
@z

@x
GPU passthrough to containers with `--gpus` is available only with the WSL 2 engine. If your containers need access to an NVIDIA GPU, use WSL 2. For more information, see [GPU support](/manuals/desktop/features/gpu.md).
@y
GPU passthrough to containers with `--gpus` is available only with the WSL 2 engine. If your containers need access to an NVIDIA GPU, use WSL 2. For more information, see [GPU support](/manuals/desktop/features/gpu.md).
@z

@x
#### Images, containers, and disk
@y
#### Images, containers, and disk
@z

@x
Each VMM stores its data in a separate disk image. Images, containers, and volumes that you create with one VMM aren't available in another. When you switch VMMs, the data from the previous VMM stays on disk, and is available again if you switch back.
@y
Each VMM stores its data in a separate disk image. Images, containers, and volumes that you create with one VMM aren't available in another. When you switch VMMs, the data from the previous VMM stays on disk, and is available again if you switch back.
@z

@x
By default, Docker VMM stores its disk image in `%LOCALAPPDATA%\Docker\vm-data`. To move it, go to **Settings** > **Resources** > **Advanced** and change **Disk image location**.
@y
By default, Docker VMM stores its disk image in `%LOCALAPPDATA%\Docker\vm-data`. To move it, go to **Settings** > **Resources** > **Advanced** and change **Disk image location**.
@z
