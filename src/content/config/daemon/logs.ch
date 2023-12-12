%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Read the daemon logs
description: How to read the event logs for the Docker daemon
keywords: docker, daemon, configuration, troubleshooting, logging
---
@y
---
title: Read the daemon logs
description: How to read the event logs for the Docker daemon
keywords: docker, daemon, configuration, troubleshooting, logging
---
@z

@x
The daemon logs may help you diagnose problems. The logs may be saved in one of
a few locations, depending on the operating system configuration and the logging
subsystem used:
@y
The daemon logs may help you diagnose problems. The logs may be saved in one of
a few locations, depending on the operating system configuration and the logging
subsystem used:
@z

@x
| Operating system                   | Location                                                                                                                                 |
| :--------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------- |
| Linux                              | Use the command `journalctl -xu docker.service` (or read `/var/log/syslog` or `/var/log/messages`, depending on your Linux Distribution) |
| macOS (`dockerd` logs)             | `~/Library/Containers/com.docker.docker/Data/log/vm/dockerd.log`                                                                         |
| macOS (`containerd` logs)          | `~/Library/Containers/com.docker.docker/Data/log/vm/containerd.log`                                                                      |
| Windows (WSL2) (`dockerd` logs)    | `%LOCALAPPDATA%\Docker\log\vm\dockerd.log`                                                                                               |
| Windows (WSL2) (`containerd` logs) | `%LOCALAPPDATA%\Docker\log\vm\containerd.log`                                                                                            |
| Windows (Windows containers)       | Logs are in the Windows Event Log                                                                                                        |
@y
| Operating system                   | Location                                                                                                                                 |
| :--------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------- |
| Linux                              | Use the command `journalctl -xu docker.service` (or read `/var/log/syslog` or `/var/log/messages`, depending on your Linux Distribution) |
| macOS (`dockerd` logs)             | `~/Library/Containers/com.docker.docker/Data/log/vm/dockerd.log`                                                                         |
| macOS (`containerd` logs)          | `~/Library/Containers/com.docker.docker/Data/log/vm/containerd.log`                                                                      |
| Windows (WSL2) (`dockerd` logs)    | `%LOCALAPPDATA%\Docker\log\vm\dockerd.log`                                                                                               |
| Windows (WSL2) (`containerd` logs) | `%LOCALAPPDATA%\Docker\log\vm\containerd.log`                                                                                            |
| Windows (Windows containers)       | Logs are in the Windows Event Log                                                                                                        |
@z

@x
To view the `dockerd` logs on macOS, open a terminal Window, and use the `tail`
command with the `-f` flag to "follow" the logs. Logs will be printed until you
terminate the command using `CTRL+c`:
@y
To view the `dockerd` logs on macOS, open a terminal Window, and use the `tail`
command with the `-f` flag to "follow" the logs. Logs will be printed until you
terminate the command using `CTRL+c`:
@z

