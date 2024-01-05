%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker scout quickview
@y
# docker scout quickview
@z

@x
<!---MARKER_GEN_START-->
Quick overview of an image
@y
<!---MARKER_GEN_START-->
Quick overview of an image
@z

@x
### Aliases
@y
### Aliases
@z

@x
`docker scout quickview`, `docker scout qv`
@y
`docker scout quickview`, `docker scout qv`
@z

@x
### Options
@y
### Options
@z

@x
| Name             | Type     | Default | Description                                                                                              |
|:-----------------|:---------|:--------|:---------------------------------------------------------------------------------------------------------|
| `--env`          | `string` |         | Name of the environment                                                                                  |
| `--latest`       |          |         | Latest indexed image                                                                                     |
| `--org`          | `string` |         | Namespace of the Docker organization                                                                     |
| `-o`, `--output` | `string` |         | Write the report to a file.                                                                              |
| `--platform`     | `string` |         | Platform of image to analyze                                                                             |
| `--ref`          | `string` |         | Reference to use if the provided tarball contains multiple references.<br>Can only be used with archive. |
@y
| Name             | Type     | Default | Description                                                                                              |
|:-----------------|:---------|:--------|:---------------------------------------------------------------------------------------------------------|
| `--env`          | `string` |         | Name of the environment                                                                                  |
| `--latest`       |          |         | Latest indexed image                                                                                     |
| `--org`          | `string` |         | Namespace of the Docker organization                                                                     |
| `-o`, `--output` | `string` |         | Write the report to a file.                                                                              |
| `--platform`     | `string` |         | Platform of image to analyze                                                                             |
| `--ref`          | `string` |         | Reference to use if the provided tarball contains multiple references.<br>Can only be used with archive. |
@z

@x
<!---MARKER_GEN_END-->
@y
<!---MARKER_GEN_END-->
@z

@x
## Description
@y
## Description
@z

@x
The `docker scout quickview` command displays a quick overview of an image.
It displays a summary of the vulnerabilities in the specified image
and vulnerabilities from the base image.
If available, it also displays base image refresh and update recommendations.
@y
The `docker scout quickview` command displays a quick overview of an image.
It displays a summary of the vulnerabilities in the specified image
and vulnerabilities from the base image.
If available, it also displays base image refresh and update recommendations.
@z

@x
If no image is specified, the most recently built image is used.
@y
If no image is specified, the most recently built image is used.
@z

@x
The following artifact types are supported:
@y
The following artifact types are supported:
@z

@x
- Images
- OCI layout directories
- Tarball archives, as created by `docker save`
- Local directory or file
@y
- Images
- OCI layout directories
- Tarball archives, as created by `docker save`
- Local directory or file
@z

@x
By default, the tool expects an image reference, such as:
@y
By default, the tool expects an image reference, such as:
@z

@x
- `redis`
- `curlimages/curl:7.87.0`
- `mcr.microsoft.com/dotnet/runtime:7.0`
@y
- `redis`
- `curlimages/curl:7.87.0`
- `mcr.microsoft.com/dotnet/runtime:7.0`
@z

@x
If the artifact you want to analyze is an OCI directory, a tarball archive, a local file or directory,
or if you want to control from where the image will be resolved, you must prefix the reference with one of the following:
@y
If the artifact you want to analyze is an OCI directory, a tarball archive, a local file or directory,
or if you want to control from where the image will be resolved, you must prefix the reference with one of the following:
@z

@x
- `image://` (default) use a local image, or fall back to a registry lookup
- `local://` use an image from the local image store (don't do a registry lookup)
- `registry://` use an image from a registry (don't use a local image)
- `oci-dir://` use an OCI layout directory
- `archive://` use a tarball archive, as created by `docker save`
- `fs://` use a local directory or file
@y
- `image://` (default) use a local image, or fall back to a registry lookup
- `local://` use an image from the local image store (don't do a registry lookup)
- `registry://` use an image from a registry (don't use a local image)
- `oci-dir://` use an OCI layout directory
- `archive://` use a tarball archive, as created by `docker save`
- `fs://` use a local directory or file
@z

@x
## Examples
@y
## Examples
@z

@x
### Quick overview of an image
@y
### Quick overview of an image
@z

@x
```console
$ docker scout quickview golang:1.19.4
    ...Pulling
    ✓ Pulled
    ✓ SBOM of image already cached, 278 packages indexed
@y
```console
$ docker scout quickview golang:1.19.4
    ...Pulling
    ✓ Pulled
    ✓ SBOM of image already cached, 278 packages indexed
@z

@x
  Your image  golang:1.19.4                          │    5C     3H     6M    63L
  Base image  buildpack-deps:bullseye-scm            │    5C     1H     3M    48L     6?
  Refreshed base image  buildpack-deps:bullseye-scm  │    0C     0H     0M    42L
                                                     │    -5     -1     -3     -6     -6
  Updated base image  buildpack-deps:sid-scm         │    0C     0H     1M    29L
                                                     │    -5     -1     -2    -19     -6
```
@y
  Your image  golang:1.19.4                          │    5C     3H     6M    63L
  Base image  buildpack-deps:bullseye-scm            │    5C     1H     3M    48L     6?
  Refreshed base image  buildpack-deps:bullseye-scm  │    0C     0H     0M    42L
                                                     │    -5     -1     -3     -6     -6
  Updated base image  buildpack-deps:sid-scm         │    0C     0H     1M    29L
                                                     │    -5     -1     -2    -19     -6
```
@z

@x
### Quick overview of the most recently built image
@y
### Quick overview of the most recently built image
@z

@x
```console
$ docker scout qv
```
@y
```console
$ docker scout qv
```
@z
