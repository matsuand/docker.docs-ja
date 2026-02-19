%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Network policies
description: Configure network filtering policies to control outbound HTTP and HTTPS access from sandboxed agents.
@y
title: Network policies
description: Configure network filtering policies to control outbound HTTP and HTTPS access from sandboxed agents.
@z

@x
{{< summary-bar feature_name="Docker Sandboxes" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes" >}}
@z

@x
Network policies control what external resources a sandbox can access through
an HTTP/HTTPS filtering proxy. Use policies to prevent agents from accessing
internal networks, enforce compliance requirements, or restrict internet access
to specific services.
@y
Network policies control what external resources a sandbox can access through
an HTTP/HTTPS filtering proxy. Use policies to prevent agents from accessing
internal networks, enforce compliance requirements, or restrict internet access
to specific services.
@z

@x
Each sandbox has a filtering proxy that enforces policies for outbound HTTP and
HTTPS traffic. Connection to external services over other protocols, such as
raw TCP and UDP connections, are blocked. All agent communication must go
through the HTTP proxy or remain contained within the sandbox.
@y
Each sandbox has a filtering proxy that enforces policies for outbound HTTP and
HTTPS traffic. Connection to external services over other protocols, such as
raw TCP and UDP connections, are blocked. All agent communication must go
through the HTTP proxy or remain contained within the sandbox.
@z

@x
The proxy runs on an ephemeral port on your host, but from the agent
container's perspective it is accessible at `host.docker.internal:3128`.
@y
The proxy runs on an ephemeral port on your host, but from the agent
container's perspective it is accessible at `host.docker.internal:3128`.
@z

@x
### Security considerations
@y
### Security considerations
@z

@x
Use network policies as one layer of security, not the only layer. The microVM
boundary provides the primary isolation. Network policies add an additional
control for HTTP/HTTPS traffic.
@y
Use network policies as one layer of security, not the only layer. The microVM
boundary provides the primary isolation. Network policies add an additional
control for HTTP/HTTPS traffic.
@z

@x
The network filtering restricts which domains processes can connect to, but
doesn't inspect the traffic content. When configuring policies:
@y
The network filtering restricts which domains processes can connect to, but
doesn't inspect the traffic content. When configuring policies:
@z

@x
- Allowing broad domains like `github.com` permits access to any content on
  that domain, including user-generated content. Agents could use these as
  channels for data exfiltration.
- Domain fronting techniques may bypass filters by routing traffic through
  allowed domains. This is inherent to HTTPS proxying.
@y
- Allowing broad domains like `github.com` permits access to any content on
  that domain, including user-generated content. Agents could use these as
  channels for data exfiltration.
- Domain fronting techniques may bypass filters by routing traffic through
  allowed domains. This is inherent to HTTPS proxying.
@z

@x
Only allow domains you trust with your data. You're responsible for
understanding what your policies permit.
@y
Only allow domains you trust with your data. You're responsible for
understanding what your policies permit.
@z

@x
## How network filtering works
@y
## How network filtering works
@z

@x
Each sandbox has an HTTP/HTTPS proxy running on your host. The proxy is
accessible from inside the sandbox at `host.docker.internal:3128`.
@y
Each sandbox has an HTTP/HTTPS proxy running on your host. The proxy is
accessible from inside the sandbox at `host.docker.internal:3128`.
@z

@x
When an agent makes HTTP or HTTPS requests, the proxy:
@y
When an agent makes HTTP or HTTPS requests, the proxy:
@z

@x
1. Checks the policy rules against the host in the request. If the host is
   blocked, the request is stopped immediately
2. Connects to the server. If the host was not explicitly allowed, checks the
   server's IP address against BlockCIDR rules
@y
1. Checks the policy rules against the host in the request. If the host is
   blocked, the request is stopped immediately
2. Connects to the server. If the host was not explicitly allowed, checks the
   server's IP address against BlockCIDR rules
@z

@x
For example, `localhost` is not in the default allow-list, but it's allowed by the
default "allow" policy. Because it's not explicitly allowed, the proxy then checks
the resolved IP addresses (`127.0.0.1` or `::1`) against the BlockCIDR rules.
Since `127.0.0.1/8` and `::1/128` are both blocked by default, this catches any
DNS aliases for localhost like `ip6-localhost`.
@y
For example, `localhost` is not in the default allow-list, but it's allowed by the
default "allow" policy. Because it's not explicitly allowed, the proxy then checks
the resolved IP addresses (`127.0.0.1` or `::1`) against the BlockCIDR rules.
Since `127.0.0.1/8` and `::1/128` are both blocked by default, this catches any
DNS aliases for localhost like `ip6-localhost`.
@z

@x
If an agent needs access to a service on localhost, include a port number in
the allow-list (e.g., `localhost:1234`).
@y
If an agent needs access to a service on localhost, include a port number in
the allow-list (e.g., `localhost:1234`).
@z

@x
HTTP requests to `host.docker.internal` are rewritten to `localhost`, so only
the name `localhost` will work in the allow-list.
@y
HTTP requests to `host.docker.internal` are rewritten to `localhost`, so only
the name `localhost` will work in the allow-list.
@z

@x
## Default policy
@y
## Default policy
@z

@x
New sandboxes use this default policy unless you configure a custom policy:
@y
New sandboxes use this default policy unless you configure a custom policy:
@z

@x
**Policy mode:** `allow` (permit all traffic except what's explicitly blocked)
@y
**Policy mode:** `allow` (permit all traffic except what's explicitly blocked)
@z

@x
**Blocked CIDRs:**
@y
**Blocked CIDRs:**
@z

@x
- `10.0.0.0/8` - Private network (Class A)
- `127.0.0.0/8` - Loopback addresses
- `169.254.0.0/16` - Link-local addresses
- `172.16.0.0/12` - Private network (Class B)
- `192.168.0.0/16` - Private network (Class C)
- `::1/128` - IPv6 loopback
- `fc00::/7` - IPv6 unique local addresses
- `fe80::/10` - IPv6 link-local addresses
@y
- `10.0.0.0/8` - Private network (Class A)
- `127.0.0.0/8` - Loopback addresses
- `169.254.0.0/16` - Link-local addresses
- `172.16.0.0/12` - Private network (Class B)
- `192.168.0.0/16` - Private network (Class C)
- `::1/128` - IPv6 loopback
- `fc00::/7` - IPv6 unique local addresses
- `fe80::/10` - IPv6 link-local addresses
@z

@x
**Allowed hosts:**
@y
**Allowed hosts:**
@z

@x
- `*.anthropic.com` - Claude API and services
- `platform.claude.com:443` - Claude platform services
@y
- `*.anthropic.com` - Claude API and services
- `platform.claude.com:443` - Claude platform services
@z

@x
The default policy blocks access to private networks, localhost, and cloud
metadata services while allowing internet access. Explicitly allowed hosts
bypass CIDR checks for performance.
@y
The default policy blocks access to private networks, localhost, and cloud
metadata services while allowing internet access. Explicitly allowed hosts
bypass CIDR checks for performance.
@z

@x
## Monitor network activity
@y
## Monitor network activity
@z

@x
View what your agent is accessing and whether requests are being blocked:
@y
View what your agent is accessing and whether requests are being blocked:
@z

@x
```console
$ docker sandbox network log
```
@y
```console
$ docker sandbox network log
```
@z

@x
The network log shows aggregated summaries of HTTP/HTTPS network requests:
@y
The network log shows aggregated summaries of HTTP/HTTPS network requests:
@z

@x
- **Allowed requests** - Requests that were permitted by your network policy
- **Blocked requests** - Requests that were denied by your network policy
@y
- **Allowed requests** - Requests that were permitted by your network policy
- **Blocked requests** - Requests that were denied by your network policy
@z

@x
For each host accessed, the log shows:
@y
For each host accessed, the log shows:
@z

@x
- **Sandbox** - Name of the sandbox making the request
- **Host** - The destination (hostname and port)
- **Rule** - The policy rule that matched this request (or `<default policy>`)
- **Last Seen** - When this host was most recently accessed
- **Count** - Number of requests to this host since tracking began
@y
- **Sandbox** - Name of the sandbox making the request
- **Host** - The destination (hostname and port)
- **Rule** - The policy rule that matched this request (or `<default policy>`)
- **Last Seen** - When this host was most recently accessed
- **Count** - Number of requests to this host since tracking began
@z

@x
Use network logs to understand agent behavior, identify blocked requests that
should be allowed, and debug network policy issues. The logs are especially
helpful when defining policies - they show exactly what your agent is trying to
access.
@y
Use network logs to understand agent behavior, identify blocked requests that
should be allowed, and debug network policy issues. The logs are especially
helpful when defining policies - they show exactly what your agent is trying to
access.
@z

@x
### Example log output
@y
### Example log output
@z

@x
```console
$ docker sandbox network log
Blocked requests:
SANDBOX          HOST                    RULE             LAST SEEN         COUNT
my-sandbox       internal.corp.com:443   <default policy> 14:30:15 12-Feb   3
my-sandbox       192.168.1.100:22        <default policy> 14:25:10 12-Feb   1
@y
```console
$ docker sandbox network log
Blocked requests:
SANDBOX          HOST                    RULE             LAST SEEN         COUNT
my-sandbox       internal.corp.com:443   <default policy> 14:30:15 12-Feb   3
my-sandbox       192.168.1.100:22        <default policy> 14:25:10 12-Feb   1
@z

@x
Allowed requests:
SANDBOX          HOST                          RULE                   LAST SEEN         COUNT
my-sandbox       api.anthropic.com:443         api.anthropic.com      14:35:21 12-Feb   15
my-sandbox       registry.npmjs.org:443        *.npmjs.org            14:32:18 12-Feb   8
my-sandbox       raw.githubusercontent.com:443 *.githubusercontent.com 14:30:45 12-Feb   2
```
@y
Allowed requests:
SANDBOX          HOST                          RULE                   LAST SEEN         COUNT
my-sandbox       api.anthropic.com:443         api.anthropic.com      14:35:21 12-Feb   15
my-sandbox       registry.npmjs.org:443        *.npmjs.org            14:32:18 12-Feb   8
my-sandbox       raw.githubusercontent.com:443 *.githubusercontent.com 14:30:45 12-Feb   2
```
@z

@x
The log displays both blocked and allowed requests in separate sections. Use
`--json` for machine-readable output, `--quiet` to suppress headers, or
`--limit N` to show only the first N entries.
@y
The log displays both blocked and allowed requests in separate sections. Use
`--json` for machine-readable output, `--quiet` to suppress headers, or
`--limit N` to show only the first N entries.
@z

@x
## Applying policies
@y
## Applying policies
@z

@x
Use `docker sandbox network proxy` to configure network policies for your
sandboxes. The sandbox must be running when you apply policy changes. Changes
take effect immediately and persist across sandbox restarts.
@y
Use `docker sandbox network proxy` to configure network policies for your
sandboxes. The sandbox must be running when you apply policy changes. Changes
take effect immediately and persist across sandbox restarts.
@z

@x
### Example: Block internal networks
@y
### Example: Block internal networks
@z

@x
Prevent agents from accessing your local network, Docker networks, and cloud
metadata services. It prevents accidental access to internal services while
allowing agents to install packages and access public APIs.
@y
Prevent agents from accessing your local network, Docker networks, and cloud
metadata services. It prevents accidental access to internal services while
allowing agents to install packages and access public APIs.
@z

@x
```console
$ docker sandbox network proxy my-sandbox \
  --policy allow \
  --block-cidr 10.0.0.0/8 \
  --block-cidr 172.16.0.0/12 \
  --block-cidr 192.168.0.0/16 \
  --block-cidr 127.0.0.0/8
```
@y
```console
$ docker sandbox network proxy my-sandbox \
  --policy allow \
  --block-cidr 10.0.0.0/8 \
  --block-cidr 172.16.0.0/12 \
  --block-cidr 192.168.0.0/16 \
  --block-cidr 127.0.0.0/8
```
@z

@x
This policy:
@y
This policy:
@z

@x
- Allows internet access
- Blocks RFC 1918 private networks (10.x.x.x, 172.16-31.x.x, 192.168.x.x)
- Blocks localhost (127.x.x.x)
@y
- Allows internet access
- Blocks RFC 1918 private networks (10.x.x.x, 172.16-31.x.x, 192.168.x.x)
- Blocks localhost (127.x.x.x)
@z

@x
> [!NOTE]
> These CIDR blocks are already blocked by default. The example above shows how
> to explicitly configure them. See [Default policy](#default-policy) for the
> complete list.
@y
> [!NOTE]
> These CIDR blocks are already blocked by default. The example above shows how
> to explicitly configure them. See [Default policy](#default-policy) for the
> complete list.
@z

@x
### Example: Restrict to package managers only
@y
### Example: Restrict to package managers only
@z

@x
For strict control, use a denylist policy that only allows package repositories:
@y
For strict control, use a denylist policy that only allows package repositories:
@z

@x
```console
$ docker sandbox network proxy my-sandbox \
  --policy deny \
  --allow-host "*.npmjs.org" \
  --allow-host "*.pypi.org" \
  --allow-host "files.pythonhosted.org" \
  --allow-host "*.rubygems.org" \
  --allow-host github.com
```
@y
```console
$ docker sandbox network proxy my-sandbox \
  --policy deny \
  --allow-host "*.npmjs.org" \
  --allow-host "*.pypi.org" \
  --allow-host "files.pythonhosted.org" \
  --allow-host "*.rubygems.org" \
  --allow-host github.com
```
@z

@x
> [!NOTE]
> This policy would block the backend of your AI coding agent (e.g., for Claude
> Code: `xyz.anthropic.com`). Make sure you also include hostnames that the
> agent requires.
@y
> [!NOTE]
> This policy would block the backend of your AI coding agent (e.g., for Claude
> Code: `xyz.anthropic.com`). Make sure you also include hostnames that the
> agent requires.
@z

@x
The agent can install dependencies but can't access arbitrary internet
resources. This is useful for CI/CD environments or when running untrusted code.
@y
The agent can install dependencies but can't access arbitrary internet
resources. This is useful for CI/CD environments or when running untrusted code.
@z

@x
### Example: Allow AI APIs and development tools
@y
### Example: Allow AI APIs and development tools
@z

@x
Combine AI service access with package managers and version control:
@y
Combine AI service access with package managers and version control:
@z

@x
```console
$ docker sandbox network proxy my-sandbox \
  --policy deny \
  --allow-host api.anthropic.com \
  --allow-host "*.npmjs.org" \
  --allow-host "*.pypi.org" \
  --allow-host github.com \
  --allow-host "*.githubusercontent.com"
```
@y
```console
$ docker sandbox network proxy my-sandbox \
  --policy deny \
  --allow-host api.anthropic.com \
  --allow-host "*.npmjs.org" \
  --allow-host "*.pypi.org" \
  --allow-host github.com \
  --allow-host "*.githubusercontent.com"
```
@z

@x
This allows agents to call AI APIs, install packages, and fetch code from
GitHub while blocking other internet access.
@y
This allows agents to call AI APIs, install packages, and fetch code from
GitHub while blocking other internet access.
@z

@x
### Example: Allow specific APIs while blocking subdomains
@y
### Example: Allow specific APIs while blocking subdomains
@z

@x
Use port-specific rules and subdomain patterns for fine-grained control:
@y
Use port-specific rules and subdomain patterns for fine-grained control:
@z

@x
```console
$ docker sandbox network proxy my-sandbox \
  --policy deny \
  --allow-host api.example.com:443 \
  --allow-host cdn.example.com \
  --allow-host "*.storage.example.com:443"
```
@y
```console
$ docker sandbox network proxy my-sandbox \
  --policy deny \
  --allow-host api.example.com:443 \
  --allow-host cdn.example.com \
  --allow-host "*.storage.example.com:443"
```
@z

@x
This policy allows:
@y
This policy allows:
@z

@x
- Requests to `api.example.com` on port 443 (typically
  `https://api.example.com`)
- Requests to `cdn.example.com` on any port
- Requests to any subdomain of `storage.example.com` on port 443, like
  `us-west.storage.example.com:443` or `eu-central.storage.example.com:443`
@y
- Requests to `api.example.com` on port 443 (typically
  `https://api.example.com`)
- Requests to `cdn.example.com` on any port
- Requests to any subdomain of `storage.example.com` on port 443, like
  `us-west.storage.example.com:443` or `eu-central.storage.example.com:443`
@z

@x
Requests to `example.com` (any port), `www.example.com` (any port), or
`api.example.com:8080` would all be blocked because none match the specific
patterns.
@y
Requests to `example.com` (any port), `www.example.com` (any port), or
`api.example.com:8080` would all be blocked because none match the specific
patterns.
@z

@x
To allow both a domain and all its subdomains, specify both patterns:
@y
To allow both a domain and all its subdomains, specify both patterns:
@z

@x
```console
$ docker sandbox network proxy my-sandbox \
  --policy deny \
  --allow-host example.com \
  --allow-host "*.example.com"
```
@y
```console
$ docker sandbox network proxy my-sandbox \
  --policy deny \
  --allow-host example.com \
  --allow-host "*.example.com"
```
@z

@x
## Policy modes: allowlist versus denylist
@y
## Policy modes: allowlist versus denylist
@z

@x
Policies have two modes that determine default behavior.
@y
Policies have two modes that determine default behavior.
@z

@x
### Allowlist mode
@y
### Allowlist mode
@z

@x
Default: Allow all traffic, block specific destinations.
@y
Default: Allow all traffic, block specific destinations.
@z

@x
```console
$ docker sandbox network proxy my-sandbox \
  --policy allow \
  --block-cidr 192.0.2.0/24 \
  --block-host example.com
```
@y
```console
$ docker sandbox network proxy my-sandbox \
  --policy allow \
  --block-cidr 192.0.2.0/24 \
  --block-host example.com
```
@z

@x
Use allowlist mode when you want agents to access most resources but need to
block specific networks or domains. This is less restrictive and works well for
development environments where the agent needs broad internet access.
@y
Use allowlist mode when you want agents to access most resources but need to
block specific networks or domains. This is less restrictive and works well for
development environments where the agent needs broad internet access.
@z

@x
### Denylist mode
@y
### Denylist mode
@z

@x
Default: Block all traffic, allow specific destinations.
@y
Default: Block all traffic, allow specific destinations.
@z

@x
```console
$ docker sandbox network proxy my-sandbox \
  --policy deny \
  --allow-host api.anthropic.com \
  --allow-host "*.npmjs.org"
```
@y
```console
$ docker sandbox network proxy my-sandbox \
  --policy deny \
  --allow-host api.anthropic.com \
  --allow-host "*.npmjs.org"
```
@z

@x
Use denylist mode when you want tight control over external access. This
requires explicitly allowing each service the agent needs, making it more
secure but also more restrictive. Good for production deployments, CI/CD
pipelines, or untrusted code.
@y
Use denylist mode when you want tight control over external access. This
requires explicitly allowing each service the agent needs, making it more
secure but also more restrictive. Good for production deployments, CI/CD
pipelines, or untrusted code.
@z

@x
### Domain and CIDR matching
@y
### Domain and CIDR matching
@z

@x
Domain patterns support exact matches, wildcards, and port specifications:
@y
Domain patterns support exact matches, wildcards, and port specifications:
@z

@x
- `example.com` matches only that exact domain (any port)
- `example.com:443` matches requests to `example.com` on port 443 (the default
  HTTPS port)
- `*.example.com` matches all subdomains like `api.example.com` or
  `www.example.com`
- `*.example.com:443` matches requests to any subdomain on port 443
@y
- `example.com` matches only that exact domain (any port)
- `example.com:443` matches requests to `example.com` on port 443 (the default
  HTTPS port)
- `*.example.com` matches all subdomains like `api.example.com` or
  `www.example.com`
- `*.example.com:443` matches requests to any subdomain on port 443
@z

@x
Important pattern behaviors:
@y
Important pattern behaviors:
@z

@x
- `example.com` does NOT match subdomains. A request to `api.example.com`
  won't match a rule for `example.com`.
- `*.example.com` does NOT match the root domain. A request to `example.com`
  won't match a rule for `*.example.com`.
- To allow both a domain and its subdomains, specify both patterns:
  `example.com` and `*.example.com`.
@y
- `example.com` does NOT match subdomains. A request to `api.example.com`
  won't match a rule for `example.com`.
- `*.example.com` does NOT match the root domain. A request to `example.com`
  won't match a rule for `*.example.com`.
- To allow both a domain and its subdomains, specify both patterns:
  `example.com` and `*.example.com`.
@z

@x
When multiple patterns could match a request, the most specific pattern wins:
@y
When multiple patterns could match a request, the most specific pattern wins:
@z

@x
1. Exact hostname and port: `api.example.com:443`
2. Exact hostname, any port: `api.example.com`
3. Wildcard patterns (longest match first): `*.api.example.com:443`,
   `*.api.example.com`, `*.example.com:443`, `*.example.com`
4. Catch-all wildcards: `*:443`, `*`
5. Default policy (allow or deny)
@y
1. Exact hostname and port: `api.example.com:443`
2. Exact hostname, any port: `api.example.com`
3. Wildcard patterns (longest match first): `*.api.example.com:443`,
   `*.api.example.com`, `*.example.com:443`, `*.example.com`
4. Catch-all wildcards: `*:443`, `*`
5. Default policy (allow or deny)
@z

@x
This specificity lets you block broad patterns while allowing specific
exceptions. For example, you can block `example.com` and `*.example.com` but
allow `api.example.com:443`.
@y
This specificity lets you block broad patterns while allowing specific
exceptions. For example, you can block `example.com` and `*.example.com` but
allow `api.example.com:443`.
@z

@x
CIDR blocks match IP addresses after DNS resolution:
@y
CIDR blocks match IP addresses after DNS resolution:
@z

@x
- `192.0.2.0/24` blocks all 192.0.2.x addresses
- `198.51.100.0/24` blocks all 198.51.100.x addresses
- `203.0.113.0/24` blocks all 203.0.113.x addresses
@y
- `192.0.2.0/24` blocks all 192.0.2.x addresses
- `198.51.100.0/24` blocks all 198.51.100.x addresses
- `203.0.113.0/24` blocks all 203.0.113.x addresses
@z

@x
When you block or allow a domain, the proxy resolves it to IP addresses and
checks those IPs against CIDR rules. This means blocking a CIDR range affects
any domain that resolves to an IP in that range.
@y
When you block or allow a domain, the proxy resolves it to IP addresses and
checks those IPs against CIDR rules. This means blocking a CIDR range affects
any domain that resolves to an IP in that range.
@z

@x
## Bypass mode for HTTPS tunneling
@y
## Bypass mode for HTTPS tunneling
@z

@x
By default, the proxy acts as a man-in-the-middle for HTTPS connections,
terminating TLS and re-encrypting traffic with its own certificate authority.
This allows the proxy to enforce policies and inject authentication credentials
for certain services. The sandbox container trusts the proxy's CA certificate.
@y
By default, the proxy acts as a man-in-the-middle for HTTPS connections,
terminating TLS and re-encrypting traffic with its own certificate authority.
This allows the proxy to enforce policies and inject authentication credentials
for certain services. The sandbox container trusts the proxy's CA certificate.
@z

@x
Some applications use certificate pinning or other techniques that don't work
with MITM proxies. For these cases, use bypass mode to tunnel HTTPS traffic
directly without inspection:
@y
Some applications use certificate pinning or other techniques that don't work
with MITM proxies. For these cases, use bypass mode to tunnel HTTPS traffic
directly without inspection:
@z

@x
```console
$ docker sandbox network proxy my-sandbox \
  --bypass-host api.service-with-pinning.com
```
@y
```console
$ docker sandbox network proxy my-sandbox \
  --bypass-host api.service-with-pinning.com
```
@z

@x
You can also bypass traffic to specific IP ranges:
@y
You can also bypass traffic to specific IP ranges:
@z

@x
```console
$ docker sandbox network proxy my-sandbox \
  --bypass-cidr 203.0.113.0/24
```
@y
```console
$ docker sandbox network proxy my-sandbox \
  --bypass-cidr 203.0.113.0/24
```
@z

@x
When traffic is bypassed, the proxy:
@y
When traffic is bypassed, the proxy:
@z

@x
- Acts as a simple TCP tunnel without inspecting content
- Cannot inject authentication credentials into requests
- Cannot detect domain fronting or other evasion techniques
- Still enforces domain and port matching based on the initial connection
@y
- Acts as a simple TCP tunnel without inspecting content
- Cannot inject authentication credentials into requests
- Cannot detect domain fronting or other evasion techniques
- Still enforces domain and port matching based on the initial connection
@z

@x
Use bypass mode only when necessary. Bypassed traffic loses the visibility and
security benefits of MITM inspection. If you bypass broad domains like
`github.com`, the proxy has no visibility into what the agent accesses on that
domain.
@y
Use bypass mode only when necessary. Bypassed traffic loses the visibility and
security benefits of MITM inspection. If you bypass broad domains like
`github.com`, the proxy has no visibility into what the agent accesses on that
domain.
@z

@x
## Policy persistence
@y
## Policy persistence
@z

@x
Network policies are stored in JSON configuration files.
@y
Network policies are stored in JSON configuration files.
@z

@x
### Per-sandbox configuration
@y
### Per-sandbox configuration
@z

@x
When you run `docker sandbox network proxy my-sandbox`, the command updates the
configuration for that specific sandbox only. The policy is persisted to
`~/.docker/sandboxes/vm/my-sandbox/proxy-config.json`.
@y
When you run `docker sandbox network proxy my-sandbox`, the command updates the
configuration for that specific sandbox only. The policy is persisted to
`~/.docker/sandboxes/vm/my-sandbox/proxy-config.json`.
@z

@x
The default policy (used when creating new sandboxes) remains unchanged unless
you modify it directly.
@y
The default policy (used when creating new sandboxes) remains unchanged unless
you modify it directly.
@z

@x
### Default configuration
@y
### Default configuration
@z

@x
The default network policy for new sandboxes is stored at
`~/.sandboxd/proxy-config.json`. This file is created automatically when the
first sandbox starts, but only if it doesn't already exist.
@y
The default network policy for new sandboxes is stored at
`~/.sandboxd/proxy-config.json`. This file is created automatically when the
first sandbox starts, but only if it doesn't already exist.
@z

@x
The current default policy is `allow`, which permits all outbound connections
except to blocked CIDR ranges (private networks, localhost, and cloud metadata
services).
@y
The current default policy is `allow`, which permits all outbound connections
except to blocked CIDR ranges (private networks, localhost, and cloud metadata
services).
@z

@x
You can modify the default policy:
@y
You can modify the default policy:
@z

@x
1. Edit `~/.sandboxd/proxy-config.json` directly
2. Or copy a sandbox policy to the default location:
@y
1. Edit `~/.sandboxd/proxy-config.json` directly
2. Or copy a sandbox policy to the default location:
@z

@x
   ```console
   $ cp ~/.docker/sandboxes/vm/my-sandbox/proxy-config.json ~/.sandboxd/proxy-config.json
   ```
@y
   ```console
   $ cp ~/.docker/sandboxes/vm/my-sandbox/proxy-config.json ~/.sandboxd/proxy-config.json
   ```
@z

@x
Review and customize the default policy to match your security requirements
before creating new sandboxes. Once created, the default policy file won't be
modified by upgrades, preserving your custom configuration.
@y
Review and customize the default policy to match your security requirements
before creating new sandboxes. Once created, the default policy file won't be
modified by upgrades, preserving your custom configuration.
@z
