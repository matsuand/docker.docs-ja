%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Use Scout with different artifact types
description: |
  Some of the Docker Scout commands support image references prefixes
  for controlling the location of the images or files that you want to analyze.
keywords: scout, vulnerabilities, analyze, analysis, cli, packages, sbom, cve, security, local, source, code, supply chain
@y
title: Use Scout with different artifact types
description: |
  Some of the Docker Scout commands support image references prefixes
  for controlling the location of the images or files that you want to analyze.
keywords: scout, vulnerabilities, analyze, analysis, cli, packages, sbom, cve, security, local, source, code, supply chain
@z

@x
Some of the Docker Scout CLI commands support prefixes for specifying
the location or type of artifact that you would like to analyze.
@y
Some of the Docker Scout CLI commands support prefixes for specifying
the location or type of artifact that you would like to analyze.
@z

@x
By default, image analysis with the `docker scout cves` command
targets images in the local image store of the Docker Engine.
The following command always uses a local image if it exists:
@y
By default, image analysis with the `docker scout cves` command
targets images in the local image store of the Docker Engine.
The following command always uses a local image if it exists:
@z

@x
```console
$ docker scout cves <image>
```
@y
```console
$ docker scout cves <image>
```
@z

@x
If the image doesn't exist locally, Docker pulls the image before running the analysis.
Analyzing the same image again would use the same local version by default,
even if the tag has since changed in the registry.
@y
If the image doesn't exist locally, Docker pulls the image before running the analysis.
Analyzing the same image again would use the same local version by default,
even if the tag has since changed in the registry.
@z

@x
By adding a `registry://` prefix to the image reference,
you can force Docker Scout to analyze the registry version of the image:
@y
By adding a `registry://` prefix to the image reference,
you can force Docker Scout to analyze the registry version of the image:
@z

@x
```console
$ docker scout cves registry://<image>
```
@y
```console
$ docker scout cves registry://<image>
```
@z

@x
## Supported prefixes
@y
## Supported prefixes
@z

@x
The supported prefixes are:
@y
The supported prefixes are:
@z

