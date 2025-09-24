%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: How to uninstall Docker Desktop
keywords: Windows, uninstall, Mac, Linux, Docker Desktop
title: Uninstall Docker Desktop
linkTitle: Uninstall
@y
description: How to uninstall Docker Desktop
keywords: Windows, uninstall, Mac, Linux, Docker Desktop
title: Uninstall Docker Desktop
linkTitle: Uninstall
@z

@x
> [!WARNING]
>
> Uninstalling Docker Desktop destroys Docker containers, images, volumes, and
> other Docker-related data local to the machine, and removes the files generated
> by the application. To learn how to preserve important data before uninstalling, refer to the [back up and restore data](/manuals/desktop/settings-and-maintenance/backup-and-restore.md) section.
@y
> [!WARNING]
>
> Uninstalling Docker Desktop destroys Docker containers, images, volumes, and
> other Docker-related data local to the machine, and removes the files generated
> by the application. To learn how to preserve important data before uninstalling, refer to the [back up and restore data](manuals/desktop/settings-and-maintenance/backup-and-restore.md) section.
@z

@x
{{< tabs >}}
{{< tab name="Windows" >}}
@y
{{< tabs >}}
{{< tab name="Windows" >}}
@z

@x
#### From the GUI
@y
#### From the GUI
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
#### From the CLI
@y
#### From the CLI
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
After uninstalling Docker Desktop, some residual files may remain which you can remove manually. These are:
@y
After uninstalling Docker Desktop, some residual files may remain which you can remove manually. These are:
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
#### From the GUI
@y
#### From the GUI
@z

@x
1. Open Docker Desktop. 
2. In the top-right corner of the Docker Desktop Dashboard, select the **Troubleshoot** icon.
3. Select **Uninstall**.
4. When prompted, confirm by selecting **Uninstall** again.
@y
1. Open Docker Desktop. 
2. In the top-right corner of the Docker Desktop Dashboard, select the **Troubleshoot** icon.
3. Select **Uninstall**.
4. When prompted, confirm by selecting **Uninstall** again.
@z

@x
You can then move the Docker application to the trash. 
@y
You can then move the Docker application to the trash. 
@z

@x
#### From the CLI
@y
#### From the CLI
@z

@x
Run:
@y
Run:
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
You can then move the Docker application to the trash. 
@y
You can then move the Docker application to the trash. 
@z

@x
> [!NOTE]
> You may encounter the following error when uninstalling Docker Desktop using the uninstall command.
>
> ```console
> $ /Applications/Docker.app/Contents/MacOS/uninstall
> Password:
> Uninstalling Docker Desktop...
> Error: unlinkat /Users/<USER_HOME>/Library/Containers/com.docker.docker/.com.apple.containermanagerd.metadata.plist: > operation not permitted
> ```
>
> The operation not permitted error is reported either on the file `.com.apple.containermanagerd.metadata.plist` or on the parent directory `/Users/<USER_HOME>/Library/Containers/com.docker.docker/`. This error can be ignored as you have successfully uninstalled Docker Desktop.
> You can remove the directory `/Users/<USER_HOME>/Library/Containers/com.docker.docker/` later by allowing **Full Disk Access** to the terminal application you are using (**System Settings** > **Privacy & Security** > **Full Disk Access**).
@y
> [!NOTE]
> You may encounter the following error when uninstalling Docker Desktop using the uninstall command.
>
> ```console
> $ /Applications/Docker.app/Contents/MacOS/uninstall
> Password:
> Uninstalling Docker Desktop...
> Error: unlinkat /Users/<USER_HOME>/Library/Containers/com.docker.docker/.com.apple.containermanagerd.metadata.plist: > operation not permitted
> ```
>
> The operation not permitted error is reported either on the file `.com.apple.containermanagerd.metadata.plist` or on the parent directory `/Users/<USER_HOME>/Library/Containers/com.docker.docker/`. This error can be ignored as you have successfully uninstalled Docker Desktop.
> You can remove the directory `/Users/<USER_HOME>/Library/Containers/com.docker.docker/` later by allowing **Full Disk Access** to the terminal application you are using (**System Settings** > **Privacy & Security** > **Full Disk Access**).
@z

