%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Change your Docker Desktop settings on Windows
keywords: settings, preferences, proxy, file sharing, resources, kubernetes, Docker
  Desktop, Windows
title: Change Docker Desktop settings on Windows
---
@y
---
description: Change your Docker Desktop settings on Windows
keywords: settings, preferences, proxy, file sharing, resources, kubernetes, Docker
  Desktop, Windows
title: Change Docker Desktop settings on Windows
---
@z

@x
This page provides information on how to configure and manage your Docker Desktop settings.
@y
This page provides information on how to configure and manage your Docker Desktop settings.
@z

@x
To navigate to **Settings** either:
@y
To navigate to **Settings** either:
@z

@x
- Select the Docker menu {{< inline-image src="../images/whale-x.svg" alt="whale menu" >}} and then **Settings**
- Select the **Settings** icon from the Docker Dashboard.
@y
- Select the Docker menu {{< inline-image src="../images/whale-x.svg" alt="whale menu" >}} and then **Settings**
- Select the **Settings** icon from the Docker Dashboard.
@z

@x
You can also locate the `settings.json` file at `C:\Users\[USERNAME]\AppData\Roaming\Docker\settings.json`.
@y
You can also locate the `settings.json` file at `C:\Users\[USERNAME]\AppData\Roaming\Docker\settings.json`.
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
- **Start Docker Desktop when you sign in**. Select to automatically start Docker
  Desktop when you sign in to your machine.
@y
- **Start Docker Desktop when you sign in**. Select to automatically start Docker
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
- **Choose theme for Docker Desktop**. Choose whether you want to apply a **Light** or **Dark** theme to Docker Desktop. Alternatively you can set Docker Desktop to **Use System Settings**.
@y
- **Choose theme for Docker Desktop**. Choose whether you want to apply a **Light** or **Dark** theme to Docker Desktop. Alternatively you can set Docker Desktop to **Use System Settings**.
@z

@x
- **Use containerd for pulling and storing images**.
  Turns on the containerd image store.
  This brings new features like faster container startup performance by lazy-pulling images,
  and the ability to run Wasm applications with Docker.
  For more information, see [containerd image store](../containerd.md).
@y
- **Use containerd for pulling and storing images**.
  Turns on the containerd image store.
  This brings new features like faster container startup performance by lazy-pulling images,
  and the ability to run Wasm applications with Docker.
  For more information, see [containerd image store](../containerd.md).
@z

@x
- **Choose container terminal**. Determines which terminal is launched when opening the terminal from a container.
If you choose the integrated terminal, you can run commands in a running container straight from the Docker Dashboard. For more information, see [Explore containers](../use-desktop/container.md).
@y
- **Choose container terminal**. Determines which terminal is launched when opening the terminal from a container.
If you choose the integrated terminal, you can run commands in a running container straight from the Docker Dashboard. For more information, see [Explore containers](../use-desktop/container.md).
@z

@x
- **Expose daemon on tcp://localhost:2375 without TLS**. Check this option to
  enable legacy clients to connect to the Docker daemon. You must use this option
  with caution as exposing the daemon without TLS can result in remote code
  execution attacks.
@y
- **Expose daemon on tcp://localhost:2375 without TLS**. Check this option to
  enable legacy clients to connect to the Docker daemon. You must use this option
  with caution as exposing the daemon without TLS can result in remote code
  execution attacks.
@z

@x
- **Use the WSL 2 based engine**. WSL 2 provides better performance than the
  Hyper-V backend. For more information, see [Docker Desktop WSL 2 backend](../wsl/index.md).
@y
- **Use the WSL 2 based engine**. WSL 2 provides better performance than the
  Hyper-V backend. For more information, see [Docker Desktop WSL 2 backend](../wsl/index.md).
@z

@x
- **Add `*.docker.internal` to the host's `/etc/hosts` file. (Password required)**. Lets you resolve `*.docker.internal` DNS names from both the host and your containers.
@y
- **Add `*.docker.internal` to the host's `/etc/hosts` file. (Password required)**. Lets you resolve `*.docker.internal` DNS names from both the host and your containers.
@z

@x
- **Send usage statistics**. Select so Docker Desktop sends diagnostics,
  crash reports, and usage data. This information helps Docker improve and
  troubleshoot the application. Clear the check box to opt out. Docker may
  periodically prompt you for more information.
