%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Custom role permissions reference
linkTitle: Permissions reference
description: >-
  Permissions available for Docker custom roles across organization management,
  Docker Hub, billing, AI Governance, Docker Hardened Images, and Docker
  Offload.
keywords: >-
  custom roles, custom role permissions, Docker, Docker Hub, organization
  management, billing, AI Governance, access tokens, SSO, SCIM, OIDC, DHI,
  Docker Offload, security
@y
title: Custom role permissions reference
linkTitle: Permissions reference
description: >-
  Permissions available for Docker custom roles across organization management,
  Docker Hub, billing, AI Governance, Docker Hardened Images, and Docker
  Offload.
keywords: >-
  custom roles, custom role permissions, Docker, Docker Hub, organization
  management, billing, AI Governance, access tokens, SSO, SCIM, OIDC, DHI,
  Docker Offload, security
@z

@x
{{< summary-bar feature_name="Custom roles" >}}
@y
{{< summary-bar feature_name="Custom roles" >}}
@z

@x
Custom roles use permissions from organization management, Docker Hub,
billing, AI Governance, Docker Hardened Images, and Docker Offload. Use
the following tables to [create or edit a custom role](manage.md).
@y
Custom roles use permissions from organization management, Docker Hub,
billing, AI Governance, Docker Hardened Images, and Docker Offload. Use
the following tables to [create or edit a custom role](manage.md).
@z

@x
## Organization management
@y
## Organization management
@z

@x
| Permission                        | Description                                                                                     |
| :-------------------------------- | :---------------------------------------------------------------------------------------------- |
| View teams                        | View teams and team members                                                                     |
| Manage teams                      | Create, update, and delete teams and team members                                               |
| Manage registry access            | Control which registries members can access                                                     |
| Manage image access               | Set policies for which images members can pull and use                                          |
| Update organization information   | Update organization information such as name and location                                       |
| Member management                 | Manage organization members, invites, and roles                                                 |
| View custom roles                 | View existing custom roles and their permissions                                                |
| Manage custom roles               | Full access to custom role management and assignment                                            |
| Manage organization access tokens | Create, update, and delete repositories in this org. Push/pull or registry actions not included |
| View activity logs                | Access organization audit logs and activity history                                             |
| View usage reports                | Download organization usage reports (pulls, storage)                                            |
| View domains                      | View domains and domain audit settings                                                          |
| Manage domains                    | Manage verified domains and domain audit settings                                               |
| View SSO and SCIM                 | View single sign-on and user provisioning configurations                                        |
| Manage SSO and SCIM               | Full access to SSO and SCIM management                                                          |
| Manage Desktop settings           | Configure Docker Desktop settings policies and view usage reports                               |
| View OIDC connections             | View OIDC connections and their configuration                                                   |
| Manage OIDC connections           | View, create, edit, and delete OIDC connections                                                 |
@y
| Permission                        | Description                                                                                     |
| :-------------------------------- | :---------------------------------------------------------------------------------------------- |
| View teams                        | View teams and team members                                                                     |
| Manage teams                      | Create, update, and delete teams and team members                                               |
| Manage registry access            | Control which registries members can access                                                     |
| Manage image access               | Set policies for which images members can pull and use                                          |
| Update organization information   | Update organization information such as name and location                                       |
| Member management                 | Manage organization members, invites, and roles                                                 |
| View custom roles                 | View existing custom roles and their permissions                                                |
| Manage custom roles               | Full access to custom role management and assignment                                            |
| Manage organization access tokens | Create, update, and delete repositories in this org. Push/pull or registry actions not included |
| View activity logs                | Access organization audit logs and activity history                                             |
| View usage reports                | Download organization usage reports (pulls, storage)                                            |
| View domains                      | View domains and domain audit settings                                                          |
| Manage domains                    | Manage verified domains and domain audit settings                                               |
| View SSO and SCIM                 | View single sign-on and user provisioning configurations                                        |
| Manage SSO and SCIM               | Full access to SSO and SCIM management                                                          |
| Manage Desktop settings           | Configure Docker Desktop settings policies and view usage reports                               |
| View OIDC connections             | View OIDC connections and their configuration                                                   |
| Manage OIDC connections           | View, create, edit, and delete OIDC connections                                                 |
@z

@x
## Docker Hub
@y
## Docker Hub
@z

@x
| Permission                         | Description                                                                                  |
| :--------------------------------- | :------------------------------------------------------------------------------------------- |
| View repositories                  | View repository details and contents                                                         |
| Manage repositories                | Full repository management including settings, webhooks, privacy, Dockerfile, immutable tags |
| Manage repository team permissions | Add and remove teams from a repository, and manage team access level                         |
@y
| Permission                         | Description                                                                                  |
| :--------------------------------- | :------------------------------------------------------------------------------------------- |
| View repositories                  | View repository details and contents                                                         |
| Manage repositories                | Full repository management including settings, webhooks, privacy, Dockerfile, immutable tags |
| Manage repository team permissions | Add and remove teams from a repository, and manage team access level                         |
@z

@x
## Billing
@y
## Billing
@z

@x
| Permission     | Description                                      |
| :------------- | :----------------------------------------------- |
| View billing   | View organization billing information            |
| Manage billing | Complete access to managing organization billing |
@y
| Permission     | Description                                      |
| :------------- | :----------------------------------------------- |
| View billing   | View organization billing information            |
| Manage billing | Complete access to managing organization billing |
@z

@x
## AI Governance
@y
## AI Governance
@z

@x
| Permission            | Description                                          |
| :-------------------- | :--------------------------------------------------- |
| View policies         | View existing AI Governance policies and their rules |
| Manage policies       | Full access to AI Governance policy management       |
| View audit logs       | View audit events for the organization               |
| Manage audit settings | Update audit configuration for the organization      |
@y
| Permission            | Description                                          |
| :-------------------- | :--------------------------------------------------- |
| View policies         | View existing AI Governance policies and their rules |
| Manage policies       | Full access to AI Governance policy management       |
| View audit logs       | View audit events for the organization               |
| Manage audit settings | Update audit configuration for the organization      |
@z

@x
## DHI (Docker Hardened Images)
@y
## DHI (Docker Hardened Images)
@z

@x
| Permission         | Description                                      |
| :----------------- | :----------------------------------------------- |
| Create DHI mirrors | Create Docker Hardened Image mirror repositories |
@y
| Permission         | Description                                      |
| :----------------- | :----------------------------------------------- |
| Create DHI mirrors | Create Docker Hardened Image mirror repositories |
@z

@x
## Docker Offload
@y
## Docker Offload
@z

@x
| Permission        | Description                                    |
| :---------------- | :--------------------------------------------- |
| Offload Read-Only | View Offload account status, leases, and zones |
@y
| Permission        | Description                                    |
| :---------------- | :--------------------------------------------- |
| Offload Read-Only | View Offload account status, leases, and zones |
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Manage custom roles](manage.md): Create, assign, and delete custom
  roles
- [Core roles and permissions](/manuals/security/roles-and-permissions/core-roles.md):
  Compare built-in Member, Editor, and Owner permissions
@y
- [Manage custom roles](manage.md): Create, assign, and delete custom
  roles
- [Core roles and permissions](manuals/security/roles-and-permissions/core-roles.md):
  Compare built-in Member, Editor, and Owner permissions
@z
