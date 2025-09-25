%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
description: Understand how networking works on Docker Desktop and see the known limitations
keywords: networking, docker desktop, proxy, vpn, Linux, Mac, Windows
title: Explore networking features on Docker Desktop
linkTitle: Networking
@y
description: Understand how networking works on Docker Desktop and see the known limitations
keywords: networking, docker desktop, proxy, vpn, Linux, Mac, Windows
title: Explore networking features on Docker Desktop
linkTitle: Networking
@z

@x
Docker Desktop includes built-in networking capabilities to help you connect containers with services on your host, across containers, or through proxies and VPNs.
@y
Docker Desktop includes built-in networking capabilities to help you connect containers with services on your host, across containers, or through proxies and VPNs.
@z

@x
## Networking features for all platforms
@y
## Networking features for all platforms
@z

@x
### VPN Passthrough
@y
### VPN Passthrough
@z

@x
Docker Desktop networking can work when attached to a VPN. To do this,
Docker Desktop intercepts traffic from the containers and injects it into
the host as if it originated from the Docker application.
@y
Docker Desktop networking can work when attached to a VPN. To do this,
Docker Desktop intercepts traffic from the containers and injects it into
the host as if it originated from the Docker application.
@z

@x
### Port mapping
@y
### Port mapping
@z

@x
When you run a container with the `-p` argument, for example:
@y
When you run a container with the `-p` argument, for example:
@z

% snip command...

@x
Docker Desktop makes whatever is running on port `80` in the container, in
this case, `nginx`, available on port `80` of `localhost`. In this example, the
host and container ports are the same. 
@y
Docker Desktop makes whatever is running on port `80` in the container, in
this case, `nginx`, available on port `80` of `localhost`. In this example, the
host and container ports are the same. 
@z

@x
To avoid conflicts with services already using port `80` on the host:
@y
To avoid conflicts with services already using port `80` on the host:
@z

% snip command...

@x
Now connections to `localhost:8000` are sent to port `80` in the container. 
@y
Now connections to `localhost:8000` are sent to port `80` in the container. 
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
### HTTP/HTTPS Proxy support
@y
### HTTP/HTTPS Proxy support
@z

