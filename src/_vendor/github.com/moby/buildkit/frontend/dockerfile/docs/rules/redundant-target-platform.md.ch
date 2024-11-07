%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: RedundantTargetPlatform
description: >-
  Setting platform to predefined $TARGETPLATFORM in FROM is redundant as this is the default behavior
@y
title: RedundantTargetPlatform
description: >-
  Setting platform to predefined $TARGETPLATFORM in FROM is redundant as this is the default behavior
@z

@x
## Output
@y
## Output
@z

@x
```text
Setting platform to predefined $TARGETPLATFORM in FROM is redundant as this is the default behavior
```
@y
```text
Setting platform to predefined $TARGETPLATFORM in FROM is redundant as this is the default behavior
```
@z

@x
## Description
@y
## Description
@z

@x
A custom platform can be used for a base image. The default platform is the
same platform as the target output so setting the platform to `$TARGETPLATFORM`
is redundant and unnecessary.
@y
A custom platform can be used for a base image. The default platform is the
same platform as the target output so setting the platform to `$TARGETPLATFORM`
is redundant and unnecessary.
@z

@x
## Examples
@y
## Examples
@z

@x
❌ Bad: this usage of `--platform` is redundant since `$TARGETPLATFORM` is the default.
@y
❌ Bad: this usage of `--platform` is redundant since `$TARGETPLATFORM` is the default.
@z

@x
```dockerfile
FROM --platform=$TARGETPLATFORM alpine AS builder
RUN apk add --no-cache git
```
@y
```dockerfile
FROM --platform=$TARGETPLATFORM alpine AS builder
RUN apk add --no-cache git
```
@z

@x
✅ Good: omit the `--platform` argument.
@y
✅ Good: omit the `--platform` argument.
@z

@x
```dockerfile
FROM alpine AS builder
RUN apk add --no-cache git
```
@y
```dockerfile
FROM alpine AS builder
RUN apk add --no-cache git
```
@z
