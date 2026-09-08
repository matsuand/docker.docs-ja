%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Search and evaluate Docker Hardened Images
linktitle: Search and evaluate
description: Learn how to find, compare, and evaluate Docker Hardened Images using the Docker Hub catalog, DHI CLI, and Docker Scout.
keywords: search docker images, image variants, docker hub catalog, compare docker images, docker scout compare, image comparison, vulnerability comparison
weight: 10
aliases:
  - /dhi/how-to/compare/
  - /dhi/how-to/explore/
---
@y
---
title: Search and evaluate Docker Hardened Images
linktitle: Search and evaluate
description: Learn how to find, compare, and evaluate Docker Hardened Images using the Docker Hub catalog, DHI CLI, and Docker Scout.
keywords: search docker images, image variants, docker hub catalog, compare docker images, docker scout compare, image comparison, vulnerability comparison
weight: 10
aliases:
  - /dhi/how-to/compare/
  - /dhi/how-to/explore/
---
@z

@x
## Search the catalog
@y
## Search the catalog
@z

@x
You can browse, search, or filter images by category in the [Docker Hub
catalog](https://hub.docker.com/hardened-images/catalog). For details about
the catalog interface, see [Docker Hub](/dhi/tools/hub/).
@y
You can browse, search, or filter images by category in the [Docker Hub
catalog](https://hub.docker.com/hardened-images/catalog). For details about
the catalog interface, see [Docker Hub](/dhi/tools/hub/).
@z

@x
Alternatively, use the [DHI MCP server](/dhi/tools/mcp/) to search and
inspect the catalog directly from your AI assistant, or use the [DHI
CLI](/dhi/tools/cli/) to browse the catalog from the command line:
@y
Alternatively, use the [DHI MCP server](/dhi/tools/mcp/) to search and
inspect the catalog directly from your AI assistant, or use the [DHI
CLI](/dhi/tools/cli/) to browse the catalog from the command line:
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
To view repository details, including available tags and CVE counts:
@y
To view repository details, including available tags and CVE counts:
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
- Evaluating the security improvements when migrating from a standard image to a DHI
- Understanding package and vulnerability differences between image variants
- Assessing the impact of customizations or updates
@y
- Evaluating the security improvements when migrating from a standard image to a DHI
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
- Sign in to `dhi.io` for Docker Hardened Images:
@y
- Install [Docker Desktop](/desktop/) to use Docker Scout comparison features.
- Sign in to `dhi.io` for Docker Hardened Images:
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
compare`](/reference/cli/docker/scout/compare/) command:
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
the two images.
@y
This output highlights only the packages and vulnerabilities that differ between
the two images.
@z
