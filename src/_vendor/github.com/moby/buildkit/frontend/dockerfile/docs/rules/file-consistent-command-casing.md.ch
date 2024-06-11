%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: FileConsistentCommandCasing
description: All commands within the Dockerfile should use the same casing (either upper or lower)
aliases:
  - /go/dockerfile/rule/file-consistent-command-casing/
---
@y
---
title: FileConsistentCommandCasing
description: All commands within the Dockerfile should use the same casing (either upper or lower)
aliases:
  - /go/dockerfile/rule/file-consistent-command-casing/
---
@z

@x
## Output
@y
## Output
@z

@x
Example warning:
@y
Example warning:
@z

@x
```text
Command 'foo' should match the case of the command majority (uppercase)
```
@y
```text
Command 'foo' should match the case of the command majority (uppercase)
```
@z

@x
## Description
@y
## Description
@z

@x
Instructions within a Dockerfile should have consistent casing through out the
entire files. Instructions are not case-sensitive, but the convention is to use
uppercase for instruction keywords to make it easier to distinguish keywords
from arguments.
@y
Instructions within a Dockerfile should have consistent casing through out the
entire files. Instructions are not case-sensitive, but the convention is to use
uppercase for instruction keywords to make it easier to distinguish keywords
from arguments.
@z

@x
Whether you prefer instructions to be uppercase or lowercase, you should make
sure you use consistent casing to help improve readability of the Dockerfile.
@y
Whether you prefer instructions to be uppercase or lowercase, you should make
sure you use consistent casing to help improve readability of the Dockerfile.
@z

@x
## Examples
@y
## Examples
@z

@x
❌ Bad: mixed uppercase and lowercase.
@y
❌ Bad: mixed uppercase and lowercase.
@z

@x
```dockerfile
FROM alpine:latest AS builder
run apk --no-cache add build-base
@y
```dockerfile
FROM alpine:latest AS builder
run apk --no-cache add build-base
@z

@x
FROM builder AS build1
copy source1.cpp source.cpp
```
@y
FROM builder AS build1
copy source1.cpp source.cpp
```
@z

@x
✅ Good: all uppercase.
@y
✅ Good: all uppercase.
@z

@x
```dockerfile
FROM alpine:latest AS builder
RUN apk --no-cache add build-base
@y
```dockerfile
FROM alpine:latest AS builder
RUN apk --no-cache add build-base
@z

@x
FROM builder AS build1
COPY source1.cpp source.cpp
```
@y
FROM builder AS build1
COPY source1.cpp source.cpp
```
@z

@x
✅ Good: all lowercase.
@y
✅ Good: all lowercase.
@z

@x
```dockerfile
from alpine:latest as builder
run apk --no-cache add build-base
@y
```dockerfile
from alpine:latest as builder
run apk --no-cache add build-base
@z

@x
from builder as build1
copy source1.cpp source.cpp
```
@y
from builder as build1
copy source1.cpp source.cpp
```
@z

@x
## Related errors
@y
## Related errors
@z

@x
- [`FromAsCasing`](./from-as-casing.md)
@y
- [`FromAsCasing`](./from-as-casing.md)
@z
