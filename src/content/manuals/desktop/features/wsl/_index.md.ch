%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
description: Turn on the Docker WSL 2 backend and get to work using best practices,
  GPU support, and more in this thorough guide.
keywords: wsl, wsl2, installing wsl2, wsl installation, docker wsl2, wsl docker, wsl2
  tech preview, wsl install docker, install docker wsl, how to install docker in wsl
title: Docker Desktop WSL 2 backend on Windows
linkTitle: WSL
@y
description: Turn on the Docker WSL 2 backend and get to work using best practices,
  GPU support, and more in this thorough guide.
keywords: wsl, wsl2, installing wsl2, wsl installation, docker wsl2, wsl docker, wsl2
  tech preview, wsl install docker, install docker wsl, how to install docker in wsl
title: Docker Desktop WSL 2 backend on Windows
linkTitle: WSL
@z

@x
Windows Subsystem for Linux (WSL) 2 is a full Linux kernel built by Microsoft, which lets Linux distributions run without managing virtual machines. With Docker Desktop running on WSL 2, users can leverage Linux workspaces and avoid maintaining both Linux and Windows build scripts. In addition, WSL 2 provides improvements to file system sharing and boot time.
@y
Windows Subsystem for Linux (WSL) 2 is a full Linux kernel built by Microsoft, which lets Linux distributions run without managing virtual machines. With Docker Desktop running on WSL 2, users can leverage Linux workspaces and avoid maintaining both Linux and Windows build scripts. In addition, WSL 2 provides improvements to file system sharing and boot time.
@z

@x
Docker Desktop uses the dynamic memory allocation feature in WSL 2 to improve the resource consumption. This means Docker Desktop only uses the required amount of CPU and memory resources it needs, while allowing CPU and memory-intensive tasks such as building a container, to run much faster.
@y
Docker Desktop uses the dynamic memory allocation feature in WSL 2 to improve the resource consumption. This means Docker Desktop only uses the required amount of CPU and memory resources it needs, while allowing CPU and memory-intensive tasks such as building a container, to run much faster.
@z

@x
Additionally, with WSL 2, the time required to start a Docker daemon after a cold start is significantly faster.
@y
Additionally, with WSL 2, the time required to start a Docker daemon after a cold start is significantly faster.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before you turn on the Docker Desktop WSL 2 feature, ensure you have:
@y
Before you turn on the Docker Desktop WSL 2 feature, ensure you have:
@z

