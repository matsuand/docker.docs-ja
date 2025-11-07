%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Compare Docker Hardened Images
linktitle: Compare images
description: Learn how to compare Docker Hardened Images with other container images to evaluate security improvements and differences.
keywords: compare docker images, docker scout compare, image comparison, vulnerability comparison, security comparison
@y
title: Compare Docker Hardened Images
linktitle: Compare images
description: Learn how to compare Docker Hardened Images with other container images to evaluate security improvements and differences.
keywords: compare docker images, docker scout compare, image comparison, vulnerability comparison, security comparison
@z

@x
{{< summary-bar feature_name="Docker Hardened Images" >}}
@y
{{< summary-bar feature_name="Docker Hardened Images" >}}
@z

@x
Docker Hardened Images (DHIs) are designed to provide enhanced security,
minimized attack surfaces, and production-ready foundations for your
applications. Comparing a DHI to a standard image helps you understand the
security improvements, package differences, and overall benefits of adopting
hardened images.
@y
Docker Hardened Images (DHIs) are designed to provide enhanced security,
minimized attack surfaces, and production-ready foundations for your
applications. Comparing a DHI to a standard image helps you understand the
security improvements, package differences, and overall benefits of adopting
hardened images.
@z

@x
This page explains how to use Docker Scout to compare a Docker Hardened Image
with another image, such as a Docker Official Image (DOI) or a custom image, to
evaluate differences in vulnerabilities, packages, and configurations.
@y
This page explains how to use Docker Scout to compare a Docker Hardened Image
with another image, such as a Docker Official Image (DOI) or a custom image, to
evaluate differences in vulnerabilities, packages, and configurations.
@z

@x
## Compare images using Docker Scout
@y
## Compare images using Docker Scout
@z

@x
Docker Scout provides a built-in comparison feature that lets you analyze the
differences between two images. This is useful for:
@y
Docker Scout provides a built-in comparison feature that lets you analyze the
differences between two images. This is useful for:
@z

@x
- Evaluating the security improvements when migrating from a standard image to a
  DHI
- Understanding package and vulnerability differences between image variants
- Assessing the impact of customizations or updates
@y
- Evaluating the security improvements when migrating from a standard image to a
  DHI
- Understanding package and vulnerability differences between image variants
- Assessing the impact of customizations or updates
@z

@x
### Basic comparison
@y
### Basic comparison
@z

@x
To compare a Docker Hardened Image with another image, use the [`docker scout
compare`](/reference/cli/docker/scout/compare/) command:
@y
To compare a Docker Hardened Image with another image, use the [`docker scout
compare`](__SUBDIR__/reference/cli/docker/scout/compare/) command:
@z

@x
```console
$ docker scout compare <your-namespace>/dhi-<image>:<tag> \
    --to <comparison-image>:<tag> \
    --platform <platform>
```
@y
```console
$ docker scout compare <your-namespace>/dhi-<image>:<tag> \
    --to <comparison-image>:<tag> \
    --platform <platform>
```
@z

@x
For example, to compare a DHI Node.js image with the official Node.js image:
@y
For example, to compare a DHI Node.js image with the official Node.js image:
@z

@x
```console
$ docker scout compare <your-namespace>/dhi-node:22-debian13 \
    --to node:22 \
    --platform linux/amd64
```
@y
```console
$ docker scout compare <your-namespace>/dhi-node:22-debian13 \
    --to node:22 \
    --platform linux/amd64
```
@z

@x
This command provides a detailed comparison including:
@y
This command provides a detailed comparison including:
@z

@x
- Vulnerability differences (CVEs added, removed, or changed)
- Package differences (packages added, removed, or updated)
- Overall security posture improvements
@y
- Vulnerability differences (CVEs added, removed, or changed)
- Package differences (packages added, removed, or updated)
- Overall security posture improvements
@z

@x
### Filter unchanged packages
@y
### Filter unchanged packages
@z

@x
To focus only on the differences and ignore unchanged packages, use the
`--ignore-unchanged` flag:
@y
To focus only on the differences and ignore unchanged packages, use the
`--ignore-unchanged` flag:
@z

@x
```console
$ docker scout compare <your-namespace>/dhi-node:22-debian13 \
    --to node:22 \
    --platform linux/amd64 \
    --ignore-unchanged
```
@y
```console
$ docker scout compare <your-namespace>/dhi-node:22-debian13 \
    --to node:22 \
    --platform linux/amd64 \
    --ignore-unchanged
```
@z

