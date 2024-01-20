%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Understand how networking works on Docker Desktop and see the known limitations
keywords: networking, docker desktop, proxy, vpn, Linux, Mac, Windows
title: Explore networking features on Docker Desktop
aliases:
- /desktop/linux/networking/
- /docker-for-mac/networking/
- /mackit/networking/
- /desktop/mac/networking/
- /docker-for-win/networking/
- /docker-for-windows/networking/
- /desktop/windows/networking/
---
@y
---
description: Understand how networking works on Docker Desktop and see the known limitations
keywords: networking, docker desktop, proxy, vpn, Linux, Mac, Windows
title: Explore networking features on Docker Desktop
aliases:
- /desktop/linux/networking/
- /docker-for-mac/networking/
- /mackit/networking/
- /desktop/mac/networking/
- /docker-for-win/networking/
- /docker-for-windows/networking/
- /desktop/windows/networking/
---
@z

@x
Docker Desktop provides several networking features to make it easier to
use.
@y
Docker Desktop provides several networking features to make it easier to
use.
@z

@x
## Features for all platforms
@y
## Features for all platforms
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

@x
```console
$ docker run -p 80:80 -d nginx
```
@y
```console
$ docker run -p 80:80 -d nginx
```
@z

@x
Docker Desktop makes whatever is running on port 80 in the container, in
this case, `nginx`, available on port 80 of `localhost`. In this example, the
host and container ports are the same. If, for example, you already have something running on port 80 of
your host machine, you can connect the container to a different port:
@y
Docker Desktop makes whatever is running on port 80 in the container, in
this case, `nginx`, available on port 80 of `localhost`. In this example, the
host and container ports are the same. If, for example, you already have something running on port 80 of
your host machine, you can connect the container to a different port:
@z

@x
```console
$ docker run -p 8000:80 -d nginx
```
@y
```console
$ docker run -p 8000:80 -d nginx
```
@z

@x
Now, connections to `localhost:8000` are sent to port 80 in the container. The
syntax for `-p` is `HOST_PORT:CLIENT_PORT`.
@y
Now, connections to `localhost:8000` are sent to port 80 in the container. The
syntax for `-p` is `HOST_PORT:CLIENT_PORT`.
@z

@x
### HTTP/HTTPS Proxy support
@y
### HTTP/HTTPS Proxy support
@z

