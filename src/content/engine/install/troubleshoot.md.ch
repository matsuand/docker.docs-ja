%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Troubleshoot Docker Engine installation
description: Learn how to diagnose and resolve error messages related to the Docker Engine installation.
keywords: Docker Engine, troubleshooting, error, Linux, install Docker Engine
---
@y
---
title: Troubleshoot Docker Engine installation
description: Learn how to diagnose and resolve error messages related to the Docker Engine installation.
keywords: Docker Engine, troubleshooting, error, Linux, install Docker Engine
---
@z

@x
This page contains instructions for troubleshooting and diagnosing the Docker
Engine installation.
@y
This page contains instructions for troubleshooting and diagnosing the Docker
Engine installation.
@z

@x
## Kernel compatibility
@y
## Kernel compatibility
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
## Unable to connect to the Docker daemon
@y
## Unable to connect to the Docker daemon
@z

@x
```none
Cannot connect to the Docker daemon. Is 'docker daemon' running on this host?
```
@y
```none
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
## IP forwarding problems
@y
## IP forwarding problems
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
## DNS resolver issues
@y
## DNS resolver issues
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
```none
WARNING: Local (127.0.0.1) DNS resolver found in resolv.conf and containers
can't use it. Using default external servers : [8.8.8.8 8.8.4.4]
```
@y
```none
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
## Specify DNS servers for Docker
@y
## Specify DNS servers for Docker
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
## Turn off `dnsmasq`
@y
## Turn off `dnsmasq`
@z

@x
### Ubuntu
@y
### Ubuntu
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
   ```none
   # dns=dnsmasq
   ```
@y
   ```none
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
### RHEL, CentOS, or Fedora
@y
### RHEL, CentOS, or Fedora
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
   [Red Hat documentation](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Deployment_Guide/s1-networkscripts-interfaces.html).
@y
2. Configure the DNS servers manually using the
   [Red Hat documentation](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Deployment_Guide/s1-networkscripts-interfaces.html).
@z

@x
## Allow access to the remote API through a firewall
@y
## Allow access to the remote API through a firewall
@z

@x
If you run a firewall on the same host as you run Docker, and you want to access
the Docker Remote API from another remote host, you must configure your firewall
to allow incoming connections on the Docker port. The default port is `2376` if
you're using TLS encrypted transport, or `2375` otherwise.
@y
If you run a firewall on the same host as you run Docker, and you want to access
the Docker Remote API from another remote host, you must configure your firewall
to allow incoming connections on the Docker port. The default port is `2376` if
you're using TLS encrypted transport, or `2375` otherwise.
@z

@x
Two common firewall daemons are:
@y
Two common firewall daemons are:
@z

@x
- [Uncomplicated Firewall (UFW)](https://help.ubuntu.com/community/UFW), often
  used for Ubuntu systems.
- [firewalld](https://firewalld.org), often used for RPM-based systems.
@y
- [Uncomplicated Firewall (UFW)](https://help.ubuntu.com/community/UFW), often
  used for Ubuntu systems.
- [firewalld](https://firewalld.org), often used for RPM-based systems.
@z

@x
Consult the documentation for your OS and firewall. The following information
might help you get started. The settings used in this instruction are
permissive, and you may want to use a different configuration that locks your
system down more.
@y
Consult the documentation for your OS and firewall. The following information
might help you get started. The settings used in this instruction are
permissive, and you may want to use a different configuration that locks your
system down more.
@z

@x
- For UFW, set `DEFAULT_FORWARD_POLICY="ACCEPT"` in your configuration.
@y
- For UFW, set `DEFAULT_FORWARD_POLICY="ACCEPT"` in your configuration.
@z

@x
- For firewalld, add rules similar to the following to your policy. One for
  incoming requests, and one for outgoing requests.
@y
- For firewalld, add rules similar to the following to your policy. One for
  incoming requests, and one for outgoing requests.
@z

@x
  ```xml
  <direct>
    [ <rule ipv="ipv6" table="filter" chain="FORWARD_direct" priority="0"> -i zt0 -j ACCEPT </rule> ]
    [ <rule ipv="ipv6" table="filter" chain="FORWARD_direct" priority="0"> -o zt0 -j ACCEPT </rule> ]
  </direct>
  ```
@y
  ```xml
  <direct>
    [ <rule ipv="ipv6" table="filter" chain="FORWARD_direct" priority="0"> -i zt0 -j ACCEPT </rule> ]
    [ <rule ipv="ipv6" table="filter" chain="FORWARD_direct" priority="0"> -o zt0 -j ACCEPT </rule> ]
  </direct>
  ```
@z

@x
  Make sure that the interface names and chain names are correct.
@y
  Make sure that the interface names and chain names are correct.
@z

@x
## Kernel cgroup swap limit capabilities
@y
## Kernel cgroup swap limit capabilities
@z

@x
On Ubuntu or Debian hosts, you may see messages similar to the following when
working with an image.
@y
On Ubuntu or Debian hosts, you may see messages similar to the following when
working with an image.
@z

@x
```none
WARNING: Your kernel does not support swap limit capabilities. Limitation discarded.
```
@y
```none
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
   ```none
   GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"
   ```
@y
   ```none
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
