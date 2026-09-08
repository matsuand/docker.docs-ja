%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Organization policies
linkTitle: Org policies
@y
title: Organization policies
linkTitle: Org policies
@z

@x
description: Centrally manage sandbox network, filesystem, and MCP policies for your organization.
keywords: docker sandboxes, governance, organization policy, AI governance, Docker Home, network access, filesystem access, mcp policy
@y
description: Centrally manage sandbox network, filesystem, and MCP policies for your organization.
keywords: docker sandboxes, governance, organization policy, AI governance, Docker Home, network access, filesystem access, mcp policy
@z

@x
[Local policies](local.md) give individual developers control over what their
sandboxes can access. Organization policy moves that control to the admin level:
organization policies apply to sandboxes across the organization, either to
every member or to specific teams. When organization governance is active, only
organization allow rules grant access: local `sbx policy` allow rules are no
longer evaluated and can't expand what the organization permits. Local network
deny rules remain active, so developers can restrict access further but never
loosen it.
@y
[Local policies](local.md) give individual developers control over what their
sandboxes can access. Organization policy moves that control to the admin level:
organization policies apply to sandboxes across the organization, either to
every member or to specific teams. When organization governance is active, only
organization allow rules grant access: local `sbx policy` allow rules are no
longer evaluated and can't expand what the organization permits. Local network
deny rules remain active, so developers can restrict access further but never
loosen it.
@z

@x
Admins can manage organization policies through the Docker Home UI. For
programmatic management of network and filesystem policies, use the
[Governance API](/reference/api/ai-governance/).
@y
Admins can manage organization policies through the Docker Home UI. For
programmatic management of network and filesystem policies, use the
[Governance API](__SUBDIR__/reference/api/ai-governance/).
@z

@x
By default, only organization
[owners](/manuals/enterprise/security/roles-and-permissions/core-roles.md) can
view and manage AI Governance policies. To let someone other than an owner
manage policies, create a
[custom role](/manuals/enterprise/security/roles-and-permissions/custom-roles/_index.md)
with the **Governance** permissions and assign it to a user or team.
@y
By default, only organization
[owners](manuals/enterprise/security/roles-and-permissions/core-roles.md) can
view and manage AI Governance policies. To let someone other than an owner
manage policies, create a
[custom role](manuals/enterprise/security/roles-and-permissions/custom-roles/_index.md)
with the **Governance** permissions and assign it to a user or team.
@z

