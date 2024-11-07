%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: InvalidDefaultArgInFrom
description: >-
  Default value for global ARG results in an empty or invalid base image name
@y
title: InvalidDefaultArgInFrom
description: >-
  Default value for global ARG results in an empty or invalid base image name
@z

@x
## Output
@y
## Output
@z

@x
```text
Using the global ARGs with default values should produce a valid build.
```
@y
```text
Using the global ARGs with default values should produce a valid build.
```
@z

@x
## Description
@y
## Description
@z

@x
An `ARG` used in an image reference should be valid when no build arguments are used. An image build should not require `--build-arg` to be used to produce a valid build.
@y
An `ARG` used in an image reference should be valid when no build arguments are used. An image build should not require `--build-arg` to be used to produce a valid build.
@z

@x
## Examples
@y
## Examples
@z

@x
❌ Bad: don't rely on an ARG being set for an image reference to be valid
@y
❌ Bad: don't rely on an ARG being set for an image reference to be valid
@z

@x
```dockerfile
ARG TAG
FROM busybox:${TAG}
```
@y
```dockerfile
ARG TAG
FROM busybox:${TAG}
```
@z

@x
✅ Good: include a default for the ARG
@y
✅ Good: include a default for the ARG
@z

@x
```dockerfile
ARG TAG=latest
FROM busybox:${TAG}
```
@y
```dockerfile
ARG TAG=latest
FROM busybox:${TAG}
```
@z

@x
✅ Good: ARG can be empty if the image would be valid with it empty
@y
✅ Good: ARG can be empty if the image would be valid with it empty
@z

@x
```dockerfile
ARG VARIANT
FROM busybox:stable${VARIANT}
```
@y
```dockerfile
ARG VARIANT
FROM busybox:stable${VARIANT}
```
@z

@x
✅ Good: Use a default value if the build arg is not present
@y
✅ Good: Use a default value if the build arg is not present
@z

@x
```dockerfile
ARG TAG
FROM alpine:${TAG:-3.14}
```
@y
```dockerfile
ARG TAG
FROM alpine:${TAG:-3.14}
```
@z
