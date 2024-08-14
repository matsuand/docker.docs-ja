%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Troubleshooting the Docker daemon
description: Learn how to troubleshoot errors and misconfigurations in the Docker daemon
keywords: |
  docker, daemon, configuration, troubleshooting, error, fail to start,
  networking, dns resolver, ip forwarding, dnsmasq, firewall,
  Cannot connect to the Docker daemon. Is 'docker daemon' running on this host?
aliases:
  - /engine/install/troubleshoot/
  - /storage/troubleshooting_volume_errors/
  - /config/daemon/troubleshooting/
tags: [Troubleshooting]
---
@y
---
title: Troubleshooting the Docker daemon
description: Learn how to troubleshoot errors and misconfigurations in the Docker daemon
keywords: |
  docker, daemon, configuration, troubleshooting, error, fail to start,
  networking, dns resolver, ip forwarding, dnsmasq, firewall,
  Cannot connect to the Docker daemon. Is 'docker daemon' running on this host?
aliases:
  - /engine/install/troubleshoot/
  - /storage/troubleshooting_volume_errors/
  - /config/daemon/troubleshooting/
tags: [Troubleshooting]
---
@z

@x
This page describes how to troubleshoot and debug the daemon if you run into
issues.
@y
This page describes how to troubleshoot and debug the daemon if you run into
issues.
@z

