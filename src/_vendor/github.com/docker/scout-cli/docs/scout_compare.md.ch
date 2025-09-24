%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker scout compare
@y
# docker scout compare
@z

@x
<!---MARKER_GEN_START-->
Compare two images and display differences (experimental)
@y
<!---MARKER_GEN_START-->
Compare two images and display differences (experimental)
@z

@x
### Aliases
@y
### Aliases
@z

@x
`docker scout compare`, `docker scout diff`
@y
`docker scout compare`, `docker scout diff`
@z

@x
### Options
@y
### Options
@z

@x
| Name                  | Type          | Default | Description                                                                                                                                                                    |
|:----------------------|:--------------|:--------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `-x`, `--exit-on`     | `stringSlice` |         |  Comma separated list of conditions to fail the action step if worse or changed, options are: vulnerability, policy, package                                                   |
| `--format`            | `string`      | `text`  | Output format of the generated vulnerability report:<br>- text: default output, plain text with or without colors depending on the terminal<br>- markdown: Markdown output<br> |
| `--hide-policies`     |               |         | Hide policy status from the output                                                                                                                                             |
| `--ignore-base`       |               |         | Filter out CVEs introduced from base image                                                                                                                                     |
| `--ignore-unchanged`  |               |         | Filter out unchanged packages                                                                                                                                                  |
| `--multi-stage`       |               |         | Show packages from multi-stage Docker builds                                                                                                                                   |
| `--only-fixed`        |               |         | Filter to fixable CVEs                                                                                                                                                         |
| `--only-package-type` | `stringSlice` |         | Comma separated list of package types (like apk, deb, rpm, npm, pypi, golang, etc)                                                                                             |
| `--only-policy`       | `stringSlice` |         | Comma separated list of policies to evaluate                                                                                                                                   |
| `--only-severity`     | `stringSlice` |         | Comma separated list of severities (critical, high, medium, low, unspecified) to filter CVEs by                                                                                |
| `--only-stage`        | `stringSlice` |         | Comma separated list of multi-stage Docker build stage names                                                                                                                   |
| `--only-unfixed`      |               |         | Filter to unfixed CVEs                                                                                                                                                         |
| `--org`               | `string`      |         | Namespace of the Docker organization                                                                                                                                           |
| `-o`, `--output`      | `string`      |         | Write the report to a file                                                                                                                                                     |
| `--platform`          | `string`      |         | Platform of image to analyze                                                                                                                                                   |
| `--ref`               | `string`      |         | Reference to use if the provided tarball contains multiple references.<br>Can only be used with archive                                                                        |
| `--to`                | `string`      |         | Image, directory, or archive to compare to                                                                                                                                     |
| `--to-env`            | `string`      |         | Name of environment to compare to                                                                                                                                              |
| `--to-latest`         |               |         | Latest image processed to compare to                                                                                                                                           |
| `--to-ref`            | `string`      |         | Reference to use if the provided tarball contains multiple references.<br>Can only be used with archive.                                                                       |
@y
| Name                  | Type          | Default | Description                                                                                                                                                                    |
|:----------------------|:--------------|:--------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `-x`, `--exit-on`     | `stringSlice` |         |  Comma separated list of conditions to fail the action step if worse or changed, options are: vulnerability, policy, package                                                   |
| `--format`            | `string`      | `text`  | Output format of the generated vulnerability report:<br>- text: default output, plain text with or without colors depending on the terminal<br>- markdown: Markdown output<br> |
| `--hide-policies`     |               |         | Hide policy status from the output                                                                                                                                             |
| `--ignore-base`       |               |         | Filter out CVEs introduced from base image                                                                                                                                     |
| `--ignore-unchanged`  |               |         | Filter out unchanged packages                                                                                                                                                  |
| `--multi-stage`       |               |         | Show packages from multi-stage Docker builds                                                                                                                                   |
| `--only-fixed`        |               |         | Filter to fixable CVEs                                                                                                                                                         |
| `--only-package-type` | `stringSlice` |         | Comma separated list of package types (like apk, deb, rpm, npm, pypi, golang, etc)                                                                                             |
| `--only-policy`       | `stringSlice` |         | Comma separated list of policies to evaluate                                                                                                                                   |
| `--only-severity`     | `stringSlice` |         | Comma separated list of severities (critical, high, medium, low, unspecified) to filter CVEs by                                                                                |
| `--only-stage`        | `stringSlice` |         | Comma separated list of multi-stage Docker build stage names                                                                                                                   |
| `--only-unfixed`      |               |         | Filter to unfixed CVEs                                                                                                                                                         |
| `--org`               | `string`      |         | Namespace of the Docker organization                                                                                                                                           |
| `-o`, `--output`      | `string`      |         | Write the report to a file                                                                                                                                                     |
| `--platform`          | `string`      |         | Platform of image to analyze                                                                                                                                                   |
| `--ref`               | `string`      |         | Reference to use if the provided tarball contains multiple references.<br>Can only be used with archive                                                                        |
| `--to`                | `string`      |         | Image, directory, or archive to compare to                                                                                                                                     |
| `--to-env`            | `string`      |         | Name of environment to compare to                                                                                                                                              |
| `--to-latest`         |               |         | Latest image processed to compare to                                                                                                                                           |
| `--to-ref`            | `string`      |         | Reference to use if the provided tarball contains multiple references.<br>Can only be used with archive.                                                                       |
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
The `docker scout compare` command analyzes two images and displays a comparison.
@y
The `docker scout compare` command analyzes two images and displays a comparison.
@z

