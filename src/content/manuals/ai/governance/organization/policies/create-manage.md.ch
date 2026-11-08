%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ ‘Î‰ž / .md ƒŠƒ“ƒN‚Ö‚Ì (no slash) ‘Î‰ž

@x
title: Create and manage organization policies
linkTitle: Create and manage
@y
title: Create and manage organization policies
linkTitle: Create and manage
@z

@x
description: Create, scope, edit, and delete organization network, filesystem, and MCP policies in Docker Home.
keywords: docker sandboxes, organization policy, create policy, Docker Home, team scope, policy limits
@y
description: Create, scope, edit, and delete organization network, filesystem, and MCP policies in Docker Home.
keywords: docker sandboxes, organization policy, create policy, Docker Home, team scope, policy limits
@z

@x
{{< summary-bar feature_name="AI Governance" >}}
@y
{{< summary-bar feature_name="AI Governance" >}}
@z

@x
Create and manage organization policies in Docker Home. The steps are the same
for network, filesystem, and MCP policies, and only the rules you add differ.
To manage policies programmatically instead, use the
[AI Governance API](/reference/api/ai-governance/). For how scope, rule
evaluation, and precedence work, see [Organization policies](_index.md).
@y
Create and manage organization policies in Docker Home. The steps are the same
for network, filesystem, and MCP policies, and only the rules you add differ.
To manage policies programmatically instead, use the
[AI Governance API](__SUBDIR__/reference/api/ai-governance/). For how scope, rule
evaluation, and precedence work, see [Organization policies](_index.md).
@z

@x
## Before you begin
@y
## Before you begin
@z

@x
You need the organization
[owner](/manuals/security/roles-and-permissions/core-roles.md) role, or a
[custom role](/manuals/security/roles-and-permissions/custom-roles/_index.md)
with the **Governance** permissions.
@y
You need the organization
[owner](manuals/security/roles-and-permissions/core-roles.md) role, or a
[custom role](manuals/security/roles-and-permissions/custom-roles/_index.md)
with the **Governance** permissions.
@z

@x
## Create a policy
@y
## Create a policy
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your
   organization.
1. In the left-hand navigation, expand **AI Platform** and select
   **Network access**, **Filesystem access**, or **MCP access**.
