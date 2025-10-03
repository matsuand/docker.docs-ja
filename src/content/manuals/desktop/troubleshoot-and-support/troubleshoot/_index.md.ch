%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md ƒŠƒ“ƒN‚Ö‚Ì (no slash) ‘Î‰ž

@x
description: Understand how to diagnose and troubleshoot Docker Desktop, and how to
  check the logs.
keywords: Linux, Mac, Windows, troubleshooting, logs, issues, Docker Desktop
toc_max: 2
title: Troubleshoot Docker Desktop
linkTitle: Troubleshoot and diagnose
@y
description: Understand how to diagnose and troubleshoot Docker Desktop, and how to
  check the logs.
keywords: Linux, Mac, Windows, troubleshooting, logs, issues, Docker Desktop
toc_max: 2
title: Troubleshoot Docker Desktop
linkTitle: Troubleshoot and diagnose
@z

@x
This page contains information on how to diagnose and troubleshoot Docker Desktop, and how to check the logs.
@y
This page contains information on how to diagnose and troubleshoot Docker Desktop, and how to check the logs.
@z

@x
## Troubleshoot menu
@y
## Troubleshoot menu
@z

@x
To navigate to **Troubleshoot** either:
@y
To navigate to **Troubleshoot** either:
@z

@x
- Select the Docker menu Docker menu {{< inline-image src="../../images/whale-x.svg" alt="whale menu" >}} and then **Troubleshoot**.
- Select the **Troubleshoot** icon near the top-right corner of Docker Dashboard.
@y
- Select the Docker menu Docker menu {{< inline-image src="../../images/whale-x.svg" alt="whale menu" >}} and then **Troubleshoot**.
- Select the **Troubleshoot** icon near the top-right corner of Docker Dashboard.
@z

@x
The **Troubleshooting** menu contains the following options:
@y
The **Troubleshooting** menu contains the following options:
@z

@x
- **Restart Docker Desktop**.
@y
- **Restart Docker Desktop**.
@z

