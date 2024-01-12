%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How to uninstall Docker Desktop
keywords: Windows, unintall, Mac, Linux, Docker Desktop
title: Uninstall Docker Desktop
---
@y
---
description: How to uninstall Docker Desktop
keywords: Windows, unintall, Mac, Linux, Docker Desktop
title: Uninstall Docker Desktop
---
@z

@x
> **Warning**
>
> Uninstalling Docker Desktop destroys Docker containers, images, volumes, and
> other Docker-related data local to the machine, and removes the files generated
> by the application. To learn how to preserve important data before uninstalling, refer to the [back up and restore data](backup-and-restore.md) section .
{ .warning }
@y
> **Warning**
>
> Uninstalling Docker Desktop destroys Docker containers, images, volumes, and
> other Docker-related data local to the machine, and removes the files generated
> by the application. To learn how to preserve important data before uninstalling, refer to the [back up and restore data](backup-and-restore.md) section .
{ .warning }
@z

@x
{{< tabs >}}
{{< tab name="Windows" >}}
@y
{{< tabs >}}
{{< tab name="Windows" >}}
@z

@x
To uninstall Docker Desktop from your Windows machine:
@y
To uninstall Docker Desktop from your Windows machine:
@z

@x
1. From the Windows **Start** menu, select **Settings** > **Apps** > **Apps & features**.
2. Select **Docker Desktop** from the **Apps & features** list and then select **Uninstall**.
3. Select **Uninstall** to confirm your selection.
@y
1. From the Windows **Start** menu, select **Settings** > **Apps** > **Apps & features**.
2. Select **Docker Desktop** from the **Apps & features** list and then select **Uninstall**.
3. Select **Uninstall** to confirm your selection.
@z

@x
You can also uninstall Docker Desktop from the CLI:
@y
You can also uninstall Docker Desktop from the CLI:
@z

@x
1. Locate the installer:
   ```console
   $ C:\Program Files\Docker\Docker\Docker Desktop Installer.exe
   ```
2. Uninstall Docker Desktop. 
 - In PowerShell, run:
    ```console
    $ Start-Process 'Docker Desktop Installer.exe' -Wait uninstall
    ```
 - In the Command Prompt, run:
    ```console
    $ start /w "" "Docker Desktop Installer.exe" uninstall
    ```
@y
1. Locate the installer:
   ```console
   $ C:\Program Files\Docker\Docker\Docker Desktop Installer.exe
   ```
2. Uninstall Docker Desktop. 
 - In PowerShell, run:
    ```console
    $ Start-Process 'Docker Desktop Installer.exe' -Wait uninstall
    ```
 - In the Command Prompt, run:
    ```console
    $ start /w "" "Docker Desktop Installer.exe" uninstall
    ```
@z

@x
After uninstalling Docker Desktop, there may be some residual files left behind which you can remove manually. These are:
@y
After uninstalling Docker Desktop, there may be some residual files left behind which you can remove manually. These are:
@z

@x
```console
C:\ProgramData\Docker
C:\ProgramData\DockerDesktop
C:\Program Files\Docker
C:\Users\<your user name>\AppData\Local\Docker
C:\Users\<your user name>\AppData\Roaming\Docker
C:\Users\<your user name>\AppData\Roaming\Docker Desktop
C:\Users\<your user name>\.docker
```
@y
```console
C:\ProgramData\Docker
C:\ProgramData\DockerDesktop
C:\Program Files\Docker
C:\Users\<your user name>\AppData\Local\Docker
C:\Users\<your user name>\AppData\Roaming\Docker
C:\Users\<your user name>\AppData\Roaming\Docker Desktop
C:\Users\<your user name>\.docker
```
@z

@x
{{< /tab >}}
{{< tab name="Mac" >}}
@y
{{< /tab >}}
{{< tab name="Mac" >}}
@z

@x
To uninstall Docker Desktop from your Mac:
@y
To uninstall Docker Desktop from your Mac:
@z

@x
1. From the Docker menu, select the **Troubleshoot** icon in the top-right corner of Docker Dashboard and then select **Uninstall**.
2. Select **Uninstall** to confirm your selection.
@y
1. From the Docker menu, select the **Troubleshoot** icon in the top-right corner of Docker Dashboard and then select **Uninstall**.
2. Select **Uninstall** to confirm your selection.
@z

@x
You can also uninstall Docker Desktop from the CLI. Run:
@y
You can also uninstall Docker Desktop from the CLI. Run:
@z

@x
```console
$ /Applications/Docker.app/Contents/MacOS/uninstall
```
@y
```console
$ /Applications/Docker.app/Contents/MacOS/uninstall
```
@z

@x
After uninstalling Docker Desktop, there may be some residual files left behind which you can remove:
@y
After uninstalling Docker Desktop, there may be some residual files left behind which you can remove:
@z

@x
```console
$ rm -rf ~/Library/Group\ Containers/group.com.docker
$ rm -rf ~/Library/Containers/com.docker.docker
$ rm -rf ~/.docker
```
@y
```console
$ rm -rf ~/Library/Group\ Containers/group.com.docker
$ rm -rf ~/Library/Containers/com.docker.docker
$ rm -rf ~/.docker
```
@z

@x
{{< /tab >}}
{{< tab name="Linux" >}}
@y
{{< /tab >}}
{{< tab name="Linux" >}}
@z

@x
Docker Desktop is removed from a Linux host using the package manager.
@y
Docker Desktop is removed from a Linux host using the package manager.
@z

@x
Once Docker Desktop is removed, users must delete the `credsStore` and `currentContext` properties from the `~/.docker/config.json`.
@y
Once Docker Desktop is removed, users must delete the `credsStore` and `currentContext` properties from the `~/.docker/config.json`.
@z

