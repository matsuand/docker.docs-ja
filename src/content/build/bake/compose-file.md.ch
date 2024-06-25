%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Building with Bake from a Compose file
description: Build your compose services with Bake
keywords: build, buildx, bake, buildkit, compose, yaml
aliases:
  - /build/customize/bake/compose-file/
---
@y
---
title: Building with Bake from a Compose file
description: Build your compose services with Bake
keywords: build, buildx, bake, buildkit, compose, yaml
aliases:
  - /build/customize/bake/compose-file/
---
@z

@x
Bake supports the [Compose file format](../../compose/compose-file/_index.md)
to parse a Compose file and translate each service to a [target](reference.md#target).
@y
Bake supports the [Compose file format](../../compose/compose-file/_index.md)
to parse a Compose file and translate each service to a [target](reference.md#target).
@z

@x
```yaml
# docker-compose.yml
services:
  webapp-dev:
    build: &build-dev
      dockerfile: Dockerfile.webapp
      tags:
        - docker.io/username/webapp:latest
      cache_from:
        - docker.io/username/webapp:cache
      cache_to:
        - docker.io/username/webapp:cache
@y
```yaml
# docker-compose.yml
services:
  webapp-dev:
    build: &build-dev
      dockerfile: Dockerfile.webapp
      tags:
        - docker.io/username/webapp:latest
      cache_from:
        - docker.io/username/webapp:cache
      cache_to:
        - docker.io/username/webapp:cache
@z

@x
  webapp-release:
    build:
      <<: *build-dev
      x-bake:
        platforms:
          - linux/amd64
          - linux/arm64
@y
  webapp-release:
    build:
      <<: *build-dev
      x-bake:
        platforms:
          - linux/amd64
          - linux/arm64
@z

@x
  db:
    image: docker.io/username/db
    build:
      dockerfile: Dockerfile.db
```
@y
  db:
    image: docker.io/username/db
    build:
      dockerfile: Dockerfile.db
```
@z

@x
```console
$ docker buildx bake --print
```
@y
```console
$ docker buildx bake --print
```
@z

@x
```json
{
  "group": {
    "default": {
      "targets": ["db", "webapp-dev", "webapp-release"]
    }
  },
  "target": {
    "db": {
      "context": ".",
      "dockerfile": "Dockerfile.db",
      "tags": ["docker.io/username/db"]
    },
    "webapp-dev": {
      "context": ".",
      "dockerfile": "Dockerfile.webapp",
      "tags": ["docker.io/username/webapp:latest"],
      "cache-from": ["docker.io/username/webapp:cache"],
      "cache-to": ["docker.io/username/webapp:cache"]
    },
    "webapp-release": {
      "context": ".",
      "dockerfile": "Dockerfile.webapp",
      "tags": ["docker.io/username/webapp:latest"],
      "cache-from": ["docker.io/username/webapp:cache"],
      "cache-to": ["docker.io/username/webapp:cache"],
      "platforms": ["linux/amd64", "linux/arm64"]
    }
  }
}
```
@y
```json
{
  "group": {
    "default": {
      "targets": ["db", "webapp-dev", "webapp-release"]
    }
  },
  "target": {
    "db": {
      "context": ".",
      "dockerfile": "Dockerfile.db",
      "tags": ["docker.io/username/db"]
    },
    "webapp-dev": {
      "context": ".",
      "dockerfile": "Dockerfile.webapp",
      "tags": ["docker.io/username/webapp:latest"],
      "cache-from": ["docker.io/username/webapp:cache"],
      "cache-to": ["docker.io/username/webapp:cache"]
    },
    "webapp-release": {
      "context": ".",
      "dockerfile": "Dockerfile.webapp",
      "tags": ["docker.io/username/webapp:latest"],
      "cache-from": ["docker.io/username/webapp:cache"],
      "cache-to": ["docker.io/username/webapp:cache"],
      "platforms": ["linux/amd64", "linux/arm64"]
    }
  }
}
```
@z

@x
The compose format has some limitations compared to the HCL format:
@y
The compose format has some limitations compared to the HCL format:
@z

@x
- Specifying variables or global scope attributes is not yet supported
- `inherits` service field is not supported, but you can use [YAML anchors](../../compose/compose-file/10-fragments.md)
  to reference other services, as demonstrated in the previous example with `&build-dev`.
@y
- Specifying variables or global scope attributes is not yet supported
- `inherits` service field is not supported, but you can use [YAML anchors](../../compose/compose-file/10-fragments.md)
  to reference other services, as demonstrated in the previous example with `&build-dev`.
@z

@x
## `.env` file
@y
## `.env` file
@z

@x
You can declare default environment variables in an environment file named
`.env`. This file will be loaded from the current working directory,
where the command is executed and applied to compose definitions passed
with `-f`.
@y
You can declare default environment variables in an environment file named
`.env`. This file will be loaded from the current working directory,
where the command is executed and applied to compose definitions passed
with `-f`.
@z

@x
```yaml
# docker-compose.yml
services:
  webapp:
    image: docker.io/username/webapp:${TAG:-v1.0.0}
    build:
      dockerfile: Dockerfile
```
@y
```yaml
# docker-compose.yml
services:
  webapp:
    image: docker.io/username/webapp:${TAG:-v1.0.0}
    build:
      dockerfile: Dockerfile
```
@z

@x
```sh
# .env
TAG=v1.1.0
```
@y
```sh
# .env
TAG=v1.1.0
```
@z

@x
```console
$ docker buildx bake --print
```
@y
```console
$ docker buildx bake --print
```
@z

@x
```json
{
  "group": {
    "default": {
      "targets": ["webapp"]
    }
  },
  "target": {
    "webapp": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "tags": ["docker.io/username/webapp:v1.1.0"]
    }
  }
}
```
@y
```json
{
  "group": {
    "default": {
      "targets": ["webapp"]
    }
  },
  "target": {
    "webapp": {
      "context": ".",
      "dockerfile": "Dockerfile",
      "tags": ["docker.io/username/webapp:v1.1.0"]
    }
  }
}
```
@z

@x
> **Note**
>
> System environment variables take precedence over environment variables
> in `.env` file.
@y
> **Note**
>
> System environment variables take precedence over environment variables
> in `.env` file.
@z

@x
## Extension field with `x-bake`
@y
## Extension field with `x-bake`
@z

@x
Where some fields are not available in the compose specification, you can use
the [special extension](../../compose/compose-file/11-extension.md) field
`x-bake` in your compose file to evaluate extra fields:
@y
Where some fields are not available in the compose specification, you can use
the [special extension](../../compose/compose-file/11-extension.md) field
`x-bake` in your compose file to evaluate extra fields:
@z

@x
```yaml
# docker-compose.yml
services:
  addon:
    image: ct-addon:bar
    build:
      context: .
      dockerfile: ./Dockerfile
      args:
        CT_ECR: foo
        CT_TAG: bar
      x-bake:
        tags:
          - ct-addon:foo
          - ct-addon:alp
        platforms:
          - linux/amd64
          - linux/arm64
        cache-from:
          - user/app:cache
          - type=local,src=path/to/cache
        cache-to:
          - type=local,dest=path/to/cache
        pull: true
@y
```yaml
# docker-compose.yml
services:
  addon:
    image: ct-addon:bar
    build:
      context: .
      dockerfile: ./Dockerfile
      args:
        CT_ECR: foo
        CT_TAG: bar
      x-bake:
        tags:
          - ct-addon:foo
          - ct-addon:alp
        platforms:
          - linux/amd64
          - linux/arm64
        cache-from:
          - user/app:cache
          - type=local,src=path/to/cache
        cache-to:
          - type=local,dest=path/to/cache
        pull: true
@z

@x
  aws:
    image: ct-fake-aws:bar
    build:
      dockerfile: ./aws.Dockerfile
      args:
        CT_ECR: foo
        CT_TAG: bar
      x-bake:
        secret:
          - id=mysecret,src=./secret
          - id=mysecret2,src=./secret2
        platforms: linux/arm64
        output: type=docker
        no-cache: true
```
@y
  aws:
    image: ct-fake-aws:bar
    build:
      dockerfile: ./aws.Dockerfile
      args:
        CT_ECR: foo
        CT_TAG: bar
      x-bake:
        secret:
          - id=mysecret,src=./secret
          - id=mysecret2,src=./secret2
        platforms: linux/arm64
        output: type=docker
        no-cache: true
```
@z

@x
```console
$ docker buildx bake --print
```
@y
```console
$ docker buildx bake --print
```
@z

@x
```json
{
  "group": {
    "default": {
      "targets": ["aws", "addon"]
    }
  },
  "target": {
    "addon": {
      "context": ".",
      "dockerfile": "./Dockerfile",
      "args": {
        "CT_ECR": "foo",
        "CT_TAG": "bar"
      },
      "tags": ["ct-addon:foo", "ct-addon:alp"],
      "cache-from": ["user/app:cache", "type=local,src=path/to/cache"],
      "cache-to": ["type=local,dest=path/to/cache"],
      "platforms": ["linux/amd64", "linux/arm64"],
      "pull": true
    },
    "aws": {
      "context": ".",
      "dockerfile": "./aws.Dockerfile",
      "args": {
        "CT_ECR": "foo",
        "CT_TAG": "bar"
      },
      "tags": ["ct-fake-aws:bar"],
      "secret": ["id=mysecret,src=./secret", "id=mysecret2,src=./secret2"],
      "platforms": ["linux/arm64"],
      "output": ["type=docker"],
      "no-cache": true
    }
  }
}
```
@y
```json
{
  "group": {
    "default": {
      "targets": ["aws", "addon"]
    }
  },
  "target": {
    "addon": {
      "context": ".",
      "dockerfile": "./Dockerfile",
      "args": {
        "CT_ECR": "foo",
        "CT_TAG": "bar"
      },
      "tags": ["ct-addon:foo", "ct-addon:alp"],
      "cache-from": ["user/app:cache", "type=local,src=path/to/cache"],
      "cache-to": ["type=local,dest=path/to/cache"],
      "platforms": ["linux/amd64", "linux/arm64"],
      "pull": true
    },
    "aws": {
      "context": ".",
      "dockerfile": "./aws.Dockerfile",
      "args": {
        "CT_ECR": "foo",
        "CT_TAG": "bar"
      },
      "tags": ["ct-fake-aws:bar"],
      "secret": ["id=mysecret,src=./secret", "id=mysecret2,src=./secret2"],
      "platforms": ["linux/arm64"],
      "output": ["type=docker"],
      "no-cache": true
    }
  }
}
```
@z

@x
Complete list of valid fields for `x-bake`:
@y
Complete list of valid fields for `x-bake`:
@z

@x
- `cache-from`
- `cache-to`
- `contexts`
- `no-cache`
- `no-cache-filter`
- `output`
- `platforms`
- `pull`
- `secret`
- `ssh`
- `tags`
@y
- `cache-from`
- `cache-to`
- `contexts`
- `no-cache`
- `no-cache-filter`
- `output`
- `platforms`
- `pull`
- `secret`
- `ssh`
- `tags`
@z
