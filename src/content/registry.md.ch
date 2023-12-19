%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Registry
description: The Docker Hub registry implementation 
keywords: registry, distribution, docker hub, spec, schema, api, manifest, auth
aliases:
  - /registry/compatibility/
  - /registry/deploying/
  - /registry/deprecated/
  - /registry/garbage-collection/
  - /registry/help/
  - /registry/insecure/
  - /registry/introduction/
  - /registry/notifications/
  - /registry/recipes/
  - /registry/recipes/apache/
  - /registry/recipes/nginx/
  - /registry/recipes/osx-setup-guide/
  - /registry/spec/
  - /registry/spec/api/
  - /registry/spec/auth/
  - /registry/spec/auth/jwt/
  - /registry/spec/auth/oauth/
  - /registry/spec/auth/scope/
  - /registry/spec/auth/token/
  - /registry/spec/deprecated-schema-v1/
  - /registry/spec/implementations/
  - /registry/spec/json/
  - /registry/spec/manifest-v2-1/
  - /registry/spec/manifest-v2-2/
  - /registry/spec/menu/
  - /registry/storage-drivers/
  - /registry/storage-drivers/azure/
  - /registry/storage-drivers/filesystem/
  - /registry/storage-drivers/gcs/
  - /registry/storage-drivers/inmemory/
  - /registry/storage-drivers/oss/
  - /registry/storage-drivers/s3/
  - /registry/storage-drivers/swift/
---
@y
---
title: Registry
description: The Docker Hub registry implementation 
keywords: registry, distribution, docker hub, spec, schema, api, manifest, auth
aliases:
  - /registry/compatibility/
  - /registry/deploying/
  - /registry/deprecated/
  - /registry/garbage-collection/
  - /registry/help/
  - /registry/insecure/
  - /registry/introduction/
  - /registry/notifications/
  - /registry/recipes/
  - /registry/recipes/apache/
  - /registry/recipes/nginx/
  - /registry/recipes/osx-setup-guide/
  - /registry/spec/
  - /registry/spec/api/
  - /registry/spec/auth/
  - /registry/spec/auth/jwt/
  - /registry/spec/auth/oauth/
  - /registry/spec/auth/scope/
  - /registry/spec/auth/token/
  - /registry/spec/deprecated-schema-v1/
  - /registry/spec/implementations/
  - /registry/spec/json/
  - /registry/spec/manifest-v2-1/
  - /registry/spec/manifest-v2-2/
  - /registry/spec/menu/
  - /registry/storage-drivers/
  - /registry/storage-drivers/azure/
  - /registry/storage-drivers/filesystem/
  - /registry/storage-drivers/gcs/
  - /registry/storage-drivers/inmemory/
  - /registry/storage-drivers/oss/
  - /registry/storage-drivers/s3/
  - /registry/storage-drivers/swift/
---
@z

@x
Registry, the open source implementation for storing and distributing container
images and other content, has been donated to the CNCF. Registry now goes under
the name of Distribution, and the documentation has moved to
[distribution/distribution].
@y
Registry, the open source implementation for storing and distributing container
images and other content, has been donated to the CNCF. Registry now goes under
the name of Distribution, and the documentation has moved to
[distribution/distribution].
@z

@x
The Docker Hub registry implementation is based on Distribution. Docker Hub
implements version 1.0.1 OCI distribution [specification]. For reference
documentation on the API protocol that Docker Hub implements, refer to the OCI
distribution specification.
@y
The Docker Hub registry implementation is based on Distribution. Docker Hub
implements version 1.0.1 OCI distribution [specification]. For reference
documentation on the API protocol that Docker Hub implements, refer to the OCI
distribution specification.
@z

@x
## Supported media types
@y
## Supported media types
@z

@x
Docker Hub supports the following image manifest formats for pulling images:
@y
Docker Hub supports the following image manifest formats for pulling images:
@z

@x
- [OCI image manifest]
- [Docker image manifest version 2, schema 2]
- Docker image manifest version 2, schema 1
- Docker image manifest version 1
@y
- [OCI image manifest]
- [Docker image manifest version 2, schema 2]
- Docker image manifest version 2, schema 1
- Docker image manifest version 1
@z

@x
You can push images with the following formats:
@y
You can push images with the following formats:
@z

@x
- [OCI image manifest]
- [Docker image manifest version 2, schema 2]
@y
- [OCI image manifest]
- [Docker image manifest version 2, schema 2]
@z

@x
Docker Hub also supports OCI artifacts. See [OCI artifacts].
@y
Docker Hub also supports OCI artifacts. See [OCI artifacts].
@z

@x
## Authentication
@y
## Authentication
@z

@x
For documentation related to authentication to the Docker Hub registry, see:
@y
For documentation related to authentication to the Docker Hub registry, see:
@z

@x
- [Token authentication specification][token]
- [OAuth 2.0 token authentication][oauth2]
- [JWT authentication][jwt]
- [Token scope and access][scope]
@y
- [Token authentication specification][token]
- [OAuth 2.0 token authentication][oauth2]
- [JWT authentication][jwt]
- [Token scope and access][scope]
@z

@x
<!-- links -->
@y
<!-- links -->
@z

@x
[distribution/distribution]: https://distribution.github.io/distribution/
[specification]: https://github.com/opencontainers/distribution-spec/blob/v1.0.1/spec.md
[OCI image manifest]: https://github.com/opencontainers/image-spec/blob/main/manifest.md
[Docker image manifest version 2, schema 2]: https://distribution.github.io/distribution/spec/manifest-v2-2/
[OCI artifacts]: /docker-hub/oci-artifacts/
[oauth2]: https://distribution.github.io/distribution/spec/auth/oauth/
[jwt]: https://distribution.github.io/distribution/spec/auth/jwt/
[token]: https://distribution.github.io/distribution/spec/auth/token/
[scope]: https://distribution.github.io/distribution/spec/auth/scope/
@y
[distribution/distribution]: https://distribution.github.io/distribution/
[specification]: https://github.com/opencontainers/distribution-spec/blob/v1.0.1/spec.md
[OCI image manifest]: https://github.com/opencontainers/image-spec/blob/main/manifest.md
[Docker image manifest version 2, schema 2]: https://distribution.github.io/distribution/spec/manifest-v2-2/
[OCI artifacts]: __SUBDIR__/docker-hub/oci-artifacts/
[oauth2]: https://distribution.github.io/distribution/spec/auth/oauth/
[jwt]: https://distribution.github.io/distribution/spec/auth/jwt/
[token]: https://distribution.github.io/distribution/spec/auth/token/
[scope]: https://distribution.github.io/distribution/spec/auth/scope/
@z
