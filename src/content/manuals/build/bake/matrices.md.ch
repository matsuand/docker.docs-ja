%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Matrix targets
@y
title: Matrix targets
@z

@x
description: Learn how to define and use matrix targets in Bake to fork a single target into multiple different variants
keywords: build, buildx, bake, buildkit, matrix, hcl, json
@y
description: Learn how to define and use matrix targets in Bake to fork a single target into multiple different variants
keywords: build, buildx, bake, buildkit, matrix, hcl, json
@z

@x
A matrix strategy lets you fork a single target into multiple different
variants, based on parameters that you specify. This works in a similar way to
[Matrix strategies for GitHub Actions](https://docs.github.com/en/actions/using-jobs/using-a-matrix-for-your-jobs).
You can use this to reduce duplication in your Bake definition.
@y
A matrix strategy lets you fork a single target into multiple different
variants, based on parameters that you specify. This works in a similar way to
[Matrix strategies for GitHub Actions](https://docs.github.com/en/actions/using-jobs/using-a-matrix-for-your-jobs).
You can use this to reduce duplication in your Bake definition.
@z

@x
The matrix attribute is a map of parameter names to lists of values. Bake
builds each possible combination of values as a separate target.
@y
The matrix attribute is a map of parameter names to lists of values. Bake
builds each possible combination of values as a separate target.
@z

@x
Each generated target must have a unique name. To specify how target names
should resolve, use the name attribute.
@y
Each generated target must have a unique name. To specify how target names
should resolve, use the name attribute.
@z

@x
The following example resolves the app target to `app-foo` and `app-bar`. It
also uses the matrix value to define the [target build stage](/build/bake/reference/#targettarget).
@y
The following example resolves the app target to `app-foo` and `app-bar`. It
also uses the matrix value to define the [target build stage](__SUBDIR__/build/bake/reference/#targettarget).
@z

% snip code...
% snip command...

@x
## Multiple axes
@y
## Multiple axes
@z

@x
You can specify multiple keys in your matrix to fork a target on multiple axes.
When using multiple matrix keys, Bake builds every possible variant.
@y
You can specify multiple keys in your matrix to fork a target on multiple axes.
When using multiple matrix keys, Bake builds every possible variant.
@z

@x
The following example builds four targets:
@y
The following example builds four targets:
@z

@x
- `app-foo-1-0`
- `app-foo-2-0`
- `app-bar-1-0`
- `app-bar-2-0`
@y
- `app-foo-1-0`
- `app-foo-2-0`
- `app-bar-1-0`
- `app-bar-2-0`
@z

% snip code...

@x
## Multiple values per matrix target
@y
## Multiple values per matrix target
@z

@x
If you want to differentiate the matrix on more than just a single value, you
can use maps as matrix values. Bake creates a target for each map, and you can
access the nested values using dot notation.
@y
If you want to differentiate the matrix on more than just a single value, you
can use maps as matrix values. Bake creates a target for each map, and you can
access the nested values using dot notation.
@z

@x
The following example builds two targets:
@y
The following example builds two targets:
@z

@x
- `app-foo-1-0`
- `app-bar-2-0`
@y
- `app-foo-1-0`
- `app-bar-2-0`
@z

% snip code...
