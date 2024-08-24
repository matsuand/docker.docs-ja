%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Using secrets with GitHub Actions
description: Example using secret mounts with GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx, secret
tags: [Secrets]
---
@y
---
title: Using secrets with GitHub Actions
description: Example using secret mounts with GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx, secret
tags: [Secrets]
---
@z

@x
A build secret is sensitive information, such as a password or API token, consumed as part of the build process.
Docker Build supports two forms of secrets:
@y
A build secret is sensitive information, such as a password or API token, consumed as part of the build process.
Docker Build supports two forms of secrets:
@z

@x
- [Secret mounts](#secret-mounts) add secrets as files in the build container
  (under `/run/secrets` by default).
- [SSH mounts](#ssh-mounts) add SSH agent sockets or keys into the build container.
@y
- [Secret mounts](#secret-mounts) add secrets as files in the build container
  (under `/run/secrets` by default).
- [SSH mounts](#ssh-mounts) add SSH agent sockets or keys into the build container.
@z

@x
This page shows how to use secrets with GitHub Actions.
For an introduction to secrets in general, see [Build secrets](../../building/secrets.md).
@y
This page shows how to use secrets with GitHub Actions.
For an introduction to secrets in general, see [Build secrets](../../building/secrets.md).
@z

@x
## Secret mounts
@y
## Secret mounts
@z

@x
In the following example uses and exposes the [`GITHUB_TOKEN` secret](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#about-the-github_token-secret)
as provided by GitHub in your workflow.
@y
In the following example uses and exposes the [`GITHUB_TOKEN` secret](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#about-the-github_token-secret)
as provided by GitHub in your workflow.
@z

@x
First, create a `Dockerfile` that uses the secret:
@y
First, create a `Dockerfile` that uses the secret:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
RUN --mount=type=secret,id=github_token \
  cat /run/secrets/github_token
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
RUN --mount=type=secret,id=github_token \
  cat /run/secrets/github_token
```
@z

@x
In this example, the secret name is `github_token`. The following workflow
exposes this secret using the `secrets` input:
@y
In this example, the secret name is `github_token`. The following workflow
exposes this secret using the `secrets` input:
@z

@x
```yaml
name: ci
@y
```yaml
name: ci
@z

@x
on:
  push:
@y
on:
  push:
@z

@x
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Set up QEMU
        uses: docker/setup-qemu-action@v3
@y
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Set up QEMU
        uses: docker/setup-qemu-action@v3
@z

@x
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@y
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@z

@x
      - name: Build
        uses: docker/build-push-action@v6
        with:
          platforms: linux/amd64,linux/arm64
          tags: user/app:latest
          secrets: |
            "github_token=${{ secrets.GITHUB_TOKEN }}"
```
@y
      - name: Build
        uses: docker/build-push-action@v6
        with:
          platforms: linux/amd64,linux/arm64
          tags: user/app:latest
          secrets: |
            "github_token=${{ secrets.GITHUB_TOKEN }}"
```
@z

@x
> [!NOTE]
>
> You can also expose a secret file to the build with the `secret-files` input:
>
> ```yaml
> secret-files: |
>   "MY_SECRET=./secret.txt"
> ```
@y
> [!NOTE]
>
> You can also expose a secret file to the build with the `secret-files` input:
>
> ```yaml
> secret-files: |
>   "MY_SECRET=./secret.txt"
> ```
@z

@x
If you're using [GitHub secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets)
and need to handle multi-line value, you will need to place the key-value pair
between quotes:
@y
If you're using [GitHub secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets)
and need to handle multi-line value, you will need to place the key-value pair
between quotes:
@z

@x
```yaml
secrets: |
  "MYSECRET=${{ secrets.GPG_KEY }}"
  GIT_AUTH_TOKEN=abcdefghi,jklmno=0123456789
  "MYSECRET=aaaaaaaa
  bbbbbbb
  ccccccccc"
  FOO=bar
  "EMPTYLINE=aaaa
@y
```yaml
secrets: |
  "MYSECRET=${{ secrets.GPG_KEY }}"
  GIT_AUTH_TOKEN=abcdefghi,jklmno=0123456789
  "MYSECRET=aaaaaaaa
  bbbbbbb
  ccccccccc"
  FOO=bar
  "EMPTYLINE=aaaa
@z

@x
  bbbb
  ccc"
  "JSON_SECRET={""key1"":""value1"",""key2"":""value2""}"
```
@y
  bbbb
  ccc"
  "JSON_SECRET={""key1"":""value1"",""key2"":""value2""}"
```
@z

@x
| Key              | Value                               |
| ---------------- | ----------------------------------- |
| `MYSECRET`       | `***********************`           |
| `GIT_AUTH_TOKEN` | `abcdefghi,jklmno=0123456789`       |
| `MYSECRET`       | `aaaaaaaa\nbbbbbbb\nccccccccc`      |
| `FOO`            | `bar`                               |
| `EMPTYLINE`      | `aaaa\n\nbbbb\nccc`                 |
| `JSON_SECRET`    | `{"key1":"value1","key2":"value2"}` |
@y
| Key              | Value                               |
| ---------------- | ----------------------------------- |
| `MYSECRET`       | `***********************`           |
| `GIT_AUTH_TOKEN` | `abcdefghi,jklmno=0123456789`       |
| `MYSECRET`       | `aaaaaaaa\nbbbbbbb\nccccccccc`      |
| `FOO`            | `bar`                               |
| `EMPTYLINE`      | `aaaa\n\nbbbb\nccc`                 |
| `JSON_SECRET`    | `{"key1":"value1","key2":"value2"}` |
@z

@x
> [!NOTE]
>
> Double escapes are needed for quote signs.
@y
> [!NOTE]
>
> Double escapes are needed for quote signs.
@z

@x
## SSH mounts
@y
## SSH mounts
@z

@x
SSH mounts let you authenticate with SSH servers.
For example to perform a `git clone`,
or to fetch application packages from a private repository.
@y
SSH mounts let you authenticate with SSH servers.
For example to perform a `git clone`,
or to fetch application packages from a private repository.
@z

@x
The following Dockerfile example uses an SSH mount
to fetch Go modules from a private GitHub repository.
@y
The following Dockerfile example uses an SSH mount
to fetch Go modules from a private GitHub repository.
@z

@x
```dockerfile {collapse=1}
# syntax=docker/dockerfile:1
@y
```dockerfile {collapse=1}
# syntax=docker/dockerfile:1
@z

@x
ARG GO_VERSION="{{% param example_go_version %}}"
@y
ARG GO_VERSION="{{% param example_go_version %}}"
@z

@x
FROM golang:${GO_VERSION}-alpine AS base
ENV CGO_ENABLED=0
ENV GOPRIVATE="github.com/foo/*"
RUN apk add --no-cache file git rsync openssh-client
RUN mkdir -p -m 0700 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
WORKDIR /src
@y
FROM golang:${GO_VERSION}-alpine AS base
ENV CGO_ENABLED=0
ENV GOPRIVATE="github.com/foo/*"
RUN apk add --no-cache file git rsync openssh-client
RUN mkdir -p -m 0700 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
WORKDIR /src
@z

@x
FROM base AS vendor
# this step configure git and checks the ssh key is loaded
RUN --mount=type=ssh <<EOT
  set -e
  echo "Setting Git SSH protocol"
  git config --global url."git@github.com:".insteadOf "https://github.com/"
  (
    set +e
    ssh -T git@github.com
    if [ ! "$?" = "1" ]; then
      echo "No GitHub SSH key loaded exiting..."
      exit 1
    fi
  )
EOT
# this one download go modules
RUN --mount=type=bind,target=. \
    --mount=type=cache,target=/go/pkg/mod \
    --mount=type=ssh \
    go mod download -x
@y
FROM base AS vendor
# this step configure git and checks the ssh key is loaded
RUN --mount=type=ssh <<EOT
  set -e
  echo "Setting Git SSH protocol"
  git config --global url."git@github.com:".insteadOf "https://github.com/"
  (
    set +e
    ssh -T git@github.com
    if [ ! "$?" = "1" ]; then
      echo "No GitHub SSH key loaded exiting..."
      exit 1
    fi
  )
EOT
# this one download go modules
RUN --mount=type=bind,target=. \
    --mount=type=cache,target=/go/pkg/mod \
    --mount=type=ssh \
    go mod download -x
@z

@x
FROM vendor AS build
RUN --mount=type=bind,target=. \
    --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache \
    go build ...
```
@y
FROM vendor AS build
RUN --mount=type=bind,target=. \
    --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache \
    go build ...
```
@z

@x
To build this Dockerfile, you must specify an SSH mount that the builder can
use in the steps with `--mount=type=ssh`.
@y
To build this Dockerfile, you must specify an SSH mount that the builder can
use in the steps with `--mount=type=ssh`.
@z

@x
The following GitHub Action workflow uses the `MrSquaare/ssh-setup-action`
third-party action to bootstrap SSH setup on the GitHub runner. The action
creates a private key defined by the GitHub Action secret `SSH_GITHUB_PPK` and
adds it to the SSH agent socket file at `SSH_AUTH_SOCK`. The SSH mount in the
build step assume `SSH_AUTH_SOCK` by default, so there's no need to specify the
ID or path for the SSH agent socket explicitly.
@y
The following GitHub Action workflow uses the `MrSquaare/ssh-setup-action`
third-party action to bootstrap SSH setup on the GitHub runner. The action
creates a private key defined by the GitHub Action secret `SSH_GITHUB_PPK` and
adds it to the SSH agent socket file at `SSH_AUTH_SOCK`. The SSH mount in the
build step assume `SSH_AUTH_SOCK` by default, so there's no need to specify the
ID or path for the SSH agent socket explicitly.
@z

@x
{{< tabs >}}
{{< tab name="`docker/build-push-action`" >}}
@y
{{< tabs >}}
{{< tab name="`docker/build-push-action`" >}}
@z

@x
```yaml
name: ci
@y
```yaml
name: ci
@z

@x
on:
  push:
@y
on:
  push:
@z

@x
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Set up SSH
        uses: MrSquaare/ssh-setup-action@2d028b70b5e397cf8314c6eaea229a6c3e34977a # v3.1.0
        with:
          host: github.com
          private-key: ${{ secrets.SSH_GITHUB_PPK }}
          private-key-name: github-ppk
@y
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Set up SSH
        uses: MrSquaare/ssh-setup-action@2d028b70b5e397cf8314c6eaea229a6c3e34977a # v3.1.0
        with:
          host: github.com
          private-key: ${{ secrets.SSH_GITHUB_PPK }}
          private-key-name: github-ppk
@z

@x
      - name: Build and push
        uses: docker/build-push-action@v6
        with:
          ssh: default
          push: true
          tags: user/app:latest
```
@y
      - name: Build and push
        uses: docker/build-push-action@v6
        with:
          ssh: default
          push: true
          tags: user/app:latest
```
@z

@x
{{< /tab >}}
{{< tab name="`docker/bake-action`" >}}
@y
{{< /tab >}}
{{< tab name="`docker/bake-action`" >}}
@z

@x
```yaml
name: ci
@y
```yaml
name: ci
@z

@x
on:
  push:
@y
on:
  push:
@z

@x
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
@y
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
@z

@x
      - name: Set up SSH
        uses: MrSquaare/ssh-setup-action@2d028b70b5e397cf8314c6eaea229a6c3e34977a # v3.1.0
        with:
          host: github.com
          private-key: ${{ secrets.SSH_GITHUB_PPK }}
          private-key-name: github-ppk
@y
      - name: Set up SSH
        uses: MrSquaare/ssh-setup-action@2d028b70b5e397cf8314c6eaea229a6c3e34977a # v3.1.0
        with:
          host: github.com
          private-key: ${{ secrets.SSH_GITHUB_PPK }}
          private-key-name: github-ppk
@z

@x
      - name: Build
        uses: docker/bake-action@v5
        with:
          set: |
            *.ssh=default
```
@y
      - name: Build
        uses: docker/bake-action@v5
        with:
          set: |
            *.ssh=default
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