@x
This output highlights only the packages and vulnerabilities that differ between
the two images, making it easier to identify the security improvements and
changes.
@y
This output highlights only the packages and vulnerabilities that differ between
the two images, making it easier to identify the security improvements and
changes.
@z

@x
### Show overview only
@y
### Show overview only
@z

@x
For a concise overview of the comparison results, you can extract just the
overview section using standard shell tools:
@y
For a concise overview of the comparison results, you can extract just the
overview section using standard shell tools:
@z

@x
```console
$ docker scout compare <your-namespace>/dhi-node:22-debian13 \
    --to node:22 \
    --platform linux/amd64 \
    --ignore-unchanged \
    2>/dev/null | sed -n '/## Overview/,/^  ## /p' | head -n -1
```
@y
```console
$ docker scout compare <your-namespace>/dhi-node:22-debian13 \
    --to node:22 \
    --platform linux/amd64 \
    --ignore-unchanged \
    2>/dev/null | sed -n '/## Overview/,/^  ## /p' | head -n -1
```
@z

@x
The result is a clean summary showing the key differences between the two
images. Example output:
@y
The result is a clean summary showing the key differences between the two
images. Example output:
@z

@x
```console
  ## Overview
@y
```console
  ## Overview
@z

@x
                      │                    Analyzed Image                     │              Comparison Image
  ────────────────────┼───────────────────────────────────────────────────────┼─────────────────────────────────────────────
    Target            │  docker/dhi-node:22-debian13                          │  node:22
      digest          │  55d471f61608                                         │  9ee3220f602f
      tag             │  22-debian13                                          │  22
      platform        │ linux/amd64                                           │ linux/amd64
      provenance      │ https://github.com/docker-hardened-images/definitions │ https://github.com/nodejs/docker-node.git
                      │  9fe491f53122b84eebba81e13f20157c18c10de2             │  bf78d7603fbea92cd3652edb3b2edadd6f5a3fe8
      vulnerabilities │    0C     0H     0M     0L                            │    0C     1H     3M   153L     4?
                      │           -1     -3   -153     -4                     │
      size            │ 41 MB (-367 MB)                                       │ 408 MB
      packages        │ 19 (-726)                                             │ 745
                      │                                                       │
```
@y
                      │                    Analyzed Image                     │              Comparison Image
  ────────────────────┼───────────────────────────────────────────────────────┼─────────────────────────────────────────────
    Target            │  docker/dhi-node:22-debian13                          │  node:22
      digest          │  55d471f61608                                         │  9ee3220f602f
      tag             │  22-debian13                                          │  22
      platform        │ linux/amd64                                           │ linux/amd64
      provenance      │ https://github.com/docker-hardened-images/definitions │ https://github.com/nodejs/docker-node.git
                      │  9fe491f53122b84eebba81e13f20157c18c10de2             │  bf78d7603fbea92cd3652edb3b2edadd6f5a3fe8
      vulnerabilities │    0C     0H     0M     0L                            │    0C     1H     3M   153L     4?
                      │           -1     -3   -153     -4                     │
      size            │ 41 MB (-367 MB)                                       │ 408 MB
      packages        │ 19 (-726)                                             │ 745
                      │                                                       │
```
@z

@x
## Interpret comparison results
@y
## Interpret comparison results
@z

@x
The comparison output includes the following sections.
@y
The comparison output includes the following sections.
@z

@x
### Overview
@y
### Overview
@z

@x
The overview section provides high-level statistics about both images:
@y
The overview section provides high-level statistics about both images:
@z

@x
- Target and comparison image details (digest, tag, platform, provenance)
- Vulnerability counts for each image
- Size comparison
- Package counts
@y
- Target and comparison image details (digest, tag, platform, provenance)
- Vulnerability counts for each image
- Size comparison
- Package counts
@z

@x
Look for:
@y
Look for:
@z

@x
- Vulnerability reductions (negative numbers in the delta row)
- Size reductions showing storage efficiency
- Package count reductions indicating a minimal attack surface
@y
- Vulnerability reductions (negative numbers in the delta row)
- Size reductions showing storage efficiency
- Package count reductions indicating a minimal attack surface
@z

@x
### Environment Variables
@y
### Environment Variables
@z

