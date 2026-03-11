%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

@x
title: Using Bake with additional contexts
linkTitle: Contexts
@y
title: Using Bake with additional contexts
linkTitle: Contexts
@z

@x
description: |
  Additional contexts are useful when you want to pin image versions,
  or reference the output of other targets
keywords: build, buildx, bake, buildkit, hcl
@y
description: |
  Additional contexts are useful when you want to pin image versions,
  or reference the output of other targets
keywords: build, buildx, bake, buildkit, hcl
@z

@x
In addition to the main `context` key that defines the build context, each
target can also define additional named contexts with a map defined with key
`contexts`. These values map to the `--build-context` flag in the [build
command](/reference/cli/docker/buildx/build/#build-context).
@y
In addition to the main `context` key that defines the build context, each
target can also define additional named contexts with a map defined with key
`contexts`. These values map to the `--build-context` flag in the [build
command](__SUBDIR__/reference/cli/docker/buildx/build/#build-context).
@z

@x
Inside the Dockerfile these contexts can be used with the `FROM` instruction or
`--from` flag.
@y
Inside the Dockerfile these contexts can be used with the `FROM` instruction or
`--from` flag.
@z

@x
Supported context values are:
@y
Supported context values are:
@z

@x
- Local filesystem directories
- Container images
- Git URLs
- HTTP URLs
- Name of another target in the Bake file
@y
- Local filesystem directories
- Container images
- Git URLs
- HTTP URLs
- Name of another target in the Bake file
@z

@x
## Pinning alpine image
@y
## Pinning alpine image
@z

% snip code...

@x
## Using a secondary source directory
@y
## Using a secondary source directory
@z

% snip code...

@x
## Using a target as a build context
@y
## Using a target as a build context
@z

@x
To use a result of one target as a build context of another, specify the target
name with `target:` prefix.
@y
To use a result of one target as a build context of another, specify the target
name with `target:` prefix.
@z

% snip code...

@x
In most cases you should just use a single multi-stage Dockerfile with multiple
targets for similar behavior. This case is only recommended when you have
multiple Dockerfiles that can't be easily merged into one.
@y
In most cases you should just use a single multi-stage Dockerfile with multiple
targets for similar behavior. This case is only recommended when you have
multiple Dockerfiles that can't be easily merged into one.
@z
