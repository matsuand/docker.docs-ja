%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Understand how Docker Desktop handles networking, firewalls, file access, proxies, and endpoint visibility.
keywords: docker desktop, networking, architecture, firewall, proxies, crowdstrike, vpn
title: Networking on Docker Desktop
linkTitle: Networking
@y
description: Understand how Docker Desktop handles networking, firewalls, file access, proxies, and endpoint visibility.
keywords: docker desktop, networking, architecture, firewall, proxies, crowdstrike, vpn
title: Networking on Docker Desktop
linkTitle: Networking
@z

@x
This page explains how Docker Desktop routes network traffic and file I/O between containers, the VM, and the host, and how this behavior is visible to firewalls and endpoint protection tools.
@y
This page explains how Docker Desktop routes network traffic and file I/O between containers, the VM, and the host, and how this behavior is visible to firewalls and endpoint protection tools.
@z

@x
## Overview
@y
## Overview
@z

@x
Docker Desktop runs the Docker Engine inside a lightweight Linux virtual machine (VM). Depending on your system configuration and operating system, Docker Desktop routes network and file operations between the Docker VM and the host using different backend components.
@y
Docker Desktop runs the Docker Engine inside a lightweight Linux virtual machine (VM). Depending on your system configuration and operating system, Docker Desktop routes network and file operations between the Docker VM and the host using different backend components.
@z

@x
### Backend components and responsibilities
@y
### Backend components and responsibilities
@z

@x
The backend acts as:
@y
The backend acts as:
@z

@x
- Network proxy: Translates traffic between the host and Linux VM.
   - On Windows and Mac, this is handled by the `com.docker.backend` process.
   - On Linux, the `qemu` process performs this function.
- File server: Handles file access from containers to the host filesystem.
   - When using gRPC FUSE, the backend performs the file sharing.
   - When using `virtiofs`, `osxfs`, or `krun`, file access is handled by those respective daemons rather than the backend process.
- Control plane: Manages Docker API calls, port forwarding, and proxy configuration.
@y
- Network proxy: Translates traffic between the host and Linux VM.
   - On Windows and Mac, this is handled by the `com.docker.backend` process.
   - On Linux, the `qemu` process performs this function.
- File server: Handles file access from containers to the host filesystem.
   - When using gRPC FUSE, the backend performs the file sharing.
   - When using `virtiofs`, `osxfs`, or `krun`, file access is handled by those respective daemons rather than the backend process.
- Control plane: Manages Docker API calls, port forwarding, and proxy configuration.
@z

@x
The following table summarizes typical setups in more detail:
@y
The following table summarizes typical setups in more detail:
@z

@x
| Platform        | Setup                                | Networking handled by    | File sharing handled by                | Notes                                                     |
| --------------- | ------------------------------------ | ------------------------ | -------------------------------------- | --------------------------------------------------------- |
| Windows         | Hyper-V                              | `com.docker.backend.exe` | `com.docker.backend.exe`               | Simplest setup with full visibility to EDR/firewall tools |
| Windows (WSL 2) | WSL 2                                | `com.docker.backend.exe` | WSL 2 kernel (no visibility from host) | Recommended only when WSL 2 integration is needed         |
| Mac             | Virtualization framework + gRPC FUSE | `com.docker.backend`     | `com.docker.backend`                   | Recommended for performance and visibility                |
| Mac             | Virtualization framework + `virtiofs`| `com.docker.backend`     | Apple's Virtualization framework       | Higher performance but no file access visibility from host|
| Mac             | Virtualization framework + `osxfs`   | `com.docker.backend`     | `osxfs`                                | Legacy setup, not recommended                             |
| Mac             | DockerVMM + `virtiofs`               | `com.docker.backend`     | `krun`                                 | Currently in Beta                                         |
| Linux           | Native Linux VM                      | `qemu`                   | `virtiofsd`                            | No `com.docker.backend` process on Linux                  |
@y
| Platform        | Setup                                | Networking handled by    | File sharing handled by                | Notes                                                     |
| --------------- | ------------------------------------ | ------------------------ | -------------------------------------- | --------------------------------------------------------- |
| Windows         | Hyper-V                              | `com.docker.backend.exe` | `com.docker.backend.exe`               | Simplest setup with full visibility to EDR/firewall tools |
| Windows (WSL 2) | WSL 2                                | `com.docker.backend.exe` | WSL 2 kernel (no visibility from host) | Recommended only when WSL 2 integration is needed         |
| Mac             | Virtualization framework + gRPC FUSE | `com.docker.backend`     | `com.docker.backend`                   | Recommended for performance and visibility                |
| Mac             | Virtualization framework + `virtiofs`| `com.docker.backend`     | Apple's Virtualization framework       | Higher performance but no file access visibility from host|
| Mac             | Virtualization framework + `osxfs`   | `com.docker.backend`     | `osxfs`                                | Legacy setup, not recommended                             |
| Mac             | DockerVMM + `virtiofs`               | `com.docker.backend`     | `krun`                                 | Currently in Beta                                         |
| Linux           | Native Linux VM                      | `qemu`                   | `virtiofsd`                            | No `com.docker.backend` process on Linux                  |
@z