@x
After uninstalling Docker Desktop, some residual files may remain which you can remove:
@y
After uninstalling Docker Desktop, some residual files may remain which you can remove:
@z

@x
```console
$ rm -rf ~/Library/Group\ Containers/group.com.docker
$ rm -rf ~/.docker
```
@y
```console
$ rm -rf ~/Library/Group\ Containers/group.com.docker
$ rm -rf ~/.docker
```
@z

@x
With Docker Desktop version 4.36 and earlier, the following files may also be left on the file system. You can remove these with administrative privileges:
@y
With Docker Desktop version 4.36 and earlier, the following files may also be left on the file system. You can remove these with administrative privileges:
@z

@x
```console
/Library/PrivilegedHelperTools/com.docker.vmnetd
/Library/PrivilegedHelperTools/com.docker.socket
```
@y
```console
/Library/PrivilegedHelperTools/com.docker.vmnetd
/Library/PrivilegedHelperTools/com.docker.socket
```
@z

@x
{{< /tab >}}
{{< tab name="Ubuntu" >}}
@y
{{< /tab >}}
{{< tab name="Ubuntu" >}}
@z

@x
To uninstall Docker Desktop for Ubuntu:
@y
To uninstall Docker Desktop for Ubuntu:
@z

@x
1. Remove the Docker Desktop application. Run:
@y
1. Remove the Docker Desktop application. Run:
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
   This removes the Docker Desktop package itself but doesn’t delete all of its files or settings.
@y
   This removes the Docker Desktop package itself but doesn’t delete all of its files or settings.
@z

@x
2. Manually remove leftover file.
@y
2. Manually remove leftover file.
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
   This removes configuration and data files at `$HOME/.docker/desktop`, the symlink at `/usr/local/bin/com.docker.cli`, and purges the remaining systemd service files.
@y
   This removes configuration and data files at `$HOME/.docker/desktop`, the symlink at `/usr/local/bin/com.docker.cli`, and purges the remaining systemd service files.
@z

@x
3. Clean up Docker config settings. In `$HOME/.docker/config.json`, remove the `credsStore` and `currentContext` properties.
@y
3. Clean up Docker config settings. In `$HOME/.docker/config.json`, remove the `credsStore` and `currentContext` properties.
@z

@x
   These entries tell Docker where to store credentials and which context is active. If they remain after uninstalling Docker Desktop, they may conflict with a future Docker setup.
@y
   These entries tell Docker where to store credentials and which context is active. If they remain after uninstalling Docker Desktop, they may conflict with a future Docker setup.
@z

@x
{{< /tab >}}
{{< tab name="Debian" >}}
@y
{{< /tab >}}
{{< tab name="Debian" >}}
@z

@x
To uninstall Docker Desktop for Debian, run:
@y
To uninstall Docker Desktop for Debian, run:
@z

@x
1. Remove the Docker Desktop application:
@y
1. Remove the Docker Desktop application:
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
   This removes the Docker Desktop package itself but doesn’t delete all of its files or settings.
@y
   This removes the Docker Desktop package itself but doesn’t delete all of its files or settings.
@z

@x
2. Manually remove leftover file.
@y
2. Manually remove leftover file.
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
   This removes configuration and data files at `$HOME/.docker/desktop`, the symlink at `/usr/local/bin/com.docker.cli`, and purges the remaining systemd service files.
@y
   This removes configuration and data files at `$HOME/.docker/desktop`, the symlink at `/usr/local/bin/com.docker.cli`, and purges the remaining systemd service files.
@z

@x
3. Clean up Docker config settings. In `$HOME/.docker/config.json`, remove the `credsStore` and `currentContext` properties.
@y
3. Clean up Docker config settings. In `$HOME/.docker/config.json`, remove the `credsStore` and `currentContext` properties.
@z

