%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Air-gapped containers
description: Control container network access with air-gapped containers using custom proxy rules and network restrictions
keywords: air gapped containers, network security, proxy configuration, container isolation, docker desktop
@y
title: Air-gapped containers
description: Control container network access with air-gapped containers using custom proxy rules and network restrictions
keywords: air gapped containers, network security, proxy configuration, container isolation, docker desktop
@z

@x
{{< summary-bar feature_name="Air-gapped containers" >}}
@y
{{< summary-bar feature_name="Air-gapped containers" >}}
@z

@x
Air-gapped containers let you restrict container network access by controlling where containers can send and receive data. This feature applies custom proxy rules to container network traffic, helping secure environments where containers shouldn't have unrestricted internet access.
@y
Air-gapped containers let you restrict container network access by controlling where containers can send and receive data. This feature applies custom proxy rules to container network traffic, helping secure environments where containers shouldn't have unrestricted internet access.
@z

@x
Docker Desktop can configure container network traffic to accept connections, reject connections, or tunnel through HTTP or SOCKS proxies. You control which TCP ports the policy applies to and whether to use a single proxy or per-destination policies via Proxy Auto-Configuration (PAC) files.
@y
Docker Desktop can configure container network traffic to accept connections, reject connections, or tunnel through HTTP or SOCKS proxies. You control which TCP ports the policy applies to and whether to use a single proxy or per-destination policies via Proxy Auto-Configuration (PAC) files.
@z

@x
This page provides an overview of air-gapped containers and configuration steps.
@y
This page provides an overview of air-gapped containers and configuration steps.
@z

@x
## Who should use air-gapped containers?
@y
## Who should use air-gapped containers?
@z

@x
Air-gapped containers help organizations maintain security in restricted environments:
@y
Air-gapped containers help organizations maintain security in restricted environments:
@z

@x
- Secure development environments: Prevent containers from accessing unauthorized external services
- Compliance requirements: Meet regulatory standards that require network isolation
- Data loss prevention: Block containers from uploading sensitive data to external services
- Supply chain security: Control which external resources containers can access during builds
- Corporate network policies: Enforce existing network security policies for containerized applications
@y
- Secure development environments: Prevent containers from accessing unauthorized external services
- Compliance requirements: Meet regulatory standards that require network isolation
- Data loss prevention: Block containers from uploading sensitive data to external services
- Supply chain security: Control which external resources containers can access during builds
- Corporate network policies: Enforce existing network security policies for containerized applications
@z

@x
## How air-gapped containers work
@y
## How air-gapped containers work
@z

@x
Air-gapped containers operate by intercepting container network traffic and applying proxy rules:
@y
Air-gapped containers operate by intercepting container network traffic and applying proxy rules:
@z

@x
1. Traffic interception: Docker Desktop intercepts all outgoing network connections from containers
1. Port filtering: Only traffic on specified ports (`transparentPorts`) is subject to proxy rules
1. Rule evaluation: PAC file rules or static proxy settings determine how to handle each connection
1. Connection handling: Traffic is allowed directly, routed through a proxy, or blocked based on the rules
@y
1. Traffic interception: Docker Desktop intercepts all outgoing network connections from containers
1. Port filtering: Only traffic on specified ports (`transparentPorts`) is subject to proxy rules
1. Rule evaluation: PAC file rules or static proxy settings determine how to handle each connection
1. Connection handling: Traffic is allowed directly, routed through a proxy, or blocked based on the rules
@z

@x
Some important considerations include:
@y
Some important considerations include:
@z

@x
- The existing `proxy` setting continues to apply to Docker Desktop application traffic on the host
- If PAC file download fails, containers block requests to target URLs
- URL parameter format is `http://host_or_ip:port` or `https://host_or_ip:port`
- Hostname is available for ports 80 and 443, but only IP addresses for other ports
@y
- The existing `proxy` setting continues to apply to Docker Desktop application traffic on the host
- If PAC file download fails, containers block requests to target URLs
- URL parameter format is `http://host_or_ip:port` or `https://host_or_ip:port`
- Hostname is available for ports 80 and 443, but only IP addresses for other ports
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before configuring air-gapped containers, you must have:
@y
Before configuring air-gapped containers, you must have:
@z

@x
- [Enforce sign-in](/manuals/enterprise/security/enforce-sign-in/_index.md) enabled to ensure users authenticate with your organization
- A Docker Business subscription
- Configured [Settings Management](/manuals/enterprise/security/hardened-desktop/settings-management/_index.md) to manage organization policies
- Downloaded Docker Desktop 4.29 or later
@y
- [Enforce sign-in](manuals/enterprise/security/enforce-sign-in/_index.md) enabled to ensure users authenticate with your organization
- A Docker Business subscription
- Configured [Settings Management](manuals/enterprise/security/hardened-desktop/settings-management/_index.md) to manage organization policies
- Downloaded Docker Desktop 4.29 or later
@z

