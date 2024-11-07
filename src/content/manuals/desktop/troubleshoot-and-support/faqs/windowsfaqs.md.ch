%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Frequently asked questions for Docker Desktop for Windows
keywords: desktop, windows, faqs
title: FAQs for Docker Desktop for Windows
@y
description: Frequently asked questions for Docker Desktop for Windows
keywords: desktop, windows, faqs
title: FAQs for Docker Desktop for Windows
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
### Can I change permissions on shared volumes for container-specific deployment requirements?
@y
### Can I change permissions on shared volumes for container-specific deployment requirements?
@z

@x
Docker Desktop does not enable you to control (`chmod`)
the Unix-style permissions on [shared volumes](/manuals/desktop/settings-and-maintenance/settings.md#file-sharing) for
deployed containers, but rather sets permissions to a default value of
[0777](https://chmodcommand.com/chmod-0777/)
(`read`, `write`, `execute` permissions for `user` and for
`group`) which is not configurable.
@y
Docker Desktop does not enable you to control (`chmod`)
the Unix-style permissions on [shared volumes](manuals/desktop/settings-and-maintenance/settings.md#file-sharing) for
deployed containers, but rather sets permissions to a default value of
[0777](https://chmodcommand.com/chmod-0777/)
(`read`, `write`, `execute` permissions for `user` and for
`group`) which is not configurable.
@z

@x
For workarounds and to learn more, see
[Permissions errors on data directories for shared volumes](/manuals/desktop/troubleshoot-and-support/troubleshoot/topics.md#permissions-errors-on-data-directories-for-shared-volumes).
@y
For workarounds and to learn more, see
[Permissions errors on data directories for shared volumes](manuals/desktop/troubleshoot-and-support/troubleshoot/topics.md#permissions-errors-on-data-directories-for-shared-volumes).
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
You can add trusted Certificate Authorities (CAs) to your Docker daemon to verify registry server certificates, and client certificates, to authenticate to registries.
@y
You can add trusted Certificate Authorities (CAs) to your Docker daemon to verify registry server certificates, and client certificates, to authenticate to registries.
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
[Verify repository client with certificates](/manuals/engine/security/certificates.md)
in the Docker Engine topics.
@y
To learn more about how to install a CA root certificate for the registry, see
[Verify repository client with certificates](manuals/engine/security/certificates.md)
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
The registry cannot be listed as an insecure registry (see
[Docker Daemon](/manuals/desktop/settings-and-maintenance/settings.md#docker-engine)). Docker Desktop ignores
certificates listed under insecure registries, and does not send client
certificates. Commands like `docker run` that attempt to pull from the registry
produce error messages on the command line, as well as on the registry.
@y
The registry cannot be listed as an insecure registry (see
[Docker Daemon](manuals/desktop/settings-and-maintenance/settings.md#docker-engine)). Docker Desktop ignores
certificates listed under insecure registries, and does not send client
certificates. Commands like `docker run` that attempt to pull from the registry
produce error messages on the command line, as well as on the registry.
@z

@x
To learn more about how to set the client TLS certificate for verification, see
[Verify repository client with certificates](/manuals/engine/security/certificates.md)
in the Docker Engine topics.
@y
To learn more about how to set the client TLS certificate for verification, see
[Verify repository client with certificates](manuals/engine/security/certificates.md)
in the Docker Engine topics.
@z
