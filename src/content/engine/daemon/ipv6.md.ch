%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Enable IPv6 support
description: How to enable IPv6 support in the Docker daemon
keywords: daemon, network, networking, ipv6
@y
title: Enable IPv6 support
description: How to enable IPv6 support in the Docker daemon
keywords: daemon, network, networking, ipv6
@z

@x
IPv6 is only supported on Docker daemons running on Linux hosts.
@y
IPv6 is only supported on Docker daemons running on Linux hosts.
@z

@x
## Create an IPv6 network
@y
## Create an IPv6 network
@z

@x
- Using `docker network create`:
@y
- Using `docker network create`:
@z

@x
  ```console
  $ docker network create --ipv6 ip6net
  ```
@y
  ```console
  $ docker network create --ipv6 ip6net
  ```
@z

@x
- Using `docker network create`, specifying an IPv6 subnet:
@y
- Using `docker network create`, specifying an IPv6 subnet:
@z

@x
  ```console
  $ docker network create --ipv6 --subnet 2001:db8::/64 ip6net
  ```
@y
  ```console
  $ docker network create --ipv6 --subnet 2001:db8::/64 ip6net
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
           - subnet: 2001:db8::/64
  ```
@y
  ```yaml
   networks:
     ip6net:
       enable_ipv6: true
       ipam:
         config:
           - subnet: 2001:db8::/64
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
IP: 2001:db8::2
IP: fe80::42:acff:fe11:2
RemoteAddr: [2001:db8::1]:37574
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
IP: 2001:db8::2
IP: fe80::42:acff:fe11:2
RemoteAddr: [2001:db8::1]:37574
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
     "fixed-cidr-v6": "2001:db8:1::/64"
   }
   ```
@y
   ```json
   {
     "ipv6": true,
     "fixed-cidr-v6": "2001:db8:1::/64"
   }
   ```
@z

@x
   - `ipv6` enables IPv6 networking on the default network.
   - `fixed-cidr-v6` assigns a subnet to the default bridge network,
     enabling dynamic IPv6 address allocation.
   - `ip6tables` enables additional IPv6 packet filter rules, providing network
     isolation and port mapping. It is enabled by-default, but can be disabled.
@y
   - `ipv6` enables IPv6 networking on the default network.
   - `fixed-cidr-v6` assigns a subnet to the default bridge network,
     enabling dynamic IPv6 address allocation.
   - `ip6tables` enables additional IPv6 packet filter rules, providing network
     isolation and port mapping. It is enabled by-default, but can be disabled.
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
IP: 2001:db8:1::242:ac12:2
IP: fe80::42:acff:fe12:2
RemoteAddr: [2001:db8:1::1]:35558
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
IP: 2001:db8:1::242:ac12:2
IP: fe80::42:acff:fe12:2
RemoteAddr: [2001:db8:1::1]:35558
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
This also applies to networks created from a Docker Compose file,
with `enable_ipv6` set to `true`.
@y
If you don't explicitly configure subnets for user-defined networks,
using `docker network create --subnet=<your-subnet>`,
those networks use the default address pools of the daemon as a fallback.
This also applies to networks created from a Docker Compose file,
with `enable_ipv6` set to `true`.
@z

@x
If no IPv6 pools are included in Docker Engine's `default-address-pools`,
and no `--subnet` option is given, [Unique Local Addresses (ULAs)][wikipedia-ipv6-ula]
will be used when IPv6 is enabled. These `/64` subnets include a 40-bit
Global ID based on the Docker Engine's randomly generated ID, to give a
high probability of uniqueness.
@y
If no IPv6 pools are included in Docker Engine's `default-address-pools`,
and no `--subnet` option is given, [Unique Local Addresses (ULAs)][wikipedia-ipv6-ula]
will be used when IPv6 is enabled. These `/64` subnets include a 40-bit
Global ID based on the Docker Engine's randomly generated ID, to give a
high probability of uniqueness.
@z

@x
To use different pools of IPv6 subnets for dynamic address allocation,
you must manually configure address pools of the daemon to include:
@y
To use different pools of IPv6 subnets for dynamic address allocation,
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
size `/64`, from an IPv6 pool of prefix length `/56`.
@y
The following example shows a valid configuration with the default values and
an IPv6 pool. The IPv6 pool in the example provides up to 256 IPv6 subnets of
size `/64`, from an IPv6 pool of prefix length `/56`.
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
    { "base": "2001:db8::/56", "size": 64 }
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
    { "base": "2001:db8::/56", "size": 64 }
  ]
}
```
@z

@x
> [!NOTE]
>
> The address `2001:db8::` in this example is
> [reserved for use in documentation][wikipedia-ipv6-reserved].
> Replace it with a valid IPv6 network.
>
> The default IPv4 pools are from the private address range,
> similar to the default IPv6 [ULA][wikipedia-ipv6-ula] networks.
@y
> [!NOTE]
>
> The address `2001:db8::` in this example is
> [reserved for use in documentation][wikipedia-ipv6-reserved].
> Replace it with a valid IPv6 network.
>
> The default IPv4 pools are from the private address range,
> similar to the default IPv6 [ULA][wikipedia-ipv6-ula] networks.
@z

@x
[wikipedia-ipv6-reserved]: https://en.wikipedia.org/wiki/Reserved_IP_addresses#IPv6
[wikipedia-ipv6-ula]: https://en.wikipedia.org/wiki/Unique_local_address
@y
[wikipedia-ipv6-reserved]: https://en.wikipedia.org/wiki/Reserved_IP_addresses#IPv6
[wikipedia-ipv6-ula]: https://en.wikipedia.org/wiki/Unique_local_address
@z

@x
## Docker in Docker
@y
## Docker in Docker
@z

@x
On a host using `xtables` (legacy `iptables`) instead of `nftables`, kernel
module `ip6_tables` must be loaded before an IPv6 Docker network can be created,
It is normally loaded automatically when Docker starts.
@y
On a host using `xtables` (legacy `iptables`) instead of `nftables`, kernel
module `ip6_tables` must be loaded before an IPv6 Docker network can be created,
It is normally loaded automatically when Docker starts.
@z

@x
However, if you running Docker in Docker that is not based on a recent
version of the [official `docker` image](https://hub.docker.com/_/docker), you
may need to run `modprobe ip6_tables` on your host. Alternatively, use daemon
option `--ip6tables=false` to disable `ip6tables` for the containerized Docker
Engine.
@y
However, if you running Docker in Docker that is not based on a recent
version of the [official `docker` image](https://hub.docker.com/_/docker), you
may need to run `modprobe ip6_tables` on your host. Alternatively, use daemon
option `--ip6tables=false` to disable `ip6tables` for the containerized Docker
Engine.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Networking overview](/engine/network/_index.md)
@y
- [Networking overview](engine/network/_index.md)
@z
