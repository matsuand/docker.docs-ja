%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Troubleshooting the Docker daemon
description: Learn how to troubleshoot errors and misconfigurations in the Docker daemon
keywords: docker, daemon, configuration, troubleshooting, error, fail to start
tags: [ Troubleshooting ]
---
@y
---
title: Troubleshooting the Docker daemon
description: Learn how to troubleshoot errors and misconfigurations in the Docker daemon
keywords: docker, daemon, configuration, troubleshooting, error, fail to start
tags: [ Troubleshooting ]
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
## Troubleshoot conflicts between the `daemon.json` and startup scripts
@y
## Troubleshoot conflicts between the `daemon.json` and startup scripts
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
```none
unable to configure the Docker daemon with file /etc/docker/daemon.json:
the following directives are specified both as a flag and in the configuration
file: hosts: (from flag: [unix:///var/run/docker.sock], from file: [tcp://127.0.0.1:2376])
```
@y
```none
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
> If you see this specific error, continue to the
> [next section](#use-the-hosts-key-in-daemonjson-with-systemd)
> for a workaround.
@y
> **Note**
>
> If you see this specific error, continue to the
> [next section](#use-the-hosts-key-in-daemonjson-with-systemd)
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
### Use the hosts key in daemon.json with systemd
@y
### Use the hosts key in daemon.json with systemd
@z

@x
One notable example of a configuration conflict that's difficult to
troubleshoot is when you want to specify a different daemon address from the
default. Docker listens on a socket by default. On Debian and Ubuntu systems
using `systemd`, this means that a host flag `-H` is always used when starting
`dockerd`. If you specify a `hosts` entry in the `daemon.json`, this causes a
configuration conflict (as in the above message) and Docker fails to start.
@y
One notable example of a configuration conflict that's difficult to
troubleshoot is when you want to specify a different daemon address from the
default. Docker listens on a socket by default. On Debian and Ubuntu systems
using `systemd`, this means that a host flag `-H` is always used when starting
`dockerd`. If you specify a `hosts` entry in the `daemon.json`, this causes a
configuration conflict (as in the above message) and Docker fails to start.
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
such as [configuring a HTTP or HTTPS proxy](systemd.md#httphttps-proxy).
@y
There are other times when you might need to configure `systemd` with Docker,
such as [configuring a HTTP or HTTPS proxy](systemd.md#httphttps-proxy).
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
<!-- prettier-ignore -->
> **Important**
> 
> Setting `hosts` in the `daemon.json` isn't supported on Docker
> Desktop for Windows or Docker Desktop for Mac.
{ .important }
@y
<!-- prettier-ignore -->
> **Important**
> 
> Setting `hosts` in the `daemon.json` isn't supported on Docker
> Desktop for Windows or Docker Desktop for Mac.
{ .important }
@z

@x
## Out of memory issues
@y
## Out of memory issues
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
## Check whether Docker is running
@y
## Check whether Docker is running
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
