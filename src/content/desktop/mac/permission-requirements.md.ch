%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Understand permission requirements for Docker Desktop for Mac and the
  differences between versions
keywords: Docker Desktop, mac, security, install, permissions
title: Understand permission requirements for Docker Desktop on Mac
aliases:
- /docker-for-mac/privileged-helper/
- /desktop/mac/privileged-helper/
---
@y
---
description: Understand permission requirements for Docker Desktop for Mac and the
  differences between versions
keywords: Docker Desktop, mac, security, install, permissions
title: Understand permission requirements for Docker Desktop on Mac
aliases:
- /docker-for-mac/privileged-helper/
- /desktop/mac/privileged-helper/
---
@z

@x
This page contains information about the permission requirements for running and installing Docker Desktop on Mac.
@y
This page contains information about the permission requirements for running and installing Docker Desktop on Mac.
@z

@x
It also provides clarity on running containers as `root` as opposed to having `root` access on the host.
@y
It also provides clarity on running containers as `root` as opposed to having `root` access on the host.
@z

@x
## Permission requirements
@y
## Permission requirements
@z

@x
Docker Desktop for Mac is run as an unprivileged user. However, Docker Desktop requires certain functionalities to perform a limited set of privileged configurations such as:
 - [Installing symlinks](#installing-symlinks) in`/usr/local/bin`. 
 - [Binding privileged ports](#binding-privileged-ports) that are less than 1024. The so-called "privileged ports" are not generally used as a security boundary, however operating systems still prevent unprivileged processes from binding them which breaks commands like `docker run -p 127.0.0.1:80:80 docker/getting-started`.
 - [Ensuring `localhost` and `kubernetes.docker.internal` are defined](#ensuring-localhost-and-kubernetesdockerinternal-are-defined) in `/etc/hosts`. Some old macOS installs don't have `localhost` in `/etc/hosts`, which causes Docker to fail. Defining the DNS name `kubernetes.docker.internal` allows Docker to share Kubernetes contexts with containers.
 - Securely caching the Registry Access Management policy which is read-only for the developer.
@y
Docker Desktop for Mac is run as an unprivileged user. However, Docker Desktop requires certain functionalities to perform a limited set of privileged configurations such as:
 - [Installing symlinks](#installing-symlinks) in`/usr/local/bin`. 
 - [Binding privileged ports](#binding-privileged-ports) that are less than 1024. The so-called "privileged ports" are not generally used as a security boundary, however operating systems still prevent unprivileged processes from binding them which breaks commands like `docker run -p 127.0.0.1:80:80 docker/getting-started`.
 - [Ensuring `localhost` and `kubernetes.docker.internal` are defined](#ensuring-localhost-and-kubernetesdockerinternal-are-defined) in `/etc/hosts`. Some old macOS installs don't have `localhost` in `/etc/hosts`, which causes Docker to fail. Defining the DNS name `kubernetes.docker.internal` allows Docker to share Kubernetes contexts with containers.
 - Securely caching the Registry Access Management policy which is read-only for the developer.
@z

@x
Depending on which version of Docker Desktop for Mac is used, privileged access is granted either during installation, first run, or only when it's needed.
@y
Depending on which version of Docker Desktop for Mac is used, privileged access is granted either during installation, first run, or only when it's needed.
@z

@x
{{< tabs >}}
{{< tab name="Version 4.18 and later" >}}
@y
{{< tabs >}}
{{< tab name="Version 4.18 and later" >}}
@z

@x
From version 4.18 and later, Docker Desktop for Mac provides greater control over functionality that's enabled during installation. 
@y
From version 4.18 and later, Docker Desktop for Mac provides greater control over functionality that's enabled during installation. 
@z

@x
The first time Docker Desktop for Mac launches, it presents an installation window where you can choose to either use the default settings, which work for most developers and requires you to grant privileged access, or use advanced settings. 
@y
The first time Docker Desktop for Mac launches, it presents an installation window where you can choose to either use the default settings, which work for most developers and requires you to grant privileged access, or use advanced settings. 
@z

@x
If you work in an environment with elevated security requirements, for instance where local administrative access is prohibited, then you can use the advanced settings to remove the need for granting privileged access. You can configure:
- The location of the Docker CLI tools either in the system or user directory
- The default Docker socket
- Privileged port mapping 
@y
If you work in an environment with elevated security requirements, for instance where local administrative access is prohibited, then you can use the advanced settings to remove the need for granting privileged access. You can configure:
- The location of the Docker CLI tools either in the system or user directory
- The default Docker socket
- Privileged port mapping 
@z

@x
Depending on which advanced settings you configure, you must enter your password to confirm. 
@y
Depending on which advanced settings you configure, you must enter your password to confirm. 
@z

@x
You can change these configurations at a later date from the **Advanced** page in **Settings**.
@y
You can change these configurations at a later date from the **Advanced** page in **Settings**.
@z

@x
{{< /tab >}}
{{< tab name="Version 4.15 - 4.17" >}}
@y
{{< /tab >}}
{{< tab name="Version 4.15 - 4.17" >}}
@z

@x
Versions 4.15 to 4.17 of Docker Desktop for Mac don't require the privileged process to run permanently. Whenever elevated privileges are needed for a configuration, Docker Desktop prompts you with information on the task it needs to perform. Most configurations are applied once, subsequent runs don't prompt for privileged access anymore.
The only time Docker Desktop may start the privileged process is for binding privileged ports that aren't allowed by default on the host OS.
@y
Versions 4.15 to 4.17 of Docker Desktop for Mac don't require the privileged process to run permanently. Whenever elevated privileges are needed for a configuration, Docker Desktop prompts you with information on the task it needs to perform. Most configurations are applied once, subsequent runs don't prompt for privileged access anymore.
The only time Docker Desktop may start the privileged process is for binding privileged ports that aren't allowed by default on the host OS.
@z

@x
{{< /tab >}}
{{< tab name="Versions prior to 4.15" >}}
@y
{{< /tab >}}
{{< tab name="Versions prior to 4.15" >}}
@z

@x
Versions prior to 4.15 of Docker Desktop for Mac require `root` access to be granted on the first run. The first time that Docker Desktop launches you receive an admin prompt to grant permission for the installation of the `com.docker.vmnetd` privileged helper service. For subsequent runs, `root` privileges aren't required. Following the principle of least privilege, this approach allows `root` access to be used only for the operations for which it's absolutely necessary, while still being able to use Docker Desktop as an unprivileged user.
All privileged operations are run using the privileged helper process `com.docker.vmnetd`.
@y
Versions prior to 4.15 of Docker Desktop for Mac require `root` access to be granted on the first run. The first time that Docker Desktop launches you receive an admin prompt to grant permission for the installation of the `com.docker.vmnetd` privileged helper service. For subsequent runs, `root` privileges aren't required. Following the principle of least privilege, this approach allows `root` access to be used only for the operations for which it's absolutely necessary, while still being able to use Docker Desktop as an unprivileged user.
All privileged operations are run using the privileged helper process `com.docker.vmnetd`.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Installing symlinks
@y
### Installing symlinks
@z

@x
The Docker binaries are installed by default in `/Applications/Docker.app/Contents/Resources/bin`. Docker Desktop creates symlinks for the binaries in `/usr/local/bin`, which means they're automatically included in `PATH` on most systems.
@y
The Docker binaries are installed by default in `/Applications/Docker.app/Contents/Resources/bin`. Docker Desktop creates symlinks for the binaries in `/usr/local/bin`, which means they're automatically included in `PATH` on most systems.
@z

@x
{{< tabs >}}
{{< tab name="Version 4.18 and later" >}}
@y
{{< tabs >}}
{{< tab name="Version 4.18 and later" >}}
@z

@x
With version 4.18 and later, you can choose whether to install symlinks either in `/usr/local/bin` or `$HOME/.docker/bin` during installation of Docker Desktop.
@y
With version 4.18 and later, you can choose whether to install symlinks either in `/usr/local/bin` or `$HOME/.docker/bin` during installation of Docker Desktop.
@z

@x
If `/usr/local/bin` is chosen, and this location is not writable by unprivileged users, Docker Desktop requires authorization to confirm this choice before the symlinks to Docker binaries are created in `/usr/local/bin`. If `$HOME/.docker/bin` is chosen, authorization is not required, but then you must [manually add `$HOME/.docker/bin`](../settings/mac.md#advanced) to their PATH. 
@y
If `/usr/local/bin` is chosen, and this location is not writable by unprivileged users, Docker Desktop requires authorization to confirm this choice before the symlinks to Docker binaries are created in `/usr/local/bin`. If `$HOME/.docker/bin` is chosen, authorization is not required, but then you must [manually add `$HOME/.docker/bin`](../settings/mac.md#advanced) to their PATH. 
@z

@x
You are also given the option to enable the installation of the `/var/run/docker.sock` symlink. Creating this symlink ensures various Docker clients relying on the default Docker socket path work without additional changes. 
@y
You are also given the option to enable the installation of the `/var/run/docker.sock` symlink. Creating this symlink ensures various Docker clients relying on the default Docker socket path work without additional changes. 
@z

@x
As the `/var/run` is mounted as a tmpfs, its content is deleted on restart, symlink to the Docker socket included. To ensure the Docker socket exists after restart, Docker Desktop sets up a `launchd` startup task that creates the symlink by running `ln -s -f /Users/<user>/.docker/run/docker.sock /var/run/docker.sock`. This ensures the you aren't prompted on each startup to create the symlink. If you don't enable this option at installation, the symlink and the startup task is not created and you may have to explicitly set the `DOCKER_HOST` environment variable to `/Users/<user>/.docker/run/docker.sock` in the clients it is using. The Docker CLI relies on the current context to retrieve the socket path, the current context is set to `desktop-linux` on Docker Desktop startup.
@y
As the `/var/run` is mounted as a tmpfs, its content is deleted on restart, symlink to the Docker socket included. To ensure the Docker socket exists after restart, Docker Desktop sets up a `launchd` startup task that creates the symlink by running `ln -s -f /Users/<user>/.docker/run/docker.sock /var/run/docker.sock`. This ensures the you aren't prompted on each startup to create the symlink. If you don't enable this option at installation, the symlink and the startup task is not created and you may have to explicitly set the `DOCKER_HOST` environment variable to `/Users/<user>/.docker/run/docker.sock` in the clients it is using. The Docker CLI relies on the current context to retrieve the socket path, the current context is set to `desktop-linux` on Docker Desktop startup.
@z

@x
{{< /tab >}}
{{< tab name="Version 4.17 and earlier" >}}
@y
{{< /tab >}}
{{< tab name="Version 4.17 and earlier" >}}
@z

@x
For versions prior to 4.18, installing symlinks in `/usr/local/bin` is a privileged configuration Docker Desktop performs on the first startup. Docker Desktop checks if symlinks exists and takes the following actions: 
- Creates the symlinks without the admin prompt if `/usr/local/bin` is writable by unprivileged users.
- Triggers an admin prompt for you to authorize the creation of symlinks in `/usr/local/bin`. If you authorizes this, symlinks to Docker binaries are created in `/usr/local/bin`. If you reject the prompt, are not willing to run configurations requiring elevated privileges, or don't have admin rights on your machine, Docker Desktop creates the symlinks in `~/.docker/bin` and edits your shell profile to ensure this location is in your PATH. This requires all open shells to be reloaded. 
The rejection is recorded for future runs to avoid prompting you again.
For any failure to ensure binaries are on your PATH, you may need to manually add to their PATH the `/Applications/Docker.app/Contents/Resources/bin` or use the full path to Docker binaries.
@y
For versions prior to 4.18, installing symlinks in `/usr/local/bin` is a privileged configuration Docker Desktop performs on the first startup. Docker Desktop checks if symlinks exists and takes the following actions: 
- Creates the symlinks without the admin prompt if `/usr/local/bin` is writable by unprivileged users.
- Triggers an admin prompt for you to authorize the creation of symlinks in `/usr/local/bin`. If you authorizes this, symlinks to Docker binaries are created in `/usr/local/bin`. If you reject the prompt, are not willing to run configurations requiring elevated privileges, or don't have admin rights on your machine, Docker Desktop creates the symlinks in `~/.docker/bin` and edits your shell profile to ensure this location is in your PATH. This requires all open shells to be reloaded. 
The rejection is recorded for future runs to avoid prompting you again.
For any failure to ensure binaries are on your PATH, you may need to manually add to their PATH the `/Applications/Docker.app/Contents/Resources/bin` or use the full path to Docker binaries.
@z

@x
A particular case is the installation of the `/var/run/docker.sock` symlink. Creating this symlink ensures various Docker clients relying on the default Docker socket path work without additional changes. As the `/var/run` is mounted as a tmpfs, its content is deleted on restart, symlink to Docker socket included.
To ensure the Docker socket exists after restart, Docker Desktop sets up a `launchd` startup task that creates a symlink by running `ln -s -f /Users/<user>/.docker/run/docker.sock /var/run/docker.sock`. This ensures that you are not prompted on each startup to create the symlink. If you reject the prompt, the symlink and the startup task are not created and you may have to explicitly set the `DOCKER_HOST` to `/Users/<user>/.docker/run/docker.sock` in the clients it is using. The Docker CLI relies on the current context to retrieve the socket path, the current context is set to `desktop-linux` on Docker Desktop startup.
@y
A particular case is the installation of the `/var/run/docker.sock` symlink. Creating this symlink ensures various Docker clients relying on the default Docker socket path work without additional changes. As the `/var/run` is mounted as a tmpfs, its content is deleted on restart, symlink to Docker socket included.
To ensure the Docker socket exists after restart, Docker Desktop sets up a `launchd` startup task that creates a symlink by running `ln -s -f /Users/<user>/.docker/run/docker.sock /var/run/docker.sock`. This ensures that you are not prompted on each startup to create the symlink. If you reject the prompt, the symlink and the startup task are not created and you may have to explicitly set the `DOCKER_HOST` to `/Users/<user>/.docker/run/docker.sock` in the clients it is using. The Docker CLI relies on the current context to retrieve the socket path, the current context is set to `desktop-linux` on Docker Desktop startup.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Binding privileged ports
@y
### Binding privileged ports
@z

@x
{{< tabs >}}
{{< tab name="Version 4.18 and later" >}}
@y
{{< tabs >}}
{{< tab name="Version 4.18 and later" >}}
@z

@x
With version 4.18 and later you can choose to enable privileged port mapping during installation, or from the **Advanced** page in **Settings** post-installation. Docker Desktop requires authorization to confirm this choice.
@y
With version 4.18 and later you can choose to enable privileged port mapping during installation, or from the **Advanced** page in **Settings** post-installation. Docker Desktop requires authorization to confirm this choice.
@z

@x
{{< /tab >}}
{{< tab name="Version 4.17 and earlier" >}}
@y
{{< /tab >}}
{{< tab name="Version 4.17 and earlier" >}}
@z

@x
For versions below 4.18 , if you run a container that requires binding privileged ports, Docker Desktop first attempts to bind it directly as an unprivileged process. If the OS prevents this and it fails, Docker Desktop checks if the `com.docker.vmnetd` privileged helper process is running to bind the privileged port through it. 
@y
For versions below 4.18 , if you run a container that requires binding privileged ports, Docker Desktop first attempts to bind it directly as an unprivileged process. If the OS prevents this and it fails, Docker Desktop checks if the `com.docker.vmnetd` privileged helper process is running to bind the privileged port through it. 
@z

@x
If the privileged helper process is not running, Docker Desktop prompts you for authorization to run it under [launchd](https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html).
This configures the privileged helper to run as in the versions of Docker Desktop prior to 4.15. However, the functionality provided by this privileged helper now only supports port binding and caching the Registry Access Management policy.
If you decline the launch of the privileged helper process, binding the privileged port cannot be done and the Docker CLI returns an error:
```console
$ docker run -p 127.0.0.1:80:80 docker/getting-started
@y
If the privileged helper process is not running, Docker Desktop prompts you for authorization to run it under [launchd](https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html).
This configures the privileged helper to run as in the versions of Docker Desktop prior to 4.15. However, the functionality provided by this privileged helper now only supports port binding and caching the Registry Access Management policy.
If you decline the launch of the privileged helper process, binding the privileged port cannot be done and the Docker CLI returns an error:
```console
$ docker run -p 127.0.0.1:80:80 docker/getting-started
@z

@x
docker: Error response from daemon: Ports are not available: exposing port
TCP 127.0.0.1:80 -> 0.0.0.0:0: failed to connect to /var/run/com.docker.vmnetd.sock:
is vmnetd running?: dial unix /var/run/com.docker.vmnetd.sock: connect: connection
refused.
ERRO[0003] error waiting for container: context canceled
```
@y
docker: Error response from daemon: Ports are not available: exposing port
TCP 127.0.0.1:80 -> 0.0.0.0:0: failed to connect to /var/run/com.docker.vmnetd.sock:
is vmnetd running?: dial unix /var/run/com.docker.vmnetd.sock: connect: connection
refused.
ERRO[0003] error waiting for container: context canceled
```
@z

@x
> **Note**
>
> The command may fail with the same error if you take too long to authorize the prompt to start the helper process, as it may timeout.
@y
> **Note**
>
> The command may fail with the same error if you take too long to authorize the prompt to start the helper process, as it may timeout.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Ensuring `localhost` and `kubernetes.docker.internal` are defined
@y
### Ensuring `localhost` and `kubernetes.docker.internal` are defined
@z

@x
{{< tabs >}}
{{< tab name="Version 4.18 and later" >}}
@y
{{< tabs >}}
{{< tab name="Version 4.18 and later" >}}
@z

@x
With versions 4.18 and later, it is your responsibility to ensure that localhost is resolved to `127.0.0.1` and if Kubernetes is used, that `kubernetes.docker.internal` is resolved to `127.0.0.1`.
@y
With versions 4.18 and later, it is your responsibility to ensure that localhost is resolved to `127.0.0.1` and if Kubernetes is used, that `kubernetes.docker.internal` is resolved to `127.0.0.1`.
@z

@x
{{< /tab >}}
{{< tab name="Version 4.17 and earlier" >}}
@y
{{< /tab >}}
{{< tab name="Version 4.17 and earlier" >}}
@z

@x
On first run, Docker Desktop checks if `localhost` is resolved to `127.0.0.1`. In case the resolution fails, it prompts you to allow adding the mapping to `/etc/hosts`. Similarly, when the Kubernetes cluster is installed, it checks that `kubernetes.docker.internal` is resolved to `127.0.0.1` and prompts you to do so. 
@y
On first run, Docker Desktop checks if `localhost` is resolved to `127.0.0.1`. In case the resolution fails, it prompts you to allow adding the mapping to `/etc/hosts`. Similarly, when the Kubernetes cluster is installed, it checks that `kubernetes.docker.internal` is resolved to `127.0.0.1` and prompts you to do so. 
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Installing from the command line
@y
## Installing from the command line
@z

@x
In version 4.11 and later of Docker Desktop for Mac, privileged configurations are applied during the installation with the `--user` flag on the [install command](../install/mac-install.md#install-from-the-command-line). In this case, you are not prompted to grant root privileges on the first run of Docker Desktop. Specifically, the `--user` flag:
- Uninstalls the previous `com.docker.vmnetd` if present
- Sets up symlinks
- Ensures that `localhost` is resolved to `127.0.0.1`
@y
In version 4.11 and later of Docker Desktop for Mac, privileged configurations are applied during the installation with the `--user` flag on the [install command](../install/mac-install.md#install-from-the-command-line). In this case, you are not prompted to grant root privileges on the first run of Docker Desktop. Specifically, the `--user` flag:
- Uninstalls the previous `com.docker.vmnetd` if present
- Sets up symlinks
- Ensures that `localhost` is resolved to `127.0.0.1`
@z

@x
The limitation of this approach is that Docker Desktop can only be run by one user-account per machine, namely the one specified in the `-–user` flag.
@y
The limitation of this approach is that Docker Desktop can only be run by one user-account per machine, namely the one specified in the `-–user` flag.
@z

@x
## Privileged helper
@y
## Privileged helper
@z

@x
In the limited situations when the privileged helper is needed, for example binding privileged ports or caching the Registry Access Management policy, the privileged helper is started by `launchd` and runs in the background unless it is disabled at runtime as previously described. The Docker Desktop backend communicates with the privileged helper over the UNIX domain socket `/var/run/com.docker.vmnetd.sock`. The functionalities it performs are: 
- Binding privileged ports that are less than 1024.
- Securely caching the Registry Access Management policy which is read-only for the developer.
- Uninstalling the privileged helper.
@y
In the limited situations when the privileged helper is needed, for example binding privileged ports or caching the Registry Access Management policy, the privileged helper is started by `launchd` and runs in the background unless it is disabled at runtime as previously described. The Docker Desktop backend communicates with the privileged helper over the UNIX domain socket `/var/run/com.docker.vmnetd.sock`. The functionalities it performs are: 
- Binding privileged ports that are less than 1024.
- Securely caching the Registry Access Management policy which is read-only for the developer.
- Uninstalling the privileged helper.
@z

@x
The removal of the privileged helper process is done in the same way as removing `launchd` processes.
@y
The removal of the privileged helper process is done in the same way as removing `launchd` processes.
@z

@x
```console
$ ps aux | grep vmnetd                                                
root             28739   0.0  0.0 34859128    228   ??  Ss    6:03PM   0:00.06 /Library/PrivilegedHelperTools/com.docker.vmnetd
user             32222   0.0  0.0 34122828    808 s000  R+   12:55PM   0:00.00 grep vmnetd
@y
```console
$ ps aux | grep vmnetd                                                
root             28739   0.0  0.0 34859128    228   ??  Ss    6:03PM   0:00.06 /Library/PrivilegedHelperTools/com.docker.vmnetd
user             32222   0.0  0.0 34122828    808 s000  R+   12:55PM   0:00.00 grep vmnetd
@z

@x
$ sudo launchctl unload -w /Library/LaunchDaemons/com.docker.vmnetd.plist
Password:
@y
$ sudo launchctl unload -w /Library/LaunchDaemons/com.docker.vmnetd.plist
Password:
@z

@x
$ ps aux | grep vmnetd                                                   
user             32242   0.0  0.0 34122828    716 s000  R+   12:55PM   0:00.00 grep vmnetd
@y
$ ps aux | grep vmnetd                                                   
user             32242   0.0  0.0 34122828    716 s000  R+   12:55PM   0:00.00 grep vmnetd
@z

@x
$ rm /Library/LaunchDaemons/com.docker.vmnetd.plist 
@y
$ rm /Library/LaunchDaemons/com.docker.vmnetd.plist 
@z

@x
$ rm /Library/PrivilegedHelperTools/com.docker.vmnetd 
```
@y
$ rm /Library/PrivilegedHelperTools/com.docker.vmnetd 
```
@z

@x
## Containers running as root within the Linux VM
@y
## Containers running as root within the Linux VM
@z

@x
The Docker daemon and containers run in a lightweight Linux VM managed by Docker. This means that although containers run by default as `root`, this doesn't grant `root` access to the Mac host machine. The Linux VM serves as a security boundary and limits what resources can be accessed from the host. Any directories from the host bind mounted into Docker containers still retain their original permissions.
@y
The Docker daemon and containers run in a lightweight Linux VM managed by Docker. This means that although containers run by default as `root`, this doesn't grant `root` access to the Mac host machine. The Linux VM serves as a security boundary and limits what resources can be accessed from the host. Any directories from the host bind mounted into Docker containers still retain their original permissions.
@z