@x
See:
- [Proxies on Linux](settings/linux.md#proxies)
- [Proxies on Mac](settings/mac.md#proxies)
- [Proxies on Windows](settings/windows.md#proxies)
@y
See:
- [Proxies on Linux](settings/linux.md#proxies)
- [Proxies on Mac](settings/mac.md#proxies)
- [Proxies on Windows](settings/windows.md#proxies)
@z

@x
## Features for Mac and Linux
@y
## Features for Mac and Linux
@z

@x
### SSH agent forwarding
@y
### SSH agent forwarding
@z

@x
Docker Desktop on Mac and Linux allows you to use the host’s SSH agent inside a container. To do this:
@y
Docker Desktop on Mac and Linux allows you to use the host’s SSH agent inside a container. To do this:
@z

@x
1. Bind mount the SSH agent socket by adding the following parameter to your `docker run` command:
@y
1. Bind mount the SSH agent socket by adding the following parameter to your `docker run` command:
@z

@x
   ```console
   $--mount type=bind,src=/run/host-services/ssh-auth.sock,target=/run/host-services/ssh-auth.sock
   ```
@y
   ```console
   $--mount type=bind,src=/run/host-services/ssh-auth.sock,target=/run/host-services/ssh-auth.sock
   ```
@z

@x
2. Add the `SSH_AUTH_SOCK` environment variable in your container:
@y
2. Add the `SSH_AUTH_SOCK` environment variable in your container:
@z

@x
    ```console
    $ -e SSH_AUTH_SOCK="/run/host-services/ssh-auth.sock"
    ```
@y
    ```console
    $ -e SSH_AUTH_SOCK="/run/host-services/ssh-auth.sock"
    ```
@z

@x
To enable the SSH agent in Docker Compose, add the following flags to your service:
@y
To enable the SSH agent in Docker Compose, add the following flags to your service:
@z

@x
 ```yaml
services:
  web:
    image: nginx:alpine
    volumes:
      - type: bind
        source: /run/host-services/ssh-auth.sock
        target: /run/host-services/ssh-auth.sock
    environment:
      - SSH_AUTH_SOCK=/run/host-services/ssh-auth.sock
 ```
@y
 ```yaml
services:
  web:
    image: nginx:alpine
    volumes:
      - type: bind
        source: /run/host-services/ssh-auth.sock
        target: /run/host-services/ssh-auth.sock
    environment:
      - SSH_AUTH_SOCK=/run/host-services/ssh-auth.sock
 ```
@z

@x
## Known limitations for all platforms
@y
## Known limitations for all platforms
@z

@x
### Changing internal IP addresses
@y
### Changing internal IP addresses
@z

@x
The internal IP addresses used by Docker can be changed from **Settings**. After changing IPs, it is necessary to reset the Kubernetes cluster and to leave any active Swarm.
@y
The internal IP addresses used by Docker can be changed from **Settings**. After changing IPs, it is necessary to reset the Kubernetes cluster and to leave any active Swarm.
@z

@x
### There is no docker0 bridge on the host
@y
### There is no docker0 bridge on the host
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
The docker bridge network is not reachable from the host.
However if you are a Windows user, it works with Windows containers.
@y
The docker bridge network is not reachable from the host.
However if you are a Windows user, it works with Windows containers.
@z

@x
## Use cases and workarounds for all platforms
@y
## Use cases and workarounds for all platforms
@z

@x
### I want to connect from a container to a service on the host
@y
### I want to connect from a container to a service on the host
@z

@x
The host has a changing IP address, or none if you have no network access.
We recommend that you connect to the special DNS name `host.docker.internal`,
which resolves to the internal IP address used by the host.
@y
The host has a changing IP address, or none if you have no network access.
We recommend that you connect to the special DNS name `host.docker.internal`,
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

@x
    ```console
    $ docker run --rm -it alpine sh
    # apk add curl
    # curl http://host.docker.internal:8000
    # exit
    ```
@y
    ```console
    $ docker run --rm -it alpine sh
    # apk add curl
    # curl http://host.docker.internal:8000
    # exit
    ```
@z

@x
#### I want to connect to a container from the host
@y
#### I want to connect to a container from the host
@z

@x
Port forwarding works for `localhost`. `--publish`, `-p`, or `-P` all work.
Ports exposed from Linux are forwarded to the host.
@y
Port forwarding works for `localhost`. `--publish`, `-p`, or `-P` all work.
Ports exposed from Linux are forwarded to the host.
@z

@x
We recommend you publish a port, or to connect from another
container. This is what you need to do even on Linux if the container is on an
overlay network, not a bridge network, as these are not routed.
@y
We recommend you publish a port, or to connect from another
container. This is what you need to do even on Linux if the container is on an
overlay network, not a bridge network, as these are not routed.
@z

@x
For example, to run an `nginx` webserver:
@y
For example, to run an `nginx` webserver:
@z

@x
```console
$ docker run -d -p 80:80 --name webserver nginx
```
@y
```console
$ docker run -d -p 80:80 --name webserver nginx
```
@z

@x
To clarify the syntax, the following two commands both publish container's port `80` to host's port `8000`:
@y
To clarify the syntax, the following two commands both publish container's port `80` to host's port `8000`:
@z

@x
```console
$ docker run --publish 8000:80 --name webserver nginx
@y
```console
$ docker run --publish 8000:80 --name webserver nginx
@z

@x
$ docker run -p 8000:80 --name webserver nginx
```
@y
$ docker run -p 8000:80 --name webserver nginx
```
@z

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
```console
$ docker run -d -P --name webserver nginx
```
@y
```console
$ docker run -d -P --name webserver nginx
```
@z

@x
See the [run command](../engine/reference/commandline/container_run.md) for more details on
publish options used with `docker run`.
@y
See the [run command](../engine/reference/commandline/container_run.md) for more details on
publish options used with `docker run`.
@z
