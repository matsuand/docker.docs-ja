%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Enable IPv6 support
description: How to enable IPv6 support in the Docker daemon
keywords: daemon, network, networking, ipv6
aliases:
- /engine/userguide/networking/default_network/ipv6/
---
@y
---
title: Enable IPv6 support
description: How to enable IPv6 support in the Docker daemon
keywords: daemon, network, networking, ipv6
aliases:
- /engine/userguide/networking/default_network/ipv6/
---
@z

@x
Before you can use IPv6 in Docker containers, you need to
enable IPv6 support in the Docker daemon. Afterward, you can choose to use
either IPv4 or IPv6 (or both) with any container or network.
@y
Before you can use IPv6 in Docker containers, you need to
enable IPv6 support in the Docker daemon. Afterward, you can choose to use
either IPv4 or IPv6 (or both) with any container or network.
@z

@x
IPv6 is only supported on Docker daemons running on Linux hosts.
@y
IPv6 is only supported on Docker daemons running on Linux hosts.
@z

@x
> **Note**
>
> When using IPv6, we recommend that you enable the
> [experimental](../../release-lifecycle.md#experimental)
> `ip6tables` parameter in the daemon configuration.
@y
> **Note**
>
> When using IPv6, we recommend that you enable the
> [experimental](../../release-lifecycle.md#experimental)
> `ip6tables` parameter in the daemon configuration.
@z

@x
## Create an IPv6 network
@y
## Create an IPv6 network
@z

@x
The following steps show you how to create a Docker network that uses IPv6.
@y
The following steps show you how to create a Docker network that uses IPv6.
@z

@x
1. Edit the Docker daemon configuration file,
   located at `/etc/docker/daemon.json`. Configure the following parameters:
@y
1. Edit the Docker daemon configuration file,
   located at `/etc/docker/daemon.json`. Configure the following parameters:
@z

@x
   ```json
   {
     "experimental": true,
     "ip6tables": true
   }
   ```
@y
   ```json
   {
     "experimental": true,
     "ip6tables": true
   }
   ```
@z

@x
   `ip6tables` enables additional IPv6 packet filter rules, providing network
   isolation and port mapping. This parameter requires `experimental` to be
   set to `true`.
@y
   `ip6tables` enables additional IPv6 packet filter rules, providing network
   isolation and port mapping. This parameter requires `experimental` to be
   set to `true`.
@z

@x
2. Save the configuration file.
3. Restart the Docker daemon for your changes to take effect.
@y
2. Save the configuration file.
3. Restart the Docker daemon for your changes to take effect.
@z

@x
   ```console
   $ sudo systemctl restart docker
   ```
@y
   ```console
   $ sudo systemctl restart docker
   ```
@z

@x
4. Create a new IPv6 network.
@y
4. Create a new IPv6 network.
@z

@x
   - Using `docker network create`:
@y
   - Using `docker network create`:
@z

@x
     ```console
     $ docker network create --ipv6 --subnet 2001:0DB8::/112 ip6net
     ```
@y
     ```console
     $ docker network create --ipv6 --subnet 2001:0DB8::/112 ip6net
     ```
@z

@x
   - Using a Docker Compose file:
@y
   - Using a Docker Compose file:
@z

@x
     ```yaml
      networks:
        ip6net:
          enable_ipv6: true
          ipam:
            config:
              - subnet: 2001:0DB8::/112
     ```
@y
     ```yaml
      networks:
        ip6net:
          enable_ipv6: true
          ipam:
            config:
              - subnet: 2001:0DB8::/112
     ```
@z

@x
You can now run containers that attach to the `ip6net` network.
@y
You can now run containers that attach to the `ip6net` network.
@z

@x
```console
$ docker run --rm --network ip6net -p 80:80 traefik/whoami
```
@y
```console
$ docker run --rm --network ip6net -p 80:80 traefik/whoami
```
@z

@x
This publishes port 80 on both IPv6 and IPv4.
You can verify the IPv6 connection by running curl,
connecting to port 80 on the IPv6 loopback address:
@y
This publishes port 80 on both IPv6 and IPv4.
You can verify the IPv6 connection by running curl,
connecting to port 80 on the IPv6 loopback address:
@z

@x
```console
$ curl http://[::1]:80
Hostname: ea1cfde18196
IP: 127.0.0.1
IP: ::1
IP: 172.17.0.2
IP: fe80::42:acff:fe11:2
RemoteAddr: [fe80::42:acff:fe11:2]:54890
GET / HTTP/1.1
Host: [::1]
User-Agent: curl/8.1.2
Accept: */*
```
@y
```console
$ curl http://[::1]:80
Hostname: ea1cfde18196
IP: 127.0.0.1
IP: ::1
IP: 172.17.0.2
IP: fe80::42:acff:fe11:2
RemoteAddr: [fe80::42:acff:fe11:2]:54890
GET / HTTP/1.1
Host: [::1]
User-Agent: curl/8.1.2
Accept: */*
```
@z

@x
## Use IPv6 for the default bridge network
@y
## Use IPv6 for the default bridge network
@z

@x
The following steps show you how to use IPv6 on the default bridge network.
@y
The following steps show you how to use IPv6 on the default bridge network.
@z

@x
1. Edit the Docker daemon configuration file,
   located at `/etc/docker/daemon.json`. Configure the following parameters:
@y
1. Edit the Docker daemon configuration file,
   located at `/etc/docker/daemon.json`. Configure the following parameters:
@z

@x
   ```json
   {
     "ipv6": true,
     "fixed-cidr-v6": "2001:db8:1::/64",
     "experimental": true,
     "ip6tables": true
   }
   ```
@y
   ```json
   {
     "ipv6": true,
     "fixed-cidr-v6": "2001:db8:1::/64",
     "experimental": true,
     "ip6tables": true
   }
   ```
@z

@x
   - `ipv6` enables IPv6 networking on the default network.
   - `fixed-cidr-v6` assigns a subnet to the default bridge network,
     enabling dynamic IPv6 address allocation.
   - `ip6tables` enables additional IPv6 packet filter rules, providing network
     isolation and port mapping. This parameter requires `experimental` to be
     set to `true`.
@y
   - `ipv6` enables IPv6 networking on the default network.
   - `fixed-cidr-v6` assigns a subnet to the default bridge network,
     enabling dynamic IPv6 address allocation.
   - `ip6tables` enables additional IPv6 packet filter rules, providing network
     isolation and port mapping. This parameter requires `experimental` to be
     set to `true`.
@z

@x
2. Save the configuration file.
3. Restart the Docker daemon for your changes to take effect.
@y
2. Save the configuration file.
3. Restart the Docker daemon for your changes to take effect.
@z

@x
   ```console
   $ sudo systemctl restart docker
   ```
@y
   ```console
   $ sudo systemctl restart docker
   ```
@z

@x
You can now run containers on the default bridge network.
@y
You can now run containers on the default bridge network.
@z

@x
```console
$ docker run --rm -p 80:80 traefik/whoami
```
@y
```console
$ docker run --rm -p 80:80 traefik/whoami
```
@z

@x
This publishes port 80 on both IPv6 and IPv4.
You can verify the IPv6 connection by making a request
to port 80 on the IPv6 loopback address:
@y
This publishes port 80 on both IPv6 and IPv4.
You can verify the IPv6 connection by making a request
to port 80 on the IPv6 loopback address:
@z

@x
```console
$ curl http://[::1]:80
Hostname: ea1cfde18196
IP: 127.0.0.1
IP: ::1
IP: 172.17.0.2
IP: fe80::42:acff:fe11:2
RemoteAddr: [fe80::42:acff:fe11:2]:54890
GET / HTTP/1.1
Host: [::1]
User-Agent: curl/8.1.2
Accept: */*
```
@y
```console
$ curl http://[::1]:80
Hostname: ea1cfde18196
IP: 127.0.0.1
IP: ::1
IP: 172.17.0.2
IP: fe80::42:acff:fe11:2
RemoteAddr: [fe80::42:acff:fe11:2]:54890
GET / HTTP/1.1
Host: [::1]
User-Agent: curl/8.1.2
Accept: */*
```
@z

@x
## Dynamic IPv6 subnet allocation
@y
## Dynamic IPv6 subnet allocation
@z

@x
If you don't explicitly configure subnets for user-defined networks,
using `docker network create --subnet=<your-subnet>`,
those networks use the default address pools of the daemon as a fallback.
The default address pools are all IPv4 pools.
This also applies to networks created from a Docker Compose file,
with `enable_ipv6` set to `true`.
@y
If you don't explicitly configure subnets for user-defined networks,
using `docker network create --subnet=<your-subnet>`,
those networks use the default address pools of the daemon as a fallback.
The default address pools are all IPv4 pools.
This also applies to networks created from a Docker Compose file,
with `enable_ipv6` set to `true`.
@z

@x
To enable dynamic subnet allocation for user-defined IPv6 networks,
you must manually configure address pools of the daemon to include:
@y
To enable dynamic subnet allocation for user-defined IPv6 networks,
you must manually configure address pools of the daemon to include:
@z

@x
- The default IPv4 address pools
- One or more IPv6 pools of your own
@y
- The default IPv4 address pools
- One or more IPv6 pools of your own
@z

@x
The default address pool configuration is:
@y
The default address pool configuration is:
@z

@x
```json
{
  "default-address-pools": [
    { "base": "172.17.0.0/16", "size": 16 },
    { "base": "172.18.0.0/16", "size": 16 },
    { "base": "172.19.0.0/16", "size": 16 },
    { "base": "172.20.0.0/14", "size": 16 },
    { "base": "172.24.0.0/14", "size": 16 },
    { "base": "172.28.0.0/14", "size": 16 },
    { "base": "192.168.0.0/16", "size": 20 }
  ]
}
```
@y
```json
{
  "default-address-pools": [
    { "base": "172.17.0.0/16", "size": 16 },
    { "base": "172.18.0.0/16", "size": 16 },
    { "base": "172.19.0.0/16", "size": 16 },
    { "base": "172.20.0.0/14", "size": 16 },
    { "base": "172.24.0.0/14", "size": 16 },
    { "base": "172.28.0.0/14", "size": 16 },
    { "base": "192.168.0.0/16", "size": 20 }
  ]
}
```
@z

@x
The following example shows a valid configuration with the default values and
an IPv6 pool. The IPv6 pool in the example provides up to 256 IPv6 subnets of
size `/112`, from an IPv6 pool of prefix length `/104`. Each `/112`-sized
subnet supports 65 536 IPv6 addresses.
@y
The following example shows a valid configuration with the default values and
an IPv6 pool. The IPv6 pool in the example provides up to 256 IPv6 subnets of
size `/112`, from an IPv6 pool of prefix length `/104`. Each `/112`-sized
subnet supports 65 536 IPv6 addresses.
@z

@x
> **Note**
>
> Be aware that the following known limitations exist for IPv6 pools:
>
> - The `base` value for IPv6 needs a minimum prefix length of `/64`.
>   This is due to an integer overflow in the Docker daemon.
>   See [moby/moby#42801](https://github.com/moby/moby/issues/42801).
> - The difference between the pool length and the pool size can't be larger
>   than 24. Defining an excessive number of subnets causes the daemon to
>   consume all available memory.
>   See [moby/moby#40275](https://github.com/moby/moby/issues/40275).
@y
> **Note**
>
> Be aware that the following known limitations exist for IPv6 pools:
>
> - The `base` value for IPv6 needs a minimum prefix length of `/64`.
>   This is due to an integer overflow in the Docker daemon.
>   See [moby/moby#42801](https://github.com/moby/moby/issues/42801).
> - The difference between the pool length and the pool size can't be larger
>   than 24. Defining an excessive number of subnets causes the daemon to
>   consume all available memory.
>   See [moby/moby#40275](https://github.com/moby/moby/issues/40275).
@z

@x
```json
{
  "default-address-pools": [
    { "base": "172.17.0.0/16", "size": 16 },
    { "base": "172.18.0.0/16", "size": 16 },
    { "base": "172.19.0.0/16", "size": 16 },
    { "base": "172.20.0.0/14", "size": 16 },
    { "base": "172.24.0.0/14", "size": 16 },
    { "base": "172.28.0.0/14", "size": 16 },
    { "base": "192.168.0.0/16", "size": 20 },
    { "base": "2001:db8::/104", "size": 112 }
  ]
}
```
@y
```json
{
  "default-address-pools": [
    { "base": "172.17.0.0/16", "size": 16 },
    { "base": "172.18.0.0/16", "size": 16 },
    { "base": "172.19.0.0/16", "size": 16 },
    { "base": "172.20.0.0/14", "size": 16 },
    { "base": "172.24.0.0/14", "size": 16 },
    { "base": "172.28.0.0/14", "size": 16 },
    { "base": "192.168.0.0/16", "size": 20 },
    { "base": "2001:db8::/104", "size": 112 }
  ]
}
```
@z

@x
> **Note**
>
> The address `2001:db8` in this example is
> [reserved for use in documentation][wikipedia-ipv6-reserved].
> Replace it with a valid IPv6 network.
> The default IPv4 pools are from the private address range,
> the IPv6 equivalent would be [ULA networks][wikipedia-ipv6-ula].
@y
> **Note**
>
> The address `2001:db8` in this example is
> [reserved for use in documentation][wikipedia-ipv6-reserved].
> Replace it with a valid IPv6 network.
> The default IPv4 pools are from the private address range,
> the IPv6 equivalent would be [ULA networks][wikipedia-ipv6-ula].
@z

@x
[wikipedia-ipv6-reserved]: https://en.wikipedia.org/wiki/Reserved_IP_addresses#IPv6
[wikipedia-ipv6-ula]: https://en.wikipedia.org/wiki/Unique_local_address
@y
[wikipedia-ipv6-reserved]: https://en.wikipedia.org/wiki/Reserved_IP_addresses#IPv6
[wikipedia-ipv6-ula]: https://en.wikipedia.org/wiki/Unique_local_address
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Networking overview](../../network/index.md)
@y
- [Networking overview](../../network/index.md)
@z
