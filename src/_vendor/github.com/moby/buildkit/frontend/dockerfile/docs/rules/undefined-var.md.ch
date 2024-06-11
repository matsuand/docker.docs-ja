%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: UndefinedVar
description: Variables should be defined before their use
aliases:
  - /go/dockerfile/rule/undefined-var/
---
@y
---
title: UndefinedVar
description: Variables should be defined before their use
aliases:
  - /go/dockerfile/rule/undefined-var/
---
@z

@x
## Output
@y
## Output
@z

@x
```text
Usage of undefined variable '$foo'
```
@y
```text
Usage of undefined variable '$foo'
```
@z

@x
## Description
@y
## Description
@z

@x
Before you reference an environment variable or a build argument in a `RUN`
instruction, you should ensure that the variable is declared in the Dockerfile,
using the `ARG` or `ENV` instructions.
@y
Before you reference an environment variable or a build argument in a `RUN`
instruction, you should ensure that the variable is declared in the Dockerfile,
using the `ARG` or `ENV` instructions.
@z

@x
Attempting to access an environment variable without explicitly declaring it
doesn't necessarily result in a build error, but it may yield an unexpected
result or an error later on in the build process.
@y
Attempting to access an environment variable without explicitly declaring it
doesn't necessarily result in a build error, but it may yield an unexpected
result or an error later on in the build process.
@z

@x
This check also attempts to detect if you're accessing a variable with a typo.
For example, given the following Dockerfile:
@y
This check also attempts to detect if you're accessing a variable with a typo.
For example, given the following Dockerfile:
@z

@x
```dockerfile
FROM alpine
ENV PATH=$PAHT:/app/bin
```
@y
```dockerfile
FROM alpine
ENV PATH=$PAHT:/app/bin
```
@z

@x
The check detects that `$PAHT` is undefined, and that it's probably a
misspelling of `PATH`.
@y
The check detects that `$PAHT` is undefined, and that it's probably a
misspelling of `PATH`.
@z

@x
```text
Usage of undefined variable '$PAHT' (did you mean $PATH?)
```
@y
```text
Usage of undefined variable '$PAHT' (did you mean $PATH?)
```
@z

@x
## Examples
@y
## Examples
@z

@x
❌ Bad: `$foo` is an undefined build argument.
@y
❌ Bad: `$foo` is an undefined build argument.
@z

@x
```dockerfile
FROM alpine AS base
COPY $foo .
```
@y
```dockerfile
FROM alpine AS base
COPY $foo .
```
@z

@x
✅ Good: declaring `foo` as a build argument before attempting to access it.
@y
✅ Good: declaring `foo` as a build argument before attempting to access it.
@z

@x
```dockerfile
FROM alpine AS base
ARG foo
COPY $foo .
```
@y
```dockerfile
FROM alpine AS base
ARG foo
COPY $foo .
```
@z