@x
> This command is **experimental** and its behaviour might change in the future
@y
> This command is **experimental** and its behaviour might change in the future
@z

@x
The intended use of this command is to compare two versions of the same image.
For instance, when a new image is built and compared to the version running in production.
@y
The intended use of this command is to compare two versions of the same image.
For instance, when a new image is built and compared to the version running in production.
@z

@x
If no image is specified, the most recently built image is used
as a comparison target.
@y
If no image is specified, the most recently built image is used
as a comparison target.
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
### Compare the most recently built image to the latest tag
@y
### Compare the most recently built image to the latest tag
@z

@x
```console
$ docker scout compare --to namespace/repo:latest
```
@y
```console
$ docker scout compare --to namespace/repo:latest
```
@z

@x
### Compare local build to the same tag from the registry
@y
### Compare local build to the same tag from the registry
@z

@x
```console
$ docker scout compare local://namespace/repo:latest --to registry://namespace/repo:latest
```
@y
```console
$ docker scout compare local://namespace/repo:latest --to registry://namespace/repo:latest
```
@z

@x
### Ignore base images
@y
### Ignore base images
@z

@x
```console
$ docker scout compare --ignore-base --to namespace/repo:latest namespace/repo:v1.2.3-pre
```
@y
```console
$ docker scout compare --ignore-base --to namespace/repo:latest namespace/repo:v1.2.3-pre
```
@z

@x
### Generate a markdown output
@y
### Generate a markdown output
@z

@x
```console
$ docker scout compare --format markdown --to namespace/repo:latest namespace/repo:v1.2.3-pre
```
@y
```console
$ docker scout compare --format markdown --to namespace/repo:latest namespace/repo:v1.2.3-pre
```
@z

@x
### Only compare maven packages and only display critical vulnerabilities for maven packages
@y
### Only compare maven packages and only display critical vulnerabilities for maven packages
@z

@x
```console
$ docker scout compare --only-package-type maven --only-severity critical --to namespace/repo:latest namespace/repo:v1.2.3-pre
```
@y
```console
$ docker scout compare --only-package-type maven --only-severity critical --to namespace/repo:latest namespace/repo:v1.2.3-pre
```
@z

@x
### Show all policy results for both images
@y
### Show all policy results for both images
@z

@x
```console
docker scout compare --to namespace/repo:latest namespace/repo:v1.2.3-pre
```
@y
```console
docker scout compare --to namespace/repo:latest namespace/repo:v1.2.3-pre
```
@z
