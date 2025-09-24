%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Deprecated Docker Hub API endpoints
keywords: deprecated
title: Deprecated Docker Hub API endpoints
linkTitle: Deprecated
@y
description: Deprecated Docker Hub API endpoints
keywords: deprecated
title: Deprecated Docker Hub API endpoints
linkTitle: Deprecated
@z

@x
This page provides an overview of endpoints that are deprecated in Docker Hub API.
@y
This page provides an overview of endpoints that are deprecated in Docker Hub API.
@z

@x
## Endpoint deprecation policy
@y
## Endpoint deprecation policy
@z

@x
As changes are made to Docker there may be times when existing endpoints need to be removed or replaced with newer endpoints. Before an existing endpoint is removed it is labeled as "deprecated" within the documentation. After some time it may be removed.
@y
As changes are made to Docker there may be times when existing endpoints need to be removed or replaced with newer endpoints. Before an existing endpoint is removed it is labeled as "deprecated" within the documentation. After some time it may be removed.
@z

@x
## Deprecated endpoints
@y
## Deprecated endpoints
@z

@x
The following table provides an overview of the current status of deprecated endpoints:
@y
The following table provides an overview of the current status of deprecated endpoints:
@z

@x
**Deprecated**: the endpoint is marked "deprecated" and should no longer be used.
@y
**Deprecated**: the endpoint is marked "deprecated" and should no longer be used.
@z

@x
The endpoint may be removed, disabled, or change behavior in a future release.
@y
The endpoint may be removed, disabled, or change behavior in a future release.
@z

@x
**Removed**: the endpoint was removed, disabled, or hidden.
@y
**Removed**: the endpoint was removed, disabled, or hidden.
@z

@x
---
@y
---
@z