1. Select **Create policy**.
1. Enter a **Policy name**.
1. Set the **Scope** to **Organization** or **Teams**. If you select **Teams**,
   choose the teams the policy applies to. For more details, see
   [Scope policies to teams](#scope-policies-to-teams).
1. Define the policy rules.
   - Network and filesystem policies: select **Add rule** for each rule. For a
     network policy, see
     [What a network rule can match](network.md#what-a-network-rule-can-match).
     For a filesystem policy, see
     [Filesystem mount rule syntax](../../reference/filesystem-rules.md).
   - MCP policies: enter Cedar statements in the policy editor. For more
     details, see [Organization MCP access policies](mcp.md).
1. For a network policy, set **Require approval before access** if developers
   should confirm each destination before a sandbox can reach it. The policy's
   detail page reports approval as **Required** or **Not required**. For more
   details, see [Approval-required access](network.md#approval-required-access).
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your
   organization.
1. In the left-hand navigation, expand **AI Platform** and select
   **Network access**, **Filesystem access**, or **MCP access**.
1. Select **Create policy**.
1. Enter a **Policy name**.
1. Set the **Scope** to **Organization** or **Teams**. If you select **Teams**,
   choose the teams the policy applies to. For more details, see
   [Scope policies to teams](#scope-policies-to-teams).
1. Define the policy rules.
   - Network and filesystem policies: select **Add rule** for each rule. For a
     network policy, see
     [What a network rule can match](network.md#what-a-network-rule-can-match).
     For a filesystem policy, see
     [Filesystem mount rule syntax](../../reference/filesystem-rules.md).
   - MCP policies: enter Cedar statements in the policy editor. For more
     details, see [Organization MCP access policies](mcp.md).
1. For a network policy, set **Require approval before access** if developers
   should confirm each destination before a sandbox can reach it. The policy's
   detail page reports approval as **Required** or **Not required**. For more
   details, see [Approval-required access](network.md#approval-required-access).
@z

@x
For the number of policies and rules you can create, see
[Organization policy limits](../../reference/policy-limits.md).
@y
For the number of policies and rules you can create, see
[Organization policy limits](../../reference/policy-limits.md).
@z

@x
## Scope policies to teams
@y
## Scope policies to teams
@z

@x
To scope a policy to teams, the teams must already exist in your organization.
Create teams and manage their members in one of two ways:
@y
To scope a policy to teams, the teams must already exist in your organization.
Create teams and manage their members in one of two ways:
@z

@x
- Manually, by
  [creating teams](/manuals/accounts/organization/manage/manage-a-team.md) in
  Docker Home.
- Automatically, by using
  [group mapping](/manuals/security/provisioning/scim/group-mapping.md)
  to synchronize your identity provider's groups with the teams in your
  organization. Group mapping creates teams that don't already exist and keeps
  their membership in step with your IdP groups.
@y
- Manually, by
  [creating teams](manuals/accounts/organization/manage/manage-a-team.md) in
  Docker Home.
- Automatically, by using
  [group mapping](manuals/security/provisioning/scim/group-mapping.md)
  to synchronize your identity provider's groups with the teams in your
  organization. Group mapping creates teams that don't already exist and keeps
  their membership in step with your IdP groups.
@z

@x
A team-scoped policy follows team membership, so when someone joins or leaves a
team, including through IdP sync, the policies that apply to them update
automatically. For how org-wide and team-scoped policies combine, see
[Policy scope](_index.md#policy-scope).
@y
A team-scoped policy follows team membership, so when someone joins or leaves a
team, including through IdP sync, the policies that apply to them update
automatically. For how org-wide and team-scoped policies combine, see
[Policy scope](_index.md#policy-scope).
@z

@x
## Edit or delete a policy
@y
## Edit or delete a policy
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your
   organization.
1. In the left-hand navigation, expand **AI Platform** and select
   **Network access**, **Filesystem access**, or **MCP access**.
1. Find the policy in the list. Each policy is listed with its name, scope,
   rule count, and last update.
1. Select the action menu (â‹®) for the policy, then select **Edit**, or delete
   the policy.
1. If you're editing, make your changes and select **Save**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your
   organization.
1. In the left-hand navigation, expand **AI Platform** and select
   **Network access**, **Filesystem access**, or **MCP access**.
1. Find the policy in the list. Each policy is listed with its name, scope,
   rule count, and last update.
1. Select the action menu (â‹®) for the policy, then select **Edit**, or delete
   the policy.
1. If you're editing, make your changes and select **Save**.
@z

@x
Editing a policy replaces it in full. For example, turning off **Require
approval before access** on a network policy removes the requirement from every
rule in that policy. Changes reach developer machines within 5 minutes. For more
details, see
[When policy changes reach developers](_index.md#when-policy-changes-reach-developers).
@y
Editing a policy replaces it in full. For example, turning off **Require
approval before access** on a network policy removes the requirement from every
rule in that policy. Changes reach developer machines within 5 minutes. For more
details, see
[When policy changes reach developers](_index.md#when-policy-changes-reach-developers).
@z

@x
## Configure a support message
@y
## Configure a support message
@z

@x
Administrators can add an optional support message that appears after the policy denial
details when an organization policy blocks a sandbox action. Use it to
point members to an internal support channel, ticket queue, or security contact.
@y
Administrators can add an optional support message that appears after the policy denial
details when an organization policy blocks a sandbox action. Use it to
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
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your
   organization.
1. In the left-hand navigation, expand **AI Platform** and select **Manage**.
1. In **Support message**, enter up to 500 characters.
@z

@x
   The **Support message** field appears only when **AI governance** is turned
   on. For more details, see
   [Turn on AI governance](../get-started.md#step-4-turn-on-ai-governance).
1. Select **Save changes**.
@y
   The **Support message** field appears only when **AI governance** is turned
   on. For more details, see
   [Turn on AI governance](../get-started.md#step-4-turn-on-ai-governance).
1. Select **Save changes**.
@z

@x
Docker shows the message only for denials caused by an organization policy and
for requests an
[approval-required policy](network.md#approval-required-access) blocks. If you
leave it blank, Docker shows the policy denial without additional contact text.
@y
Docker shows the message only for denials caused by an organization policy and
for requests an
[approval-required policy](network.md#approval-required-access) blocks. If you
leave it blank, Docker shows the policy denial without additional contact text.
@z
