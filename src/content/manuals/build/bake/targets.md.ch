%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: Bake targets
linkTitle: Targets
@y
title: Bake targets
linkTitle: Targets
@z

@x
description: Learn how to define and use targets in Bake
keywords: bake, target, targets, buildx, docker, buildkit, default
@y
description: Learn how to define and use targets in Bake
keywords: bake, target, targets, buildx, docker, buildkit, default
@z

@x
A target in a Bake file represents a build invocation. It holds all the
information you would normally pass to a `docker build` command using flags.
@y
A target in a Bake file represents a build invocation. It holds all the
information you would normally pass to a `docker build` command using flags.
@z

% snip code...

@x
To build a target with Bake, pass name of the target to the `bake` command.
@y
To build a target with Bake, pass name of the target to the `bake` command.
@z

% snip command...

@x
You can build multiple targets at once by passing multiple target names to the
`bake` command.
@y
You can build multiple targets at once by passing multiple target names to the
`bake` command.
@z

% snip command...

@x
## Default target
@y
## Default target
@z

@x
If you don't specify a target when running `docker buildx bake`, Bake will
build the target named `default`.
@y
If you don't specify a target when running `docker buildx bake`, Bake will
build the target named `default`.
@z

% snip code...

@x
To build this target, run `docker buildx bake` without any arguments:
@y
To build this target, run `docker buildx bake` without any arguments:
@z

% snip command...

@x
## Target properties
@y
## Target properties
@z

@x
The properties you can set for a target closely resemble the CLI flags for
`docker build`, with a few additional properties that are specific to Bake.
@y
The properties you can set for a target closely resemble the CLI flags for
`docker build`, with a few additional properties that are specific to Bake.
@z

@x
For all the properties you can set for a target, see the [Bake reference](/build/bake/reference#target).
@y
For all the properties you can set for a target, see the [Bake reference](__SUBDIR__/build/bake/reference#target).
@z

@x
## Grouping targets
@y
## Grouping targets
@z

@x
You can group targets together using the `group` block. This is useful when you
want to build multiple targets at once.
@y
You can group targets together using the `group` block. This is useful when you
want to build multiple targets at once.
@z

% snip code...

@x
To build all the targets in a group, pass the name of the group to the `bake`
command.
@y
To build all the targets in a group, pass the name of the group to the `bake`
command.
@z

% snip command...

@x
## Additional resources
@y
## Additional resources
@z

@x
Refer to the following pages to learn more about Bake's features:
@y
Refer to the following pages to learn more about Bake's features:
@z

@x
- Learn how to use [variables](./variables.md) in Bake to make your build
  configuration more flexible.
- Learn how you can use matrices to build multiple images with different
  configurations in [Matrices](./matrices.md).
- Head to the [Bake file reference](/build/bake/reference/) to learn about all
  the properties you can set in a Bake file, and its syntax.
@y
- Learn how to use [variables](./variables.md) in Bake to make your build
  configuration more flexible.
- Learn how you can use matrices to build multiple images with different
  configurations in [Matrices](./matrices.md).
- Head to the [Bake file reference](__SUBDIR__/build/bake/reference/) to learn about all
  the properties you can set in a Bake file, and its syntax.
@z