@x
   These entries tell Docker where to store credentials and which context is active. If they remain after uninstalling Docker Desktop, they may conflict with a future Docker setup.
@y
   These entries tell Docker where to store credentials and which context is active. If they remain after uninstalling Docker Desktop, they may conflict with a future Docker setup.
@z

@x
{{< /tab >}}
{{< tab name="Fedora" >}}
@y
{{< /tab >}}
{{< tab name="Fedora" >}}
@z

@x
To uninstall Docker Desktop for Fedora:
@y
To uninstall Docker Desktop for Fedora:
@z

@x
1. Remove the Docker Desktop application. Run:
@y
1. Remove the Docker Desktop application. Run:
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
   This removes the Docker Desktop package itself but doesn’t delete all of its files or settings.
@y
   This removes the Docker Desktop package itself but doesn’t delete all of its files or settings.
@z

@x
2. Manually remove leftover file.
@y
2. Manually remove leftover file.
@z

@x
   ```console
   $ rm -r $HOME/.docker/desktop
   $ sudo rm /usr/local/bin/com.docker.cli
   $ sudo dnf remove docker-desktop
   ```
@y
   ```console
   $ rm -r $HOME/.docker/desktop
   $ sudo rm /usr/local/bin/com.docker.cli
   $ sudo dnf remove docker-desktop
   ```
@z

@x
   This removes configuration and data files at `$HOME/.docker/desktop`, the symlink at `/usr/local/bin/com.docker.cli`, and purges the remaining systemd service files.
@y
   This removes configuration and data files at `$HOME/.docker/desktop`, the symlink at `/usr/local/bin/com.docker.cli`, and purges the remaining systemd service files.
@z

@x
3. Clean up Docker config settings. In `$HOME/.docker/config.json`, remove the `credsStore` and `currentContext` properties.
@y
3. Clean up Docker config settings. In `$HOME/.docker/config.json`, remove the `credsStore` and `currentContext` properties.
@z

@x
   These entries tell Docker where to store credentials and which context is active. If they remain after uninstalling Docker Desktop, they may conflict with a future Docker setup.
@y
   These entries tell Docker where to store credentials and which context is active. If they remain after uninstalling Docker Desktop, they may conflict with a future Docker setup.
@z

@x
{{< /tab >}}
{{< tab name="Arch" >}}
@y
{{< /tab >}}
{{< tab name="Arch" >}}
@z

@x
To uninstall Docker Desktop for Arch:
@y
To uninstall Docker Desktop for Arch:
@z

@x
1. Remove the Docker Desktop application. Run:
@y
1. Remove the Docker Desktop application. Run:
@z

@x
   ```console
   $ sudo pacman -Rns docker-desktop
   ```
@y
   ```console
   $ sudo pacman -Rns docker-desktop
   ```
@z

@x
   This removes the Docker Desktop package along with its configuration files and dependencies not required by other packages.
@y
   This removes the Docker Desktop package along with its configuration files and dependencies not required by other packages.
@z

@x
2. Manually remove leftover files.
@y
2. Manually remove leftover files.
@z

@x
   ```console
   $ rm -r $HOME/.docker/desktop
   ```
@y
   ```console
   $ rm -r $HOME/.docker/desktop
   ```
@z

@x
   This removes configuration and data files at `$HOME/.docker/desktop`.
@y
   This removes configuration and data files at `$HOME/.docker/desktop`.
@z

@x
3. Clean up Docker config settings. In `$HOME/.docker/config.json`, remove the `credsStore` and `currentContext` properties.
@y
3. Clean up Docker config settings. In `$HOME/.docker/config.json`, remove the `credsStore` and `currentContext` properties.
@z

@x
   These entries tell Docker where to store credentials and which context is active. If they remain after uninstalling Docker Desktop, they may conflict with a future Docker setup.
@y
   These entries tell Docker where to store credentials and which context is active. If they remain after uninstalling Docker Desktop, they may conflict with a future Docker setup.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
