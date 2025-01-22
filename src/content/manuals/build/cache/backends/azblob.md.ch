%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Azure Blob Storage cache
description: Manage build cache with Azure blob storage
keywords: build, buildx, cache, backend, azblob, azure
@y
title: Azure Blob Storage cache
description: Manage build cache with Azure blob storage
keywords: build, buildx, cache, backend, azblob, azure
@z

@x
{{< summary-bar feature_name="Azure blob" >}}
@y
{{< summary-bar feature_name="Azure blob" >}}
@z

@x
The `azblob` cache store uploads your resulting build cache to
[Azure's blob storage service](https://azure.microsoft.com/en-us/services/storage/blobs/).
@y
The `azblob` cache store uploads your resulting build cache to
[Azure's blob storage service](https://azure.microsoft.com/en-us/services/storage/blobs/).
@z

@x
This cache storage backend is not supported with the default `docker` driver.
To use this feature, create a new builder using a different driver. See
[Build drivers](/manuals/build/builders/drivers/_index.md) for more information.
@y
This cache storage backend is not supported with the default `docker` driver.
To use this feature, create a new builder using a different driver. See
[Build drivers](manuals/build/builders/drivers/_index.md) for more information.
@z

@x
## Synopsis
@y
## Synopsis
@z

@x
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-to type=azblob,name=<cache-image>[,parameters...] \
  --cache-from type=azblob,name=<cache-image>[,parameters...] .
```
@y
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-to type=azblob,name=<cache-image>[,parameters...] \
  --cache-from type=azblob,name=<cache-image>[,parameters...] .
```
@z

@x
The following table describes the available CSV parameters that you can pass to
`--cache-to` and `--cache-from`.
@y
The following table describes the available CSV parameters that you can pass to
`--cache-to` and `--cache-from`.
@z

@x
| Name                | Option                  | Type        | Default | Description                                        |
| ------------------- | ----------------------- | ----------- | ------- | -------------------------------------------------- |
| `name`              | `cache-to`,`cache-from` | String      |         | Required. The name of the cache image.             |
| `account_url`       | `cache-to`,`cache-from` | String      |         | Base URL of the storage account.                   |
| `secret_access_key` | `cache-to`,`cache-from` | String      |         | Blob storage account key, see [authentication][1]. |
| `mode`              | `cache-to`              | `min`,`max` | `min`   | Cache layers to export, see [cache mode][2].       |
| `ignore-error`      | `cache-to`              | Boolean     | `false` | Ignore errors caused by failed cache exports.      |
@y
| Name                | Option                  | Type        | Default | Description                                        |
| ------------------- | ----------------------- | ----------- | ------- | -------------------------------------------------- |
| `name`              | `cache-to`,`cache-from` | String      |         | Required. The name of the cache image.             |
| `account_url`       | `cache-to`,`cache-from` | String      |         | Base URL of the storage account.                   |
| `secret_access_key` | `cache-to`,`cache-from` | String      |         | Blob storage account key, see [authentication][1]. |
| `mode`              | `cache-to`              | `min`,`max` | `min`   | Cache layers to export, see [cache mode][2].       |
| `ignore-error`      | `cache-to`              | Boolean     | `false` | Ignore errors caused by failed cache exports.      |
@z

@x
[1]: #authentication
[2]: _index.md#cache-mode
@y
[1]: #authentication
[2]: _index.md#cache-mode
@z

@x
## Authentication
@y
## Authentication
@z

@x
The `secret_access_key`, if left unspecified, is read from environment variables
on the BuildKit server following the scheme for the
[Azure Go SDK](https://docs.microsoft.com/en-us/azure/developer/go/azure-sdk-authentication).
The environment variables are read from the server, not the Buildx client.
@y
The `secret_access_key`, if left unspecified, is read from environment variables
on the BuildKit server following the scheme for the
[Azure Go SDK](https://docs.microsoft.com/en-us/azure/developer/go/azure-sdk-authentication).
The environment variables are read from the server, not the Buildx client.
@z

@x
## Further reading
@y
## Further reading
@z

@x
For an introduction to caching see [Docker build cache](../_index.md).
@y
For an introduction to caching see [Docker build cache](../_index.md).
@z

@x
For more information on the `azblob` cache backend, see the
[BuildKit README](https://github.com/moby/buildkit#azure-blob-storage-cache-experimental).
@y
For more information on the `azblob` cache backend, see the
[BuildKit README](https://github.com/moby/buildkit#azure-blob-storage-cache-experimental).
@z
