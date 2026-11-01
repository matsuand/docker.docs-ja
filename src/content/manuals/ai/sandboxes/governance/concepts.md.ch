%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Policy concepts
@y
title: Policy concepts
@z

@x
description: The resource model, rule syntax, and evaluation logic behind Docker sandbox governance.
keywords: docker sandboxes, policy concepts, rule syntax, network rules, filesystem rules, mcp policy, cedar policy, precedence, rule evaluation
@y
description: The resource model, rule syntax, and evaluation logic behind Docker sandbox governance.
keywords: docker sandboxes, policy concepts, rule syntax, network rules, filesystem rules, mcp policy, cedar policy, precedence, rule evaluation
@z

@x
The governance described here applies to local sandboxes. Cloud sandboxes
use separate network policy configuration. See
[Cloud network policy](../cloud/network-policy.md) for cloud controls.
@y
The governance described here applies to local sandboxes. Cloud sandboxes
use separate network policy configuration. See
[Cloud network policy](../cloud/network-policy.md) for cloud controls.
@z

@x
## Resource model
@y
## Resource model
@z

@x
Docker sandbox governance is built around two resource types: **policies** and
**rules**.
@y
Docker sandbox governance is built around two resource types: **policies** and
**rules**.
@z

@x
A **policy** is a named collection of rules that controls sandbox access.
Policies exist at two levels:
@y
A **policy** is a named collection of rules that controls sandbox access.
Policies exist at two levels:
@z

@x
- **Local**: configured per machine using the `sbx policy` CLI. Applies to
  sandboxes on that machine only.
