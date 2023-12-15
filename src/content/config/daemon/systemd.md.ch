%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn about controlling and configuring the Docker daemon using systemd
keywords: dockerd, daemon, systemd, configuration, proxy, networking
title: Configure the daemon with systemd
aliases:
  - /articles/host_integration/
  - /articles/systemd/
  - /engine/admin/systemd/
  - /engine/articles/systemd/
---
@y
---
description: Learn about controlling and configuring the Docker daemon using systemd
keywords: dockerd, daemon, systemd, configuration, proxy, networking
title: Configure the daemon with systemd
aliases:
  - /articles/host_integration/
  - /articles/systemd/
  - /engine/admin/systemd/
  - /engine/articles/systemd/
---
@z

@x
This page describes how to customize daemon settings when using systemd.
@y
This page describes how to customize daemon settings when using systemd.
@z

@x
## Custom Docker daemon options
@y
## Custom Docker daemon options
@z

@x
Most configuration options for the Docker daemon are set using the `daemon.json`
configuration file. See [Docker daemon configuration overview](./index.md) for
more information.
@y
Most configuration options for the Docker daemon are set using the `daemon.json`
configuration file. See [Docker daemon configuration overview](./index.md) for
more information.
@z

@x
## Manually create the systemd unit files
@y
## Manually create the systemd unit files
@z

