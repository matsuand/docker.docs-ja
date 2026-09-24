%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Network access policies
linkTitle: Network access
@y
title: Network access policies
linkTitle: Network access
@z

@x
description: Control outbound network access from Docker Sandboxes with local and organization policy rules.
keywords: docker sandboxes, network access, network rules, governance, local policy, organization policy
@y
description: Control outbound network access from Docker Sandboxes with local and organization policy rules.
keywords: docker sandboxes, network access, network rules, governance, local policy, organization policy
@z

@x
Network access policies control outbound connections from sandboxes. Each
policy contains one or more rules that allow the domains, IP ranges, and ports a
workflow needs, or block destinations that should stay unavailable. A local
policy rule can also match the HTTP method and path of a request, so it can
allow part of an API without allowing all of it.
@y
Network access policies control outbound connections from sandboxes. Each
policy contains one or more rules that allow the domains, IP ranges, and ports a
workflow needs, or block destinations that should stay unavailable. A local
policy rule can also match the HTTP method and path of a request, so it can
allow part of an API without allowing all of it.
@z

@x
You can configure network access in two places:
@y
You can configure network access in two places:
@z

@x
- [Local policy](local.md), which applies to sandboxes on one developer machine
  when organization governance is not active.
- [Organization policies](organization.md), which apply centrally across an
  organization or to selected teams.
@y
- [Local policy](local.md), which applies to sandboxes on one developer machine
  when organization governance is not active.
- [Organization policies](organization.md), which apply centrally across an
  organization or to selected teams.
@z

@x
When organization governance is active, only organization allow rules grant
network access. Local allow rules are inactive until organization governance no
longer applies, while local deny rules still apply on top of the organization
policy. See [Precedence](../concepts.md#precedence).
@y
When organization governance is active, only organization allow rules grant
network access. Local allow rules are inactive until organization governance no
longer applies, while local deny rules still apply on top of the organization
policy. See [Precedence](../concepts.md#precedence).
@z

@x
## Rule syntax
@y
## Rule syntax
@z

@x
Network rules use the action `connect:tcp`. Resources are hostnames, CIDR
ranges, ports, or hostnames with ports. The governance policy schema also
accepts `connect:udp`, but Docker Sandboxes always blocks direct external UDP
and ICMP. `connect:udp` rules have no effect.
@y
Network rules use the action `connect:tcp`. Resources are hostnames, CIDR
ranges, ports, or hostnames with ports. The governance policy schema also
accepts `connect:udp`, but Docker Sandboxes always blocks direct external UDP
and ICMP. `connect:udp` rules have no effect.
@z

@x
Examples:
@y
Examples:
@z

@x
- `api.example.com`
- `*.example.com`
- `**.example.com`
- `example.com:443`
- `10.0.0.0/8`
@y
- `api.example.com`
- `*.example.com`
- `**.example.com`
- `example.com:443`
- `10.0.0.0/8`
@z

@x
For exact wildcard behavior and CIDR support, see
[Network rules](../concepts.md#network-rules).
@y
For exact wildcard behavior and CIDR support, see
[Network rules](../concepts.md#network-rules).
@z

@x
## HTTP method and path rules
@y
## HTTP method and path rules
@z

@x
A network rule matches a destination, so it allows or blocks everything a
sandbox sends there. An HTTP rule narrows the match to specific HTTP methods
and URL paths on that destination, which lets a policy allow reads from an API
without allowing writes to it.
@y
A network rule matches a destination, so it allows or blocks everything a
sandbox sends there. An HTTP rule narrows the match to specific HTTP methods
and URL paths on that destination, which lets a policy allow reads from an API
without allowing writes to it.
@z

@x
HTTP rules layer on top of network rules. A network allow is the baseline for
a destination and HTTP rules carve into it, while a network deny blocks the
destination outright and no HTTP allow can reopen it. For the pattern syntax
and the full matching table, see
[HTTP rules](../concepts.md#http-method-and-path).
@y
HTTP rules layer on top of network rules. A network allow is the baseline for
a destination and HTTP rules carve into it, while a network deny blocks the
destination outright and no HTTP allow can reopen it. For the pattern syntax
and the full matching table, see
[HTTP rules](../concepts.md#http-method-and-path).
@z

@x
Add them to a local policy with `--method` and `--path` on `sbx policy`. See
[HTTP method and path rules](local.md#http-method-and-path-rules).
@y
Add them to a local policy with `--method` and `--path` on `sbx policy`. See
[HTTP method and path rules](local.md#http-method-and-path-rules).
@z

@x
## Local network rules
@y
## Local network rules
@z

@x
Use `sbx policy allow network` and `sbx policy deny network` to manage local
network rules:
@y
Use `sbx policy allow network` and `sbx policy deny network` to manage local
network rules:
@z

@x
```console
$ sbx policy allow network api.example.com
$ sbx policy deny network ads.example.com
```
@y
```console
$ sbx policy allow network api.example.com
$ sbx policy deny network ads.example.com
```
@z

@x
For presets, sandbox-scoped rules, testing, and troubleshooting, see
[Local policy](local.md).
@y
For presets, sandbox-scoped rules, testing, and troubleshooting, see
[Local policy](local.md).
@z

@x
## Organization network rules
@y
## Organization network rules
@z

@x
Organization network rules belong to policies that can apply to the whole
organization or to selected teams. For setup steps and team scoping, see
[Organization policies](organization.md).
@y
Organization network rules belong to policies that can apply to the whole
organization or to selected teams. For setup steps and team scoping, see
[Organization policies](organization.md).
@z

@x
Use [Monitoring policies](../monitor-and-enforce/monitoring.md) to inspect
which network rules are active on a developer machine.
@y
Use [Monitoring policies](../monitor-and-enforce/monitoring.md) to inspect
which network rules are active on a developer machine.
@z

@x
> [!NOTE]
> To manage Model Context Protocol (MCP) server registration and requests
> through Docker's MCP gateway, use [MCP access policies](mcp.md). These
> policies apply only to the gateway. Direct MCP connections from a sandbox
> don't use the gateway, but you can control access to remote MCP servers with
> network policy.
@y
> [!NOTE]
> To manage Model Context Protocol (MCP) server registration and requests
> through Docker's MCP gateway, use [MCP access policies](mcp.md). These
> policies apply only to the gateway. Direct MCP connections from a sandbox
> don't use the gateway, but you can control access to remote MCP servers with
> network policy.
@z
