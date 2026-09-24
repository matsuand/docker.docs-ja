%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Configure an upstream proxy
linkTitle: Upstream proxy
description: Route sandbox and daemon traffic through a corporate or upstream proxy, including PAC files, SOCKS5, and your OS system proxy.
keywords: docker sandboxes, sbx, upstream proxy, corporate proxy, pac, socks5, system proxy, no_proxy, egress, ntlm, kerberos
@y
title: Configure an upstream proxy
linkTitle: Upstream proxy
description: Route sandbox and daemon traffic through a corporate or upstream proxy, including PAC files, SOCKS5, and your OS system proxy.
keywords: docker sandboxes, sbx, upstream proxy, corporate proxy, pac, socks5, system proxy, no_proxy, egress, ntlm, kerberos
@z

@x
> [!IMPORTANT]
> Upstream proxy support is experimental. Everything described on this page —
> proxy URLs, PAC files, SOCKS5, use of the OS system proxy, proxy
> authentication, and the settings that configure them — is subject to change.
> Share feedback and bug reports in the
> [docker/sbx-releases](https://github.com/docker/sbx-releases) repository.
@y
> [!IMPORTANT]
> Upstream proxy support is experimental. Everything described on this page —
> proxy URLs, PAC files, SOCKS5, use of the OS system proxy, proxy
> authentication, and the settings that configure them — is subject to change.
> Share feedback and bug reports in the
> [docker/sbx-releases](https://github.com/docker/sbx-releases) repository.
@z

@x
An upstream proxy is the corporate or network proxy that Docker Sandboxes
forwards outbound traffic through on its way to the internet. This is separate
from the [network policy](../governance/access-controls/network.md), which decides
_which_ destinations are allowed. The upstream proxy decides _how_ allowed
traffic reaches them.
@y
An upstream proxy is the corporate or network proxy that Docker Sandboxes
forwards outbound traffic through on its way to the internet. This is separate
from the [network policy](../governance/access-controls/network.md), which decides
_which_ destinations are allowed. The upstream proxy decides _how_ allowed
traffic reaches them.
@z

@x
Docker Sandboxes sends two kinds of outbound traffic, and you can proxy them
independently:
@y
Docker Sandboxes sends two kinds of outbound traffic, and you can proxy them
independently:
@z

@x
- Sandbox traffic — network access from inside your sandboxes.
- Daemon traffic — the `sbx` daemon's own access, including image pulls,
  telemetry, and feature flags. CLI requests for `sbx login` and
  `sbx diagnose --upload` also use this scope.
@y
- Sandbox traffic — network access from inside your sandboxes.
- Daemon traffic — the `sbx` daemon's own access, including image pulls,
  telemetry, and feature flags. CLI requests for `sbx login` and
  `sbx diagnose --upload` also use this scope.
@z

@x
## Default behavior
@y
## Default behavior
@z

@x
By default, both kinds of traffic use your operating system's proxy settings,
including any PAC URL configured there. You don't need to configure anything. On
macOS and Windows, `sbx` tracks the OS proxy setting while it runs, so a change
to your network, VPN, or PAC configuration is picked up without a restart. If
your OS has no proxy configured, traffic goes direct.
@y
By default, both kinds of traffic use your operating system's proxy settings,
including any PAC URL configured there. You don't need to configure anything. On
macOS and Windows, `sbx` tracks the OS proxy setting while it runs, so a change
to your network, VPN, or PAC configuration is picked up without a restart. If
your OS has no proxy configured, traffic goes direct.
@z

@x
## Set a proxy manually
@y
## Set a proxy manually
@z

@x
Use [`sbx settings set`](settings.md#change-a-setting) to override the default
for one or both kinds of traffic:
@y
Use [`sbx settings set`](settings.md#change-a-setting) to override the default
for one or both kinds of traffic:
@z

@x
```console
$ sbx settings set proxy http://proxy.corp:3128          # both kinds of traffic
$ sbx settings set proxy.sandbox socks5://proxy.corp:1080 # sandbox traffic only
$ sbx settings set proxy.daemon direct                    # daemon traffic only
```
@y
```console
$ sbx settings set proxy http://proxy.corp:3128          # both kinds of traffic
$ sbx settings set proxy.sandbox socks5://proxy.corp:1080 # sandbox traffic only
$ sbx settings set proxy.daemon direct                    # daemon traffic only
```
@z

@x
A proxy value can be any of the following:
@y
A proxy value can be any of the following:
@z

@x
| Value                                                                                  | Meaning                                                                                          |
| -------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| _(unset)_                                                                              | Fall back to the wider scope, then environment variables, then the OS system proxy (the default) |
| `http://host:port` or `https://host:port`                                              | An HTTP or HTTPS proxy                                                                           |
| `socks5://host:port` or `socks5h://host:port`                                          | A SOCKS5 proxy                                                                                   |
| `pac+http://host/proxy.pac`, `pac+https://host/proxy.pac`, or `file:///path/proxy.pac` | A PAC (proxy auto-config) file                                                                   |
| `system`                                                                               | Force the use of the OS system proxy                                                             |
| `direct`                                                                               | Force a direct connection with no proxy                                                          |
@y
| Value                                                                                  | Meaning                                                                                          |
| -------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| _(unset)_                                                                              | Fall back to the wider scope, then environment variables, then the OS system proxy (the default) |
| `http://host:port` or `https://host:port`                                              | An HTTP or HTTPS proxy                                                                           |
| `socks5://host:port` or `socks5h://host:port`                                          | A SOCKS5 proxy                                                                                   |
| `pac+http://host/proxy.pac`, `pac+https://host/proxy.pac`, or `file:///path/proxy.pac` | A PAC (proxy auto-config) file                                                                   |
| `system`                                                                               | Force the use of the OS system proxy                                                             |
| `direct`                                                                               | Force a direct connection with no proxy                                                          |
@z

@x
With `socks5://`, DNS is resolved locally before the connection is handed to the
proxy. With `socks5h://`, DNS resolution is delegated to the proxy.
@y
With `socks5://`, DNS is resolved locally before the connection is handed to the
proxy. With `socks5h://`, DNS resolution is delegated to the proxy.
@z

@x
### Exclude destinations from the proxy
@y
### Exclude destinations from the proxy
@z

@x
Exclusion lists mirror the same scopes. Each takes a comma-separated list of
hosts, domain suffixes, IP addresses, or CIDR ranges, or `*` to bypass the
proxy entirely:
@y
Exclusion lists mirror the same scopes. Each takes a comma-separated list of
hosts, domain suffixes, IP addresses, or CIDR ranges, or `*` to bypass the
proxy entirely:
@z

@x
```console
$ sbx settings set no_proxy "*.internal.corp,10.0.0.0/8"    # both kinds of traffic
$ sbx settings set no_proxy.sandbox "*.svc.cluster.local"   # sandbox traffic only
$ sbx settings set no_proxy.daemon "registry.internal"      # daemon traffic only
```
@y
```console
$ sbx settings set no_proxy "*.internal.corp,10.0.0.0/8"    # both kinds of traffic
$ sbx settings set no_proxy.sandbox "*.svc.cluster.local"   # sandbox traffic only
$ sbx settings set no_proxy.daemon "registry.internal"      # daemon traffic only
```
@z

@x
## Environment variables
@y
## Environment variables
@z

@x
Because `sbx` runs from your shell, it also honors the standard and legacy proxy
environment variables, so existing setups keep working without migration:
@y
Because `sbx` runs from your shell, it also honors the standard and legacy proxy
environment variables, so existing setups keep working without migration:
@z

@x
- `HTTP_PROXY`, `HTTPS_PROXY`, and `NO_PROXY` (and their lowercase forms) — the
  standard variables. They apply to both kinds of traffic when no `proxy` or
  `no_proxy` setting is configured.
- `DOCKER_SANDBOXES_PROXY` and `DOCKER_SANDBOXES_NO_PROXY` — the environment
  form of `proxy.sandbox` and `no_proxy.sandbox`. They apply to sandbox traffic
  only and never affect daemon traffic.
@y
- `HTTP_PROXY`, `HTTPS_PROXY`, and `NO_PROXY` (and their lowercase forms) — the
  standard variables. They apply to both kinds of traffic when no `proxy` or
  `no_proxy` setting is configured.
- `DOCKER_SANDBOXES_PROXY` and `DOCKER_SANDBOXES_NO_PROXY` — the environment
  form of `proxy.sandbox` and `no_proxy.sandbox`. They apply to sandbox traffic
  only and never affect daemon traffic.
@z

@x
For how to apply environment variable changes to the CLI and daemon, see
[Settings environment variables](settings.md#environment-variables).
@y
For how to apply environment variable changes to the CLI and daemon, see
[Settings environment variables](settings.md#environment-variables).
@z

@x
## Precedence
@y
## Precedence
@z

@x
For each kind of traffic, the first match wins:
@y
For each kind of traffic, the first match wins:
@z

@x
1. The scope-specific value:
   - `proxy.sandbox` or `DOCKER_SANDBOXES_PROXY` for sandbox traffic
   - `proxy.daemon` for daemon traffic
2. The `proxy` setting
3. `HTTP_PROXY` or `HTTPS_PROXY` from the shell
4. The OS system proxy (the default)
5. Direct
@y
1. The scope-specific value:
   - `proxy.sandbox` or `DOCKER_SANDBOXES_PROXY` for sandbox traffic
   - `proxy.daemon` for daemon traffic
2. The `proxy` setting
3. `HTTP_PROXY` or `HTTPS_PROXY` from the shell
4. The OS system proxy (the default)
5. Direct
@z

@x
The matching exclusion list (`no_proxy.<scope>`, then `no_proxy`) applies to the
chosen proxy, and the standard `NO_PROXY` variable still applies on the
environment path.
@y
The matching exclusion list (`no_proxy.<scope>`, then `no_proxy`) applies to the
chosen proxy, and the standard `NO_PROXY` variable still applies on the
environment path.
@z

@x
For example, if `proxy` specifies a shared proxy and `proxy.sandbox` is set to
`direct`, sandbox traffic connects directly while daemon traffic uses the
shared proxy. If no proxy setting is configured, `HTTP_PROXY` takes precedence
over the OS system proxy.
@y
For example, if `proxy` specifies a shared proxy and `proxy.sandbox` is set to
`direct`, sandbox traffic connects directly while daemon traffic uses the
shared proxy. If no proxy setting is configured, `HTTP_PROXY` takes precedence
over the OS system proxy.
@z

@x
## When changes take effect
@y
## When changes take effect
@z

@x
Proxy settings take effect at different times depending on the consumer:
@y
Proxy settings take effect at different times depending on the consumer:
@z

@x
- Sandbox scope (`proxy.sandbox`, `no_proxy.sandbox`, and the sandbox side of
  `proxy` and `no_proxy`) is resolved when a sandbox network proxy is created.
  Sandboxes you create after a change use the updated settings. Existing
  sandboxes retain their selected upstream proxy until `sbx daemon restart`
  rebuilds their network proxies. Restarting a sandbox alone is insufficient.
- Daemon scope (`proxy.daemon`, `no_proxy.daemon`, and the daemon side of
  `proxy` and `no_proxy`) is resolved once when the daemon starts. Changes to
  the daemon's own traffic require `sbx daemon restart`.
- Supported CLI clients read daemon-scoped settings on each invocation,
  including `sbx login` and `sbx diagnose --upload`. Changes apply on the next
  invocation without a daemon restart.
@y
- Sandbox scope (`proxy.sandbox`, `no_proxy.sandbox`, and the sandbox side of
  `proxy` and `no_proxy`) is resolved when a sandbox network proxy is created.
  Sandboxes you create after a change use the updated settings. Existing
  sandboxes retain their selected upstream proxy until `sbx daemon restart`
  rebuilds their network proxies. Restarting a sandbox alone is insufficient.
- Daemon scope (`proxy.daemon`, `no_proxy.daemon`, and the daemon side of
  `proxy` and `no_proxy`) is resolved once when the daemon starts. Changes to
  the daemon's own traffic require `sbx daemon restart`.
- Supported CLI clients read daemon-scoped settings on each invocation,
  including `sbx login` and `sbx diagnose --upload`. Changes apply on the next
  invocation without a daemon restart.
@z

@x
The `DOCKER_SANDBOXES_*` environment variables are a separate case. They control
sandbox traffic only, as described in
[Environment variables](#environment-variables), but `sbx` reads them from the
daemon's environment as the daemon starts, so changing one also requires a
daemon restart. If one of these variables overrides a stored setting, unset
the variable and restart the daemon for the stored setting to take effect.
@y
The `DOCKER_SANDBOXES_*` environment variables are a separate case. They control
sandbox traffic only, as described in
[Environment variables](#environment-variables), but `sbx` reads them from the
daemon's environment as the daemon starts, so changing one also requires a
daemon restart. If one of these variables overrides a stored setting, unset
the variable and restart the daemon for the stored setting to take effect.
@z

@x
When a `system` or PAC proxy is in use, `sbx` still tracks OS-level proxy changes
(such as switching networks, connecting a VPN, or updated PAC contents) live.
@y
When a `system` or PAC proxy is in use, `sbx` still tracks OS-level proxy changes
(such as switching networks, connecting a VPN, or updated PAC contents) live.
@z

@x
## Authentication
@y
## Authentication
@z

@x
If the upstream proxy requires you to authenticate to it, `sbx` supports two
mechanisms.
@y
If the upstream proxy requires you to authenticate to it, `sbx` supports two
mechanisms.
@z

@x
### Credentials in the proxy URL
@y
### Credentials in the proxy URL
@z

@x
Put the credentials in the proxy URL: `http://user:pass@host:port` for an HTTP
or HTTPS proxy, or `socks5://user:pass@host:port` for SOCKS5. This works on all
platforms and covers proxies that challenge with Basic authentication.
@y
Put the credentials in the proxy URL: `http://user:pass@host:port` for an HTTP
or HTTPS proxy, or `socks5://user:pass@host:port` for SOCKS5. This works on all
platforms and covers proxies that challenge with Basic authentication.
@z

@x
### Integrated Windows authentication
@y
### Integrated Windows authentication
@z

@x
Proxies that answer `CONNECT` with a `407` challenge and accept only integrated
schemes — NTLM or Kerberos/Negotiate — can instead authenticate you with your
Windows sign-in identity. This is opt-in and off by default:
@y
Proxies that answer `CONNECT` with a `407` challenge and accept only integrated
schemes — NTLM or Kerberos/Negotiate — can instead authenticate you with your
Windows sign-in identity. This is opt-in and off by default:
@z

@x
```console
$ sbx settings set proxy.integratedAuth true
```
@y
```console
$ sbx settings set proxy.integratedAuth true
```
@z

@x
The setting isn't scoped: it applies to both sandbox and daemon traffic. If the
proxy offers several schemes, the strongest one is used, preferring Negotiate
over NTLM. Changes follow the same
[schedule as other proxy settings](#when-changes-take-effect): on the next
invocation for supported CLI clients, when you create a sandbox, and after
`sbx daemon restart` for daemon traffic and existing sandbox proxies.
@y
The setting isn't scoped: it applies to both sandbox and daemon traffic. If the
proxy offers several schemes, the strongest one is used, preferring Negotiate
over NTLM. Changes follow the same
[schedule as other proxy settings](#when-changes-take-effect): on the next
invocation for supported CLI clients, when you create a sandbox, and after
`sbx daemon restart` for daemon traffic and existing sandbox proxies.
@z

@x
Your identity stays on the host. Authentication to the upstream proxy happens
on the host side of the sandbox boundary, after network policy has already been
applied, so no credential enters the sandbox and nothing about which
destinations a sandbox may reach changes.
@y
Your identity stays on the host. Authentication to the upstream proxy happens
on the host side of the sandbox boundary, after network policy has already been
applied, so no credential enters the sandbox and nothing about which
destinations a sandbox may reach changes.
@z

@x
This depends on Windows SSPI, so it has no effect on macOS or Linux. On those
platforms, credentials in the proxy URL remain the only option.
@y
This depends on Windows SSPI, so it has no effect on macOS or Linux. On those
platforms, credentials in the proxy URL remain the only option.
@z

@x
## Related pages
@y
## Related pages
@z

@x
- [Network isolation](../security/isolation.md) — how traffic leaves a sandbox and
  the network policy it passes through
- [Troubleshooting: API calls fail with a certificate error](../troubleshooting.md#api-calls-fail-with-a-certificate-error)
  — installing an internal root CA when your proxy inspects HTTPS traffic
@y
- [Network isolation](../security/isolation.md) — how traffic leaves a sandbox and
  the network policy it passes through
- [Troubleshooting: API calls fail with a certificate error](../troubleshooting.md#api-calls-fail-with-a-certificate-error)
  — installing an internal root CA when your proxy inspects HTTPS traffic
@z
