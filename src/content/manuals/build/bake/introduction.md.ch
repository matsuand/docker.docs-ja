%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: Introduction to Bake
linkTitle: Introduction
@y
title: Introduction to Bake
linkTitle: Introduction
@z

@x
description: Get started with using Bake to build your project
keywords: bake, quickstart, build, project, introduction, getting started
@y
description: Get started with using Bake to build your project
keywords: bake, quickstart, build, project, introduction, getting started
@z

@x
Bake is an abstraction for the `docker build` command that lets you more easily
manage your build configuration (CLI flags, environment variables, etc.) in a
consistent way for everyone on your team.
@y
Bake is an abstraction for the `docker build` command that lets you more easily
manage your build configuration (CLI flags, environment variables, etc.) in a
consistent way for everyone on your team.
@z

@x
Bake is a command built into the Buildx CLI, so as long as you have Buildx
installed, you also have access to bake, via the `docker buildx bake` command.
@y
Bake is a command built into the Buildx CLI, so as long as you have Buildx
installed, you also have access to bake, via the `docker buildx bake` command.
@z

@x
## Building a project with Bake
@y
## Building a project with Bake
@z

@x
Here's a simple example of a `docker build` command:
@y
Here's a simple example of a `docker build` command:
@z

% snip command...

@x
This command builds the Dockerfile in the current directory and tags the
resulting image as `myapp:latest`.
@y
This command builds the Dockerfile in the current directory and tags the
resulting image as `myapp:latest`.
@z

@x
To express the same build configuration using Bake:
@y
To express the same build configuration using Bake:
@z

% snip code...

@x
Bake provides a structured way to manage your build configuration, and it saves
you from having to remember all the CLI flags for `docker build` every time.
With this file, building the image is as simple as running:
@y
Bake provides a structured way to manage your build configuration, and it saves
you from having to remember all the CLI flags for `docker build` every time.
With this file, building the image is as simple as running:
@z

% snip command...

@x
For simple builds, the difference between `docker build` and `docker buildx
bake` is minimal. However, as your build configuration grows more complex, Bake
provides a more structured way to manage that complexity, that would be
difficult to manage with CLI flags for the `docker build`. It also provides a
way to share build configurations across your team, so that everyone is
building images in a consistent way, with the same configuration.
@y
For simple builds, the difference between `docker build` and `docker buildx
bake` is minimal. However, as your build configuration grows more complex, Bake
provides a more structured way to manage that complexity, that would be
difficult to manage with CLI flags for the `docker build`. It also provides a
way to share build configurations across your team, so that everyone is
building images in a consistent way, with the same configuration.
@z

@x
## The Bake file format
@y
## The Bake file format
@z

@x
You can write Bake files in HCL, YAML (Docker Compose files), or JSON. In
general, HCL is the most expressive and flexible format, which is why you'll
see it used in most of the examples in this documentation, and in projects that
use Bake.
@y
You can write Bake files in HCL, YAML (Docker Compose files), or JSON. In
general, HCL is the most expressive and flexible format, which is why you'll
see it used in most of the examples in this documentation, and in projects that
use Bake.
@z

@x
The properties that can be set for a target closely resemble the CLI flags for
`docker build`. For instance, consider the following `docker build` command:
@y
The properties that can be set for a target closely resemble the CLI flags for
`docker build`. For instance, consider the following `docker build` command:
@z

% snip command...

@x
The Bake equivalent would be:
@y
The Bake equivalent would be:
@z

% snip code...

@x
## Next steps
@y
## Next steps
@z

@x
To learn more about using Bake, see the following topics:
@y
To learn more about using Bake, see the following topics:
@z

@x
- Learn how to define and use [targets](./targets.md) in Bake
- To see all the properties that can be set for a target, refer to the
  [Bake file reference](/build/bake/reference/).
@y
- Learn how to define and use [targets](./targets.md) in Bake
- To see all the properties that can be set for a target, refer to the
  [Bake file reference](__SUBDIR__/build/bake/reference/).
@z
