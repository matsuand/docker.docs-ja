%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: InvalidDefinitionDescription
description: >-
  Comment for build stage or argument should follow the format: `# <arg/stage name> <description>`. If this is not intended to be a description comment, add an empty line or comment between the instruction and the comment.
@y
title: InvalidDefinitionDescription
description: >-
  Comment for build stage or argument should follow the format: `# <arg/stage name> <description>`. If this is not intended to be a description comment, add an empty line or comment between the instruction and the comment.
@z

@x
> [!NOTE]
> This check is experimental and is not enabled by default. To enable it, see
> [Experimental checks](https://docs.docker.com/go/build-checks-experimental/).
@y
> [!NOTE]
> This check is experimental and is not enabled by default. To enable it, see
> [Experimental checks](https://docs.docker.com/go/build-checks-experimental/).
@z

@x
## Output
@y
## Output
@z

@x
```text
Comment for build stage or argument should follow the format: `# <arg/stage name> <description>`. If this is not intended to be a description comment, add an empty line or comment between the instruction and the comment.
```
@y
```text
Comment for build stage or argument should follow the format: `# <arg/stage name> <description>`. If this is not intended to be a description comment, add an empty line or comment between the instruction and the comment.
```
@z

@x
## Description
@y
## Description
@z

@x
The [`--call=outline`](https://docs.docker.com/reference/cli/docker/buildx/build/#call-outline)
and [`--call=targets`](https://docs.docker.com/reference/cli/docker/buildx/build/#call-outline)
flags for the `docker build` command print descriptions for build targets and arguments.
The descriptions are generated from [Dockerfile comments](https://docs.docker.com/reference/cli/docker/buildx/build/#descriptions)
that immediately precede the `FROM` or `ARG` instruction
and that begin with the name of the build stage or argument.
For example:
@y
The [`--call=outline`](https://docs.docker.com/reference/cli/docker/buildx/build/#call-outline)
and [`--call=targets`](https://docs.docker.com/reference/cli/docker/buildx/build/#call-outline)
flags for the `docker build` command print descriptions for build targets and arguments.
The descriptions are generated from [Dockerfile comments](https://docs.docker.com/reference/cli/docker/buildx/build/#descriptions)
that immediately precede the `FROM` or `ARG` instruction
and that begin with the name of the build stage or argument.
For example:
@z

@x
```dockerfile
# build-cli builds the CLI binary
FROM alpine AS build-cli
# VERSION controls the version of the program
ARG VERSION=1
```
@y
```dockerfile
# build-cli builds the CLI binary
FROM alpine AS build-cli
# VERSION controls the version of the program
ARG VERSION=1
```
@z

@x
In cases where preceding comments are not meant to be descriptions,
add an empty line or comment between the instruction and the preceding comment.
@y
In cases where preceding comments are not meant to be descriptions,
add an empty line or comment between the instruction and the preceding comment.
@z

@x
## Examples
@y
## Examples
@z

@x
❌ Bad: A non-descriptive comment on the line preceding the `FROM` command.
@y
❌ Bad: A non-descriptive comment on the line preceding the `FROM` command.
@z

@x
```dockerfile
# a non-descriptive comment
FROM scratch AS base
@y
```dockerfile
# a non-descriptive comment
FROM scratch AS base
@z

@x
# another non-descriptive comment
ARG VERSION=1
```
@y
# another non-descriptive comment
ARG VERSION=1
```
@z

@x
✅ Good: An empty line separating non-descriptive comments.
@y
✅ Good: An empty line separating non-descriptive comments.
@z

@x
```dockerfile
# a non-descriptive comment
@y
```dockerfile
# a non-descriptive comment
@z

@x
FROM scratch AS base
@y
FROM scratch AS base
@z

@x
# another non-descriptive comment
@y
# another non-descriptive comment
@z

@x
ARG VERSION=1
```
@y
ARG VERSION=1
```
@z

@x
✅ Good: Comments describing `ARG` keys and stages immediately proceeding the command.
@y
✅ Good: Comments describing `ARG` keys and stages immediately proceeding the command.
@z

@x
```dockerfile
# base is a stage for compiling source
FROM scratch AS base
# VERSION This is the version number.
ARG VERSION=1
```
@y
```dockerfile
# base is a stage for compiling source
FROM scratch AS base
# VERSION This is the version number.
ARG VERSION=1
```
@z
