%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: FromPlatformFlagConstDisallowed
description: FROM --platform flag should not use a constant value
aliases:
  - /go/dockerfile/rule/from-platform-flag-const-disallowed/
---
@y
---
title: FromPlatformFlagConstDisallowed
description: FROM --platform flag should not use a constant value
aliases:
  - /go/dockerfile/rule/from-platform-flag-const-disallowed/
---
@z

@x
## Output
@y
## Output
@z

@x
```text
FROM --platform flag should not use constant value "linux/amd64"
```
@y
```text
FROM --platform flag should not use constant value "linux/amd64"
```
@z

@x
## Description
@y
## Description
@z

@x
Specifying `--platform` in the Dockerfile `FROM` instruction forces the image to build on only one target platform. This prevents building a multi-platform image from this Dockerfile and you must build on the same platform as specified in `--platform`.
@y
Specifying `--platform` in the Dockerfile `FROM` instruction forces the image to build on only one target platform. This prevents building a multi-platform image from this Dockerfile and you must build on the same platform as specified in `--platform`.
@z

@x
The recommended approach is to:
@y
The recommended approach is to:
@z

@x
* Omit `FROM --platform` in the Dockerfile and use the `--platform` argument on the command line.
* Use `$BUILDPLATFORM` or some other combination of variables for the `--platform` argument.
* Stage name should include the platform, OS, or architecture name to indicate that it only contains platform-specific instructions.
@y
* Omit `FROM --platform` in the Dockerfile and use the `--platform` argument on the command line.
* Use `$BUILDPLATFORM` or some other combination of variables for the `--platform` argument.
* Stage name should include the platform, OS, or architecture name to indicate that it only contains platform-specific instructions.
@z

@x
## Examples
@y
## Examples
@z

@x
❌ Bad: using a constant argument for `--platform`
@y
❌ Bad: using a constant argument for `--platform`
@z

@x
```dockerfile
FROM --platform=linux/amd64 alpine AS base
RUN apk add --no-cache git
```
@y
```dockerfile
FROM --platform=linux/amd64 alpine AS base
RUN apk add --no-cache git
```
@z

@x
✅ Good: using the default platform
@y
✅ Good: using the default platform
@z

@x
```dockerfile
FROM alpine AS base
RUN apk add --no-cache git
```
@y
```dockerfile
FROM alpine AS base
RUN apk add --no-cache git
```
@z

@x
✅ Good: using a meta variable
@y
✅ Good: using a meta variable
@z

@x
```dockerfile
FROM --platform=${BUILDPLATFORM} alpine AS base
RUN apk add --no-cache git
```
@y
```dockerfile
FROM --platform=${BUILDPLATFORM} alpine AS base
RUN apk add --no-cache git
```
@z

@x
✅ Good: used in a multi-stage build with a target architecture
@y
✅ Good: used in a multi-stage build with a target architecture
@z

@x
```dockerfile
FROM --platform=linux/amd64 alpine AS build_amd64
...
@y
```dockerfile
FROM --platform=linux/amd64 alpine AS build_amd64
...
@z

@x
FROM --platform=linux/arm64 alpine AS build_arm64
...
@y
FROM --platform=linux/arm64 alpine AS build_arm64
...
@z

@x
FROM build_${TARGETARCH} AS build
...
```
@y
FROM build_${TARGETARCH} AS build
...
```
@z
