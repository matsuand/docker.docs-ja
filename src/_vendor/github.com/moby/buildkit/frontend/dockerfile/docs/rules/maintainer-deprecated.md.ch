%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: MaintainerDeprecated
description: The MAINTAINER instruction is deprecated, use a label instead to define an image author
aliases:
  - /go/dockerfile/rule/maintainer-deprecated/
---
@y
---
title: MaintainerDeprecated
description: The MAINTAINER instruction is deprecated, use a label instead to define an image author
aliases:
  - /go/dockerfile/rule/maintainer-deprecated/
---
@z

@x
## Output
@y
## Output
@z

@x
```text
MAINTAINER instruction is deprecated in favor of using label
```
@y
```text
MAINTAINER instruction is deprecated in favor of using label
```
@z

@x
## Description
@y
## Description
@z

@x
The `MAINTAINER` instruction, used historically for specifying the author of
the Dockerfile, is deprecated. To set author metadata for an image, use the
`org.opencontainers.image.authors` [OCI label](https://github.com/opencontainers/image-spec/blob/main/annotations.md#pre-defined-annotation-keys).
@y
The `MAINTAINER` instruction, used historically for specifying the author of
the Dockerfile, is deprecated. To set author metadata for an image, use the
`org.opencontainers.image.authors` [OCI label](https://github.com/opencontainers/image-spec/blob/main/annotations.md#pre-defined-annotation-keys).
@z

@x
## Examples
@y
## Examples
@z

@x
❌ Bad: don't use the `MAINTAINER` instruction
@y
❌ Bad: don't use the `MAINTAINER` instruction
@z

@x
```dockerfile
MAINTAINER moby@example.com
```
@y
```dockerfile
MAINTAINER moby@example.com
```
@z

@x
✅ Good: specify the author using the `org.opencontainers.image.authors` label
@y
✅ Good: specify the author using the `org.opencontainers.image.authors` label
@z

@x
```dockerfile
LABEL org.opencontainers.image.authors="moby@example.com"
```
@y
```dockerfile
LABEL org.opencontainers.image.authors="moby@example.com"
```
@z
