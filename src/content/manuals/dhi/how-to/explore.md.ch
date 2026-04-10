%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Search and evaluate Docker Hardened Images
linktitle: Search and evaluate
description: Learn how to find, compare, and evaluate Docker Hardened Images using the catalog on Docker Hub and Docker Scout comparison tools.
keywords: search docker images, image variants, docker hub catalog, compare docker images, docker scout compare, image comparison, vulnerability comparison
@y
title: Search and evaluate Docker Hardened Images
linktitle: Search and evaluate
description: Learn how to find, compare, and evaluate Docker Hardened Images using the catalog on Docker Hub and Docker Scout comparison tools.
keywords: search docker images, image variants, docker hub catalog, compare docker images, docker scout compare, image comparison, vulnerability comparison
@z

@x
Docker Hardened Images (DHI) are a curated set of secure, production-ready
container images designed to provide enhanced security, minimized attack
surfaces, and production-ready foundations for your applications.
@y
Docker Hardened Images (DHI) are a curated set of secure, production-ready
container images designed to provide enhanced security, minimized attack
surfaces, and production-ready foundations for your applications.
@z

@x
This page explains how to search available DHI repositories, review image
metadata, examine variant details, and compare images to evaluate security
improvements and differences.
@y
This page explains how to search available DHI repositories, review image
metadata, examine variant details, and compare images to evaluate security
improvements and differences.
@z

@x
## Search the catalog
@y
## Search the catalog
@z

