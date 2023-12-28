%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Start the daemon
description: Starting the Docker daemon manually
keywords: docker, daemon, configuration, troubleshooting
---
@y
---
title: デーモンの起動
description: Starting the Docker daemon manually
keywords: docker, daemon, configuration, troubleshooting
---
@z

@x
This page shows how to start the daemon, either manually or using OS utilities.
@y
このページではデーモンの起動方法を示します。
手動の場合と OS ユーティリティーを用いる場合のそれぞれを説明します。
@z

@x
## Start the daemon using operating system utilities
@y
## OS ユーティリティーを使ったデーモン起動 {#start-the-daemon-using-operating-system-utilities}
@z

@x
On a typical installation the Docker daemon is started by a system utility, not
manually by a user. This makes it easier to automatically start Docker when the
machine reboots.
@y
On a typical installation the Docker daemon is started by a system utility, not
manually by a user. This makes it easier to automatically start Docker when the
machine reboots.
@z

@x
The command to start Docker depends on your operating system. Check the correct
page under [Install Docker](../../engine/install/index.md).
@y
The command to start Docker depends on your operating system. Check the correct
page under [Install Docker](../../engine/install/index.md).
@z

@x
### Start with systemd
@y
### systemd を使った起動 {#start-with-systemd}
@z

@x
On some operating systems, like Ubuntu and Debian, the Docker daemon service
starts automatically. Use the following command to start it manually:
@y
On some operating systems, like Ubuntu and Debian, the Docker daemon service
starts automatically. Use the following command to start it manually:
@z

@x
```console
$ sudo systemctl start docker
```
@y
```console
$ sudo systemctl start docker
```
@z

@x
If you want Docker to start at boot, see
[Configure Docker to start on boot](../../engine/install/linux-postinstall.md#configure-docker-to-start-on-boot-with-systemd).
@y
If you want Docker to start at boot, see
[Configure Docker to start on boot](../../engine/install/linux-postinstall.md#configure-docker-to-start-on-boot-with-systemd).
@z

@x
## Start the daemon manually
@y
## 手動によるデーモン起動 {#start-the-daemon-manually}
@z

@x
If you don't want to use a system utility to manage the Docker daemon, or just
want to test things out, you can manually run it using the `dockerd` command.
You may need to use `sudo`, depending on your operating system configuration.
@y
If you don't want to use a system utility to manage the Docker daemon, or just
want to test things out, you can manually run it using the `dockerd` command.
You may need to use `sudo`, depending on your operating system configuration.
@z

@x
When you start Docker this way, it runs in the foreground and sends its logs
directly to your terminal.
@y
When you start Docker this way, it runs in the foreground and sends its logs
directly to your terminal.
@z

@x
```console
$ dockerd
@y
```console
$ dockerd
@z

@x
INFO[0000] +job init_networkdriver()
INFO[0000] +job serveapi(unix:///var/run/docker.sock)
INFO[0000] Listening for HTTP on unix (/var/run/docker.sock)
```
@y
INFO[0000] +job init_networkdriver()
INFO[0000] +job serveapi(unix:///var/run/docker.sock)
INFO[0000] Listening for HTTP on unix (/var/run/docker.sock)
```
@z

@x
To stop Docker when you have started it manually, issue a `Ctrl+C` in your
terminal.
@y
手動によりデーモンを起動していた場合、これを停止するには端末画面にて `Ctrl+C` を入力します。
@z