- **Organization**: configured in Docker Home. Network and filesystem policies
  can also be managed via the
  [Governance API](/reference/api/ai-governance/). Applies to sandboxes across
  the organization. An organization can have several policies, each applying
  either org-wide or to specific teams. See [Policy scope](#policy-scope).
@y
- **Local**: configured per machine using the `sbx policy` CLI. Applies to
  sandboxes on that machine only.
- **Organization**: configured in Docker Home. Network and filesystem policies
  can also be managed via the
  [Governance API](__SUBDIR__/reference/api/ai-governance/). Applies to sandboxes across
  the organization. An organization can have several policies, each applying
  either org-wide or to specific teams. See [Policy scope](#policy-scope).
@z

@x
When organization governance is active, only organization allow rules can grant
access. Local and kit-defined deny rules still apply on top. See
[Precedence](#precedence).
@y
When organization governance is active, only organization allow rules can grant
access. Local and kit-defined deny rules still apply on top. See
[Precedence](#precedence).
@z

@x
A **rule** is the unit of access control within a policy. Each rule has:
@y
A **rule** is the unit of access control within a policy. Each rule has:
@z

@x
- **Name**: a human-readable label
- **Actions**: the type of access the rule controls
- **Resources**: the targets the rule matches against
- **Decision**: `allow` or `deny`
@y
- **Name**: a human-readable label
- **Actions**: the type of access the rule controls
- **Resources**: the targets the rule matches against
- **Decision**: `allow` or `deny`
@z

@x
Rules are grouped by domain. Network and filesystem rules in a policy must
share the same domain, either `network` or `filesystem`. MCP policies use Cedar
statements written in the `MCP` namespace instead of the network and filesystem
rule format.
@y
Rules are grouped by domain. Network and filesystem rules in a policy must
share the same domain, either `network` or `filesystem`. MCP policies use Cedar
statements written in the `MCP` namespace instead of the network and filesystem
rule format.
@z

@x
An organization network policy can also require approval, which turns every
allow in that policy into a request the developer must confirm before access is
granted. Approval is set on the policy rather than on individual rules, so it
applies to all of the policy's allow rules at once. Without organization
governance, a request with no matching allow or deny rule also asks for
approval. See
[Approval-required access](access-controls/network.md#approval-required-access).
@y
An organization network policy can also require approval, which turns every
allow in that policy into a request the developer must confirm before access is
granted. Approval is set on the policy rather than on individual rules, so it
applies to all of the policy's allow rules at once. Without organization
governance, a request with no matching allow or deny rule also asks for
approval. See
[Approval-required access](access-controls/network.md#approval-required-access).
@z

@x
Network approval is separate from the MCP `@requireApproval` annotation. An MCP
approval confirms a single call within the session and creates no rule, while
an approved network destination stays allowed until you remove the rule. See
[MCP access policies](access-controls/mcp.md).
@y
Network approval is separate from the MCP `@requireApproval` annotation. An MCP
approval confirms a single call within the session and creates no rule, while
an approved network destination stays allowed until you remove the rule. See
[MCP access policies](access-controls/mcp.md).
@z

@x
### Limits
@y
### Limits
@z

@x
Organization policies have the following limits, which help ensure fair usage
and resource availability across organizations:
@y
Organization policies have the following limits, which help ensure fair usage
and resource availability across organizations:
@z

@x
| Limit                     | Value                                               |
|---------------------------|-----------------------------------------------------|
| Policies per organization | 100                                                 |
| Rules per policy          | 250                                                 |
| Policy size               | 400 KB total, shared across all of a policy's rules |
@y
| Limit                     | Value                                               |
|---------------------------|-----------------------------------------------------|
| Policies per organization | 100                                                 |
| Rules per policy          | 250                                                 |
| Policy size               | 400 KB total, shared across all of a policy's rules |
@z

@x
Typical policies use only a small fraction of the policy size limit. Domain
and file path values have no separate length limit beyond valid format.
@y
Typical policies use only a small fraction of the policy size limit. Domain
and file path values have no separate length limit beyond valid format.
@z

@x
If these limits don't fit your organization's needs,
[contact Docker Sales](https://www.docker.com/products/ai-governance/#contact-sales)
to discuss options.
@y
If these limits don't fit your organization's needs,
[contact Docker Sales](https://www.docker.com/products/ai-governance/#contact-sales)
to discuss options.
@z

@x
## Policy scope
@y
## Policy scope
@z

@x
Each organization policy applies either across the whole organization or only
to specific teams:
@y
Each organization policy applies either across the whole organization or only
to specific teams:
@z

@x
- Org-wide: with no teams assigned, the policy applies to every member of the
  organization.
- Team-scoped: with one or more teams assigned, the policy applies only to
  members of those teams.
@y
- Org-wide: with no teams assigned, the policy applies to every member of the
  organization.
- Team-scoped: with one or more teams assigned, the policy applies only to
  members of those teams.
@z

@x
Teams are the same [teams](/manuals/accounts/organization/manage/manage-a-team.md)
you manage for your organization; Docker matches a policy's teams against each
user's team membership. Because an organization can mix org-wide and team-scoped
policies, a single user is often subject to several at once. The policies that
apply to a given user are their _effective policies_: every org-wide policy,
plus every team-scoped policy for a team they belong to. See
[Rule evaluation](#rule-evaluation) for how a user's effective policies combine.
@y
Teams are the same [teams](manuals/accounts/organization/manage/manage-a-team.md)
you manage for your organization; Docker matches a policy's teams against each
user's team membership. Because an organization can mix org-wide and team-scoped
policies, a single user is often subject to several at once. The policies that
apply to a given user are their _effective policies_: every org-wide policy,
plus every team-scoped policy for a team they belong to. See
[Rule evaluation](#rule-evaluation) for how a user's effective policies combine.
@z

@x
## Rule syntax
@y
## Rule syntax
@z

@x
### Network rules
@y
### Network rules
@z

@x
Network rules use `connect:tcp` for TCP and `connect:udp` for UDP. Resources are
hostnames, CIDR ranges, or ports. UDP requires
[experimental outbound UDP](access-controls/local.md#allow-outbound-udp).
ICMP is blocked.
@y
Network rules use `connect:tcp` for TCP and `connect:udp` for UDP. Resources are
hostnames, CIDR ranges, or ports. UDP requires
[experimental outbound UDP](access-controls/local.md#allow-outbound-udp).
ICMP is blocked.
@z

@x
**Hostname patterns**
@y
**Hostname patterns**
@z

@x
| Pattern               | Example           | Matches                                                      |
| --------------------- | ----------------- | ------------------------------------------------------------- |
| Exact hostname        | `example.com`     | `example.com` on any port, not subdomains                     |
| Single-level wildcard | `*.example.com`   | One subdomain level, any port: `api.example.com`              |
| Multi-level wildcard  | `**.example.com`  | Any depth, any port: `api.example.com`, `v2.api.example.com`  |
| Hostname with port    | `example.com:443` | `example.com` on port 443 only                                |
@y
| Pattern               | Example           | Matches                                                      |
| --------------------- | ----------------- | ------------------------------------------------------------- |
| Exact hostname        | `example.com`     | `example.com` on any port, not subdomains                     |
| Single-level wildcard | `*.example.com`   | One subdomain level, any port: `api.example.com`              |
| Multi-level wildcard  | `**.example.com`  | Any depth, any port: `api.example.com`, `v2.api.example.com`  |
| Hostname with port    | `example.com:443` | `example.com` on port 443 only                                |
@z

@x
`example.com` and `*.example.com` don't cover each other. Specify both if you
need to match the root domain and its subdomains.
@y
`example.com` and `*.example.com` don't cover each other. Specify both if you
need to match the root domain and its subdomains.
@z

@x
**CIDR ranges**
@y
**CIDR ranges**
@z

@x
Both IPv4 and IPv6 notation are supported: `10.0.0.0/8`, `192.168.1.0/24`,
`2001:db8::/32`.
@y
Both IPv4 and IPv6 notation are supported: `10.0.0.0/8`, `192.168.1.0/24`,
`2001:db8::/32`.
@z

@x
#### HTTP method and path
@y
#### HTTP method and path
@z

@x
A network rule matches a destination host on its own. An HTTP rule is a network
rule that also names an HTTP method and URL path, with optional query-parameter
restrictions, so a policy can allow selected API requests.
@y
A network rule matches a destination host on its own. An HTTP rule is a network
rule that also names an HTTP method and URL path, with optional query-parameter
restrictions, so a policy can allow selected API requests.
@z

@x
An HTTP rule names one or more methods, a destination, and path patterns. What
each part accepts depends on where you configure the rule:
@y
An HTTP rule names one or more methods, a destination, and path patterns. What
each part accepts depends on where you configure the rule:
@z

@x
| Part        | Organization policy                        | Local policy                      |
| ----------- | ------------------------------------------ | --------------------------------- |
| Method      | One or more listed methods                 | `ANY`, or one or more methods     |
| Destination | A host or IP address                       | A host                            |
| Path        | One or more absolute path patterns         | One absolute path pattern         |
@y
| Part        | Organization policy                        | Local policy                      |
| ----------- | ------------------------------------------ | --------------------------------- |
| Method      | One or more listed methods                 | `ANY`, or one or more methods     |
| Destination | A host or IP address                       | A host                            |
| Path        | One or more absolute path patterns         | One absolute path pattern         |
@z

@x
A destination can include a port, and a path pattern looks like `/api/**`.
@y
A destination can include a port, and a path pattern looks like `/api/**`.
@z

@x
A local rule doesn't accept an IP address or a CIDR range. Use a plain network
rule for those destinations. To cover a second path in a local policy, add a
second rule.
@y
A local rule doesn't accept an IP address or a CIDR range. Use a plain network
rule for those destinations. To cover a second path in a local policy, add a
second rule.
@z

@x
Every rule applies to at least one method. On the CLI, `--method ANY` covers
every HTTP method. In the composer, a rule with no methods selected covers
every method the composer lists. For the methods you can select individually, see
[Add a network rule](access-controls/organization.md#add-a-network-rule) for an
organization policy and
[HTTP method and path rules](access-controls/local.md#http-method-and-path-rules)
for a local one.
@y
Every rule applies to at least one method. On the CLI, `--method ANY` covers
every HTTP method. In the composer, a rule with no methods selected covers
every method the composer lists. For the methods you can select individually, see
[Add a network rule](access-controls/organization.md#add-a-network-rule) for an
organization policy and
[HTTP method and path rules](access-controls/local.md#http-method-and-path-rules)
for a local one.
@z

@x
Path patterns follow the same wildcard rules as filesystem paths, where `*`
matches within one path segment and `**` matches any depth. A pattern without a
wildcard matches that path exactly, so `/repos` matches `/repos` and nothing
below it. Every pattern must start with `/` and can't contain a query string, a
fragment, or a `..` segment. A local rule's path must also be canonical, so it
can't contain percent-encoding, control characters, repeated or trailing
slashes, or a `.` segment. For the full list, see
[HTTP method and path rules](access-controls/local.md#http-method-and-path-rules).
@y
Path patterns follow the same wildcard rules as filesystem paths, where `*`
matches within one path segment and `**` matches any depth. A pattern without a
wildcard matches that path exactly, so `/repos` matches `/repos` and nothing
below it. Every pattern must start with `/` and can't contain a query string, a
fragment, or a `..` segment. A local rule's path must also be canonical, so it
can't contain percent-encoding, control characters, repeated or trailing
slashes, or a `.` segment. For the full list, see
[HTTP method and path rules](access-controls/local.md#http-method-and-path-rules).
@z

@x
##### Query parameters
@y
##### Query parameters
@z

@x
An HTTP rule can also restrict query parameters independently of the path.
@y
An HTTP rule can also restrict query parameters independently of the path.
@z

@x
Use exact parameter names and values, or a single `*` at the start or end of a
value to match a suffix or prefix. A value of `*` matches any value, including
an empty one. Names cannot contain wildcards. Names and values are
case-sensitive.
@y
Use exact parameter names and values, or a single `*` at the start or end of a
value to match a suffix or prefix. A value of `*` matches any value, including
an empty one. Names cannot contain wildcards. Names and values are
case-sensitive.
@z

@x
For rules created with `--query`, every specified parameter must match.
Parameter order doesn't matter, and requests may include additional parameters. Repeating a parameter
name in the rule requires separate matching occurrences in the request. A rule
without query restrictions matches regardless of query parameters.
@y
For rules created with `--query`, every specified parameter must match.
Parameter order doesn't matter, and requests may include additional parameters. Repeating a parameter
name in the rule requires separate matching occurrences in the request. A rule
without query restrictions matches regardless of query parameters.
@z

@x
Write names and value patterns using URL query encoding: `+` or `%20` for a
space, `%2B` for a literal plus, and `%2A` for a literal asterisk. Keep query
parameters out of `--path`. For CLI examples, see
[Local HTTP rules](access-controls/local.md#http-method-and-path-rules).
@y
Write names and value patterns using URL query encoding: `+` or `%20` for a
space, `%2B` for a literal plus, and `%2A` for a literal asterisk. Keep query
parameters out of `--path`. For CLI examples, see
[Local HTTP rules](access-controls/local.md#http-method-and-path-rules).
@z

@x
##### Combine HTTP and network rules
@y
##### Combine HTTP and network rules
@z

@x
HTTP requests are evaluated against both layers. A network rule sets the
baseline for a host, and HTTP rules narrow access by method, path, and query
parameters:
@y
HTTP requests are evaluated against both layers. A network rule sets the
baseline for a host, and HTTP rules narrow access by method, path, and query
parameters:
@z

@x
| Rules that cover the host   | Result for an HTTP request                                              |
| --------------------------- | ----------------------------------------------------------------------- |
| Network allow only          | Allowed at any method and path                                          |
| HTTP allow only             | Allowed only where a rule matches the method, path, and any query restrictions. Anything else is denied |
| Network allow and HTTP deny | Requests matching the HTTP deny are blocked. The rest stay allowed          |
| Network deny                | Blocked. An HTTP allow can't reopen a denied host                        |
@y
| Rules that cover the host   | Result for an HTTP request                                              |
| --------------------------- | ----------------------------------------------------------------------- |
| Network allow only          | Allowed at any method and path                                          |
| HTTP allow only             | Allowed only where a rule matches the method, path, and any query restrictions. Anything else is denied |
| Network allow and HTTP deny | Requests matching the HTTP deny are blocked. The rest stay allowed          |
| Network deny                | Blocked. An HTTP allow can't reopen a denied host                        |
@z

@x
A network deny is therefore a floor that HTTP rules can't raise, while a
network allow is a ceiling that HTTP rules can carve into.
@y
A network deny is therefore a floor that HTTP rules can't raise, while a
network allow is a ceiling that HTTP rules can carve into.
@z

@x
When a rule requires an HTTP decision, the sandbox HTTP proxy
evaluates each request separately instead of deciding once per connection.
@y
When a rule requires an HTTP decision, the sandbox HTTP proxy
evaluates each request separately instead of deciding once per connection.
@z

@x
Those requests have to go through the proxy. A connection it can't inspect,
such as one it handles transparently, is blocked rather than evaluated.
Traffic that isn't HTTP, such as SSH, carries no method or path, so HTTP rules
never match it. Control those destinations with network rules.
@y
Those requests have to go through the proxy. A connection it can't inspect,
such as one it handles transparently, is blocked rather than evaluated.
Traffic that isn't HTTP, such as SSH, carries no method or path, so HTTP rules
never match it. Control those destinations with network rules.
@z

@x
For local and organization policy configuration, see
[Network access policies](access-controls/network.md).
@y
For local and organization policy configuration, see
[Network access policies](access-controls/network.md).
@z

@x
### Filesystem rules
@y
### Filesystem rules
@z

@x
Filesystem rules use the actions `read` and `write`. Resources are host paths
that sandboxes can mount as workspaces.
@y
Filesystem rules use the actions `read` and `write`. Resources are host paths
that sandboxes can mount as workspaces.
@z

@x
A workspace mounted with write access must be allowed by both a `read` and a
`write` rule; a read-only workspace needs only `read`. When default deny blocks
a mount, the denial reason names whether read or write access was missing.
@y
A workspace mounted with write access must be allowed by both a `read` and a
`write` rule; a read-only workspace needs only `read`. When default deny blocks
a mount, the denial reason names whether read or write access was missing.
@z

@x
`~` expands to the user's home directory on every platform, including Windows,
where it resolves to `%USERPROFILE%`. A single `~/**` rule therefore matches
each user's home tree on macOS, Linux, and Windows. The policy engine expands
only `~`: it does not expand environment variables, so a pattern such as
`%USERPROFILE%\**` or `$HOME/**` matches nothing.
@y
`~` expands to the user's home directory on every platform, including Windows,
where it resolves to `%USERPROFILE%`. A single `~/**` rule therefore matches
each user's home tree on macOS, Linux, and Windows. The policy engine expands
only `~`: it does not expand environment variables, so a pattern such as
`%USERPROFILE%\**` or `$HOME/**` matches nothing.
@z

@x
For a path outside the home directory, write it in the format the user's
operating system uses. A rule matches only the format it's written in, so a
location that several platforms share needs a rule for each:
@y
For a path outside the home directory, write it in the format the user's
operating system uses. A rule matches only the format it's written in, so a
location that several platforms share needs a rule for each:
@z

@x
| Operating system | Example path                               |
| ---------------- | ------------------------------------------ |
| macOS, Linux     | `/data/project/**`                         |
| Windows          | `C:\data\project\**`                       |
| WSL              | `\\wsl.localhost\<distro>\data\project\**` |
@y
| Operating system | Example path                               |
| ---------------- | ------------------------------------------ |
| macOS, Linux     | `/data/project/**`                         |
| Windows          | `C:\data\project\**`                       |
| WSL              | `\\wsl.localhost\<distro>\data\project\**` |
@z

@x
On Windows, `*:` matches any drive letter, so `*:\data\**` matches the path on
any drive.
@y
On Windows, `*:` matches any drive letter, so `*:\data\**` matches the path on
any drive.
@z

@x
Wildcards behave the same way in every path format:
@y
Wildcards behave the same way in every path format:
@z

@x
| Pattern            | Example    | Matches                                                    |
| ------------------ | ---------- | ---------------------------------------------------------- |
| Exact path         | `/data`    | `/data` only                                               |
| Segment wildcard   | `/data/*`  | `/data/project`, one path segment only, not subdirectories |
| Recursive wildcard | `/data/**` | `/data/project`, `/data/project/src`, any depth            |
@y
| Pattern            | Example    | Matches                                                    |
| ------------------ | ---------- | ---------------------------------------------------------- |
| Exact path         | `/data`    | `/data` only                                               |
| Segment wildcard   | `/data/*`  | `/data/project`, one path segment only, not subdirectories |
| Recursive wildcard | `/data/**` | `/data/project`, `/data/project/src`, any depth            |
@z

@x
Use `**` to match a directory tree recursively. A single `*` matches within one
path segment and won't cross a path separator. For example, `~/**` matches all
paths under the home directory, while `~/*` matches only its direct children.
@y
Use `**` to match a directory tree recursively. A single `*` matches within one
path segment and won't cross a path separator. For example, `~/**` matches all
paths under the home directory, while `~/*` matches only its direct children.
@z

@x
For organization policy configuration and enforcement details, see
[Filesystem access policies](access-controls/filesystem.md).
@y
For organization policy configuration and enforcement details, see
[Filesystem access policies](access-controls/filesystem.md).
@z

@x
### MCP policies
@y
### MCP policies
@z

@x
MCP policies control Model Context Protocol activity made available to a
sandbox through Docker's [MCP gateway](../mcp-gateway.md). They are
organization policies written in Cedar using the `MCP` namespace, rather than
the network and filesystem rule format.
@y
MCP policies control Model Context Protocol activity made available to a
sandbox through Docker's [MCP gateway](../mcp-gateway.md). They are
organization policies written in Cedar using the `MCP` namespace, rather than
the network and filesystem rule format.
@z

@x
MCP policy applies when a developer registers a server and when an agent uses
the MCP gateway. Registration rules control future `sbx mcp add` operations.
Use-time rules control tool calls, gateway meta-tools, resource reads, and
prompt retrieval from servers that are already registered or loaded.
@y
MCP policy applies when a developer registers a server and when an agent uses
the MCP gateway. Registration rules control future `sbx mcp add` operations.
Use-time rules control tool calls, gateway meta-tools, resource reads, and
prompt retrieval from servers that are already registered or loaded.
@z

@x
Governed MCP activity is default deny: a request is blocked unless a matching
`permit` allows it. A matching `forbid` overrides any `permit`, including a
permit that requires approval. Policy scope supplies the principal, so use
organization or team scope instead of matching users, teams, tenants, or roles
in Cedar.
@y
Governed MCP activity is default deny: a request is blocked unless a matching
`permit` allows it. A matching `forbid` overrides any `permit`, including a
permit that requires approval. Policy scope supplies the principal, so use
organization or team scope instead of matching users, teams, tenants, or roles
in Cedar.
@z

@x
For representative policies, see [MCP access policies](access-controls/mcp.md).
For exact action, resource, context, and approval behavior, see the
[MCP policy reference](reference/mcp-policy.md).
@y
For representative policies, see [MCP access policies](access-controls/mcp.md).
For exact action, resource, context, and approval behavior, see the
[MCP policy reference](reference/mcp-policy.md).
@z

@x
## Rule evaluation
@y
## Rule evaluation
@z

@x
When organization governance is active, the rules from all of a user's
[effective policies](#policy-scope) are combined and evaluated together against
each request, following two principles:
@y
When organization governance is active, the rules from all of a user's
[effective policies](#policy-scope) are combined and evaluated together against
each request, following two principles:
@z

@x
- Deny wins: if any rule matches with `decision: deny`, the request is denied,
  regardless of any matching allow rules.
- Default deny: anything an allow rule doesn't match is blocked. Outbound
  network traffic is blocked unless a network rule allows the destination, and a
  host path can't be mounted unless a filesystem rule allows it. MCP activity is
  blocked unless an MCP `permit` allows it.
@y
- Deny wins: if any rule matches with `decision: deny`, the request is denied,
  regardless of any matching allow rules.
- Default deny: anything an allow rule doesn't match is blocked. Outbound
  network traffic is blocked unless a network rule allows the destination, and a
  host path can't be mounted unless a filesystem rule allows it. MCP activity is
  blocked unless an MCP `permit` allows it.
@z

@x
Because every effective policy feeds the same evaluation, allows are additive (a
request is allowed if any effective policy allows it) and denies are absolute (a
request is blocked if any effective policy denies it). A deny rule in an
org-wide policy therefore applies to everyone and can't be overridden by a
team-scoped policy, which makes org-wide deny rules useful as guardrails.
@y
Because every effective policy feeds the same evaluation, allows are additive (a
request is allowed if any effective policy allows it) and denies are absolute (a
request is blocked if any effective policy denies it). A deny rule in an
org-wide policy therefore applies to everyone and can't be overridden by a
team-scoped policy, which makes org-wide deny rules useful as guardrails.
@z

@x
Local and kit-defined allow rules take no part in this evaluation. Deny rules
from those sources do still apply. See [Precedence](#precedence).
@y
Local and kit-defined allow rules take no part in this evaluation. Deny rules
from those sources do still apply. See [Precedence](#precedence).
@z

@x
A request that an approval-required policy allows produces a third outcome.
Rather than being allowed outright, it's held back until the developer confirms
the destination, and the confirmation governs later requests to it. This holds
even when another policy allows the same request without requiring approval. A
matching deny still wins, so a denied destination is blocked without asking.
See [Approval-required access](access-controls/network.md#approval-required-access).
@y
A request that an approval-required policy allows produces a third outcome.
Rather than being allowed outright, it's held back until the developer confirms
the destination, and the confirmation governs later requests to it. This holds
even when another policy allows the same request without requiring approval. A
matching deny still wins, so a denied destination is blocked without asking.
See [Approval-required access](access-controls/network.md#approval-required-access).
@z

@x
## Precedence
@y
## Precedence
@z

@x
What applies depends on whether your organization has governance enabled:
@y
What applies depends on whether your organization has governance enabled:
@z

@x
- No organization governance: local rules and any kit-defined network rules
  determine what sandboxes can access.
- Organization governance active: organization policy determines what access can
  be granted. Only organization allow rules grant access, so local and
  kit-defined allow rules are inactive and can't expand what the organization
  permits. Deny rules apply from every source, so a local or kit-defined deny
  can still restrict access further.
@y
- No organization governance: local rules and any kit-defined network rules
  determine what sandboxes can access.
- Organization governance active: organization policy determines what access can
  be granted. Only organization allow rules grant access, so local and
  kit-defined allow rules are inactive and can't expand what the organization
  permits. Deny rules apply from every source, so a local or kit-defined deny
  can still restrict access further.
@z

@x
For kit-defined rules, see
[Network policies](https://github.com/docker/sandbox-kit-spec/blob/main/docs/spec/capabilities/com.docker.sandbox/network-policy@1.md)
in the kit specification.
@y
For kit-defined rules, see
[Network policies](https://github.com/docker/sandbox-kit-spec/blob/main/docs/spec/capabilities/com.docker.sandbox/network-policy@1.md)
in the kit specification.
@z

@x
Precedence is decided by a rule's decision rather than its source:
@y
Precedence is decided by a rule's decision rather than its source:
@z

@x
| Rule                | Evaluated under organization governance |
| ------------------- | --------------------------------------- |
| Organization allow  | Yes                                     |
| Organization deny   | Yes                                     |
| Local allow         | No                                      |
| Local deny          | Yes                                     |
| Kit-defined allow   | No                                      |
| Kit-defined deny    | Yes                                     |
@y
| Rule                | Evaluated under organization governance |
| ------------------- | --------------------------------------- |
| Organization allow  | Yes                                     |
| Organization deny   | Yes                                     |
| Local allow         | No                                      |
| Local deny          | Yes                                     |
| Kit-defined allow   | No                                      |
| Kit-defined deny    | Yes                                     |
@z

@x
Local and kit-defined rules cover network access only, so a deny that layers on
top of organization policy is always a network deny. `sbx policy ls` hides
inactive rules by default. See
[Monitoring](monitor-and-enforce/monitoring.md#showing-inactive-rules) for how
to list them.
@y
Local and kit-defined rules cover network access only, so a deny that layers on
top of organization policy is always a network deny. `sbx policy ls` hides
inactive rules by default. See
[Monitoring](monitor-and-enforce/monitoring.md#showing-inactive-rules) for how
to list them.
@z

@x
A local deny takes precedence over an organization approval requirement as
well, so the request is blocked and no approval is requested. Rules that a
developer gains by approving a request are the one exception to local allow
rules being inactive, because they record an answer to the organization's own
approval requirement rather than granting new access. See
[Approval-required access](access-controls/network.md#approval-required-access).
@y
A local deny takes precedence over an organization approval requirement as
well, so the request is blocked and no approval is requested. Rules that a
developer gains by approving a request are the one exception to local allow
rules being inactive, because they record an answer to the organization's own
approval requirement rather than granting new access. See
[Approval-required access](access-controls/network.md#approval-required-access).
@z

@x
When organization governance is active, a user's organization policies are
evaluated together, as described in [Rule evaluation](#rule-evaluation).
@y
When organization governance is active, a user's organization policies are
evaluated together, as described in [Rule evaluation](#rule-evaluation).
@z
