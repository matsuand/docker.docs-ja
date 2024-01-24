%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Explore common troubleshooting topics for Docker Desktop
keywords: Linux, Mac, Windows, troubleshooting, topics, Docker Desktop
title: Troubleshoot topics for Docker Desktop
toc_max: 4
---
@y
---
description: Explore common troubleshooting topics for Docker Desktop
keywords: Linux, Mac, Windows, troubleshooting, topics, Docker Desktop
title: Docker Desktop のトラブルシューティング
toc_max: 4
---
@z

@x
## Topics for all platforms
@y
## 全プラットフォームに関するトピック {#topics-for-all-platforms}
@z

@x
### Make sure certificates are set up correctly
@y
### Make sure certificates are set up correctly
@z

@x
Docker Desktop ignores certificates listed under insecure registries, and
does not send client certificates to them. Commands like `docker run` that
attempt to pull from the registry produces error messages on the command line,
like this:
@y
Docker Desktop ignores certificates listed under insecure registries, and
does not send client certificates to them. Commands like `docker run` that
attempt to pull from the registry produces error messages on the command line,
like this:
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
As well as on the registry. For example:
@y
As well as on the registry. For example:
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
## Topics for Linux and Mac
@y
## Linux と Mac に関するトピック {#topics-for-linux-and-mac}
@z

@x
### Volume mounting requires file sharing for any project directories outside of `$HOME`
@y
### Volume mounting requires file sharing for any project directories outside of `$HOME`
@z

