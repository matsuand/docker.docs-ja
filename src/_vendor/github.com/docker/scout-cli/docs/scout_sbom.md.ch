%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker scout sbom
@y
# docker scout sbom
@z

@x
<!---MARKER_GEN_START-->
Generate or display SBOM of an image
@y
<!---MARKER_GEN_START-->
Generate or display SBOM of an image
@z

@x
### Options
@y
### Options
@z

@x
| Name                  | Type          | Default | Description                                                                                                                                   |
|:----------------------|:--------------|:--------|:----------------------------------------------------------------------------------------------------------------------------------------------|
| `--format`            | `string`      | `json`  | Output format:<br>- list: list of packages of the image<br>- json: json representation of the SBOM<br>- spdx: spdx representation of the SBOM |
| `--only-package-type` | `stringSlice` |         | Comma separated list of package types (like apk, deb, rpm, npm, pypi, golang, etc)<br>Can only be used with --format list                     |
| `-o`, `--output`      | `string`      |         | Write the report to a file.                                                                                                                   |
| `--platform`          | `string`      |         | Platform of image to analyze                                                                                                                  |
| `--ref`               | `string`      |         | Reference to use if the provided tarball contains multiple references.<br>Can only be used with archive.                                      |
@y
| Name                  | Type          | Default | Description                                                                                                                                   |
|:----------------------|:--------------|:--------|:----------------------------------------------------------------------------------------------------------------------------------------------|
| `--format`            | `string`      | `json`  | Output format:<br>- list: list of packages of the image<br>- json: json representation of the SBOM<br>- spdx: spdx representation of the SBOM |
| `--only-package-type` | `stringSlice` |         | Comma separated list of package types (like apk, deb, rpm, npm, pypi, golang, etc)<br>Can only be used with --format list                     |
| `-o`, `--output`      | `string`      |         | Write the report to a file.                                                                                                                   |
| `--platform`          | `string`      |         | Platform of image to analyze                                                                                                                  |
| `--ref`               | `string`      |         | Reference to use if the provided tarball contains multiple references.<br>Can only be used with archive.                                      |
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
The `docker scout sbom` command analyzes a software artifact to generate a
Software Bill Of Materials (SBOM).
@y
The `docker scout sbom` command analyzes a software artifact to generate a
Software Bill Of Materials (SBOM).
@z

@x
The SBOM contains a list of all packages in the image.
You can use the `--format` flag to filter the output of the command
to display only packages of a specific type.
@y
The SBOM contains a list of all packages in the image.
You can use the `--format` flag to filter the output of the command
to display only packages of a specific type.
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
### Display the list of packages
@y
### Display the list of packages
@z

@x
```console
$ docker scout sbom --format list alpine
```
@y
```console
$ docker scout sbom --format list alpine
```
@z

@x
### Only display packages of a specific type
@y
### Only display packages of a specific type
@z

@x
```console
 $ docker scout sbom --format list --only-package-type apk alpine
```
@y
```console
 $ docker scout sbom --format list --only-package-type apk alpine
```
@z

@x
### Display the full SBOM in JSON format
@y
### Display the full SBOM in JSON format
@z

@x
```console
$ docker scout sbom alpine
```
@y
```console
$ docker scout sbom alpine
```
@z

@x
### Display the full SBOM of the most recently built image
@y
### Display the full SBOM of the most recently built image
@z

@x
```console
$ docker scout sbom
```
@y
```console
$ docker scout sbom
```
@z

@x
### Write SBOM to a file
@y
### Write SBOM to a file
@z

@x
```console
$ docker scout sbom --output alpine.sbom alpine
```
@y
```console
$ docker scout sbom --output alpine.sbom alpine
```
@z
