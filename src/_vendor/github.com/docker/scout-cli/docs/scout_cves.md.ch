%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker scout cves
@y
# docker scout cves
@z

@x
```
docker scout cves [OPTIONS] [IMAGE|DIRECTORY|ARCHIVE]
```
@y
```
docker scout cves [OPTIONS] [IMAGE|DIRECTORY|ARCHIVE]
```
@z

@x
<!---MARKER_GEN_START-->
Display CVEs identified in a software artifact
@y
<!---MARKER_GEN_START-->
Display CVEs identified in a software artifact
@z

@x
### Options
@y
### Options
@z

@x
| Name                   | Type          | Default    | Description                                                                                                                                                                                                                                                                                                            |
|:-----------------------|:--------------|:-----------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `--details`            |               |            | Print details on default text output                                                                                                                                                                                                                                                                                   |
| `--env`                | `string`      |            | Name of environment                                                                                                                                                                                                                                                                                                    |
| `-e`, `--exit-code`    |               |            | Return exit code '2' if vulnerabilities are detected                                                                                                                                                                                                                                                                   |
| `--format`             | `string`      | `packages` | Output format of the generated vulnerability report:<br>- packages: default output, plain text with vulnerabilities grouped by packages<br>- sarif: json Sarif output<br>- spdx: json SPDX output <br>- markdown: markdown output (including some html tags like collapsible sections)<br>- sbom: json SBOM output<br> |
| `--ignore-base`        |               |            | Filter out CVEs introduced from base image                                                                                                                                                                                                                                                                             |
| `--locations`          |               |            | Print package locations including file paths and layer diff_id                                                                                                                                                                                                                                                         |
| `--multi-stage`        |               |            | Show packages from multi-stage Docker builds                                                                                                                                                                                                                                                                           |
| `--only-cve-id`        | `stringSlice` |            | Comma separated list of CVE ids (like CVE-2021-45105) to search for                                                                                                                                                                                                                                                    |
| `--only-fixed`         |               |            | Filter to fixable CVEs                                                                                                                                                                                                                                                                                                 |
| `--only-metric`        | `stringSlice` |            | Comma separated list of CVSS metrics (like AV:N or PR:L) to filter CVEs by                                                                                                                                                                                                                                             |
| `--only-package`       | `stringSlice` |            | Comma separated regular expressions to filter packages by                                                                                                                                                                                                                                                              |
| `--only-package-type`  | `stringSlice` |            | Comma separated list of package types (like apk, deb, rpm, npm, pypi, golang, etc)                                                                                                                                                                                                                                     |
| `--only-severity`      | `stringSlice` |            | Comma separated list of severities (critical, high, medium, low, unspecified) to filter CVEs by                                                                                                                                                                                                                        |
| `--only-stage`         | `stringSlice` |            | Comma separated list of multi-stage Docker build stage names                                                                                                                                                                                                                                                           |
| `--only-unfixed`       |               |            | Filter to unfixed CVEs                                                                                                                                                                                                                                                                                                 |
| `--only-vex-affected`  |               |            | Filter CVEs by VEX statements with status not affected                                                                                                                                                                                                                                                                 |
| `--only-vuln-packages` |               |            | When used with --format=only-packages ignore packages with no vulnerabilities                                                                                                                                                                                                                                          |
| `--org`                | `string`      |            | Namespace of the Docker organization                                                                                                                                                                                                                                                                                   |
| `-o`, `--output`       | `string`      |            | Write the report to a file.                                                                                                                                                                                                                                                                                            |
| `--platform`           | `string`      |            | Platform of image to analyze                                                                                                                                                                                                                                                                                           |
| `--ref`                | `string`      |            | Reference to use if the provided tarball contains multiple references.<br>Can only be used with archive.                                                                                                                                                                                                               |
| `--vex-author`         | `stringSlice` |            | List of VEX statement authors to accept                                                                                                                                                                                                                                                                                |
| `--vex-location`       | `stringSlice` |            | File location of directory or file containing VEX statements                                                                                                                                                                                                                                                           |
@y
| Name                   | Type          | Default    | Description                                                                                                                                                                                                                                                                                                            |
|:-----------------------|:--------------|:-----------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `--details`            |               |            | Print details on default text output                                                                                                                                                                                                                                                                                   |
| `--env`                | `string`      |            | Name of environment                                                                                                                                                                                                                                                                                                    |
| `-e`, `--exit-code`    |               |            | Return exit code '2' if vulnerabilities are detected                                                                                                                                                                                                                                                                   |
| `--format`             | `string`      | `packages` | Output format of the generated vulnerability report:<br>- packages: default output, plain text with vulnerabilities grouped by packages<br>- sarif: json Sarif output<br>- spdx: json SPDX output <br>- markdown: markdown output (including some html tags like collapsible sections)<br>- sbom: json SBOM output<br> |
| `--ignore-base`        |               |            | Filter out CVEs introduced from base image                                                                                                                                                                                                                                                                             |
| `--locations`          |               |            | Print package locations including file paths and layer diff_id                                                                                                                                                                                                                                                         |
| `--multi-stage`        |               |            | Show packages from multi-stage Docker builds                                                                                                                                                                                                                                                                           |
| `--only-cve-id`        | `stringSlice` |            | Comma separated list of CVE ids (like CVE-2021-45105) to search for                                                                                                                                                                                                                                                    |
| `--only-fixed`         |               |            | Filter to fixable CVEs                                                                                                                                                                                                                                                                                                 |
| `--only-metric`        | `stringSlice` |            | Comma separated list of CVSS metrics (like AV:N or PR:L) to filter CVEs by                                                                                                                                                                                                                                             |
| `--only-package`       | `stringSlice` |            | Comma separated regular expressions to filter packages by                                                                                                                                                                                                                                                              |
| `--only-package-type`  | `stringSlice` |            | Comma separated list of package types (like apk, deb, rpm, npm, pypi, golang, etc)                                                                                                                                                                                                                                     |
| `--only-severity`      | `stringSlice` |            | Comma separated list of severities (critical, high, medium, low, unspecified) to filter CVEs by                                                                                                                                                                                                                        |
| `--only-stage`         | `stringSlice` |            | Comma separated list of multi-stage Docker build stage names                                                                                                                                                                                                                                                           |
| `--only-unfixed`       |               |            | Filter to unfixed CVEs                                                                                                                                                                                                                                                                                                 |
| `--only-vex-affected`  |               |            | Filter CVEs by VEX statements with status not affected                                                                                                                                                                                                                                                                 |
| `--only-vuln-packages` |               |            | When used with --format=only-packages ignore packages with no vulnerabilities                                                                                                                                                                                                                                          |
| `--org`                | `string`      |            | Namespace of the Docker organization                                                                                                                                                                                                                                                                                   |
| `-o`, `--output`       | `string`      |            | Write the report to a file.                                                                                                                                                                                                                                                                                            |
| `--platform`           | `string`      |            | Platform of image to analyze                                                                                                                                                                                                                                                                                           |
| `--ref`                | `string`      |            | Reference to use if the provided tarball contains multiple references.<br>Can only be used with archive.                                                                                                                                                                                                               |
| `--vex-author`         | `stringSlice` |            | List of VEX statement authors to accept                                                                                                                                                                                                                                                                                |
| `--vex-location`       | `stringSlice` |            | File location of directory or file containing VEX statements                                                                                                                                                                                                                                                           |
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
The `docker scout cves` command analyzes a software artifact for vulnerabilities.
@y
The `docker scout cves` command analyzes a software artifact for vulnerabilities.
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
### Display vulnerabilities grouped by package
@y
### Display vulnerabilities grouped by package
@z