@x
If you are using mounted volumes and get runtime errors indicating an
application file is not found, access to a volume mount is denied, or a service
cannot start, such as when using [Docker Compose](../../compose/gettingstarted.md),
you might need to turn on [file sharing](../settings/linux.md#file-sharing).
@y
If you are using mounted volumes and get runtime errors indicating an
application file is not found, access to a volume mount is denied, or a service
cannot start, such as when using [Docker Compose](../../compose/gettingstarted.md),
you might need to turn on [file sharing](../settings/linux.md#file-sharing).
@z

@x
Volume mounting requires shared drives for projects that live outside of the
`/home/<user>` directory. From **Settings**, select **Resources** and then **File sharing**. Share the drive that contains the Dockerfile and volume.
@y
Volume mounting requires shared drives for projects that live outside of the
`/home/<user>` directory. From **Settings**, select **Resources** and then **File sharing**. Share the drive that contains the Dockerfile and volume.
@z

@x
### Docker Desktop fails to start on MacOS or Linux platforms
@y
### Docker Desktop fails to start on MacOS or Linux platforms
@z

@x
On MacOS and Linux, Docker Desktop creates Unix domain sockets used for inter-process communication.
@y
On MacOS and Linux, Docker Desktop creates Unix domain sockets used for inter-process communication.
@z

@x
Docker fails to start if the absolute path length of any of these sockets exceeds the OS limitation which is 104 characters on MacOS and 108 characters on Linux. These sockets are created under the user's home directory. If the user ID length is such that the absolute path of the socket exceeds the OS path length limitation, then Docker Desktop is unable to create the socket and fails to start. The workaround for this is to shorten the user ID which we recommend has a maximum length of 33 characters on MacOS and 55 characters on Linux. 
@y
Docker fails to start if the absolute path length of any of these sockets exceeds the OS limitation which is 104 characters on MacOS and 108 characters on Linux. These sockets are created under the user's home directory. If the user ID length is such that the absolute path of the socket exceeds the OS path length limitation, then Docker Desktop is unable to create the socket and fails to start. The workaround for this is to shorten the user ID which we recommend has a maximum length of 33 characters on MacOS and 55 characters on Linux. 
@z

@x
Following are the examples of errors on MacOS which indicate that the startup failure was due to exceeding the above mentioned OS limitation:
@y
Following are the examples of errors on MacOS which indicate that the startup failure was due to exceeding the above mentioned OS limitation:
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
## Topics for Mac
@y
## Topics for Mac
@z

@x
### Incompatible CPU detected
@y
### Incompatible CPU detected
@z

@x
Docker Desktop requires a processor (CPU) that supports virtualization and, more
specifically, the [Apple Hypervisor
framework](https://developer.apple.com/library/mac/documentation/DriversKernelHardware/Reference/Hypervisor/).
Docker Desktop is only compatible with Mac systems that have a CPU that supports the Hypervisor framework. Most Macs built in 2010 and later support it,as described in the Apple Hypervisor Framework documentation about supported hardware:
@y
Docker Desktop requires a processor (CPU) that supports virtualization and, more
specifically, the [Apple Hypervisor
framework](https://developer.apple.com/library/mac/documentation/DriversKernelHardware/Reference/Hypervisor/).
Docker Desktop is only compatible with Mac systems that have a CPU that supports the Hypervisor framework. Most Macs built in 2010 and later support it,as described in the Apple Hypervisor Framework documentation about supported hardware:
@z

@x
*Generally, machines with an Intel VT-x feature set that includes Extended Page
Tables (EPT) and Unrestricted Mode are supported.*
@y
*Generally, machines with an Intel VT-x feature set that includes Extended Page
Tables (EPT) and Unrestricted Mode are supported.*
@z

@x
To check if your Mac supports the Hypervisor framework, run the following command in a terminal window.
@y
To check if your Mac supports the Hypervisor framework, run the following command in a terminal window.
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
If your Mac supports the Hypervisor Framework, the command prints
`kern.hv_support: 1`.
@y
If your Mac supports the Hypervisor Framework, the command prints
`kern.hv_support: 1`.
@z

@x
If not, the command prints `kern.hv_support: 0`.
@y
If not, the command prints `kern.hv_support: 0`.
@z

@x
See also, [Hypervisor Framework
Reference](https://developer.apple.com/library/mac/documentation/DriversKernelHardware/Reference/Hypervisor/)
in the Apple documentation, and Docker Desktop [Mac system requirements](../install/mac-install.md#system-requirements).
@y
See also, [Hypervisor Framework
Reference](https://developer.apple.com/library/mac/documentation/DriversKernelHardware/Reference/Hypervisor/)
in the Apple documentation, and Docker Desktop [Mac system requirements](../install/mac-install.md#system-requirements).
@z

@x
### VPNKit keeps breaking
@y
### VPNKit keeps breaking
@z

@x
In Docker Desktop version 4.19, gVisor replaced VPNKit to enhance the performance of VM networking when using the Virtualization framework on macOS Ventura and above. 
@y
In Docker Desktop version 4.19, gVisor replaced VPNKit to enhance the performance of VM networking when using the Virtualization framework on macOS Ventura and above. 
@z

@x
To continue using VPNKit, add `"networkType":"vpnkit"` to your `settings.json` file located at `~/Library/Group Containers/group.com.docker/settings.json`.
@y
To continue using VPNKit, add `"networkType":"vpnkit"` to your `settings.json` file located at `~/Library/Group Containers/group.com.docker/settings.json`.
@z

@x
## Topics for Windows
@y
## Topics for Windows
@z

@x
### Volumes
@y
### Volumes
@z

@x
#### Permissions errors on data directories for shared volumes
@y
#### Permissions errors on data directories for shared volumes
@z

@x
When sharing files from Windows, Docker Desktop sets permissions on [shared volumes](../settings/windows.md#file-sharing)
to a default value of [0777](https://chmodcommand.com/chmod-0777/)
(`read`, `write`, `execute` permissions for `user` and for `group`).
@y
When sharing files from Windows, Docker Desktop sets permissions on [shared volumes](../settings/windows.md#file-sharing)
to a default value of [0777](https://chmodcommand.com/chmod-0777/)
(`read`, `write`, `execute` permissions for `user` and for `group`).
@z

@x
The default permissions on shared volumes are not configurable. If you are
working with applications that require permissions different from the shared
volume defaults at container runtime, you need to either use non-host-mounted
volumes or find a way to make the applications work with the default file
permissions.
@y
The default permissions on shared volumes are not configurable. If you are
working with applications that require permissions different from the shared
volume defaults at container runtime, you need to either use non-host-mounted
volumes or find a way to make the applications work with the default file
permissions.
@z

@x
See also,
[Can I change permissions on shared volumes for container-specific deployment requirements?](../faqs/windowsfaqs.md#can-i-change-permissions-on-shared-volumes-for-container-specific-deployment-requirements)
in the FAQs.
@y
See also,
[Can I change permissions on shared volumes for container-specific deployment requirements?](../faqs/windowsfaqs.md#can-i-change-permissions-on-shared-volumes-for-container-specific-deployment-requirements)
in the FAQs.
@z

@x
#### Volume mounting requires shared folders for Linux containers
@y
#### Volume mounting requires shared folders for Linux containers
@z

@x
If you are using mounted volumes and get runtime errors indicating an
application file is not found, access is denied to a volume mount, or a service
cannot start, such as when using [Docker Compose](../../compose/gettingstarted.md),
you might need to turn on [shared folders](../settings/windows.md#file-sharing).
@y
If you are using mounted volumes and get runtime errors indicating an
application file is not found, access is denied to a volume mount, or a service
cannot start, such as when using [Docker Compose](../../compose/gettingstarted.md),
you might need to turn on [shared folders](../settings/windows.md#file-sharing).
@z

@x
With the Hyper-V backend, mounting files from Windows requires shared folders for Linux containers. From **Settings**, select **Shared Folders** and share the folder that contains the
Dockerfile and volume.
@y
With the Hyper-V backend, mounting files from Windows requires shared folders for Linux containers. From **Settings**, select **Shared Folders** and share the folder that contains the
Dockerfile and volume.
@z

@x
#### Support for symlinks
@y
#### Support for symlinks
@z

@x
Symlinks work within and across containers. To learn more, see [How do symlinks work on Windows?](../faqs/windowsfaqs.md#how-do-symlinks-work-on-windows).
@y
Symlinks work within and across containers. To learn more, see [How do symlinks work on Windows?](../faqs/windowsfaqs.md#how-do-symlinks-work-on-windows).
@z

@x
#### Avoid unexpected syntax errors, use Unix style line endings for files in containers
@y
#### Avoid unexpected syntax errors, use Unix style line endings for files in containers
@z

@x
Any file destined to run inside a container must use Unix style `\n` line
endings. This includes files referenced at the command line for builds and in
RUN commands in Docker files.
@y
Any file destined to run inside a container must use Unix style `\n` line
endings. This includes files referenced at the command line for builds and in
RUN commands in Docker files.
@z

@x
Docker containers and `docker build` run in a Unix environment, so files in
containers must use Unix style line endings: `\n`, _not_ Windows style: `\r\n`.
Keep this in mind when authoring files such as shell scripts using Windows
tools, where the default is likely to be Windows style line endings. These
commands ultimately get passed to Unix commands inside a Unix based container
(for example, a shell script passed to `/bin/sh`). If Windows style line endings
are used, `docker run` fails with syntax errors.
@y
Docker containers and `docker build` run in a Unix environment, so files in
containers must use Unix style line endings: `\n`, _not_ Windows style: `\r\n`.
Keep this in mind when authoring files such as shell scripts using Windows
tools, where the default is likely to be Windows style line endings. These
commands ultimately get passed to Unix commands inside a Unix based container
(for example, a shell script passed to `/bin/sh`). If Windows style line endings
are used, `docker run` fails with syntax errors.
@z

@x
For an example of this issue and the resolution, see this issue on GitHub:
[Docker RUN fails to execute shell
script](https://github.com/moby/moby/issues/24388).
@y
For an example of this issue and the resolution, see this issue on GitHub:
[Docker RUN fails to execute shell
script](https://github.com/moby/moby/issues/24388).
@z

@x
#### Path conversion on Windows
@y
#### Path conversion on Windows
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
However, on Windows, you must update the source path. For example, if you are using 
the legacy Windows shell (`cmd.exe`), you can use the following command:
@y
However, on Windows, you must update the source path. For example, if you are using 
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
#### Working with Git Bash
@y
#### Git Bash を使った操作 {#working-with-git-bash}
@z

@x
Git Bash (or MSYS) provides a Unix-like environment on Windows. These tools apply their own
preprocessing on the command line. For example, if you run the following command in Git Bash, it gives an error:
@y
Git Bash (or MSYS) provides a Unix-like environment on Windows. These tools apply their own
preprocessing on the command line. For example, if you run the following command in Git Bash, it gives an error:
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
This is because the `\` character has a special meaning in Git Bash. If you are using Git Bash, you must neutralize it using `\\`:
@y
This is because the `\` character has a special meaning in Git Bash. If you are using Git Bash, you must neutralize it using `\\`:
@z

@x
```console
$ docker run --rm -ti -v C:\\Users\\user\\work:/work alpine
```
@y
```console
$ docker run --rm -ti -v C:\\Users\\user\\work:/work alpine
```
@z

@x
Also, in scripts, the `pwd` command is used to avoid hard-coding file system locations. Its output is a Unix-style path.
@y
Also, in scripts, the `pwd` command is used to avoid hard-coding file system locations. Its output is a Unix-style path.
@z

@x
```console
$ pwd
/c/Users/user/work
```
@y
```console
$ pwd
/c/Users/user/work
```
@z

@x
Combined with the `$()` syntax, the command below works on Linux, however, it fails on Git Bash.
@y
Combined with the `$()` syntax, the command below works on Linux, however, it fails on Git Bash.
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
You can work around this issue by using an extra `/`
@y
You can work around this issue by using an extra `/`
@z

@x
```console
$ docker run --rm -ti -v /$(pwd):/work alpine
```
@y
```console
$ docker run --rm -ti -v /$(pwd):/work alpine
```
@z

@x
Portability of the scripts is not affected as Linux treats multiple `/` as a single entry.
Each occurrence of paths on a single line must be neutralized.
@y
Portability of the scripts is not affected as Linux treats multiple `/` as a single entry.
Each occurrence of paths on a single line must be neutralized.
@z

@x
```console
$ docker run --rm -ti -v /$(pwd):/work alpine ls /work
ls: C:/Program Files/Git/work: No such file or directory
```
@y
```console
$ docker run --rm -ti -v /$(pwd):/work alpine ls /work
ls: C:/Program Files/Git/work: No such file or directory
```
@z

@x
In this example, The `$(pwd)` is not converted because of the preceding '/'. However, the second '/work' is transformed by the
POSIX layer before passing it to Docker Desktop. You can also work around this issue by using an extra `/`.
@y
In this example, The `$(pwd)` is not converted because of the preceding '/'. However, the second '/work' is transformed by the
POSIX layer before passing it to Docker Desktop. You can also work around this issue by using an extra `/`.
@z

@x
```console
$ docker run --rm -ti -v /$(pwd):/work alpine ls //work
```
@y
```console
$ docker run --rm -ti -v /$(pwd):/work alpine ls //work
```
@z

@x
To verify whether the errors are generated from your script, or from another source, you can use an environment variable. For example:
@y
To verify whether the errors are generated from your script, or from another source, you can use an environment variable. For example:
@z

@x
```console
$ MSYS_NO_PATHCONV=1 docker run --rm -ti -v $(pwd):/work alpine ls /work
```
@y
```console
$ MSYS_NO_PATHCONV=1 docker run --rm -ti -v $(pwd):/work alpine ls /work
```
@z

@x
It only expects the environment variable here. The value doesn't matter.
@y
It only expects the environment variable here. The value doesn't matter.
@z

@x
In some cases, MSYS also transforms colons to semicolon. Similar conversions can also occur
when using `~` because the POSIX layer translates it to a DOS path. `MSYS_NO_PATHCONV` also works in this case.
@y
In some cases, MSYS also transforms colons to semicolon. Similar conversions can also occur
when using `~` because the POSIX layer translates it to a DOS path. `MSYS_NO_PATHCONV` also works in this case.
@z

@x
### Virtualization
@y
### Virtualization
@z

@x
Your machine must have the following features for Docker Desktop to function correctly:
@y
Your machine must have the following features for Docker Desktop to function correctly:
@z

@x
#### WSL 2 and Windows Home
@y
#### WSL 2 and Windows Home
@z

@x
1. Virtual Machine Platform
2. [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
3. [Virtualization enabled in the BIOS](https://www.virtualmetric.com/blog/how-to-enable-hardware-virtualization)
4. Hypervisor enabled at Windows startup
@y
1. Virtual Machine Platform
2. [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
3. [Virtualization enabled in the BIOS](https://www.virtualmetric.com/blog/how-to-enable-hardware-virtualization)
4. Hypervisor enabled at Windows startup
@z

@x
![WSL 2 enabled](../images/wsl2-enabled.png)
@y
![WSL 2 enabled](../images/wsl2-enabled.png)
@z

@x
#### Hyper-V
@y
#### Hyper-V
@z

@x
On Windows 10 Pro or Enterprise, you can also use Hyper-V with the following features enabled:
@y
On Windows 10 Pro or Enterprise, you can also use Hyper-V with the following features enabled:
@z

@x
1. [Hyper-V](https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/hyper-v-technology-overview)
   installed and working
2. [Virtualization enabled in the BIOS](https://www.virtualmetric.com/blog/how-to-enable-hardware-virtualization)
3. Hypervisor enabled at Windows startup
@y
1. [Hyper-V](https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/hyper-v-technology-overview)
   installed and working
2. [Virtualization enabled in the BIOS](https://www.virtualmetric.com/blog/how-to-enable-hardware-virtualization)
3. Hypervisor enabled at Windows startup
@z

@x
![Hyper-V on Windows features](../images/hyperv-enabled.png)
@y
![Hyper-V on Windows features](../images/hyperv-enabled.png)
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
#### Virtualization must be turned on
@y
#### Virtualization must be turned on
@z

@x
In addition to [Hyper-V](#hyper-v) or [WSL 2](../wsl/index.md), virtualization must be turned on. Check the
Performance tab on the Task Manager. Alternatively, you can type 'systeminfo' into your terminal. If you see 'Hyper-V Requirements:   A hypervisor has been detected. Features required for Hyper-V will not be displayed', then virtualization is enabled.
@y
In addition to [Hyper-V](#hyper-v) or [WSL 2](../wsl/index.md), virtualization must be turned on. Check the
Performance tab on the Task Manager. Alternatively, you can type 'systeminfo' into your terminal. If you see 'Hyper-V Requirements:   A hypervisor has been detected. Features required for Hyper-V will not be displayed', then virtualization is enabled.
@z

@x
![Task Manager](../images/virtualization-enabled.png)
@y
![Task Manager](../images/virtualization-enabled.png)
@z

@x
If you manually uninstall Hyper-V, WSL 2 or turn off virtualization,
Docker Desktop cannot start. 
@y
If you manually uninstall Hyper-V, WSL 2 or turn off virtualization,
Docker Desktop cannot start. 
@z

@x
To turn on nested virtualisation, see [Run Docker Desktop for Windows in a VM or VDI environment](../vm-vdi.md#turn-on-nested-virtualization).
@y
To turn on nested virtualisation, see [Run Docker Desktop for Windows in a VM or VDI environment](../vm-vdi.md#turn-on-nested-virtualization).
@z

@x
#### Hypervisor enabled at Windows startup
@y
#### Hypervisor enabled at Windows startup
@z

@x
If you have completed the steps described above and are still experiencing
Docker Desktop startup issues, this could be because the Hypervisor is installed,
but not launched during Windows startup. Some tools (such as older versions of 
Virtual Box) and video game installers turn off hypervisor on boot. To turn it back on:
@y
If you have completed the steps described above and are still experiencing
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
#### Turn on nested virtualization
@y
#### Turn on nested virtualization
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
Try [enabling nested virtualization](../vm-vdi.md#turn-on-nested-virtualization).
@y
Try [enabling nested virtualization](../vm-vdi.md#turn-on-nested-virtualization).
@z

@x
### Windows containers and Windows Server
@y
### Windows containers and Windows Server
@z

@x
Docker Desktop is not supported on Windows Server. If you have questions about how to run Windows containers on Windows 10, see
[Switch between Windows and Linux containers](../faqs/windowsfaqs.md#how-do-i-switch-between-windows-and-linux-containers).
@y
Docker Desktop is not supported on Windows Server. If you have questions about how to run Windows containers on Windows 10, see
[Switch between Windows and Linux containers](../faqs/windowsfaqs.md#how-do-i-switch-between-windows-and-linux-containers).
@z

@x
A full tutorial is available in [docker/labs](https://github.com/docker/labs) on
[Getting Started with Windows Containers](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md).
@y
A full tutorial is available in [docker/labs](https://github.com/docker/labs) on
[Getting Started with Windows Containers](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md).
@z

@x
You can install a native Windows binary which allows you to develop and run
Windows containers without Docker Desktop. However, if you install Docker this way, you cannot develop or run Linux containers. If you try to run a Linux container on the native Docker daemon, an error occurs:
@y
You can install a native Windows binary which allows you to develop and run
Windows containers without Docker Desktop. However, if you install Docker this way, you cannot develop or run Linux containers. If you try to run a Linux container on the native Docker daemon, an error occurs:
@z

@x
```none
C:\Program Files\Docker\docker.exe:
 image operating system "linux" cannot be used on this platform.
 See 'C:\Program Files\Docker\docker.exe run --help'.
```
@y
```none
C:\Program Files\Docker\docker.exe:
 image operating system "linux" cannot be used on this platform.
 See 'C:\Program Files\Docker\docker.exe run --help'.
```
@z