@x
| Status     | Feature                                                                               | Date       |
|------------|---------------------------------------------------------------------------------------|------------|
| Deprecated | [Deprecate /v2/repositories/{namespace}](#deprecate-legacy-listnamespacerepositories) | 2025-06-27 |
|            | [Create deprecation log table](#create-deprecation-log-table)                         | 2025-06-27 |
| Removed    | [Docker Hub API v1 deprecation](#docker-hub-api-v1-deprecation)                       | 2022-08-23 |
@y
| Status     | Feature                                                                               | Date       |
|------------|---------------------------------------------------------------------------------------|------------|
| Deprecated | [Deprecate /v2/repositories/{namespace}](#deprecate-legacy-listnamespacerepositories) | 2025-06-27 |
|            | [Create deprecation log table](#create-deprecation-log-table)                         | 2025-06-27 |
| Removed    | [Docker Hub API v1 deprecation](#docker-hub-api-v1-deprecation)                       | 2022-08-23 |
@z

@x
---
@y
---
@z

@x
### Deprecate legacy ListNamespaceRepositories
@y
### Deprecate legacy ListNamespaceRepositories
@z

@x
Deprecate undocumented endpoint `GET /v2/repositories/{namespace}` replaced by [List repositories](/reference/api/hub/latest/#tag/repositories/operation/listNamespaceRepositories).
@y
Deprecate undocumented endpoint `GET /v2/repositories/{namespace}` replaced by [List repositories](/reference/api/hub/latest/#tag/repositories/operation/listNamespaceRepositories).
@z

@x
---
@y
---
@z

@x
### Create deprecation log table
@y
### Create deprecation log table
@z

@x
Reformat page
@y
Reformat page
@z

@x
---
@y
---
@z

@x
### Docker Hub API v1 deprecation
@y
### Docker Hub API v1 deprecation
@z

@x
Docker Hub API v1 has been deprecated. Use Docker Hub API v2 instead.
@y
Docker Hub API v1 has been deprecated. Use Docker Hub API v2 instead.
@z

@x
The following API routes within the v1 path will no longer work and will return a 410 status code:
* `/v1/repositories/{name}/images`
* `/v1/repositories/{name}/tags`
* `/v1/repositories/{name}/tags/{tag_name}`
* `/v1/repositories/{namespace}/{name}/images`
* `/v1/repositories/{namespace}/{name}/tags`
* `/v1/repositories/{namespace}/{name}/tags/{tag_name}`
@y
The following API routes within the v1 path will no longer work and will return a 410 status code:
* `/v1/repositories/{name}/images`
* `/v1/repositories/{name}/tags`
* `/v1/repositories/{name}/tags/{tag_name}`
* `/v1/repositories/{namespace}/{name}/images`
* `/v1/repositories/{namespace}/{name}/tags`
* `/v1/repositories/{namespace}/{name}/tags/{tag_name}`
@z

@x
If you want to continue using the Docker Hub API in your current applications, update your clients to use v2 endpoints.
@y
If you want to continue using the Docker Hub API in your current applications, update your clients to use v2 endpoints.
@z

@x
| **OLD**                                                                                                                                                              | **NEW**                                                                                                                                   |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| [/v1/repositories/{name}/tags](https://github.com/moby/moby/blob/v1.8.3/docs/reference/api/registry_api.md#list-repository-tags)                                     | [/v2/namespaces/{namespace}/repositories/{repository}/tags](/reference/api/hub/latest/#tag/repositories/operation/ListRepositoryTags)     |
| [/v1/repositories/{namespace}/{name}/tags](https://github.com/moby/moby/blob/v1.8.3/docs/reference/api/registry_api.md#list-repository-tags)                         | [/v2/namespaces/{namespace}/repositories/{repository}/tags](/reference/api/hub/latest.md/#tag/repositories/operation/ListRepositoryTags)  |
| [/v1/repositories/{namespace}/{name}/tags](https://github.com/moby/moby/blob/v1.8.3/docs/reference/api/registry_api.md#get-image-id-for-a-particular-tag)            | [/v2/namespaces/{namespace}/repositories/{repository}/tags/{tag}](/reference/api/hub/latest/#tag/repositories/operation/GetRepositoryTag) |
| [/v1/repositories/{namespace}/{name}/tags/{tag_name}](https://github.com/moby/moby/blob/v1.8.3/docs/reference/api/registry_api.md#get-image-id-for-a-particular-tag) | [/v2/namespaces/{namespace}/repositories/{repository}/tags/{tag}](/reference/api/hub/latest/#tag/repositories/operation/GetRepositoryTag) |
@y
| **OLD**                                                                                                                                                              | **NEW**                                                                                                                                   |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| [/v1/repositories/{name}/tags](https://github.com/moby/moby/blob/v1.8.3/docs/reference/api/registry_api.md#list-repository-tags)                                     | [/v2/namespaces/{namespace}/repositories/{repository}/tags](/reference/api/hub/latest/#tag/repositories/operation/ListRepositoryTags)     |
| [/v1/repositories/{namespace}/{name}/tags](https://github.com/moby/moby/blob/v1.8.3/docs/reference/api/registry_api.md#list-repository-tags)                         | [/v2/namespaces/{namespace}/repositories/{repository}/tags](/reference/api/hub/latest.md/#tag/repositories/operation/ListRepositoryTags)  |
| [/v1/repositories/{namespace}/{name}/tags](https://github.com/moby/moby/blob/v1.8.3/docs/reference/api/registry_api.md#get-image-id-for-a-particular-tag)            | [/v2/namespaces/{namespace}/repositories/{repository}/tags/{tag}](/reference/api/hub/latest/#tag/repositories/operation/GetRepositoryTag) |
| [/v1/repositories/{namespace}/{name}/tags/{tag_name}](https://github.com/moby/moby/blob/v1.8.3/docs/reference/api/registry_api.md#get-image-id-for-a-particular-tag) | [/v2/namespaces/{namespace}/repositories/{repository}/tags/{tag}](/reference/api/hub/latest/#tag/repositories/operation/GetRepositoryTag) |
@z

@x
---
@y
---
@z
