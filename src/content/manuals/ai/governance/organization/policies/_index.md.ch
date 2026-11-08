%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Organization policies
linkTitle: Policies
@y
title: Organization policies
linkTitle: Policies
@z

@x
description: How organization policy scope, rule evaluation, and precedence work for Docker Sandboxes.
keywords: docker sandboxes, organization policy, policy scope, rule evaluation, precedence, governance
@y
description: How organization policy scope, rule evaluation, and precedence work for Docker Sandboxes.
keywords: docker sandboxes, organization policy, policy scope, rule evaluation, precedence, governance
@z

@x
{{< summary-bar feature_name="AI Governance" >}}
@y
{{< summary-bar feature_name="AI Governance" >}}
@z

@x
Organization policies control what sandboxes can access for organization
members. When a developer's sandbox makes a request, three questions decide
the outcome: which of your policies apply to that developer, what their rules
say about the request, and how your policy relates to the local and kit
rules on the developer's machine. This page answers each in turn, then explains
when your changes reach developers. To create a policy, see
[Create and manage organization policies](create-manage.md).
@y
Organization policies control what sandboxes can access for organization
members. When a developer's sandbox makes a request, three questions decide
the outcome: which of your policies apply to that developer, what their rules
say about the request, and how your policy relates to the local and kit
rules on the developer's machine. This page answers each in turn, then explains
when your changes reach developers. To create a policy, see
[Create and manage organization policies](create-manage.md).
@z

@x
## What a policy contains
@y
## What a policy contains
@z

@x
An organization policy is a named collection of rules. Each rule has a name,
the actions it controls, the resources it matches, and a decision of `allow` or
`deny`. Each policy covers one kind of access:
@y
An organization policy is a named collection of rules. Each rule has a name,
the actions it controls, the resources it matches, and a decision of `allow` or
`deny`. Each policy covers one kind of access:
@z

@x
- [Organization network access policies](network.md) control the destinations
  sandboxes can reach.
- [Organization filesystem access policies](filesystem.md) control the host
  paths developers can mount into sandboxes.
- [Organization MCP access policies](mcp.md) control the MCP servers developers
  can register and what agents can do with them. They use Cedar statements in
  the `MCP` namespace instead of rules.
@y
- [Organization network access policies](network.md) control the destinations
  sandboxes can reach.
- [Organization filesystem access policies](filesystem.md) control the host
  paths developers can mount into sandboxes.
- [Organization MCP access policies](mcp.md) control the MCP servers developers
  can register and what agents can do with them. They use Cedar statements in
  the `MCP` namespace instead of rules.
@z

@x
## Policy scope
@y
## Policy scope
@z

@x
Organization policies apply only to members who hold an AI Governance license.
Each policy applies to those members either across the whole organization or
only on specific teams:
@y
Organization policies apply only to members who hold an AI Governance license.
Each policy applies to those members either across the whole organization or
only on specific teams:
@z

@x
- Org-wide: with no teams assigned, the policy applies to every licensed member
  of the organization.
- Team-scoped: with one or more teams assigned, the policy applies only to
  licensed members of those teams.
@y
- Org-wide: with no teams assigned, the policy applies to every licensed member
  of the organization.
- Team-scoped: with one or more teams assigned, the policy applies only to
  licensed members of those teams.
@z

@x
Teams are the same [teams](/manuals/accounts/organization/manage/manage-a-team.md)
you manage for your organization. Docker matches a policy's teams against each
member's team membership. Because an organization can mix org-wide and
team-scoped policies, a single member is often subject to several at once. The
policies that apply to a given member are their effective policies: every
org-wide policy, plus every team-scoped policy for a team they belong to.
@y
Teams are the same [teams](manuals/accounts/organization/manage/manage-a-team.md)
you manage for your organization. Docker matches a policy's teams against each
member's team membership. Because an organization can mix org-wide and
team-scoped policies, a single member is often subject to several at once. The
policies that apply to a given member are their effective policies: every
org-wide policy, plus every team-scoped policy for a team they belong to.
@z

@x
Use org-wide policies for guardrails that must apply everywhere, and
team-scoped policies for access that only some teams need. The next section
explains why org-wide deny rules work well as guardrails.
@y
Use org-wide policies for guardrails that must apply everywhere, and
team-scoped policies for access that only some teams need. The next section
explains why org-wide deny rules work well as guardrails.
@z

@x
## How rules decide a request
@y
## How rules decide a request
@z

@x
When an organization policy is enforced for you, the rules from all of your
effective policies are combined and evaluated together against each request,
following two principles:
@y
When an organization policy is enforced for you, the rules from all of your
effective policies are combined and evaluated together against each request,
following two principles:
@z

@x
- Deny wins: if any rule matches with `decision: deny`, the request is denied,
  regardless of any matching allow rules.
- Default deny: anything an allow rule doesn't match is blocked. Outbound
  network traffic is blocked unless a network rule allows the destination, a
  host path can't be mounted unless a filesystem mount rule allows it, and MCP
  activity is blocked unless an MCP `permit` allows it.
@y
- Deny wins: if any rule matches with `decision: deny`, the request is denied,
  regardless of any matching allow rules.
- Default deny: anything an allow rule doesn't match is blocked. Outbound
  network traffic is blocked unless a network rule allows the destination, a
  host path can't be mounted unless a filesystem mount rule allows it, and MCP
  activity is blocked unless an MCP `permit` allows it.
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
For example, an org-wide policy allows `git.example.com` and denies
`paste.example.com`, and a team-scoped policy for the Data team allows
`packages.example.com` and `paste.example.com`:
@y
For example, an org-wide policy allows `git.example.com` and denies
`paste.example.com`, and a team-scoped policy for the Data team allows
`packages.example.com` and `paste.example.com`:
@z

