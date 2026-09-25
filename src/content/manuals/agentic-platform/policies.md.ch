%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Network policies
linkTitle: Policies
description: Control outbound network access from Docker Agentic Platform sandboxes.
keywords: docker agentic platform, network policies, network access, allow rules, deny rules
@y
title: Network policies
linkTitle: Policies
description: Control outbound network access from Docker Agentic Platform sandboxes.
keywords: docker agentic platform, network policies, network access, allow rules, deny rules
@z

@x
Use network policies to control which hosts and services your sandbox can
reach. For tools and authentication, configure [MCP](mcp.md) and
[Secrets](secrets.md) separately.
@y
Use network policies to control which hosts and services your sandbox can
reach. For tools and authentication, configure [MCP](mcp.md) and
[Secrets](secrets.md) separately.
@z

@x
There are two types of network policy:
@y
There are two types of network policy:
@z

@x
- Kit policies are the read-only network rules defined by the selected kit.
  They apply automatically when you create a sandbox, including when you use a
  custom kit. Review curated kit rules under **Kit policies** on the
  **Policies** page. The launcher's policy picker also shows the selected kit's
  policy when the kit includes network rules.
- User policies are policies that you can select when you create a sandbox.
  Choose the read-only **Open** or **Balanced** presets, or create a custom
  policy. **Open** allows outbound access to any host. **Balanced** allows
  access to a curated set of hosts and services.
@y
- Kit policies are the read-only network rules defined by the selected kit.
  They apply automatically when you create a sandbox, including when you use a
  custom kit. Review curated kit rules under **Kit policies** on the
  **Policies** page. The launcher's policy picker also shows the selected kit's
  policy when the kit includes network rules.
- User policies are policies that you can select when you create a sandbox.
  Choose the read-only **Open** or **Balanced** presets, or create a custom
  policy. **Open** allows outbound access to any host. **Balanced** allows
  access to a curated set of hosts and services.
@z

@x
## Select policies for a sandbox
@y
## Select policies for a sandbox
@z

@x
The launcher remembers your policy selections from the previous launch in the
same browser. Without saved selections, it selects the account's policies
marked **Always applied**. These policies can't be deselected in the launcher.
You can select zero, one, or several additional user policies.
@y
The launcher remembers your policy selections from the previous launch in the
same browser. Without saved selections, it selects the account's policies
marked **Always applied**. These policies can't be deselected in the launcher.
You can select zero, one, or several additional user policies.
@z

@x
## How policies combine
@y
## How policies combine
@z

@x
Allow rules from all applicable user policies and the kit are combined. A
destination allowed by any of these rules is permitted unless an explicit
deny rule blocks it. Deny rules take precedence over allow rules.
@y
Allow rules from all applicable user policies and the kit are combined. A
destination allowed by any of these rules is permitted unless an explicit
deny rule blocks it. Deny rules take precedence over allow rules.
@z

@x
For example, selecting both **Open** and **Balanced** permits all outbound
destinations except those explicitly denied. Open's `**` rule already allows
all destinations, so Balanced's allow list doesn't narrow access. To restrict
access with an allow list, deselect **Open** if it is selected and can be
removed, and review the allow rules in the remaining policies and kit.
@y
For example, selecting both **Open** and **Balanced** permits all outbound
destinations except those explicitly denied. Open's `**` rule already allows
all destinations, so Balanced's allow list doesn't narrow access. To restrict
access with an allow list, deselect **Open** if it is selected and can be
removed, and review the allow rules in the remaining policies and kit.
@z

@x
If the combined allow list contains any rules, destinations outside that list
are blocked. This default behavior isn't an explicit deny rule: adding an
allow rule in another policy permits the matching destinations. If the
combined allow list is empty or absent, the sandbox can reach any destination
except those blocked by deny rules.
@y
If the combined allow list contains any rules, destinations outside that list
are blocked. This default behavior isn't an explicit deny rule: adding an
allow rule in another policy permits the matching destinations. If the
combined allow list is empty or absent, the sandbox can reach any destination
except those blocked by deny rules.
@z

@x
## Policy rules
@y
## Policy rules
@z

@x
Policy rules allow or deny network destinations. Use the following hostname
patterns:
@y
Policy rules allow or deny network destinations. Use the following hostname
patterns:
@z

@x
| Pattern               | Example           | Matches                                            |
| --------------------- | ----------------- | -------------------------------------------------- |
| Exact hostname        | `example.com`     | `example.com` only, not subdomains                 |
| Single-level wildcard | `*.example.com`   | One subdomain level, such as `api.example.com`     |
| Multi-level wildcard  | `**.example.com`  | Any depth: `api.example.com`, `v2.api.example.com` |
| Hostname with port    | `example.com:443` | `example.com` on port 443 only                     |
@y
| Pattern               | Example           | Matches                                            |
| --------------------- | ----------------- | -------------------------------------------------- |
| Exact hostname        | `example.com`     | `example.com` only, not subdomains                 |
| Single-level wildcard | `*.example.com`   | One subdomain level, such as `api.example.com`     |
| Multi-level wildcard  | `**.example.com`  | Any depth: `api.example.com`, `v2.api.example.com` |
| Hostname with port    | `example.com:443` | `example.com` on port 443 only                     |
@z

@x
`example.com` does not match subdomains, and `*.example.com` does not match the
root domain. Add each pattern required by your destinations.
@y
`example.com` does not match subdomains, and `*.example.com` does not match the
root domain. Add each pattern required by your destinations.
@z

@x
You can also match IPv4 and IPv6 CIDR ranges, such as `10.0.0.0/8`,
`192.168.1.0/24`, and `2001:db8::/32`.
@y
You can also match IPv4 and IPv6 CIDR ranges, such as `10.0.0.0/8`,
`192.168.1.0/24`, and `2001:db8::/32`.
@z

@x
Include the hosts your agent needs both during setup and while it runs, such
as source control services, package registries, and model providers.
@y
Include the hosts your agent needs both during setup and while it runs, such
as source control services, package registries, and model providers.
@z

@x
## Create a policy
@y
## Create a policy
@z

@x
1. Open **Policies** and select **New policy**.
2. Give the policy a name that describes what it's for.
3. Add allow and deny rules for the required destinations.
4. Review the rules and save the policy.
@y
1. Open **Policies** and select **New policy**.
2. Give the policy a name that describes what it's for.
3. Add allow and deny rules for the required destinations.
4. Review the rules and save the policy.
@z

@x
To apply the policy, select it under **Egress policy for this sandbox** when you
create a sandbox.
@y
To apply the policy, select it under **Egress policy for this sandbox** when you
create a sandbox.
@z

@x
You can edit, copy, or delete a custom policy. You can't edit or delete the
built-in presets or kit policies.
@y
You can edit, copy, or delete a custom policy. You can't edit or delete the
built-in presets or kit policies.
@z

@x
## Understand blocked access
@y
## Understand blocked access
@z

@x
If a policy blocks a service, your agent or tool might report an HTTP 403
response, a connection failure, or another service error. Check the error
message for the host it tried to reach.
@y
If a policy blocks a service, your agent or tool might report an HTTP 403
response, a connection failure, or another service error. Check the error
message for the host it tried to reach.
@z

@x
Check that your allow rules cover the host and port, along with any supporting
APIs the service needs. Add the narrowest rule that permits the required
access. Use **Open** if your task needs broad outbound access.
@y
Check that your allow rules cover the host and port, along with any supporting
APIs the service needs. Add the narrowest rule that permits the required
access. Use **Open** if your task needs broad outbound access.
@z