@x
> [!NOTE]
> Sandbox organization governance is available on a separate paid
> subscription.
> [Contact Docker Sales](https://www.docker.com/products/ai-governance/#contact-sales)
> to request access.
@y
> [!NOTE]
> Sandbox organization governance is available on a separate paid
> subscription.
> [Contact Docker Sales](https://www.docker.com/products/ai-governance/#contact-sales)
> to request access.
@z

@x
## Create a policy
@y
## Create a policy
@z

@x
Manage policies from the **AI Platform** section in the left-hand navigation
of [Docker Home](https://app.docker.com).
@y
Manage policies from the **AI Platform** section in the left-hand navigation
of [Docker Home](https://app.docker.com).
@z

@x
To create a policy:
@y
To create a policy:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your
   organization.
1. In the left-hand navigation, expand **AI Platform** and select
   **Network access**, **Filesystem access**, or **MCP access**.
1. Select **Create policy**.
1. Enter a **Policy name**.
1. Set the **Scope** to **Organization** or **Teams**. If you select **Teams**,
   choose the teams the policy applies to. See
   [Scope policies to teams](#scope-policies-to-teams).
1. Define the policy rules. For network and filesystem policies, select
   **Add rule** for each rule. For MCP policies, enter Cedar statements in the
   policy editor. For syntax and examples, use the relevant access-control page
   in [Choose a policy type](#choose-a-policy-type).
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your
   organization.
1. In the left-hand navigation, expand **AI Platform** and select
   **Network access**, **Filesystem access**, or **MCP access**.
1. Select **Create policy**.
1. Enter a **Policy name**.
1. Set the **Scope** to **Organization** or **Teams**. If you select **Teams**,
   choose the teams the policy applies to. See
   [Scope policies to teams](#scope-policies-to-teams).
1. Define the policy rules. For network and filesystem policies, select
   **Add rule** for each rule. For MCP policies, enter Cedar statements in the
   policy editor. For syntax and examples, use the relevant access-control page
   in [Choose a policy type](#choose-a-policy-type).
@z

@x
Existing policies are listed with their name, scope, rule count, and last
update. Use the action menu (⋮) to edit or delete a policy.
@y
Existing policies are listed with their name, scope, rule count, and last
update. Use the action menu (⋮) to edit or delete a policy.
@z

@x
## Configure a support message
@y
## Configure a support message
@z

@x
Admins can add an optional support message that appears after the policy denial
details when a sandbox action is blocked by organization governance. Use it to
point members to an internal support channel, ticket queue, or security contact.
@y
Admins can add an optional support message that appears after the policy denial
details when a sandbox action is blocked by organization governance. Use it to
point members to an internal support channel, ticket queue, or security contact.
@z

@x
To set the message:
@y
To set the message:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your
   organization.
1. In the left-hand navigation, expand **AI Platform** and select **Manage**.
1. In **Support message**, enter up to 500 characters.
1. Select **Save changes**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your
   organization.
1. In the left-hand navigation, expand **AI Platform** and select **Manage**.
1. In **Support message**, enter up to 500 characters.
1. Select **Save changes**.
@z

@x
Docker shows the message only for denials caused by organization governance
policy. If you leave it blank, Docker shows the policy denial without additional
contact text.
@y
Docker shows the message only for denials caused by organization governance
policy. If you leave it blank, Docker shows the policy denial without additional
contact text.
@z

@x
## Choose a policy type
@y
## Choose a policy type
@z

@x
Organization policies are managed by access surface. Use the access-control
pages for syntax, examples, and enforcement details:
@y
Organization policies are managed by access surface. Use the access-control
pages for syntax, examples, and enforcement details:
@z

@x
- [Network access policies](network.md): control outbound network access from
  sandboxes.
- [Filesystem access policies](filesystem.md): control which host paths
  sandboxes can mount as workspaces.
- [MCP access policies](mcp.md): control MCP server registration, tool calls,
  resources, prompts, and approval gates with Cedar policy.
@y
- [Network access policies](network.md): control outbound network access from
  sandboxes.
- [Filesystem access policies](filesystem.md): control which host paths
  sandboxes can mount as workspaces.
- [MCP access policies](mcp.md): control MCP server registration, tool calls,
  resources, prompts, and approval gates with Cedar policy.
@z

@x
When organization governance is active, local and kit-defined allow rules are
not evaluated, while deny rules from those sources still apply. See
[Precedence](../concepts.md#precedence). To see which rules are active on a
developer machine, use
[Monitoring policies](../monitor-and-enforce/monitoring.md).
@y
When organization governance is active, local and kit-defined allow rules are
not evaluated, while deny rules from those sources still apply. See
[Precedence](../concepts.md#precedence). To see which rules are active on a
developer machine, use
[Monitoring policies](../monitor-and-enforce/monitoring.md).
@z

@x
## Scope policies to teams
@y
## Scope policies to teams
@z

@x
An organization can have more than one policy, and each policy applies either
to the whole organization or to specific teams. Scoping lets you apply different
rules to different parts of the organization.
@y
An organization can have more than one policy, and each policy applies either
to the whole organization or to specific teams. Scoping lets you apply different
rules to different parts of the organization.
@z

@x
A policy's [**Scope**](#create-a-policy) controls who it applies to. Set it to
**Organization** to apply the policy to every member, or to **Teams** to apply
it only to members of the teams you select.
@y
A policy's [**Scope**](#create-a-policy) controls who it applies to. Set it to
**Organization** to apply the policy to every member, or to **Teams** to apply
it only to members of the teams you select.
@z

@x
### Before you start
@y
### Before you start
@z

@x
Team scoping targets your organization's existing
[teams](/manuals/admin/organization/manage/manage-a-team.md), so a team must
exist before you can scope a policy to it. Create teams and manage their members
in one of two ways:
@y
Team scoping targets your organization's existing
[teams](manuals/admin/organization/manage/manage-a-team.md), so a team must
exist before you can scope a policy to it. Create teams and manage their members
in one of two ways:
@z

@x
- Manually, in Docker Home.
- Automatically, by using
  [group mapping](/manuals/enterprise/security/provisioning/scim/group-mapping.md)
  to synchronize your identity provider's groups with the teams in your
  organization. Group mapping creates teams that don't already exist and keeps
  their membership in step with your IdP groups.
@y
- Manually, in Docker Home.
- Automatically, by using
  [group mapping](manuals/enterprise/security/provisioning/scim/group-mapping.md)
  to synchronize your identity provider's groups with the teams in your
  organization. Group mapping creates teams that don't already exist and keeps
  their membership in step with your IdP groups.
@z

@x
Because policies apply by team, a user's policies update automatically as their
team membership changes, including changes synced from your IdP.
@y
Because policies apply by team, a user's policies update automatically as their
team membership changes, including changes synced from your IdP.
@z

@x
### How scoped policies combine
@y
### How scoped policies combine
@z

@x
A user is governed by all of their
[effective policies](../concepts.md#policy-scope): every org-wide policy, plus
the team-scoped policies for the teams they belong to. Use org-wide policies
for guardrails that must apply everywhere, and team-scoped policies for access
that only some teams need.
@y
A user is governed by all of their
[effective policies](../concepts.md#policy-scope): every org-wide policy, plus
the team-scoped policies for the teams they belong to. Use org-wide policies
for guardrails that must apply everywhere, and team-scoped policies for access
that only some teams need.
@z

@x
For precedence between local and organization policies, and for how allow and
deny rules combine, see [Policy concepts](../concepts.md).
@y
For precedence between local and organization policies, and for how allow and
deny rules combine, see [Policy concepts](../concepts.md).
@z

@x
## Troubleshooting
@y
## Troubleshooting
@z

@x
### Policy changes not taking effect
@y
### Policy changes not taking effect
@z

@x
After updating organization policies, changes take up to 5 minutes to
propagate to developer machines. To apply changes immediately, users can run
`sbx policy reset`, which stops the daemon and forces it to pull the latest
organization policies on the next `sbx` command.
@y
After updating organization policies, changes take up to 5 minutes to
propagate to developer machines. To apply changes immediately, users can run
`sbx policy reset`, which stops the daemon and forces it to pull the latest
organization policies on the next `sbx` command.
@z

@x
> [!WARNING]
> `sbx policy reset` deletes all locally configured policy rules. The command
> prompts for confirmation before proceeding.
@y
> [!WARNING]
> `sbx policy reset` deletes all locally configured policy rules. The command
> prompts for confirmation before proceeding.
@z

@x
#### Enforcement timing by policy type
@y
#### Enforcement timing by policy type
@z

@x
Policy types differ in when a change takes effect after it reaches the
developer machine:
@y
Policy types differ in when a change takes effect after it reaches the
developer machine:
@z

@x
- Network policy is evaluated on every outbound request. Once a policy
  change has synced to the developer's machine (up to 5 minutes), it applies
  immediately to subsequent requests.
@y
- Network policy is evaluated on every outbound request. Once a policy
  change has synced to the developer's machine (up to 5 minutes), it applies
  immediately to subsequent requests.
@z

@x
- Filesystem policy is only checked when a workspace is mounted — that
  is, when a sandbox is created. Once a sandbox is running, changing the
  filesystem policy has no effect on that sandbox. The sandbox continues to
  access the previously allowed path until it is removed and a new one is
  created.
@y
- Filesystem policy is only checked when a workspace is mounted — that
  is, when a sandbox is created. Once a sandbox is running, changing the
  filesystem policy has no effect on that sandbox. The sandbox continues to
  access the previously allowed path until it is removed and a new one is
  created.
@z

@x
- MCP registration policy is evaluated when a server is registered with
  `sbx mcp add`. Changing registration rules doesn't remove existing
  registrations or stop an already-loaded server by itself.
@y
- MCP registration policy is evaluated when a server is registered with
  `sbx mcp add`. Changing registration rules doesn't remove existing
  registrations or stop an already-loaded server by itself.
@z

@x
- MCP use-time policy is evaluated by the MCP gateway when a sandbox makes a
  governed MCP request, such as a tool call, resource read, prompt retrieval,
  or built-in gateway tool call. Once a policy change has synced, use-time
  rules apply to subsequent governed MCP requests through the gateway.
@y
- MCP use-time policy is evaluated by the MCP gateway when a sandbox makes a
  governed MCP request, such as a tool call, resource read, prompt retrieval,
  or built-in gateway tool call. Once a policy change has synced, use-time
  rules apply to subsequent governed MCP requests through the gateway.
@z

@x
To apply a filesystem policy change immediately, remove the running sandbox
and create a new one. To prevent use of an MCP server that is already registered
or loaded, add use-time rules for the registered server name. For examples, see
[Withdraw server access](mcp.md#withdraw-server-access).
@y
To apply a filesystem policy change immediately, remove the running sandbox
and create a new one. To prevent use of an MCP server that is already registered
or loaded, add use-time rules for the registered server name. For examples, see
[Withdraw server access](mcp.md#withdraw-server-access).
@z
