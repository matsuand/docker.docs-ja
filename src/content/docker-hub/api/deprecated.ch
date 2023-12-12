%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Hub API v1 (deprecated)
keywords: kitematic, deprecated
title: Docker Hub API v1 (deprecated)
---
@y
---
description: Docker Hub API v1 (deprecated)
keywords: kitematic, deprecated
title: Docker Hub API v1 (deprecated)
---
@z

@x
> **Deprecated**
>
> Docker Hub API v1 has been deprecated. Please use Docker Hub API v2 instead.
{ .warning }
@y
> **Deprecated**
>
> Docker Hub API v1 has been deprecated. Please use Docker Hub API v2 instead.
{ .warning }
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
| **OLD**                                                                                                                                                              | **NEW**                                                                                                                                                                                                         |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [/v1/repositories/{name}/images](https://github.com/moby/moby/blob/v1.3.0/docs/sources/reference/api/docker-io_api.md#list-user-repository-images)                   | [/v2/namespaces/{namespace}/repositories/{repository}/images](../../docker-hub/api/latest.md#tag/images/operation/GetNamespacesRepositoriesImages)                                                              |
| [/v1/repositories/{namespace}/{name}/images](https://github.com/moby/moby/blob/v1.3.0/docs/sources/reference/api/docker-io_api.md#list-user-repository-images)       | [/v2/namespaces/{namespace}/repositories/{repository}/images](../../docker-hub/api/latest.md#tag/images/operation/GetNamespacesRepositoriesImages)                                                              |
| [/v1/repositories/{name}/tags](https://github.com/moby/moby/blob/v1.8.3/docs/reference/api/registry_api.md#list-repository-tags)                                     | [/v2/namespaces/{namespace}/repositories/{repository}/tags](../../docker-hub/api/latest.md#tag/repositories/paths/~1v2~1namespaces~1%7Bnamespace%7D~1repositories~1%7Brepository%7D~1tags/get)                  |
| [/v1/repositories/{namespace}/{name}/tags](https://github.com/moby/moby/blob/v1.8.3/docs/reference/api/registry_api.md#list-repository-tags)                         | [/v2/namespaces/{namespace}/repositories/{repository}/tags](../../docker-hub/api/latest.md#tag/repositories/paths/~1v2~1namespaces~1%7Bnamespace%7D~1repositories~1%7Brepository%7D~1tags/get)                  |
| [/v1/repositories/{namespace}/{name}/tags](https://github.com/moby/moby/blob/v1.8.3/docs/reference/api/registry_api.md#get-image-id-for-a-particular-tag)            | [/v2/namespaces/{namespace}/repositories/{repository}/tags/{tag}](../../docker-hub/api/latest.md#tag/repositories/paths/~1v2~1namespaces~1%7Bnamespace%7D~1repositories~1%7Brepository%7D~1tags~1%7Btag%7D/get) |
| [/v1/repositories/{namespace}/{name}/tags/{tag_name}](https://github.com/moby/moby/blob/v1.8.3/docs/reference/api/registry_api.md#get-image-id-for-a-particular-tag) | [/v2/namespaces/{namespace}/repositories/{repository}/tags/{tag}](../../docker-hub/api/latest.md#tag/repositories/paths/~1v2~1namespaces~1%7Bnamespace%7D~1repositories~1%7Brepository%7D~1tags~1%7Btag%7D/get) |
@y
| **OLD**                                                                                                                                                              | **NEW**                                                                                                                                                                                                         |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [/v1/repositories/{name}/images](https://github.com/moby/moby/blob/v1.3.0/docs/sources/reference/api/docker-io_api.md#list-user-repository-images)                   | [/v2/namespaces/{namespace}/repositories/{repository}/images](../../docker-hub/api/latest.md#tag/images/operation/GetNamespacesRepositoriesImages)                                                              |
| [/v1/repositories/{namespace}/{name}/images](https://github.com/moby/moby/blob/v1.3.0/docs/sources/reference/api/docker-io_api.md#list-user-repository-images)       | [/v2/namespaces/{namespace}/repositories/{repository}/images](../../docker-hub/api/latest.md#tag/images/operation/GetNamespacesRepositoriesImages)                                                              |
| [/v1/repositories/{name}/tags](https://github.com/moby/moby/blob/v1.8.3/docs/reference/api/registry_api.md#list-repository-tags)                                     | [/v2/namespaces/{namespace}/repositories/{repository}/tags](../../docker-hub/api/latest.md#tag/repositories/paths/~1v2~1namespaces~1%7Bnamespace%7D~1repositories~1%7Brepository%7D~1tags/get)                  |
| [/v1/repositories/{namespace}/{name}/tags](https://github.com/moby/moby/blob/v1.8.3/docs/reference/api/registry_api.md#list-repository-tags)                         | [/v2/namespaces/{namespace}/repositories/{repository}/tags](../../docker-hub/api/latest.md#tag/repositories/paths/~1v2~1namespaces~1%7Bnamespace%7D~1repositories~1%7Brepository%7D~1tags/get)                  |
| [/v1/repositories/{namespace}/{name}/tags](https://github.com/moby/moby/blob/v1.8.3/docs/reference/api/registry_api.md#get-image-id-for-a-particular-tag)            | [/v2/namespaces/{namespace}/repositories/{repository}/tags/{tag}](../../docker-hub/api/latest.md#tag/repositories/paths/~1v2~1namespaces~1%7Bnamespace%7D~1repositories~1%7Brepository%7D~1tags~1%7Btag%7D/get) |
| [/v1/repositories/{namespace}/{name}/tags/{tag_name}](https://github.com/moby/moby/blob/v1.8.3/docs/reference/api/registry_api.md#get-image-id-for-a-particular-tag) | [/v2/namespaces/{namespace}/repositories/{repository}/tags/{tag}](../../docker-hub/api/latest.md#tag/repositories/paths/~1v2~1namespaces~1%7Bnamespace%7D~1repositories~1%7Brepository%7D~1tags~1%7Btag%7D/get) |
@z
