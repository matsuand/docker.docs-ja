%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Onboarding and managing roles and permissions in Docker
description: Learn how to manage roles, invite members, and implement scalable access control in Docker for secure and efficient collaboration.
keywords: sso, scim, jit, invite members, docker hub, docker admin console, onboarding, security
@y
title: Onboarding and managing roles and permissions in Docker
description: Learn how to manage roles, invite members, and implement scalable access control in Docker for secure and efficient collaboration.
keywords: sso, scim, jit, invite members, docker hub, docker admin console, onboarding, security
@z

@x
This page guides you through onboarding owners and members, and using tools like SSO and SCIM to future-proof onboarding going forward.
@y
This page guides you through onboarding owners and members, and using tools like SSO and SCIM to future-proof onboarding going forward.
@z

@x
## Step 1: Invite owners
@y
## Step 1: Invite owners
@z

@x
When you create a Docker organization, you automatically become its sole owner. While optional, adding additional owners can significantly ease the process of onboarding and managing your organization by distributing administrative responsibilities. It also ensures continuity and does not cause a blocker if the primary owner is unavailable.
@y
When you create a Docker organization, you automatically become its sole owner. While optional, adding additional owners can significantly ease the process of onboarding and managing your organization by distributing administrative responsibilities. It also ensures continuity and does not cause a blocker if the primary owner is unavailable.
@z

@x
For detailed information on owners, see [Roles and permissions](/manuals/security/for-admins/roles-and-permissions.md).
@y
For detailed information on owners, see [Roles and permissions](manuals/security/for-admins/roles-and-permissions.md).
@z

@x
## Step 2: Invite members and assign roles
@y
## Step 2: Invite members and assign roles
@z

@x
Members are granted controlled access to resources and enjoy enhanced organizational benefits. When you invite members to join you Docker organization, you immediately assign them a role.
@y
Members are granted controlled access to resources and enjoy enhanced organizational benefits. When you invite members to join you Docker organization, you immediately assign them a role.
@z

@x
### Benefits of inviting members
@y
### Benefits of inviting members
@z

@x
 - Enhanced visibility: Gain insights into user activity, making it easier to monitor access and enforce security policies.
@y
 - Enhanced visibility: Gain insights into user activity, making it easier to monitor access and enforce security policies.
@z

@x
 - Streamlined collaboration: Help members collaborate effectively by granting access to shared resources and repositories.
@y
 - Streamlined collaboration: Help members collaborate effectively by granting access to shared resources and repositories.
@z

@x
 - Improved resource management: Organize and track users within your organization, ensuring optimal allocation of resources.
@y
 - Improved resource management: Organize and track users within your organization, ensuring optimal allocation of resources.
@z

@x
 - Access to enhanced features: Members benefit from organization-wide perks, such as increased pull limits and access to premium Docker features.
@y
 - Access to enhanced features: Members benefit from organization-wide perks, such as increased pull limits and access to premium Docker features.
@z

@x
 - Security control: Apply and enforce security settings at an organizational level, reducing risks associated with unmanaged accounts.
@y
 - Security control: Apply and enforce security settings at an organizational level, reducing risks associated with unmanaged accounts.
@z

@x
For detailed information, see [Manage organization members](/manuals/admin/organization/members.md).
@y
For detailed information, see [Manage organization members](manuals/admin/organization/members.md).
@z

@x
## Step 3: Future-proof user management
@y
## Step 3: Future-proof user management
@z

@x
A robust, future-proof approach to user management combines automated provisioning, centralized authentication, and dynamic access control. Implementing these practices ensures a scalable, secure, and efficient environment.
@y
A robust, future-proof approach to user management combines automated provisioning, centralized authentication, and dynamic access control. Implementing these practices ensures a scalable, secure, and efficient environment.
@z

@x
### Secure user authentication with single sign-on (SSO)
@y
### Secure user authentication with single sign-on (SSO)
@z

@x
Integrating Docker with your identity provider streamlines user access and enhances security.
@y
Integrating Docker with your identity provider streamlines user access and enhances security.
@z

@x
SSO: 
@y
SSO: 
@z

@x
 - Simplifies sign in, as users sign in with their organizational credentials.
@y
 - Simplifies sign in, as users sign in with their organizational credentials.
@z

@x
 - Reduces password-related vulnerabilities.
@y
 - Reduces password-related vulnerabilities.
@z

@x
 - Simplifies onboarding as it works seamlessly with SCIM and group mapping for automated provisioning.
@y
 - Simplifies onboarding as it works seamlessly with SCIM and group mapping for automated provisioning.
@z

@x
[SSO documentation](/manuals/security/for-admins/single-sign-on/_index.md).
@y
[SSO documentation](manuals/security/for-admins/single-sign-on/_index.md).
@z

@x
### Automate onboarding with SCIM and JIT provisioning
@y
### Automate onboarding with SCIM and JIT provisioning
@z

@x
Streamline user provisioning and role management with [SCIM](/manuals/security/for-admins/provisioning/scim.md) and [Just-in-Time (JIT) provisioning](/manuals/security/for-admins/provisioning/just-in-time.md).
@y
Streamline user provisioning and role management with [SCIM](manuals/security/for-admins/provisioning/scim.md) and [Just-in-Time (JIT) provisioning](manuals/security/for-admins/provisioning/just-in-time.md).
@z

@x
With SCIM you can:
@y
With SCIM you can:
@z

@x
 - Sync users and roles automatically with your identity provider.
@y
 - Sync users and roles automatically with your identity provider.
@z

@x
 - Automate adding, updating, or removing users based on directory changes.
@y
 - Automate adding, updating, or removing users based on directory changes.
@z

@x
With JIT provisioning you can:
@y
With JIT provisioning you can:
@z

@x
 - Automatically add users upon first sign in based on [group mapping](#simplify-access-with-group-mapping).
@y
 - Automatically add users upon first sign in based on [group mapping](#simplify-access-with-group-mapping).
@z

@x
 - Reduce overhead by eliminating pre-invite steps.
@y
 - Reduce overhead by eliminating pre-invite steps.
@z

@x
### Simplify access with group mapping
@y
### Simplify access with group mapping
@z

@x
Group mapping automates permissions management by linking identity provider groups to Docker roles and teams.
@y
Group mapping automates permissions management by linking identity provider groups to Docker roles and teams.
@z

@x
It also:
@y
It also:
@z

@x
 - Reduces manual errors in role assignments.
@y
 - Reduces manual errors in role assignments.
@z

@x
 - Ensures consistent access control policies.
@y
 - Ensures consistent access control policies.
@z

@x
 - Help you scale permissions as teams grow or change.
@y
 - Help you scale permissions as teams grow or change.
@z

@x
For more information on how it works, see [Group mapping](/manuals/security/for-admins/provisioning/group-mapping.md).
@y
For more information on how it works, see [Group mapping](manuals/security/for-admins/provisioning/group-mapping.md).
@z
