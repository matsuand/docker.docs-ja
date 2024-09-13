%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Find the answers to FAQs related to networking and virtualization
keywords: Docker, Docker Hub, Docker Desktop security FAQs, security, platform, networks, vms
title: Network and VM FAQs
linkTitle: Network and VM
@y
description: Find the answers to FAQs related to networking and virtualization
keywords: Docker, Docker Hub, Docker Desktop security FAQs, security, platform, networks, vms
title: Network and VM FAQs
linkTitle: Network and VM
@z

@x
### How can I limit the type of internet access allowed by the container when it runs, to prevent it from being able to exfiltrate data or download malicious code?
@y
### How can I limit the type of internet access allowed by the container when it runs, to prevent it from being able to exfiltrate data or download malicious code?
@z

@x
There is no built-in mechanism for that but it can be addressed by process-level firewall on the host. Hook into the `com.docker.vpnkit` user-space process and apply rules where it can connect to (DNS URL white list; packet/payload filter) and which ports/protocols it is allowed to use.
@y
There is no built-in mechanism for that but it can be addressed by process-level firewall on the host. Hook into the `com.docker.vpnkit` user-space process and apply rules where it can connect to (DNS URL white list; packet/payload filter) and which ports/protocols it is allowed to use.
@z

@x
### Can I prevent users binding ports on 0.0.0.0?
@y
### Can I prevent users binding ports on 0.0.0.0?
@z

@x
There is no direct way to enforce that through Docker Desktop but it would inherit any firewall rules enforced on the host.
@y
There is no direct way to enforce that through Docker Desktop but it would inherit any firewall rules enforced on the host.
@z

@x
### What options exist to lock containerized network settings to a system? If not supported, are there any consequences to manipulating the settings?
@y
### What options exist to lock containerized network settings to a system? If not supported, are there any consequences to manipulating the settings?
@z

@x
The Docker network settings are entirely local within the VM and have no effect on the system.
@y
The Docker network settings are entirely local within the VM and have no effect on the system.
@z

@x
### Can I apply rules on container network traffic via a local firewall or VPN client?
@y
### Can I apply rules on container network traffic via a local firewall or VPN client?
@z

@x
For network connectivity, Docker Desktop uses a user-space process (`com.docker.vpnkit`), which inherits constraints like firewall rules, VPN, HTTP proxy properties etc, from the user that launched it.
@y
For network connectivity, Docker Desktop uses a user-space process (`com.docker.vpnkit`), which inherits constraints like firewall rules, VPN, HTTP proxy properties etc, from the user that launched it.
@z

@x
### Does running Docker Desktop for Windows with Hyper-V backend allow users to create arbitrary VMs?
@y
### Does running Docker Desktop for Windows with Hyper-V backend allow users to create arbitrary VMs?
@z

@x
No. The `DockerDesktopVM` name is hard coded in the service code, so you cannot use Docker Desktop to create or manipulate any other VM.
@y
No. The `DockerDesktopVM` name is hard coded in the service code, so you cannot use Docker Desktop to create or manipulate any other VM.
@z

@x
### Can I prevent our users creating other VMs when using Docker Desktop on Mac?
@y
### Can I prevent our users creating other VMs when using Docker Desktop on Mac?
@z

@x
On Mac it is an unprivileged operation to start a VM, so that is not enforced by Docker Desktop.
@y
On Mac it is an unprivileged operation to start a VM, so that is not enforced by Docker Desktop.
@z

@x
### How does Docker Desktop achieve network level isolation when Hyper-V and/or WSL2 is used?
@y
### How does Docker Desktop achieve network level isolation when Hyper-V and/or WSL2 is used?
@z

@x
The VM processes are the same for both WSL 2 (running inside the `docker-desktop` distro) and Hyper-V (running inside the `DockerDesktopVM`). Host/VM communication uses `AF_VSOCK` hypervisor sockets (shared memory). It does not use Hyper-V network switches or network interfaces. All host networking is performed using normal TCP/IP sockets from the `com.docker.vpnkit.exe` and `com.docker.backend.exe` processes. For more information see [How Docker Desktop networking works under the hood](https://www.docker.com/blog/how-docker-desktop-networking-works-under-the-hood/).
@y
The VM processes are the same for both WSL 2 (running inside the `docker-desktop` distro) and Hyper-V (running inside the `DockerDesktopVM`). Host/VM communication uses `AF_VSOCK` hypervisor sockets (shared memory). It does not use Hyper-V network switches or network interfaces. All host networking is performed using normal TCP/IP sockets from the `com.docker.vpnkit.exe` and `com.docker.backend.exe` processes. For more information see [How Docker Desktop networking works under the hood](https://www.docker.com/blog/how-docker-desktop-networking-works-under-the-hood/).
@z
