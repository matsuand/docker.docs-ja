%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn how to create air-gapped containers with Settings Management
title: Configure air-gapped containers with Settings Management
keywords: settings management, air gapped, security, Docker Desktop, configuration, proxy, network
---
@y
---
description: Learn how to create air-gapped containers with Settings Management
title: Configure air-gapped containers with Settings Management
keywords: settings management, air gapped, security, Docker Desktop, configuration, proxy, network
---
@z

@x
> **Beta feature**
>
> This feature is in [Beta](../../../release-lifecycle.md/#beta).
> It's available with Docker Desktop version 4.29 and later.
{ .experimental }
@y
> **Beta feature**
>
> This feature is in [Beta](../../../release-lifecycle.md/#beta).
> It's available with Docker Desktop version 4.29 and later.
{ .experimental }
@z

@x
Air-gapped containers allows administrators to restrict containers from accessing network resources, limiting where data can be uploaded to or downloaded from.
@y
Air-gapped containers allows administrators to restrict containers from accessing network resources, limiting where data can be uploaded to or downloaded from.
@z

@x
Docker Desktop can apply a custom set of proxy rules to network traffic from containers. The proxy can be configured to:
@y
Docker Desktop can apply a custom set of proxy rules to network traffic from containers. The proxy can be configured to:
@z

@x
- Allow network connections
- Reject network connections
- Tunnel through an HTTP or SOCKS proxy
@y
- Allow network connections
- Reject network connections
- Tunnel through an HTTP or SOCKS proxy
@z

@x
You can choose:
@y
You can choose:
@z

@x
- Which outgoing TCP ports the policy applies to. For example, only certain ports, `80`, `443` or all with `*`.
- Whether to forward to a single HTTP or SOCKS proxy, or to have a policy per destination via a Proxy Auto-Configuration (PAC) file.
@y
- Which outgoing TCP ports the policy applies to. For example, only certain ports, `80`, `443` or all with `*`.
- Whether to forward to a single HTTP or SOCKS proxy, or to have a policy per destination via a Proxy Auto-Configuration (PAC) file.
@z

@x
## Configuration
@y
## Configuration
@z

@x
Assuming [enforced sign-in](../../../security/for-admins/configure-sign-in.md) and Settings Management are enabled, add the new proxy configuration to the `admin-settings.json` file. For example:
@y
Assuming [enforced sign-in](../../../security/for-admins/configure-sign-in.md) and Settings Management are enabled, add the new proxy configuration to the `admin-settings.json` file. For example:
@z

@x
```json
{
  "configurationFileVersion": 2,
  "containersProxy": {
    "locked": true,
    "mode": "manual",
    "http": "",
    "https": "",
    "exclude": "",
    "pac": "http://192.168.1.16:62039/proxy.pac",
    "transparentPorts": "*"
  }
}
```
@y
```json
{
  "configurationFileVersion": 2,
  "containersProxy": {
    "locked": true,
    "mode": "manual",
    "http": "",
    "https": "",
    "exclude": "",
    "pac": "http://192.168.1.16:62039/proxy.pac",
    "transparentPorts": "*"
  }
}
```
@z

@x
The `containersProxy` setting describes the policy which is applied to traffic from containers. The valid fields are:
@y
The `containersProxy` setting describes the policy which is applied to traffic from containers. The valid fields are:
@z

@x
- `locked`: If true, it is not possible for developers to override these settings. If false the settings are interpreted as default values which the developer can change.
- `mode`: Same meaning as with the existing `proxy` setting. Possible values are `system` and `manual`.
- `http`, `https`, `exclude`: Same meaning as with the `proxy` setting. Only takes effect if `mode` is set to `manual`.
- `pac` : URL for a PAC file. Only takes effect if `mode` is `manual`, and is considered higher priority than `http`, `https`, `exclude`.
- `transparentPorts`: A comma-separated list of ports (e.g. `"80,443,8080"`) or a wildcard (`*`) indicating which ports should be proxied.
@y
- `locked`: If true, it is not possible for developers to override these settings. If false the settings are interpreted as default values which the developer can change.
- `mode`: Same meaning as with the existing `proxy` setting. Possible values are `system` and `manual`.
- `http`, `https`, `exclude`: Same meaning as with the `proxy` setting. Only takes effect if `mode` is set to `manual`.
- `pac` : URL for a PAC file. Only takes effect if `mode` is `manual`, and is considered higher priority than `http`, `https`, `exclude`.
- `transparentPorts`: A comma-separated list of ports (e.g. `"80,443,8080"`) or a wildcard (`*`) indicating which ports should be proxied.
@z

@x
> **Important**
>
> Any existing `proxy` setting in the `admin-settings.json` file continues to apply to traffic from the app on the host.
{ .important }
@y
> **Important**
>
> Any existing `proxy` setting in the `admin-settings.json` file continues to apply to traffic from the app on the host.
{ .important }
@z

@x
## Example PAC file
@y
## Example PAC file
@z

@x
For general information about PAC files, see the [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/HTTP/Proxy_servers_and_tunneling/Proxy_Auto-Configuration_PAC_file).
@y
For general information about PAC files, see the [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/HTTP/Proxy_servers_and_tunneling/Proxy_Auto-Configuration_PAC_file).
@z

@x
The following is an example PAC file:
@y
The following is an example PAC file:
@z

@x
```javascript
function FindProxyForURL(url, host) {
	if (localHostOrDomainIs(host, 'internal.corp')) {
		return "PROXY 10.0.0.1:3128";
	}
	if (isInNet(host, "192.168.0.0", "255.255.255.0")) {
	    return "DIRECT";
	}
    return "PROXY reject.docker.internal:1234";
}
```
@y
```javascript
function FindProxyForURL(url, host) {
	if (localHostOrDomainIs(host, 'internal.corp')) {
		return "PROXY 10.0.0.1:3128";
	}
	if (isInNet(host, "192.168.0.0", "255.255.255.0")) {
	    return "DIRECT";
	}
    return "PROXY reject.docker.internal:1234";
}
```
@z

@x
The `url` parameter is either `http://host_or_ip:port` or `https://host_or_ip:port`.
@y
The `url` parameter is either `http://host_or_ip:port` or `https://host_or_ip:port`.
@z

@x
The hostname is normally available for outgoing requests on port `80` and `443`, but for other cases there is only an IP address.
@y
The hostname is normally available for outgoing requests on port `80` and `443`, but for other cases there is only an IP address.
@z

@x
The `FindProxyForURL` can return the following values:
@y
The `FindProxyForURL` can return the following values:
@z

@x
- `PROXY host_or_ip:port`: Tunnels this request through the HTTP proxy `host_or_ip:port`
- `SOCKS5 host_or_ip:port`: Tunnels this request through the SOCKS proxy `host_or_ip:port`
- `DIRECT`: Allows this request to go direct, without a proxy
- `PROXY reject.docker.internal:any_port`: Rejects this request
@y
- `PROXY host_or_ip:port`: Tunnels this request through the HTTP proxy `host_or_ip:port`
- `SOCKS5 host_or_ip:port`: Tunnels this request through the SOCKS proxy `host_or_ip:port`
- `DIRECT`: Allows this request to go direct, without a proxy
- `PROXY reject.docker.internal:any_port`: Rejects this request
@z

@x
In this particular example, HTTP and HTTPS requests for `internal.corp` are sent via the HTTP proxy `10.0.0.1:3128`. Requests to connect to IPs on the subnet `192.168.0.0/24` connect directly. All other requests are blocked.
@y
In this particular example, HTTP and HTTPS requests for `internal.corp` are sent via the HTTP proxy `10.0.0.1:3128`. Requests to connect to IPs on the subnet `192.168.0.0/24` connect directly. All other requests are blocked.
@z

@x
To restrict traffic connecting to ports on the developers local machine, [match the special hostname `host.docker.internal`](../../networking.md#i-want-to-connect-from-a-container-to-a-service-on-the-host).
@y
To restrict traffic connecting to ports on the developers local machine, [match the special hostname `host.docker.internal`](../../networking.md#i-want-to-connect-from-a-container-to-a-service-on-the-host).
@z
