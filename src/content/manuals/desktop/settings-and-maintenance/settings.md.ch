%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: Learn about and change Docker Desktop's settings
keywords: settings, preferences, proxy, file sharing, resources, kubernetes, Docker
  Desktop, Linux, Mac, Windows
title: Change your Docker Desktop settings
linkTitle: Change settings
@y
description: Learn about and change Docker Desktop's settings
keywords: settings, preferences, proxy, file sharing, resources, kubernetes, Docker
  Desktop, Linux, Mac, Windows
title: Change your Docker Desktop settings
linkTitle: Change settings
@z

@x
To navigate to **Settings** either:
@y
To navigate to **Settings** either:
@z

@x
- Select the Docker menu {{< inline-image src="../images/whale-x.svg" alt="whale menu" >}} and then **Settings**
- Select the **Settings** icon from the Docker Desktop Dashboard.
@y
- Select the Docker menu {{< inline-image src="../images/whale-x.svg" alt="whale menu" >}} and then **Settings**
- Select the **Settings** icon from the Docker Desktop Dashboard.
@z

@x
You can also locate the `settings-store.json` file (or `settings.json` for Docker Desktop versions 4.34 and earlier) at:
 - Mac: `~/Library/Group\ Containers/group.com.docker/settings-store.json`
 - Windows: `C:\Users\[USERNAME]\AppData\Roaming\Docker\settings-store.json`
 - Linux: `~/.docker/desktop/settings-store.json`
@y
You can also locate the `settings-store.json` file (or `settings.json` for Docker Desktop versions 4.34 and earlier) at:
 - Mac: `~/Library/Group\ Containers/group.com.docker/settings-store.json`
 - Windows: `C:\Users\[USERNAME]\AppData\Roaming\Docker\settings-store.json`
 - Linux: `~/.docker/desktop/settings-store.json`
@z

@x
## General
@y
## General
@z

@x
On the **General** tab, you can configure when to start Docker and specify other settings:
@y
On the **General** tab, you can configure when to start Docker and specify other settings:
@z

@x
- **Start Docker Desktop when you sign in to your computer**. Select to automatically start Docker
  Desktop when you sign in to your machine.
@y
- **Start Docker Desktop when you sign in to your computer**. Select to automatically start Docker
  Desktop when you sign in to your machine.
@z

@x
- **Open Docker Dashboard when Docker Desktop starts**. Select to automatically open the
  dashboard when starting Docker Desktop.
@y
- **Open Docker Dashboard when Docker Desktop starts**. Select to automatically open the
  dashboard when starting Docker Desktop.
@z

@x
- **Choose theme for Docker Desktop**. Choose whether you want to apply a **Light** or **Dark** theme to Docker Desktop. Alternatively you can set Docker Desktop to **Use system settings**.
@y
- **Choose theme for Docker Desktop**. Choose whether you want to apply a **Light** or **Dark** theme to Docker Desktop. Alternatively you can set Docker Desktop to **Use system settings**.
@z

@x
- **Configure shell completions**. Automatically edits your shell configuration and gives you word completion for commands, flags, and Docker objects (such as container and volume names) when you hit `<Tab>` as you type into your terminal. For more information, see [Completion](/manuals/engine/cli/completion.md).
@y
- **Configure shell completions**. Automatically edits your shell configuration and gives you word completion for commands, flags, and Docker objects (such as container and volume names) when you hit `<Tab>` as you type into your terminal. For more information, see [Completion](manuals/engine/cli/completion.md).
@z

@x
- **Choose container terminal**. Determines which terminal is launched when opening the terminal from a container.
If you choose the integrated terminal, you can run commands in a running container straight from the Docker Desktop Dashboard. For more information, see [Explore containers](/manuals/desktop/use-desktop/container.md).
@y
- **Choose container terminal**. Determines which terminal is launched when opening the terminal from a container.
If you choose the integrated terminal, you can run commands in a running container straight from the Docker Desktop Dashboard. For more information, see [Explore containers](manuals/desktop/use-desktop/container.md).
@z

@x
- **Enable Docker terminal**. Interact with your host machine and execute commands directly from Docker Desktop.
@y
- **Enable Docker terminal**. Interact with your host machine and execute commands directly from Docker Desktop.
@z

