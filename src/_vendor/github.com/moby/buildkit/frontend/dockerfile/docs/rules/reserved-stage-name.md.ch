%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: ReservedStageName
description: Reserved words should not be used as stage names
aliases:
  - /go/dockerfile/rule/reserved-stage-name/
---
@y
---
title: ReservedStageName
description: Reserved words should not be used as stage names
aliases:
  - /go/dockerfile/rule/reserved-stage-name/
---
@z

@x
## Output
@y
## Output
@z

@x
```text
'scratch' is reserved and should not be used as a stage name
```
@y
```text
'scratch' is reserved and should not be used as a stage name
```
@z

@x
## Description
@y
## Description
@z

@x
Reserved words should not be used as names for stages in multi-stage builds.
The reserved words are:
@y
Reserved words should not be used as names for stages in multi-stage builds.
The reserved words are:
@z

@x
- `context`
- `scratch`
@y
- `context`
- `scratch`
@z

@x
## Examples
@y
## Examples
@z

@x
❌ Bad: `scratch` and `context` are reserved names.
@y
❌ Bad: `scratch` and `context` are reserved names.
@z

@x
```dockerfile
FROM alpine AS scratch
FROM alpine AS context
```
@y
```dockerfile
FROM alpine AS scratch
FROM alpine AS context
```
@z

@x
✅ Good: the stage name `builder` is not reserved.
@y
✅ Good: the stage name `builder` is not reserved.
@z

@x
```dockerfile
FROM alpine AS builder
```
@y
```dockerfile
FROM alpine AS builder
```
@z
