%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Organization network access policies
linkTitle: Network
@y
title: Organization network access policies
linkTitle: Network
@z

@x
description: Control outbound network access from Docker Sandboxes with organization network access policies.
keywords: docker sandboxes, network access, network rules, HTTP rules, approval, governance, organization policy
@y
description: Control outbound network access from Docker Sandboxes with organization network access policies.
keywords: docker sandboxes, network access, network rules, HTTP rules, approval, governance, organization policy
@z

@x
{{< summary-bar feature_name="AI Governance" >}}
@y
{{< summary-bar feature_name="AI Governance" >}}
@z

@x
Network access policies are organization policies that control outbound
connections from sandboxes. When an organization policy is enforced for a
developer, their sandboxes can reach only the destinations your network rules
allow. Each policy contains one or more rules that allow the hosts, IP
ranges, and ports a workflow needs, or block destinations that should stay
unavailable. Rules can also match the HTTP method and path of a request, so a
policy can allow part of an API without allowing all of it.
@y
Network access policies are organization policies that control outbound
connections from sandboxes. When an organization policy is enforced for a
developer, their sandboxes can reach only the destinations your network rules
allow. Each policy contains one or more rules that allow the hosts, IP
ranges, and ports a workflow needs, or block destinations that should stay
unavailable. Rules can also match the HTTP method and path of a request, so a
policy can allow part of an API without allowing all of it.
@z

