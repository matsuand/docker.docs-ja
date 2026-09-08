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
Network policies control the external destinations that sandboxes can reach.
They are separate from MCP server connections and secret bindings.
@y
Network policies control the external destinations that sandboxes can reach.
They are separate from MCP server connections and secret bindings.
@z

@x
Docker Agentic Platform uses two types of network policy:
@y
Docker Agentic Platform uses two types of network policy:
@z

@x
- Kit policies are read-only policies for each sandbox type. The corresponding
  kit policy is applied automatically when you create a sandbox. These rules
  are the sandbox type's kit defaults. Review them under **Kit policies** on the
  **Policies** page.
- User policies are policies that you can select when you create a sandbox.
  Docker provides the read-only **Open** and **Balanced** presets, and you can
  create custom policies. **Open** allows all outbound destinations.
  **Balanced** allows a curated set of destinations.
@y
- Kit policies are read-only policies for each sandbox type. The corresponding
  kit policy is applied automatically when you create a sandbox. These rules
  are the sandbox type's kit defaults. Review them under **Kit policies** on the
  **Policies** page.
- User policies are policies that you can select when you create a sandbox.
  Docker provides the read-only **Open** and **Balanced** presets, and you can
  create custom policies. **Open** allows all outbound destinations.
  **Balanced** allows a curated set of destinations.
@z

@x
You can select no user policies, one policy, or multiple policies. The selected
user policies are combined with the sandbox type's kit policy. Docker evaluates
all applicable rules, and a deny rule takes precedence over an allow rule.
@y
You can select no user policies, one policy, or multiple policies. The selected
user policies are combined with the sandbox type's kit policy. Docker evaluates
all applicable rules, and a deny rule takes precedence over an allow rule.
@z

@x
If you select no user policies, only the kit policy applies. Network access is
default-deny, so the sandbox can reach only destinations that the kit policy
explicitly allows. If its kit policy has no network rules, all outbound
destinations are blocked.
@y
If you select no user policies, only the kit policy applies. Network access is
default-deny, so the sandbox can reach only destinations that the kit policy
explicitly allows. If its kit policy has no network rules, all outbound
destinations are blocked.
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
When defining access, include every service the sandbox needs during startup
and operation. Depending on the workload, these services can include source
control hosts, package registries, and model providers.
@y
When defining access, include every service the sandbox needs during startup
and operation. Depending on the workload, these services can include source
control hosts, package registries, and model providers.
@z

@x
## Create a policy
@y
## Create a policy
@z

@x
1. Open **Policies** and select **New policy**.
2. Enter a name that identifies the intended workload or access level.
3. Add allow and deny rules for the required destinations.
4. Review the rules and save the policy.
@y
1. Open **Policies** and select **New policy**.
2. Enter a name that identifies the intended workload or access level.
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
You can edit, copy, or delete a custom policy. Docker-managed policies cannot
be edited or deleted.
@y
You can edit, copy, or delete a custom policy. Docker-managed policies cannot
be edited or deleted.
@z

@x
## Understand blocked access
@y
## Understand blocked access
@z

@x
An agent might report an HTTP 403 response, a connection failure, or another
service error when a required destination is not allowed. The error output from
the agent or tool is the primary source for identifying the destination.
@y
An agent might report an HTTP 403 response, a connection failure, or another
service error when a required destination is not allowed. The error output from
the agent or tool is the primary source for identifying the destination.
@z

@x
For a sandbox that uses limited access, account for every host and port the
workload needs, including source control, package registries, model providers,
and supporting APIs. Add the narrowest allow rule that covers the required
destination. Use **Open** when broad outbound access is appropriate for the
workload.
@y
For a sandbox that uses limited access, account for every host and port the
workload needs, including source control, package registries, model providers,
and supporting APIs. Add the narrowest allow rule that covers the required
destination. Use **Open** when broad outbound access is appropriate for the
workload.
@z

@x
Network policy controls outbound destinations. It does not grant MCP tools or
supply credentials. Configure those separately under **MCP** and **Secrets**.
@y
Network policy controls outbound destinations. It does not grant MCP tools or
supply credentials. Configure those separately under **MCP** and **Secrets**.
@z