@x
- **Enable Docker Debug by default**. Check this option to use Docker Debug by default when accessing the integrated terminal. For more information, see [Explore containers](/manuals/desktop/use-desktop/container.md#integrated-terminal).
@y
- **Enable Docker Debug by default**. Check this option to use Docker Debug by default when accessing the integrated terminal. For more information, see [Explore containers](manuals/desktop/use-desktop/container.md#integrated-terminal).
@z

@x
- {{< badge color=blue text="Mac only" >}}**Include VM in Time Machine backups**. Select to back up the Docker Desktop
  virtual machine. This option is turned off by default.
@y
- {{< badge color=blue text="Mac only" >}}**Include VM in Time Machine backups**. Select to back up the Docker Desktop
  virtual machine. This option is turned off by default.
@z

@x
- **Use containerd for pulling and storing images**.
  Turns on the containerd image store.
  This brings new features like faster container startup performance by lazy-pulling images,
  and the ability to run Wasm applications with Docker.
  For more information, see [containerd image store](/manuals/desktop/features/containerd.md).
@y
- **Use containerd for pulling and storing images**.
  Turns on the containerd image store.
  This brings new features like faster container startup performance by lazy-pulling images,
  and the ability to run Wasm applications with Docker.
  For more information, see [containerd image store](manuals/desktop/features/containerd.md).
@z

@x
- {{< badge color=blue text="Windows only" >}}**Expose daemon on tcp://localhost:2375 without TLS**. Check this option to
  enable legacy clients to connect to the Docker daemon. You must use this option
  with caution as exposing the daemon without TLS can result in remote code
  execution attacks.
@y
- {{< badge color=blue text="Windows only" >}}**Expose daemon on tcp://localhost:2375 without TLS**. Check this option to
  enable legacy clients to connect to the Docker daemon. You must use this option
  with caution as exposing the daemon without TLS can result in remote code
  execution attacks.
@z

@x
- {{< badge color=blue text="Windows only" >}}**Use the WSL 2 based engine**. WSL 2 provides better performance than the
  Hyper-V backend. For more information, see [Docker Desktop WSL 2 backend](/manuals/desktop/features/wsl/_index.md).
@y
- {{< badge color=blue text="Windows only" >}}**Use the WSL 2 based engine**. WSL 2 provides better performance than the
  Hyper-V backend. For more information, see [Docker Desktop WSL 2 backend](manuals/desktop/features/wsl/_index.md).
@z

@x
- {{< badge color=blue text="Windows only" >}}**Add the `*.docker.internal` names to the host's `/etc/hosts` file (Password required)**. Lets you resolve `*.docker.internal` DNS names from both the host and your containers.
@y
- {{< badge color=blue text="Windows only" >}}**Add the `*.docker.internal` names to the host's `/etc/hosts` file (Password required)**. Lets you resolve `*.docker.internal` DNS names from both the host and your containers.
@z

@x
- {{< badge color=blue text="Mac only" >}} **Choose Virtual Machine Manager (VMM)**. Choose the Virtual Machine Manager for creating and managing the Docker Desktop Linux VM.
  - Select **Docker VMM** for the latest and most performant Hypervisor/Virtual Machine Manager. This option is available only on Apple Silicon Macs running macOS 12.5 or later and is currently in Beta.
    > [!TIP]
    >
    > Turn this setting on to make Docker Desktop run faster.
  - Alternatively, you can choose **Apple Virtualization framework**, **QEMU** (for Apple Silicon  in Docker Desktop version 4.43 and earlier), or **HyperKit** (for Intel Macs). For macOS 12.5 and later, Apple Virtualization framework is the default setting.
@y
- {{< badge color=blue text="Mac only" >}} **Choose Virtual Machine Manager (VMM)**. Choose the Virtual Machine Manager for creating and managing the Docker Desktop Linux VM.
  - Select **Docker VMM** for the latest and most performant Hypervisor/Virtual Machine Manager. This option is available only on Apple Silicon Macs running macOS 12.5 or later and is currently in Beta.
    > [!TIP]
    >
    > Turn this setting on to make Docker Desktop run faster.
  - Alternatively, you can choose **Apple Virtualization framework**, **QEMU** (for Apple Silicon  in Docker Desktop version 4.43 and earlier), or **HyperKit** (for Intel Macs). For macOS 12.5 and later, Apple Virtualization framework is the default setting.
@z

@x
   For more information, see [Virtual Machine Manager](/manuals/desktop/features/vmm.md).
@y
   For more information, see [Virtual Machine Manager](manuals/desktop/features/vmm.md).
@z

@x
- {{< badge color=blue text="Mac only" >}}**Choose file sharing implementation for your containers**. Choose whether you want to share files using **VirtioFS**, **gRPC FUSE**, or **osxfs (Legacy)**. VirtioFS is only available for macOS 12.5 and later, and is turned on by default.
    > [!TIP]
    >
    > Use VirtioFS for speedy file sharing. VirtioFS has reduced the time taken to complete filesystem operations by [up to 98%](https://github.com/docker/roadmap/issues/7#issuecomment-1044452206). It is the only file sharing implementation supported by Docker VMM.
@y
- {{< badge color=blue text="Mac only" >}}**Choose file sharing implementation for your containers**. Choose whether you want to share files using **VirtioFS**, **gRPC FUSE**, or **osxfs (Legacy)**. VirtioFS is only available for macOS 12.5 and later, and is turned on by default.
    > [!TIP]
    >
    > Use VirtioFS for speedy file sharing. VirtioFS has reduced the time taken to complete filesystem operations by [up to 98%](https://github.com/docker/roadmap/issues/7#issuecomment-1044452206). It is the only file sharing implementation supported by Docker VMM.
@z

@x
- {{< badge color=blue text="Mac only" >}}**Use Rosetta for x86_64/amd64 emulation on Apple Silicon**. Turns on Rosetta to accelerate x86/AMD64 binary emulation on Apple Silicon. This option is only available if you have selected **Apple Virtualization framework** as the Virtual Machine Manager. You must also be on macOS 13 or later.
@y
- {{< badge color=blue text="Mac only" >}}**Use Rosetta for x86_64/amd64 emulation on Apple Silicon**. Turns on Rosetta to accelerate x86/AMD64 binary emulation on Apple Silicon. This option is only available if you have selected **Apple Virtualization framework** as the Virtual Machine Manager. You must also be on macOS 13 or later.
@z

@x
- **Send usage statistics**. Select so Docker Desktop sends diagnostics,
  crash reports, and usage data. This information helps Docker improve and
  troubleshoot the application. Clear the checkbox to opt out. Docker may
  periodically prompt you for more information.
@y
- **Send usage statistics**. Select so Docker Desktop sends diagnostics,
  crash reports, and usage data. This information helps Docker improve and
  troubleshoot the application. Clear the checkbox to opt out. Docker may
  periodically prompt you for more information.
@z

@x
- **Use Enhanced Container Isolation**. Select to enhance security by preventing containers from breaching the Linux VM. For more information, see [Enhanced Container Isolation](/manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/_index.md).
    > [!NOTE]
    >
    > This setting is only available if you are signed in to Docker Desktop and have a Docker Business subscription.
@y
- **Use Enhanced Container Isolation**. Select to enhance security by preventing containers from breaching the Linux VM. For more information, see [Enhanced Container Isolation](manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/_index.md).
    > [!NOTE]
    >
    > This setting is only available if you are signed in to Docker Desktop and have a Docker Business subscription.
@z

@x
- **Show CLI hints**. Displays CLI hints and tips when running Docker commands in the CLI. This is turned on by default. To turn CLI hints on or off from the CLI, set `DOCKER_CLI_HINTS` to `true` or `false` respectively.
@y
- **Show CLI hints**. Displays CLI hints and tips when running Docker commands in the CLI. This is turned on by default. To turn CLI hints on or off from the CLI, set `DOCKER_CLI_HINTS` to `true` or `false` respectively.
@z

@x
- **Enable Scout image analysis**. When this option is enabled, inspecting an image in Docker Desktop shows a **Start analysis** button that, when selected, analyzes the image with Docker Scout.
@y
- **Enable Scout image analysis**. When this option is enabled, inspecting an image in Docker Desktop shows a **Start analysis** button that, when selected, analyzes the image with Docker Scout.
@z

@x
- **Enable background SBOM indexing**. When this option is enabled, Docker Scout automatically analyzes images that you build or pull.
@y
- **Enable background SBOM indexing**. When this option is enabled, Docker Scout automatically analyzes images that you build or pull.
@z

@x
- {{< badge color=blue text="Mac only" >}}**Automatically check configuration**. Regularly checks your configuration to ensure no unexpected changes have been made by another application.
@y
- {{< badge color=blue text="Mac only" >}}**Automatically check configuration**. Regularly checks your configuration to ensure no unexpected changes have been made by another application.
@z

@x
  Docker Desktop checks if your setup, configured during installation, has been altered by external apps like Orbstack. Docker Desktop checks:
    - The symlinks of Docker binaries to `/usr/local/bin`.
    - The symlink of the default Docker socket. 
  Additionally, Docker Desktop ensures that the context is switched to `desktop-linux` on startup.
@y
  Docker Desktop checks if your setup, configured during installation, has been altered by external apps like Orbstack. Docker Desktop checks:
    - The symlinks of Docker binaries to `/usr/local/bin`.
    - The symlink of the default Docker socket. 
  Additionally, Docker Desktop ensures that the context is switched to `desktop-linux` on startup.
@z

@x
  You are notified if changes are found and are able to restore the configuration directly from the notification. For more information, see the [FAQs](/manuals/desktop/troubleshoot-and-support/faqs/macfaqs.md#why-do-i-keep-getting-a-notification-telling-me-an-application-has-changed-my-desktop-configurations).
@y
  You are notified if changes are found and are able to restore the configuration directly from the notification. For more information, see the [FAQs](manuals/desktop/troubleshoot-and-support/faqs/macfaqs.md#why-do-i-keep-getting-a-notification-telling-me-an-application-has-changed-my-desktop-configurations).
@z

@x
## Resources
@y
## Resources
@z

@x
The **Resources** tab allows you to configure CPU, memory, disk, proxies,
network, and other resources.
@y
The **Resources** tab allows you to configure CPU, memory, disk, proxies,
network, and other resources.
@z

@x
### Advanced
@y
### Advanced
@z

@x
> [!NOTE]
>
> On Windows, the **Resource allocation** options in the **Advanced** tab are only available in Hyper-V mode, because Windows manages
> the resources in WSL 2 mode and Windows container mode. In WSL 2
> mode, you can configure limits on the memory, CPU, and swap size allocated
> to the [WSL 2 utility VM](https://docs.microsoft.com/en-us/windows/wsl/wsl-config#configure-global-options-with-wslconfig).
@y
> [!NOTE]
>
> On Windows, the **Resource allocation** options in the **Advanced** tab are only available in Hyper-V mode, because Windows manages
> the resources in WSL 2 mode and Windows container mode. In WSL 2
> mode, you can configure limits on the memory, CPU, and swap size allocated
> to the [WSL 2 utility VM](https://docs.microsoft.com/en-us/windows/wsl/wsl-config#configure-global-options-with-wslconfig).
@z

@x
On the **Advanced** tab, you can limit resources available to the Docker Linux VM.
@y
On the **Advanced** tab, you can limit resources available to the Docker Linux VM.
@z

@x
Advanced settings are:
@y
Advanced settings are:
@z

@x
- **CPU limit**. Specify the maximum number of CPUs to be used by Docker Desktop.
  By default, Docker Desktop is set to use all the processors available on the host machine.
@y
- **CPU limit**. Specify the maximum number of CPUs to be used by Docker Desktop.
  By default, Docker Desktop is set to use all the processors available on the host machine.
@z

@x
- **Memory limit**. By default, Docker Desktop is set to use up to 50% of your host's
  memory. To increase the RAM, set this to a higher number; to decrease it,
  lower the number.
@y
- **Memory limit**. By default, Docker Desktop is set to use up to 50% of your host's
  memory. To increase the RAM, set this to a higher number; to decrease it,
  lower the number.
@z

@x
- **Swap**. Configure swap file size as needed. The default is 1 GB.
@y
- **Swap**. Configure swap file size as needed. The default is 1 GB.
@z

@x
- **Disk usage limit**. Specify the maximum amount of disk space the engine can use.
@y
- **Disk usage limit**. Specify the maximum amount of disk space the engine can use.
@z

@x
- **Disk image location**. Specify the location of the Linux volume where containers and images are stored.
@y
- **Disk image location**. Specify the location of the Linux volume where containers and images are stored.
@z

@x
  You can also move the disk image to a different location. If you attempt to
  move a disk image to a location that already has one, you are asked if you
  want to use the existing image or replace it.
@y
  You can also move the disk image to a different location. If you attempt to
  move a disk image to a location that already has one, you are asked if you
  want to use the existing image or replace it.
@z

@x
>[!TIP]
>
> If you feel Docker Desktop starting to get slow or you're running
> multi-container workloads, increase the memory and disk image space allocation
@y
>[!TIP]
>
> If you feel Docker Desktop starting to get slow or you're running
> multi-container workloads, increase the memory and disk image space allocation
@z

@x
- **Resource Saver**. Enable or disable [Resource Saver mode](/manuals/desktop/use-desktop/resource-saver.md),
  which significantly reduces CPU and memory utilization on the host by
  automatically turning off the Linux VM when Docker Desktop is idle (i.e., no
  containers are running).
@y
- **Resource Saver**. Enable or disable [Resource Saver mode](manuals/desktop/use-desktop/resource-saver.md),
  which significantly reduces CPU and memory utilization on the host by
  automatically turning off the Linux VM when Docker Desktop is idle (i.e., no
  containers are running).
@z

@x
  You can also configure the Resource Saver timeout which indicates how long
  should Docker Desktop be idle before Resource Saver mode kicks in. Default is
  5 minutes.
@y
  You can also configure the Resource Saver timeout which indicates how long
  should Docker Desktop be idle before Resource Saver mode kicks in. Default is
  5 minutes.
@z

@x
  > [!NOTE]
  >
  > Exit from Resource Saver mode occurs automatically when containers run. Exit
  > may take a few seconds (~3 to 10 secs) as Docker Desktop restarts the Linux VM.
@y
  > [!NOTE]
  >
  > Exit from Resource Saver mode occurs automatically when containers run. Exit
  > may take a few seconds (~3 to 10 secs) as Docker Desktop restarts the Linux VM.
@z

@x
### File sharing
@y
### File sharing
@z

@x
> [!NOTE]
>
> On Windows, the **File sharing** tab is only available in Hyper-V mode because the files
> are automatically shared in WSL 2 mode and Windows container mode.
@y
> [!NOTE]
>
> On Windows, the **File sharing** tab is only available in Hyper-V mode because the files
> are automatically shared in WSL 2 mode and Windows container mode.
@z

@x
Use File sharing to allow local directories on your machine to be shared with
Linux containers. This is especially useful for editing source code in an IDE on
the host while running and testing the code in a container.
@y
Use File sharing to allow local directories on your machine to be shared with
Linux containers. This is especially useful for editing source code in an IDE on
the host while running and testing the code in a container.
@z

@x
#### Synchronized file shares 
@y
#### Synchronized file shares 
@z

@x
Synchronized file shares is an alternative file sharing mechanism that provides fast and flexible host-to-VM file sharing, enhancing bind mount performance through the use of synchronized filesystem caches. Available with Pro, Team, and Business subscriptions.
@y
Synchronized file shares is an alternative file sharing mechanism that provides fast and flexible host-to-VM file sharing, enhancing bind mount performance through the use of synchronized filesystem caches. Available with Pro, Team, and Business subscriptions.
@z

@x
To learn more, see [Synchronized file share](/manuals/desktop/features/synchronized-file-sharing.md).
@y
To learn more, see [Synchronized file share](manuals/desktop/features/synchronized-file-sharing.md).
@z

@x
#### Virtual file shares
@y
#### Virtual file shares
@z

@x
By default the `/Users`, `/Volumes`, `/private`, `/tmp` and `/var/folders` directory are shared.
If your project is outside this directory then it must be added to the list,
otherwise you may get `Mounts denied` or `cannot start service` errors at runtime.
@y
By default the `/Users`, `/Volumes`, `/private`, `/tmp` and `/var/folders` directory are shared.
If your project is outside this directory then it must be added to the list,
otherwise you may get `Mounts denied` or `cannot start service` errors at runtime.
@z

@x
File share settings are:
@y
File share settings are:
@z

@x
- **Add a Directory**. Select `+` and navigate to the directory you want to add.
@y
- **Add a Directory**. Select `+` and navigate to the directory you want to add.
@z

@x
- **Remove a Directory**. Select `-` next to the directory you want to remove
@y
- **Remove a Directory**. Select `-` next to the directory you want to remove
@z

@x
- **Apply** makes the directory available to containers using Docker's
  bind mount (`-v`) feature.
@y
- **Apply** makes the directory available to containers using Docker's
  bind mount (`-v`) feature.
@z

@x
> [!TIP]
>
> * Share only the directories that you need with the container. File sharing
>   introduces overhead as any changes to the files on the host need to be notified
>   to the Linux VM. Sharing too many files can lead to high CPU load and slow
>   filesystem performance.
> * Shared folders are designed to allow application code to be edited
>   on the host while being executed in containers. For non-code items
>   such as cache directories or databases, the performance will be much
>   better if they are stored in the Linux VM, using a [data volume](/manuals/engine/storage/volumes.md)
>   (named volume) or [data container](/manuals/engine/storage/volumes.md).
> * If you share the whole of your home directory into a container, MacOS may
>   prompt you to give Docker access to personal areas of your home directory such as
>   your Reminders or Downloads.
> * By default, Mac file systems are case-insensitive while Linux is case-sensitive.
>   On Linux, it is possible to create two separate files: `test` and `Test`,
>   while on Mac these filenames would actually refer to the same underlying
>   file. This can lead to problems where an app works correctly on a developer's
>   machine (where the file contents are shared) but fails when run in Linux in
>   production (where the file contents are distinct). To avoid this, Docker Desktop
>   insists that all shared files are accessed as their original case. Therefore,
>   if a file is created called `test`, it must be opened as `test`. Attempts to
>   open `Test` will fail with the error "No such file or directory". Similarly,
>   once a file called `test` is created, attempts to create a second file called
>   `Test` will fail.
>
> For more information, see [Volume mounting requires file sharing for any project directories outside of `/Users`](/manuals/desktop/troubleshoot-and-support/troubleshoot/topics.md)
@y
> [!TIP]
>
> * Share only the directories that you need with the container. File sharing
>   introduces overhead as any changes to the files on the host need to be notified
>   to the Linux VM. Sharing too many files can lead to high CPU load and slow
>   filesystem performance.
> * Shared folders are designed to allow application code to be edited
>   on the host while being executed in containers. For non-code items
>   such as cache directories or databases, the performance will be much
>   better if they are stored in the Linux VM, using a [data volume](manuals/engine/storage/volumes.md)
>   (named volume) or [data container](manuals/engine/storage/volumes.md).
> * If you share the whole of your home directory into a container, MacOS may
>   prompt you to give Docker access to personal areas of your home directory such as
>   your Reminders or Downloads.
> * By default, Mac file systems are case-insensitive while Linux is case-sensitive.
>   On Linux, it is possible to create two separate files: `test` and `Test`,
>   while on Mac these filenames would actually refer to the same underlying
>   file. This can lead to problems where an app works correctly on a developer's
>   machine (where the file contents are shared) but fails when run in Linux in
>   production (where the file contents are distinct). To avoid this, Docker Desktop
>   insists that all shared files are accessed as their original case. Therefore,
>   if a file is created called `test`, it must be opened as `test`. Attempts to
>   open `Test` will fail with the error "No such file or directory". Similarly,
>   once a file called `test` is created, attempts to create a second file called
>   `Test` will fail.
>
> For more information, see [Volume mounting requires file sharing for any project directories outside of `/Users`](manuals/desktop/troubleshoot-and-support/troubleshoot/topics.md)
@z

@x
#### Shared folders on demand
@y
#### Shared folders on demand
@z

@x
On Windows, you can share a folder "on demand" the first time a particular folder is used by a container.
@y
On Windows, you can share a folder "on demand" the first time a particular folder is used by a container.
@z

@x
If you run a Docker command from a shell with a volume mount (as shown in the
example below) or kick off a Compose file that includes volume mounts, you get a
popup asking if you want to share the specified folder.
@y
If you run a Docker command from a shell with a volume mount (as shown in the
example below) or kick off a Compose file that includes volume mounts, you get a
popup asking if you want to share the specified folder.
@z

@x
You can select to **Share it**, in which case it is added to your Docker Desktop Shared Folders list and available to
containers. Alternatively, you can opt not to share it by selecting **Cancel**.
@y
You can select to **Share it**, in which case it is added to your Docker Desktop Shared Folders list and available to
containers. Alternatively, you can opt not to share it by selecting **Cancel**.
@z

@x
![Shared folder on demand](../images/shared-folder-on-demand.png)
@y
![Shared folder on demand](../images/shared-folder-on-demand.png)
@z

@x
### Proxies
@y
### Proxies
@z

@x
Docker Desktop supports the use of HTTP/HTTPS and [SOCKS5 proxies](/manuals/desktop/features/networking.md#socks5-proxy-support).
@y
Docker Desktop supports the use of HTTP/HTTPS and [SOCKS5 proxies](manuals/desktop/features/networking.md#socks5-proxy-support).
@z

@x
HTTP/HTTPS proxies can be used when:
@y
HTTP/HTTPS proxies can be used when:
@z

@x
- Signing in to Docker
- Pulling or pushing images
- Fetching artifacts during image builds
- Containers interact with the external network
- Scanning images
@y
- Signing in to Docker
- Pulling or pushing images
- Fetching artifacts during image builds
- Containers interact with the external network
- Scanning images
@z

@x
If the host uses a HTTP/HTTPS proxy configuration (static or via Proxy Auto-Configuration (PAC)), Docker Desktop reads
this configuration
and automatically uses these settings for signing in to Docker, for pulling and pushing images, and for
container Internet access. If the proxy requires authorization then Docker Desktop dynamically asks
the developer for a username and password. All passwords are stored securely in the OS credential store.
Note that only the `Basic` proxy authentication method is supported so we recommend using an `https://`
URL of your HTTP/HTTPS proxies to protect passwords while in transit on the network. Docker Desktop
supports TLS 1.3 when communicating with proxies.
@y
If the host uses a HTTP/HTTPS proxy configuration (static or via Proxy Auto-Configuration (PAC)), Docker Desktop reads
this configuration
and automatically uses these settings for signing in to Docker, for pulling and pushing images, and for
container Internet access. If the proxy requires authorization then Docker Desktop dynamically asks
the developer for a username and password. All passwords are stored securely in the OS credential store.
Note that only the `Basic` proxy authentication method is supported so we recommend using an `https://`
URL of your HTTP/HTTPS proxies to protect passwords while in transit on the network. Docker Desktop
supports TLS 1.3 when communicating with proxies.
@z

@x
To set a different proxy for Docker Desktop, turn on **Manual proxy configuration** and enter a single
upstream proxy URL of the form `http://proxy:port` or `https://proxy:port`.
@y
To set a different proxy for Docker Desktop, turn on **Manual proxy configuration** and enter a single
upstream proxy URL of the form `http://proxy:port` or `https://proxy:port`.
@z

@x
To prevent developers from accidentally changing the proxy settings, see
[Settings Management](/manuals/enterprise/security/hardened-desktop/settings-management/_index.md#what-features-can-i-configure-with-settings-management).
@y
To prevent developers from accidentally changing the proxy settings, see
[Settings Management](manuals/enterprise/security/hardened-desktop/settings-management/_index.md#what-features-can-i-configure-with-settings-management).
@z

@x
The HTTPS proxy settings used for scanning images are set using the `HTTPS_PROXY` environment variable.
@y
The HTTPS proxy settings used for scanning images are set using the `HTTPS_PROXY` environment variable.
@z

@x
> [!NOTE]
>
> If you are using a PAC file hosted on a web server, make sure to add the MIME type `application/x-ns-proxy-autoconfig` for the `.pac` file extension on the server or website. Without this configuration, the PAC file may not be parsed correctly. For more details on PAC files and Docker Desktop, see [Hardened Docker Desktop](/manuals/enterprise/security/hardened-desktop/air-gapped-containers.md#proxy-auto-configuration-files)
@y
> [!NOTE]
>
> If you are using a PAC file hosted on a web server, make sure to add the MIME type `application/x-ns-proxy-autoconfig` for the `.pac` file extension on the server or website. Without this configuration, the PAC file may not be parsed correctly. For more details on PAC files and Docker Desktop, see [Hardened Docker Desktop](manuals/enterprise/security/hardened-desktop/air-gapped-containers.md#proxy-auto-configuration-files)
@z

@x
> [!IMPORTANT]
> You cannot configure the proxy settings using the Docker daemon configuration
> file (`daemon.json`), and we recommend you do not configure the proxy
> settings via the Docker CLI configuration file (`config.json`).
>
> To manage proxy configurations for Docker Desktop, configure the settings in
> the Docker Desktop app or use [Settings Management](/manuals/enterprise/security/hardened-desktop/settings-management/_index.md).
@y
> [!IMPORTANT]
> You cannot configure the proxy settings using the Docker daemon configuration
> file (`daemon.json`), and we recommend you do not configure the proxy
> settings via the Docker CLI configuration file (`config.json`).
>
> To manage proxy configurations for Docker Desktop, configure the settings in
> the Docker Desktop app or use [Settings Management](manuals/enterprise/security/hardened-desktop/settings-management/_index.md).
@z

@x
#### Proxy authentication
@y
#### Proxy authentication
@z

@x
##### Basic authentication
@y
##### Basic authentication
@z

@x
If your proxy uses Basic authentication, Docker Desktop prompts developers for a username and password and caches the credentials. All passwords are stored securely in the OS credential store. It will request re-authentication if that cache is removed.
@y
If your proxy uses Basic authentication, Docker Desktop prompts developers for a username and password and caches the credentials. All passwords are stored securely in the OS credential store. It will request re-authentication if that cache is removed.
@z

@x
It's recommended that you use an `https://` URL of HTTP/HTTPS proxies to protect passwords during network transit. Docker Desktop also supports TLS 1.3 for communication with proxies.
@y
It's recommended that you use an `https://` URL of HTTP/HTTPS proxies to protect passwords during network transit. Docker Desktop also supports TLS 1.3 for communication with proxies.
@z

@x
##### Kerberos and NTLM authentication
@y
##### Kerberos and NTLM authentication
@z

@x
> [!NOTE]
>
> Available for Docker Business subscribers with Docker Desktop for Windows version 4.30 and later.
@y
> [!NOTE]
>
> Available for Docker Business subscribers with Docker Desktop for Windows version 4.30 and later.
@z

@x
Developers are no longer interrupted by prompts for proxy credentials as authentication is centralized. This also reduces the risk of account lockouts due to incorrect sign in attempts.
@y
Developers are no longer interrupted by prompts for proxy credentials as authentication is centralized. This also reduces the risk of account lockouts due to incorrect sign in attempts.
@z

@x
If your proxy offers multiple authentication schemes in 407 (Proxy Authentication Required) response, Docker Desktop by default selects the Basic authentication scheme.
@y
If your proxy offers multiple authentication schemes in 407 (Proxy Authentication Required) response, Docker Desktop by default selects the Basic authentication scheme.
@z

@x
For Docker Desktop version 4.30 to 4.31: 
@y
For Docker Desktop version 4.30 to 4.31: 
@z

@x
To enable Kerberos or NTLM proxy authentication, no additional configuration is needed beyond specifying the proxy IP address and port.
@y
To enable Kerberos or NTLM proxy authentication, no additional configuration is needed beyond specifying the proxy IP address and port.
@z

@x
For Docker Desktop version 4.32 and later: 
@y
For Docker Desktop version 4.32 and later: 
@z

@x
To enable Kerberos or NTLM proxy authentication you must pass the `--proxy-enable-kerberosntlm` installer flag during installation via the command line, and ensure your proxy server is properly configured for Kerberos or NTLM authentication.
@y
To enable Kerberos or NTLM proxy authentication you must pass the `--proxy-enable-kerberosntlm` installer flag during installation via the command line, and ensure your proxy server is properly configured for Kerberos or NTLM authentication.
@z

@x
### Network
@y
### Network
@z

@x
> [!NOTE]
>
> On Windows, the **Network** tab isn't available in the Windows container mode because
> Windows manages networking.
@y
> [!NOTE]
>
> On Windows, the **Network** tab isn't available in the Windows container mode because
> Windows manages networking.
@z

@x
Docker Desktop uses a private IPv4 network for internal services such as a DNS server and an HTTP proxy. In case Docker Desktop's choice of subnet clashes with IPs in your environment, you can specify a custom subnet using the **Network** setting.
@y
Docker Desktop uses a private IPv4 network for internal services such as a DNS server and an HTTP proxy. In case Docker Desktop's choice of subnet clashes with IPs in your environment, you can specify a custom subnet using the **Network** setting.
@z

@x
On Windows and Mac, you can also set the default networking mode and DNS resolution behavior. For more information, see [Networking](/manuals/desktop/features/networking.md#networking-mode-and-dns-behaviour-for-mac-and-windows).
@y
On Windows and Mac, you can also set the default networking mode and DNS resolution behavior. For more information, see [Networking](manuals/desktop/features/networking.md#networking-mode-and-dns-behaviour-for-mac-and-windows).
@z

@x
On Mac, you can also select the **Use kernel networking for UDP** setting. This lets you use a more efficient kernel networking path for UDP. This may not be compatible with your VPN software.
@y
On Mac, you can also select the **Use kernel networking for UDP** setting. This lets you use a more efficient kernel networking path for UDP. This may not be compatible with your VPN software.
@z

@x
### WSL Integration
@y
### WSL Integration
@z

@x
On Windows in WSL 2 mode, you can configure which WSL 2 distributions will have the Docker
WSL integration.
@y
On Windows in WSL 2 mode, you can configure which WSL 2 distributions will have the Docker
WSL integration.
@z

@x
By default, the integration is enabled on your default WSL distribution.
To change your default WSL distribution, run `wsl --set-default <distribution name>`. (For example,
to set Ubuntu as your default WSL distribution, run `wsl --set-default ubuntu`).
@y
By default, the integration is enabled on your default WSL distribution.
To change your default WSL distribution, run `wsl --set-default <distribution name>`. (For example,
to set Ubuntu as your default WSL distribution, run `wsl --set-default ubuntu`).
@z

@x
You can also select any additional distributions you would like to enable the WSL 2 integration on.
@y
You can also select any additional distributions you would like to enable the WSL 2 integration on.
@z

@x
For more details on configuring Docker Desktop to use WSL 2, see
[Docker Desktop WSL 2 backend](/manuals/desktop/features/wsl/_index.md).
@y
For more details on configuring Docker Desktop to use WSL 2, see
[Docker Desktop WSL 2 backend](manuals/desktop/features/wsl/_index.md).
@z

@x
## Docker Engine
@y
## Docker Engine
@z

@x
The **Docker Engine** tab allows you to configure the Docker daemon used to run containers with Docker Desktop.
@y
The **Docker Engine** tab allows you to configure the Docker daemon used to run containers with Docker Desktop.
@z

@x
You configure the daemon using a JSON configuration file. Here's what the file might look like:
@y
You configure the daemon using a JSON configuration file. Here's what the file might look like:
@z

@x
```json
{
  "builder": {
    "gc": {
      "defaultKeepStorage": "20GB",
      "enabled": true
    }
  },
  "experimental": false
}
```
@y
```json
{
  "builder": {
    "gc": {
      "defaultKeepStorage": "20GB",
      "enabled": true
    }
  },
  "experimental": false
}
```
@z

@x
You can find this file at `$HOME/.docker/daemon.json`. To change the configuration, either
edit the JSON configuration directly from the dashboard in Docker Desktop, or open and
edit the file using your favorite text editor.
@y
You can find this file at `$HOME/.docker/daemon.json`. To change the configuration, either
edit the JSON configuration directly from the dashboard in Docker Desktop, or open and
edit the file using your favorite text editor.
@z

@x
To see the full list of possible configuration options, see the
[dockerd command reference](/reference/cli/dockerd/).
@y
To see the full list of possible configuration options, see the
[dockerd command reference](__SUBDIR__/reference/cli/dockerd/).
@z

@x
Select **Apply** to save your settings.
@y
Select **Apply** to save your settings.
@z

@x
## Builders
@y
## Builders
@z

@x
If you have turned on the
[Docker Desktop Builds view](/manuals/desktop/use-desktop/builds.md), you can use the
**Builders** tab to inspect and manage builders in the Docker Desktop settings.
@y
If you have turned on the
[Docker Desktop Builds view](manuals/desktop/use-desktop/builds.md), you can use the
**Builders** tab to inspect and manage builders in the Docker Desktop settings.
@z

@x
### Inspect
@y
### Inspect
@z

@x
To inspect builders, find the builder that you want to inspect and select the
expand icon. You can only inspect active builders.
@y
To inspect builders, find the builder that you want to inspect and select the
expand icon. You can only inspect active builders.
@z

@x
Inspecting an active builder shows:
@y
Inspecting an active builder shows:
@z

@x
- BuildKit version
- Status
- Driver type
- Supported capabilities and platforms
- Disk usage
- Endpoint address
@y
- BuildKit version
- Status
- Driver type
- Supported capabilities and platforms
- Disk usage
- Endpoint address
@z

@x
### Select a different builder
@y
### Select a different builder
@z

@x
The **Selected builder** section displays the selected builder.
To select a different builder:
@y
The **Selected builder** section displays the selected builder.
To select a different builder:
@z

@x
1. Find the builder that you want to use under **Available builders**
2. Open the drop-down menu next to the builder's name.
3. Select **Use** to switch to this builder.
@y
1. Find the builder that you want to use under **Available builders**
2. Open the drop-down menu next to the builder's name.
3. Select **Use** to switch to this builder.
@z

@x
Your build commands now use the selected builder by default.
@y
Your build commands now use the selected builder by default.
@z

@x
### Create a builder
@y
### Create a builder
@z

@x
To create a builder, use the Docker CLI. See
[Create a new builder](/build/builders/manage/#create-a-new-builder)
@y
To create a builder, use the Docker CLI. See
[Create a new builder](__SUBDIR__/build/builders/manage/#create-a-new-builder)
@z

@x
### Remove a builder
@y
### Remove a builder
@z

@x
You can remove a builder if:
@y
You can remove a builder if:
@z

@x
- The builder isn't your [selected builder](/build/builders/#selected-builder)
- The builder isn't [associated with a Docker context](/build/builders/#default-builder).
@y
- The builder isn't your [selected builder](__SUBDIR__/build/builders/#selected-builder)
- The builder isn't [associated with a Docker context](__SUBDIR__/build/builders/#default-builder).
@z

@x
  To remove builders associated with a Docker context, remove the context using
  the `docker context rm` command.
@y
  To remove builders associated with a Docker context, remove the context using
  the `docker context rm` command.
@z

@x
To remove a builder:
@y
To remove a builder:
@z

@x
1. Find the builder that you want to remove under **Available builders**
2. Open the drop-down menu.
3. Select **Remove** to remove this builder.
@y
1. Find the builder that you want to remove under **Available builders**
2. Open the drop-down menu.
3. Select **Remove** to remove this builder.
@z

@x
If the builder uses the `docker-container` or `kubernetes` driver,
the build cache is also removed, along with the builder.
@y
If the builder uses the `docker-container` or `kubernetes` driver,
the build cache is also removed, along with the builder.
@z

@x
### Stop and start a builder
@y
### Stop and start a builder
@z

@x
Builders that use the
[`docker-container` driver](/build/builders/drivers/docker-container/)
run the BuildKit daemon in a container.
You can start and stop the BuildKit container using the drop-down menu.
@y
Builders that use the
[`docker-container` driver](__SUBDIR__/build/builders/drivers/docker-container/)
run the BuildKit daemon in a container.
You can start and stop the BuildKit container using the drop-down menu.
@z

@x
Running a build automatically starts the container if it's stopped.
@y
Running a build automatically starts the container if it's stopped.
@z

@x
You can only start and stop builders using the `docker-container` driver.
@y
You can only start and stop builders using the `docker-container` driver.
@z

@x
## Kubernetes
@y
## Kubernetes
@z

@x
> [!NOTE]
>
> On Windows the **Kubernetes** tab is not available in Windows container mode.
@y
> [!NOTE]
>
> On Windows the **Kubernetes** tab is not available in Windows container mode.
@z

@x
Docker Desktop includes a standalone Kubernetes server, so that you can test
deploying your Docker workloads on Kubernetes. To turn on Kubernetes support and
install a standalone instance of Kubernetes running as a Docker container,
select **Enable Kubernetes**.
@y
Docker Desktop includes a standalone Kubernetes server, so that you can test
deploying your Docker workloads on Kubernetes. To turn on Kubernetes support and
install a standalone instance of Kubernetes running as a Docker container,
select **Enable Kubernetes**.
@z

@x
With Docker Desktop version 4.38 and later, you can choose your cluster provisioning method:
 - **Kubeadm** creates a single-node cluster and the version is set by Docker Desktop.
 - **kind** creates a multi-node cluster and you can set the version and number of nodes. 
@y
With Docker Desktop version 4.38 and later, you can choose your cluster provisioning method:
 - **Kubeadm** creates a single-node cluster and the version is set by Docker Desktop.
 - **kind** creates a multi-node cluster and you can set the version and number of nodes. 
@z

@x
Select **Show system containers (advanced)** to view internal containers when
using Docker commands.
@y
Select **Show system containers (advanced)** to view internal containers when
using Docker commands.
@z

@x
Select **Reset Kubernetes cluster** to delete all stacks and Kubernetes resources.
@y
Select **Reset Kubernetes cluster** to delete all stacks and Kubernetes resources.
@z

@x
For more information about using the Kubernetes integration with Docker Desktop,
see [Deploy on Kubernetes](/manuals/desktop/features/kubernetes.md).
@y
For more information about using the Kubernetes integration with Docker Desktop,
see [Deploy on Kubernetes](manuals/desktop/features/kubernetes.md).
@z

@x
## Software updates
@y
## Software updates
@z

@x
The **Software updates** tab lets you manage your Docker Desktop updates. 
When there's a new update, you can choose to download the update right away, or
select the **Release Notes** option to learn what's included in the updated version.
@y
The **Software updates** tab lets you manage your Docker Desktop updates. 
When there's a new update, you can choose to download the update right away, or
select the **Release Notes** option to learn what's included in the updated version.
@z

@x
The **Automatically check for updates** setting notifies you of any updates available to Docker Desktop in the Docker menu and the footer of the Docker Desktop Dashboard. This is turned on by default. 
@y
The **Automatically check for updates** setting notifies you of any updates available to Docker Desktop in the Docker menu and the footer of the Docker Desktop Dashboard. This is turned on by default. 
@z

@x
To allow Docker Desktop to automatically download new updates in the background,
select **Always download updates**. This downloads newer versions of Docker Desktop
when an update becomes available. After downloading the update, select
**Apply and restart** to install the update. You can do this either through the
Docker menu or in the **Updates** section in the Docker Desktop Dashboard.
@y
To allow Docker Desktop to automatically download new updates in the background,
select **Always download updates**. This downloads newer versions of Docker Desktop
when an update becomes available. After downloading the update, select
**Apply and restart** to install the update. You can do this either through the
Docker menu or in the **Updates** section in the Docker Desktop Dashboard.
@z

@x
The **Automatically update components** setting checks whether components of Docker Desktop, such as Docker Compose, Docker Scout, and the Docker CLI, can be updated independently without the need for a full restart. This is turned on by default. 
@y
The **Automatically update components** setting checks whether components of Docker Desktop, such as Docker Compose, Docker Scout, and the Docker CLI, can be updated independently without the need for a full restart. This is turned on by default. 
@z

@x
## Extensions
@y
## Extensions
@z

@x
Use the **Extensions** tab to:
@y
Use the **Extensions** tab to:
@z

@x
- **Enable Docker Extensions**
- **Allow only extensions distributed through the Docker Marketplace**
- **Show Docker Extensions system containers**
@y
- **Enable Docker Extensions**
- **Allow only extensions distributed through the Docker Marketplace**
- **Show Docker Extensions system containers**
@z

@x
For more information about Docker extensions, see [Extensions](/manuals/extensions/_index.md).
@y
For more information about Docker extensions, see [Extensions](manuals/extensions/_index.md).
@z

@x
## Beta features
@y
## Beta features
@z

@x
Beta features provide access to future product functionality.
These features are intended for testing and feedback only as they may change
between releases without warning or remove them entirely from a future
release. Beta features must not be used in production environments.
Docker doesn't offer support for beta features.
@y
Beta features provide access to future product functionality.
These features are intended for testing and feedback only as they may change
between releases without warning or remove them entirely from a future
release. Beta features must not be used in production environments.
Docker doesn't offer support for beta features.
@z

@x
You can also sign up to the [Developer Preview program](https://www.docker.com/community/get-involved/developer-preview/) from the **Beta features** tab.
@y
You can also sign up to the [Developer Preview program](https://www.docker.com/community/get-involved/developer-preview/) from the **Beta features** tab.
@z

@x
For a list of current experimental features in the Docker CLI, see [Docker CLI Experimental features](https://github.com/docker/cli/blob/master/experimental/README.md).
@y
For a list of current experimental features in the Docker CLI, see [Docker CLI Experimental features](https://github.com/docker/cli/blob/master/experimental/README.md).
@z

@x
> [!IMPORTANT]
>
> For Docker Desktop versions 4.41 and earlier, there is also an **Experimental features** tab under the **Features in development** page.
>
> As with beta features, experimental features must not be used in production environments. Docker does not offer support for experimental features.
@y
> [!IMPORTANT]
>
> For Docker Desktop versions 4.41 and earlier, there is also an **Experimental features** tab under the **Features in development** page.
>
> As with beta features, experimental features must not be used in production environments. Docker does not offer support for experimental features.
@z

@x
## Notifications
@y
## Notifications
@z

@x
Use the **Notifications** tab to turn on or turn off notifications for the following events:
@y
Use the **Notifications** tab to turn on or turn off notifications for the following events:
@z

@x
- **Status updates on tasks and processes**
- **Recommendations from Docker**
- **Docker announcements**
- **Docker surveys**
@y
- **Status updates on tasks and processes**
- **Recommendations from Docker**
- **Docker announcements**
- **Docker surveys**
@z

@x
By default, all general notifications are turned on. You'll always receive error notifications and notifications about new Docker Desktop releases and updates.
@y
By default, all general notifications are turned on. You'll always receive error notifications and notifications about new Docker Desktop releases and updates.
@z

@x
You can also [configure notification settings for Docker Scout-related issues](/manuals/scout/explore/dashboard.md#notification-settings). 
@y
You can also [configure notification settings for Docker Scout-related issues](manuals/scout/explore/dashboard.md#notification-settings). 
@z

@x
Notifications momentarily appear in the lower-right of the Docker Desktop Dashboard and then move to the **Notifications** drawer which can be accessed from the top-right of the Docker Desktop Dashboard.
@y
Notifications momentarily appear in the lower-right of the Docker Desktop Dashboard and then move to the **Notifications** drawer which can be accessed from the top-right of the Docker Desktop Dashboard.
@z

@x
## Advanced
@y
## Advanced
@z

@x
On Mac, you can reconfigure your initial installation settings  on the **Advanced** tab:
@y
On Mac, you can reconfigure your initial installation settings  on the **Advanced** tab:
@z

@x
- **Choose how to configure the installation of Docker's CLI tools**.
  - **System**: Docker CLI tools are installed in the system directory under `/usr/local/bin`
  - **User**: Docker CLI tools are installed in the user directory under `$HOME/.docker/bin`. You must then add `$HOME/.docker/bin` to your PATH. To add `$HOME/.docker/bin` to your path:
      1. Open your shell configuration file. This is `~/.bashrc` if you're using a bash shell, or `~/.zshrc` if you're using a zsh shell.
      2. Copy and paste the following:
            ```console
            $ export PATH=$PATH:~/.docker/bin
            ```
     3. Save and the close the file. Restart your shell to apply the changes to the PATH variable.
@y
- **Choose how to configure the installation of Docker's CLI tools**.
  - **System**: Docker CLI tools are installed in the system directory under `/usr/local/bin`
  - **User**: Docker CLI tools are installed in the user directory under `$HOME/.docker/bin`. You must then add `$HOME/.docker/bin` to your PATH. To add `$HOME/.docker/bin` to your path:
      1. Open your shell configuration file. This is `~/.bashrc` if you're using a bash shell, or `~/.zshrc` if you're using a zsh shell.
      2. Copy and paste the following:
            ```console
            $ export PATH=$PATH:~/.docker/bin
            ```
     3. Save and the close the file. Restart your shell to apply the changes to the PATH variable.
@z

@x
- **Allow the default Docker socket to be used (Requires password)**. Creates `/var/run/docker.sock` which some third party clients may use to communicate with Docker Desktop. For more information, see [permission requirements for macOS](/manuals/desktop/setup/install/mac-permission-requirements.md#installing-symlinks).
@y
- **Allow the default Docker socket to be used (Requires password)**. Creates `/var/run/docker.sock` which some third party clients may use to communicate with Docker Desktop. For more information, see [permission requirements for macOS](manuals/desktop/setup/install/mac-permission-requirements.md#installing-symlinks).
@z

@x
- **Allow privileged port mapping (Requires password)**. Starts the privileged helper process which binds the ports that are between 1 and 1024. For more information, see [permission requirements for macOS](/manuals/desktop/setup/install/mac-permission-requirements.md#binding-privileged-ports).
@y
- **Allow privileged port mapping (Requires password)**. Starts the privileged helper process which binds the ports that are between 1 and 1024. For more information, see [permission requirements for macOS](manuals/desktop/setup/install/mac-permission-requirements.md#binding-privileged-ports).
@z

@x
For more information on each configuration and use case, see [Permission requirements](/manuals/desktop/setup/install/mac-permission-requirements.md).
@y
For more information on each configuration and use case, see [Permission requirements](manuals/desktop/setup/install/mac-permission-requirements.md).
@z
