%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Build the extensions for multiple architectures
description: Step three in creating an extension.
keywords: Docker, Extensions, sdk, build, multi-arch
---
@y
---
title: Build the extensions for multiple architectures
description: Step three in creating an extension.
keywords: Docker, Extensions, sdk, build, multi-arch
---
@z

@x
It is highly recommended that, at a minimum, your extension is supported for the following architectures:
@y
It is highly recommended that, at a minimum, your extension is supported for the following architectures:
@z

@x
- `linux/amd64`
- `linux/arm64`
@y
- `linux/amd64`
- `linux/arm64`
@z

@x
Docker Desktop retrieves the extension image according to the user’s system architecture. If the extension does not provide an image that matches the user’s system architecture, Docker Desktop is not able to install the extension. As a result, users can’t run the extension in Docker Desktop.
@y
Docker Desktop retrieves the extension image according to the user’s system architecture. If the extension does not provide an image that matches the user’s system architecture, Docker Desktop is not able to install the extension. As a result, users can’t run the extension in Docker Desktop.
@z

@x
### Build and push for multiple architectures
@y
### Build and push for multiple architectures
@z

@x
If you created an extension from the `docker extension init` command, the
`Makefile` at the root of the directory includes a target with name
`push-extension`.
@y
If you created an extension from the `docker extension init` command, the
`Makefile` at the root of the directory includes a target with name
`push-extension`.
@z

@x
You can do `make push-extension` to build your extension against both
`linux/amd64` and `linux/arm64` platforms, and push them to DockerHub.
@y
You can do `make push-extension` to build your extension against both
`linux/amd64` and `linux/arm64` platforms, and push them to DockerHub.
@z

@x
For example:
@y
For example:
@z

@x
```console
$ make push-extension
```
@y
```console
$ make push-extension
```
@z

@x
Alternatively, if you started from an empty directory, use the command below
to build your extension for multiple architectures:
@y
Alternatively, if you started from an empty directory, use the command below
to build your extension for multiple architectures:
@z

@x
```console
$ docker buildx build --push --platform=linux/amd64,linux/arm64 --tag=username/my-extension:0.0.1 .
```
@y
```console
$ docker buildx build --push --platform=linux/amd64,linux/arm64 --tag=username/my-extension:0.0.1 .
```
@z

@x
You can then check the image manifest to see if the image is available for both
architectures using the [`docker buildx imagetools` command](../../../reference/cli/docker/buildx/imagetools/_index.md):
@y
You can then check the image manifest to see if the image is available for both
architectures using the [`docker buildx imagetools` command](../../../reference/cli/docker/buildx/imagetools/_index.md):
@z

@x
```console
$ docker buildx imagetools inspect username/my-extension:0.0.1
Name:      docker.io/username/my-extension:0.0.1
MediaType: application/vnd.docker.distribution.manifest.list.v2+json
Digest:    sha256:f3b552e65508d9203b46db507bb121f1b644e53a22f851185d8e53d873417c48
@y
```console
$ docker buildx imagetools inspect username/my-extension:0.0.1
Name:      docker.io/username/my-extension:0.0.1
MediaType: application/vnd.docker.distribution.manifest.list.v2+json
Digest:    sha256:f3b552e65508d9203b46db507bb121f1b644e53a22f851185d8e53d873417c48
@z

@x
Manifests:
  Name:      docker.io/username/my-extension:0.0.1@sha256:71d7ecf3cd12d9a99e73ef448bf63ae12751fe3a436a007cb0969f0dc4184c8c
  MediaType: application/vnd.docker.distribution.manifest.v2+json
  Platform:  linux/amd64
@y
Manifests:
  Name:      docker.io/username/my-extension:0.0.1@sha256:71d7ecf3cd12d9a99e73ef448bf63ae12751fe3a436a007cb0969f0dc4184c8c
  MediaType: application/vnd.docker.distribution.manifest.v2+json
  Platform:  linux/amd64
@z

@x
  Name:      docker.io/username/my-extension:0.0.1@sha256:5ba4ceea65579fdd1181dfa103cc437d8e19d87239683cf5040e633211387ccf
  MediaType: application/vnd.docker.distribution.manifest.v2+json
  Platform:  linux/arm64
```
@y
  Name:      docker.io/username/my-extension:0.0.1@sha256:5ba4ceea65579fdd1181dfa103cc437d8e19d87239683cf5040e633211387ccf
  MediaType: application/vnd.docker.distribution.manifest.v2+json
  Platform:  linux/arm64
```
@z

@x
> Having trouble pushing the image?
>
> Ensure you are logged into DockerHub. Otherwise, run `docker login` to authenticate.
{ .tip }
@y
> Having trouble pushing the image?
>
> Ensure you are logged into DockerHub. Otherwise, run `docker login` to authenticate.
{ .tip }
@z

@x
For more information, see [Multi-platform images](../../../build/building/multi-platform.md) page.
@y
For more information, see [Multi-platform images](../../../build/building/multi-platform.md) page.
@z

@x
### Adding multi-arch binaries
@y
### Adding multi-arch binaries
@z

@x
If your extension includes some binaries that deploy to the host, it’s important that they also have the right architecture when building the extension against multiple architectures.
@y
If your extension includes some binaries that deploy to the host, it’s important that they also have the right architecture when building the extension against multiple architectures.
@z

@x
Currently, Docker does not provide a way to explicitly specify multiple binaries for every architecture in the `metadata.json` file. However, you can add architecture-specific binaries depending on the `TARGETARCH` in the extension’s `Dockerfile`.
@y
Currently, Docker does not provide a way to explicitly specify multiple binaries for every architecture in the `metadata.json` file. However, you can add architecture-specific binaries depending on the `TARGETARCH` in the extension’s `Dockerfile`.
@z