@x
When installing the binary without a package manager, you may want to integrate
Docker with systemd. For this, install the two unit files (`service` and
`socket`) from
[the GitHub repository](https://github.com/moby/moby/tree/master/contrib/init/systemd)
to `/etc/systemd/system`.
@y
When installing the binary without a package manager, you may want to integrate
Docker with systemd. For this, install the two unit files (`service` and
`socket`) from
[the GitHub repository](https://github.com/moby/moby/tree/master/contrib/init/systemd)
to `/etc/systemd/system`.
@z

@x
### Configure the Docker daemon to use a proxy server {#httphttps-proxy}
@y
### Configure the Docker daemon to use a proxy server {#httphttps-proxy}
@z

@x
The Docker daemon uses the following environment variables in
its start-up environment to configure HTTP or HTTPS proxy behavior:
@y
The Docker daemon uses the following environment variables in
its start-up environment to configure HTTP or HTTPS proxy behavior:
@z

@x
- `HTTP_PROXY`
- `http_proxy`
- `HTTPS_PROXY`
- `https_proxy`
- `NO_PROXY`
- `no_proxy`
@y
- `HTTP_PROXY`
- `http_proxy`
- `HTTPS_PROXY`
- `https_proxy`
- `NO_PROXY`
- `no_proxy`
@z

@x
In Docker Engine version 23.0 and later versions, you may also configure proxy
behavior for the daemon in the [`daemon.json` file](./index.md#configure-the-docker-daemon):
@y
In Docker Engine version 23.0 and later versions, you may also configure proxy
behavior for the daemon in the [`daemon.json` file](./index.md#configure-the-docker-daemon):
@z

@x
```json
{
  "proxies": {
    "http-proxy": "http://proxy.example.com:3128",
    "https-proxy": "https://proxy.example.com:3129",
    "no-proxy": "*.test.example.com,.example.org,127.0.0.0/8"
  }
}
```
@y
```json
{
  "proxies": {
    "http-proxy": "http://proxy.example.com:3128",
    "https-proxy": "https://proxy.example.com:3129",
    "no-proxy": "*.test.example.com,.example.org,127.0.0.0/8"
  }
}
```
@z

@x
These configurations override the default `docker.service` systemd file.
@y
These configurations override the default `docker.service` systemd file.
@z

@x
If you're behind an HTTP or HTTPS proxy server, for example in corporate
settings, the daemon proxy configurations must be specified in the systemd
service file, not in the `daemon.json` file or using environment variables.
@y
If you're behind an HTTP or HTTPS proxy server, for example in corporate
settings, the daemon proxy configurations must be specified in the systemd
service file, not in the `daemon.json` file or using environment variables.
@z

@x
> **Note for rootless mode**
>
> The location of systemd configuration files are different when running Docker
> in [rootless mode](../../engine/security/rootless.md). When running in
> rootless mode, Docker is started as a user-mode systemd service, and uses
> files stored in each users' home directory in
> `~/.config/systemd/user/docker.service.d/`. In addition, `systemctl` must be
> executed without `sudo` and with the `--user` flag. Select the _"rootless
> mode"_ tab below if you are running Docker in rootless mode.
@y
> **Note for rootless mode**
>
> The location of systemd configuration files are different when running Docker
> in [rootless mode](../../engine/security/rootless.md). When running in
> rootless mode, Docker is started as a user-mode systemd service, and uses
> files stored in each users' home directory in
> `~/.config/systemd/user/docker.service.d/`. In addition, `systemctl` must be
> executed without `sudo` and with the `--user` flag. Select the _"rootless
> mode"_ tab below if you are running Docker in rootless mode.
@z

@x
{{< tabs >}}
{{< tab name="regular install" >}}
@y
{{< tabs >}}
{{< tab name="regular install" >}}
@z

@x
1. Create a systemd drop-in directory for the `docker` service:
@y
1. Create a systemd drop-in directory for the `docker` service:
@z

@x
   ```console
   $ sudo mkdir -p /etc/systemd/system/docker.service.d
   ```
@y
   ```console
   $ sudo mkdir -p /etc/systemd/system/docker.service.d
   ```
@z

@x
2. Create a file named `/etc/systemd/system/docker.service.d/http-proxy.conf`
   that adds the `HTTP_PROXY` environment variable:
@y
2. Create a file named `/etc/systemd/system/docker.service.d/http-proxy.conf`
   that adds the `HTTP_PROXY` environment variable:
@z

@x
   ```systemd
   [Service]
   Environment="HTTP_PROXY=http://proxy.example.com:3128"
   ```
@y
   ```systemd
   [Service]
   Environment="HTTP_PROXY=http://proxy.example.com:3128"
   ```
@z

@x
   If you are behind an HTTPS proxy server, set the `HTTPS_PROXY` environment
   variable:
@y
   If you are behind an HTTPS proxy server, set the `HTTPS_PROXY` environment
   variable:
@z

@x
   ```systemd
   [Service]
   Environment="HTTPS_PROXY=https://proxy.example.com:3129"
   ```
@y
   ```systemd
   [Service]
   Environment="HTTPS_PROXY=https://proxy.example.com:3129"
   ```
@z

@x
   Multiple environment variables can be set; to set both a non-HTTPS and a
   HTTPs proxy;
@y
   Multiple environment variables can be set; to set both a non-HTTPS and a
   HTTPs proxy;
@z

@x
   ```systemd
   [Service]
   Environment="HTTP_PROXY=http://proxy.example.com:3128"
   Environment="HTTPS_PROXY=https://proxy.example.com:3129"
   ```
@y
   ```systemd
   [Service]
   Environment="HTTP_PROXY=http://proxy.example.com:3128"
   Environment="HTTPS_PROXY=https://proxy.example.com:3129"
   ```
@z

@x
   > **Note**
   >
   > Special characters in the proxy value, such as `#?!()[]{}`, must be double
   > escaped using `%%`. For example:
   >
   > ```systemd
   > [Service]
   > Environment="HTTP_PROXY=http://domain%%5Cuser:complex%%23pass@proxy.example.com:3128/"
   > ```
@y
   > **Note**
   >
   > Special characters in the proxy value, such as `#?!()[]{}`, must be double
   > escaped using `%%`. For example:
   >
   > ```systemd
   > [Service]
   > Environment="HTTP_PROXY=http://domain%%5Cuser:complex%%23pass@proxy.example.com:3128/"
   > ```
@z

@x
3. If you have internal Docker registries that you need to contact without
   proxying, you can specify them via the `NO_PROXY` environment variable.
@y
3. If you have internal Docker registries that you need to contact without
   proxying, you can specify them via the `NO_PROXY` environment variable.
@z

@x
   The `NO_PROXY` variable specifies a string that contains comma-separated
   values for hosts that should be excluded from proxying. These are the options
   you can specify to exclude hosts:
@y
   The `NO_PROXY` variable specifies a string that contains comma-separated
   values for hosts that should be excluded from proxying. These are the options
   you can specify to exclude hosts:
@z

@x
   - IP address prefix (`1.2.3.4`)
   - Domain name, or a special DNS label (`*`)
   - A domain name matches that name and all subdomains. A domain name with a
     leading "." matches subdomains only. For example, given the domains
     `foo.example.com` and `example.com`:
     - `example.com` matches `example.com` and `foo.example.com`, and
     - `.example.com` matches only `foo.example.com`
   - A single asterisk (`*`) indicates that no proxying should be done
   - Literal port numbers are accepted by IP address prefixes (`1.2.3.4:80`) and
     domain names (`foo.example.com:80`)
@y
   - IP address prefix (`1.2.3.4`)
   - Domain name, or a special DNS label (`*`)
   - A domain name matches that name and all subdomains. A domain name with a
     leading "." matches subdomains only. For example, given the domains
     `foo.example.com` and `example.com`:
     - `example.com` matches `example.com` and `foo.example.com`, and
     - `.example.com` matches only `foo.example.com`
   - A single asterisk (`*`) indicates that no proxying should be done
   - Literal port numbers are accepted by IP address prefixes (`1.2.3.4:80`) and
     domain names (`foo.example.com:80`)
@z

@x
   Example:
@y
   Example:
@z

@x
   ```systemd
   [Service]
   Environment="HTTP_PROXY=http://proxy.example.com:3128"
   Environment="HTTPS_PROXY=https://proxy.example.com:3129"
   Environment="NO_PROXY=localhost,127.0.0.1,docker-registry.example.com,.corp"
   ```
@y
   ```systemd
   [Service]
   Environment="HTTP_PROXY=http://proxy.example.com:3128"
   Environment="HTTPS_PROXY=https://proxy.example.com:3129"
   Environment="NO_PROXY=localhost,127.0.0.1,docker-registry.example.com,.corp"
   ```
@z

@x
4. Flush changes and restart Docker
@y
4. Flush changes and restart Docker
@z

@x
   ```console
   $ sudo systemctl daemon-reload
   $ sudo systemctl restart docker
   ```
@y
   ```console
   $ sudo systemctl daemon-reload
   $ sudo systemctl restart docker
   ```
@z

@x
5. Verify that the configuration has been loaded and matches the changes you
   made, for example:
@y
5. Verify that the configuration has been loaded and matches the changes you
   made, for example:
@z

@x
   ```console
   $ sudo systemctl show --property=Environment docker
@y
   ```console
   $ sudo systemctl show --property=Environment docker
@z

@x
   Environment=HTTP_PROXY=http://proxy.example.com:3128 HTTPS_PROXY=https://proxy.example.com:3129 NO_PROXY=localhost,127.0.0.1,docker-registry.example.com,.corp
   ```
@y
   Environment=HTTP_PROXY=http://proxy.example.com:3128 HTTPS_PROXY=https://proxy.example.com:3129 NO_PROXY=localhost,127.0.0.1,docker-registry.example.com,.corp
   ```
@z

@x
{{< /tab >}}
{{< tab name="rootless mode" >}}
@y
{{< /tab >}}
{{< tab name="rootless mode" >}}
@z

@x
1. Create a systemd drop-in directory for the `docker` service:
@y
1. Create a systemd drop-in directory for the `docker` service:
@z

@x
   ```console
   $ mkdir -p ~/.config/systemd/user/docker.service.d
   ```
@y
   ```console
   $ mkdir -p ~/.config/systemd/user/docker.service.d
   ```
@z

@x
2. Create a file named `~/.config/systemd/user/docker.service.d/http-proxy.conf`
   that adds the `HTTP_PROXY` environment variable:
@y
2. Create a file named `~/.config/systemd/user/docker.service.d/http-proxy.conf`
   that adds the `HTTP_PROXY` environment variable:
@z

@x
   ```systemd
   [Service]
   Environment="HTTP_PROXY=http://proxy.example.com:3128"
   ```
@y
   ```systemd
   [Service]
   Environment="HTTP_PROXY=http://proxy.example.com:3128"
   ```
@z

@x
   If you are behind an HTTPS proxy server, set the `HTTPS_PROXY` environment
   variable:
@y
   If you are behind an HTTPS proxy server, set the `HTTPS_PROXY` environment
   variable:
@z

@x
   ```systemd
   [Service]
   Environment="HTTPS_PROXY=https://proxy.example.com:3129"
   ```
@y
   ```systemd
   [Service]
   Environment="HTTPS_PROXY=https://proxy.example.com:3129"
   ```
@z

@x
   Multiple environment variables can be set; to set both a non-HTTPS and a
   HTTPs proxy;
@y
   Multiple environment variables can be set; to set both a non-HTTPS and a
   HTTPs proxy;
@z

@x
   ```systemd
   [Service]
   Environment="HTTP_PROXY=http://proxy.example.com:3128"
   Environment="HTTPS_PROXY=https://proxy.example.com:3129"
   ```
@y
   ```systemd
   [Service]
   Environment="HTTP_PROXY=http://proxy.example.com:3128"
   Environment="HTTPS_PROXY=https://proxy.example.com:3129"
   ```
@z

@x
   > **Note**
   >
   > Special characters in the proxy value, such as `#?!()[]{}`, must be double
   > escaped using `%%`. For example:
   >
   > ```systemd
   > [Service]
   > Environment="HTTP_PROXY=http://domain%%5Cuser:complex%%23pass@proxy.example.com:3128/"
   > ```
@y
   > **Note**
   >
   > Special characters in the proxy value, such as `#?!()[]{}`, must be double
   > escaped using `%%`. For example:
   >
   > ```systemd
   > [Service]
   > Environment="HTTP_PROXY=http://domain%%5Cuser:complex%%23pass@proxy.example.com:3128/"
   > ```
@z

@x
3. If you have internal Docker registries that you need to contact without
   proxying, you can specify them via the `NO_PROXY` environment variable.
@y
3. If you have internal Docker registries that you need to contact without
   proxying, you can specify them via the `NO_PROXY` environment variable.
@z

@x
   The `NO_PROXY` variable specifies a string that contains comma-separated
   values for hosts that should be excluded from proxying. These are the options
   you can specify to exclude hosts:
@y
   The `NO_PROXY` variable specifies a string that contains comma-separated
   values for hosts that should be excluded from proxying. These are the options
   you can specify to exclude hosts:
@z

@x
   - IP address prefix (`1.2.3.4`)
   - Domain name, or a special DNS label (`*`)
   - A domain name matches that name and all subdomains. A domain name with a
     leading "." matches subdomains only. For example, given the domains
     `foo.example.com` and `example.com`:
     - `example.com` matches `example.com` and `foo.example.com`, and
     - `.example.com` matches only `foo.example.com`
   - A single asterisk (`*`) indicates that no proxying should be done
   - Literal port numbers are accepted by IP address prefixes (`1.2.3.4:80`) and
     domain names (`foo.example.com:80`)
@y
   - IP address prefix (`1.2.3.4`)
   - Domain name, or a special DNS label (`*`)
   - A domain name matches that name and all subdomains. A domain name with a
     leading "." matches subdomains only. For example, given the domains
     `foo.example.com` and `example.com`:
     - `example.com` matches `example.com` and `foo.example.com`, and
     - `.example.com` matches only `foo.example.com`
   - A single asterisk (`*`) indicates that no proxying should be done
   - Literal port numbers are accepted by IP address prefixes (`1.2.3.4:80`) and
     domain names (`foo.example.com:80`)
@z

@x
   Example:
@y
   Example:
@z

@x
   ```systemd
   [Service]
   Environment="HTTP_PROXY=http://proxy.example.com:3128"
   Environment="HTTPS_PROXY=https://proxy.example.com:3129"
   Environment="NO_PROXY=localhost,127.0.0.1,docker-registry.example.com,.corp"
   ```
@y
   ```systemd
   [Service]
   Environment="HTTP_PROXY=http://proxy.example.com:3128"
   Environment="HTTPS_PROXY=https://proxy.example.com:3129"
   Environment="NO_PROXY=localhost,127.0.0.1,docker-registry.example.com,.corp"
   ```
@z

@x
4. Flush changes and restart Docker
@y
4. Flush changes and restart Docker
@z

@x
   ```console
   $ systemctl --user daemon-reload
   $ systemctl --user restart docker
   ```
@y
   ```console
   $ systemctl --user daemon-reload
   $ systemctl --user restart docker
   ```
@z

@x
5. Verify that the configuration has been loaded and matches the changes you
   made, for example:
@y
5. Verify that the configuration has been loaded and matches the changes you
   made, for example:
@z

@x
   ```console
   $ systemctl --user show --property=Environment docker
@y
   ```console
   $ systemctl --user show --property=Environment docker
@z

@x
   Environment=HTTP_PROXY=http://proxy.example.com:3128 HTTPS_PROXY=https://proxy.example.com:3129 NO_PROXY=localhost,127.0.0.1,docker-registry.example.com,.corp
   ```
@y
   Environment=HTTP_PROXY=http://proxy.example.com:3128 HTTPS_PROXY=https://proxy.example.com:3129 NO_PROXY=localhost,127.0.0.1,docker-registry.example.com,.corp
   ```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