@x
You can browse, search, or filter images by category in the [Hardened Image
catalog](https://hub.docker.com/hardened-images/catalog) on Docker Hub.
@y
You can browse, search, or filter images by category in the [Hardened Image
catalog](https://hub.docker.com/hardened-images/catalog) on Docker Hub.
@z

@x
Alternatively, use the [DHI CLI](/reference/cli/docker/dhi/), included in
[Docker Desktop](/desktop/), to browse the catalog from the command line:
@y
Alternatively, use the [DHI CLI](__SUBDIR__/reference/cli/docker/dhi/), included in
[Docker Desktop](__SUBDIR__/desktop/), to browse the catalog from the command line:
@z

@x
```console
$ docker dhi catalog list
```
@y
```console
$ docker dhi catalog list
```
@z

@x
Filter by image type, name, or compliance requirements:
@y
Filter by image type, name, or compliance requirements:
@z

@x
```console
$ docker dhi catalog list --type image
$ docker dhi catalog list --filter python
$ docker dhi catalog list --fips
$ docker dhi catalog list --stig
```
@y
```console
$ docker dhi catalog list --type image
$ docker dhi catalog list --filter python
$ docker dhi catalog list --fips
$ docker dhi catalog list --stig
```
@z

@x
### Repository details
@y
### Repository details
@z

@x
When you select a repository from the catalog, the repository details page
provides the following:
@y
When you select a repository from the catalog, the repository details page
provides the following:
@z

@x
 - Overview: A brief explanation of the image.
 - Guides: Several guides on how to use the image and migrate your existing application.
 - Images: Select this option to [view image variants](#image-variants).
 - Security summary: Select a tag name to view a quick security summary,
   including package count, total known vulnerabilities, and Scout health score.
 - Recently pushed tags: A list of recently updated image variants and when they
   were last updated.
 - Use this image: After selecting an image variant, you can select this option to
   view instructions on how to pull and use the image variant.
@y
 - Overview: A brief explanation of the image.
 - Guides: Several guides on how to use the image and migrate your existing application.
 - Images: Select this option to [view image variants](#image-variants).
 - Security summary: Select a tag name to view a quick security summary,
   including package count, total known vulnerabilities, and Scout health score.
 - Recently pushed tags: A list of recently updated image variants and when they
   were last updated.
 - Use this image: After selecting an image variant, you can select this option to
   view instructions on how to pull and use the image variant.
@z

@x
To view repository details from the command line, use the DHI CLI:
@y
To view repository details from the command line, use the DHI CLI:
@z

@x
```console
$ docker dhi catalog get python
```
@y
```console
$ docker dhi catalog get python
```
@z

@x
This shows available tags, CVE counts, and other repository metadata.
@y
This shows available tags, CVE counts, and other repository metadata.
@z

@x
### Image variants
@y
### Image variants
@z

@x
Tags are used to identify image variants. Image variants are different builds of
the same application or framework tailored for different use-cases.
@y
Tags are used to identify image variants. Image variants are different builds of
the same application or framework tailored for different use-cases.
@z

@x
From the [repository details](#repository-details), select **Images** to view
the available image variants.
@y
From the [repository details](#repository-details), select **Images** to view
the available image variants.
@z

@x
The **Images** page provides a table with the following columns:
@y
The **Images** page provides a table with the following columns:
@z

@x
- Image version: The image name with its base distribution (for example, `debian
  13`) and associated tags.
- Type: The support lifecycle status of the variant.
- Compliance: Relevant compliance designations. For example, `CIS`, `FIPS`, or
  `STIG (100%)`.
- Package manager: Whether a package manager is available. A checkmark indicates
  a package manager is present (for example, `apt` or `apk`), a dash indicates
  none.
- Shell: Whether a shell is available. A checkmark indicates a shell is present
  (for example, `bash` or `busybox`), a dash indicates none.
- User: The user that the container runs as. For example, `root` or `nonroot
  (65532)`.
- Last pushed: When the image variant was last updated.
- Vulnerabilities: Vulnerability counts by severity level.
- Health: The Scout health score. Select the score to view more details.
@y
- Image version: The image name with its base distribution (for example, `debian
  13`) and associated tags.
- Type: The support lifecycle status of the variant.
- Compliance: Relevant compliance designations. For example, `CIS`, `FIPS`, or
  `STIG (100%)`.
- Package manager: Whether a package manager is available. A checkmark indicates
  a package manager is present (for example, `apt` or `apk`), a dash indicates
  none.
- Shell: Whether a shell is available. A checkmark indicates a shell is present
  (for example, `bash` or `busybox`), a dash indicates none.
- User: The user that the container runs as. For example, `root` or `nonroot
  (65532)`.
- Last pushed: When the image variant was last updated.
- Vulnerabilities: Vulnerability counts by severity level.
- Health: The Scout health score. Select the score to view more details.
@z

@x
### Image variant details
@y
### Image variant details
@z

@x
On the [**Images** page](#image-variants), select an image version from the
table to view detailed information about that specific variant.
@y
On the [**Images** page](#image-variants), select an image version from the
table to view detailed information about that specific variant.
@z

@x
The image variant details page provides the following information:
@y
The image variant details page provides the following information:
@z

@x
- Packages: A list of all packages included in the image variant. This section
  includes details about each package, including its name, version,
  distribution, and licensing information.
- Specifications: The specifications for the image variant include the following
  key details:
   - Source & Build Information: The image is built from the Dockerfile found
     here and the Git commit.
   - Build parameters
   - Entrypoint
   - CMD
   - User
   - Working directory
   - Environment Variables
   - Labels
   - Platform
- Vulnerabilities: The vulnerabilities section provides a list of known CVEs for
  the image variant, including:
   - CVE
   - Severity
   - Package
   - Fix version
   - Last detected
   - Status
   - Suppressed CVEs
- Attestations: Variants include comprehensive security attestations to verify
  the image's build process, contents, and security posture. These attestations
  are signed and can be verified using cosign. For a list of available
  attestations, see [Attestations](../core-concepts/attestations.md).
@y
- Packages: A list of all packages included in the image variant. This section
  includes details about each package, including its name, version,
  distribution, and licensing information.
- Specifications: The specifications for the image variant include the following
  key details:
   - Source & Build Information: The image is built from the Dockerfile found
     here and the Git commit.
   - Build parameters
   - Entrypoint
   - CMD
   - User
   - Working directory
   - Environment Variables
   - Labels
   - Platform
- Vulnerabilities: The vulnerabilities section provides a list of known CVEs for
  the image variant, including:
   - CVE
   - Severity
   - Package
   - Fix version
   - Last detected
   - Status
   - Suppressed CVEs
- Attestations: Variants include comprehensive security attestations to verify
  the image's build process, contents, and security posture. These attestations
  are signed and can be verified using cosign. For a list of available
  attestations, see [Attestations](../core-concepts/attestations.md).
@z

@x
## Compare and evaluate images
@y
## Compare and evaluate images
@z

@x
Docker Scout lets you analyze the differences between two images. Comparing a
DHI to a standard image helps you understand the security improvements, package
differences, and overall benefits of adopting hardened images.
@y
Docker Scout lets you analyze the differences between two images. Comparing a
DHI to a standard image helps you understand the security improvements, package
differences, and overall benefits of adopting hardened images.
@z

@x
Comparison is useful for:
@y
Comparison is useful for:
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
### Prerequisites
@y
### Prerequisites
@z

@x
Before comparing images:
@y
Before comparing images:
@z

@x
- Install [Docker Desktop](/desktop/) to use Docker Scout comparison features.
- Sign in to the registries containing the images you want to compare. Sign in
  to `dhi.io` for Docker Hardened Images:
@y
- Install [Docker Desktop](__SUBDIR__/desktop/) to use Docker Scout comparison features.
- Sign in to the registries containing the images you want to compare. Sign in
  to `dhi.io` for Docker Hardened Images:
@z

@x
  ```console
  $ docker login dhi.io
  ```
@y
  ```console
  $ docker login dhi.io
  ```
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
$ docker scout compare dhi.io/<image>:<tag> \
    --to <comparison-image>:<tag> \
    --platform <platform>
```
@y
```console
$ docker scout compare dhi.io/<image>:<tag> \
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
$ docker scout compare dhi.io/node:22-debian13 \
    --to node:22 \
    --platform linux/amd64
```
@y
```console
$ docker scout compare dhi.io/node:22-debian13 \
    --to node:22 \
    --platform linux/amd64
```
@z

@x
The output shows an overview at the top with key comparison metrics, followed by
detailed package and vulnerability information. Example overview:
@y
The output shows an overview at the top with key comparison metrics, followed by
detailed package and vulnerability information. Example overview:
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
    Target            │  dhi.io/node:22-debian13                              │  node:22
      digest          │  55d471f61608                                         │  9ee3220f602f
      platform        │ linux/amd64                                           │ linux/amd64
      vulnerabilities │    0C     0H     0M     0L                            │    0C     1H     3M   153L     4?
                      │           -1     -3   -153     -4                     │
      size            │ 41 MB (-367 MB)                                       │ 408 MB
      packages        │ 19 (-726)                                             │ 745
```
@y
                      │                    Analyzed Image                     │              Comparison Image
  ────────────────────┼───────────────────────────────────────────────────────┼─────────────────────────────────────────────
    Target            │  dhi.io/node:22-debian13                              │  node:22
      digest          │  55d471f61608                                         │  9ee3220f602f
      platform        │ linux/amd64                                           │ linux/amd64
      vulnerabilities │    0C     0H     0M     0L                            │    0C     1H     3M   153L     4?
                      │           -1     -3   -153     -4                     │
      size            │ 41 MB (-367 MB)                                       │ 408 MB
      packages        │ 19 (-726)                                             │ 745
```
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
$ docker scout compare dhi.io/node:22-debian13 \
    --to node:22 \
    --platform linux/amd64 \
    --ignore-unchanged
```
@y
```console
$ docker scout compare dhi.io/node:22-debian13 \
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