@x
The example below shows an extension that uses a binary as part of its operations. The extension needs to run both in Docker Desktop for Mac and Windows.
@y
The example below shows an extension that uses a binary as part of its operations. The extension needs to run both in Docker Desktop for Mac and Windows.
@z

@x
In the `Dockerfile`, we download the binary depending on the target architecture:
@y
In the `Dockerfile`, we download the binary depending on the target architecture:
@z

@x
```Dockerfile
#syntax=docker/dockerfile:1.3-labs
@y
```Dockerfile
#syntax=docker/dockerfile:1.3-labs
@z

@x
FROM alpine AS dl
WORKDIR /tmp
RUN apk add --no-cache curl tar
ARG TARGETARCH
RUN <<EOT ash
    mkdir -p /out/darwin
    curl -fSsLo /out/darwin/kubectl "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/darwin/${TARGETARCH}/kubectl"
    chmod a+x /out/darwin/kubectl
EOT
RUN <<EOT ash
    if [ "amd64" = "$TARGETARCH" ]; then
        mkdir -p /out/windows
        curl -fSsLo /out/windows/kubectl.exe "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/windows/amd64/kubectl.exe"
    fi
EOT
@y
FROM alpine AS dl
WORKDIR /tmp
RUN apk add --no-cache curl tar
ARG TARGETARCH
RUN <<EOT ash
    mkdir -p /out/darwin
    curl -fSsLo /out/darwin/kubectl "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/darwin/${TARGETARCH}/kubectl"
    chmod a+x /out/darwin/kubectl
EOT
RUN <<EOT ash
    if [ "amd64" = "$TARGETARCH" ]; then
        mkdir -p /out/windows
        curl -fSsLo /out/windows/kubectl.exe "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/windows/amd64/kubectl.exe"
    fi
EOT
@z

@x
FROM alpine
LABEL org.opencontainers.image.title="example-extension" \
    org.opencontainers.image.description="My Example Extension" \
    org.opencontainers.image.vendor="Docker Inc." \
    com.docker.desktop.extension.api.version=">= 0.3.3"
@y
FROM alpine
LABEL org.opencontainers.image.title="example-extension" \
    org.opencontainers.image.description="My Example Extension" \
    org.opencontainers.image.vendor="Docker Inc." \
    com.docker.desktop.extension.api.version=">= 0.3.3"
@z

@x
COPY --from=dl /out /
```
@y
COPY --from=dl /out /
```
@z

@x
In the `metadata.json` file, we specify the path for every binary on every platform:
@y
In the `metadata.json` file, we specify the path for every binary on every platform:
@z

@x
```json
{
  "icon": "docker.svg",
  "ui": {
    "dashboard-tab": {
      "title": "Example Extension",
      "src": "index.html",
      "root": "ui"
    }
  },
  "host": {
    "binaries": [
      {
        "darwin": [
          {
            "path": "/darwin/kubectl"
          }
        ],
        "windows": [
          {
            "path": "/windows/kubectl.exe"
          }
        ]
      }
    ]
  }
}
```
@y
```json
{
  "icon": "docker.svg",
  "ui": {
    "dashboard-tab": {
      "title": "Example Extension",
      "src": "index.html",
      "root": "ui"
    }
  },
  "host": {
    "binaries": [
      {
        "darwin": [
          {
            "path": "/darwin/kubectl"
          }
        ],
        "windows": [
          {
            "path": "/windows/kubectl.exe"
          }
        ]
      }
    ]
  }
}
```
@z

@x
As a result, when `TARGETARCH` equals:
@y
As a result, when `TARGETARCH` equals:
@z

@x
- `arm64`, the `kubectl` binary fetched corresponds to the `arm64` architecture, and is copied to `/darwin/kubectl` in the final stage.
- `amd64`, two `kubectl` binaries are fetched. One for Darwin and another for Windows. They are copied to `/darwin/kubectl` and `/windows/kubectl.exe` respectively, in the final stage.
@y
- `arm64`, the `kubectl` binary fetched corresponds to the `arm64` architecture, and is copied to `/darwin/kubectl` in the final stage.
- `amd64`, two `kubectl` binaries are fetched. One for Darwin and another for Windows. They are copied to `/darwin/kubectl` and `/windows/kubectl.exe` respectively, in the final stage.
@z

@x
> Note
>
> The binary destination path for darwin is darwin/kubectl in both cases. The only change is the architecture-specific binary that is downloaded.
@y
> Note
>
> The binary destination path for darwin is darwin/kubectl in both cases. The only change is the architecture-specific binary that is downloaded.
@z

@x
When the extension is installed, the extension framework copies the binaries from the extension image at `/darwin/kubectl` for Darwin, or `/windows/kubectl.exe` for Windows, to a specific location in the user’s host filesystem.
@y
When the extension is installed, the extension framework copies the binaries from the extension image at `/darwin/kubectl` for Darwin, or `/windows/kubectl.exe` for Windows, to a specific location in the user’s host filesystem.
@z

@x
## Can I develop extensions that run Windows containers?
@y
## Can I develop extensions that run Windows containers?
@z

@x
Although Docker Extensions is supported on Docker Desktop for Windows, Mac, and Linux, the extension framework only supports Linux containers. Therefore, you must target `linux` as the OS when you build your extension image.
@y
Although Docker Extensions is supported on Docker Desktop for Windows, Mac, and Linux, the extension framework only supports Linux containers. Therefore, you must target `linux` as the OS when you build your extension image.
@z
