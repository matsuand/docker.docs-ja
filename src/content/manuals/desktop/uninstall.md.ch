%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
description: How to uninstall Docker Desktop
keywords: Windows, uninstall, Mac, Linux, Docker Desktop
title: Uninstall Docker Desktop
linkTitle: Uninstall
@y
description: Docker Desktop のアンインストール方法。
keywords: Windows, uninstall, Mac, Linux, Docker Desktop
title: Docker Desktop のアンインストール
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
To uninstall Docker Desktop from your Windows machine:
@y
Windows マシンからの Docker Desktop のアンインストール方法は以下のとおりです。
@z

@x
1. From the Windows **Start** menu, select **Settings** > **Apps** > **Apps & features**.
2. Select **Docker Desktop** from the **Apps & features** list and then select **Uninstall**.
3. Select **Uninstall** to confirm your selection.
@y
1. Windows の **スタート** メニューから **設定** > **アプリ** > **インストールされているアプリ** をクリックします。
2. **インストールされているアプリ** の一覧から **Docker Desktop** を選んで **Uninstall** をクリックします。
3. 確認画面にて **アンインストール** をクリックします。
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

% snip code...

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
1. From the Docker menu, select the **Troubleshoot** icon in the top-right corner of the Docker Desktop Dashboard and then select **Uninstall**.
2. Select **Uninstall** to confirm your selection.
@y
1. From the Docker menu, select the **Troubleshoot** icon in the top-right corner of the Docker Desktop Dashboard and then select **Uninstall**.
2. Select **Uninstall** to confirm your selection.
@z

@x
You can also uninstall Docker Desktop from the CLI. Run:
@y
You can also uninstall Docker Desktop from the CLI. Run:
@z

% snip command...

@x
After uninstalling Docker Desktop, there may be some residual files left behind which you can remove:
@y
After uninstalling Docker Desktop, there may be some residual files left behind which you can remove:
@z

% snip command...

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

% snip command...

@x
For a complete cleanup, remove configuration and data files at `$HOME/.docker/desktop`, the symlink at `/usr/local/bin/com.docker.cli`, and purge
the remaining systemd service files.
@y
For a complete cleanup, remove configuration and data files at `$HOME/.docker/desktop`, the symlink at `/usr/local/bin/com.docker.cli`, and purge
the remaining systemd service files.
@z

% snip command...

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

% snip command...

@x
For a complete cleanup, remove configuration and data files at `$HOME/.docker/desktop`, the symlink at `/usr/local/bin/com.docker.cli`, and purge
the remaining systemd service files.
@y
For a complete cleanup, remove configuration and data files at `$HOME/.docker/desktop`, the symlink at `/usr/local/bin/com.docker.cli`, and purge
the remaining systemd service files.
@z

% snip command...

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

% snip command...

@x
For a complete cleanup, remove configuration and data files at `$HOME/.docker/desktop`, the symlink at `/usr/local/bin/com.docker.cli`, and purge
the remaining systemd service files.
@y
For a complete cleanup, remove configuration and data files at `$HOME/.docker/desktop`, the symlink at `/usr/local/bin/com.docker.cli`, and purge
the remaining systemd service files.
@z

% snip command...

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

% snip command...

@x
For a complete cleanup, remove configuration and data files at `$HOME/.docker/desktop`, the symlink at `/usr/local/bin/com.docker.cli`, and purge
the remaining systemd service files.
@y
For a complete cleanup, remove configuration and data files at `$HOME/.docker/desktop`, the symlink at `/usr/local/bin/com.docker.cli`, and purge
the remaining systemd service files.
@z

% snip command...

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
