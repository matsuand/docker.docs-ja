%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: MultipleInstructionsDisallowed
description: >-
  Multiple instructions of the same type should not be used in the same stage
@y
title: MultipleInstructionsDisallowed
description: >-
  Multiple instructions of the same type should not be used in the same stage
@z

@x
## Output
@y
## Output
@z

@x
```text
Multiple CMD instructions should not be used in the same stage because only the last one will be used
```
@y
```text
Multiple CMD instructions should not be used in the same stage because only the last one will be used
```
@z

@x
## Description
@y
## Description
@z

@x
If you have multiple `CMD`, `HEALTHCHECK`, or `ENTRYPOINT` instructions in your
Dockerfile, only the last occurrence is used. An image can only ever have one
`CMD`, `HEALTHCHECK`, and `ENTRYPOINT`.
@y
If you have multiple `CMD`, `HEALTHCHECK`, or `ENTRYPOINT` instructions in your
Dockerfile, only the last occurrence is used. An image can only ever have one
`CMD`, `HEALTHCHECK`, and `ENTRYPOINT`.
@z

@x
## Examples
@y
## Examples
@z

@x
❌ Bad: Duplicate instructions.
@y
❌ Bad: Duplicate instructions.
@z

@x
```dockerfile
FROM alpine
ENTRYPOINT ["echo", "Hello, Norway!"]
ENTRYPOINT ["echo", "Hello, Sweden!"]
# Only "Hello, Sweden!" will be printed
```
@y
```dockerfile
FROM alpine
ENTRYPOINT ["echo", "Hello, Norway!"]
ENTRYPOINT ["echo", "Hello, Sweden!"]
# Only "Hello, Sweden!" will be printed
```
@z

@x
✅ Good: only one `ENTRYPOINT` instruction.
@y
✅ Good: only one `ENTRYPOINT` instruction.
@z

@x
```dockerfile
FROM alpine
ENTRYPOINT ["echo", "Hello, Norway!\nHello, Sweden!"]
```
@y
```dockerfile
FROM alpine
ENTRYPOINT ["echo", "Hello, Norway!\nHello, Sweden!"]
```
@z

@x
You can have both a regular, top-level `CMD`
and a separate `CMD` for a `HEALTHCHECK` instruction.
@y
You can have both a regular, top-level `CMD`
and a separate `CMD` for a `HEALTHCHECK` instruction.
@z

@x
✅ Good: only one top-level `CMD` instruction.
@y
✅ Good: only one top-level `CMD` instruction.
@z

@x
```dockerfile
FROM python:alpine
RUN apk add curl
HEALTHCHECK --interval=1s --timeout=3s \
  CMD ["curl", "-f", "http://localhost:8080"]
CMD ["python", "-m", "http.server", "8080"]
```
@y
```dockerfile
FROM python:alpine
RUN apk add curl
HEALTHCHECK --interval=1s --timeout=3s \
  CMD ["curl", "-f", "http://localhost:8080"]
CMD ["python", "-m", "http.server", "8080"]
```
@z