@x
```console
$ docker scout cves alpine
Analyzing image alpine
    ✓ Image stored for indexing
    ✓ Indexed 18 packages
    ✓ No vulnerable package detected
```
@y
```console
$ docker scout cves alpine
Analyzing image alpine
    ✓ Image stored for indexing
    ✓ Indexed 18 packages
    ✓ No vulnerable package detected
```
@z

@x
### Display vulnerabilities from a `docker save` tarball
@y
### Display vulnerabilities from a `docker save` tarball
@z

@x
```console
$ docker save alpine > alpine.tar
@y
```console
$ docker save alpine > alpine.tar
@z

@x
$ docker scout cves archive://alpine.tar
Analyzing archive alpine.tar
    ✓ Archive read
    ✓ SBOM of image already cached, 18 packages indexed
    ✓ No vulnerable package detected
```
@y
$ docker scout cves archive://alpine.tar
Analyzing archive alpine.tar
    ✓ Archive read
    ✓ SBOM of image already cached, 18 packages indexed
    ✓ No vulnerable package detected
```
@z

@x
### Display vulnerabilities from an OCI directory
@y
### Display vulnerabilities from an OCI directory
@z

@x
```console
$ skopeo copy --override-os linux docker://alpine oci:alpine
@y
```console
$ skopeo copy --override-os linux docker://alpine oci:alpine
@z

@x
$ docker scout cves oci-dir://alpine
Analyzing OCI directory alpine
    ✓ OCI directory read
    ✓ Image stored for indexing
    ✓ Indexed 19 packages
    ✓ No vulnerable package detected
```
@y
$ docker scout cves oci-dir://alpine
Analyzing OCI directory alpine
    ✓ OCI directory read
    ✓ Image stored for indexing
    ✓ Indexed 19 packages
    ✓ No vulnerable package detected
```
@z

@x
### Display vulnerabilities from the current directory
@y
### Display vulnerabilities from the current directory
@z