@x
```console
$ tail -f ~/Library/Containers/com.docker.docker/Data/log/vm/dockerd.log
2021-07-28T10:21:21Z dockerd time="2021-07-28T10:21:21.497642089Z" level=debug msg="attach: stdout: begin"
2021-07-28T10:21:21Z dockerd time="2021-07-28T10:21:21.497714291Z" level=debug msg="attach: stderr: begin"
2021-07-28T10:21:21Z dockerd time="2021-07-28T10:21:21.499798390Z" level=debug msg="Calling POST /v1.41/containers/35fc5ec0ffe1ad492d0a4fbf51fd6286a087b89d4dd66367fa3b7aec70b46a40/wait?condition=removed"
2021-07-28T10:21:21Z dockerd time="2021-07-28T10:21:21.518403686Z" level=debug msg="Calling GET /v1.41/containers/35fc5ec0ffe1ad492d0a4fbf51fd6286a087b89d4dd66367fa3b7aec70b46a40/json"
2021-07-28T10:21:21Z dockerd time="2021-07-28T10:21:21.527074928Z" level=debug msg="Calling POST /v1.41/containers/35fc5ec0ffe1ad492d0a4fbf51fd6286a087b89d4dd66367fa3b7aec70b46a40/start"
2021-07-28T10:21:21Z dockerd time="2021-07-28T10:21:21.528203579Z" level=debug msg="container mounted via layerStore: &{/var/lib/docker/overlay2/6e76ffecede030507fcaa576404e141e5f87fc4d7e1760e9ce5b52acb24
...
^C
```
@y
```console
$ tail -f ~/Library/Containers/com.docker.docker/Data/log/vm/dockerd.log
2021-07-28T10:21:21Z dockerd time="2021-07-28T10:21:21.497642089Z" level=debug msg="attach: stdout: begin"
2021-07-28T10:21:21Z dockerd time="2021-07-28T10:21:21.497714291Z" level=debug msg="attach: stderr: begin"
2021-07-28T10:21:21Z dockerd time="2021-07-28T10:21:21.499798390Z" level=debug msg="Calling POST /v1.41/containers/35fc5ec0ffe1ad492d0a4fbf51fd6286a087b89d4dd66367fa3b7aec70b46a40/wait?condition=removed"
2021-07-28T10:21:21Z dockerd time="2021-07-28T10:21:21.518403686Z" level=debug msg="Calling GET /v1.41/containers/35fc5ec0ffe1ad492d0a4fbf51fd6286a087b89d4dd66367fa3b7aec70b46a40/json"
2021-07-28T10:21:21Z dockerd time="2021-07-28T10:21:21.527074928Z" level=debug msg="Calling POST /v1.41/containers/35fc5ec0ffe1ad492d0a4fbf51fd6286a087b89d4dd66367fa3b7aec70b46a40/start"
2021-07-28T10:21:21Z dockerd time="2021-07-28T10:21:21.528203579Z" level=debug msg="container mounted via layerStore: &{/var/lib/docker/overlay2/6e76ffecede030507fcaa576404e141e5f87fc4d7e1760e9ce5b52acb24
...
^C
```
@z

@x
## Enable debugging
@y
## Enable debugging
@z

@x
There are two ways to enable debugging. The recommended approach is to set the
`debug` key to `true` in the `daemon.json` file. This method works for every
Docker platform.
@y
There are two ways to enable debugging. The recommended approach is to set the
`debug` key to `true` in the `daemon.json` file. This method works for every
Docker platform.
@z

@x
1.  Edit the `daemon.json` file, which is usually located in `/etc/docker/`. You
    may need to create this file, if it doesn't yet exist. On macOS or Windows,
    don't edit the file directly. Instead, edit the file through the Docker Desktop settings.
@y
1.  Edit the `daemon.json` file, which is usually located in `/etc/docker/`. You
    may need to create this file, if it doesn't yet exist. On macOS or Windows,
    don't edit the file directly. Instead, edit the file through the Docker Desktop settings.
@z

@x
2.  If the file is empty, add the following:
@y
2.  If the file is empty, add the following:
@z

@x
    ```json
    {
      "debug": true
    }
    ```
@y
    ```json
    {
      "debug": true
    }
    ```
@z

@x
    If the file already contains JSON, just add the key `"debug": true`, being
    careful to add a comma to the end of the line if it's not the last line
    before the closing bracket. Also verify that if the `log-level` key is set,
    it's set to either `info` or `debug`. `info` is the default, and possible
    values are `debug`, `info`, `warn`, `error`, `fatal`.
@y
    If the file already contains JSON, just add the key `"debug": true`, being
    careful to add a comma to the end of the line if it's not the last line
    before the closing bracket. Also verify that if the `log-level` key is set,
    it's set to either `info` or `debug`. `info` is the default, and possible
    values are `debug`, `info`, `warn`, `error`, `fatal`.
@z

@x
3.  Send a `HUP` signal to the daemon to cause it to reload its configuration.
    On Linux hosts, use the following command.
@y
3.  Send a `HUP` signal to the daemon to cause it to reload its configuration.
    On Linux hosts, use the following command.
@z

@x
    ```console
    $ sudo kill -SIGHUP $(pidof dockerd)
    ```
@y
    ```console
    $ sudo kill -SIGHUP $(pidof dockerd)
    ```
@z

@x
    On Windows hosts, restart Docker.
@y
    On Windows hosts, restart Docker.
@z