@x
- At a minimum WSL version 1.1.3.0., but ideally the latest version of WSL to [avoid Docker Desktop not working as expected](best-practices.md).
- Met the Docker Desktop for Windows' [system requirements](/manuals/desktop/setup/install/windows-install.md#system-requirements).
- Installed the WSL 2 feature on Windows. For detailed instructions, refer to the [Microsoft documentation](https://docs.microsoft.com/en-us/windows/wsl/install-win10).
@y
- At a minimum WSL version 1.1.3.0., but ideally the latest version of WSL to [avoid Docker Desktop not working as expected](best-practices.md).
- Met the Docker Desktop for Windows' [system requirements](manuals/desktop/setup/install/windows-install.md#system-requirements).
- Installed the WSL 2 feature on Windows. For detailed instructions, refer to the [Microsoft documentation](https://docs.microsoft.com/en-us/windows/wsl/install-win10).
@z

@x
> [!TIP]
>
> For a better experience on WSL, consider enabling the WSL
> [autoMemoryReclaim](https://learn.microsoft.com/en-us/windows/wsl/wsl-config#experimental-settings)
> setting available since WSL 1.3.10 (experimental).
>
> This feature enhances the Windows host's ability to reclaim unused memory within the WSL virtual machine, ensuring improved memory availability for other host applications. This capability is especially beneficial for Docker Desktop, as it prevents the WSL VM from retaining large amounts of memory (in GBs) within the Linux kernel's page cache during Docker container image builds, without releasing it back to the host when no longer needed within the VM.
@y
> [!TIP]
>
> For a better experience on WSL, consider enabling the WSL
> [autoMemoryReclaim](https://learn.microsoft.com/en-us/windows/wsl/wsl-config#experimental-settings)
> setting available since WSL 1.3.10 (experimental).
>
> This feature enhances the Windows host's ability to reclaim unused memory within the WSL virtual machine, ensuring improved memory availability for other host applications. This capability is especially beneficial for Docker Desktop, as it prevents the WSL VM from retaining large amounts of memory (in GBs) within the Linux kernel's page cache during Docker container image builds, without releasing it back to the host when no longer needed within the VM.
@z

@x
## Turn on Docker Desktop WSL 2
@y
## Turn on Docker Desktop WSL 2
@z

@x
> [!IMPORTANT]
>
> To avoid any potential conflicts with using WSL 2 on Docker Desktop, you must uninstall any previous versions of Docker Engine and CLI installed directly through Linux distributions before installing Docker Desktop.
@y
> [!IMPORTANT]
>
> To avoid any potential conflicts with using WSL 2 on Docker Desktop, you must uninstall any previous versions of Docker Engine and CLI installed directly through Linux distributions before installing Docker Desktop.
@z

@x
1. Download and install the latest version of [Docker Desktop for Windows](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe).
2. Follow the usual installation instructions to install Docker Desktop. Depending on which version of Windows you are using, Docker Desktop may prompt you to turn on WSL 2 during installation. Read the information displayed on the screen and turn on the WSL 2 feature to continue.
3. Start Docker Desktop from the **Windows Start** menu.
4. Navigate to **Settings**.
5. From the **General** tab, select **Use WSL 2 based engine**..
@y
1. Download and install the latest version of [Docker Desktop for Windows](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe).
2. Follow the usual installation instructions to install Docker Desktop. Depending on which version of Windows you are using, Docker Desktop may prompt you to turn on WSL 2 during installation. Read the information displayed on the screen and turn on the WSL 2 feature to continue.
3. Start Docker Desktop from the **Windows Start** menu.
4. Navigate to **Settings**.
5. From the **General** tab, select **Use WSL 2 based engine**..
@z

@x
    If you have installed Docker Desktop on a system that supports WSL 2, this option is turned on by default.
6. Select **Apply & Restart**.
@y
    If you have installed Docker Desktop on a system that supports WSL 2, this option is turned on by default.
6. Select **Apply & Restart**.
@z

@x
Now `docker` commands work from Windows using the new WSL 2 engine.
@y
Now `docker` commands work from Windows using the new WSL 2 engine.
@z

@x
> [!TIP]
>
> By default, Docker Desktop stores the data for the WSL 2 engine at `C:\Users\[USERNAME]\AppData\Local\Docker\wsl`.
> If you want to change the location, for example, to another drive you can do so via the `Settings -> Resources -> Advanced` page from the Docker Dashboard.
> Read more about this and other Windows settings at [Changing settings](/manuals/desktop/settings-and-maintenance/settings.md)
@y
> [!TIP]
>
> By default, Docker Desktop stores the data for the WSL 2 engine at `C:\Users\[USERNAME]\AppData\Local\Docker\wsl`.
> If you want to change the location, for example, to another drive you can do so via the `Settings -> Resources -> Advanced` page from the Docker Dashboard.
> Read more about this and other Windows settings at [Changing settings](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
## Enabling Docker support in WSL 2 distributions
@y
## Enabling Docker support in WSL 2 distributions
@z

@x
WSL 2 adds support for "Linux distributions" to Windows, where each distribution behaves like a VM except they all run on top of a single shared Linux kernel.
@y
WSL 2 adds support for "Linux distributions" to Windows, where each distribution behaves like a VM except they all run on top of a single shared Linux kernel.
@z

@x
Docker Desktop does not require any particular Linux distributions to be installed. The `docker` CLI and UI all work fine from Windows without any additional Linux distributions. However for the best developer experience, we recommend installing at least one additional distribution and enable Docker support:
@y
Docker Desktop does not require any particular Linux distributions to be installed. The `docker` CLI and UI all work fine from Windows without any additional Linux distributions. However for the best developer experience, we recommend installing at least one additional distribution and enable Docker support:
@z

@x
1. Ensure the distribution runs in WSL 2 mode. WSL can run distributions in both v1 or v2 mode.
@y
1. Ensure the distribution runs in WSL 2 mode. WSL can run distributions in both v1 or v2 mode.
@z

@x
    To check the WSL mode, run:
@y
    To check the WSL mode, run:
@z

% snip command...

@x
    To upgrade the Linux distribution to v2, run:
@y
    To upgrade the Linux distribution to v2, run:
@z

% snip command...

@x
    To set v2 as the default version for future installations, run:
@y
    To set v2 as the default version for future installations, run:
@z

% snip command...

@x
2. When Docker Desktop starts, go to **Settings** > **Resources** > **WSL Integration**.
@y
2. When Docker Desktop starts, go to **Settings** > **Resources** > **WSL Integration**.
@z

@x
    The Docker-WSL integration is enabled on the default WSL distribution, which is [Ubuntu](https://learn.microsoft.com/en-us/windows/wsl/install). To change your default WSL distribution, run:
@y
    The Docker-WSL integration is enabled on the default WSL distribution, which is [Ubuntu](https://learn.microsoft.com/en-us/windows/wsl/install). To change your default WSL distribution, run:
@z

% snip command...

@x
   If **WSL integrations** isn't available under **Resources**, Docker may be in Windows container mode. In your taskbar, select the Docker menu and then **Switch to Linux containers**.
@y
   If **WSL integrations** isn't available under **Resources**, Docker may be in Windows container mode. In your taskbar, select the Docker menu and then **Switch to Linux containers**.
@z

@x
3. Select **Apply & Restart**.
@y
3. Select **Apply & Restart**.
@z

@x
> [!NOTE]
>
> With Docker Desktop version 4.30 and earlier, Docker Desktop installed two special-purpose internal Linux distributions `docker-desktop` and `docker-desktop-data`. `docker-desktop` is used to run the Docker engine `dockerd`, while `docker-desktop-data` stores containers and images. Neither can be used for general development.
>
> With fresh installations of Docker Desktop 4.30 and later, `docker-desktop-data` is no longer created. Instead, Docker Desktop creates and 
> manages its own virtual hard disk for storage. The `docker-desktop` distribution is still created and used to run the Docker engine.
>
> Note that Docker Desktop version 4.30 and later keeps using the `docker-desktop-data` distribution if it was already created by an earlier version of Docker Desktop and has not been freshly installed or factory reset.
@y
> [!NOTE]
>
> With Docker Desktop version 4.30 and earlier, Docker Desktop installed two special-purpose internal Linux distributions `docker-desktop` and `docker-desktop-data`. `docker-desktop` is used to run the Docker engine `dockerd`, while `docker-desktop-data` stores containers and images. Neither can be used for general development.
>
> With fresh installations of Docker Desktop 4.30 and later, `docker-desktop-data` is no longer created. Instead, Docker Desktop creates and 
> manages its own virtual hard disk for storage. The `docker-desktop` distribution is still created and used to run the Docker engine.
>
> Note that Docker Desktop version 4.30 and later keeps using the `docker-desktop-data` distribution if it was already created by an earlier version of Docker Desktop and has not been freshly installed or factory reset.
@z

@x
## Additional resources
@y
## Additional resources
@z

@x
- [Explore best practices](best-practices.md)
- [Understand how to develop with Docker and WSL 2](use-wsl.md)
- [Learn about GPU support with WSL 2](/manuals/desktop/features/gpu.md)
@y
- [Explore best practices](best-practices.md)
- [Understand how to develop with Docker and WSL 2](use-wsl.md)
- [Learn about GPU support with WSL 2](manuals/desktop/features/gpu.md)
@z
