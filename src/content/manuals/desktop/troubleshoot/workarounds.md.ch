%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Common workarounds
keywords: linux, mac, windows, troubleshooting, workarounds, Docker Desktop
title: Workarounds for common problems
tags: [ Troubleshooting ]
---
@y
---
description: Common workarounds
keywords: linux, mac, windows, troubleshooting, workarounds, Docker Desktop
title: Workarounds for common problems
tags: [ Troubleshooting ]
---
@z

@x
### Reboot
@y
### Reboot
@z

@x
Restart your PC to stop / discard any vestige of the daemon running from the
previously installed version.
@y
Restart your PC to stop / discard any vestige of the daemon running from the
previously installed version.
@z

@x
### Unset `DOCKER_HOST`
@y
### Unset `DOCKER_HOST`
@z

@x
The `DOCKER_HOST` environmental variable does not need to be set.  If you use
bash, use the command `unset ${!DOCKER_*}` to unset it.  For other shells,
consult the shell's documentation.
@y
The `DOCKER_HOST` environmental variable does not need to be set.  If you use
bash, use the command `unset ${!DOCKER_*}` to unset it.  For other shells,
consult the shell's documentation.
@z

@x
### Make sure Docker is running for webserver examples
@y
### Make sure Docker is running for webserver examples
@z

@x
For the `hello-world-nginx` example and others, Docker Desktop must be
running to get to the webserver on `http://localhost/`. Make sure that the
Docker whale is showing in the menu bar, and that you run the Docker commands in
a shell that is connected to the Docker Desktop Engine. Otherwise, you might start the webserver container but get a "web page
not available" error when you go to `docker`.
@y
For the `hello-world-nginx` example and others, Docker Desktop must be
running to get to the webserver on `http://localhost/`. Make sure that the
Docker whale is showing in the menu bar, and that you run the Docker commands in
a shell that is connected to the Docker Desktop Engine. Otherwise, you might start the webserver container but get a "web page
not available" error when you go to `docker`.
@z

@x
### How to solve `port already allocated` errors
@y
### How to solve `port already allocated` errors
@z

@x
If you see errors like `Bind for 0.0.0.0:8080 failed: port is already allocated`
or `listen tcp:0.0.0.0:8080: bind: address is already in use` ...
@y
If you see errors like `Bind for 0.0.0.0:8080 failed: port is already allocated`
or `listen tcp:0.0.0.0:8080: bind: address is already in use` ...
@z

@x
These errors are often caused by some other software on Windows using those
ports. To discover the identity of this software, either use the `resmon.exe`
GUI and click "Network" and then "Listening Ports" or in a PowerShell use
`netstat -aon | find /i "listening "` to discover the PID of the process
currently using the port (the PID is the number in the rightmost column). Decide
whether to shut the other process down, or to use a different port in your
docker app.
@y
These errors are often caused by some other software on Windows using those
ports. To discover the identity of this software, either use the `resmon.exe`
GUI and click "Network" and then "Listening Ports" or in a PowerShell use
`netstat -aon | find /i "listening "` to discover the PID of the process
currently using the port (the PID is the number in the rightmost column). Decide
whether to shut the other process down, or to use a different port in your
docker app.
@z

@x
### Docker Desktop fails to start when anti-virus software is installed
@y
### Docker Desktop fails to start when anti-virus software is installed
@z

@x
Some anti-virus software may be incompatible with Hyper-V and Microsoft
Windows 10 builds. The conflict
typically occurs after a Windows update and
manifests as an error response from the Docker daemon and a Docker Desktop start failure.
@y
Some anti-virus software may be incompatible with Hyper-V and Microsoft
Windows 10 builds. The conflict
typically occurs after a Windows update and
manifests as an error response from the Docker daemon and a Docker Desktop start failure.
@z

@x
For a temporary workaround, uninstall the anti-virus software, or
explore other workarounds suggested on Docker Desktop forums.
@y
For a temporary workaround, uninstall the anti-virus software, or
explore other workarounds suggested on Docker Desktop forums.
@z
