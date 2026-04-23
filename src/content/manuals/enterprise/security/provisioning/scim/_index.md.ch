%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: SCIM overview
linkTitle: SCIM
@y
title: SCIM overview
linkTitle: SCIM
@z

@x
description: Learn how System for Cross-domain Identity Management works and how to set it up.
keywords: SCIM, SSO, user provisioning, de-provisioning, role mapping, assign users
@y
description: Learn how System for Cross-domain Identity Management works and how to set it up.
keywords: SCIM, SSO, user provisioning, de-provisioning, role mapping, assign users
@z

@x
{{< summary-bar feature_name="SSO" >}}
@y
{{< summary-bar feature_name="SSO" >}}
@z

@x
Automate user management for your Docker organization using System for
Cross-domain Identity Management (SCIM). SCIM automatically provisions and
de-provisions users, synchronizes team memberships, and keeps your Docker
organization in sync with your identity provider.
@y
Automate user management for your Docker organization using System for
Cross-domain Identity Management (SCIM). SCIM automatically provisions and
de-provisions users, synchronizes team memberships, and keeps your Docker
organization in sync with your identity provider.
@z

@x
This page shows you how to automate user provisioning and de-provisioning for
Docker using SCIM.
@y
This page shows you how to automate user provisioning and de-provisioning for
Docker using SCIM.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before you begin, you must have:
@y
Before you begin, you must have:
@z

@x
- SSO configured for your organization
- Administrator access to Docker Home and your identity provider
@y
- SSO configured for your organization
- Administrator access to Docker Home and your identity provider
@z

@x
## How SCIM works
@y
## How SCIM works
@z

@x
SCIM automates user provisioning and de-provisioning for Docker through your
identity provider. After you enable SCIM, any user assigned to your
Docker application in your identity provider is automatically provisioned and
added to your Docker organization. When a user is removed from the Docker
application in your identity provider, SCIM deactivates and removes them from
your Docker organization.
@y
SCIM automates user provisioning and de-provisioning for Docker through your
identity provider. After you enable SCIM, any user assigned to your
Docker application in your identity provider is automatically provisioned and
added to your Docker organization. When a user is removed from the Docker
application in your identity provider, SCIM deactivates and removes them from
your Docker organization.
@z

@x
In addition to provisioning and removal, SCIM also syncs profile updates like
name changes made in your identity provider. You can use SCIM alongside Docker's
default Just-in-Time (JIT) provisioning or on its own with JIT disabled.
@y
In addition to provisioning and removal, SCIM also syncs profile updates like
name changes made in your identity provider. You can use SCIM alongside Docker's
default Just-in-Time (JIT) provisioning or on its own with JIT disabled.
@z

@x
SCIM automates:
@y
SCIM automates:
@z

@x
- Creating users
- Updating user profiles
- Removing and deactivating users
- Re-activating users
- Group mapping
@y
- Creating users
- Updating user profiles
- Removing and deactivating users
- Re-activating users
- Group mapping
@z

@x
> [!NOTE]
>
> SCIM only manages users provisioned through your identity provider after
> SCIM is enabled. It cannot remove users who were manually added to your Docker
> organization before SCIM was set up.
>
> To remove those users, delete them manually from your Docker organization.
> For more information, see
> [Manage organization members](/manuals/admin/organization/members.md).
@y
> [!NOTE]
>
> SCIM only manages users provisioned through your identity provider after
> SCIM is enabled. It cannot remove users who were manually added to your Docker
> organization before SCIM was set up.
>
> To remove those users, delete them manually from your Docker organization.
> For more information, see
> [Manage organization members](manuals/admin/organization/members.md).
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Migrate JIT to SCIM](/manuals/enterprise/security/provisioning/scim/migrate-scim.md) if users were provisioned with Just-in-Time (JIT) before you enabled SCIM.
- [Group mapping](/manuals/enterprise/security/provisioning/scim/group-mapping.md) to sync identity provider groups with members.
- [Troubleshoot provisioning](/manuals/enterprise/security/provisioning/troubleshoot-provisioning.md) for SCIM, JIT, and attribute issues.
@y
- [Migrate JIT to SCIM](manuals/enterprise/security/provisioning/scim/migrate-scim.md) if users were provisioned with Just-in-Time (JIT) before you enabled SCIM.
- [Group mapping](manuals/enterprise/security/provisioning/scim/group-mapping.md) to sync identity provider groups with members.
- [Troubleshoot provisioning](manuals/enterprise/security/provisioning/troubleshoot-provisioning.md) for SCIM, JIT, and attribute issues.
@z