@x
## How containers connect to the internet
@y
## How containers connect to the internet
@z

@x
Each Linux container in Docker Desktop runs inside a small virtual network managed by Docker and every container is attached to a Docker-managed network and receives its own internal IP address. You can view and these networks with `docker network ls`, `docker network create`, and `docker network inspect`. They are managed by the [`daemon.json`](/manuals/engine/daemon/_index.md).
@y
Each Linux container in Docker Desktop runs inside a small virtual network managed by Docker and every container is attached to a Docker-managed network and receives its own internal IP address. You can view and these networks with `docker network ls`, `docker network create`, and `docker network inspect`. They are managed by the [`daemon.json`](manuals/engine/daemon/_index.md).
@z

@x
When a container initiates a network request, for example with `apt-get update` or `docker pull`:
@y
When a container initiates a network request, for example with `apt-get update` or `docker pull`:
@z

@x
- The container’s `eth0` interface connects to a virtual bridge (`docker0`) inside the VM.
- Outbound traffic from the container is sent through Network Address Translation (NAT) using a virtual adapter (typically with an internal IP such as `192.168.65.3`). You can view or change this with the [Docker Desktop settings](/manuals/desktop/settings-and-maintenance/settings.md#network).
- The traffic is transferred to the host system over a shared-memory channel rather than through a traditional virtual network interface. This approach ensures reliable communication and avoids conflicts with host-level network adapters or firewall configurations.
- On the host, Docker Desktop’s backend process receives the traffic and creates standard TCP/IP connections using the same networking APIs as other applications.
@y
- The container’s `eth0` interface connects to a virtual bridge (`docker0`) inside the VM.
- Outbound traffic from the container is sent through Network Address Translation (NAT) using a virtual adapter (typically with an internal IP such as `192.168.65.3`). You can view or change this with the [Docker Desktop settings](manuals/desktop/settings-and-maintenance/settings.md#network).
- The traffic is transferred to the host system over a shared-memory channel rather than through a traditional virtual network interface. This approach ensures reliable communication and avoids conflicts with host-level network adapters or firewall configurations.
- On the host, Docker Desktop’s backend process receives the traffic and creates standard TCP/IP connections using the same networking APIs as other applications.
@z

@x
All outbound container network traffic originates from the `com.docker.backend` process. Firewalls, VPNs, and security tools, like Crowdstrike, see traffic coming from this process — not from a VM or unknown source so firewall and endpoint security software can apply rules directly to `com.docker.backend`.
@y
All outbound container network traffic originates from the `com.docker.backend` process. Firewalls, VPNs, and security tools, like Crowdstrike, see traffic coming from this process — not from a VM or unknown source so firewall and endpoint security software can apply rules directly to `com.docker.backend`.
@z

@x
## How exposed ports work
@y
## How exposed ports work
@z

@x
When you publish a container port using the `-p` or `--publish` flag, Docker Desktop makes that container port accessible from your host system or local network.
@y
When you publish a container port using the `-p` or `--publish` flag, Docker Desktop makes that container port accessible from your host system or local network.
@z

@x
For example, with `docker run -p 80:80 nginx`:
@y
For example, with `docker run -p 80:80 nginx`:
@z

@x
- Docker Desktop's backend process listens on the specified host port, in this case, port `80`.
- When an application such as a web browser connects to that port, Docker Desktop forwards the connection into the Linux VM where the container is running over a shared-memory channel.
- Inside the VM, the connection is routed to the container’s internal IP address and port, for example `172.17.0.2:80`.
- The container responds through the same path, so you can access it from your host just like any other local service.
@y
- Docker Desktop's backend process listens on the specified host port, in this case, port `80`.
- When an application such as a web browser connects to that port, Docker Desktop forwards the connection into the Linux VM where the container is running over a shared-memory channel.
- Inside the VM, the connection is routed to the container’s internal IP address and port, for example `172.17.0.2:80`.
- The container responds through the same path, so you can access it from your host just like any other local service.
@z

@x
By default, `docker run -p` listens on all network interfaces (`0.0.0.0`), but you can restrict it to a specific address, such as `127.0.0.1` (localhost) or a particular network adapter.
@y
By default, `docker run -p` listens on all network interfaces (`0.0.0.0`), but you can restrict it to a specific address, such as `127.0.0.1` (localhost) or a particular network adapter.
@z

@x
Host firewalls can permit or deny inbound connections by filtering on `com.docker.backend`.
@y
Host firewalls can permit or deny inbound connections by filtering on `com.docker.backend`.
@z

@x
## Using Docker Desktop with a proxy
@y
## Using Docker Desktop with a proxy
@z

@x
Docker Desktop can use your system’s default proxy settings or custom settings that you configure with [Docker Desktop's proxy setting](/manuals/desktop/settings-and-maintenance/settings.md#proxies). All proxy traffic passes through `com.docker.backend.exe`.
@y
Docker Desktop can use your system’s default proxy settings or custom settings that you configure with [Docker Desktop's proxy setting](manuals/desktop/settings-and-maintenance/settings.md#proxies). All proxy traffic passes through `com.docker.backend.exe`.
@z

@x
When a proxy is enabled:
@y
When a proxy is enabled:
@z

@x
- The backend process forwards the network requests, for example `docker pull`, through an internal proxy at `http.docker.internal:3128`. 
- The internal proxy then connects either directly to the internet or through your upstream proxy, depending on your configuration and adding authentication if necessary. 
- Docker Desktop then downloads the requested images or data through the proxy as usual.
@y
- The backend process forwards the network requests, for example `docker pull`, through an internal proxy at `http.docker.internal:3128`. 
- The internal proxy then connects either directly to the internet or through your upstream proxy, depending on your configuration and adding authentication if necessary. 
- Docker Desktop then downloads the requested images or data through the proxy as usual.
@z

@x
Note that: 
- The proxy honors system or manual proxy configuration.
- On Windows, Basic, NTLM, and Kerberos authentication is supported.
- For Mac, NTLM/Kerberos is not supported natively. Run a local proxy on `localhost` as a workaround.
- CLI plugins and other tools that use the Docker API directly must be configured separately with the `HTTP_PROXY`, `HTTPS_PROXY`, and `NO_PROXY` environment variables.
@y
Note that: 
- The proxy honors system or manual proxy configuration.
- On Windows, Basic, NTLM, and Kerberos authentication is supported.
- For Mac, NTLM/Kerberos is not supported natively. Run a local proxy on `localhost` as a workaround.
- CLI plugins and other tools that use the Docker API directly must be configured separately with the `HTTP_PROXY`, `HTTPS_PROXY`, and `NO_PROXY` environment variables.
@z

@x
## Firewalls and endpoint visibility 
@y
## Firewalls and endpoint visibility 
@z

@x
To restrict VM or container networking apply rules to `com.docker.backend.exe` (Windows) `com.docker.backend` (Mac) or `qemu` (Linux) as all VM networking is funneled through these processes. 
@y
To restrict VM or container networking apply rules to `com.docker.backend.exe` (Windows) `com.docker.backend` (Mac) or `qemu` (Linux) as all VM networking is funneled through these processes. 
@z

@x
Use Windows Defender Firewall or enterprise endpoint firewalls for control. This enables traffic inspection and restriction at the host level without modifying the Docker Engine. 
@y
Use Windows Defender Firewall or enterprise endpoint firewalls for control. This enables traffic inspection and restriction at the host level without modifying the Docker Engine. 
@z

@x
Crowdstrike and similar tools can observe all traffic and file access that passes through the backend process. 
@y
Crowdstrike and similar tools can observe all traffic and file access that passes through the backend process. 
@z

@x
| Action | Visible to host EDR? | Reason | 
|---------|----------------------|---------| 
| Container reads host files | Yes | Access handled by `com.docker.backend` | 
| Container writes host files | Yes | Same process performs the write | 
| Container accesses its own filesystem layers | No | Exists only inside the VM |
@y
| Action | Visible to host EDR? | Reason | 
|---------|----------------------|---------| 
| Container reads host files | Yes | Access handled by `com.docker.backend` | 
| Container writes host files | Yes | Same process performs the write | 
| Container accesses its own filesystem layers | No | Exists only inside the VM |
@z
