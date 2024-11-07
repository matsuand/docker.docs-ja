%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: DuplicateStageName
description: >-
  Stage names should be unique
@y
title: DuplicateStageName
description: >-
  Stage names should be unique
@z

@x
## Output
@y
## Output
@z

@x
```text
Duplicate stage name 'foo-base', stage names should be unique
```
@y
```text
Duplicate stage name 'foo-base', stage names should be unique
```
@z

@x
## Description
@y
## Description
@z

@x
Defining multiple stages with the same name results in an error because the
builder is unable to uniquely resolve the stage name reference.
@y
Defining multiple stages with the same name results in an error because the
builder is unable to uniquely resolve the stage name reference.
@z

@x
## Examples
@y
## Examples
@z

@x
❌ Bad: `builder` is declared as a stage name twice.
@y
❌ Bad: `builder` is declared as a stage name twice.
@z

@x
```dockerfile
FROM debian:latest AS builder
RUN apt-get update; apt-get install -y curl
@y
```dockerfile
FROM debian:latest AS builder
RUN apt-get update; apt-get install -y curl
@z

@x
FROM golang:latest AS builder
```
@y
FROM golang:latest AS builder
```
@z

@x
✅ Good: stages have unique names.
@y
✅ Good: stages have unique names.
@z

@x
```dockerfile
FROM debian:latest AS deb-builder
RUN apt-get update; apt-get install -y curl
@y
```dockerfile
FROM debian:latest AS deb-builder
RUN apt-get update; apt-get install -y curl
@z

@x
FROM golang:latest AS go-builder
```
@y
FROM golang:latest AS go-builder
```
@z
