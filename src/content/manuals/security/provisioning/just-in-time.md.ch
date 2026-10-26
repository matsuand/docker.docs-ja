%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: >-
  Learn how Just-in-Time (JIT) provisioning creates and updates Docker
  accounts during SSO sign-in and assigns teams, and how to turn it off or
  back on.
keywords: user provisioning, just-in-time provisioning, JIT provisioning, JIT,
  SSO, single sign-on, SCIM, enable JIT, disable JIT, enable JIT provisioning,
  disable JIT provisioning, identity provider, IdP, group mapping,
  SSO connection
title: Just-in-Time provisioning
linkTitle: Just-in-Time
@y
description: >-
  Learn how Just-in-Time (JIT) provisioning creates and updates Docker
  accounts during SSO sign-in and assigns teams, and how to turn it off or
  back on.
keywords: user provisioning, just-in-time provisioning, JIT provisioning, JIT,
  SSO, single sign-on, SCIM, enable JIT, disable JIT, enable JIT provisioning,
  disable JIT provisioning, identity provider, IdP, group mapping,
  SSO connection
title: Just-in-Time provisioning
linkTitle: Just-in-Time
@z

@x
{{< summary-bar feature_name="SSO" >}}
@y
{{< summary-bar feature_name="SSO" >}}
@z

@x
Just-in-Time (JIT) provisioning creates and updates user accounts during SSO
authentication. JIT verifies that users belong to the organization and assigns
them to teams based on your identity provider (IdP) configuration.
@y
Just-in-Time (JIT) provisioning creates and updates user accounts during SSO
authentication. JIT verifies that users belong to the organization and assigns
them to teams based on your identity provider (IdP) configuration.
@z

@x
## How it works
@y
## How it works
@z

@x
JIT fits organizations that want to give their users the quickest path to
access. JIT grants users access the first time they sign in with SSO without
needing an invitation.
@y
JIT fits organizations that want to give their users the quickest path to
access. JIT grants users access the first time they sign in with SSO without
needing an invitation.
@z

@x
The following diagram shows SSO sign-in with and without JIT:
@y
The following diagram shows SSO sign-in with and without JIT:
@z

@x
```mermaid {title="SSO authentication with and without JIT provisioning" caption="With JIT, Docker adds users to organizations and teams at sign-in. Without it, only members can sign in. Highlighted steps happen only with JIT."}
---
config:
  themeVariables:
    fontSize: 14px
  flowchart:
    wrappingWidth: 80
    nodeSpacing: 14
    rankSpacing: 22
    padding: 5
    curve: linear
    subGraphTitleMargin:
      top: 4
      bottom: 12
---
flowchart LR
  start(["Sign in with SSO"]) --> invite["Accept pending invitation"]
  invite --> jit{"JIT enabled?"}
  jit -->|Yes| map{"IdP group mappings?"}
  map -->|Yes| assign
  map -->|No| default
  subgraph jitbox["JIT provisioning"]
    assign["Add to orgs and teams from IdP"]
    default["Add to default org and team"]
  end
  assign --> ok(["SSO successful"])
  default --> ok
  jit -->|No| member{"Member of org?"}
  member -->|Yes| ok
  member -->|No| denied(["Access denied"])
@y
```mermaid {title="SSO authentication with and without JIT provisioning" caption="With JIT, Docker adds users to organizations and teams at sign-in. Without it, only members can sign in. Highlighted steps happen only with JIT."}
---
config:
  themeVariables:
    fontSize: 14px
  flowchart:
    wrappingWidth: 80
    nodeSpacing: 14
    rankSpacing: 22
    padding: 5
    curve: linear
    subGraphTitleMargin:
      top: 4
      bottom: 12
---
flowchart LR
  start(["Sign in with SSO"]) --> invite["Accept pending invitation"]
  invite --> jit{"JIT enabled?"}
  jit -->|Yes| map{"IdP group mappings?"}
  map -->|Yes| assign
  map -->|No| default
  subgraph jitbox["JIT provisioning"]
    assign["Add to orgs and teams from IdP"]
    default["Add to default org and team"]
  end
  assign --> ok(["SSO successful"])
  default --> ok
  jit -->|No| member{"Member of org?"}
  member -->|Yes| ok
  member -->|No| denied(["Access denied"])
@z

@x
  classDef success fill:#22c55e22,stroke:#22c55e
  classDef failure fill:#ef444422,stroke:#ef4444
  class ok success
  class denied failure
  style jitbox fill:#3b82f622,stroke:#3b82f6
```
@y
  classDef success fill:#22c55e22,stroke:#22c55e
  classDef failure fill:#ef444422,stroke:#ef4444
  class ok success
  class denied failure
  style jitbox fill:#3b82f622,stroke:#3b82f6
```
@z

@x
When a user signs in with SSO, Docker looks for a Docker account with the
email address your IdP sent. If none exists, Docker creates one and generates
a unique username from the user's email, name, and random numbers. If one
exists, Docker updates the user's full name if it changed.
@y
When a user signs in with SSO, Docker looks for a Docker account with the
email address your IdP sent. If none exists, Docker creates one and generates
a unique username from the user's email, name, and random numbers. If one
exists, Docker updates the user's full name if it changed.
@z

