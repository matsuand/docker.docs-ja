%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: Learn how to configure the Docker daemon to use an HTTP proxy
keywords: dockerd, daemon, configuration, proxy, networking, http_proxy, https_proxy, no_proxy, systemd, environment variables
title: Configure the daemon to use a proxy
@y
description: Learn how to configure the Docker daemon to use an HTTP proxy
keywords: dockerd, daemon, configuration, proxy, networking, http_proxy, https_proxy, no_proxy, systemd, environment variables
title: Configure the daemon to use a proxy
@z

@x
<a name="httphttps-proxy"><!-- included for deep-links to old section --></a>
@y
<a name="httphttps-proxy"><!-- included for deep-links to old section --></a>
@z

@x
If your organization uses a proxy server to connect to the internet, you may
need to configure the Docker daemon to use the proxy server. The daemon uses
a proxy server to access images stored on Docker Hub and other registries,
and to reach other nodes in a Docker swarm.
@y
If your organization uses a proxy server to connect to the internet, you may
need to configure the Docker daemon to use the proxy server. The daemon uses
a proxy server to access images stored on Docker Hub and other registries,
and to reach other nodes in a Docker swarm.
@z

@x
This page describes how to configure a proxy for the Docker daemon. For
instructions on configuring proxy settings for the Docker CLI, see [Configure
Docker CLI to use a proxy server](/engine/cli/proxy.md).
@y
This page describes how to configure a proxy for the Docker daemon. For
instructions on configuring proxy settings for the Docker CLI, see [Configure
@z

@x
There are two ways you can configure these settings:
@y
There are two ways you can configure these settings:
@z

@x
- [Configuring the daemon](#daemon-configuration) through a configuration file or CLI flags
- Setting [environment variables](#environment-variables) on the system
@y
- [Configuring the daemon](#daemon-configuration) through a configuration file or CLI flags
- Setting [environment variables](#environment-variables) on the system
@z

@x
Configuring the daemon directly takes precedence over environment variables.
@y
Configuring the daemon directly takes precedence over environment variables.
@z

@x
## Daemon configuration
@y
## Daemon configuration
@z

@x
You may configure proxy behavior for the daemon in the `daemon.json` file,
or using CLI flags for the `--http-proxy` or `--https-proxy` flags for the
`dockerd` command. Configuration using `daemon.json` is recommended.
@y
You may configure proxy behavior for the daemon in the `daemon.json` file,
or using CLI flags for the `--http-proxy` or `--https-proxy` flags for the
`dockerd` command. Configuration using `daemon.json` is recommended.
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
After changing the configuration file, restart the daemon for the proxy configuration to take effect:
@y
After changing the configuration file, restart the daemon for the proxy configuration to take effect:
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
## Environment variables
@y
## Environment variables
@z

@x
The Docker daemon checks the following environment variables in its start-up
environment to configure HTTP or HTTPS proxy behavior:
@y
The Docker daemon checks the following environment variables in its start-up
environment to configure HTTP or HTTPS proxy behavior:
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
### systemd unit file
@y
### systemd unit file
@z

@x
If you're running the Docker daemon as a systemd service, you can create a
systemd drop-in file that sets the variables for the `docker` service.
@y
If you're running the Docker daemon as a systemd service, you can create a
systemd drop-in file that sets the variables for the `docker` service.
@z

@x
> **Note for rootless mode**
>
> The location of systemd configuration files are different when running Docker
> in [rootless mode](../../engine/security/rootless.md). When running in
> rootless mode, Docker is started as a user-mode systemd service, and uses
> files stored in each users' home directory in
> `~/.config/systemd/<user>/docker.service.d/`. In addition, `systemctl` must
> be executed without `sudo` and with the `--user` flag. Select the "Rootless
> mode" tab if you are running Docker in rootless mode.
@y
> **Note for rootless mode**
>
> The location of systemd configuration files are different when running Docker
> in [rootless mode](../../engine/security/rootless.md). When running in
> rootless mode, Docker is started as a user-mode systemd service, and uses
> files stored in each users' home directory in
> `~/.config/systemd/<user>/docker.service.d/`. In addition, `systemctl` must
> be executed without `sudo` and with the `--user` flag. Select the "Rootless
> mode" tab if you are running Docker in rootless mode.
@z

@x
{{< tabs >}}
{{< tab name="Regular install" >}}
@y
{{< tabs >}}
{{< tab name="Regular install" >}}
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
{{< tab name="Rootless mode" >}}
@y
{{< /tab >}}
{{< tab name="Rootless mode" >}}
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
