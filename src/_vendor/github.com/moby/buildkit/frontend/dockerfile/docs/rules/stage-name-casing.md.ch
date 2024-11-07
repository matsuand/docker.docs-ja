%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: StageNameCasing
description: >-
  Stage names should be lowercase
@y
title: StageNameCasing
description: >-
  Stage names should be lowercase
@z

@x
## Output
@y
## Output
@z

@x
```text
Stage name 'BuilderBase' should be lowercase
```
@y
```text
Stage name 'BuilderBase' should be lowercase
```
@z

@x
## Description
@y
## Description
@z

@x
To help distinguish Dockerfile instruction keywords from identifiers, this rule
forces names of stages in a multi-stage Dockerfile to be all lowercase.
@y
To help distinguish Dockerfile instruction keywords from identifiers, this rule
forces names of stages in a multi-stage Dockerfile to be all lowercase.
@z

@x
## Examples
@y
## Examples
@z

@x
❌ Bad: mixing uppercase and lowercase characters in the stage name.
@y
❌ Bad: mixing uppercase and lowercase characters in the stage name.
@z

@x
```dockerfile
FROM alpine AS BuilderBase
```
@y
```dockerfile
FROM alpine AS BuilderBase
```
@z

@x
✅ Good: stage name is all in lowercase.
@y
✅ Good: stage name is all in lowercase.
@z

@x
```dockerfile
FROM alpine AS builder-base
```
@y
```dockerfile
FROM alpine AS builder-base
```
@z