@x
If JIT is disabled, sign-in succeeds only for organization members and users
with a pending invitation, which Docker accepts at sign-in. Everyone else sees
an `Access denied` error and must ask an administrator for an invitation.
@y
If JIT is disabled, sign-in succeeds only for organization members and users
with a pending invitation, which Docker accepts at sign-in. Everyone else sees
an `Access denied` error and must ask an administrator for an invitation.
@z

@x
## Set up
@y
## Set up
@z

@x
When you create an SSO connection, Docker turns on JIT provisioning by
default. To set up JIT provisioning:
@y
When you create an SSO connection, Docker turns on JIT provisioning by
default. To set up JIT provisioning:
@z

@x
1. Set up an
   [SSO connection](/manuals/security/authentication/single-sign-on/connect.md)
   for your organization.
1. Set the default organization and team that Docker uses for users
   who sign in without IdP group mappings. You set these when you create the SSO
   connection.
1. Optional. Set up
   [group mapping](/manuals/security/provisioning/scim/group-mapping.md#configure-group-mapping-with-sso)
   to assign users to organizations and teams from your IdP.
1. Have your users sign in with SSO.
@y
1. Set up an
   [SSO connection](manuals/security/authentication/single-sign-on/connect.md)
   for your organization.
1. Set the default organization and team that Docker uses for users
   who sign in without IdP group mappings. You set these when you create the SSO
   connection.
1. Optional. Set up
   [group mapping](manuals/security/provisioning/scim/group-mapping.md#configure-group-mapping-with-sso)
   to assign users to organizations and teams from your IdP.
1. Have your users sign in with SSO.
@z

@x
JIT doesn't remove users when they leave your IdP, so you must remove them
manually. To remove users automatically, use SCIM.
@y
JIT doesn't remove users when they leave your IdP, so you must remove them
manually. To remove users automatically, use SCIM.
@z

@x
## Disable
@y
## Disable
@z

@x
> [!WARNING]
>
> Disabling JIT provisioning may disrupt your users' access and workflows.
> With JIT disabled, only existing organization members and users with a
> pending invitation can sign in with SSO.
@y
> [!WARNING]
>
> Disabling JIT provisioning may disrupt your users' access and workflows.
> With JIT disabled, only existing organization members and users with a
> pending invitation can sign in with SSO.
@z

@x
An SSO connection must keep at least one provisioning method enabled:
JIT, SCIM, or both. You can disable JIT only while
[SCIM is enabled](/manuals/security/provisioning/scim/provision-scim.md#enable-scim-in-docker),
and you can disable SCIM only while JIT is enabled. Before you add SCIM,
review
[how SCIM works with JIT](/manuals/security/provisioning/scim/_index.md#choose-how-scim-works-with-jit).
Disable JIT if you want SCIM to be the source of truth for provisioning.
@y
An SSO connection must keep at least one provisioning method enabled:
JIT, SCIM, or both. You can disable JIT only while
[SCIM is enabled](manuals/security/provisioning/scim/provision-scim.md#enable-scim-in-docker),
and you can disable SCIM only while JIT is enabled. Before you add SCIM,
review
[how SCIM works with JIT](manuals/security/provisioning/scim/_index.md#choose-how-scim-works-with-jit).
Disable JIT if you want SCIM to be the source of truth for provisioning.
@z

@x
To disable JIT provisioning:
@y
To disable JIT provisioning:
@z

@x
1. Go to [Docker Home](https://app.docker.com/) and select your organization
   from the top-left account drop-down.
1. Select **Identity & auth**, then **SSO and SCIM**.
1. In the **SSO connections** table, select the **Actions** icon, then select
   **Disable JIT provisioning**.
1. Select **Disable** to confirm.
@y
1. Go to [Docker Home](https://app.docker.com/) and select your organization
   from the top-left account drop-down.
1. Select **Identity & auth**, then **SSO and SCIM**.
1. In the **SSO connections** table, select the **Actions** icon, then select
   **Disable JIT provisioning**.
1. Select **Disable** to confirm.
@z

@x
## Re-enable
@y
## Re-enable
@z

@x
If you disabled JIT provisioning, you can turn it back on:
@y
If you disabled JIT provisioning, you can turn it back on:
@z

@x
1. Go to [Docker Home](https://app.docker.com/) and select your organization
   from the top-left account drop-down.
1. Select **Identity & auth**, then **SSO and SCIM**.
1. In the **SSO connections** table, select the **Actions** icon, then select
   **Enable JIT provisioning**.
1. Select **Enable** to confirm.
@y
1. Go to [Docker Home](https://app.docker.com/) and select your organization
   from the top-left account drop-down.
1. Select **Identity & auth**, then **SSO and SCIM**.
1. In the **SSO connections** table, select the **Actions** icon, then select
   **Enable JIT provisioning**.
1. Select **Enable** to confirm.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Set up [group mapping](/manuals/security/provisioning/scim/group-mapping.md)
  to automatically assign users to teams.
- Review
  [Troubleshoot provisioning](/manuals/security/provisioning/troubleshoot-provisioning.md).
@y
- Set up [group mapping](manuals/security/provisioning/scim/group-mapping.md)
  to automatically assign users to teams.
- Review
  [Troubleshoot provisioning](manuals/security/provisioning/troubleshoot-provisioning.md).
@z
