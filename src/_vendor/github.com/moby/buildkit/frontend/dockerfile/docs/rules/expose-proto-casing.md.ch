%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: ExposeProtoCasing
description: >-
  Protocol in EXPOSE instruction should be lowercase
aliases:
  - /go/dockerfile/rule/expose-proto-casing/
---
@y
---
title: ExposeProtoCasing
description: >-
  Protocol in EXPOSE instruction should be lowercase
aliases:
  - /go/dockerfile/rule/expose-proto-casing/
---
@z

@x
## Output
@y
## Output
@z

@x
```text
Defined protocol '80/TcP' in EXPOSE instruction should be lowercase
```
@y
```text
Defined protocol '80/TcP' in EXPOSE instruction should be lowercase
```
@z

@x
## Description
@y
## Description
@z

@x
Protocol names in the [`EXPOSE`](https://docs.docker.com/reference/dockerfile/#expose)
instruction should be specified in lowercase to maintain consistency and
readability. This rule checks for protocols that are not in lowercase and
reports them.
@y
Protocol names in the [`EXPOSE`](https://docs.docker.com/reference/dockerfile/#expose)
instruction should be specified in lowercase to maintain consistency and
readability. This rule checks for protocols that are not in lowercase and
reports them.
@z

@x
## Examples
@y
## Examples
@z

@x
❌ Bad: protocol is not in lowercase.
@y
❌ Bad: protocol is not in lowercase.
@z

@x
```dockerfile
FROM alpine
EXPOSE 80/TcP
```
@y
```dockerfile
FROM alpine
EXPOSE 80/TcP
```
@z

@x
✅ Good: protocol is in lowercase.
@y
✅ Good: protocol is in lowercase.
@z

@x
```dockerfile
FROM alpine
EXPOSE 80/tcp
```
@y
```dockerfile
FROM alpine
EXPOSE 80/tcp
```
@z
