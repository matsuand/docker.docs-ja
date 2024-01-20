%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Amazon S3 cache
description: Manage build cache with Amazon S3 buckets
keywords: build, buildx, cache, backend, s3, buckets, aws
aliases:
  - /build/building/cache/backends/s3/
---
@y
---
title: Amazon S3 cache
description: Manage build cache with Amazon S3 buckets
keywords: build, buildx, cache, backend, s3, buckets, aws
aliases:
  - /build/building/cache/backends/s3/
---
@z

@x
> **Experimental**
>
> This is an experimental feature. The interface and behavior are unstable and
> may change in future releases.
{ .restricted }
@y
> **Experimental**
>
> This is an experimental feature. The interface and behavior are unstable and
> may change in future releases.
{ .restricted }
@z

@x
The `s3` cache storage uploads your resulting build cache to
[Amazon S3 file storage service](https://aws.amazon.com/s3/)
or other S3-compatible services, such as [MinIO](https://min.io/).
@y
The `s3` cache storage uploads your resulting build cache to
[Amazon S3 file storage service](https://aws.amazon.com/s3/)
or other S3-compatible services, such as [MinIO](https://min.io/).
@z

@x
This cache storage backend is not supported with the default `docker` driver.
To use this feature, create a new builder using a different driver. See
[Build drivers](../../drivers/_index.md) for more information.
@y
This cache storage backend is not supported with the default `docker` driver.
To use this feature, create a new builder using a different driver. See
[Build drivers](../../drivers/_index.md) for more information.
@z

@x
## Synopsis
@y
## Synopsis
@z

@x
```console
$ docker buildx build --push -t <user>/<image> \
  --cache-to type=s3,region=<region>,bucket=<bucket>,name=<cache-image>[,parameters...] \
  --cache-from type=s3,region=<region>,bucket=<bucket>,name=<cache-image> .
```
@y
```console
$ docker buildx build --push -t <user>/<image> \
  --cache-to type=s3,region=<region>,bucket=<bucket>,name=<cache-image>[,parameters...] \
  --cache-from type=s3,region=<region>,bucket=<bucket>,name=<cache-image> .
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
| Name                | Option                  | Type        | Default | Description                                                |
| ------------------- | ----------------------- | ----------- | ------- | ---------------------------------------------------------- |
| `region`            | `cache-to`,`cache-from` | String      |         | Required. Geographic location.                             |
| `bucket`            | `cache-to`,`cache-from` | String      |         | Required. Name of the S3 bucket.                           |
| `name`              | `cache-to`,`cache-from` | String      |         | Name of the cache image.                                   |
| `endpoint_url`      | `cache-to`,`cache-from` | String      |         | Endpoint of the S3 bucket.                                 |
| `blobs_prefix`      | `cache-to`,`cache-from` | String      |         | Prefix to prepend to blob filenames.                       |
| `manifests_prefix`  | `cache-to`,`cache-from` | String      |         | Prefix to prepend on manifest filenames.                   |
| `use_path_style`    | `cache-to`,`cache-from` | Boolean     | `false` | When `true`, uses `bucket` in the URL instead of hostname. |
| `access_key_id`     | `cache-to`,`cache-from` | String      |         | See [authentication][1].                                   |
| `secret_access_key` | `cache-to`,`cache-from` | String      |         | See [authentication][1].                                   |
| `session_token`     | `cache-to`,`cache-from` | String      |         | See [authentication][1].                                   |
| `mode`              | `cache-to`              | `min`,`max` | `min`   | Cache layers to export, see [cache mode][2].               |
| `ignore-error`      | `cache-to`              | Boolean     | `false` | Ignore errors caused by failed cache exports.              |
@y
| Name                | Option                  | Type        | Default | Description                                                |
| ------------------- | ----------------------- | ----------- | ------- | ---------------------------------------------------------- |
| `region`            | `cache-to`,`cache-from` | String      |         | Required. Geographic location.                             |
| `bucket`            | `cache-to`,`cache-from` | String      |         | Required. Name of the S3 bucket.                           |
| `name`              | `cache-to`,`cache-from` | String      |         | Name of the cache image.                                   |
| `endpoint_url`      | `cache-to`,`cache-from` | String      |         | Endpoint of the S3 bucket.                                 |
| `blobs_prefix`      | `cache-to`,`cache-from` | String      |         | Prefix to prepend to blob filenames.                       |
| `manifests_prefix`  | `cache-to`,`cache-from` | String      |         | Prefix to prepend on manifest filenames.                   |
| `use_path_style`    | `cache-to`,`cache-from` | Boolean     | `false` | When `true`, uses `bucket` in the URL instead of hostname. |
| `access_key_id`     | `cache-to`,`cache-from` | String      |         | See [authentication][1].                                   |
| `secret_access_key` | `cache-to`,`cache-from` | String      |         | See [authentication][1].                                   |
| `session_token`     | `cache-to`,`cache-from` | String      |         | See [authentication][1].                                   |
| `mode`              | `cache-to`              | `min`,`max` | `min`   | Cache layers to export, see [cache mode][2].               |
| `ignore-error`      | `cache-to`              | Boolean     | `false` | Ignore errors caused by failed cache exports.              |
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
Buildx can reuse existing AWS credentials, configured either using a
credentials file or environment variables, for pushing and pulling cache to S3.
Alternatively, you can use the `access_key_id`, `secret_access_key`, and
`session_token` attributes to specify credentials directly on the CLI.
@y
Buildx can reuse existing AWS credentials, configured either using a
credentials file or environment variables, for pushing and pulling cache to S3.
Alternatively, you can use the `access_key_id`, `secret_access_key`, and
`session_token` attributes to specify credentials directly on the CLI.
@z

@x
Refer to [AWS Go SDK, Specifying Credentials][3] for details about
authentication using environment variables and credentials file.
@y
Refer to [AWS Go SDK, Specifying Credentials][3] for details about
authentication using environment variables and credentials file.
@z

@x
[3]: https://docs.aws.amazon.com/sdk-for-go/v1/developer-guide/configuring-sdk.html#specifying-credentials
@y
[3]: https://docs.aws.amazon.com/sdk-for-go/v1/developer-guide/configuring-sdk.html#specifying-credentials
@z

@x
## Further reading
@y
## Further reading
@z

@x
For an introduction to caching see [Optimizing builds with cache](../_index.md).
@y
For an introduction to caching see [Optimizing builds with cache](../_index.md).
@z

@x
For more information on the `s3` cache backend, see the
[BuildKit README](https://github.com/moby/buildkit#s3-cache-experimental).
@y
For more information on the `s3` cache backend, see the
[BuildKit README](https://github.com/moby/buildkit#s3-cache-experimental).
@z
