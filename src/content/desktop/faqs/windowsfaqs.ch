%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Frequently asked questions
keywords: desktop, windows, faqs
title: FAQs for Windows
---
@y
---
description: Frequently asked questions
keywords: desktop, windows, faqs
title: FAQs for Windows
---
@z

@x
### Can I use VirtualBox alongside Docker Desktop?
@y
### Can I use VirtualBox alongside Docker Desktop?
@z

@x
Yes, you can run VirtualBox along with Docker Desktop if you have enabled the [Windows Hypervisor Platform](https://docs.microsoft.com/en-us/virtualization/api/) feature on your machine.
@y
Yes, you can run VirtualBox along with Docker Desktop if you have enabled the [Windows Hypervisor Platform](https://docs.microsoft.com/en-us/virtualization/api/) feature on your machine.
@z

@x
### Why is Windows 10 or Windows 11 required?
@y
### Why is Windows 10 or Windows 11 required?
@z

@x
Docker Desktop uses the Windows Hyper-V features. While older Windows versions have Hyper-V, their Hyper-V implementations lack features critical for Docker Desktop to work.
@y
Docker Desktop uses the Windows Hyper-V features. While older Windows versions have Hyper-V, their Hyper-V implementations lack features critical for Docker Desktop to work.
@z

@x
### Can I install Docker Desktop on Windows 10 Home?
@y
### Can I install Docker Desktop on Windows 10 Home?
@z

@x
If you are running Windows 10 Home (starting with build 19045), you can install [Docker Desktop for Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows/) with the [WSL 2 backend](../wsl/index.md).
@y
If you are running Windows 10 Home (starting with build 19045), you can install [Docker Desktop for Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows/) with the [WSL 2 backend](../wsl/index.md).
@z

@x
### Can I run Docker Desktop on Windows Server?
@y
### Can I run Docker Desktop on Windows Server?
@z

@x
No, running Docker Desktop on Windows Server is not supported.
@y
No, running Docker Desktop on Windows Server is not supported.
@z

@x
### Why do I see the `Docker Desktop Access Denied` error message when I try to start Docker Desktop?
@y
### Why do I see the `Docker Desktop Access Denied` error message when I try to start Docker Desktop?
@z

@x
Docker Desktop displays the **Docker Desktop - Access Denied** error if a Windows user is not part of the **docker-users** group.
@y
Docker Desktop displays the **Docker Desktop - Access Denied** error if a Windows user is not part of the **docker-users** group.
@z

@x
If your admin account is different to your user account, add the **docker-users** group. Run **Computer Management** as an administrator and navigate to **Local Users* and Groups** > **Groups** > **docker-users**.
@y
If your admin account is different to your user account, add the **docker-users** group. Run **Computer Management** as an administrator and navigate to **Local Users* and Groups** > **Groups** > **docker-users**.
@z

@x
Right-click to add the user to the group. Sign out and sign back in for the changes to take effect.
@y
Right-click to add the user to the group. Sign out and sign back in for the changes to take effect.
@z

@x
### Why does Docker Desktop fail to start when anti-virus software is installed?
@y
### Why does Docker Desktop fail to start when anti-virus software is installed?
@z

@x
Some anti-virus software may be incompatible with Hyper-V and Windows 10 builds which impact Docker
Desktop. For more information, see [Docker Desktop fails to start when anti-virus software is installed](../troubleshoot/workarounds.md#docker-desktop-fails-to-start-when-anti-virus-software-is-installed).
@y
Some anti-virus software may be incompatible with Hyper-V and Windows 10 builds which impact Docker
Desktop. For more information, see [Docker Desktop fails to start when anti-virus software is installed](../troubleshoot/workarounds.md#docker-desktop-fails-to-start-when-anti-virus-software-is-installed).
@z

@x
### Can I change permissions on shared volumes for container-specific deployment requirements?
@y
### Can I change permissions on shared volumes for container-specific deployment requirements?
@z

@x
Docker Desktop does not enable you to control (`chmod`)
the Unix-style permissions on [shared volumes](../settings/windows.md#file-sharing) for
deployed containers, but rather sets permissions to a default value of
[0777](https://chmodcommand.com/chmod-0777/)
(`read`, `write`, `execute` permissions for `user` and for
`group`) which is not configurable.
@y
Docker Desktop does not enable you to control (`chmod`)
the Unix-style permissions on [shared volumes](../settings/windows.md#file-sharing) for
deployed containers, but rather sets permissions to a default value of
[0777](https://chmodcommand.com/chmod-0777/)
(`read`, `write`, `execute` permissions for `user` and for
`group`) which is not configurable.
@z

@x
For workarounds and to learn more, see
[Permissions errors on data directories for shared volumes](../troubleshoot/topics.md#permissions-errors-on-data-directories-for-shared-volumes).
@y
For workarounds and to learn more, see
[Permissions errors on data directories for shared volumes](../troubleshoot/topics.md#permissions-errors-on-data-directories-for-shared-volumes).
@z

@x
### How do symlinks work on Windows?
@y
### How do symlinks work on Windows?
@z

@x
Docker Desktop supports two types of symlinks: Windows native symlinks and symlinks created inside a container.
@y
Docker Desktop supports two types of symlinks: Windows native symlinks and symlinks created inside a container.
@z

@x
The Windows native symlinks are visible within the containers as symlinks, whereas symlinks created inside a container are represented as [mfsymlinks](https://wiki.samba.org/index.php/UNIX_Extensions#Minshall.2BFrench_symlinks). These are regular Windows files with a special metadata. Therefore the symlinks created inside a container appear as symlinks inside the container, but not on the host.
@y
The Windows native symlinks are visible within the containers as symlinks, whereas symlinks created inside a container are represented as [mfsymlinks](https://wiki.samba.org/index.php/UNIX_Extensions#Minshall.2BFrench_symlinks). These are regular Windows files with a special metadata. Therefore the symlinks created inside a container appear as symlinks inside the container, but not on the host.
@z

@x
### File sharing with Kubernetes and WSL 2
@y
### File sharing with Kubernetes and WSL 2
@z

@x
Docker Desktop mounts the Windows host filesystem under `/run/desktop` inside the container running Kubernetes.
See the [Stack Overflow post](https://stackoverflow.com/questions/67746843/clear-persistent-volume-from-a-kubernetes-cluster-running-on-docker-desktop/69273405#69273) for an example of how to configure a Kubernetes Persistent Volume to represent directories on the host.
@y
Docker Desktop mounts the Windows host filesystem under `/run/desktop` inside the container running Kubernetes.
See the [Stack Overflow post](https://stackoverflow.com/questions/67746843/clear-persistent-volume-from-a-kubernetes-cluster-running-on-docker-desktop/69273405#69273) for an example of how to configure a Kubernetes Persistent Volume to represent directories on the host.
@z

@x
### How do I add custom CA certificates?
@y
### How do I add custom CA certificates?
@z

@x
You can add trusted **Certificate Authorities (CAs)** to your Docker daemon to verify registry server certificates, and **client certificates**, to authenticate to registries.
@y
You can add trusted **Certificate Authorities (CAs)** to your Docker daemon to verify registry server certificates, and **client certificates**, to authenticate to registries.
@z

@x
Docker Desktop supports all trusted Certificate Authorities (CAs) (root or
intermediate). Docker recognizes certs stored under Trust Root
Certification Authorities or Intermediate Certification Authorities.
@y
Docker Desktop supports all trusted Certificate Authorities (CAs) (root or
intermediate). Docker recognizes certs stored under Trust Root
Certification Authorities or Intermediate Certification Authorities.
@z

@x
Docker Desktop creates a certificate bundle of all user-trusted CAs based on
the Windows certificate store, and appends it to Moby trusted certificates. Therefore, if an enterprise SSL certificate is trusted by the user on the host, it is trusted by Docker Desktop.
@y
Docker Desktop creates a certificate bundle of all user-trusted CAs based on
the Windows certificate store, and appends it to Moby trusted certificates. Therefore, if an enterprise SSL certificate is trusted by the user on the host, it is trusted by Docker Desktop.
@z

@x
To learn more about how to install a CA root certificate for the registry, see
[Verify repository client with certificates](../../engine/security/certificates.md)
in the Docker Engine topics.
@y
To learn more about how to install a CA root certificate for the registry, see
[Verify repository client with certificates](../../engine/security/certificates.md)
in the Docker Engine topics.
@z

@x
### How do I add client certificates?
@y
### How do I add client certificates?
@z

@x
You can add your client certificates
in `~/.docker/certs.d/<MyRegistry><Port>/client.cert` and
`~/.docker/certs.d/<MyRegistry><Port>/client.key`. You do not need to push your certificates with `git` commands.
@y
You can add your client certificates
in `~/.docker/certs.d/<MyRegistry><Port>/client.cert` and
`~/.docker/certs.d/<MyRegistry><Port>/client.key`. You do not need to push your certificates with `git` commands.
@z

@x
When the Docker Desktop application starts, it copies the
`~/.docker/certs.d` folder on your Windows system to the `/etc/docker/certs.d`
directory on Moby (the Docker Desktop virtual machine running on Hyper-V).
@y
When the Docker Desktop application starts, it copies the
`~/.docker/certs.d` folder on your Windows system to the `/etc/docker/certs.d`
directory on Moby (the Docker Desktop virtual machine running on Hyper-V).
@z

@x
You need to restart Docker Desktop after making any changes to the keychain
or to the `~/.docker/certs.d` directory in order for the changes to take effect.
@y
You need to restart Docker Desktop after making any changes to the keychain
or to the `~/.docker/certs.d` directory in order for the changes to take effect.
@z

@x
The registry cannot be listed as an _insecure registry_ (see
[Docker Daemon](../settings/windows.md#docker-engine)). Docker Desktop ignores
certificates listed under insecure registries, and does not send client
certificates. Commands like `docker run` that attempt to pull from the registry
produce error messages on the command line, as well as on the registry.
@y
The registry cannot be listed as an _insecure registry_ (see
[Docker Daemon](../settings/windows.md#docker-engine)). Docker Desktop ignores
certificates listed under insecure registries, and does not send client
certificates. Commands like `docker run` that attempt to pull from the registry
produce error messages on the command line, as well as on the registry.
@z

@x
To learn more about how to set the client TLS certificate for verification, see
[Verify repository client with certificates](../../engine/security/certificates.md)
in the Docker Engine topics.
@y
To learn more about how to set the client TLS certificate for verification, see
[Verify repository client with certificates](../../engine/security/certificates.md)
in the Docker Engine topics.
@z

@x
### How do I switch between Windows and Linux containers
@y
### How do I switch between Windows and Linux containers
@z

@x
From the Docker Desktop menu, you can toggle which daemon (Linux or Windows)
the Docker CLI talks to. Select **Switch to Windows containers** to use Windows
containers, or select **Switch to Linux containers** to use Linux containers
(the default).
@y
From the Docker Desktop menu, you can toggle which daemon (Linux or Windows)
the Docker CLI talks to. Select **Switch to Windows containers** to use Windows
containers, or select **Switch to Linux containers** to use Linux containers
(the default).
@z

@x
For more information on Windows containers, refer to the following documentation:
@y
For more information on Windows containers, refer to the following documentation:
@z

@x
- Microsoft documentation on [Windows containers](https://docs.microsoft.com/en-us/virtualization/windowscontainers/about/index).
@y
- Microsoft documentation on [Windows containers](https://docs.microsoft.com/en-us/virtualization/windowscontainers/about/index).
@z

@x
- [Build and Run Your First Windows Server Container (Blog Post)](https://blog.docker.com/2016/09/build-your-first-docker-windows-server-container/)
  gives a quick tour of how to build and run native Docker Windows containers on Windows 10 and Windows Server 2016 evaluation releases.
@y
- [Build and Run Your First Windows Server Container (Blog Post)](https://blog.docker.com/2016/09/build-your-first-docker-windows-server-container/)
  gives a quick tour of how to build and run native Docker Windows containers on Windows 10 and Windows Server 2016 evaluation releases.
@z

@x
- [Getting Started with Windows Containers (Lab)](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md)
  shows you how to use the [MusicStore](https://github.com/aspnet/MusicStore/)
  application with Windows containers. The MusicStore is a standard .NET application and,
  [forked here to use containers](https://github.com/friism/MusicStore), is a good example of a multi-container application.
@y
- [Getting Started with Windows Containers (Lab)](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md)
  shows you how to use the [MusicStore](https://github.com/aspnet/MusicStore/)
  application with Windows containers. The MusicStore is a standard .NET application and,
  [forked here to use containers](https://github.com/friism/MusicStore), is a good example of a multi-container application.
@z

@x
- To understand how to connect to Windows containers from the local host, see
  [I want to connect to a container from Windows](../networking.md#i-want-to-connect-to-a-container-from-the-host)
@y
- To understand how to connect to Windows containers from the local host, see
  [I want to connect to a container from Windows](../networking.md#i-want-to-connect-to-a-container-from-the-host)
@z

@x
> Settings dialog changes with Windows containers
>
> When you switch to Windows containers, the Settings dialog only shows those tabs that are active and apply to your Windows containers:
>
>  * [General](../settings/windows.md#general)
>  * [Proxies](../settings/windows.md#proxies)
>  * [Daemon](../settings/windows.md#docker-engine)
@y
> Settings dialog changes with Windows containers
>
> When you switch to Windows containers, the Settings dialog only shows those tabs that are active and apply to your Windows containers:
>
>  * [General](../settings/windows.md#general)
>  * [Proxies](../settings/windows.md#proxies)
>  * [Daemon](../settings/windows.md#docker-engine)
@z

@x
If you set proxies or daemon configuration in Windows containers mode, these
apply only on Windows containers. If you switch back to Linux containers,
proxies and daemon configurations return to what you had set for Linux
containers. Your Windows container settings are retained and become available
again when you switch back.
@y
If you set proxies or daemon configuration in Windows containers mode, these
apply only on Windows containers. If you switch back to Linux containers,
proxies and daemon configurations return to what you had set for Linux
containers. Your Windows container settings are retained and become available
again when you switch back.
@z
