%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: UndefinedArgInFrom
description: FROM command must use declared ARGs
aliases:
  - /go/dockerfile/rule/undefined-arg-in-from/
---
@y
---
title: UndefinedArgInFrom
description: FROM command must use declared ARGs
aliases:
  - /go/dockerfile/rule/undefined-arg-in-from/
---
@z

@x
## Output
@y
## Output
@z

@x
```text
FROM argument 'VARIANT' is not declared
```
@y
```text
FROM argument 'VARIANT' is not declared
```
@z

@x
## Description
@y
## Description
@z

@x
This rule warns for cases where you're consuming an undefined build argument in
`FROM` instructions.
@y
This rule warns for cases where you're consuming an undefined build argument in
`FROM` instructions.
@z

@x
Interpolating build arguments in `FROM` instructions can be a good way to add
flexibility to your build, and lets you pass arguments that overriding the base
image of a stage. For example, you might use a build argument to specify the
image tag:
@y
Interpolating build arguments in `FROM` instructions can be a good way to add
flexibility to your build, and lets you pass arguments that overriding the base
image of a stage. For example, you might use a build argument to specify the
image tag:
@z

@x
```dockerfile
ARG ALPINE_VERSION=3.20
@y
```dockerfile
ARG ALPINE_VERSION=3.20
@z

@x
FROM alpine:${ALPINE_VERSION}
```
@y
FROM alpine:${ALPINE_VERSION}
```
@z

@x
This makes it possible to run the build with a different `alpine` version by
specifying a build argument:
@y
This makes it possible to run the build with a different `alpine` version by
specifying a build argument:
@z

@x
```console
$ docker buildx build --build-arg ALPINE_VERSION=edge .
```
@y
```console
$ docker buildx build --build-arg ALPINE_VERSION=edge .
```
@z

@x
This check also tries to detect and warn when a `FROM` instruction reference
miss-spelled built-in build arguments, like `BUILDPLATFORM`.
@y
This check also tries to detect and warn when a `FROM` instruction reference
miss-spelled built-in build arguments, like `BUILDPLATFORM`.
@z

@x
## Examples
@y
## Examples
@z

@x
❌ Bad: the `VARIANT` build argument is undefined.
@y
❌ Bad: the `VARIANT` build argument is undefined.
@z

@x
```dockerfile
FROM node:22${VARIANT} AS jsbuilder
```
@y
```dockerfile
FROM node:22${VARIANT} AS jsbuilder
```
@z

@x
✅ Good: the `VARIANT` build argument is defined.
@y
✅ Good: the `VARIANT` build argument is defined.
@z

@x
```dockerfile
ARG VARIANT="-alpine3.20"
FROM node:22${VARIANT} AS jsbuilder
```
@y
```dockerfile
ARG VARIANT="-alpine3.20"
FROM node:22${VARIANT} AS jsbuilder
```
@z