@x
- **Reset Kubernetes cluster**. Select to delete all stacks and Kubernetes resources. For more information, see [Kubernetes](/manuals/desktop/settings-and-maintenance/settings.md#kubernetes).
@y
- **Reset Kubernetes cluster**. Select to delete all stacks and Kubernetes resources. For more information, see [Kubernetes](manuals/desktop/settings-and-maintenance/settings.md#kubernetes).
@z

@x
- **Clean / Purge data**. This option resets all Docker data without a
reset to factory defaults. Selecting this option results in the loss of existing settings.
@y
- **Clean / Purge data**. This option resets all Docker data without a
reset to factory defaults. Selecting this option results in the loss of existing settings.
@z

@x
- **Reset to factory defaults**: Choose this option to reset all options on
Docker Desktop to their initial state, the same as when Docker Desktop was first installed.
@y
- **Reset to factory defaults**: Choose this option to reset all options on
Docker Desktop to their initial state, the same as when Docker Desktop was first installed.
@z

@x
If you are a Mac or Linux user, you also have the option to **Uninstall** Docker Desktop from your system.
@y
If you are a Mac or Linux user, you also have the option to **Uninstall** Docker Desktop from your system.
@z

@x
## Diagnose
@y
## Diagnose
@z

@x
> [!TIP]
>
> If you do not find a solution in troubleshooting, browse the GitHub repositories or create a new issue:
>
> - [docker/for-mac](https://github.com/docker/for-mac/issues)
> - [docker/for-win](https://github.com/docker/for-win/issues)
> - [docker/desktop-linux](https://github.com/docker/desktop-linux/issues)
@y
> [!TIP]
>
> If you do not find a solution in troubleshooting, browse the GitHub repositories or create a new issue:
>
> - [docker/for-mac](https://github.com/docker/for-mac/issues)
> - [docker/for-win](https://github.com/docker/for-win/issues)
> - [docker/desktop-linux](https://github.com/docker/desktop-linux/issues)
@z

@x
### Diagnose from the app
@y
### Diagnose from the app
@z

@x
1. From **Troubleshoot**, select **Get support**. This opens the in-app Support page and starts collecting the diagnostics.
2. When the diagnostics collection process is complete, select **Upload to get a Diagnostic ID**.
3. When the diagnostics are uploaded, Docker Desktop prints a diagnostic ID. Copy this ID.
4. Use your diagnostics ID to get help:
    - If you have a paid Docker subscription, select **Contact support**. This opens the Docker Desktop support form. Fill in the information required and add the ID you copied in step three to the **Diagnostics ID field**. Then, select **Submit ticket** to request Docker Desktop support.
        > [!NOTE]
        >
        > You must be signed in to Docker Desktop to access the support form. For information on what's covered as part of Docker Desktop support, see [Support](/manuals/desktop/troubleshoot-and-support/support.md).
    - If you don't have a paid Docker subscription, select **Report a Bug** to open a new Docker Desktop issue on GitHub. Complete the information required and ensure you add the diagnostic ID you copied in step three.
@y
1. From **Troubleshoot**, select **Get support**. This opens the in-app Support page and starts collecting the diagnostics.
2. When the diagnostics collection process is complete, select **Upload to get a Diagnostic ID**.
3. When the diagnostics are uploaded, Docker Desktop prints a diagnostic ID. Copy this ID.
4. Use your diagnostics ID to get help:
    - If you have a paid Docker subscription, select **Contact support**. This opens the Docker Desktop support form. Fill in the information required and add the ID you copied in step three to the **Diagnostics ID field**. Then, select **Submit ticket** to request Docker Desktop support.
        > [!NOTE]
        >
        > You must be signed in to Docker Desktop to access the support form. For information on what's covered as part of Docker Desktop support, see [Support](manuals/desktop/troubleshoot-and-support/support.md).
    - If you don't have a paid Docker subscription, select **Report a Bug** to open a new Docker Desktop issue on GitHub. Complete the information required and ensure you add the diagnostic ID you copied in step three.
@z

@x
### Diagnose from an error message 
@y
### Diagnose from an error message 
@z

@x
1. When an error message appears, select **Gather diagnostics**.
2. When the diagnostics are uploaded, Docker Desktop prints a diagnostic ID. Copy this ID.
3. Use your diagnostics ID to get help:
    - If you have a paid Docker subscription, select **Contact support**. This opens the Docker Desktop support form. Fill in the information required and add the ID you copied in step three to the **Diagnostics ID field**. Then, select **Submit ticket** to request Docker Desktop support.
        > [!NOTE]
        >
        > You must be signed in to Docker Desktop to access the support form. For information on what's covered as part of Docker Desktop support, see [Support](/manuals/desktop/troubleshoot-and-support/support.md).
    - If you don't have a paid Docker subscription, you can open a new Docker Desktop issue on GitHub for [Mac](https://github.com/docker/for-mac/issues), [Windows](https://github.com/docker/for-win/issues), or [Linux](https://github.com/docker/for-linux/issues). Complete the information required and ensure you add the diagnostic ID printed in step two. 
@y
1. When an error message appears, select **Gather diagnostics**.
2. When the diagnostics are uploaded, Docker Desktop prints a diagnostic ID. Copy this ID.
3. Use your diagnostics ID to get help:
    - If you have a paid Docker subscription, select **Contact support**. This opens the Docker Desktop support form. Fill in the information required and add the ID you copied in step three to the **Diagnostics ID field**. Then, select **Submit ticket** to request Docker Desktop support.
        > [!NOTE]
        >
        > You must be signed in to Docker Desktop to access the support form. For information on what's covered as part of Docker Desktop support, see [Support](manuals/desktop/troubleshoot-and-support/support.md).
    - If you don't have a paid Docker subscription, you can open a new Docker Desktop issue on GitHub for [Mac](https://github.com/docker/for-mac/issues), [Windows](https://github.com/docker/for-win/issues), or [Linux](https://github.com/docker/for-linux/issues). Complete the information required and ensure you add the diagnostic ID printed in step two. 
@z

@x
### Diagnose from the terminal
@y
### Diagnose from the terminal
@z

@x
In some cases, it's useful to run the diagnostics yourself, for instance, if
Docker Desktop cannot start.
@y
In some cases, it's useful to run the diagnostics yourself, for instance, if
Docker Desktop cannot start.
@z

@x
{{< tabs group="os" >}}
{{< tab name="Windows" >}}
@y
{{< tabs group="os" >}}
{{< tab name="Windows" >}}
@z

@x
1. Locate the `com.docker.diagnose` tool:
@y
1. Locate the `com.docker.diagnose` tool:
@z

@x
   ```console
   $ C:\Program Files\Docker\Docker\resources\com.docker.diagnose.exe
   ```
@y
   ```console
   $ C:\Program Files\Docker\Docker\resources\com.docker.diagnose.exe
   ```
@z

@x
2. Create and upload the diagnostics ID. In PowerShell, run:
@y
2. Create and upload the diagnostics ID. In PowerShell, run:
@z

@x
   ```console
   $ & "C:\Program Files\Docker\Docker\resources\com.docker.diagnose.exe" gather -upload
   ```
@y
   ```console
   $ & "C:\Program Files\Docker\Docker\resources\com.docker.diagnose.exe" gather -upload
   ```
@z

@x
After the diagnostics have finished, the terminal displays your diagnostics ID and the path to the diagnostics file. The diagnostics ID is composed of your user ID and a timestamp. For example `BE9AFAAF-F68B-41D0-9D12-84760E6B8740/20190905152051`. 
@y
After the diagnostics have finished, the terminal displays your diagnostics ID and the path to the diagnostics file. The diagnostics ID is composed of your user ID and a timestamp. For example `BE9AFAAF-F68B-41D0-9D12-84760E6B8740/20190905152051`. 
@z

@x
{{< /tab >}}
{{< tab name="Mac" >}}
@y
{{< /tab >}}
{{< tab name="Mac" >}}
@z

@x
1. Locate the `com.docker.diagnose` tool:
@y
1. Locate the `com.docker.diagnose` tool:
@z

@x
   ```console
   $ /Applications/Docker.app/Contents/MacOS/com.docker.diagnose
   ```
@y
   ```console
   $ /Applications/Docker.app/Contents/MacOS/com.docker.diagnose
   ```
@z

@x
2. Create and upload the diagnostics ID. Run:
@y
2. Create and upload the diagnostics ID. Run:
@z

@x
   ```console
   $ /Applications/Docker.app/Contents/MacOS/com.docker.diagnose gather -upload
   ```
@y
   ```console
   $ /Applications/Docker.app/Contents/MacOS/com.docker.diagnose gather -upload
   ```
@z

@x
After the diagnostics have finished, the terminal displays your diagnostics ID and the path to the diagnostics file. The diagnostics ID is composed of your user ID and a timestamp. For example `BE9AFAAF-F68B-41D0-9D12-84760E6B8740/20190905152051`. 
@y
After the diagnostics have finished, the terminal displays your diagnostics ID and the path to the diagnostics file. The diagnostics ID is composed of your user ID and a timestamp. For example `BE9AFAAF-F68B-41D0-9D12-84760E6B8740/20190905152051`. 
@z

@x
{{< /tab >}}
{{< tab name="Linux" >}}
@y
{{< /tab >}}
{{< tab name="Linux" >}}
@z

@x
1. Locate the `com.docker.diagnose` tool:
@y
1. Locate the `com.docker.diagnose` tool:
@z

@x
   ```console
   $ /opt/docker-desktop/bin/com.docker.diagnose
   ```
@y
   ```console
   $ /opt/docker-desktop/bin/com.docker.diagnose
   ```
@z

@x
2. Create and upload the diagnostics ID. Run:
@y
2. Create and upload the diagnostics ID. Run:
@z

@x
   ```console
   $ /opt/docker-desktop/bin/com.docker.diagnose gather -upload
   ```
@y
   ```console
   $ /opt/docker-desktop/bin/com.docker.diagnose gather -upload
   ```
@z

@x
After the diagnostics have finished, the terminal displays your diagnostics ID and the path to the diagnostics file. The diagnostics ID is composed of your user ID and a timestamp. For example `BE9AFAAF-F68B-41D0-9D12-84760E6B8740/20190905152051`. 
@y
After the diagnostics have finished, the terminal displays your diagnostics ID and the path to the diagnostics file. The diagnostics ID is composed of your user ID and a timestamp. For example `BE9AFAAF-F68B-41D0-9D12-84760E6B8740/20190905152051`. 
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
To view the contents of the diagnostic file:
@y
To view the contents of the diagnostic file:
@z

@x
{{< tabs group="os" >}}
{{< tab name="Windows" >}}
@y
{{< tabs group="os" >}}
{{< tab name="Windows" >}}
@z

@x
1. Unzip the file. In PowerShell, copy and paste the path to the diagnostics file into the following command and then run it. It should be similar to the following example:
@y
1. Unzip the file. In PowerShell, copy and paste the path to the diagnostics file into the following command and then run it. It should be similar to the following example:
@z

@x
   ```powershell
   $ Expand-Archive -LiteralPath "C:\Users\testUser\AppData\Local\Temp\5DE9978A-3848-429E-8776-950FC869186F\20230607101602.zip" -DestinationPath "C:\Users\testuser\AppData\Local\Temp\5DE9978A-3848-429E-8776-950FC869186F\20230607101602"
   ```  
@y
   ```powershell
   $ Expand-Archive -LiteralPath "C:\Users\testUser\AppData\Local\Temp\5DE9978A-3848-429E-8776-950FC869186F\20230607101602.zip" -DestinationPath "C:\Users\testuser\AppData\Local\Temp\5DE9978A-3848-429E-8776-950FC869186F\20230607101602"
   ```  
@z

@x
2. Open the file in your preferred text editor. Run:
@y
2. Open the file in your preferred text editor. Run:
@z

@x
   ```powershell
   $ code <path-to-file>
   ```
@y
   ```powershell
   $ code <path-to-file>
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
Run:
@y
Run:
@z

@x
```console
$ open /tmp/<your-diagnostics-ID>.zip
```
@y
```console
$ open /tmp/<your-diagnostics-ID>.zip
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
Run:
@y
Run:
@z

@x
```console
$ unzip â€“l /tmp/<your-diagnostics-ID>.zip
```
@y
```console
$ unzip â€“l /tmp/<your-diagnostics-ID>.zip
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
#### Use your diagnostics ID to get help
@y
#### Use your diagnostics ID to get help
@z

@x
If you have a paid Docker subscription, select **Contact support**. This opens the Docker Desktop support form. Fill in the information required and add the ID you copied in step three to the **Diagnostics ID field**. Then, select **Submit ticket** to request Docker Desktop support.
@y
If you have a paid Docker subscription, select **Contact support**. This opens the Docker Desktop support form. Fill in the information required and add the ID you copied in step three to the **Diagnostics ID field**. Then, select **Submit ticket** to request Docker Desktop support.
@z

@x
If you don't have a paid Docker subscription, create an issue on GitHub:
@y
If you don't have a paid Docker subscription, create an issue on GitHub:
@z

@x
- [For Linux](https://github.com/docker/desktop-linux/issues)
- [For Mac](https://github.com/docker/for-mac/issues)
- [For Windows](https://github.com/docker/for-win/issues)
@y
- [For Linux](https://github.com/docker/desktop-linux/issues)
- [For Mac](https://github.com/docker/for-mac/issues)
- [For Windows](https://github.com/docker/for-win/issues)
@z

@x
### Self-diagnose tool
@y
### Self-diagnose tool
@z

@x
> [!IMPORTANT]
>
> This tool has been deprecated.
@y
> [!IMPORTANT]
>
> This tool has been deprecated.
@z

@x
## Check the logs
@y
## Check the logs
@z

@x
In addition to using the diagnose option to submit logs, you can browse the logs yourself.
@y
In addition to using the diagnose option to submit logs, you can browse the logs yourself.
@z

@x
{{< tabs group="os" >}}
{{< tab name="Windows" >}}
@y
{{< tabs group="os" >}}
{{< tab name="Windows" >}}
@z

@x
In PowerShell, run:
@y
In PowerShell, run:
@z

@x
```powershell
$ code $Env:LOCALAPPDATA\Docker\log
```
@y
```powershell
$ code $Env:LOCALAPPDATA\Docker\log
```
@z

@x
This opens up all the logs in your preferred text editor for you to explore.
@y
This opens up all the logs in your preferred text editor for you to explore.
@z

@x
{{< /tab >}}
{{< tab name="Mac" >}}
@y
{{< /tab >}}
{{< tab name="Mac" >}}
@z

@x
### From terminal
@y
### From terminal
@z

@x
To watch the live flow of Docker Desktop logs in the command line, run the following script from your preferred shell.
@y
To watch the live flow of Docker Desktop logs in the command line, run the following script from your preferred shell.
@z

@x
```console
$ pred='process matches ".*(ocker|vpnkit).*" || (process in {"taskgated-helper", "launchservicesd", "kernel"} && eventMessage contains[c] "docker")'
$ /usr/bin/log stream --style syslog --level=debug --color=always --predicate "$pred"
```
@y
```console
$ pred='process matches ".*(ocker|vpnkit).*" || (process in {"taskgated-helper", "launchservicesd", "kernel"} && eventMessage contains[c] "docker")'
$ /usr/bin/log stream --style syslog --level=debug --color=always --predicate "$pred"
```
@z

@x
Alternatively, to collect the last day of logs (`1d`) in a file, run:
@y
Alternatively, to collect the last day of logs (`1d`) in a file, run:
@z

@x
```console
$ /usr/bin/log show --debug --info --style syslog --last 1d --predicate "$pred" >/tmp/logs.txt
```
@y
```console
$ /usr/bin/log show --debug --info --style syslog --last 1d --predicate "$pred" >/tmp/logs.txt
```
@z

@x
### From the Console app
@y
### From the Console app
@z

@x
Mac provides a built-in log viewer, named **Console**, which you can use to check
Docker logs.
@y
Mac provides a built-in log viewer, named **Console**, which you can use to check
Docker logs.
@z

@x
The Console lives in `/Applications/Utilities`. You can search for it with
Spotlight Search.
@y
The Console lives in `/Applications/Utilities`. You can search for it with
Spotlight Search.
@z

@x
To read the Docker app log messages, type `docker` in the Console window search bar and press Enter. Then select `ANY` to expand the drop-down list next to your `docker` search entry, and select `Process`.
@y
To read the Docker app log messages, type `docker` in the Console window search bar and press Enter. Then select `ANY` to expand the drop-down list next to your `docker` search entry, and select `Process`.
@z

@x
![Mac Console search for Docker app](../../images/console.png)
@y
![Mac Console search for Docker app](../../images/console.png)
@z

@x
You can use the Console Log Query to search logs, filter the results in various
ways, and create reports.
@y
You can use the Console Log Query to search logs, filter the results in various
ways, and create reports.
@z

@x
{{< /tab >}}
{{< tab name="Linux" >}}
@y
{{< /tab >}}
{{< tab name="Linux" >}}
@z

@x
You can access Docker Desktop logs by running the following command:
@y
You can access Docker Desktop logs by running the following command:
@z

@x
```console
$ journalctl --user --unit=docker-desktop
```
@y
```console
$ journalctl --user --unit=docker-desktop
```
@z

@x
You can also find the logs for the internal components included in Docker
Desktop at `$HOME/.docker/desktop/log/`.
@y
You can also find the logs for the internal components included in Docker
Desktop at `$HOME/.docker/desktop/log/`.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## View the Docker daemon logs
@y
## View the Docker daemon logs
@z

@x
Refer to the [Read the daemon logs](/manuals/engine/daemon/logs.md) section
to learn how to view the Docker Daemon logs.
@y
Refer to the [Read the daemon logs](manuals/engine/daemon/logs.md) section
to learn how to view the Docker Daemon logs.
@z

@x
## Further resources
@y
## Further resources
@z

@x
- View specific [troubleshoot topics](topics.md).
- View information on [known issues](known-issues.md)
@y
- View specific [troubleshoot topics](topics.md).
- View information on [known issues](known-issues.md)
@z
