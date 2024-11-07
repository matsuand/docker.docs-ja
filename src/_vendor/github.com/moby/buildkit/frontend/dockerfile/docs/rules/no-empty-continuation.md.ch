%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: NoEmptyContinuation
description: >-
  Empty continuation lines will become errors in a future release
@y
title: NoEmptyContinuation
description: >-
  Empty continuation lines will become errors in a future release
@z

@x
## Output
@y
## Output
@z

@x
```text
Empty continuation line found in: RUN apk add     gnupg     curl
```
@y
```text
Empty continuation line found in: RUN apk add     gnupg     curl
```
@z

@x
## Description
@y
## Description
@z

@x
Support for empty continuation (`/`) lines have been deprecated and will
generate errors in future versions of the Dockerfile syntax.
@y
Support for empty continuation (`/`) lines have been deprecated and will
generate errors in future versions of the Dockerfile syntax.
@z

@x
Empty continuation lines are empty lines following a newline escape:
@y
Empty continuation lines are empty lines following a newline escape:
@z

@x
```dockerfile
FROM alpine
RUN apk add \
@y
```dockerfile
FROM alpine
RUN apk add \
@z

@x
    gnupg \
@y
    gnupg \
@z

@x
    curl
```
@y
    curl
```
@z

@x
Support for such empty lines is deprecated, and a future BuildKit release will
remove support for this syntax entirely, causing builds to break. To avoid
future errors, remove the empty lines, or add comments, since lines with
comments aren't considered empty.
@y
Support for such empty lines is deprecated, and a future BuildKit release will
remove support for this syntax entirely, causing builds to break. To avoid
future errors, remove the empty lines, or add comments, since lines with
comments aren't considered empty.
@z

@x
## Examples
@y
## Examples
@z

@x
❌ Bad: empty continuation line between `EXPOSE` and 80.
@y
❌ Bad: empty continuation line between `EXPOSE` and 80.
@z

@x
```dockerfile
FROM alpine
EXPOSE \
@y
```dockerfile
FROM alpine
EXPOSE \
@z

@x
80
```
@y
80
```
@z

@x
✅ Good: comments do not count as empty lines.
@y
✅ Good: comments do not count as empty lines.
@z

@x
```dockerfile
FROM alpine
EXPOSE \
# Port
80
```
@y
```dockerfile
FROM alpine
EXPOSE \
# Port
80
```
@z
