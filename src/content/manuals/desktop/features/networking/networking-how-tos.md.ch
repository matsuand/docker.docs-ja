%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応
@x
description: Learn how to connect containers to the host, across containers, or through proxies and VPNs in Docker Desktop.
keywords: docker desktop, networking, vpn, proxy, port mapping, dns
title: Explore networking how-tos on Docker Desktop
linkTitle: How-tos
@y
description: Learn how to connect containers to the host, across containers, or through proxies and VPNs in Docker Desktop.
keywords: docker desktop, networking, vpn, proxy, port mapping, dns
title: Explore networking how-tos on Docker Desktop
linkTitle: How-tos
@z

@x
This page explains how to configure and use networking features, connect containers to host services, work behind proxies or VPNs, and troubleshoot common issues.
@y
This page explains how to configure and use networking features, connect containers to host services, work behind proxies or VPNs, and troubleshoot common issues.
@z

@x
For details on how Docker Desktop routes network traffic and file I/O between containers, the VM, and the host, see [Network overview](/manuals/desktop/features/networking/index.md#overview).
@y
For details on how Docker Desktop routes network traffic and file I/O between containers, the VM, and the host, see [Network overview](manuals/desktop/features/networking/index.md#overview).
@z

@x
## Core networking how-tos
@y
## Core networking how-tos
@z

@x
### Connect a container to a service on the host
@y
### Connect a container to a service on the host
@z

@x
The host has a changing IP address, or none if you have no network access. To connect to services running on your host, use the special DNS name:
@y
The host has a changing IP address, or none if you have no network access. To connect to services running on your host, use the special DNS name:
@z

@x
| Name                      | Description                                      |
| ------------------------- | ------------------------------------------------ |
| `host.docker.internal`    | Resolves to the internal IP address of your host |
| `gateway.docker.internal` | Resolves to the gateway IP of the Docker VM      |
@y
| Name                      | Description                                      |
| ------------------------- | ------------------------------------------------ |
| `host.docker.internal`    | Resolves to the internal IP address of your host |
| `gateway.docker.internal` | Resolves to the gateway IP of the Docker VM      |
@z

@x
#### Example
@y
#### Example
@z

@x
Run a simple HTTP server on port `8000`:
@y
Run a simple HTTP server on port `8000`:
@z

% snip command...

@x
Then run a container, install `curl`, and try to connect to the host using the following commands:
@y
Then run a container, install `curl`, and try to connect to the host using the following commands:
@z

% snip command...

@x
### Connect to a container from the host
@y
### Connect to a container from the host
@z

@x
To access containerized services from your host or local network, publish ports with the `-p` or `--publish` flag. For example:
@y
To access containerized services from your host or local network, publish ports with the `-p` or `--publish` flag. For example:
@z

% snip command...

@x
Docker Desktop makes whatever is running on port `80` in the container, in
this case, `nginx`, available on port `80` of `localhost`. 
@y
Docker Desktop makes whatever is running on port `80` in the container, in
this case, `nginx`, available on port `80` of `localhost`. 
@z

@x
> [!TIP]
>
> The syntax for `-p` is `HOST_PORT:CLIENT_PORT`.
@y
> [!TIP]
>
> The syntax for `-p` is `HOST_PORT:CLIENT_PORT`.
@z

@x
To publish all ports, use the `-P` flag. For example, the following command
starts a container (in detached mode) and the `-P` flag publishes all exposed ports of the
container to random ports on the host.
@y
To publish all ports, use the `-P` flag. For example, the following command
starts a container (in detached mode) and the `-P` flag publishes all exposed ports of the
container to random ports on the host.
@z

% snip command...

@x
Alternatively, you can also use [host networking](/manuals/engine/network/drivers/host.md#docker-desktop)
to give the container direct access to the network stack of the host.
@y
Alternatively, you can also use [host networking](manuals/engine/network/drivers/host.md#docker-desktop)
to give the container direct access to the network stack of the host.
@z

@x
See the [run command](/reference/cli/docker/container/run.md) for more details on
publish options used with `docker run`.
@y
See the [run command](reference/cli/docker/container/run.md) for more details on
publish options used with `docker run`.
@z

@x
All inbound connections pass through the Docker Desktop backend process (`com.docker.backend` (Mac), `com.docker.backend` (Windows), or `qemu` (Linux), which handles port forwarding into the VM.
For more details, see [How exposed ports work](/manuals/desktop/features/networking/index.md#how-exposed-ports-work)
@y
All inbound connections pass through the Docker Desktop backend process (`com.docker.backend` (Mac), `com.docker.backend` (Windows), or `qemu` (Linux), which handles port forwarding into the VM.
For more details, see [How exposed ports work](manuals/desktop/features/networking/index.md#how-exposed-ports-work)
@z

@x
### Working with VPNs
@y
### Working with VPNs
@z

@x
Docker Desktop networking can work when attached to a VPN. 
@y
Docker Desktop networking can work when attached to a VPN. 
@z

@x
To do this, Docker Desktop intercepts traffic from the containers and injects it into
the host as if it originated from the Docker application.
@y
To do this, Docker Desktop intercepts traffic from the containers and injects it into
the host as if it originated from the Docker application.
@z

@x
For details about how this traffic appears to host firewalls and endpoint detection systems, see [Firewalls and endpoint visibility](/manuals/desktop/features/networking/index.md#firewalls-and-endpoint-visibility.md).
@y
For details about how this traffic appears to host firewalls and endpoint detection systems, see [Firewalls and endpoint visibility](manuals/desktop/features/networking/index.md#firewalls-and-endpoint-visibility.md).
@z

@x
### Working with proxies
@y
### Working with proxies
@z

@x
Docker Desktop can use your system proxy or a manual configuration.
To configure proxies:
@y
Docker Desktop can use your system proxy or a manual configuration.
To configure proxies:
@z

@x
1. Navigate to the **Resources** tab in **Settings**. 
2. From the dropdown menu select **Proxies**.
3. Switch on the **Manual proxy configuration** toggle.
4. Enter your HTTP, HTTPS or SOCKS5 proxy URLS.
@y
1. Navigate to the **Resources** tab in **Settings**. 
2. From the dropdown menu select **Proxies**.
3. Switch on the **Manual proxy configuration** toggle.
4. Enter your HTTP, HTTPS or SOCKS5 proxy URLS.
@z

@x
For more details on proxies and proxy configurations, see the [Proxy settings documentation](/manuals/desktop/settings-and-maintenance/settings.md#proxies).
@y
For more details on proxies and proxy configurations, see the [Proxy settings documentation](manuals/desktop/settings-and-maintenance/settings.md#proxies).
@z

@x
## Network how-tos for Mac and Windows
@y
## Network how-tos for Mac and Windows
@z

@x
With Docker Desktop version 4.42 and later, you can control how Docker handles container networking and DNS resolution to better support a range of environments — from IPv4-only to dual-stack and IPv6-only systems. These settings help prevent timeouts and connectivity issues caused by incompatible or misconfigured host networks.
@y
With Docker Desktop version 4.42 and later, you can control how Docker handles container networking and DNS resolution to better support a range of environments — from IPv4-only to dual-stack and IPv6-only systems. These settings help prevent timeouts and connectivity issues caused by incompatible or misconfigured host networks.
@z

@x
You can set the following settings on the **Network** tab in the Docker Desktop Dashboard settings, or if you're an admin, with Settings Management via the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md#networking), or the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
You can set the following settings on the **Network** tab in the Docker Desktop Dashboard settings, or if you're an admin, with Settings Management via the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md#networking), or the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
> [!NOTE]
>
> These settings can be overridden on a per-network basis using CLI flags or Compose file options.
@y
> [!NOTE]
>
> These settings can be overridden on a per-network basis using CLI flags or Compose file options.
@z

@x
### Default networking mode
@y
### Default networking mode
@z

@x
Choose the default IP protocol used when Docker creates new networks. This allows you to align Docker with your host’s network capabilities or organizational requirements, such as enforcing IPv6-only access.
@y
Choose the default IP protocol used when Docker creates new networks. This allows you to align Docker with your host’s network capabilities or organizational requirements, such as enforcing IPv6-only access.
@z

@x
| Mode                         | Description                                 |
| ---------------------------- | ------------------------------------------- |
| **Dual IPv4/IPv6 (default)** | Supports both IPv4 and IPv6. Most flexible. |
| **IPv4 only**                | Uses only IPv4 addressing.                  |
| **IPv6 only**                | Uses only IPv6 addressing.                  |
@y
| Mode                         | Description                                 |
| ---------------------------- | ------------------------------------------- |
| **Dual IPv4/IPv6 (default)** | Supports both IPv4 and IPv6. Most flexible. |
| **IPv4 only**                | Uses only IPv4 addressing.                  |
| **IPv6 only**                | Uses only IPv6 addressing.                  |
@z

@x
### DNS resolution behavior 
@y
### DNS resolution behavior 
@z

@x
Control how Docker filters DNS records returned to containers, improving reliability in environments where only IPv4 or IPv6 is supported. This setting is especially useful for preventing apps from trying to connect using IP families that aren't actually available, which can cause avoidable delays or failures.
@y
Control how Docker filters DNS records returned to containers, improving reliability in environments where only IPv4 or IPv6 is supported. This setting is especially useful for preventing apps from trying to connect using IP families that aren't actually available, which can cause avoidable delays or failures.
@z

@x
| Option                         | Description                                                                 |
| ------------------------------ | --------------------------------------------------------------------------- |
| **Auto (recommended)**         | Automatically filters unsupported record types. (A for IPv4, AAAA for IPv6) |
| **Filter IPv4 (A records)**    | Blocks IPv4 lookups. Only available in dual-stack mode.                     |
| **Filter IPv6 (AAAA records)** | Blocks IPv6 lookups. Only available in dual-stack mode.                     |
| **No filtering**               | Returns both A and AAAA records.                                            |
@y
| Option                         | Description                                                                 |
| ------------------------------ | --------------------------------------------------------------------------- |
| **Auto (recommended)**         | Automatically filters unsupported record types. (A for IPv4, AAAA for IPv6) |
| **Filter IPv4 (A records)**    | Blocks IPv4 lookups. Only available in dual-stack mode.                     |
| **Filter IPv6 (AAAA records)** | Blocks IPv6 lookups. Only available in dual-stack mode.                     |
| **No filtering**               | Returns both A and AAAA records.                                            |
@z

@x
> [!IMPORTANT]
>
> Switching the default networking mode resets the DNS filter to Auto.
@y
> [!IMPORTANT]
>
> Switching the default networking mode resets the DNS filter to Auto.
@z

@x
## Network how-tos for Mac and Linux
@y
## Network how-tos for Mac and Linux
@z

@x
### SSH agent forwarding
@y
### SSH agent forwarding
@z

@x
Docker Desktop for Mac and Linux lets you use the host’s SSH agent inside a container. To do this:
@y
Docker Desktop for Mac and Linux lets you use the host’s SSH agent inside a container. To do this:
@z

@x
1. Bind mount the SSH agent socket by adding the following parameter to your `docker run` command:
@y
1. Bind mount the SSH agent socket by adding the following parameter to your `docker run` command:
@z

% snip command...

@x
2. Add the `SSH_AUTH_SOCK` environment variable in your container:
@y
2. Add the `SSH_AUTH_SOCK` environment variable in your container:
@z

% snip command...

@x
To enable the SSH agent in Docker Compose, add the following flags to your service:
@y
To enable the SSH agent in Docker Compose, add the following flags to your service:
@z

% snip code...

@x
## Known limitations
@y
## Known limitations
@z

@x
### Changing internal IP addresses
@y
### Changing internal IP addresses
@z

@x
The internal IP addresses used by Docker can be changed from **Settings**. After changing IPs, you need to reset the Kubernetes cluster and to leave any active Swarm.
@y
The internal IP addresses used by Docker can be changed from **Settings**. After changing IPs, you need to reset the Kubernetes cluster and to leave any active Swarm.
@z

@x
### There is no `docker0` bridge on the host
@y
### There is no `docker0` bridge on the host
@z

@x
Because of the way networking is implemented in Docker Desktop, you cannot
see a `docker0` interface on the host. This interface is actually within the
virtual machine.
@y
Because of the way networking is implemented in Docker Desktop, you cannot
see a `docker0` interface on the host. This interface is actually within the
virtual machine.
@z

@x
### I cannot ping my containers
@y
### I cannot ping my containers
@z

@x
Docker Desktop can't route traffic to Linux containers. However if you're a Windows user, you can
ping the Windows containers.
@y
Docker Desktop can't route traffic to Linux containers. However if you're a Windows user, you can
ping the Windows containers.
@z

@x
### Per-container IP addressing is not possible
@y
### Per-container IP addressing is not possible
@z

@x
This is because the Docker `bridge` network is not reachable from the host.
However if you are a Windows user, per-container IP addressing is possible with Windows containers.
@y
This is because the Docker `bridge` network is not reachable from the host.
However if you are a Windows user, per-container IP addressing is possible with Windows containers.
@z
