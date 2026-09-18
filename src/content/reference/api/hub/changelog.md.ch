%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: Docker Hub API changelog
title: Docker Hub API changelog
linkTitle: Changelog
keywords: docker hub, hub, whats new, release notes, api, changelog
@y
description: Docker Hub API changelog
title: Docker Hub API changelog
linkTitle: Changelog
keywords: docker hub, hub, whats new, release notes, api, changelog
@z

@x
Here you can learn about the latest changes, new features, bug fixes, and known
issues for Docker Service APIs.
@y
Here you can learn about the latest changes, new features, bug fixes, and known
issues for Docker Service APIs.
@z

@x
---
@y
---
@z

@x
## 2026-09-01
@y
## 2026-09-01
@z

@x
### Updates
@y
### Updates
@z

@x
- Document that [Update org member (role)](/reference/api/hub/latest/#tag-orgs)
  accepts a custom role name in `role`.
- Document the `role` field on
  [Update some details for an organization group](/reference/api/hub/latest/#tag-groups).
- Add `Editor` to `org_member.role` on
  [organization members](/reference/api/hub/latest/#tag-orgs).
@y
- Document that [Update org member (role)](__SUBDIR__/reference/api/hub/latest/#tag-orgs)
  accepts a custom role name in `role`.
- Document the `role` field on
  [Update some details for an organization group](__SUBDIR__/reference/api/hub/latest/#tag-groups).
- Add `Editor` to `org_member.role` on
  [organization members](__SUBDIR__/reference/api/hub/latest/#tag-orgs).
@z

@x
---
@y
---
@z

@x
## 2026-08-27
@y
## 2026-08-27
@z

@x
### Updates
@y
### Updates
@z

@x
- Document organization access token (OAT) support for
  [repository management](/reference/api/hub/latest/#tag-repositories)
  endpoints, the scope-dependent behavior of
  [List repositories](/reference/api/hub/latest/operations/listNamespaceRepositories/),
  and legacy paths that are OAT unsupported.
@y
- Document organization access token (OAT) support for
  [repository management](__SUBDIR__/reference/api/hub/latest/#tag-repositories)
  endpoints, the scope-dependent behavior of
  [List repositories](__SUBDIR__/reference/api/hub/latest/operations/listNamespaceRepositories/),
  and legacy paths that are OAT unsupported.
@z

@x
---
@y
---
@z

@x
## 2025-11-21
@y
## 2025-11-21
@z

@x
### Updates
@y
### Updates
@z

@x
- Add missing `expires_at` fields on [PAT management](/reference/api/hub/latest/#tag-access-tokens) endpoints.
@y
- Add missing `expires_at` fields on [PAT management](__SUBDIR__/reference/api/hub/latest/#tag-access-tokens) endpoints.
@z

@x
## 2025-09-25
@y
## 2025-09-25
@z

@x
### Updates
@y
### Updates
@z

@x
- Fix [Assign repository group](/reference/api/hub/latest/operations/CreateRepositoryGroup/) endpoints request/response
@y
- Fix [Assign repository group](__SUBDIR__/reference/api/hub/latest/operations/CreateRepositoryGroup/) endpoints request/response
@z

@x
---
@y
---
@z

@x
## 2025-09-19
@y
## 2025-09-19
@z

@x
### New
@y
### New
@z

@x
- Add [Create repository](/reference/api/hub/latest/operations/CreateRepository/) endpoints for a given `namespace`.
- Add [Get repository](/reference/api/hub/latest/operations/GetRepository/) endpoints for a given `namespace`.
- Add [Check repository](/reference/api/hub/latest/operations/CheckRepository/) endpoints for a given `namespace`.
@y
- Add [Create repository](__SUBDIR__/reference/api/hub/latest/operations/CreateRepository/) endpoints for a given `namespace`.
- Add [Get repository](__SUBDIR__/reference/api/hub/latest/operations/GetRepository/) endpoints for a given `namespace`.
- Add [Check repository](__SUBDIR__/reference/api/hub/latest/operations/CheckRepository/) endpoints for a given `namespace`.
@z

@x
### Deprecations
@y
### Deprecations
@z

@x
- [Deprecate POST /v2/repositories](/reference/api/hub/deprecated/#deprecate-legacy-createrepository-and-getrepository)
- [Deprecate POST /v2/repositories/{namespace}](/reference/api/hub/deprecated/#deprecate-legacy-createrepository-and-getrepository)
- [Deprecate GET /v2/repositories/{namespace}/{repository}](/reference/api/hub/deprecated/#deprecate-legacy-createrepository-and-getrepository)
- [Deprecate HEAD /v2/repositories/{namespace}/{repository}](/reference/api/hub/deprecated/#deprecate-legacy-createrepository-and-getrepository)
@y
- [Deprecate POST /v2/repositories](__SUBDIR__/reference/api/hub/deprecated/#deprecate-legacy-createrepository-and-getrepository)
- [Deprecate POST /v2/repositories/{namespace}](__SUBDIR__/reference/api/hub/deprecated/#deprecate-legacy-createrepository-and-getrepository)
- [Deprecate GET /v2/repositories/{namespace}/{repository}](__SUBDIR__/reference/api/hub/deprecated/#deprecate-legacy-createrepository-and-getrepository)
- [Deprecate HEAD /v2/repositories/{namespace}/{repository}](__SUBDIR__/reference/api/hub/deprecated/#deprecate-legacy-createrepository-and-getrepository)
@z

@x
---
@y
---
@z

@x
## 2025-07-29
@y
## 2025-07-29
@z

@x
### New
@y
### New
@z

@x
- Add [Update repository immutable tags settings](/reference/api/hub/latest/operations/UpdateRepositoryImmutableTags/) endpoints for a given `namespace` and `repository`.
- Add [Verify repository immutable tags](/reference/api/hub/latest/operations/VerifyRepositoryImmutableTags/) endpoints for a given `namespace` and `repository`.
@y
- Add [Update repository immutable tags settings](__SUBDIR__/reference/api/hub/latest/operations/UpdateRepositoryImmutableTags/) endpoints for a given `namespace` and `repository`.
- Add [Verify repository immutable tags](__SUBDIR__/reference/api/hub/latest/operations/VerifyRepositoryImmutableTags/) endpoints for a given `namespace` and `repository`.
@z

@x
---
@y
---
@z

@x
## 2025-06-27
@y
## 2025-06-27
@z

@x
### New
@y
### New
@z

@x
- Add [List repositories](/reference/api/hub/latest/operations/listNamespaceRepositories/) endpoints for a given `namespace`.
@y
- Add [List repositories](__SUBDIR__/reference/api/hub/latest/operations/listNamespaceRepositories/) endpoints for a given `namespace`.
@z

@x
### Deprecations
@y
### Deprecations
@z

@x
- [Deprecate /v2/repositories/{namespace}](/reference/api/hub/deprecated/#deprecate-legacy-listnamespacerepositories)
@y
- [Deprecate /v2/repositories/{namespace}](__SUBDIR__/reference/api/hub/deprecated/#deprecate-legacy-listnamespacerepositories)
@z

@x
---
@y
---
@z

@x
## 2025-03-25
@y
## 2025-03-25
@z

@x
### New
@y
### New
@z

@x
- Add [APIs](/reference/api/hub/latest/#tag-org-access-tokens) for organization access token (OATs) management.
@y
- Add [APIs](__SUBDIR__/reference/api/hub/latest/#tag-org-access-tokens) for organization access token (OATs) management.
@z

@x
---
@y
---
@z

@x
## 2025-03-18
@y
## 2025-03-18
@z

@x
### New
@y
### New
@z

@x
- Add access to [audit logs](/reference/api/hub/latest/#tag-audit-logs) for org
  access tokens.
@y
- Add access to [audit logs](__SUBDIR__/reference/api/hub/latest/#tag-audit-logs) for org
  access tokens.
@z
