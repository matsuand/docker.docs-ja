%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: LegacyKeyValueFormat
description: Legacy key/value format with whitespace separator should not be used
aliases:
  - /go/dockerfile/rule/legacy-key-value-format/
---
@y
---
title: LegacyKeyValueFormat
description: Legacy key/value format with whitespace separator should not be used
aliases:
  - /go/dockerfile/rule/legacy-key-value-format/
---
@z

@x
## Output
@y
## Output
@z

@x
```text
"ENV key=value" should be used instead of legacy "ENV key value" format
```
@y
```text
"ENV key=value" should be used instead of legacy "ENV key value" format
```
@z

@x
## Description
@y
## Description
@z

@x
The correct format for declaring environment variables and build arguments in a
Dockerfile is `ENV key=value` and `ARG key=value`, where the variable name
(`key`) and value (`value`) are separated by an equals sign (`=`).
Historically, Dockerfiles have also supported a space separator between the key
and the value (for example, `ARG key value`). This legacy format is deprecated,
and you should only use the format with the equals sign.
@y
The correct format for declaring environment variables and build arguments in a
Dockerfile is `ENV key=value` and `ARG key=value`, where the variable name
(`key`) and value (`value`) are separated by an equals sign (`=`).
Historically, Dockerfiles have also supported a space separator between the key
and the value (for example, `ARG key value`). This legacy format is deprecated,
and you should only use the format with the equals sign.
@z

@x
## Examples
@y
## Examples
@z

@x
❌ Bad: using a space separator for variable key and value.
@y
❌ Bad: using a space separator for variable key and value.
@z

@x
```dockerfile
FROM alpine
ARG foo bar
```
@y
```dockerfile
FROM alpine
ARG foo bar
```
@z

@x
✅ Good: use an equals sign to separate key and value.
@y
✅ Good: use an equals sign to separate key and value.
@z

@x
```dockerfile
FROM alpine
ARG foo=bar
```
@y
```dockerfile
FROM alpine
ARG foo=bar
```
@z