@y
- **Send usage statistics**. Select so Docker Desktop sends diagnostics,
  crash reports, and usage data. This information helps Docker improve and
  troubleshoot the application. Clear the check box to opt out. Docker may
  periodically prompt you for more information.
@z

@x
- **Show weekly tips**. Select to display useful advice and suggestions about
  using Docker.
@y
- **Show weekly tips**. Select to display useful advice and suggestions about
  using Docker.
@z

@x
- **Use Enhanced Container Isolation**. Select to enhance security by preventing containers from breaching the Linux VM. For more information, see [Enhanced Container Isolation](../hardened-desktop/enhanced-container-isolation/index.md)
    >**Note**
    >
    > This setting is only available if you are signed in to Docker Desktop and have a Docker Business subscription.
@y
- **Use Enhanced Container Isolation**. Select to enhance security by preventing containers from breaching the Linux VM. For more information, see [Enhanced Container Isolation](../hardened-desktop/enhanced-container-isolation/index.md)
    >**Note**
    >
    > This setting is only available if you are signed in to Docker Desktop and have a Docker Business subscription.
@z

@x
- **Show CLI hints**. Displays CLI hints and tips when running Docker commands in the CLI. This is turned on by default. To turn CLI hints on or off from the CLI, set `DOCKER_CLI_HINTS` to `true` or `false` respectively.
@y
- **Show CLI hints**. Displays CLI hints and tips when running Docker commands in the CLI. This is turned on by default. To turn CLI hints on or off from the CLI, set `DOCKER_CLI_HINTS` to `true` or `false` respectively.
@z

@x
- **SBOM Indexing**. When this option is enabled, inspecting an image in Docker Desktop shows a **Start analysis** button that, when selected, analyzes the image with Docker Scout.
@y
- **SBOM Indexing**. When this option is enabled, inspecting an image in Docker Desktop shows a **Start analysis** button that, when selected, analyzes the image with Docker Scout.
@z

@x
- **Enable background SBOM indexing**. When this option is enabled, Docker Scout automatically analyzes images that you build or pull.
@y
- **Enable background SBOM indexing**. When this option is enabled, Docker Scout automatically analyzes images that you build or pull.
@z

@x
## Resources
@y
## Resources
@z

@x
The **Resources** tab allows you to configure CPU, memory, disk, proxies,
network, and other resources.
Different settings are available for configuration depending on whether you are
using Linux containers in WSL 2 mode, Linux containers in Hyper-V mode, or Windows
containers.
@y
The **Resources** tab allows you to configure CPU, memory, disk, proxies,
network, and other resources.
Different settings are available for configuration depending on whether you are
using Linux containers in WSL 2 mode, Linux containers in Hyper-V mode, or Windows
containers.
@z

@x
### Advanced
@y
### Advanced
@z