@x
Developers can also add network rules on their own machines with
[local policy](../../local/network-rules.md), but under an enforced
organization policy, only your allow rules grant access. For more details, see
[How organization policy relates to local and kit rules](_index.md#how-organization-policy-relates-to-local-and-kit-rules).
@y
Developers can also add network rules on their own machines with
[local policy](../../local/network-rules.md), but under an enforced
organization policy, only your allow rules grant access. For more details, see
[How organization policy relates to local and kit rules](_index.md#how-organization-policy-relates-to-local-and-kit-rules).
@z

@x
For destinations you want a person to confirm, a policy can require approval
instead of granting access outright. This page explains what a rule can match,
how approval works, and when your changes reach developers. To create a network
access policy, see [Create and manage organization policies](create-manage.md).
@y
For destinations you want a person to confirm, a policy can require approval
instead of granting access outright. This page explains what a rule can match,
how approval works, and when your changes reach developers. To create a network
access policy, see [Create and manage organization policies](create-manage.md).
@z

@x
## What a network rule can match
@y
## What a network rule can match
@z

@x
Each rule has an optional **Rule name**, a **Type** that decides what the rule
matches, and a **Decision** of **Allow** or **Deny**. The type is either
**All traffic**, which covers whole destinations, or **HTTP**, which covers
specific requests to one destination.
@y
Each rule has an optional **Rule name**, a **Type** that decides what the rule
matches, and a **Decision** of **Allow** or **Deny**. The type is either
**All traffic**, which covers whole destinations, or **HTTP**, which covers
specific requests to one destination.
@z

@x
### All traffic rules
@y
### All traffic rules
@z

@x
An **All traffic** rule matches every request to the destinations you list, on
any port, method, and path.
@y
An **All traffic** rule matches every request to the destinations you list, on
any port, method, and path.
@z

@x
- Under **Protocols**, select **TCP**, **UDP**, or **Both**.
- Under **Destinations**, add the hosts, IP addresses, or CIDR ranges the rule
  covers. A destination matches any port unless you add one, such as
  `example.com:8080`.
@y
- Under **Protocols**, select **TCP**, **UDP**, or **Both**.
- Under **Destinations**, add the hosts, IP addresses, or CIDR ranges the rule
  covers. A destination matches any port unless you add one, such as
  `example.com:8080`.
@z

@x
### HTTP rules
@y
### HTTP rules
@z

@x
An **HTTP** rule matches only HTTP requests with the methods and paths you
specify.
@y
An **HTTP** rule matches only HTTP requests with the methods and paths you
specify.
@z

@x
- In **Destination**, enter the host or IP address the rule covers. It matches
  any port unless you add one. Enter the destination with no scheme and no
  path, so `api.github.com` rather than `https://api.github.com/repos`.
- Under **HTTP methods**, select the methods the rule applies to. Use
  **Select all** to select every method, or **Read-only** to select `GET`,
  `HEAD`, and `OPTIONS`. Select at least one method. A rule with no methods
  selected fails validation. The composer doesn't list `CONNECT` or `TRACE`,
  which differs from the CLI, where `--method ANY` matches every HTTP method.
- Under **Path patterns**, add one or more paths the rule covers, such as
  `/repos/*` and `/v1/**`. Leave it empty to match any path.
@y
- In **Destination**, enter the host or IP address the rule covers. It matches
  any port unless you add one. Enter the destination with no scheme and no
  path, so `api.github.com` rather than `https://api.github.com/repos`.
- Under **HTTP methods**, select the methods the rule applies to. Use
  **Select all** to select every method, or **Read-only** to select `GET`,
  `HEAD`, and `OPTIONS`. Select at least one method. A rule with no methods
  selected fails validation. The composer doesn't list `CONNECT` or `TRACE`,
  which differs from the CLI, where `--method ANY` matches every HTTP method.
- Under **Path patterns**, add one or more paths the rule covers, such as
  `/repos/*` and `/v1/**`. Leave it empty to match any path.
@z

@x
An HTTP rule's paths all belong to its one destination, so to cover paths on a
second host, add a second rule. For the pattern syntax and how HTTP rules
combine with **All traffic** rules, see
[HTTP rules](../../reference/network-rules.md#http-method-and-path).
@y
An HTTP rule's paths all belong to its one destination, so to cover paths on a
second host, add a second rule. For the pattern syntax and how HTTP rules
combine with **All traffic** rules, see
[HTTP rules](../../reference/network-rules.md#http-method-and-path).
@z

@x
## Approval-required access
@y
## Approval-required access
@z

@x
A network access policy can require approval instead of granting access
outright. Destinations the policy allows aren't reachable until the developer
confirms them, which keeps an allowlist broad enough to be usable while still
putting a person in front of each destination an agent reaches for. To turn
it on when you create or edit a policy, see
[Create and manage organization policies](create-manage.md).
@y
A network access policy can require approval instead of granting access
outright. Destinations the policy allows aren't reachable until the developer
confirms them, which keeps an allowlist broad enough to be usable while still
putting a person in front of each destination an agent reaches for. To turn
it on when you create or edit a policy, see
[Create and manage organization policies](create-manage.md).
@z

@x
In an organization policy, approval is a property of the policy rather than of
individual rules, so turning it on applies it to every allow rule in that
policy. A destination stays directly reachable only when no policy that
allows it requires approval. If a policy that requires approval also matches,
the request needs approval regardless of what the other policies allow.
@y
In an organization policy, approval is a property of the policy rather than of
individual rules, so turning it on applies it to every allow rule in that
policy. A destination stays directly reachable only when no policy that
allows it requires approval. If a policy that requires approval also matches,
the request needs approval regardless of what the other policies allow.
@z

@x
A request is handled as follows:
@y
A request is handled as follows:
@z

@x
```mermaid
flowchart TD
  request["Sandbox sends an outbound request"] --> denied{"Does any deny rule match?"}
  denied -->|"Yes, from any source"| block["Block request"]
  denied -->|"No"| orgallow{"Does an organization policy allow it?"}
  orgallow -->|"No"| block
  orgallow -->|"Yes"| needs{"Does any allowing policy require approval?"}
  needs -->|"No"| allow["Allow request"]
  needs -->|"Yes"| approved{"Did the developer already approve this destination?"}
  approved -->|"Yes"| allow
  approved -->|"No"| ask["Block request and ask the developer to approve"]
  ask -.->|"Later requests after approval"| allow
```
@y
```mermaid
flowchart TD
  request["Sandbox sends an outbound request"] --> denied{"Does any deny rule match?"}
  denied -->|"Yes, from any source"| block["Block request"]
  denied -->|"No"| orgallow{"Does an organization policy allow it?"}
  orgallow -->|"No"| block
  orgallow -->|"Yes"| needs{"Does any allowing policy require approval?"}
  needs -->|"No"| allow["Allow request"]
  needs -->|"Yes"| approved{"Did the developer already approve this destination?"}
  approved -->|"Yes"| allow
  approved -->|"No"| ask["Block request and ask the developer to approve"]
  ask -.->|"Later requests after approval"| allow
```
@z

@x
Only a destination the developer has already approved satisfies the requirement.
Preset rules, kit rules, and rules the developer added with `sbx policy
allow network` don't answer it. An approval also can't reach a destination the
organization doesn't allow at all, and it can't override a deny rule. To
withdraw a destination, add a deny rule, which takes precedence over any
approval already recorded.
@y
Only a destination the developer has already approved satisfies the requirement.
Preset rules, kit rules, and rules the developer added with `sbx policy
allow network` don't answer it. An approval also can't reach a destination the
organization doesn't allow at all, and it can't override a deny rule. To
withdraw a destination, add a deny rule, which takes precedence over any
approval already recorded.
@z

@x
Developers respond to approval requests from the command line. For what they
see and how they respond, see
[Respond to approval requests](../../local/approvals.md).
@y
Developers respond to approval requests from the command line. For what they
see and how they respond, see
[Respond to approval requests](../../local/approvals.md).
@z

@x
## When changes take effect
@y
## When changes take effect
@z

@x
Network policy is evaluated on every outbound request. Once a policy change has
[synced to the developer's machine](_index.md#when-policy-changes-reach-developers),
it applies immediately to subsequent requests.
@y
Network policy is evaluated on every outbound request. Once a policy change has
[synced to the developer's machine](_index.md#when-policy-changes-reach-developers),
it applies immediately to subsequent requests.
@z

@x
An approval requirement applies from the point the policy change syncs.
Destinations a developer already approved stay reachable, because the approval
is recorded on the developer's machine.
@y
An approval requirement applies from the point the policy change syncs.
Destinations a developer already approved stay reachable, because the approval
is recorded on the developer's machine.
@z
