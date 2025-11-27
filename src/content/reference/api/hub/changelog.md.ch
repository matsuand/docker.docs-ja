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
- Add missing `expires_at` fields on [PAT management](/reference/api/hub/latest/#tag/access-tokens) endpoints.
@y
- Add missing `expires_at` fields on [PAT management](__SUBDIR__/reference/api/hub/latest/#tag/access-tokens) endpoints.
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
- Fix [Assign repository group](/reference/api/hub/latest/#tag/repositories/operation/CreateRepositoryGroup) endpoints request/response
@y
- Fix [Assign repository group](__SUBDIR__/reference/api/hub/latest/#tag/repositories/operation/CreateRepositoryGroup) endpoints request/response
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
- Add [Create repository](/reference/api/hub/latest/#tag/repositories/operation/CreateRepository) endpoints for a given `namespace`.
- Add [Get repository](/reference/api/hub/latest/#tag/repositories/operation/GetRepository) endpoints for a given `namespace`.
- Add [Check repository](/reference/api/hub/latest/#tag/repositories/operation/CheckRepository) endpoints for a given `namespace`.
@y
- Add [Create repository](__SUBDIR__/reference/api/hub/latest/#tag/repositories/operation/CreateRepository) endpoints for a given `namespace`.
- Add [Get repository](__SUBDIR__/reference/api/hub/latest/#tag/repositories/operation/GetRepository) endpoints for a given `namespace`.
- Add [Check repository](__SUBDIR__/reference/api/hub/latest/#tag/repositories/operation/CheckRepository) endpoints for a given `namespace`.
@z

@x
### Deprecations
@y
### Deprecations
@z

@x
- [Deprecate POST /v2/repositories](/reference/api/hub/deprecated/#deprecate-legacy-createrepository)
- [Deprecate POST /v2/repositories/{namespace}](/reference/api/hub/deprecated/#deprecate-legacy-createrepository)
- [Deprecate GET /v2/repositories/{namespace}/{repository}](/reference/api/hub/deprecated/#deprecate-legacy-getrepository)
- [Deprecate HEAD /v2/repositories/{namespace}/{repository}](/reference/api/hub/deprecated/#deprecate-legacy-getrepository)
@y
- [Deprecate POST /v2/repositories](__SUBDIR__/reference/api/hub/deprecated/#deprecate-legacy-createrepository)
- [Deprecate POST /v2/repositories/{namespace}](__SUBDIR__/reference/api/hub/deprecated/#deprecate-legacy-createrepository)
- [Deprecate GET /v2/repositories/{namespace}/{repository}](__SUBDIR__/reference/api/hub/deprecated/#deprecate-legacy-getrepository)
- [Deprecate HEAD /v2/repositories/{namespace}/{repository}](__SUBDIR__/reference/api/hub/deprecated/#deprecate-legacy-getrepository)
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
- Add [Update repository immutable tags settings](/reference/api/hub/latest/#tag/repositories/operation/UpdateRepositoryImmutableTags) endpoints for a given `namespace` and `repository`.
- Add [Verify repository immutable tags](/reference/api/hub/latest/#tag/repositories/operation/VerifyRepositoryImmutableTags) endpoints for a given `namespace` and `repository`.
@y
- Add [Update repository immutable tags settings](__SUBDIR__/reference/api/hub/latest/#tag/repositories/operation/UpdateRepositoryImmutableTags) endpoints for a given `namespace` and `repository`.
- Add [Verify repository immutable tags](__SUBDIR__/reference/api/hub/latest/#tag/repositories/operation/VerifyRepositoryImmutableTags) endpoints for a given `namespace` and `repository`.
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
- Add [List repositories](/reference/api/hub/latest/#tag/repositories/operation/listNamespaceRepositories) endpoints for a given `namespace`.
@y
- Add [List repositories](__SUBDIR__/reference/api/hub/latest/#tag/repositories/operation/listNamespaceRepositories) endpoints for a given `namespace`.
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
- Add [APIs](/reference/api/hub/latest/#tag/org-access-tokens) for organization access token (OATs) management.
@y
- Add [APIs](__SUBDIR__/reference/api/hub/latest/#tag/org-access-tokens) for organization access token (OATs) management.
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
- Add access to [audit logs](/reference/api/hub/latest/#tag/audit-logs) for org
  access tokens.
@y
- Add access to [audit logs](__SUBDIR__/reference/api/hub/latest/#tag/audit-logs) for org
  access tokens.
@z