@x
You can turn on debugging on the daemon to learn about the runtime activity of
the daemon and to aid in troubleshooting. If the daemon is unresponsive, you can
also [force a full stack trace](logs.md#force-a-stack-trace-to-be-logged) of all
threads to be added to the daemon log by sending the `SIGUSR` signal to the
Docker daemon.
@y
You can turn on debugging on the daemon to learn about the runtime activity of
the daemon and to aid in troubleshooting. If the daemon is unresponsive, you can
also [force a full stack trace](logs.md#force-a-stack-trace-to-be-logged) of all
threads to be added to the daemon log by sending the `SIGUSR` signal to the
Docker daemon.
@z

@x
## Daemon
@y
## Daemon
@z

@x
### Unable to connect to the Docker daemon
@y
### Unable to connect to the Docker daemon
@z

@x
```text
Cannot connect to the Docker daemon. Is 'docker daemon' running on this host?
```
@y
```text
Cannot connect to the Docker daemon. Is 'docker daemon' running on this host?
```
@z

@x
This error may indicate:
@y
This error may indicate:
@z

@x
- The Docker daemon isn't running on your system. Start the daemon and try
  running the command again.
- Your Docker client is attempting to connect to a Docker daemon on a different
  host, and that host is unreachable.
@y
- The Docker daemon isn't running on your system. Start the daemon and try
  running the command again.
- Your Docker client is attempting to connect to a Docker daemon on a different
  host, and that host is unreachable.
@z

@x
### Check whether Docker is running
@y
### Check whether Docker is running
@z

@x
The operating-system independent way to check whether Docker is running is to
ask Docker, using the `docker info` command.
@y
The operating-system independent way to check whether Docker is running is to
ask Docker, using the `docker info` command.
@z

@x
You can also use operating system utilities, such as
`sudo systemctl is-active docker` or `sudo status docker` or
`sudo service docker status`, or checking the service status using Windows
utilities.
@y
You can also use operating system utilities, such as
`sudo systemctl is-active docker` or `sudo status docker` or
`sudo service docker status`, or checking the service status using Windows
utilities.
@z

@x
Finally, you can check in the process list for the `dockerd` process, using
commands like `ps` or `top`.
@y
Finally, you can check in the process list for the `dockerd` process, using
commands like `ps` or `top`.
@z

@x
#### Check which host your client is connecting to
@y
#### Check which host your client is connecting to
@z

@x
To see which host your client is connecting to, check the value of the
`DOCKER_HOST` variable in your environment.
@y
To see which host your client is connecting to, check the value of the
`DOCKER_HOST` variable in your environment.
@z

@x
```console
$ env | grep DOCKER_HOST
```
@y
```console
$ env | grep DOCKER_HOST
```
@z

@x
If this command returns a value, the Docker client is set to connect to a Docker
daemon running on that host. If it's unset, the Docker client is set to connect
to the Docker daemon running on the local host. If it's set in error, use the
following command to unset it:
@y
If this command returns a value, the Docker client is set to connect to a Docker
daemon running on that host. If it's unset, the Docker client is set to connect
to the Docker daemon running on the local host. If it's set in error, use the
following command to unset it:
@z

@x
```console
$ unset DOCKER_HOST
```
@y
```console
$ unset DOCKER_HOST
```
@z

@x
You may need to edit your environment in files such as `~/.bashrc` or
`~/.profile` to prevent the `DOCKER_HOST` variable from being set erroneously.
@y
You may need to edit your environment in files such as `~/.bashrc` or
`~/.profile` to prevent the `DOCKER_HOST` variable from being set erroneously.
@z

@x
If `DOCKER_HOST` is set as intended, verify that the Docker daemon is running on
the remote host and that a firewall or network outage isn't preventing you from
connecting.
@y
If `DOCKER_HOST` is set as intended, verify that the Docker daemon is running on
the remote host and that a firewall or network outage isn't preventing you from
connecting.
@z

@x
### Troubleshoot conflicts between the `daemon.json` and startup scripts
@y
### Troubleshoot conflicts between the `daemon.json` and startup scripts
@z

@x
If you use a `daemon.json` file and also pass options to the `dockerd` command
manually or using start-up scripts, and these options conflict, Docker fails to
start with an error such as:
@y
If you use a `daemon.json` file and also pass options to the `dockerd` command
manually or using start-up scripts, and these options conflict, Docker fails to
start with an error such as:
@z

@x
```text
unable to configure the Docker daemon with file /etc/docker/daemon.json:
the following directives are specified both as a flag and in the configuration
file: hosts: (from flag: [unix:///var/run/docker.sock], from file: [tcp://127.0.0.1:2376])
```
@y
```text
unable to configure the Docker daemon with file /etc/docker/daemon.json:
the following directives are specified both as a flag and in the configuration
file: hosts: (from flag: [unix:///var/run/docker.sock], from file: [tcp://127.0.0.1:2376])
```
@z

@x
If you see an error similar to this one and you are starting the daemon manually
with flags, you may need to adjust your flags or the `daemon.json` to remove the
conflict.
@y
If you see an error similar to this one and you are starting the daemon manually
with flags, you may need to adjust your flags or the `daemon.json` to remove the
conflict.
@z

@x
> **Note**
>
> If you see this specific error message about `hosts`, continue to the
> [next section](#configure-the-daemon-host-with-systemd)
> for a workaround.
@y
> **Note**
>
> If you see this specific error message about `hosts`, continue to the
> [next section](#configure-the-daemon-host-with-systemd)
> for a workaround.
@z

@x
If you are starting Docker using your operating system's init scripts, you may
need to override the defaults in these scripts in ways that are specific to the
operating system.
@y
If you are starting Docker using your operating system's init scripts, you may
need to override the defaults in these scripts in ways that are specific to the
operating system.
@z

@x
#### Configure the daemon host with systemd
@y
#### Configure the daemon host with systemd
@z

@x
One notable example of a configuration conflict that's difficult to
troubleshoot is when you want to specify a different daemon address from the
default. Docker listens on a socket by default. On Debian and Ubuntu systems
using `systemd`, this means that a host flag `-H` is always used when starting
`dockerd`. If you specify a `hosts` entry in the `daemon.json`, this causes a
configuration conflict and results in the Docker daemon failing to start.
@y
One notable example of a configuration conflict that's difficult to
troubleshoot is when you want to specify a different daemon address from the
default. Docker listens on a socket by default. On Debian and Ubuntu systems
using `systemd`, this means that a host flag `-H` is always used when starting
`dockerd`. If you specify a `hosts` entry in the `daemon.json`, this causes a
configuration conflict and results in the Docker daemon failing to start.
@z

@x
To work around this problem, create a new file
`/etc/systemd/system/docker.service.d/docker.conf` with the following contents,
to remove the `-H` argument that's used when starting the daemon by default.
@y
To work around this problem, create a new file
`/etc/systemd/system/docker.service.d/docker.conf` with the following contents,
to remove the `-H` argument that's used when starting the daemon by default.
@z

@x
```systemd
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd
```
@y
```systemd
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd
```
@z

@x
There are other times when you might need to configure `systemd` with Docker,
such as [configuring a HTTP or HTTPS proxy](./proxy.md).
@y
There are other times when you might need to configure `systemd` with Docker,
such as [configuring a HTTP or HTTPS proxy](./proxy.md).
@z

@x
> **Note**
>
> If you override this option without specifying a `hosts` entry in the
> `daemon.json` or a `-H` flag when starting Docker manually, Docker fails to
> start.
@y
> **Note**
>
> If you override this option without specifying a `hosts` entry in the
> `daemon.json` or a `-H` flag when starting Docker manually, Docker fails to
> start.
@z

@x
Run `sudo systemctl daemon-reload` before attempting to start Docker. If Docker
starts successfully, it's now listening on the IP address specified in the
`hosts` key of the `daemon.json` instead of a socket.
@y
Run `sudo systemctl daemon-reload` before attempting to start Docker. If Docker
starts successfully, it's now listening on the IP address specified in the
`hosts` key of the `daemon.json` instead of a socket.
@z

@x
> **Important**
>
> Setting `hosts` in the `daemon.json` isn't supported on Docker
> Desktop for Windows or Docker Desktop for Mac.
{ .important }
@y
> **Important**
>
> Setting `hosts` in the `daemon.json` isn't supported on Docker
> Desktop for Windows or Docker Desktop for Mac.
{ .important }
@z

@x
### Out of memory issues
@y
### Out of memory issues
@z

@x
If your containers attempt to use more memory than the system has available, you
may experience an Out of Memory (OOM) exception, and a container, or the Docker
daemon, might be stopped by the kernel OOM killer. To prevent this from
happening, ensure that your application runs on hosts with adequate memory and
see
[Understand the risks of running out of memory](../containers/resource_constraints.md#understand-the-risks-of-running-out-of-memory).
@y
If your containers attempt to use more memory than the system has available, you
may experience an Out of Memory (OOM) exception, and a container, or the Docker
daemon, might be stopped by the kernel OOM killer. To prevent this from
happening, ensure that your application runs on hosts with adequate memory and
see
[Understand the risks of running out of memory](../containers/resource_constraints.md#understand-the-risks-of-running-out-of-memory).
@z

@x
### Kernel compatibility
@y
### Kernel compatibility
@z

@x
Docker can't run correctly if your kernel is older than version 3.10, or if it's
missing kernel modules. To check kernel compatibility, you can download and run
the
[`check-config.sh`](https://raw.githubusercontent.com/docker/docker/master/contrib/check-config.sh)
script.
@y
Docker can't run correctly if your kernel is older than version 3.10, or if it's
missing kernel modules. To check kernel compatibility, you can download and run
the
[`check-config.sh`](https://raw.githubusercontent.com/docker/docker/master/contrib/check-config.sh)
script.
@z

@x
```console
$ curl https://raw.githubusercontent.com/docker/docker/master/contrib/check-config.sh > check-config.sh
@y
```console
$ curl https://raw.githubusercontent.com/docker/docker/master/contrib/check-config.sh > check-config.sh
@z

@x
$ bash ./check-config.sh
```
@y
$ bash ./check-config.sh
```
@z

@x
The script only works on Linux.
@y
The script only works on Linux.
@z

@x
### Kernel cgroup swap limit capabilities
@y
### Kernel cgroup swap limit capabilities
@z

@x
On Ubuntu or Debian hosts, you may see messages similar to the following when
working with an image.
@y
On Ubuntu or Debian hosts, you may see messages similar to the following when
working with an image.
@z

@x
```text
WARNING: Your kernel does not support swap limit capabilities. Limitation discarded.
```
@y
```text
WARNING: Your kernel does not support swap limit capabilities. Limitation discarded.
```
@z

@x
If you don't need these capabilities, you can ignore the warning.
@y
If you don't need these capabilities, you can ignore the warning.
@z

@x
You can turn on these capabilities on Ubuntu or Debian by following these
instructions. Memory and swap accounting incur an overhead of about 1% of the
total available memory and a 10% overall performance degradation, even when
Docker isn't running.
@y
You can turn on these capabilities on Ubuntu or Debian by following these
instructions. Memory and swap accounting incur an overhead of about 1% of the
total available memory and a 10% overall performance degradation, even when
Docker isn't running.
@z

@x
1. Log into the Ubuntu or Debian host as a user with `sudo` privileges.
@y
1. Log into the Ubuntu or Debian host as a user with `sudo` privileges.
@z

@x
2. Edit the `/etc/default/grub` file. Add or edit the `GRUB_CMDLINE_LINUX` line
   to add the following two key-value pairs:
@y
2. Edit the `/etc/default/grub` file. Add or edit the `GRUB_CMDLINE_LINUX` line
   to add the following two key-value pairs:
@z

@x
   ```text
   GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"
   ```
@y
   ```text
   GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"
   ```
@z

@x
   Save and close the file.
@y
   Save and close the file.
@z

@x
3. Update the GRUB boot loader.
@y
3. Update the GRUB boot loader.
@z

@x
   ```console
   $ sudo update-grub
   ```
@y
   ```console
   $ sudo update-grub
   ```
@z

@x
   An error occurs if your GRUB configuration file has incorrect syntax. In this
   case, repeat steps 2 and 3.
@y
   An error occurs if your GRUB configuration file has incorrect syntax. In this
   case, repeat steps 2 and 3.
@z

@x
   The changes take effect when you reboot the system.
@y
   The changes take effect when you reboot the system.
@z

@x
## Networking
@y
## Networking
@z

@x
### IP forwarding problems
@y
### IP forwarding problems
@z

@x
If you manually configure your network using `systemd-network` with systemd
version 219 or later, Docker containers may not be able to access your network.
Beginning with systemd version 220, the forwarding setting for a given network
(`net.ipv4.conf.<interface>.forwarding`) defaults to off. This setting prevents
IP forwarding. It also conflicts with Docker's behavior of enabling the
`net.ipv4.conf.all.forwarding` setting within containers.
@y
If you manually configure your network using `systemd-network` with systemd
version 219 or later, Docker containers may not be able to access your network.
Beginning with systemd version 220, the forwarding setting for a given network
(`net.ipv4.conf.<interface>.forwarding`) defaults to off. This setting prevents
IP forwarding. It also conflicts with Docker's behavior of enabling the
`net.ipv4.conf.all.forwarding` setting within containers.
@z

@x
To work around this on RHEL, CentOS, or Fedora, edit the `<interface>.network`
file in `/usr/lib/systemd/network/` on your Docker host, for example,
`/usr/lib/systemd/network/80-container-host0.network`.
@y
To work around this on RHEL, CentOS, or Fedora, edit the `<interface>.network`
file in `/usr/lib/systemd/network/` on your Docker host, for example,
`/usr/lib/systemd/network/80-container-host0.network`.
@z

@x
Add the following block within the `[Network]` section.
@y
Add the following block within the `[Network]` section.
@z

@x
```systemd
[Network]
...
IPForward=kernel
# OR
IPForward=true
```
@y
```systemd
[Network]
...
IPForward=kernel
# OR
IPForward=true
```
@z

@x
This configuration allows IP forwarding from the container as expected.
@y
This configuration allows IP forwarding from the container as expected.
@z

@x
### DNS resolver issues
@y
### DNS resolver issues
@z

@x
```console
DNS resolver found in resolv.conf and containers can't use it
```
@y
```console
DNS resolver found in resolv.conf and containers can't use it
```
@z

@x
Linux desktop environments often have a network manager program running, that
uses `dnsmasq` to cache DNS requests by adding them to `/etc/resolv.conf`. The
`dnsmasq` instance runs on a loopback address such as `127.0.0.1` or
`127.0.1.1`. It speeds up DNS look-ups and provides DHCP services. Such a
configuration doesn't work within a Docker container. The Docker container uses
its own network namespace, and resolves loopback addresses such as `127.0.0.1`
to itself, and it's unlikely to be running a DNS server on its own loopback
address.
@y
Linux desktop environments often have a network manager program running, that
uses `dnsmasq` to cache DNS requests by adding them to `/etc/resolv.conf`. The
`dnsmasq` instance runs on a loopback address such as `127.0.0.1` or
`127.0.1.1`. It speeds up DNS look-ups and provides DHCP services. Such a
configuration doesn't work within a Docker container. The Docker container uses
its own network namespace, and resolves loopback addresses such as `127.0.0.1`
to itself, and it's unlikely to be running a DNS server on its own loopback
address.
@z

@x
If Docker detects that no DNS server referenced in `/etc/resolv.conf` is a fully
functional DNS server, the following warning occurs:
@y
If Docker detects that no DNS server referenced in `/etc/resolv.conf` is a fully
functional DNS server, the following warning occurs:
@z

@x
```text
WARNING: Local (127.0.0.1) DNS resolver found in resolv.conf and containers
can't use it. Using default external servers : [8.8.8.8 8.8.4.4]
```
@y
```text
WARNING: Local (127.0.0.1) DNS resolver found in resolv.conf and containers
can't use it. Using default external servers : [8.8.8.8 8.8.4.4]
```
@z

@x
If you see this warning, first check to see if you use `dnsmasq`:
@y
If you see this warning, first check to see if you use `dnsmasq`:
@z

@x
```console
$ ps aux | grep dnsmasq
```
@y
```console
$ ps aux | grep dnsmasq
```
@z

@x
If your container needs to resolve hosts which are internal to your network, the
public nameservers aren't adequate. You have two choices:
@y
If your container needs to resolve hosts which are internal to your network, the
public nameservers aren't adequate. You have two choices:
@z

@x
- Specify DNS servers for Docker to use.
- Turn off `dnsmasq`.
@y
- Specify DNS servers for Docker to use.
- Turn off `dnsmasq`.
@z

@x
  Turning off `dnsmasq` adds the IP addresses of actual DNS nameservers to
  `/etc/resolv.conf`, and you lose the benefits of `dnsmasq`.
@y
  Turning off `dnsmasq` adds the IP addresses of actual DNS nameservers to
  `/etc/resolv.conf`, and you lose the benefits of `dnsmasq`.
@z

@x
You only need to use one of these methods.
@y
You only need to use one of these methods.
@z

@x
### Specify DNS servers for Docker
@y
### Specify DNS servers for Docker
@z

@x
The default location of the configuration file is `/etc/docker/daemon.json`. You
can change the location of the configuration file using the `--config-file`
daemon flag. The following instruction assumes that the location of the
configuration file is `/etc/docker/daemon.json`.
@y
The default location of the configuration file is `/etc/docker/daemon.json`. You
can change the location of the configuration file using the `--config-file`
daemon flag. The following instruction assumes that the location of the
configuration file is `/etc/docker/daemon.json`.
@z

@x
1. Create or edit the Docker daemon configuration file, which defaults to
   `/etc/docker/daemon.json` file, which controls the Docker daemon
   configuration.
@y
1. Create or edit the Docker daemon configuration file, which defaults to
   `/etc/docker/daemon.json` file, which controls the Docker daemon
   configuration.
@z

@x
   ```console
   $ sudo nano /etc/docker/daemon.json
   ```
@y
   ```console
   $ sudo nano /etc/docker/daemon.json
   ```
@z

@x
2. Add a `dns` key with one or more DNS server IP addresses as values.
@y
2. Add a `dns` key with one or more DNS server IP addresses as values.
@z

@x
   ```json
   {
     "dns": ["8.8.8.8", "8.8.4.4"]
   }
   ```
@y
   ```json
   {
     "dns": ["8.8.8.8", "8.8.4.4"]
   }
   ```
@z

@x
   If the file has existing contents, you only need to add or edit the `dns`
   line. If your internal DNS server can't resolve public IP addresses, include
   at least one DNS server that can. Doing so allows you to connect to Docker
   Hub, and your containers to resolve internet domain names.
@y
   If the file has existing contents, you only need to add or edit the `dns`
   line. If your internal DNS server can't resolve public IP addresses, include
   at least one DNS server that can. Doing so allows you to connect to Docker
   Hub, and your containers to resolve internet domain names.
@z

@x
   Save and close the file.
@y
   Save and close the file.
@z

@x
3. Restart the Docker daemon.
@y
3. Restart the Docker daemon.
@z

@x
   ```console
   $ sudo service docker restart
   ```
@y
   ```console
   $ sudo service docker restart
   ```
@z

@x
4. Verify that Docker can resolve external IP addresses by trying to pull an
   image:
@y
4. Verify that Docker can resolve external IP addresses by trying to pull an
   image:
@z

@x
   ```console
   $ docker pull hello-world
   ```
@y
   ```console
   $ docker pull hello-world
   ```
@z

@x
5. If necessary, verify that Docker containers can resolve an internal hostname
   by pinging it.
@y
5. If necessary, verify that Docker containers can resolve an internal hostname
   by pinging it.
@z

@x
   ```console
   $ docker run --rm -it alpine ping -c4 <my_internal_host>
@y
   ```console
   $ docker run --rm -it alpine ping -c4 <my_internal_host>
@z

@x
   PING google.com (192.168.1.2): 56 data bytes
   64 bytes from 192.168.1.2: seq=0 ttl=41 time=7.597 ms
   64 bytes from 192.168.1.2: seq=1 ttl=41 time=7.635 ms
   64 bytes from 192.168.1.2: seq=2 ttl=41 time=7.660 ms
   64 bytes from 192.168.1.2: seq=3 ttl=41 time=7.677 ms
   ```
@y
   PING google.com (192.168.1.2): 56 data bytes
   64 bytes from 192.168.1.2: seq=0 ttl=41 time=7.597 ms
   64 bytes from 192.168.1.2: seq=1 ttl=41 time=7.635 ms
   64 bytes from 192.168.1.2: seq=2 ttl=41 time=7.660 ms
   64 bytes from 192.168.1.2: seq=3 ttl=41 time=7.677 ms
   ```
@z

@x
### Turn off `dnsmasq`
@y
### Turn off `dnsmasq`
@z

@x
{{< tabs >}}
{{< tab name="Ubuntu" >}}
@y
{{< tabs >}}
{{< tab name="Ubuntu" >}}
@z

@x
If you prefer not to change the Docker daemon's configuration to use a specific
IP address, follow these instructions to turn off `dnsmasq` in NetworkManager.
@y
If you prefer not to change the Docker daemon's configuration to use a specific
IP address, follow these instructions to turn off `dnsmasq` in NetworkManager.
@z

@x
1. Edit the `/etc/NetworkManager/NetworkManager.conf` file.
@y
1. Edit the `/etc/NetworkManager/NetworkManager.conf` file.
@z

@x
2. Comment out the `dns=dnsmasq` line by adding a `#` character to the beginning
   of the line.
@y
2. Comment out the `dns=dnsmasq` line by adding a `#` character to the beginning
   of the line.
@z

@x
   ```text
   # dns=dnsmasq
   ```
@y
   ```text
   # dns=dnsmasq
   ```
@z

@x
   Save and close the file.
@y
   Save and close the file.
@z

@x
3. Restart both NetworkManager and Docker. As an alternative, you can reboot
   your system.
@y
3. Restart both NetworkManager and Docker. As an alternative, you can reboot
   your system.
@z

@x
   ```console
   $ sudo systemctl restart network-manager
   $ sudo systemctl restart docker
   ```
@y
   ```console
   $ sudo systemctl restart network-manager
   $ sudo systemctl restart docker
   ```
@z

@x
{{< /tab >}}
{{< tab name="RHEL, CentOS, or Fedora" >}}
@y
{{< /tab >}}
{{< tab name="RHEL, CentOS, or Fedora" >}}
@z

@x
To turn off `dnsmasq` on RHEL, CentOS, or Fedora:
@y
To turn off `dnsmasq` on RHEL, CentOS, or Fedora:
@z

@x
1. Turn off the `dnsmasq` service:
@y
1. Turn off the `dnsmasq` service:
@z

@x
   ```console
   $ sudo systemctl stop dnsmasq
   $ sudo systemctl disable dnsmasq
   ```
@y
   ```console
   $ sudo systemctl stop dnsmasq
   $ sudo systemctl disable dnsmasq
   ```
@z

@x
2. Configure the DNS servers manually using the
   [Red Hat documentation](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/configuring_and_managing_networking/configuring-the-order-of-dns-servers_configuring-and-managing-networking).
@y
2. Configure the DNS servers manually using the
   [Red Hat documentation](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/configuring_and_managing_networking/configuring-the-order-of-dns-servers_configuring-and-managing-networking).
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Docker networks disappearing
@y
### Docker networks disappearing
@z

@x
If a Docker network, such as the `docker0` bridge or a custom network, randomly
disappears or otherwise appears to be working incorrectly, it could be because
another service is interfering with or modifying Docker interfaces. Tools that
manage networking interfaces on the host are known to sometimes also
inappropriately modify Docker interfaces.
@y
If a Docker network, such as the `docker0` bridge or a custom network, randomly
disappears or otherwise appears to be working incorrectly, it could be because
another service is interfering with or modifying Docker interfaces. Tools that
manage networking interfaces on the host are known to sometimes also
inappropriately modify Docker interfaces.
@z

@x
Refer to the following sections for instructions on how to configure your
network manager to set Docker interfaces as un-managed, depending on the
network management tools that exist on the host:
@y
Refer to the following sections for instructions on how to configure your
network manager to set Docker interfaces as un-managed, depending on the
network management tools that exist on the host:
@z

@x
- If `netscript` is installed, consider [uninstalling it](#uninstall-netscript)
- Configure the network manager to [treat Docker interfaces as un-managed](#un-manage-docker-interfaces)
- If you're using Netplan, you may need to [apply a custom Netplan configuration](#prevent-netplan-from-overriding-network-configuration)
@y
- If `netscript` is installed, consider [uninstalling it](#uninstall-netscript)
- Configure the network manager to [treat Docker interfaces as un-managed](#un-manage-docker-interfaces)
- If you're using Netplan, you may need to [apply a custom Netplan configuration](#prevent-netplan-from-overriding-network-configuration)
@z

@x
#### Uninstall `netscript`
@y
#### Uninstall `netscript`
@z

@x
If `netscript` is installed on your system, you can likely fix this issue by
uninstalling it. For example, on a Debian-based system:
@y
If `netscript` is installed on your system, you can likely fix this issue by
uninstalling it. For example, on a Debian-based system:
@z

@x
```console
$ sudo apt-get remove netscript-2.4
```
@y
```console
$ sudo apt-get remove netscript-2.4
```
@z

@x
#### Un-manage Docker interfaces
@y
#### Un-manage Docker interfaces
@z

@x
In some cases, the network manager will attempt to manage Docker interfaces by
default. You can try to explicitly flag Docker networks as un-managed by
editing your system's network configuration settings.
@y
In some cases, the network manager will attempt to manage Docker interfaces by
default. You can try to explicitly flag Docker networks as un-managed by
editing your system's network configuration settings.
@z

@x
{{< tabs >}}
{{< tab name="NetworkManager" >}}
@y
{{< tabs >}}
{{< tab name="NetworkManager" >}}
@z

@x
If you're using `NetworkManager`, edit your system network configuration under
`/etc/network/interfaces`
@y
If you're using `NetworkManager`, edit your system network configuration under
`/etc/network/interfaces`
@z

@x
1. Create a file at `/etc/network/interfaces.d/20-docker0` with the following
   contents:
@y
1. Create a file at `/etc/network/interfaces.d/20-docker0` with the following
   contents:
@z

@x
   ```text
   iface docker0 inet manual
   ```
@y
   ```text
   iface docker0 inet manual
   ```
@z

@x
   Note that this example configuration only "un-manages" the default `docker0`
   bridge, not custom networks.
@y
   Note that this example configuration only "un-manages" the default `docker0`
   bridge, not custom networks.
@z

@x
2. Restart `NetworkManager` for the configuration change to take effect.
@y
2. Restart `NetworkManager` for the configuration change to take effect.
@z

@x
   ```console
   $ systemctl restart NetworkManager
   ```
@y
   ```console
   $ systemctl restart NetworkManager
   ```
@z

@x
3. Verify that the `docker0` interface has the `unmanaged` state.
@y
3. Verify that the `docker0` interface has the `unmanaged` state.
@z

@x
   ```console
   $ nmcli device
   ```
@y
   ```console
   $ nmcli device
   ```
@z

@x
{{< /tab >}}
{{< tab name="systemd-networkd" >}}
@y
{{< /tab >}}
{{< tab name="systemd-networkd" >}}
@z

@x
If you're running Docker on a system using `systemd-networkd` as a networking
daemon, configure the Docker interfaces as un-managed by creating configuration
files under `/etc/systemd/network`:
@y
If you're running Docker on a system using `systemd-networkd` as a networking
daemon, configure the Docker interfaces as un-managed by creating configuration
files under `/etc/systemd/network`:
@z

@x
1. Create `/etc/systemd/network/docker.network` with the following contents:
@y
1. Create `/etc/systemd/network/docker.network` with the following contents:
@z

@x
   ```ini
   # Ensure that the Docker interfaces are un-managed
@y
   ```ini
   # Ensure that the Docker interfaces are un-managed
@z

@x
   [Match]
   Name=docker0 br-* veth*
@y
   [Match]
   Name=docker0 br-* veth*
@z

@x
   [Link]
   Unmanaged=yes
@y
   [Link]
   Unmanaged=yes
@z

@x
   ```
@y
   ```
@z

@x
2. Reload the configuration.
@y
2. Reload the configuration.
@z

@x
   ```console
   $ sudo systemctl restart systemd-networkd
   ```
@y
   ```console
   $ sudo systemctl restart systemd-networkd
   ```
@z

@x
3. Restart the Docker daemon.
@y
3. Restart the Docker daemon.
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
4. Verify that the Docker interfaces have the `unmanaged` state.
@y
4. Verify that the Docker interfaces have the `unmanaged` state.
@z

@x
   ```console
   $ networkctl
   ```
@y
   ```console
   $ networkctl
   ```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Prevent Netplan from overriding network configuration
@y
### Prevent Netplan from overriding network configuration
@z

@x
On systems that use [Netplan](https://netplan.io/) through
[`cloud-init`](https://cloudinit.readthedocs.io/en/latest/index.html), you may
need to apply a custom configuration to prevent `netplan` from overriding the
network manager configuration:
@y
On systems that use [Netplan](https://netplan.io/) through
[`cloud-init`](https://cloudinit.readthedocs.io/en/latest/index.html), you may
need to apply a custom configuration to prevent `netplan` from overriding the
network manager configuration:
@z

@x
1. Follow the steps in [Un-manage Docker interfaces](#un-manage-docker-interfaces)
   for creating the network manager configuration.
2. Create a `netplan` configuration file under `/etc/netplan/50-cloud-init.yml`.
@y
1. Follow the steps in [Un-manage Docker interfaces](#un-manage-docker-interfaces)
   for creating the network manager configuration.
2. Create a `netplan` configuration file under `/etc/netplan/50-cloud-init.yml`.
@z

@x
   The following example configuration file is a starting point.
   Adjust it to match the interfaces you want to un-manage.
   Incorrect configuration can lead to network connectivity issues.
@y
   The following example configuration file is a starting point.
   Adjust it to match the interfaces you want to un-manage.
   Incorrect configuration can lead to network connectivity issues.
@z

@x
   ```yaml {title="/etc/netplan/50-cloud-init.yml"}
   network:
     ethernets:
       all:
         dhcp4: true
         dhcp6: true
         match:
           # edit this filter to match whatever makes sense for your system
           name: en*
     renderer: networkd
     version: 2
   ```
@y
   ```yaml {title="/etc/netplan/50-cloud-init.yml"}
   network:
     ethernets:
       all:
         dhcp4: true
         dhcp6: true
         match:
           # edit this filter to match whatever makes sense for your system
           name: en*
     renderer: networkd
     version: 2
   ```
@z

@x
3. Apply the new Netplan configuration.
@y
3. Apply the new Netplan configuration.
@z

@x
   ```console
   $ sudo netplan apply
   ```
@y
   ```console
   $ sudo netplan apply
   ```
@z

@x
4. Restart the Docker daemon:
@y
4. Restart the Docker daemon:
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
5. Verify that the Docker interfaces have the `unmanaged` state.
@y
5. Verify that the Docker interfaces have the `unmanaged` state.
@z

@x
   ```console
   $ networkctl
   ```
@y
   ```console
   $ networkctl
   ```
@z

@x
## Volumes
@y
## Volumes
@z

@x
### Unable to remove filesystem
@y
### Unable to remove filesystem
@z

@x
```text
Error: Unable to remove filesystem
```
@y
```text
Error: Unable to remove filesystem
```
@z

@x
Some container-based utilities, such
as [Google cAdvisor](https://github.com/google/cadvisor), mount Docker system
directories, such as `/var/lib/docker/`, into a container. For instance, the
documentation for `cadvisor` instructs you to run the `cadvisor` container as
follows:
@y
Some container-based utilities, such
as [Google cAdvisor](https://github.com/google/cadvisor), mount Docker system
directories, such as `/var/lib/docker/`, into a container. For instance, the
documentation for `cadvisor` instructs you to run the `cadvisor` container as
follows:
@z

@x
```console
$ sudo docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:rw \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --publish=8080:8080 \
  --detach=true \
  --name=cadvisor \
  google/cadvisor:latest
```
@y
```console
$ sudo docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:rw \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --publish=8080:8080 \
  --detach=true \
  --name=cadvisor \
  google/cadvisor:latest
```
@z

@x
When you bind-mount `/var/lib/docker/`, this effectively mounts all resources of
all other running containers as filesystems within the container which mounts
`/var/lib/docker/`. When you attempt to remove any of these containers, the
removal attempt may fail with an error like the following:
@y
When you bind-mount `/var/lib/docker/`, this effectively mounts all resources of
all other running containers as filesystems within the container which mounts
`/var/lib/docker/`. When you attempt to remove any of these containers, the
removal attempt may fail with an error like the following:
@z

@x
```none
Error: Unable to remove filesystem for
74bef250361c7817bee19349c93139621b272bc8f654ae112dd4eb9652af9515:
remove /var/lib/docker/containers/74bef250361c7817bee19349c93139621b272bc8f654ae112dd4eb9652af9515/shm:
Device or resource busy
```
@y
```none
Error: Unable to remove filesystem for
74bef250361c7817bee19349c93139621b272bc8f654ae112dd4eb9652af9515:
remove /var/lib/docker/containers/74bef250361c7817bee19349c93139621b272bc8f654ae112dd4eb9652af9515/shm:
Device or resource busy
```
@z

@x
The problem occurs if the container which bind-mounts `/var/lib/docker/`
uses `statfs` or `fstatfs` on filesystem handles within `/var/lib/docker/`
and does not close them.
@y
The problem occurs if the container which bind-mounts `/var/lib/docker/`
uses `statfs` or `fstatfs` on filesystem handles within `/var/lib/docker/`
and does not close them.
@z

@x
Typically, we would advise against bind-mounting `/var/lib/docker` in this way.
However, `cAdvisor` requires this bind-mount for core functionality.
@y
Typically, we would advise against bind-mounting `/var/lib/docker` in this way.
However, `cAdvisor` requires this bind-mount for core functionality.
@z

@x
If you are unsure which process is causing the path mentioned in the error to
be busy and preventing it from being removed, you can use the `lsof` command
to find its process. For instance, for the error above:
@y
If you are unsure which process is causing the path mentioned in the error to
be busy and preventing it from being removed, you can use the `lsof` command
to find its process. For instance, for the error above:
@z

@x
```console
$ sudo lsof /var/lib/docker/containers/74bef250361c7817bee19349c93139621b272bc8f654ae112dd4eb9652af9515/shm
```
@y
```console
$ sudo lsof /var/lib/docker/containers/74bef250361c7817bee19349c93139621b272bc8f654ae112dd4eb9652af9515/shm
```
@z

@x
To work around this problem, stop the container which bind-mounts
`/var/lib/docker` and try again to remove the other container.
@y
To work around this problem, stop the container which bind-mounts
`/var/lib/docker` and try again to remove the other container.
@z