@x
Instead of following this procedure, you can also stop the Docker daemon and
restart it manually with the debug flag `-D`. However, this may result in Docker
restarting with a different environment than the one the hosts' startup scripts
create, and this may make debugging more difficult.
@y
Instead of following this procedure, you can also stop the Docker daemon and
restart it manually with the debug flag `-D`. However, this may result in Docker
restarting with a different environment than the one the hosts' startup scripts
create, and this may make debugging more difficult.
@z

@x
## Force a stack trace to be logged
@y
## Force a stack trace to be logged
@z

@x
If the daemon is unresponsive, you can force a full stack trace to be logged by
sending a `SIGUSR1` signal to the daemon.
@y
If the daemon is unresponsive, you can force a full stack trace to be logged by
sending a `SIGUSR1` signal to the daemon.
@z

@x
- **Linux**:
@y
- **Linux**:
@z

@x
  ```console
  $ sudo kill -SIGUSR1 $(pidof dockerd)
  ```
@y
  ```console
  $ sudo kill -SIGUSR1 $(pidof dockerd)
  ```
@z

@x
- **Windows Server**:
@y
- **Windows Server**:
@z

@x
  Download [docker-signal](https://github.com/moby/docker-signal).
@y
  Download [docker-signal](https://github.com/moby/docker-signal).
@z

@x
  Get the process ID of dockerd `Get-Process dockerd`.
@y
  Get the process ID of dockerd `Get-Process dockerd`.
@z

@x
  Run the executable with the flag `--pid=<PID of daemon>`.
@y
  Run the executable with the flag `--pid=<PID of daemon>`.
@z

@x
This forces a stack trace to be logged but doesn't stop the daemon. Daemon logs
show the stack trace or the path to a file containing the stack trace if it was
logged to a file.
@y
This forces a stack trace to be logged but doesn't stop the daemon. Daemon logs
show the stack trace or the path to a file containing the stack trace if it was
logged to a file.
@z

@x
The daemon continues operating after handling the `SIGUSR1` signal and dumping
the stack traces to the log. The stack traces can be used to determine the state
of all goroutines and threads within the daemon.
@y
The daemon continues operating after handling the `SIGUSR1` signal and dumping
the stack traces to the log. The stack traces can be used to determine the state
of all goroutines and threads within the daemon.
@z

@x
## View stack traces
@y
## View stack traces
@z

@x
The Docker daemon log can be viewed by using one of the following methods:
@y
The Docker daemon log can be viewed by using one of the following methods:
@z

@x
- By running `journalctl -u docker.service` on Linux systems using `systemctl`
- `/var/log/messages`, `/var/log/daemon.log`, or `/var/log/docker.log` on older
  Linux systems
@y
- By running `journalctl -u docker.service` on Linux systems using `systemctl`
- `/var/log/messages`, `/var/log/daemon.log`, or `/var/log/docker.log` on older
  Linux systems
@z

@x
> **Note**
>
> It isn't possible to manually generate a stack trace on Docker Desktop for
> Mac or Docker Desktop for Windows. However, you can click the Docker taskbar
> icon and choose **Troubleshoot** to send information to Docker if you run into
> issues.
@y
> **Note**
>
> It isn't possible to manually generate a stack trace on Docker Desktop for
> Mac or Docker Desktop for Windows. However, you can click the Docker taskbar
> icon and choose **Troubleshoot** to send information to Docker if you run into
> issues.
@z

@x
Look in the Docker logs for a message like the following:
@y
Look in the Docker logs for a message like the following:
@z

@x
```none
...goroutine stacks written to /var/run/docker/goroutine-stacks-2017-06-02T193336z.log
```
@y
```none
...goroutine stacks written to /var/run/docker/goroutine-stacks-2017-06-02T193336z.log
```
@z

@x
The locations where Docker saves these stack traces and dumps depends on your
operating system and configuration. You can sometimes get useful diagnostic
information straight from the stack traces and dumps. Otherwise, you can provide
this information to Docker for help diagnosing the problem.
@y
The locations where Docker saves these stack traces and dumps depends on your
operating system and configuration. You can sometimes get useful diagnostic
information straight from the stack traces and dumps. Otherwise, you can provide
this information to Docker for help diagnosing the problem.
@z
