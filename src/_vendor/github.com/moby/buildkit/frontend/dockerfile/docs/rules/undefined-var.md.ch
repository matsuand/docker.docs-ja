%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: UndefinedVar
description: >-
  Variables should be defined before their use
@y
title: UndefinedVar
description: >-
  Variables should be defined before their use
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
This check ensures that environment variables and build arguments are correctly
declared before being used. While undeclared variables might not cause an
immediate build failure, they can lead to unexpected behavior or errors later
in the build process.
@y
This check ensures that environment variables and build arguments are correctly
declared before being used. While undeclared variables might not cause an
immediate build failure, they can lead to unexpected behavior or errors later
in the build process.
@z

@x
This check does not evaluate undefined variables for `RUN`, `CMD`, and
`ENTRYPOINT` instructions where you use the [shell form](https://docs.docker.com/reference/dockerfile/#shell-form).
That's because when you use shell form, variables are resolved by the command
shell.
@y
This check does not evaluate undefined variables for `RUN`, `CMD`, and
`ENTRYPOINT` instructions where you use the [shell form](https://docs.docker.com/reference/dockerfile/#shell-form).
That's because when you use shell form, variables are resolved by the command
shell.
@z

@x
It also detects common mistakes like typos in variable names. For example, in
the following Dockerfile:
@y
It also detects common mistakes like typos in variable names. For example, in
the following Dockerfile:
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
The check identifies that `$PAHT` is undefined and likely a typo for `$PATH`:
@y
The check identifies that `$PAHT` is undefined and likely a typo for `$PATH`:
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

@x
❌ Bad: `$foo` is undefined.
@y
❌ Bad: `$foo` is undefined.
@z

@x
```dockerfile
FROM alpine AS base
ARG VERSION=$foo
```
@y
```dockerfile
FROM alpine AS base
ARG VERSION=$foo
```
@z

@x
✅ Good: the base image defines `$PYTHON_VERSION`
@y
✅ Good: the base image defines `$PYTHON_VERSION`
@z

@x
```dockerfile
FROM python AS base
ARG VERSION=$PYTHON_VERSION
```
@y
```dockerfile
FROM python AS base
ARG VERSION=$PYTHON_VERSION
```
@z