@x
```console
$ docker scout cves fs://.
```
@y
```console
$ docker scout cves fs://.
```
@z

@x
### Export vulnerabilities to a SARIF JSON file
@y
### Export vulnerabilities to a SARIF JSON file
@z

@x
```console
$ docker scout cves --format sarif --output alpine.sarif.json alpine
Analyzing image alpine
    ✓ SBOM of image already cached, 18 packages indexed
    ✓ No vulnerable package detected
    ✓ Report written to alpine.sarif.json
```
@y
```console
$ docker scout cves --format sarif --output alpine.sarif.json alpine
Analyzing image alpine
    ✓ SBOM of image already cached, 18 packages indexed
    ✓ No vulnerable package detected
    ✓ Report written to alpine.sarif.json
```
@z

@x
### Display markdown output
@y
### Display markdown output
@z

@x
The following example shows how to generate the vulnerability report as markdown.
@y
The following example shows how to generate the vulnerability report as markdown.
@z

@x
```console
$ docker scout cves --format markdown alpine
    ✓ Pulled
    ✓ SBOM of image already cached, 19 packages indexed
    ✗ Detected 1 vulnerable package with 3 vulnerabilities
<h2>:mag: Vulnerabilities of <code>alpine</code></h2>
@y
```console
$ docker scout cves --format markdown alpine
    ✓ Pulled
    ✓ SBOM of image already cached, 19 packages indexed
    ✗ Detected 1 vulnerable package with 3 vulnerabilities
<h2>:mag: Vulnerabilities of <code>alpine</code></h2>
@z

@x
<details open="true"><summary>:package: Image Reference</strong> <code>alpine</code></summary>
<table>
<tr><td>digest</td><td><code>sha256:e3bd82196e98898cae9fe7fbfd6e2436530485974dc4fb3b7ddb69134eda2407</code></td><tr><tr><td>vulnerabilities</td><td><img alt="critical: 0" src="https://img.shields.io/badge/critical-0-lightgrey"/> <img alt="high: 0" src="https://img.shields.io/badge/high-0-lightgrey"/> <img alt="medium: 2" src="https://img.shields.io/badge/medium-2-fbb552"/> <img alt="low: 0" src="https://img.shields.io/badge/low-0-lightgrey"/> <img alt="unspecified: 1" src="https://img.shields.io/badge/unspecified-1-lightgrey"/></td></tr>
<tr><td>platform</td><td>linux/arm64</td></tr>
<tr><td>size</td><td>3.3 MB</td></tr>
<tr><td>packages</td><td>19</td></tr>
</table>
</details></table>
</details>
...
```
@y
<details open="true"><summary>:package: Image Reference</strong> <code>alpine</code></summary>
<table>
<tr><td>digest</td><td><code>sha256:e3bd82196e98898cae9fe7fbfd6e2436530485974dc4fb3b7ddb69134eda2407</code></td><tr><tr><td>vulnerabilities</td><td><img alt="critical: 0" src="https://img.shields.io/badge/critical-0-lightgrey"/> <img alt="high: 0" src="https://img.shields.io/badge/high-0-lightgrey"/> <img alt="medium: 2" src="https://img.shields.io/badge/medium-2-fbb552"/> <img alt="low: 0" src="https://img.shields.io/badge/low-0-lightgrey"/> <img alt="unspecified: 1" src="https://img.shields.io/badge/unspecified-1-lightgrey"/></td></tr>
<tr><td>platform</td><td>linux/arm64</td></tr>
<tr><td>size</td><td>3.3 MB</td></tr>
<tr><td>packages</td><td>19</td></tr>
</table>
</details></table>
</details>
...
```
@z

@x
### List all vulnerable packages of a certain type
@y
### List all vulnerable packages of a certain type
@z

@x
The following example shows how to generate a list of packages, only including
packages of the specified type, and only showing packages that are vulnerable.
@y
The following example shows how to generate a list of packages, only including
packages of the specified type, and only showing packages that are vulnerable.
@z

@x
```console
$ docker scout cves --format only-packages --only-package-type golang --only-vuln-packages golang:1.18.0
    ✓ Pulled
    ✓ SBOM of image already cached, 296 packages indexed
    ✗ Detected 1 vulnerable package with 40 vulnerabilities
@y
```console
$ docker scout cves --format only-packages --only-package-type golang --only-vuln-packages golang:1.18.0
    ✓ Pulled
    ✓ SBOM of image already cached, 296 packages indexed
    ✗ Detected 1 vulnerable package with 40 vulnerabilities
@z

@x
   Name   Version   Type         Vulnerabilities
───────────────────────────────────────────────────────────
  stdlib  1.18     golang     2C    29H     8M     1L
```
@y
   Name   Version   Type         Vulnerabilities
───────────────────────────────────────────────────────────
  stdlib  1.18     golang     2C    29H     8M     1L
```
@z
