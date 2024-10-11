%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Networking using the host network
description: Tutorials for networking using the host network, disabling network isolation
keywords: networking, host, standalone
@y
title: Networking using the host network
description: Tutorials for networking using the host network, disabling network isolation
keywords: networking, host, standalone
@z

@x
This series of tutorials deals with networking standalone containers which bind
directly to the Docker host's network, with no network isolation. For other
networking topics, see the [overview](/manuals/engine/network/_index.md).
@y
This series of tutorials deals with networking standalone containers which bind
directly to the Docker host's network, with no network isolation. For other
networking topics, see the [overview](manuals/engine/network/_index.md).
@z

@x
## Goal
@y
## Goal
@z

@x
The goal of this tutorial is to start a `nginx` container which binds directly
to port 80 on the Docker host. From a networking point of view, this is the
same level of isolation as if the `nginx` process were running directly on the
Docker host and not in a container. However, in all other ways, such as storage,
process namespace, and user namespace, the `nginx` process is isolated from the
host.
@y
The goal of this tutorial is to start a `nginx` container which binds directly
to port 80 on the Docker host. From a networking point of view, this is the
same level of isolation as if the `nginx` process were running directly on the
Docker host and not in a container. However, in all other ways, such as storage,
process namespace, and user namespace, the `nginx` process is isolated from the
host.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- This procedure requires port 80 to be available on the Docker host. To make
  Nginx listen on a different port, see the
  [documentation for the `nginx` image](https://hub.docker.com/_/nginx/)
@y
- This procedure requires port 80 to be available on the Docker host. To make
  Nginx listen on a different port, see the
  [documentation for the `nginx` image](https://hub.docker.com/_/nginx/)
@z

@x
- The `host` networking driver only works on Linux hosts, but is available as a
  [beta feature](/manuals/release-lifecycle.md#beta) on Docker Desktop version 4.29
  and later for Mac, Windows, and Linux. To enable this feature, navigate to the
  **Resources** tab in **Settings**, and then under **Network** select **Enable host networking**.
@y
- The `host` networking driver only works on Linux hosts, but is available as a
  [beta feature](/manuals/release-lifecycle.md#beta) on Docker Desktop version 4.29
  and later for Mac, Windows, and Linux. To enable this feature, navigate to the
  **Resources** tab in **Settings**, and then under **Network** select **Enable host networking**.
@z

@x
## Procedure
@y
## Procedure
@z

@x
1.  Create and start the container as a detached process. The `--rm` option means to remove the container once it exits/stops. The `-d` flag means to start the container detached (in the background). 
@y
1.  Create and start the container as a detached process. The `--rm` option means to remove the container once it exits/stops. The `-d` flag means to start the container detached (in the background). 
@z

@x
    ```console
    $ docker run --rm -d --network host --name my_nginx nginx
    ```
@y
    ```console
    $ docker run --rm -d --network host --name my_nginx nginx
    ```
@z

@x
2.  Access Nginx by browsing to
    [http://localhost:80/](http://localhost:80/).
@y
2.  Access Nginx by browsing to
    [http://localhost:80/](http://localhost:80/).
@z

@x
3.  Examine your network stack using the following commands:
@y
3.  Examine your network stack using the following commands:
@z

@x
    - Examine all network interfaces and verify that a new one was not created.
@y
    - Examine all network interfaces and verify that a new one was not created.
@z

@x
      ```console
      $ ip addr show
      ```
@y
      ```console
      $ ip addr show
      ```
@z

@x
    - Verify which process is bound to port 80, using the `netstat` command. You
      need to use `sudo` because the process is owned by the Docker daemon user
      and you otherwise won't be able to see its name or PID.
@y
    - Verify which process is bound to port 80, using the `netstat` command. You
      need to use `sudo` because the process is owned by the Docker daemon user
      and you otherwise won't be able to see its name or PID.
@z

@x
      ```console
      $ sudo netstat -tulpn | grep :80
      ```
@y
      ```console
      $ sudo netstat -tulpn | grep :80
      ```
@z

@x
4.  Stop the container. It will be removed automatically as it was started using the `--rm` option.
@y
4.  Stop the container. It will be removed automatically as it was started using the `--rm` option.
@z

@x
    ```console
    docker container stop my_nginx
    ```
@y
    ```console
    docker container stop my_nginx
    ```
@z

@x
## Other networking tutorials
@y
## Other networking tutorials
@z

@x
- [Standalone networking tutorial](/manuals/engine/network/tutorials/standalone.md)
- [Overlay networking tutorial](/manuals/engine/network/tutorials/overlay.md)
- [Macvlan networking tutorial](/manuals/engine/network/tutorials/macvlan.md)
@y
- [Standalone networking tutorial](manuals/engine/network/tutorials/standalone.md)
- [Overlay networking tutorial](manuals/engine/network/tutorials/overlay.md)
- [Macvlan networking tutorial](manuals/engine/network/tutorials/macvlan.md)
@z
