%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Explore common troubleshooting topics for Docker Desktop
keywords: Linux, Mac, Windows, troubleshooting, topics, Docker Desktop
title: Troubleshoot topics for Docker Desktop
linkTitle: Common topics
@y
description: Explore common troubleshooting topics for Docker Desktop
keywords: Linux, Mac, Windows, troubleshooting, topics, Docker Desktop
title: Troubleshoot topics for Docker Desktop
linkTitle: Common topics
@z

@x
> [!TIP]
>
> If you do not find a solution in troubleshooting, browse the GitHub repositories or create a new issue:
>
> - [docker/for-mac](https://github.com/docker/for-mac/issues)
> - [docker/for-win](https://github.com/docker/for-win/issues)
> - [docker/for-linux](https://github.com/docker/for-linux/issues)
@y
> [!TIP]
>
> If you do not find a solution in troubleshooting, browse the GitHub repositories or create a new issue:
>
> - [docker/for-mac](https://github.com/docker/for-mac/issues)
> - [docker/for-win](https://github.com/docker/for-win/issues)
> - [docker/for-linux](https://github.com/docker/for-linux/issues)
@z

@x
## Topics for all platforms
@y
## 全プラットフォームに関するトピック {#topics-for-all-platforms}
@z

@x
### Certificates not set up correctly 
@y
### Certificates not set up correctly 
@z

@x
#### Error message 
@y
#### Error message 
@z

@x
When attempting to pull from a registry using `docker run`, you may encounter the following error:
@y
When attempting to pull from a registry using `docker run`, you may encounter the following error:
@z

@x
```console
Error response from daemon: Get http://192.168.203.139:5858/v2/: malformed HTTP response "\x15\x03\x01\x00\x02\x02"
```
@y
```console
Error response from daemon: Get http://192.168.203.139:5858/v2/: malformed HTTP response "\x15\x03\x01\x00\x02\x02"
```
@z

@x
Additionally, logs from the registry may show:
@y
Additionally, logs from the registry may show:
@z

@x
```console
2017/06/20 18:15:30 http: TLS handshake error from 192.168.203.139:52882: tls: client didn't provide a certificate
2017/06/20 18:15:30 http: TLS handshake error from 192.168.203.139:52883: tls: first record does not look like a TLS handshake
```
@y
```console
2017/06/20 18:15:30 http: TLS handshake error from 192.168.203.139:52882: tls: client didn't provide a certificate
2017/06/20 18:15:30 http: TLS handshake error from 192.168.203.139:52883: tls: first record does not look like a TLS handshake
```
@z

@x
#### Possible causes 
@y
#### Possible causes 
@z

@x
- Docker Desktop ignores certificates listed under insecure registries.
- Client certificates are not sent to insecure registries, causing handshake failures.
@y
- Docker Desktop ignores certificates listed under insecure registries.
- Client certificates are not sent to insecure registries, causing handshake failures.
@z

@x
#### Solution 
@y
#### Solution 
@z

@x
- Ensure that your registry is properly configured with valid SSL certificates.
- If your registry is self-signed, configure Docker to trust the certificate by adding it to Docker’s certificates directory (/etc/docker/certs.d/ on Linux).
- If the issue persists, check your Docker daemon configuration and enable TLS authentication.
@y
- Ensure that your registry is properly configured with valid SSL certificates.
- If your registry is self-signed, configure Docker to trust the certificate by adding it to Docker’s certificates directory (/etc/docker/certs.d/ on Linux).
- If the issue persists, check your Docker daemon configuration and enable TLS authentication.
@z

@x
### Docker Desktop's UI appears green, distorted, or has visual artifacts
@y
### Docker Desktop's UI appears green, distorted, or has visual artifacts
@z

@x
#### Cause
@y
#### Cause
@z

@x
Docker Desktop uses hardware-accelerated graphics by default, which may cause problems for some GPUs.
@y
Docker Desktop uses hardware-accelerated graphics by default, which may cause problems for some GPUs.
@z

@x
#### Solution
@y
#### Solution
@z

@x
Disable hardware acceleration:
@y
Disable hardware acceleration:
@z

@x
1. Edit Docker Desktop's `settings-store.json` file (or `settings.json` for Docker Desktop versions 4.34 and earlier). You can find this file at:
@y
1. Edit Docker Desktop's `settings-store.json` file (or `settings.json` for Docker Desktop versions 4.34 and earlier). You can find this file at:
@z

@x
   - Mac: `~/Library/Group Containers/group.com.docker/settings-store.json`
   - Windows: `C:\Users\[USERNAME]\AppData\Roaming\Docker\settings-store.json`
   - Linux: `~/.docker/desktop/settings-store.json.`
@y
   - Mac: `~/Library/Group Containers/group.com.docker/settings-store.json`
   - Windows: `C:\Users\[USERNAME]\AppData\Roaming\Docker\settings-store.json`
   - Linux: `~/.docker/desktop/settings-store.json.`
@z

@x
2. Add the following entry:
@y
2. Add the following entry:
@z

@x
   ```JSON
   $ "disableHardwareAcceleration": true
   ```
@y
   ```JSON
   $ "disableHardwareAcceleration": true
   ```
@z

@x
3. Save the file and restart Docker Desktop.
@y
3. Save the file and restart Docker Desktop.
@z

@x
### Using mounted volumes and getting runtime errors indicating an application file is not found, access to a volume mount is denied, or a service cannot start
@y
### Using mounted volumes and getting runtime errors indicating an application file is not found, access to a volume mount is denied, or a service cannot start
@z

@x
#### Cause
@y
#### Cause
@z

@x
If your project directory is located outside your home directory (`/home/<user>`), Docker Desktop requires file sharing permissions to access it.
@y
If your project directory is located outside your home directory (`/home/<user>`), Docker Desktop requires file sharing permissions to access it.
@z

@x
#### Solution
@y
#### Solution
@z

@x
Enable file sharing in Docker Desktop for Mac and Linux:
@y
Enable file sharing in Docker Desktop for Mac and Linux:
@z

@x
1. Navigate to **Settings**, select **Resources** and then **File sharing**.
2. Add the drive or folder that contains the Dockerfile and volume mount paths.
@y
1. Navigate to **Settings**, select **Resources** and then **File sharing**.
2. Add the drive or folder that contains the Dockerfile and volume mount paths.
@z

@x
Enable file sharing in Docker Desktop for Windows:
@y
Enable file sharing in Docker Desktop for Windows:
@z

@x
1. From **Settings**, select **Shared Folders**. 
2. Share the folder that contains the Dockerfile and volume mount paths.
@y
1. From **Settings**, select **Shared Folders**. 
2. Share the folder that contains the Dockerfile and volume mount paths.
@z

@x
### `port already allocated` errors
@y
### `port already allocated` errors
@z

@x
#### Error message
@y
#### Error message
@z

@x
When starting a container, you may see an error like:
@y
When starting a container, you may see an error like:
@z

@x
```text
Bind for 0.0.0.0:8080 failed: port is already allocated
```
@y
```text
Bind for 0.0.0.0:8080 failed: port is already allocated
```
@z

@x
Or
@y
Or
@z

@x
```text
listen tcp:0.0.0.0:8080: bind: address is already in use
```
@y
```text
listen tcp:0.0.0.0:8080: bind: address is already in use
```
@z

@x
#### Cause
@y
#### Cause
@z

@x
- Another application on your system is already using the specified port.
- A previously running container was not stopped properly and is still bound to the port.
@y
- Another application on your system is already using the specified port.
- A previously running container was not stopped properly and is still bound to the port.
@z

@x
#### Solution
@y
#### Solution
@z

@x
To discover the identity of this software, either:
- Use the `resmon.exe` GUI, select **Network** and then **Listening Ports**
- In PowerShell, use `netstat -aon | find /i "listening "` to discover the PID of the process
currently using the port (the PID is the number in the rightmost column). 
@y
To discover the identity of this software, either:
- Use the `resmon.exe` GUI, select **Network** and then **Listening Ports**
- In PowerShell, use `netstat -aon | find /i "listening "` to discover the PID of the process
currently using the port (the PID is the number in the rightmost column). 
@z

@x
Then, decide whether to shut the other process down, or to use a different port in your
Docker app.
@y
Then, decide whether to shut the other process down, or to use a different port in your
Docker app.
@z

@x
## Topics for Linux and Mac
@y
## Linux と Mac に関するトピック {#topics-for-linux-and-mac}
@z

@x
### Docker Desktop fails to start on Mac or Linux platforms
@y
### Docker Desktop fails to start on Mac or Linux platforms
@z

@x
#### Error message 
@y
#### Error message 
@z

@x
Docker fails to start due to Unix domain socket path length limitations:
@y
Docker fails to start due to Unix domain socket path length limitations:
@z

@x
```console
[vpnkit-bridge][F] listen unix <HOME>/Library/Containers/com.docker.docker/Data/http-proxy-control.sock: bind: invalid argument
```
@y
```console
[vpnkit-bridge][F] listen unix <HOME>/Library/Containers/com.docker.docker/Data/http-proxy-control.sock: bind: invalid argument
```
@z

@x
```console
[com.docker.backend][E] listen(vsock:4099) failed: listen unix <HOME>/Library/Containers/com.docker.docker/Data/vms/0/00000002.00001003: bind: invalid argument
```
@y
```console
[com.docker.backend][E] listen(vsock:4099) failed: listen unix <HOME>/Library/Containers/com.docker.docker/Data/vms/0/00000002.00001003: bind: invalid argument
```
@z

@x
#### Cause
@y
#### Cause
@z

@x
On Mac and Linux, Docker Desktop creates Unix domain sockets used for inter-process communication. These sockets are created under the user's home directory.
@y
On Mac and Linux, Docker Desktop creates Unix domain sockets used for inter-process communication. These sockets are created under the user's home directory.
@z

@x
Unix domain sockets have a maximum path length:
 - 104 characters on Mac
 - 108 characters on Linux
@y
Unix domain sockets have a maximum path length:
 - 104 characters on Mac
 - 108 characters on Linux
@z

@x
If your home directory path is too long, Docker Desktop fails to create necessary sockets.
@y
If your home directory path is too long, Docker Desktop fails to create necessary sockets.
@z

@x
#### Solution
@y
#### Solution
@z

@x
Ensure your username is short enough to keep paths within the allowed limit:
 - Mac: Username should be ≤ 33 characters
 - Linux: Username should be ≤ 55 characters
@y
Ensure your username is short enough to keep paths within the allowed limit:
 - Mac: Username should be ≤ 33 characters
 - Linux: Username should be ≤ 55 characters
@z

@x
## Topics for Mac
@y
## Topics for Mac
@z

@x
### Upgrade requires administrator privileges
@y
### Upgrade requires administrator privileges
@z

@x
#### Cause 
@y
#### Cause 
@z

@x
On macOS, users without administrator privileges cannot perform in-app upgrades from the Docker Desktop Dashboard.
@y
On macOS, users without administrator privileges cannot perform in-app upgrades from the Docker Desktop Dashboard.
@z

@x
#### Solution
@y
#### Solution
@z

@x
> [!IMPORTANT]
>
> Do not uninstall the current version before upgrading. Doing so deletes all local Docker containers, images, and volumes.
@y
> [!IMPORTANT]
>
> Do not uninstall the current version before upgrading. Doing so deletes all local Docker containers, images, and volumes.
@z

@x
To upgrade Docker Desktop:
@y
To upgrade Docker Desktop:
@z

@x
- Ask an administrator to install the newer version over the existing one.
- Use the []`--user` install flag](/manuals/desktop/setup/install/mac-install.md#security-and-access) if appropriate for your setup.
@y
- Ask an administrator to install the newer version over the existing one.
- Use the []`--user` install flag](manuals/desktop/setup/install/mac-install.md#security-and-access) if appropriate for your setup.
@z

@x
### Persistent notification telling me an application has changed my Desktop configurations
@y
### Persistent notification telling me an application has changed my Desktop configurations
@z

@x
#### Cause 
@y
#### Cause 
@z

@x
You receive this notification because the Configuration integrity check feature has detected that a third-party application has altered your Docker Desktop configuration. This usually happens due to incorrect or missing symlinks. The notification ensures you are aware of these changes so you can review and repair any potential issues to maintain system reliability.
@y
You receive this notification because the Configuration integrity check feature has detected that a third-party application has altered your Docker Desktop configuration. This usually happens due to incorrect or missing symlinks. The notification ensures you are aware of these changes so you can review and repair any potential issues to maintain system reliability.
@z

@x
Opening the notification presents a pop-up window which provides detailed information about the detected integrity issues.
@y
Opening the notification presents a pop-up window which provides detailed information about the detected integrity issues.
@z

@x
#### Solution
@y
#### Solution
@z

@x
If you choose to ignore the notification, it will be shown again only at the next Docker Desktop startup. If you choose to repair your configuration, you won't be prompted again.
@y
If you choose to ignore the notification, it will be shown again only at the next Docker Desktop startup. If you choose to repair your configuration, you won't be prompted again.
@z

@x
If you want to switch off Configuration integrity check notifications, navigate to Docker Desktop's settings and in the **General** tab, clear the **Automatically check configuration** setting. 
@y
If you want to switch off Configuration integrity check notifications, navigate to Docker Desktop's settings and in the **General** tab, clear the **Automatically check configuration** setting. 
@z

@x
### `com.docker.vmnetd` is still running after I quit the app
@y
### `com.docker.vmnetd` is still running after I quit the app
@z

@x
The privileged helper process `com.docker.vmnetd` is started by `launchd` and
runs in the background. The process does not consume any resources unless
`Docker.app` connects to it, so it's safe to ignore.
@y
The privileged helper process `com.docker.vmnetd` is started by `launchd` and
runs in the background. The process does not consume any resources unless
`Docker.app` connects to it, so it's safe to ignore.
@z

@x
### Incompatible CPU detected
@y
### Incompatible CPU detected
@z

@x
#### Cause
@y
#### Cause
@z

@x
Docker Desktop requires a processor (CPU) that supports virtualization and, more
specifically, the [Apple Hypervisor
framework](https://developer.apple.com/library/mac/documentation/DriversKernelHardware/Reference/Hypervisor/).
@y
Docker Desktop requires a processor (CPU) that supports virtualization and, more
specifically, the [Apple Hypervisor
framework](https://developer.apple.com/library/mac/documentation/DriversKernelHardware/Reference/Hypervisor/).
@z

@x
#### Solution
@y
#### Solution
@z

@x
Check that: 
@y
Check that: 
@z

@x
 - You've installed the correct Docker Desktop for your architecture
 - Your Mac supports Apple's Hypervisor framework. To check if your Mac supports the Hypervisor framework, run the following command in a terminal window.
@y
 - You've installed the correct Docker Desktop for your architecture
 - Your Mac supports Apple's Hypervisor framework. To check if your Mac supports the Hypervisor framework, run the following command in a terminal window.
@z

@x
   ```console
   $ sysctl kern.hv_support
   ```
@y
   ```console
   $ sysctl kern.hv_support
   ```
@z

@x
   If your Mac supports the Hypervisor Framework, the command prints `kern.hv_support: 1`.
@y
   If your Mac supports the Hypervisor Framework, the command prints `kern.hv_support: 1`.
@z

@x
   If not, the command prints `kern.hv_support: 0`.
@y
   If not, the command prints `kern.hv_support: 0`.
@z

@x
See also, [Hypervisor Framework
Reference](https://developer.apple.com/library/mac/documentation/DriversKernelHardware/Reference/Hypervisor/)
in the Apple documentation, and Docker Desktop [Mac system requirements](/manuals/desktop/setup/install/mac-install.md#system-requirements).
@y
See also, [Hypervisor Framework
Reference](https://developer.apple.com/library/mac/documentation/DriversKernelHardware/Reference/Hypervisor/)
in the Apple documentation, and Docker Desktop [Mac system requirements](manuals/desktop/setup/install/mac-install.md#system-requirements).
@z

@x
### VPNKit keeps breaking
@y
### VPNKit keeps breaking
@z

@x
#### Cause
@y
#### Cause
@z

@x
In Docker Desktop version 4.19, gVisor replaced VPNKit to enhance the performance of VM networking when using the Virtualization framework on macOS 13 and later.
@y
In Docker Desktop version 4.19, gVisor replaced VPNKit to enhance the performance of VM networking when using the Virtualization framework on macOS 13 and later.
@z

@x
#### Solution
@y
#### Solution
@z

@x
To continue using VPNKit:
@y
To continue using VPNKit:
@z

@x
1. Open your `settings-store.json` file located at `~/Library/Group Containers/group.com.docker/settings-store.json`
2. Add:
@y
1. Open your `settings-store.json` file located at `~/Library/Group Containers/group.com.docker/settings-store.json`
2. Add:
@z

@x
   ```JSON
   $ "networkType":"vpnkit"
   ```
3. Save the file and restart Docker Desktop.
@y
   ```JSON
   $ "networkType":"vpnkit"
   ```
3. Save the file and restart Docker Desktop.
@z

@x
## Topics for Windows
@y
## Topics for Windows
@z

@x
### Docker Desktop fails to start when anti-virus software is installed
@y
### Docker Desktop fails to start when anti-virus software is installed
@z

@x
#### Cause
@y
#### Cause
@z

@x
Some anti-virus software may be incompatible with Hyper-V and Microsoft
Windows 10 builds. The conflict
typically occurs after a Windows update and
manifests as an error response from the Docker daemon and a Docker Desktop start failure.
@y
Some anti-virus software may be incompatible with Hyper-V and Microsoft
Windows 10 builds. The conflict
typically occurs after a Windows update and
manifests as an error response from the Docker daemon and a Docker Desktop start failure.
@z

@x
#### Solution
@y
#### Solution
@z

@x
For a temporary workaround, uninstall the anti-virus software, or
add Docker to the exclusions/exceptions in your antivirus software.
@y
For a temporary workaround, uninstall the anti-virus software, or
add Docker to the exclusions/exceptions in your antivirus software.
@z

@x
### Permissions errors on data directories for shared volumes
@y
### Permissions errors on data directories for shared volumes
@z

@x
#### Cause 
@y
#### Cause 
@z

@x
When sharing files from Windows, Docker Desktop sets permissions on [shared volumes](/manuals/desktop/settings-and-maintenance/settings.md#file-sharing)
to a default value of [0777](https://chmodcommand.com/chmod-0777/)
(`read`, `write`, `execute` permissions for `user` and for `group`).
@y
When sharing files from Windows, Docker Desktop sets permissions on [shared volumes](manuals/desktop/settings-and-maintenance/settings.md#file-sharing)
to a default value of [0777](https://chmodcommand.com/chmod-0777/)
(`read`, `write`, `execute` permissions for `user` and for `group`).
@z

@x
The default permissions on shared volumes are not configurable. 
@y
The default permissions on shared volumes are not configurable. 
@z

@x
#### Solution
@y
#### Solution
@z

@x
If you are
working with applications that require different permissions, either:
 - Use non-host-mounted volumes  
 - Find a way to make the applications work with the default file permissions
@y
If you are
working with applications that require different permissions, either:
 - Use non-host-mounted volumes  
 - Find a way to make the applications work with the default file permissions
@z

@x
### Unexpected syntax errors, use Unix style line endings for files in containers
@y
### Unexpected syntax errors, use Unix style line endings for files in containers
@z

@x
#### Cause 
@y
#### Cause 
@z

@x
Docker containers expect Unix-style line `\n` endings, not Windows style: `\r\n`. This includes files referenced at the command line for builds and in RUN commands in Docker files.
@y
Docker containers expect Unix-style line `\n` endings, not Windows style: `\r\n`. This includes files referenced at the command line for builds and in RUN commands in Docker files.
@z

@x
Keep this in mind when authoring files such as shell scripts using Windows
tools, where the default is likely to be Windows style line endings. These
commands ultimately get passed to Unix commands inside a Unix based container
(for example, a shell script passed to `/bin/sh`). If Windows style line endings
are used, `docker run` fails with syntax errors.
@y
Keep this in mind when authoring files such as shell scripts using Windows
tools, where the default is likely to be Windows style line endings. These
commands ultimately get passed to Unix commands inside a Unix based container
(for example, a shell script passed to `/bin/sh`). If Windows style line endings
are used, `docker run` fails with syntax errors.
@z

@x
#### Solution 
@y
#### Solution 
@z

@x
 - Convert files to Unix-style line endings using:
@y
 - Convert files to Unix-style line endings using:
@z

@x
   ```console
   $ dos2unix script.sh
   ```
- In VS Code, set line endings to `LF` (Unix) instead of `CRLF` (Windows).
@y
   ```console
   $ dos2unix script.sh
   ```
- In VS Code, set line endings to `LF` (Unix) instead of `CRLF` (Windows).
@z

@x
### Path conversion errors on Windows
@y
### Path conversion errors on Windows
@z

@x
#### Cause
@y
#### Cause
@z

@x
Unlike Linux, Windows requires explicit path conversion for volume mounting.
@y
Unlike Linux, Windows requires explicit path conversion for volume mounting.
@z

@x
On Linux, the system takes care of mounting a path to another path. For example, when you run the following command on Linux:
@y
On Linux, the system takes care of mounting a path to another path. For example, when you run the following command on Linux:
@z

@x
```console
$ docker run --rm -ti -v /home/user/work:/work alpine
```
@y
```console
$ docker run --rm -ti -v /home/user/work:/work alpine
```
@z

@x
It adds a `/work` directory to the target container to mirror the specified path.
@y
It adds a `/work` directory to the target container to mirror the specified path.
@z

@x
#### Solution
@y
#### Solution
@z

@x
Update the source path. For example, if you are using 
the legacy Windows shell (`cmd.exe`), you can use the following command:
@y
Update the source path. For example, if you are using 
the legacy Windows shell (`cmd.exe`), you can use the following command:
@z

@x
```console
$ docker run --rm -ti -v C:\Users\user\work:/work alpine
```
@y
```console
$ docker run --rm -ti -v C:\Users\user\work:/work alpine
```
@z

@x
This starts the container and ensures the volume becomes usable. This is possible because Docker Desktop detects
the Windows-style path and provides the appropriate conversion to mount the directory.
@y
This starts the container and ensures the volume becomes usable. This is possible because Docker Desktop detects
the Windows-style path and provides the appropriate conversion to mount the directory.
@z

@x
Docker Desktop also allows you to use Unix-style path to the appropriate format. For example:
@y
Docker Desktop also allows you to use Unix-style path to the appropriate format. For example:
@z

@x
```console
$ docker run --rm -ti -v /c/Users/user/work:/work alpine ls /work
```
@y
```console
$ docker run --rm -ti -v /c/Users/user/work:/work alpine ls /work
```
@z

@x
### Docker commands failing in Git Bash
@y
### Docker commands failing in Git Bash
@z

@x
#### Error message
@y
#### Error message
@z

@x
```console
$ docker run --rm -ti -v C:\Users\user\work:/work alpine
docker: Error response from daemon: mkdir C:UsersUserwork: Access is denied.
```
@y
```console
$ docker run --rm -ti -v C:\Users\user\work:/work alpine
docker: Error response from daemon: mkdir C:UsersUserwork: Access is denied.
```
@z

@x
```console
$ docker run --rm -ti -v $(pwd):/work alpine
docker: Error response from daemon: OCI runtime create failed: invalid mount {Destination:\Program Files\Git\work Type:bind Source:/run/desktop/mnt/host/c/Users/user/work;C Options:[rbind rprivate]}: mount destination \Program Files\Git\work not absolute: unknown.
```
@y
```console
$ docker run --rm -ti -v $(pwd):/work alpine
docker: Error response from daemon: OCI runtime create failed: invalid mount {Destination:\Program Files\Git\work Type:bind Source:/run/desktop/mnt/host/c/Users/user/work;C Options:[rbind rprivate]}: mount destination \Program Files\Git\work not absolute: unknown.
```
@z

@x
#### Cause
@y
#### Cause
@z

@x
Git Bash (or MSYS) provides a Unix-like environment on Windows. These tools apply their own
preprocessing on the command line. 
@y
Git Bash (or MSYS) provides a Unix-like environment on Windows. These tools apply their own
preprocessing on the command line. 
@z

@x
This affects `$(pwd)`, colon-separated paths, and tilde (`~`)
@y
This affects `$(pwd)`, colon-separated paths, and tilde (`~`)
@z

@x
Also, the `\` character has a special meaning in Git Bash. 
@y
Also, the `\` character has a special meaning in Git Bash. 
@z

@x
#### Solution
@y
#### Solution
@z

@x
 - Disable Git Bash path conversion temporarily. For example, run the command with MSYS path conversion disable:
    ```console
    $ MSYS_NO_PATHCONV=1 docker run --rm -ti -v $(pwd):/work alpine
    ```
 - Use proper path formatting:
    - Use double forward and backslashes (`\\` `//`) instead of single (`\` `/`).
    - If referencing `$(pwd)`, add an extra `/`:
@y
 - Disable Git Bash path conversion temporarily. For example, run the command with MSYS path conversion disable:
    ```console
    $ MSYS_NO_PATHCONV=1 docker run --rm -ti -v $(pwd):/work alpine
    ```
 - Use proper path formatting:
    - Use double forward and backslashes (`\\` `//`) instead of single (`\` `/`).
    - If referencing `$(pwd)`, add an extra `/`:
@z

@x
Portability of the scripts is not affected as Linux treats multiple `/` as a single entry.
@y
Portability of the scripts is not affected as Linux treats multiple `/` as a single entry.
@z

@x
### Docker Desktop fails due to Virtualization not working
@y
### Docker Desktop fails due to Virtualization not working
@z

@x
#### Error message
@y
#### Error message
@z

@x
A typical error message is "Docker Desktop - Unexpected WSL error" mentioning the error code
`Wsl/Service/RegisterDistro/CreateVm/HCS/HCS_E_HYPERV_NOT_INSTALLED`. Manually executing `wsl` commands
also fails with the same error code.
@y
A typical error message is "Docker Desktop - Unexpected WSL error" mentioning the error code
`Wsl/Service/RegisterDistro/CreateVm/HCS/HCS_E_HYPERV_NOT_INSTALLED`. Manually executing `wsl` commands
also fails with the same error code.
@z

@x
#### Cause
@y
#### Cause
@z

@x
- Virtualization settings are disabled in the BIOS.
- Windows Hyper-V or WSL 2 components are missing.
@y
- Virtualization settings are disabled in the BIOS.
- Windows Hyper-V or WSL 2 components are missing.
@z

@x
Note some third-party software such as Android emulators will disable Hyper-V on install.
@y
Note some third-party software such as Android emulators will disable Hyper-V on install.
@z

@x
#### Solutions
@y
#### Solutions
@z

@x
Your machine must have the following features for Docker Desktop to function correctly:
@y
Your machine must have the following features for Docker Desktop to function correctly:
@z

@x
##### WSL 2 and Windows Home
@y
##### WSL 2 and Windows Home
@z

@x
1. Virtual Machine Platform
2. [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
3. [Virtualization enabled in the BIOS](https://support.microsoft.com/en-gb/windows/enable-virtualization-on-windows-c5578302-6e43-4b4b-a449-8ced115f58e1)
   Note that many Windows devices already have virtualization enabled, so this may not apply.
4. Hypervisor enabled at Windows startup
@y
1. Virtual Machine Platform
2. [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
3. [Virtualization enabled in the BIOS](https://support.microsoft.com/en-gb/windows/enable-virtualization-on-windows-c5578302-6e43-4b4b-a449-8ced115f58e1)
   Note that many Windows devices already have virtualization enabled, so this may not apply.
4. Hypervisor enabled at Windows startup
@z

@x
![WSL 2 enabled](../../images/wsl2-enabled.png)
@y
![WSL 2 enabled](../../images/wsl2-enabled.png)
@z

@x
It must be possible to run WSL 2 commands without error, for example:
@y
It must be possible to run WSL 2 commands without error, for example:
@z

@x
```console
PS C:\users\> wsl -l -v
  NAME              STATE           VERSION
* Ubuntu            Running         2
  docker-desktop    Stopped         2
PS C:\users\> wsl -d docker-desktop echo WSL 2 is working
WSL 2 is working
```
@y
```console
PS C:\users\> wsl -l -v
  NAME              STATE           VERSION
* Ubuntu            Running         2
  docker-desktop    Stopped         2
PS C:\users\> wsl -d docker-desktop echo WSL 2 is working
WSL 2 is working
```
@z

@x
If the features are enabled but the commands are not working, first check [Virtualization is turned on](#virtualization-must-be-turned-on)
then [enable the Hypervisor at Windows startup](#hypervisor-enabled-at-windows-startup) if required. If running Docker
Desktop in a Virtual Machine, ensure [the hypervisor has nested virtualization enabled](#turn-on-nested-virtualization).
@y
If the features are enabled but the commands are not working, first check [Virtualization is turned on](#virtualization-must-be-turned-on)
then [enable the Hypervisor at Windows startup](#hypervisor-enabled-at-windows-startup) if required. If running Docker
Desktop in a Virtual Machine, ensure [the hypervisor has nested virtualization enabled](#turn-on-nested-virtualization).
@z

@x
##### Hyper-V
@y
##### Hyper-V
@z

@x
On Windows 10 Pro or Enterprise, you can also use Hyper-V with the following features enabled:
@y
On Windows 10 Pro or Enterprise, you can also use Hyper-V with the following features enabled:
@z

@x
1. [Hyper-V](https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/hyper-v-technology-overview)
   installed and working
2. [Virtualization enabled in the BIOS](https://support.microsoft.com/en-gb/windows/enable-virtualization-on-windows-c5578302-6e43-4b4b-a449-8ced115f58e1)
   Note that many Windows devices already have virtualization enabled, so this may not apply.
3. Hypervisor enabled at Windows startup
@y
1. [Hyper-V](https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/hyper-v-technology-overview)
   installed and working
2. [Virtualization enabled in the BIOS](https://support.microsoft.com/en-gb/windows/enable-virtualization-on-windows-c5578302-6e43-4b4b-a449-8ced115f58e1)
   Note that many Windows devices already have virtualization enabled, so this may not apply.
3. Hypervisor enabled at Windows startup
@z

@x
![Hyper-V on Windows features](../../images/hyperv-enabled.png)
@y
![Hyper-V on Windows features](../../images/hyperv-enabled.png)
@z

@x
Docker Desktop requires Hyper-V as well as the Hyper-V Module for Windows
PowerShell to be installed and enabled. The Docker Desktop installer enables
it for you.
@y
Docker Desktop requires Hyper-V as well as the Hyper-V Module for Windows
PowerShell to be installed and enabled. The Docker Desktop installer enables
it for you.
@z

@x
Docker Desktop also needs two CPU hardware features to use Hyper-V: Virtualization and Second Level Address Translation (SLAT), which is also called Rapid Virtualization Indexing (RVI). On some systems, Virtualization must be enabled in the BIOS. The steps required are vendor-specific, but typically the BIOS option is called `Virtualization Technology (VTx)` or something similar. Run the command `systeminfo` to check all required Hyper-V features. See [Pre-requisites for Hyper-V on Windows 10](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/reference/hyper-v-requirements) for more details.
@y
Docker Desktop also needs two CPU hardware features to use Hyper-V: Virtualization and Second Level Address Translation (SLAT), which is also called Rapid Virtualization Indexing (RVI). On some systems, Virtualization must be enabled in the BIOS. The steps required are vendor-specific, but typically the BIOS option is called `Virtualization Technology (VTx)` or something similar. Run the command `systeminfo` to check all required Hyper-V features. See [Pre-requisites for Hyper-V on Windows 10](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/reference/hyper-v-requirements) for more details.
@z

@x
To install Hyper-V manually, see [Install Hyper-V on Windows 10](https://msdn.microsoft.com/en-us/virtualization/hyperv_on_windows/quick_start/walkthrough_install). A reboot is *required* after installation. If you install Hyper-V without rebooting, Docker Desktop does not work correctly.
@y
To install Hyper-V manually, see [Install Hyper-V on Windows 10](https://msdn.microsoft.com/en-us/virtualization/hyperv_on_windows/quick_start/walkthrough_install). A reboot is *required* after installation. If you install Hyper-V without rebooting, Docker Desktop does not work correctly.
@z

@x
From the start menu, type **Turn Windows features on or off** and press enter.
In the subsequent screen, verify that Hyper-V is enabled.
@y
From the start menu, type **Turn Windows features on or off** and press enter.
In the subsequent screen, verify that Hyper-V is enabled.
@z

@x
##### Virtualization must be turned on
@y
##### Virtualization must be turned on
@z

@x
In addition to [Hyper-V](#hyper-v) or [WSL 2](/manuals/desktop/features/wsl/_index.md), virtualization must be turned on. Check the
Performance tab on the Task Manager. Alternatively, you can type `systeminfo` into your terminal. If you see `Hyper-V Requirements: A hypervisor has been detected. Features required for Hyper-V will not be displayed`, then virtualization is enabled.
@y
In addition to [Hyper-V](#hyper-v) or [WSL 2](manuals/desktop/features/wsl/_index.md), virtualization must be turned on. Check the
Performance tab on the Task Manager. Alternatively, you can type `systeminfo` into your terminal. If you see `Hyper-V Requirements: A hypervisor has been detected. Features required for Hyper-V will not be displayed`, then virtualization is enabled.
@z

@x
![Task Manager](../../images/virtualization-enabled.png)
@y
![Task Manager](../../images/virtualization-enabled.png)
@z

@x
If you manually uninstall Hyper-V, WSL 2 or turn off virtualization,
Docker Desktop cannot start. 
@y
If you manually uninstall Hyper-V, WSL 2 or turn off virtualization,
Docker Desktop cannot start. 
@z

@x
To turn on nested virtualization, see [Run Docker Desktop for Windows in a VM or VDI environment](/manuals/desktop/setup/vm-vdi.md#turn-on-nested-virtualization).
@y
To turn on nested virtualization, see [Run Docker Desktop for Windows in a VM or VDI environment](manuals/desktop/setup/vm-vdi.md#turn-on-nested-virtualization).
@z

@x
##### Hypervisor enabled at Windows startup
@y
##### Hypervisor enabled at Windows startup
@z

@x
If you have completed the previous steps and are still experiencing
Docker Desktop startup issues, this could be because the Hypervisor is installed,
but not launched during Windows startup. Some tools (such as older versions of 
Virtual Box) and video game installers turn off hypervisor on boot. To turn it back on:
@y
If you have completed the previous steps and are still experiencing
Docker Desktop startup issues, this could be because the Hypervisor is installed,
but not launched during Windows startup. Some tools (such as older versions of 
Virtual Box) and video game installers turn off hypervisor on boot. To turn it back on:
@z

@x
1. Open an administrative console prompt.
2. Run `bcdedit /set hypervisorlaunchtype auto`.
3. Restart Windows.
@y
1. Open an administrative console prompt.
2. Run `bcdedit /set hypervisorlaunchtype auto`.
3. Restart Windows.
@z

@x
You can also refer to the [Microsoft TechNet article](https://social.technet.microsoft.com/Forums/en-US/ee5b1d6b-09e2-49f3-a52c-820aafc316f9/hyperv-doesnt-work-after-upgrade-to-windows-10-1809?forum=win10itprovirt) on Code flow guard (CFG) settings.
@y
You can also refer to the [Microsoft TechNet article](https://social.technet.microsoft.com/Forums/en-US/ee5b1d6b-09e2-49f3-a52c-820aafc316f9/hyperv-doesnt-work-after-upgrade-to-windows-10-1809?forum=win10itprovirt) on Code flow guard (CFG) settings.
@z

@x
##### Turn on nested virtualization
@y
##### Turn on nested virtualization
@z

@x
If you are using Hyper-V and you get the following error message when running Docker Desktop in a VDI environment:
@y
If you are using Hyper-V and you get the following error message when running Docker Desktop in a VDI environment:
@z

@x
```console
The Virtual Machine Management Service failed to start the virtual machine 'DockerDesktopVM' because one of the Hyper-V components is not running
```
@y
```console
The Virtual Machine Management Service failed to start the virtual machine 'DockerDesktopVM' because one of the Hyper-V components is not running
```
@z

@x
Try [enabling nested virtualization](/manuals/desktop/setup/vm-vdi.md#turn-on-nested-virtualization).
@y
Try [enabling nested virtualization](manuals/desktop/setup/vm-vdi.md#turn-on-nested-virtualization).
@z

@x
### Docker Desktop with Windows Containers fails with "The media is write protected""
@y
### Docker Desktop with Windows Containers fails with "The media is write protected""
@z

@x
#### Error message
@y
#### Error message
@z

@x
`FSCTL_EXTEND_VOLUME \\?\Volume{GUID}: The media is write protected`
@y
`FSCTL_EXTEND_VOLUME \\?\Volume{GUID}: The media is write protected`
@z

@x
#### Cause
@y
#### Cause
@z

@x
If you're encountering failures when running Docker Desktop with Windows Containers, it might be due to
a specific Windows configuration policy: FDVDenyWriteAccess.
@y
If you're encountering failures when running Docker Desktop with Windows Containers, it might be due to
a specific Windows configuration policy: FDVDenyWriteAccess.
@z

@x
This policy, when enabled, causes Windows to mount all fixed drives not encrypted by BitLocker-encrypted as read-only.
This also affects virtual machine volumes and as a result, Docker Desktop may not be able to start or run containers
correctly because it requires read-write access to these volumes.
@y
This policy, when enabled, causes Windows to mount all fixed drives not encrypted by BitLocker-encrypted as read-only.
This also affects virtual machine volumes and as a result, Docker Desktop may not be able to start or run containers
correctly because it requires read-write access to these volumes.
@z

@x
FDVDenyWriteAccess is a Windows Group Policy setting that, when enabled, prevents write access to fixed data drives that are not protected
by BitLocker. This is often used in security-conscious environments but can interfere with development tools like Docker.
In the Windows registry it can be found at `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies\Microsoft\FVE\FDVDenyWriteAccess`.
@y
FDVDenyWriteAccess is a Windows Group Policy setting that, when enabled, prevents write access to fixed data drives that are not protected
by BitLocker. This is often used in security-conscious environments but can interfere with development tools like Docker.
In the Windows registry it can be found at `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies\Microsoft\FVE\FDVDenyWriteAccess`.
@z

@x
#### Solutions
@y
#### Solutions
@z

@x
Docker Desktop does not support running Windows Containers on systems where FDVDenyWriteAccess is enabled. This setting interferes with the
ability of Docker to mount volumes correctly, which is critical for container functionality.
@y
Docker Desktop does not support running Windows Containers on systems where FDVDenyWriteAccess is enabled. This setting interferes with the
ability of Docker to mount volumes correctly, which is critical for container functionality.
@z

@x
To use Docker Desktop with Windows Containers, ensure that FDVDenyWriteAccess is disabled. You can check and change this setting in the registry or through Group Policy Editor (`gpedit.msc`) under:
@y
To use Docker Desktop with Windows Containers, ensure that FDVDenyWriteAccess is disabled. You can check and change this setting in the registry or through Group Policy Editor (`gpedit.msc`) under:
@z

@x
**Computer Configuration** > **Administrative Templates** > **Windows Components** > **BitLocker Drive Encryption** > **Fixed Data Drives** > **Deny write access to fixed drives not protected by BitLocker**
@y
**Computer Configuration** > **Administrative Templates** > **Windows Components** > **BitLocker Drive Encryption** > **Fixed Data Drives** > **Deny write access to fixed drives not protected by BitLocker**
@z

@x
> [!NOTE]
>
> Modifying Group Policy settings may require administrator privileges and should comply with your organization's IT policies. If the setting gets reset after some time this usually means that it was overridden by the centralized configuration of your IT department. Talk to them before making any changes.
@y
> [!NOTE]
>
> Modifying Group Policy settings may require administrator privileges and should comply with your organization's IT policies. If the setting gets reset after some time this usually means that it was overridden by the centralized configuration of your IT department. Talk to them before making any changes.
@z

@x
### `Docker Desktop Access Denied` error message when starting Docker Desktop
@y
### `Docker Desktop Access Denied` error message when starting Docker Desktop
@z

@x
#### Error message
@y
#### Error message
@z

@x
When starting Docker Desktop, the following error appears:
@y
When starting Docker Desktop, the following error appears:
@z

@x
```text
Docker Desktop - Access Denied
```
@y
```text
Docker Desktop - Access Denied
```
@z

@x
#### Cause
@y
#### Cause
@z

@x
The user is not part of the `docker-users` group, which is required for permissions.
@y
The user is not part of the `docker-users` group, which is required for permissions.
@z

@x
#### Solution
@y
#### Solution
@z

@x
If your admin account is different to your user account, add it:
@y
If your admin account is different to your user account, add it:
@z

@x
1. Run **Computer Management** as an administrator.
2. Navigate to **Local Users and Groups** > **Groups** > **docker-users**.
3. Right-click to add the user to the group.
4. Sign out and sign back in for the changes to take effect
@y
1. Run **Computer Management** as an administrator.
2. Navigate to **Local Users and Groups** > **Groups** > **docker-users**.
3. Right-click to add the user to the group.
4. Sign out and sign back in for the changes to take effect
@z