@x
| Prefix               | Description                                                          |
| -------------------- | -------------------------------------------------------------------- |
| `image://` (default) | Use a local image, or fall back to a registry lookup                 |
| `local://`           | Use an image from the local image store (don't do a registry lookup) |
| `registry://`        | Use an image from a registry (don't use a local image)               |
| `oci-dir://`         | Use an OCI layout directory                                          |
| `archive://`         | Use a tarball archive, as created by `docker save`                   |
| `fs://`              | Use a local directory or file                                        |
@y
| Prefix               | Description                                                          |
| -------------------- | -------------------------------------------------------------------- |
| `image://` (default) | Use a local image, or fall back to a registry lookup                 |
| `local://`           | Use an image from the local image store (don't do a registry lookup) |
| `registry://`        | Use an image from a registry (don't use a local image)               |
| `oci-dir://`         | Use an OCI layout directory                                          |
| `archive://`         | Use a tarball archive, as created by `docker save`                   |
| `fs://`              | Use a local directory or file                                        |
@z

@x
You can use prefixes with the following commands:
@y
You can use prefixes with the following commands:
@z

@x
- `docker scout compare`
- `docker scout cves`
- `docker scout quickview`
- `docker scout recommendations`
- `docker scout sbom`
@y
- `docker scout compare`
- `docker scout cves`
- `docker scout quickview`
- `docker scout recommendations`
- `docker scout sbom`
@z

@x
## Examples
@y
## Examples
@z

@x
This section contains a few examples showing how you can use prefixes
to specify artifacts for `docker scout` commands.
@y
This section contains a few examples showing how you can use prefixes
to specify artifacts for `docker scout` commands.
@z

@x
### Analyze a local project
@y
### Analyze a local project
@z

@x
The `fs://` prefix lets you analyze local source code directly,
without having to build it into a container image.
The following `docker scout quickview` command gives you an
at-a-glance vulnerability summary of the source code in the current working directory:
@y
The `fs://` prefix lets you analyze local source code directly,
without having to build it into a container image.
The following `docker scout quickview` command gives you an
at-a-glance vulnerability summary of the source code in the current working directory:
@z

@x
```console
$ docker scout quickview fs://.
```
@y
```console
$ docker scout quickview fs://.
```
@z

@x
To view the details of vulnerabilities found in your local source code, you can
use the `docker scout cves --details fs://.` command. Combine it with
other flags to narrow down the results to the packages and vulnerabilities that
you're interested in.
@y
To view the details of vulnerabilities found in your local source code, you can
use the `docker scout cves --details fs://.` command. Combine it with
other flags to narrow down the results to the packages and vulnerabilities that
you're interested in.
@z

@x
```console
$ docker scout cves --details --only-severity high fs://.
    ✓ File system read
    ✓ Indexed 323 packages
    ✗ Detected 1 vulnerable package with 1 vulnerability
@y
```console
$ docker scout cves --details --only-severity high fs://.
    ✓ File system read
    ✓ Indexed 323 packages
    ✗ Detected 1 vulnerable package with 1 vulnerability
@z

@x
​## Overview
@y
​## Overview
@z

@x
                    │        Analyzed path
────────────────────┼──────────────────────────────
  Path              │  /Users/david/demo/scoutfs
    vulnerabilities │    0C     1H     0M     0L
@y
                    │        Analyzed path
────────────────────┼──────────────────────────────
  Path              │  /Users/david/demo/scoutfs
    vulnerabilities │    0C     1H     0M     0L
@z

@x
​## Packages and Vulnerabilities
@y
​## Packages and Vulnerabilities
@z

@x
   0C     1H     0M     0L  fastify 3.29.0
pkg:npm/fastify@3.29.0
@y
   0C     1H     0M     0L  fastify 3.29.0
pkg:npm/fastify@3.29.0
@z

@x
    ✗ HIGH CVE-2022-39288 [OWASP Top Ten 2017 Category A9 - Using Components with Known Vulnerabilities]
      https://scout.docker.com/v/CVE-2022-39288
@y
    ✗ HIGH CVE-2022-39288 [OWASP Top Ten 2017 Category A9 - Using Components with Known Vulnerabilities]
      https://scout.docker.com/v/CVE-2022-39288
@z

@x
      fastify is a fast and low overhead web framework, for Node.js. Affected versions of
      fastify are subject to a denial of service via malicious use of the Content-Type
      header. An attacker can send an invalid Content-Type header that can cause the
      application to crash. This issue has been addressed in commit  fbb07e8d  and will be
      included in release version 4.8.1. Users are advised to upgrade. Users unable to
      upgrade may manually filter out http content with malicious Content-Type headers.
@y
      fastify is a fast and low overhead web framework, for Node.js. Affected versions of
      fastify are subject to a denial of service via malicious use of the Content-Type
      header. An attacker can send an invalid Content-Type header that can cause the
      application to crash. This issue has been addressed in commit  fbb07e8d  and will be
      included in release version 4.8.1. Users are advised to upgrade. Users unable to
      upgrade may manually filter out http content with malicious Content-Type headers.
@z

@x
      Affected range : <4.8.1
      Fixed version  : 4.8.1
      CVSS Score     : 7.5
      CVSS Vector    : CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
@y
      Affected range : <4.8.1
      Fixed version  : 4.8.1
      CVSS Score     : 7.5
      CVSS Vector    : CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
@z

@x
1 vulnerability found in 1 package
  LOW       0
  MEDIUM    0
  HIGH      1
  CRITICAL  0
```
@y
1 vulnerability found in 1 package
  LOW       0
  MEDIUM    0
  HIGH      1
  CRITICAL  0
```
@z

@x
### Compare a local project to an image
@y
### Compare a local project to an image
@z

@x
With `docker scout compare`, you can compare the analysis of source code on
your local filesystem with the analysis of a container image.
The following example compares local source code (`fs://.`)
with a registry image `registry://docker/scout-cli:latest`.
In this case, both the baseline and target for the comparison use prefixes.
@y
With `docker scout compare`, you can compare the analysis of source code on
your local filesystem with the analysis of a container image.
The following example compares local source code (`fs://.`)
with a registry image `registry://docker/scout-cli:latest`.
In this case, both the baseline and target for the comparison use prefixes.
@z

@x
```console
$ docker scout compare fs://. --to registry://docker/scout-cli:latest --ignore-unchanged
WARN 'docker scout compare' is experimental and its behaviour might change in the future
    ✓ File system read
    ✓ Indexed 268 packages
    ✓ SBOM of image already cached, 234 packages indexed
@y
```console
$ docker scout compare fs://. --to registry://docker/scout-cli:latest --ignore-unchanged
WARN 'docker scout compare' is experimental and its behaviour might change in the future
    ✓ File system read
    ✓ Indexed 268 packages
    ✓ SBOM of image already cached, 234 packages indexed
@z

@x
  ## Overview
@y
  ## Overview
@z

@x
                           │              Analyzed File System              │              Comparison Image
  ─────────────────────────┼────────────────────────────────────────────────┼─────────────────────────────────────────────
    Path / Image reference │  /Users/david/src/docker/scout-cli-plugin      │  docker/scout-cli:latest
                           │                                                │  bb0b01303584
      platform             │                                                │ linux/arm64
      provenance           │ https://github.com/dvdksn/scout-cli-plugin.git │ https://github.com/docker/scout-cli-plugin
                           │  6ea3f7369dbdfec101ac7c0fa9d78ef05ffa6315      │  67cb4ef78bd69545af0e223ba5fb577b27094505
      vulnerabilities      │    0C     0H     1M     1L                     │    0C     0H     1M     1L
                           │                                                │
      size                 │ 7.4 MB (-14 MB)                                │ 21 MB
      packages             │ 268 (+34)                                      │ 234
                           │                                                │
@y
                           │              Analyzed File System              │              Comparison Image
  ─────────────────────────┼────────────────────────────────────────────────┼─────────────────────────────────────────────
    Path / Image reference │  /Users/david/src/docker/scout-cli-plugin      │  docker/scout-cli:latest
                           │                                                │  bb0b01303584
      platform             │                                                │ linux/arm64
      provenance           │ https://github.com/dvdksn/scout-cli-plugin.git │ https://github.com/docker/scout-cli-plugin
                           │  6ea3f7369dbdfec101ac7c0fa9d78ef05ffa6315      │  67cb4ef78bd69545af0e223ba5fb577b27094505
      vulnerabilities      │    0C     0H     1M     1L                     │    0C     0H     1M     1L
                           │                                                │
      size                 │ 7.4 MB (-14 MB)                                │ 21 MB
      packages             │ 268 (+34)                                      │ 234
                           │                                                │
@z

@x
  ## Packages and Vulnerabilities
@y
  ## Packages and Vulnerabilities
@z

@x
    +   55 packages added
    -   21 packages removed
       213 packages unchanged
```
@y
    +   55 packages added
    -   21 packages removed
       213 packages unchanged
```
@z

@x
The previous example is truncated for brevity.
@y
The previous example is truncated for brevity.
@z

@x
### View the SBOM of an image tarball
@y
### View the SBOM of an image tarball
@z

@x
The following example shows how you can use the `archive://` prefix
to get the SBOM of an image tarball, created with `docker save`.
The image in this case is `docker/scout-cli:latest`,
and the SBOM is exported to file `sbom.spdx.json` in SPDX format.
@y
The following example shows how you can use the `archive://` prefix
to get the SBOM of an image tarball, created with `docker save`.
The image in this case is `docker/scout-cli:latest`,
and the SBOM is exported to file `sbom.spdx.json` in SPDX format.
@z

@x
```console
$ docker pull docker/scout-cli:latest
latest: Pulling from docker/scout-cli
257973a141f5: Download complete 
1f2083724dd1: Download complete 
5c8125a73507: Download complete 
Digest: sha256:13318bb059b0f8b0b87b35ac7050782462b5d0ac3f96f9f23d165d8ed68d0894
$ docker save docker/scout-cli:latest -o scout-cli.tar
$ docker scout sbom --format spdx -o sbom.spdx.json archive://scout-cli.tar
```
@y
```console
$ docker pull docker/scout-cli:latest
latest: Pulling from docker/scout-cli
257973a141f5: Download complete 
1f2083724dd1: Download complete 
5c8125a73507: Download complete 
Digest: sha256:13318bb059b0f8b0b87b35ac7050782462b5d0ac3f96f9f23d165d8ed68d0894
$ docker save docker/scout-cli:latest -o scout-cli.tar
$ docker scout sbom --format spdx -o sbom.spdx.json archive://scout-cli.tar
```
@z

@x
## Learn more
@y
## Learn more
@z

@x
Read about the commands and supported flags in the CLI reference documentation:
@y
Read about the commands and supported flags in the CLI reference documentation:
@z

@x
- [`docker scout quickview`](/reference/cli/docker/scout/quickview.md)
- [`docker scout cves`](/reference/cli/docker/scout/cves.md)
- [`docker scout compare`](/reference/cli/docker/scout/compare.md)
@y
- [`docker scout quickview`](reference/cli/docker/scout/quickview.md)
- [`docker scout cves`](reference/cli/docker/scout/cves.md)
- [`docker scout compare`](reference/cli/docker/scout/compare.md)
@z
