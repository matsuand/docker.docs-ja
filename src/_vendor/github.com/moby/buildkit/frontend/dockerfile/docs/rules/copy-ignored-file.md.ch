%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: CopyIgnoredFile
description: Attempting to Copy file that is excluded by .dockerignore
aliases:
  - /go/dockerfile/rule/copy-ignored-file/
---
@y
---
title: CopyIgnoredFile
description: Attempting to Copy file that is excluded by .dockerignore
aliases:
  - /go/dockerfile/rule/copy-ignored-file/
---
@z

@x
## Output
@y
## Output
@z

@x
```text
Attempting to Copy file "./tmp/Dockerfile" that is excluded by .dockerignore
```
@y
```text
Attempting to Copy file "./tmp/Dockerfile" that is excluded by .dockerignore
```
@z

@x
## Description
@y
## Description
@z

@x
When you use the Add or Copy instructions from within a Dockerfile, you should
ensure that the files to be copied into the image do not match a pattern
present in `.dockerignore`.
@y
When you use the Add or Copy instructions from within a Dockerfile, you should
ensure that the files to be copied into the image do not match a pattern
present in `.dockerignore`.
@z

@x
Files which match the patterns in a `.dockerignore` file are not present in the
context of the image when it is built. Trying to copy or add a file which is
missing from the context will result in a build error.
@y
Files which match the patterns in a `.dockerignore` file are not present in the
context of the image when it is built. Trying to copy or add a file which is
missing from the context will result in a build error.
@z

@x
## Examples
@y
## Examples
@z

@x
With the given `.dockerignore` file:
@y
With the given `.dockerignore` file:
@z

@x
```text
*/tmp/*
```
@y
```text
*/tmp/*
```
@z

@x
❌ Bad: Attempting to Copy file "./tmp/Dockerfile" that is excluded by .dockerignore
@y
❌ Bad: Attempting to Copy file "./tmp/Dockerfile" that is excluded by .dockerignore
@z

@x
```dockerfile
FROM scratch
COPY ./tmp/helloworld.txt /helloworld.txt
```
@y
```dockerfile
FROM scratch
COPY ./tmp/helloworld.txt /helloworld.txt
```
@z

@x
✅ Good: Copying a file which is not excluded by .dockerignore
@y
✅ Good: Copying a file which is not excluded by .dockerignore
@z

@x
```dockerfile
FROM scratch
COPY ./forever/helloworld.txt /helloworld.txt
```
@y
```dockerfile
FROM scratch
COPY ./forever/helloworld.txt /helloworld.txt
```
@z