@x
{{< /tab >}}
{{< tab name="Ubuntu" >}}
@y
{{< /tab >}}
{{< tab name="Ubuntu" >}}
@z

@x
To remove Docker Desktop for Ubuntu, run:
@y
To remove Docker Desktop for Ubuntu, run:
@z

@x
```console
$ sudo apt remove docker-desktop
```
@y
```console
$ sudo apt remove docker-desktop
```
@z

@x
For a complete cleanup, remove configuration and data files at `$HOME/.docker/desktop`, the symlink at `/usr/local/bin/com.docker.cli`, and purge
the remaining systemd service files.
@y
For a complete cleanup, remove configuration and data files at `$HOME/.docker/desktop`, the symlink at `/usr/local/bin/com.docker.cli`, and purge
the remaining systemd service files.
@z

@x
```console
$ rm -r $HOME/.docker/desktop
$ sudo rm /usr/local/bin/com.docker.cli
$ sudo apt purge docker-desktop
```
@y
```console
$ rm -r $HOME/.docker/desktop
$ sudo rm /usr/local/bin/com.docker.cli
$ sudo apt purge docker-desktop
```
@z

@x
Remove the `credsStore` and `currentContext` properties from `$HOME/.docker/config.json`. Additionally, you must delete any edited configuration files manually. 
@y
Remove the `credsStore` and `currentContext` properties from `$HOME/.docker/config.json`. Additionally, you must delete any edited configuration files manually. 
@z

@x
{{< /tab >}}
{{< tab name="Debian" >}}
@y
{{< /tab >}}
{{< tab name="Debian" >}}
@z

@x
To remove Docker Desktop for Debian, run:
@y
To remove Docker Desktop for Debian, run:
@z

@x
```console
$ sudo apt remove docker-desktop
```
@y
```console
$ sudo apt remove docker-desktop
```
@z

@x
For a complete cleanup, remove configuration and data files at `$HOME/.docker/desktop`, the symlink at `/usr/local/bin/com.docker.cli`, and purge
the remaining systemd service files.
@y
For a complete cleanup, remove configuration and data files at `$HOME/.docker/desktop`, the symlink at `/usr/local/bin/com.docker.cli`, and purge
the remaining systemd service files.
@z

@x
```console
$ rm -r $HOME/.docker/desktop
$ sudo rm /usr/local/bin/com.docker.cli
$ sudo apt purge docker-desktop
```
@y
```console
$ rm -r $HOME/.docker/desktop
$ sudo rm /usr/local/bin/com.docker.cli
$ sudo apt purge docker-desktop
```
@z

@x
Remove the `credsStore` and `currentContext` properties from `$HOME/.docker/config.json`. Additionally, you must delete any edited configuration files manually.
@y
Remove the `credsStore` and `currentContext` properties from `$HOME/.docker/config.json`. Additionally, you must delete any edited configuration files manually.
@z

@x
{{< /tab >}}
{{< tab name="Fedora" >}}
@y
{{< /tab >}}
{{< tab name="Fedora" >}}
@z

@x
To remove Docker Desktop for Fedora, run:
@y
To remove Docker Desktop for Fedora, run:
@z

@x
```console
$ sudo dnf remove docker-desktop
```
@y
```console
$ sudo dnf remove docker-desktop
```
@z

@x
For a complete cleanup, remove configuration and data files at `$HOME/.docker/desktop`, the symlink at `/usr/local/bin/com.docker.cli`, and purge
the remaining systemd service files.
@y
For a complete cleanup, remove configuration and data files at `$HOME/.docker/desktop`, the symlink at `/usr/local/bin/com.docker.cli`, and purge
the remaining systemd service files.
@z

@x
```console
$ rm -r $HOME/.docker/desktop
$ sudo rm /usr/local/bin/com.docker.cli
```
@y
```console
$ rm -r $HOME/.docker/desktop
$ sudo rm /usr/local/bin/com.docker.cli
```
@z

@x
Remove the `credsStore` and `currentContext` properties from `$HOME/.docker/config.json`. Additionally, you must delete any edited configuration files manually. 
@y
Remove the `credsStore` and `currentContext` properties from `$HOME/.docker/config.json`. Additionally, you must delete any edited configuration files manually. 
@z

@x
{{< /tab >}}
{{< tab name="Arch" >}}
@y
{{< /tab >}}
{{< tab name="Arch" >}}
@z

@x
To remove Docker Desktop for Arch, run:
@y
To remove Docker Desktop for Arch, run:
@z

@x
```console
$ sudo pacman -R docker-desktop
```
@y
```console
$ sudo pacman -R docker-desktop
```
@z

@x
For a complete cleanup, remove configuration and data files at `$HOME/.docker/desktop`, the symlink at `/usr/local/bin/com.docker.cli`, and purge
the remaining systemd service files.
@y
For a complete cleanup, remove configuration and data files at `$HOME/.docker/desktop`, the symlink at `/usr/local/bin/com.docker.cli`, and purge
the remaining systemd service files.
@z

@x
```console
$ rm -r $HOME/.docker/desktop
$ sudo rm /usr/local/bin/com.docker.cli
$ sudo pacman -Rns docker-desktop
```
@y
```console
$ rm -r $HOME/.docker/desktop
$ sudo rm /usr/local/bin/com.docker.cli
$ sudo pacman -Rns docker-desktop
```
@z

@x
Remove the `credsStore` and `currentContext` properties from `$HOME/.docker/config.json`. Additionally, you must delete any edited configuration files manually. 
@y
Remove the `credsStore` and `currentContext` properties from `$HOME/.docker/config.json`. Additionally, you must delete any edited configuration files manually. 
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