@x
See [Proxies](/manuals/desktop/settings-and-maintenance/settings.md#proxies)
@y
See [Proxies](manuals/desktop/settings-and-maintenance/settings.md#proxies)
@z

@x
### SOCKS5 proxy support
@y
### SOCKS5 proxy support
@z

@x
{{< summary-bar feature_name="SOCKS5 proxy support" >}}
@y
{{< summary-bar feature_name="SOCKS5 proxy support" >}}
@z

@x
SOCKS (Socket Secure) is a protocol that facilitates the routing of network packets between a client and a server through a proxy server. It provides a way to enhance privacy, security, and network performance for users and applications. 
@y
SOCKS (Socket Secure) is a protocol that facilitates the routing of network packets between a client and a server through a proxy server. It provides a way to enhance privacy, security, and network performance for users and applications. 
@z

@x
You can enable SOCKS proxy support to allow outgoing requests, such as pulling images, and access Linux container backend IPs from the host. 
@y
You can enable SOCKS proxy support to allow outgoing requests, such as pulling images, and access Linux container backend IPs from the host. 
@z

@x
To enable and set up SOCKS proxy support:
@y
To enable and set up SOCKS proxy support:
@z

@x
1. Navigate to the **Resources** tab in **Settings**. 
2. From the dropdown menu select **Proxies**.
3. Switch on the **Manual proxy configuration** toggle. 
4. In the **Secure Web Server HTTPS** box, paste your `socks5://host:port` URL.
@y
1. Navigate to the **Resources** tab in **Settings**. 
2. From the dropdown menu select **Proxies**.
3. Switch on the **Manual proxy configuration** toggle. 
4. In the **Secure Web Server HTTPS** box, paste your `socks5://host:port` URL.
@z

@x
## Networking mode and DNS behaviour for Mac and Windows
@y
## Networking mode and DNS behaviour for Mac and Windows
@z

@x
With Docker Desktop version 4.42 and later, you can customize how Docker handles container networking and DNS resolution to better support a range of environments — from IPv4-only to dual-stack and IPv6-only systems. These settings help prevent timeouts and connectivity issues caused by incompatible or misconfigured host networks.
@y
With Docker Desktop version 4.42 and later, you can customize how Docker handles container networking and DNS resolution to better support a range of environments — from IPv4-only to dual-stack and IPv6-only systems. These settings help prevent timeouts and connectivity issues caused by incompatible or misconfigured host networks.
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
The options available are:
@y
The options available are:
@z

@x
- **Dual IPv4/IPv6** (Default): Supports both IPv4 and IPv6. Most flexible and ideal for environments with dual-stack networking.
- **IPv4 only**: Only IPv4 addresses are used. Use this if your host or network does not support IPv6.
- **IPv6 only**: Only IPv6 addresses are used. Best for environments transitioning to or enforcing IPv6-only connectivity.
@y
- **Dual IPv4/IPv6** (Default): Supports both IPv4 and IPv6. Most flexible and ideal for environments with dual-stack networking.
- **IPv4 only**: Only IPv4 addresses are used. Use this if your host or network does not support IPv6.
- **IPv6 only**: Only IPv6 addresses are used. Best for environments transitioning to or enforcing IPv6-only connectivity.
@z

@x
> [!NOTE]
>
> This setting can be overridden on a per-network basis using CLI flags or Compose file options.
@y
> [!NOTE]
>
> This setting can be overridden on a per-network basis using CLI flags or Compose file options.
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
Depending on your selected network mode, the options available are:
@y
Depending on your selected network mode, the options available are:
@z

@x
- **Auto (recommended)**: Docker detects your host's network stack and automatically filters out unsupported DNS record types (A for IPv4, AAAA for IPv6).
- **Filter IPv4 (A records)**: Prevents containers from resolving IPv4 addresses. Only available in dual-stack mode.
- **Filter IPv6 (AAAA records)**: Prevents containers from resolving IPv6 addresses. Only available in dual-stack mode.
- **No filtering**: Docker returns all DNS records (A and AAAA), regardless of host support.
@y
- **Auto (recommended)**: Docker detects your host's network stack and automatically filters out unsupported DNS record types (A for IPv4, AAAA for IPv6).
- **Filter IPv4 (A records)**: Prevents containers from resolving IPv4 addresses. Only available in dual-stack mode.
- **Filter IPv6 (AAAA records)**: Prevents containers from resolving IPv6 addresses. Only available in dual-stack mode.
- **No filtering**: Docker returns all DNS records (A and AAAA), regardless of host support.
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
### Using Settings Management
@y
### Using Settings Management
@z

@x
If you're an administrator, you can use [Settings Management](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md#networking) to enforce this Docker Desktop setting across your developer's machines. Choose from the following code snippets and at it to your `admin-settings.json` file,
or configure this setting using the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
If you're an administrator, you can use [Settings Management](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md#networking) to enforce this Docker Desktop setting across your developer's machines. Choose from the following code snippets and at it to your `admin-settings.json` file,
or configure this setting using the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
{{< tabs >}}
{{< tab name="Networking mode" >}}
@y
{{< tabs >}}
{{< tab name="Networking mode" >}}
@z

@x
Dual IPv4/IPv6:
@y
Dual IPv4/IPv6:
@z

% snip code...

@x
IPv4 only:
@y
IPv4 only:
@z

% snip code...

@x
IPv6 only:
@y
IPv6 only:
@z

% snip code...

@x
{{< /tab >}}
{{< tab name="DNS resolution" >}}
@y
{{< /tab >}}
{{< tab name="DNS resolution" >}}
@z

@x
Auto filter:
@y
Auto filter:
@z

% snip code...

@x
Filter IPv4:
@y
Filter IPv4:
@z

% snip code...

@x
Filter IPv6:
@y
Filter IPv6:
@z

% snip code...

@x
No filter:
@y
No filter:
@z

% snip code...

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Networking features for Mac and Linux
@y
## Networking features for Mac and Linux
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

@x
## Use cases and workarounds 
@y
## Use cases and workarounds 
@z

@x
### I want to connect from a container to a service on the host
@y
### I want to connect from a container to a service on the host
@z

@x
The host has a changing IP address, or none if you have no network access.
Docker recommends you connect to the special DNS name `host.docker.internal`,
which resolves to the internal IP address used by the host.
@y
The host has a changing IP address, or none if you have no network access.
Docker recommends you connect to the special DNS name `host.docker.internal`,
which resolves to the internal IP address used by the host.
@z

@x
You can also reach the gateway using `gateway.docker.internal`.
@y
You can also reach the gateway using `gateway.docker.internal`.
@z

@x
If you have installed Python on your machine, use the following instructions as an example to connect from a container to a service on the host:
@y
If you have installed Python on your machine, use the following instructions as an example to connect from a container to a service on the host:
@z

@x
1. Run the following command to start a simple HTTP server on port 8000.
@y
1. Run the following command to start a simple HTTP server on port 8000.
@z

@x
    `python -m http.server 8000`
@y
    `python -m http.server 8000`
@z

@x
    If you have installed Python 2.x, run `python -m SimpleHTTPServer 8000`.
@y
    If you have installed Python 2.x, run `python -m SimpleHTTPServer 8000`.
@z

@x
2. Now, run a container, install `curl`, and try to connect to the host using the following commands:
@y
2. Now, run a container, install `curl`, and try to connect to the host using the following commands:
@z

% snip command...

@x
### I want to connect to a container from the host
@y
### I want to connect to a container from the host
@z

@x
Port forwarding works for `localhost`. `--publish`, `-p`, or `-P` all work.
Ports exposed from Linux are forwarded to the host.
@y
Port forwarding works for `localhost`. `--publish`, `-p`, or `-P` all work.
Ports exposed from Linux are forwarded to the host.
@z

@x
Docker recommends you publish a port, or to connect from another
container. This is what you need to do even on Linux if the container is on an
overlay network, not a bridge network, as these are not routed.
@y
Docker recommends you publish a port, or to connect from another
container. This is what you need to do even on Linux if the container is on an
overlay network, not a bridge network, as these are not routed.
@z

@x
For example, to run an `nginx` webserver:
@y
For example, to run an `nginx` webserver:
@z

% snip command...

@x
To clarify the syntax, the following two commands both publish container's port `80` to host's port `8000`:
@y
To clarify the syntax, the following two commands both publish container's port `80` to host's port `8000`:
@z

% snip command...

@x
To publish all ports, use the `-P` flag. For example, the following command
starts a container (in detached mode) and the `-P` flag publishes all exposed ports of the
container to random ports on the host.
@y
To publish all ports, use the `-P` flag. For example, the following command
starts a container (in detached mode) and the `-P` flag publishes all exposed ports of the
container to random ports on the host.
@z

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