@x
| Destination            | Data team member                        | Everyone else                  |
| ---------------------- | --------------------------------------- | ------------------------------ |
| `git.example.com`      | Allowed by the org-wide policy          | Allowed by the org-wide policy |
| `packages.example.com` | Allowed by the team-scoped policy       | Blocked by default deny        |
| `paste.example.com`    | Blocked, because the org-wide deny wins | Blocked by the org-wide deny   |
| Anything else          | Blocked by default deny                 | Blocked by default deny        |
@y
| Destination            | Data team member                        | Everyone else                  |
| ---------------------- | --------------------------------------- | ------------------------------ |
| `git.example.com`      | Allowed by the org-wide policy          | Allowed by the org-wide policy |
| `packages.example.com` | Allowed by the team-scoped policy       | Blocked by default deny        |
| `paste.example.com`    | Blocked, because the org-wide deny wins | Blocked by the org-wide deny   |
| Anything else          | Blocked by default deny                 | Blocked by default deny        |
@z

@x
An approval requirement adds a step before access is allowed. If the Data
team's policy required approval, a Data team member's first request to
`packages.example.com` would be blocked and they'd be asked to approve it, and
later requests would succeed. `paste.example.com` would still be blocked
without asking, because a deny never asks for approval. For more details, see
[Approval-required access](network.md#approval-required-access).
@y
An approval requirement adds a step before access is allowed. If the Data
team's policy required approval, a Data team member's first request to
`packages.example.com` would be blocked and they'd be asked to approve it, and
later requests would succeed. `paste.example.com` would still be blocked
without asking, because a deny never asks for approval. For more details, see
[Approval-required access](network.md#approval-required-access).
@z

@x
### How organization policy relates to local and kit rules
@y
### How organization policy relates to local and kit rules
@z

@x
Your organization's rules aren't the only ones on a developer's machine.
Developers also have their own local rules, and kits can add rules to the
sandboxes that use them. What applies depends on whether an organization
policy is enforced for the developer:
@y
Your organization's rules aren't the only ones on a developer's machine.
Developers also have their own local rules, and kits can add rules to the
sandboxes that use them. What applies depends on whether an organization
policy is enforced for the developer:
@z

@x
- No organization policy: local rules and any kit rules determine what
  sandboxes can access.
- Organization policy enforced: organization policy determines what access can
  be granted. Only organization allow rules grant access, so local and kit
  allow rules are inactive and can't expand what the organization permits.
  Deny rules apply from every source, so a local or kit deny rule can still
  restrict access further.
@y
- No organization policy: local rules and any kit rules determine what
  sandboxes can access.
- Organization policy enforced: organization policy determines what access can
  be granted. Only organization allow rules grant access, so local and kit
  allow rules are inactive and can't expand what the organization permits.
  Deny rules apply from every source, so a local or kit deny rule can still
  restrict access further.
@z

@x
The following table summarizes which rules are evaluated when an organization
policy is enforced:
@y
The following table summarizes which rules are evaluated when an organization
policy is enforced:
@z

@x
| Rule               | Evaluated |
| ------------------ | --------- |
| Organization allow | Yes       |
| Organization deny  | Yes       |
| Local allow        | No        |
| Local deny         | Yes       |
| Kit allow          | No        |
| Kit deny           | Yes       |
@y
| Rule               | Evaluated |
| ------------------ | --------- |
| Organization allow | Yes       |
| Organization deny  | Yes       |
| Local allow        | No        |
| Local deny         | Yes       |
| Kit allow          | No        |
| Kit deny           | Yes       |
@z

@x
Local and kit rules cover network access only, so a local or kit deny can
narrow your network rules but never your filesystem or MCP rules. A local deny
also takes precedence over an organization approval requirement, so the request
is blocked without asking for approval.
@y
Local and kit rules cover network access only, so a local or kit deny can
narrow your network rules but never your filesystem or MCP rules. A local deny
also takes precedence over an organization approval requirement, so the request
is blocked without asking for approval.
@z

@x
Approved destinations are the one exception to local allow rules being
inactive. When a developer approves a destination, the resulting rule records
their answer to your policy's approval requirement rather than granting new
access, so it stays active.
@y
Approved destinations are the one exception to local allow rules being
inactive. When a developer approves a destination, the resulting rule records
their answer to your policy's approval requirement rather than granting new
access, so it stays active.
@z

@x
## When policy changes reach developers
@y
## When policy changes reach developers
@z

@x
Policy changes reach developer machines within 5 minutes. When a synced change
takes effect also depends on the policy type. For more details, see
[Organization network access policies](network.md#when-changes-take-effect),
[Organization filesystem access policies](filesystem.md#when-changes-take-effect), and
[Organization MCP access policies](mcp.md#when-changes-take-effect).
@y
Policy changes reach developer machines within 5 minutes. When a synced change
takes effect also depends on the policy type. For more details, see
[Organization network access policies](network.md#when-changes-take-effect),
[Organization filesystem access policies](filesystem.md#when-changes-take-effect), and
[Organization MCP access policies](mcp.md#when-changes-take-effect).
@z

@x
To apply changes right away on a developer machine, or if a change doesn't seem
to apply, see
[Organization policy changes aren't taking effect](../../troubleshooting.md#organization-policy-changes-arent-taking-effect).
@y
To apply changes right away on a developer machine, or if a change doesn't seem
to apply, see
[Organization policy changes aren't taking effect](../../troubleshooting.md#organization-policy-changes-arent-taking-effect).
@z