@x
> **Note**
>
> The **Resource allocation** options in the **Advanced** tab are only available in Hyper-V mode, because Windows manages
> the resources in WSL 2 mode and Windows container mode. In WSL 2
> mode, you can configure limits on the memory, CPU, and swap size allocated
> to the [WSL 2 utility VM](https://docs.microsoft.com/en-us/windows/wsl/wsl-config#configure-global-options-with-wslconfig).
@y
> **Note**
>
> The **Resource allocation** options in the **Advanced** tab are only available in Hyper-V mode, because Windows manages
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
- **Memory limit**. By default, Docker Desktop is set to use up to `2` GB of your host's
  memory. To increase the RAM, set this to a higher number; to decrease it,
  lower the number.
@y
- **Memory limit**. By default, Docker Desktop is set to use up to `2` GB of your host's
  memory. To increase the RAM, set this to a higher number; to decrease it,
  lower the number.
@z

@x
- **Swap**. Configure swap file size as needed. The default is 1 GB.
@y
- **Swap**. Configure swap file size as needed. The default is 1 GB.
@z

@x
- **Virtual disk limit**. Specify the maximum size of the disk image.
@y
- **Virtual disk limit**. Specify the maximum size of the disk image.
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
>**Tip**
>
> If you feel Docker Desktop starting to get slow or you're running
> multi-container workloads, increase the memory and disk image space allocation
{ .tip }
@y
>**Tip**
>
> If you feel Docker Desktop starting to get slow or you're running
> multi-container workloads, increase the memory and disk image space allocation
{ .tip }
@z

@x
- **Resource Saver**. Enable or disable [Resource Saver mode](../use-desktop/resource-saver.md),
  which significantly reduces CPU and memory utilization on the host by
  automatically turning off the Linux VM when Docker Desktop is idle (i.e., no
  containers are running).
@y
- **Resource Saver**. Enable or disable [Resource Saver mode](../use-desktop/resource-saver.md),
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
  >**Note**
  >
  > Exit from Resource Saver mode occurs automatically when containers run. Exit
  > may take a few seconds (~3 to 10 secs) as Docker Desktop restarts the Linux VM.
@y
  >**Note**
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
> **Note**
>
> The **File sharing** tab is only available in Hyper-V mode because the files
> are automatically shared in WSL 2 mode and Windows container mode.
@y
> **Note**
>
> The **File sharing** tab is only available in Hyper-V mode because the files
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
Note that configuring file sharing is not necessary for Windows containers,
only [Linux containers](../faqs/windowsfaqs.md#how-do-i-switch-between-windows-and-linux-containers).
If a directory is not shared with a Linux container you may get `file not found`
or `cannot start service` errors at runtime. See [Volume mounting requires shared folders for Linux containers](../troubleshoot/topics.md).
@y
Note that configuring file sharing is not necessary for Windows containers,
only [Linux containers](../faqs/windowsfaqs.md#how-do-i-switch-between-windows-and-linux-containers).
If a directory is not shared with a Linux container you may get `file not found`
or `cannot start service` errors at runtime. See [Volume mounting requires shared folders for Linux containers](../troubleshoot/topics.md).
@z

@x
File share settings are:
@y
File share settings are:
@z

@x
- **Add a Directory**. select `+` and navigate to the directory you want to add.
@y
- **Add a Directory**. select `+` and navigate to the directory you want to add.
@z

@x
- **Remove a Directory**. select `-` next to the directory you want to remove
@y
- **Remove a Directory**. select `-` next to the directory you want to remove
@z

@x
- **Apply & Restart** makes the directory available to containers using Docker's
  bind mount (`-v`) feature.
@y
- **Apply & Restart** makes the directory available to containers using Docker's
  bind mount (`-v`) feature.
@z

@x
> Tips on shared folders, permissions, and volume mounts
>
> * Share only the directories that you need with the container. File sharing
>   introduces overhead as any changes to the files on the host need to be notified
>   to the Linux VM. Sharing too many files can lead to high CPU load and slow
>   filesystem performance.
> * Shared folders are designed to allow application code to be edited
>   on the host while being executed in containers. For non-code items
>   such as cache directories or databases, the performance will be much
>   better if they are stored in the Linux VM, using a [data volume](../../storage/volumes.md)
>   (named volume) or [data container](../../storage/volumes.md).
> * Docker Desktop sets permissions to read/write/execute for users, groups and
>   others [0777 or a+rwx](https://chmodcommand.com/chmod-0777/).
>   This is not configurable. See [Permissions errors on data directories for shared volumes](../troubleshoot/topics.md).
> * Windows presents a case-insensitive view of the filesystem to applications while Linux is case-sensitive.
>   On Linux, it is possible to create two separate files: `test` and `Test`,
>   while on Windows these filenames would actually refer to the same underlying
>   file. This can lead to problems where an app works correctly on a developer's
>   machine (where the file contents are shared) but fails when run in Linux in
>   production (where the file contents are distinct). To avoid this, Docker Desktop
>   insists that all shared files are accessed as their original case. Therefore,
>   if a file is created called `test`, it must be opened as `test`. Attempts to
>   open `Test` will fail with the error "No such file or directory". Similarly,
>   once a file called `test` is created, attempts to create a second file called
>   `Test` will fail.
{ .tip }
@y
> Tips on shared folders, permissions, and volume mounts
>
> * Share only the directories that you need with the container. File sharing
>   introduces overhead as any changes to the files on the host need to be notified
>   to the Linux VM. Sharing too many files can lead to high CPU load and slow
>   filesystem performance.
> * Shared folders are designed to allow application code to be edited
>   on the host while being executed in containers. For non-code items
>   such as cache directories or databases, the performance will be much
>   better if they are stored in the Linux VM, using a [data volume](../../storage/volumes.md)
>   (named volume) or [data container](../../storage/volumes.md).
> * Docker Desktop sets permissions to read/write/execute for users, groups and
>   others [0777 or a+rwx](https://chmodcommand.com/chmod-0777/).
>   This is not configurable. See [Permissions errors on data directories for shared volumes](../troubleshoot/topics.md).
> * Windows presents a case-insensitive view of the filesystem to applications while Linux is case-sensitive.
>   On Linux, it is possible to create two separate files: `test` and `Test`,
>   while on Windows these filenames would actually refer to the same underlying
>   file. This can lead to problems where an app works correctly on a developer's
>   machine (where the file contents are shared) but fails when run in Linux in
>   production (where the file contents are distinct). To avoid this, Docker Desktop
>   insists that all shared files are accessed as their original case. Therefore,
>   if a file is created called `test`, it must be opened as `test`. Attempts to
>   open `Test` will fail with the error "No such file or directory". Similarly,
>   once a file called `test` is created, attempts to create a second file called
>   `Test` will fail.
{ .tip }
@z

@x
#### Shared folders on demand
@y
#### Shared folders on demand
@z

@x
You can share a folder "on demand" the first time a particular folder is used by a container.
@y
You can share a folder "on demand" the first time a particular folder is used by a container.
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
If the host uses a HTTP/HTTPS proxy configuration (static or via Proxy Auto-Configuration), Docker Desktop reads
this configuration
and automatically uses these settings for signing into Docker, for pulling and pushing images, and for
container Internet access. If the proxy requires authorization then Docker Desktop dynamically asks
the developer for a username and password. All passwords are stored securely in the OS credential store.
Note that only the `Basic` proxy authentication method is supported so we recommend using an `https://`
URL for your HTTP/HTTPS proxies to protect passwords while in transit on the network. Docker Desktop
supports TLS 1.3 when communicating with proxies.
@y
If the host uses a HTTP/HTTPS proxy configuration (static or via Proxy Auto-Configuration), Docker Desktop reads
this configuration
and automatically uses these settings for signing into Docker, for pulling and pushing images, and for
container Internet access. If the proxy requires authorization then Docker Desktop dynamically asks
the developer for a username and password. All passwords are stored securely in the OS credential store.
Note that only the `Basic` proxy authentication method is supported so we recommend using an `https://`
URL for your HTTP/HTTPS proxies to protect passwords while in transit on the network. Docker Desktop
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
[Settings Management](../hardened-desktop/settings-management/index.md#what-features-can-i-configure-with-settings-management).
@y
To prevent developers from accidentally changing the proxy settings, see
[Settings Management](../hardened-desktop/settings-management/index.md#what-features-can-i-configure-with-settings-management).
@z

@x
The HTTPS proxy settings used for scanning images are set using the `HTTPS_PROXY` environment variable.
@y
The HTTPS proxy settings used for scanning images are set using the `HTTPS_PROXY` environment variable.
@z

@x
If you are running Windows containers in Docker, you can allow the Windows Docker daemon to use Docker Desktop's internal proxy, with the **Use proxy for Windows Docker daemon** setting.
This is useful when a corporate proxy that requires authentication is manually configured or set at the system level. If you are an admin for your organization and have a Docker Business subscription, you can control this setting with [Settings management](../hardened-desktop/settings-management/configure.md) using the `windowsDockerdPort` parameter.
@y
If you are running Windows containers in Docker, you can allow the Windows Docker daemon to use Docker Desktop's internal proxy, with the **Use proxy for Windows Docker daemon** setting.
This is useful when a corporate proxy that requires authentication is manually configured or set at the system level. If you are an admin for your organization and have a Docker Business subscription, you can control this setting with [Settings management](../hardened-desktop/settings-management/configure.md) using the `windowsDockerdPort` parameter.
@z

@x
### Network
@y
### Network
@z

@x
> **Note**
>
> The **Network** tab isn't available in the Windows container mode because
> Windows manages networking.
@y
> **Note**
>
> The **Network** tab isn't available in the Windows container mode because
> Windows manages networking.
@z

@x
{{< include "desktop-network-setting.md" >}}
@y
{{< include "desktop-network-setting.md" >}}
@z

@x
### WSL Integration
@y
### WSL Integration
@z

@x
In WSL 2 mode, you can configure which WSL 2 distributions will have the Docker
WSL integration.
@y
In WSL 2 mode, you can configure which WSL 2 distributions will have the Docker
WSL integration.
@z

@x
By default, the integration is enabled on your default WSL distribution.
To change your default WSL distro, run `wsl --set-default <distro name>`. (For example,
to set Ubuntu as your default WSL distro, run `wsl --set-default ubuntu`).
@y
By default, the integration is enabled on your default WSL distribution.
To change your default WSL distro, run `wsl --set-default <distro name>`. (For example,
to set Ubuntu as your default WSL distro, run `wsl --set-default ubuntu`).
@z

@x
You can also select any additional distributions you would like to enable the WSL 2 integration on.
@y
You can also select any additional distributions you would like to enable the WSL 2 integration on.
@z

@x
For more details on configuring Docker Desktop to use WSL 2, see
[Docker Desktop WSL 2 backend](../wsl/index.md).
@y
For more details on configuring Docker Desktop to use WSL 2, see
[Docker Desktop WSL 2 backend](../wsl/index.md).
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
[dockerd command reference](/engine/reference/commandline/dockerd/).
@y
To see the full list of possible configuration options, see the
[dockerd command reference](/engine/reference/commandline/dockerd/).
@z

@x
Select **Apply & Restart** to save your settings and restart Docker Desktop.
@y
Select **Apply & Restart** to save your settings and restart Docker Desktop.
@z

@x
## Builders
@y
## Builders
@z

@x
{{< include "desktop-builders-setting.md" >}}
@y
{{< include "desktop-builders-setting.md" >}}
@z

@x
## Kubernetes
@y
## Kubernetes
@z

@x
> **Note**
>
> The **Kubernetes** tab is not available in Windows container mode.
@y
> **Note**
>
> The **Kubernetes** tab is not available in Windows container mode.
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
see [Deploy on Kubernetes](../kubernetes.md).
@y
For more information about using the Kubernetes integration with Docker Desktop,
see [Deploy on Kubernetes](../kubernetes.md).
@z

@x
## Software Updates
@y
## Software Updates
@z

@x
The **Software Updates** tab notifies you of any updates available to Docker Desktop.
When there's a new update, you can choose to download the update right away, or
select the **Release Notes** option to learn what's included in the updated version.
@y
The **Software Updates** tab notifies you of any updates available to Docker Desktop.
When there's a new update, you can choose to download the update right away, or
select the **Release Notes** option to learn what's included in the updated version.
@z

@x
Turn off the check for updates by clearing the **Automatically check for updates**
check box. This disables notifications in the Docker menu and the notification
badge that appears on the Docker Dashboard. To check for updates manually, select
the **Check for updates** option in the Docker menu.
@y
Turn off the check for updates by clearing the **Automatically check for updates**
check box. This disables notifications in the Docker menu and the notification
badge that appears on the Docker Dashboard. To check for updates manually, select
the **Check for updates** option in the Docker menu.
@z

@x
To allow Docker Desktop to automatically download new updates in the background,
select **Always download updates**. This downloads newer versions of Docker Desktop
when an update becomes available. After downloading the update, select
**Apply and Restart** to install the update. You can do this either through the
Docker menu or in the **Updates** section in the Docker Dashboard.
@y
To allow Docker Desktop to automatically download new updates in the background,
select **Always download updates**. This downloads newer versions of Docker Desktop
when an update becomes available. After downloading the update, select
**Apply and Restart** to install the update. You can do this either through the
Docker menu or in the **Updates** section in the Docker Dashboard.
@z

@x
## Features in development
@y
## Features in development
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
For more information about Docker extensions, see [Extensions](../extensions/index.md).
@y
For more information about Docker extensions, see [Extensions](../extensions/index.md).
@z

@x
## Feature control
@y
## Feature control
@z

@x
On the **Feature control** tab you can control your settings for **Beta features** and **Experimental features**.
@y
On the **Feature control** tab you can control your settings for **Beta features** and **Experimental features**.
@z

@x
You can also sign up to the [Developer Preview Program](https://www.docker.com/community/get-involved/developer-preview/) from the **Features in development** tab.
@y
You can also sign up to the [Developer Preview Program](https://www.docker.com/community/get-involved/developer-preview/) from the **Features in development** tab.
@z

@x
### Beta features
@y
### Beta features
@z

@x
{{< include "beta.md" >}}
@y
{{< include "beta.md" >}}
@z

@x
### Experimental features
@y
### Experimental features
@z

@x
{{< include "desktop-experimental.md" >}}
@y
{{< include "desktop-experimental.md" >}}
@z

@x
## Notifications
@y
## Notifications
@z

@x
{{< include "desktop-notifications-settings.md" >}}
@y
{{< include "desktop-notifications-settings.md" >}}
@z