@x
## Configure air-gapped containers
@y
## Configure air-gapped containers
@z

@x
Add the container proxy to your [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md). For example:
@y
Add the container proxy to your [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md). For example:
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
    "exclude": [],
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
    "exclude": [],
    "pac": "http://192.168.1.16:62039/proxy.pac",
    "transparentPorts": "*"
  }
}
```
@z

@x
### Configuration parameters
@y
### Configuration parameters
@z

@x
The `containersProxy` setting controls network policies applied to container traffic:
@y
The `containersProxy` setting controls network policies applied to container traffic:
@z

@x
| Parameter | Description | Value |
|-----------|-------------|-------|
| `locked` | Prevents developers from overriding settings | `true` (locked), `false` (default) |
| `mode` | Proxy configuration method | `system` (use system proxy), `manual` (custom) |
| `http` | HTTP proxy server | URL (e.g., `"http://proxy.company.com:8080"`) |
| `https` | HTTPS proxy server | URL (e.g., `"https://proxy.company.com:8080"`) |
| `exclude` | Bypass proxy for these addresses | Array of hostnames/IPs |
| `pac` | Proxy Auto-Configuration file URL | URL to PAC file |
| `transparentPorts` | Ports subject to proxy rules | Comma-separated ports or wildcard (`"*"`) |
@y
| Parameter | Description | Value |
|-----------|-------------|-------|
| `locked` | Prevents developers from overriding settings | `true` (locked), `false` (default) |
| `mode` | Proxy configuration method | `system` (use system proxy), `manual` (custom) |
| `http` | HTTP proxy server | URL (e.g., `"http://proxy.company.com:8080"`) |
| `https` | HTTPS proxy server | URL (e.g., `"https://proxy.company.com:8080"`) |
| `exclude` | Bypass proxy for these addresses | Array of hostnames/IPs |
| `pac` | Proxy Auto-Configuration file URL | URL to PAC file |
| `transparentPorts` | Ports subject to proxy rules | Comma-separated ports or wildcard (`"*"`) |
@z

@x
### Configuration examples
@y
### Configuration examples
@z

@x
Block all external access:
@y
Block all external access:
@z

@x
```json
"containersProxy": {
  "locked": true,
  "mode": "manual",
  "http": "",
  "https": "",
  "exclude": [],
  "transparentPorts": "*"
}
```
@y
```json
"containersProxy": {
  "locked": true,
  "mode": "manual",
  "http": "",
  "https": "",
  "exclude": [],
  "transparentPorts": "*"
}
```
@z

@x
Allow specific internal services:
@y
Allow specific internal services:
@z

@x
```json
"containersProxy": {
  "locked": true,
  "mode": "manual",
  "http": "",
  "https": "",
  "exclude": ["internal.company.com", "10.0.0.0/8"],
  "transparentPorts": "80,443"
}
```
@y
```json
"containersProxy": {
  "locked": true,
  "mode": "manual",
  "http": "",
  "https": "",
  "exclude": ["internal.company.com", "10.0.0.0/8"],
  "transparentPorts": "80,443"
}
```
@z

@x
Route through corporate proxy:
@y
Route through corporate proxy:
@z

@x
```json
"containersProxy": {
  "locked": true,
  "mode": "manual",
  "http": "http://corporate-proxy.company.com:8080",
  "https": "http://corporate-proxy.company.com:8080",
  "exclude": ["localhost", "*.company.local"],
  "transparentPorts": "*"
}
```
@y
```json
"containersProxy": {
  "locked": true,
  "mode": "manual",
  "http": "http://corporate-proxy.company.com:8080",
  "https": "http://corporate-proxy.company.com:8080",
  "exclude": ["localhost", "*.company.local"],
  "transparentPorts": "*"
}
```
@z

@x
## Proxy Auto-Configuration (PAC) files
@y
## Proxy Auto-Configuration (PAC) files
@z

@x
PAC files provide fine-grained control over container network access by defining rules for different destinations.
@y
PAC files provide fine-grained control over container network access by defining rules for different destinations.
@z

@x
### Basic PAC file structure
@y
### Basic PAC file structure
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
### PAC file return values
@y
### PAC file return values
@z

@x
| Return value | Action |
|--------------|--------|
| `PROXY host:port` | Route through HTTP proxy at specified host and port |
| `SOCKS5 host:port` | Route through SOCKS5 proxy at specified host and port |
| `DIRECT` | Allow direct connection without proxy |
| `PROXY reject.docker.internal:any_port` | Block the request completely |
@y
| Return value | Action |
|--------------|--------|
| `PROXY host:port` | Route through HTTP proxy at specified host and port |
| `SOCKS5 host:port` | Route through SOCKS5 proxy at specified host and port |
| `DIRECT` | Allow direct connection without proxy |
| `PROXY reject.docker.internal:any_port` | Block the request completely |
@z

@x
### Advanced PAC file example
@y
### Advanced PAC file example
@z

@x
```javascript
function FindProxyForURL(url, host) {
  // Allow access to Docker Hub for approved base images
  if (dnsDomainIs(host, ".docker.io") || host === "docker.io") {
    return "PROXY corporate-proxy.company.com:8080";
  }
@y
```javascript
function FindProxyForURL(url, host) {
  // Allow access to Docker Hub for approved base images
  if (dnsDomainIs(host, ".docker.io") || host === "docker.io") {
    return "PROXY corporate-proxy.company.com:8080";
  }
@z

@x
  // Allow internal package repositories
  if (localHostOrDomainIs(host, 'nexus.company.com') ||
      localHostOrDomainIs(host, 'artifactory.company.com')) {
    return "DIRECT";
  }
@y
  // Allow internal package repositories
  if (localHostOrDomainIs(host, 'nexus.company.com') ||
      localHostOrDomainIs(host, 'artifactory.company.com')) {
    return "DIRECT";
  }
@z

@x
  // Allow development tools on specific ports
  if (url.indexOf(":3000") > 0 || url.indexOf(":8080") > 0) {
    if (isInNet(host, "10.0.0.0", "255.0.0.0")) {
      return "DIRECT";
    }
  }
@y
  // Allow development tools on specific ports
  if (url.indexOf(":3000") > 0 || url.indexOf(":8080") > 0) {
    if (isInNet(host, "10.0.0.0", "255.0.0.0")) {
      return "DIRECT";
    }
  }
@z

@x
  // Block access to developer's localhost
  if (host === "host.docker.internal" || host === "localhost") {
    return "PROXY reject.docker.internal:1234";
  }
@y
  // Block access to developer's localhost
  if (host === "host.docker.internal" || host === "localhost") {
    return "PROXY reject.docker.internal:1234";
  }
@z

@x
  // Block all other external access
  return "PROXY reject.docker.internal:1234";
}
```
@y
  // Block all other external access
  return "PROXY reject.docker.internal:1234";
}
```
@z

@x
## Verify air-gapped container configuration
@y
## Verify air-gapped container configuration
@z

@x
After applying the configuration, test that container network restrictions work:
@y
After applying the configuration, test that container network restrictions work:
@z

@x
Test blocked access:
@y
Test blocked access:
@z

@x
```console
$ docker run --rm alpine wget -O- https://www.google.com
# Should fail or timeout based on your proxy rules
```
@y
```console
$ docker run --rm alpine wget -O- https://www.google.com
# Should fail or timeout based on your proxy rules
```
@z

@x
Test allowed access:
@y
Test allowed access:
@z

@x
```console
$ docker run --rm alpine wget -O- https://internal.company.com
# Should succeed if internal.company.com is in your exclude list or PAC rules
```
@y
```console
$ docker run --rm alpine wget -O- https://internal.company.com
# Should succeed if internal.company.com is in your exclude list or PAC rules
```
@z

@x
Test proxy routing:
@y
Test proxy routing:
@z

@x
```console
$ docker run --rm alpine wget -O- https://docker.io
# Should succeed if routed through approved proxy
```
@y
```console
$ docker run --rm alpine wget -O- https://docker.io
# Should succeed if routed through approved proxy
```
@z

@x
## Security considerations
@y
## Security considerations
@z

@x
- Network policy enforcement: Air-gapped containers work at the Docker Desktop level. Advanced users might bypass restrictions through various means, so consider additional network-level controls for high-security environments.
- Development workflow impact: Overly restrictive policies can break legitimate development workflows. Test thoroughly and provide clear exceptions for necessary services.
- PAC file management: Host PAC files on reliable internal infrastructure. Failed PAC downloads result in blocked container network access.
- Performance considerations: Complex PAC files with many rules may impact container network performance. Keep rules simple and efficient.
@y
- Network policy enforcement: Air-gapped containers work at the Docker Desktop level. Advanced users might bypass restrictions through various means, so consider additional network-level controls for high-security environments.
- Development workflow impact: Overly restrictive policies can break legitimate development workflows. Test thoroughly and provide clear exceptions for necessary services.
- PAC file management: Host PAC files on reliable internal infrastructure. Failed PAC downloads result in blocked container network access.
- Performance considerations: Complex PAC files with many rules may impact container network performance. Keep rules simple and efficient.
@z