@x
The environment variables section shows environment variables that differ between
the two images, prefixed with `+` for added or `-` for removed.
@y
The environment variables section shows environment variables that differ between
the two images, prefixed with `+` for added or `-` for removed.
@z

@x
Look for:
@y
Look for:
@z

@x
- Removed environment variables that may have been necessary for your specific use-case
@y
- Removed environment variables that may have been necessary for your specific use-case
@z

@x
### Labels
@y
### Labels
@z

@x
The labels section displays labels that differ between the two images, prefixed
with `+` for added or `-` for removed.
@y
The labels section displays labels that differ between the two images, prefixed
with `+` for added or `-` for removed.
@z

@x
### Packages and Vulnerabilities
@y
### Packages and Vulnerabilities
@z

@x
The packages and vulnerabilities section lists all package differences and their
associated security vulnerabilities. Packages are prefixed with:
@y
The packages and vulnerabilities section lists all package differences and their
associated security vulnerabilities. Packages are prefixed with:
@z

@x
- `-` for packages removed from the target image (not present in the compared image)
- `+` for packages added to the target image (not present in the base image)
- `↑` for packages upgraded in the target image
- `↓` for packages downgraded in the target image
@y
- `-` for packages removed from the target image (not present in the compared image)
- `+` for packages added to the target image (not present in the base image)
- `↑` for packages upgraded in the target image
- `↓` for packages downgraded in the target image
@z

@x
For packages with associated vulnerabilities, the CVEs are listed with their
severity levels and identifiers.
@y
For packages with associated vulnerabilities, the CVEs are listed with their
severity levels and identifiers.
@z

@x
Look for:
@y
Look for:
@z

@x
- Removed packages and vulnerabilities: Indicates a reduced attack surface in the DHI
- Added packages: May indicate DHI-specific tooling or dependencies
- Upgraded packages: Shows version updates that may include security fixes
@y
- Removed packages and vulnerabilities: Indicates a reduced attack surface in the DHI
- Added packages: May indicate DHI-specific tooling or dependencies
- Upgraded packages: Shows version updates that may include security fixes
@z

@x
## When to compare images
@y
## When to compare images
@z

@x
### Evaluate migration benefits
@y
### Evaluate migration benefits
@z

@x
Before migrating from a Docker Official Image to a DHI, compare them to
understand the security improvements. For example:
@y
Before migrating from a Docker Official Image to a DHI, compare them to
understand the security improvements. For example:
@z

@x
```console
$ docker scout compare <your-namespace>/dhi-python:3.13 \
    --to python:3.13 \
    --platform linux/amd64 \
    --ignore-unchanged
```
@y
```console
$ docker scout compare <your-namespace>/dhi-python:3.13 \
    --to python:3.13 \
    --platform linux/amd64 \
    --ignore-unchanged
```
@z

@x
This helps justify the migration by showing concrete vulnerability reductions
and package minimization.
@y
This helps justify the migration by showing concrete vulnerability reductions
and package minimization.
@z

@x
### Assess customization impact
@y
### Assess customization impact
@z

@x
After customizing a DHI, compare the customized version with the original to
ensure you haven't introduced new vulnerabilities. For example:
@y
After customizing a DHI, compare the customized version with the original to
ensure you haven't introduced new vulnerabilities. For example:
@z

@x
```console
$ docker scout compare <your-namespace>/dhi-python:3.13-custom \
    --to <your-namespace>/dhi-python:3.13 \
    --platform linux/amd64
```
@y
```console
$ docker scout compare <your-namespace>/dhi-python:3.13-custom \
    --to <your-namespace>/dhi-python:3.13 \
    --platform linux/amd64
```
@z

@x
### Track updates over time
@y
### Track updates over time
@z

@x
Compare different versions of the same DHI to see what changed between releases. For example:
@y
Compare different versions of the same DHI to see what changed between releases. For example:
@z

@x
```console
$ docker scout compare <your-namespace>/dhi-node:22-debian13 \
    --to <your-namespace>/dhi-node:20-debian12 \
    --platform linux/amd64 \
    --ignore-unchanged
```
@y
```console
$ docker scout compare <your-namespace>/dhi-node:22-debian13 \
    --to <your-namespace>/dhi-node:20-debian12 \
    --platform linux/amd64 \
    --ignore-unchanged
```
@z
