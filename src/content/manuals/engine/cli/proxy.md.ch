%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Use a proxy server with the Docker CLI
linkTitle: Proxy configuration
@y
title: Use a proxy server with the Docker CLI
linkTitle: Proxy configuration
@z

@x
description: How to configure the Docker client CLI to use a proxy server
keywords: network, networking, proxy, client
@y
description: How to configure the Docker client CLI to use a proxy server
keywords: network, networking, proxy, client
@z

@x
This page describes how to configure the Docker CLI to use proxies via
environment variables in containers.
@y
This page describes how to configure the Docker CLI to use proxies via
environment variables in containers.
@z

@x
This page doesn't describe how to configure proxies for the Docker daemon.
For instructions on configuring Docker Desktop to use HTTP/HTTPS proxies, see
[proxies on Mac](/manuals/desktop/settings/mac.md#proxies),
[proxies on Windows](/manuals/desktop/settings/windows.md#proxies), and
[proxies on Linux](/manuals/desktop/settings/linux.md#proxies).
@y
This page doesn't describe how to configure proxies for the Docker daemon.
For instructions on configuring Docker Desktop to use HTTP/HTTPS proxies, see
[proxies on Mac](manuals/desktop/settings/mac.md#proxies),
[proxies on Windows](manuals/desktop/settings/windows.md#proxies), and
[proxies on Linux](manuals/desktop/settings/linux.md#proxies).
@z

@x
If you're running Docker Engine without Docker Desktop, refer to
[Configure the Docker daemon to use a proxy](/manuals/engine/daemon/proxy.md)
to learn how to configure a proxy server for the Docker daemon (`dockerd`) itself.
@y
If you're running Docker Engine without Docker Desktop, refer to
[Configure the Docker daemon to use a proxy](manuals/engine/daemon/proxy.md)
to learn how to configure a proxy server for the Docker daemon (`dockerd`) itself.
@z

@x
If your container needs to use an HTTP, HTTPS, or FTP proxy server, you can
configure it in different ways:
@y
If your container needs to use an HTTP, HTTPS, or FTP proxy server, you can
configure it in different ways:
@z

@x
- [Configure the Docker client](#configure-the-docker-client)
- [Set proxy using the CLI](#set-proxy-using-the-cli)
@y
- [Configure the Docker client](#configure-the-docker-client)
- [Set proxy using the CLI](#set-proxy-using-the-cli)
@z

@x
> [!NOTE]
>
> Unfortunately, there's no standard that defines how web clients should handle proxy 
> environment variables, or the format for defining them.
>
> If you're interested in the history of these variables, check out this blog
> post on the subject, by the GitLab team:
> [We need to talk: Can we standardize NO_PROXY?](https://about.gitlab.com/blog/2021/01/27/we-need-to-talk-no-proxy/).
@y
> [!NOTE]
>
> Unfortunately, there's no standard that defines how web clients should handle proxy 
> environment variables, or the format for defining them.
>
> If you're interested in the history of these variables, check out this blog
> post on the subject, by the GitLab team:
> [We need to talk: Can we standardize NO_PROXY?](https://about.gitlab.com/blog/2021/01/27/we-need-to-talk-no-proxy/).
@z

@x
## Configure the Docker client
@y
## Configure the Docker client
@z

@x
You can add proxy configurations for the Docker client using a JSON
configuration file, located in `~/.docker/config.json`.
Builds and containers use the configuration specified in this file.
@y
You can add proxy configurations for the Docker client using a JSON
configuration file, located in `~/.docker/config.json`.
Builds and containers use the configuration specified in this file.
@z

@x
```json
{
 "proxies": {
   "default": {
     "httpProxy": "http://proxy.example.com:3128",
     "httpsProxy": "https://proxy.example.com:3129",
     "noProxy": "*.test.example.com,.example.org,127.0.0.0/8"
   }
 }
}
```
@y
```json
{
 "proxies": {
   "default": {
     "httpProxy": "http://proxy.example.com:3128",
     "httpsProxy": "https://proxy.example.com:3129",
     "noProxy": "*.test.example.com,.example.org,127.0.0.0/8"
   }
 }
}
```
@z

@x
> [!WARNING]
>
> Proxy settings may contain sensitive information. For example, some proxy servers
> require authentication information to be included in their URL, or their
> address may expose IP-addresses or hostnames of your company's environment.
>
> Environment variables are stored as plain text in the container's configuration,
> and as such can be inspected through the remote API or committed to an image
> when using `docker commit`.
@y
> [!WARNING]
>
> Proxy settings may contain sensitive information. For example, some proxy servers
> require authentication information to be included in their URL, or their
> address may expose IP-addresses or hostnames of your company's environment.
>
> Environment variables are stored as plain text in the container's configuration,
> and as such can be inspected through the remote API or committed to an image
> when using `docker commit`.
@z

@x
The configuration becomes active after saving the file, you don't need to
restart Docker. However, the configuration only applies to new containers and
builds, and doesn't affect existing containers.
@y
The configuration becomes active after saving the file, you don't need to
restart Docker. However, the configuration only applies to new containers and
builds, and doesn't affect existing containers.
@z

@x
The following table describes the available configuration parameters.
@y
The following table describes the available configuration parameters.
@z

@x
| Property     | Description                                                                         |
| :----------- | :---------------------------------------------------------------------------------- |
| `httpProxy`  | Sets the `HTTP_PROXY` and `http_proxy` environment variables and build arguments.   |
| `httpsProxy` | Sets the `HTTPS_PROXY` and `https_proxy` environment variables and build arguments. |
| `ftpProxy`   | Sets the `FTP_PROXY` and `ftp_proxy` environment variables and build arguments.     |
| `noProxy`    | Sets the `NO_PROXY` and `no_proxy` environment variables and build arguments.       |
| `allProxy`   | Sets the `ALL_PROXY` and `all_proxy` environment variables and build arguments.     |
@y
| Property     | Description                                                                         |
| :----------- | :---------------------------------------------------------------------------------- |
| `httpProxy`  | Sets the `HTTP_PROXY` and `http_proxy` environment variables and build arguments.   |
| `httpsProxy` | Sets the `HTTPS_PROXY` and `https_proxy` environment variables and build arguments. |
| `ftpProxy`   | Sets the `FTP_PROXY` and `ftp_proxy` environment variables and build arguments.     |
| `noProxy`    | Sets the `NO_PROXY` and `no_proxy` environment variables and build arguments.       |
| `allProxy`   | Sets the `ALL_PROXY` and `all_proxy` environment variables and build arguments.     |
@z

@x
These settings are used to configure proxy environment variables for containers
only, and not used as proxy settings for the Docker CLI or the Docker Engine
itself.
Refer to the [environment variables](/reference/cli/docker/#environment-variables)
and [configure the Docker daemon to use a proxy server](/manuals/engine/daemon/proxy.md)
sections for configuring proxy settings for the CLI and daemon.
@y
These settings are used to configure proxy environment variables for containers
only, and not used as proxy settings for the Docker CLI or the Docker Engine
itself.
Refer to the [environment variables](__SUBDIR__/reference/cli/docker/#environment-variables)
and [configure the Docker daemon to use a proxy server](manuals/engine/daemon/proxy.md)
sections for configuring proxy settings for the CLI and daemon.
@z

@x
### Run containers with a proxy configuration
@y
### Run containers with a proxy configuration
@z

@x
When you start a container, its proxy-related environment variable are set
to reflect your proxy configuration in `~/.docker/config.json`.
@y
When you start a container, its proxy-related environment variable are set
to reflect your proxy configuration in `~/.docker/config.json`.
@z

@x
For example, assuming a proxy configuration like the example
shown in the [earlier section](#configure-the-docker-client), environment
variables for containers that you run are set as follows:
@y
For example, assuming a proxy configuration like the example
shown in the [earlier section](#configure-the-docker-client), environment
variables for containers that you run are set as follows:
@z

@x
```console
$ docker run --rm alpine sh -c 'env | grep -i  _PROXY'
https_proxy=http://proxy.example.com:3129
HTTPS_PROXY=http://proxy.example.com:3129
http_proxy=http://proxy.example.com:3128
HTTP_PROXY=http://proxy.example.com:3128
no_proxy=*.test.example.com,.example.org,127.0.0.0/8
NO_PROXY=*.test.example.com,.example.org,127.0.0.0/8
```
@y
```console
$ docker run --rm alpine sh -c 'env | grep -i  _PROXY'
https_proxy=http://proxy.example.com:3129
HTTPS_PROXY=http://proxy.example.com:3129
http_proxy=http://proxy.example.com:3128
HTTP_PROXY=http://proxy.example.com:3128
no_proxy=*.test.example.com,.example.org,127.0.0.0/8
NO_PROXY=*.test.example.com,.example.org,127.0.0.0/8
```
@z

@x
### Build with a proxy configuration
@y
### Build with a proxy configuration
@z

@x
When you invoke a build, proxy-related build arguments are pre-populated
automatically, based on the proxy settings in your Docker client configuration
file.
@y
When you invoke a build, proxy-related build arguments are pre-populated
automatically, based on the proxy settings in your Docker client configuration
file.
@z

@x
Assuming a proxy configuration like the example shown in the
[earlier section](#configure-the-docker-client), environment
are set as follows during builds:
@y
Assuming a proxy configuration like the example shown in the
[earlier section](#configure-the-docker-client), environment
are set as follows during builds:
@z

@x
```console
$ docker build \
  --no-cache \
  --progress=plain \
  - <<EOF
FROM alpine
RUN env | grep -i _PROXY
EOF
```
@y
```console
$ docker build \
  --no-cache \
  --progress=plain \
  - <<EOF
FROM alpine
RUN env | grep -i _PROXY
EOF
```
@z

@x
```console
#5 [2/2] RUN env | grep -i _PROXY
#5 0.100 HTTPS_PROXY=https://proxy.example.com:3129
#5 0.100 no_proxy=*.test.example.com,.example.org,127.0.0.0/8
#5 0.100 NO_PROXY=*.test.example.com,.example.org,127.0.0.0/8
#5 0.100 https_proxy=https://proxy.example.com:3129
#5 0.100 http_proxy=http://proxy.example.com:3128
#5 0.100 HTTP_PROXY=http://proxy.example.com:3128
#5 DONE 0.1s
```
@y
```console
#5 [2/2] RUN env | grep -i _PROXY
#5 0.100 HTTPS_PROXY=https://proxy.example.com:3129
#5 0.100 no_proxy=*.test.example.com,.example.org,127.0.0.0/8
#5 0.100 NO_PROXY=*.test.example.com,.example.org,127.0.0.0/8
#5 0.100 https_proxy=https://proxy.example.com:3129
#5 0.100 http_proxy=http://proxy.example.com:3128
#5 0.100 HTTP_PROXY=http://proxy.example.com:3128
#5 DONE 0.1s
```
@z

@x
### Configure proxy settings per daemon
@y
### Configure proxy settings per daemon
@z

@x
The `default` key under `proxies` in `~/.docker/config.json` configures the proxy
settings for all daemons that the client connects to.
To configure the proxies for individual daemons,
use the address of the daemon instead of the `default` key.
@y
The `default` key under `proxies` in `~/.docker/config.json` configures the proxy
settings for all daemons that the client connects to.
To configure the proxies for individual daemons,
use the address of the daemon instead of the `default` key.
@z

@x
The following example configures both a default proxy config,
and a no-proxy override for the Docker daemon on address
`tcp://docker-daemon1.example.com`:
@y
The following example configures both a default proxy config,
and a no-proxy override for the Docker daemon on address
`tcp://docker-daemon1.example.com`:
@z

@x
```json
{
 "proxies": {
   "default": {
     "httpProxy": "http://proxy.example.com:3128",
     "httpsProxy": "https://proxy.example.com:3129",
     "noProxy": "*.test.example.com,.example.org,127.0.0.0/8"
   },
   "tcp://docker-daemon1.example.com": {
     "noProxy": "*.internal.example.net"
   }
 }
}
```
@y
```json
{
 "proxies": {
   "default": {
     "httpProxy": "http://proxy.example.com:3128",
     "httpsProxy": "https://proxy.example.com:3129",
     "noProxy": "*.test.example.com,.example.org,127.0.0.0/8"
   },
   "tcp://docker-daemon1.example.com": {
     "noProxy": "*.internal.example.net"
   }
 }
}
```
@z

@x
## Set proxy using the CLI
@y
## Set proxy using the CLI
@z

@x
Instead of [configuring the Docker client](#configure-the-docker-client),
you can specify proxy configurations on the command-line when you invoke the
`docker build` and `docker run` commands.
@y
Instead of [configuring the Docker client](#configure-the-docker-client),
you can specify proxy configurations on the command-line when you invoke the
`docker build` and `docker run` commands.
@z

@x
Proxy configuration on the command-line uses the `--build-arg` flag for builds,
and the `--env` flag for when you want to run containers with a proxy.
@y
Proxy configuration on the command-line uses the `--build-arg` flag for builds,
and the `--env` flag for when you want to run containers with a proxy.
@z

@x
```console
$ docker build --build-arg HTTP_PROXY="http://proxy.example.com:3128" .
$ docker run --env HTTP_PROXY="http://proxy.example.com:3128" redis
```
@y
```console
$ docker build --build-arg HTTP_PROXY="http://proxy.example.com:3128" .
$ docker run --env HTTP_PROXY="http://proxy.example.com:3128" redis
```
@z

@x
For a list of all the proxy-related build arguments that you can use with the
`docker build` command, see
[Predefined ARGs](/reference/dockerfile.md#predefined-args).
These proxy values are only available in the build container.
They're not included in the build output.
@y
For a list of all the proxy-related build arguments that you can use with the
`docker build` command, see
[Predefined ARGs](reference/dockerfile.md#predefined-args).
These proxy values are only available in the build container.
They're not included in the build output.
@z

@x
## Proxy as environment variable for builds
@y
## Proxy as environment variable for builds
@z

@x
Don't use the `ENV` Dockerfile instruction to specify proxy settings for builds.
Use build arguments instead.
@y
Don't use the `ENV` Dockerfile instruction to specify proxy settings for builds.
Use build arguments instead.
@z

@x
Using environment variables for proxies embeds the configuration into the image.
If the proxy is an internal proxy, it might not be accessible for containers
created from that image.
@y
Using environment variables for proxies embeds the configuration into the image.
If the proxy is an internal proxy, it might not be accessible for containers
created from that image.
@z

@x
Embedding proxy settings in images also poses a security risk, as the values
may include sensitive information.
@y
Embedding proxy settings in images also poses a security risk, as the values
may include sensitive information.
@z
