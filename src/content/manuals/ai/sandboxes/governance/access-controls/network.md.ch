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
The governance described here applies to local sandboxes. Cloud sandboxes
use separate network policy configuration. See
[Cloud network policy](../../cloud/network-policy.md) for cloud controls.
@y
The governance described here applies to local sandboxes. Cloud sandboxes
use separate network policy configuration. See
[Cloud network policy](../../cloud/network-policy.md) for cloud controls.
@z

@x
Network access policies control outbound connections from sandboxes. Each
policy contains one or more rules that allow the domains, IP ranges, and ports a
workflow needs, or block destinations that should stay unavailable. Rules can
also match the HTTP method and path of a request, so a policy can allow part of
an API without allowing all of it.
@y
Network access policies control outbound connections from sandboxes. Each
policy contains one or more rules that allow the domains, IP ranges, and ports a
workflow needs, or block destinations that should stay unavailable. Rules can
also match the HTTP method and path of a request, so a policy can allow part of
an API without allowing all of it.
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
Network rules use `connect:tcp` for TCP and `connect:udp` for UDP. Resources are
hostnames, CIDR ranges, ports, or hostnames with ports. UDP requires
[experimental outbound UDP](local.md#allow-outbound-udp). ICMP is blocked.
@y
Network rules use `connect:tcp` for TCP and `connect:udp` for UDP. Resources are
hostnames, CIDR ranges, ports, or hostnames with ports. UDP requires
[experimental outbound UDP](local.md#allow-outbound-udp). ICMP is blocked.
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
Configure them in either place:
@y
Configure them in either place:
@z

@x
- Organization policies, in the network rule composer in Docker Home. Set the
  rule **Type** to **HTTP**, then select the methods and path patterns. See
  [Add a network rule](organization.md#add-a-network-rule).
- Local policies, with `--method` and `--path` on `sbx policy`. See
  [HTTP method and path rules](local.md#http-method-and-path-rules).
@y
- Organization policies, in the network rule composer in Docker Home. Set the
  rule **Type** to **HTTP**, then select the methods and path patterns. See
  [Add a network rule](organization.md#add-a-network-rule).
- Local policies, with `--method` and `--path` on `sbx policy`. See
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
## Approval-required access
@y
## Approval-required access
@z

@x
An organization network policy can require approval instead of granting access
outright. Destinations the policy allows aren't reachable until the developer
confirms them, which keeps an allowlist broad enough to be usable while still
putting a person in front of each destination an agent reaches for.
@y
An organization network policy can require approval instead of granting access
outright. Destinations the policy allows aren't reachable until the developer
confirms them, which keeps an allowlist broad enough to be usable while still
putting a person in front of each destination an agent reaches for.
@z

@x
Without organization governance, a request with no matching allow or deny rule
also asks for approval rather than being denied outright, so access opens up as
the developer approves each destination.
@y
Without organization governance, a request with no matching allow or deny rule
also asks for approval rather than being denied outright, so access opens up as
the developer approves each destination.
@z

@x
Under organization governance, approval is a property of the policy rather
than of individual rules, so turning it on applies it to every allow rule in
that policy. A destination stays directly reachable only when no policy that
allows it requires approval. If a policy that requires approval also matches,
the request needs approval regardless of what the other policies allow.
@y
Under organization governance, approval is a property of the policy rather
than of individual rules, so turning it on applies it to every allow rule in
that policy. A destination stays directly reachable only when no policy that
allows it requires approval. If a policy that requires approval also matches,
the request needs approval regardless of what the other policies allow.
@z

@x
Only a destination the developer has already approved satisfies the
requirement. Preset rules,
[kit-defined rules](https://github.com/docker/sandbox-kit-spec/blob/main/docs/spec/capabilities/com.docker.sandbox/network-policy@1.md),
and rules the developer added with `sbx policy allow network` don't answer it.
An approval also can't reach a destination the organization doesn't allow at
all, and it can't override a deny rule. To withdraw a destination, add a deny
rule, which takes precedence over any approval already recorded.
@y
Only a destination the developer has already approved satisfies the
requirement. Preset rules,
[kit-defined rules](https://github.com/docker/sandbox-kit-spec/blob/main/docs/spec/capabilities/com.docker.sandbox/network-policy@1.md),
and rules the developer added with `sbx policy allow network` don't answer it.
An approval also can't reach a destination the organization doesn't allow at
all, and it can't override a deny rule. To withdraw a destination, add a deny
rule, which takes precedence over any approval already recorded.
@z

@x
To require approval on an organization policy, see
[Organization policies](organization.md#require-approval-for-a-network-policy).
@y
To require approval on an organization policy, see
[Organization policies](organization.md#require-approval-for-a-network-policy).
@z

@x
### Respond to an approval request
@y
### Respond to an approval request
@z

@x
When a destination needs approval, a sandbox can't reach it until you confirm
it. The request is blocked and the sandbox receives a message naming the
destination:
@y
When a destination needs approval, a sandbox can't reach it until you confirm
it. The request is blocked and the sandbox receives a message naming the
destination:
@z

@x
```plaintext
Approval required for api.example.com.
@y
```plaintext
Approval required for api.example.com.
@z

@x
Review and respond with:
  sbx policy approval ls
```
@y
Review and respond with:
  sbx policy approval ls
```
@z

@x
If your organization
[configures a support message](organization.md#configure-a-support-message), it
appears after the approval instructions.
@y
If your organization
[configures a support message](organization.md#configure-a-support-message), it
appears after the approval instructions.
@z

@x
The request that triggers the prompt doesn't wait for an answer. It's denied,
and approving the destination affects later requests. Agents that retry a
failed request pick up the new access on their next attempt. For others, run
the operation again.
@y
The request that triggers the prompt doesn't wait for an answer. It's denied,
and approving the destination affects later requests. Agents that retry a
failed request pick up the new access on their next attempt. For others, run
the operation again.
@z

@x
List the destinations waiting for a response:
@y
List the destinations waiting for a response:
@z

@x
```console
$ sbx policy approval ls
APPROVAL                                              SANDBOX      TITLE                 DETAIL                                                                              OPTIONS
network:cWtN-4xUrNjxh4ouezcstgjrky6Rg57QfeRe3WEkyyY   my-sandbox   api.example.com:443   Protocol: TCP Resource type: domain approval required by policy "default network"   allow (Allow), dismiss (Dismiss)
```
@y
```console
$ sbx policy approval ls
APPROVAL                                              SANDBOX      TITLE                 DETAIL                                                                              OPTIONS
network:cWtN-4xUrNjxh4ouezcstgjrky6Rg57QfeRe3WEkyyY   my-sandbox   api.example.com:443   Protocol: TCP Resource type: domain approval required by policy "default network"   allow (Allow), dismiss (Dismiss)
```
@z

@x
Each entry names the destination, the sandbox that asked for it, and why it
needs approval. Under organization governance that reason names the policy, as
shown. Without it, the reason is that no matching allow rule covers the
destination. A request that an HTTP rule matches also shows the method and
path, such as `GET api.example.com:443/v1/data`.
@y
Each entry names the destination, the sandbox that asked for it, and why it
needs approval. Under organization governance that reason names the policy, as
shown. Without it, the reason is that no matching allow rule covers the
destination. A request that an HTTP rule matches also shows the method and
path, such as `GET api.example.com:443/v1/data`.
@z

@x
To inspect a single entry, pass its ID to `sbx policy approval inspect`:
@y
To inspect a single entry, pass its ID to `sbx policy approval inspect`:
@z

@x
```console
$ sbx policy approval inspect network:cWtN-4xUrNjxh4ouezcstgjrky6Rg57QfeRe3WEkyyY
APPROVAL network:cWtN-4xUrNjxh4ouezcstgjrky6Rg57QfeRe3WEkyyY  (sandbox: my-sandbox)
  api.example.com:443
  Protocol: TCP
  Resource type: domain
  approval required by policy "default network"
@y
```console
$ sbx policy approval inspect network:cWtN-4xUrNjxh4ouezcstgjrky6Rg57QfeRe3WEkyyY
APPROVAL network:cWtN-4xUrNjxh4ouezcstgjrky6Rg57QfeRe3WEkyyY  (sandbox: my-sandbox)
  api.example.com:443
  Protocol: TCP
  Resource type: domain
  approval required by policy "default network"
@z

@x
  OPTION    LABEL
  allow     Allow
  dismiss   Dismiss
```
@y
  OPTION    LABEL
  allow     Allow
  dismiss   Dismiss
```
@z

@x
Respond by selecting one of the options the entry offers:
@y
Respond by selecting one of the options the entry offers:
@z

@x
```console
$ sbx policy approval respond network:cWtN-4xUrNjxh4ouezcstgjrky6Rg57QfeRe3WEkyyY --option allow
Recorded: Allow
```
@y
```console
$ sbx policy approval respond network:cWtN-4xUrNjxh4ouezcstgjrky6Rg57QfeRe3WEkyyY --option allow
Recorded: Allow
```
@z

@x
Choosing `allow` grants access to that destination. Choosing `dismiss` leaves
it blocked, and the destination is requested again the next time the sandbox
tries to reach it. Repeated attempts collapse into a single entry, so a sandbox
retrying in a loop leaves one request to answer, not a queue of duplicates.
@y
Choosing `allow` grants access to that destination. Choosing `dismiss` leaves
it blocked, and the destination is requested again the next time the sandbox
tries to reach it. Repeated attempts collapse into a single entry, so a sandbox
retrying in a loop leaves one request to answer, not a queue of duplicates.
@z

@x
#### What approving grants
@y
#### What approving grants
@z

@x
Approving records a rule that allows the destination the sandbox actually
asked for, scoped to the sandbox that asked. Three things follow from that:
@y
Approving records a rule that allows the destination the sandbox actually
asked for, scoped to the sandbox that asked. Three things follow from that:
@z

@x
- The rule covers one destination, not the pattern the policy rule used. A
  policy that allows `*.example.com` with approval asks about
  `api.example.com` and `cdn.example.com` separately.
- A destination includes its port, so `api.example.com:443` and
  `api.example.com:8443` are approved separately.
- Another sandbox reaching the same destination asks again.
@y
- The rule covers one destination, not the pattern the policy rule used. A
  policy that allows `*.example.com` with approval asks about
  `api.example.com` and `cdn.example.com` separately.
- A destination includes its port, so `api.example.com:443` and
  `api.example.com:8443` are approved separately.
- Another sandbox reaching the same destination asks again.
@z

@x
When an [HTTP rule](../concepts.md#http-method-and-path) in the policy matches
the request, approving covers the method and exact path the sandbox requested
rather than the whole destination. `GET /v1/data` and `POST /v1/data` on the
same host are approved separately. A request whose method or path can't be
recorded as a rule, such as a path with percent-encoding, is blocked without an
entry to respond to.
@y
When an [HTTP rule](../concepts.md#http-method-and-path) in the policy matches
the request, approving covers the method and exact path the sandbox requested
rather than the whole destination. `GET /v1/data` and `POST /v1/data` on the
same host are approved separately. A request whose method or path can't be
recorded as a rule, such as a path with percent-encoding, is blocked without an
entry to respond to.
@z

@x
Approved destinations stay allowed until the rule is removed. List them with
`sbx policy ls --wide --created-via approval`, and remove one the same way as
any other local rule, with [`sbx policy rm network`](local.md#managing-rules).
@y
Approved destinations stay allowed until the rule is removed. List them with
`sbx policy ls --wide --created-via approval`, and remove one the same way as
any other local rule, with [`sbx policy rm network`](local.md#managing-rules).
@z

@x
Approvals live in the local policy store, so [`sbx policy reset`](local.md#resetting)
removes all of them along with your other local rules. Each destination is
requested again the next time a sandbox reaches it.
@y
Approvals live in the local policy store, so [`sbx policy reset`](local.md#resetting)
removes all of them along with your other local rules. Each destination is
requested again the next time a sandbox reaches it.
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
