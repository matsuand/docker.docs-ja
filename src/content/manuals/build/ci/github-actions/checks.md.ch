%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Validating build configuration with GitHub Actions
linkTitle: Build checks
description: Discover how to validate your build configuration and identify best practice violations using build checks in GitHub Actions.
keywords: github actions, gha, build, checks
@y
title: Validating build configuration with GitHub Actions
linkTitle: Build checks
description: Discover how to validate your build configuration and identify best practice violations using build checks in GitHub Actions.
keywords: github actions, gha, build, checks
@z

@x
[Build checks](/manuals/build/checks.md) let you validate your `docker build`
configuration without actually running the build.
@y
[Build checks](manuals/build/checks.md) let you validate your `docker build`
configuration without actually running the build.
@z

@x
## Run checks with `docker/build-push-action`
@y
## Run checks with `docker/build-push-action`
@z

@x
To run build checks in a GitHub Actions workflow with the `build-push-action`,
set the `call` input parameter to `check`. With this set, the workflow fails if
any check warnings are detected for your build's configuration.
@y
To run build checks in a GitHub Actions workflow with the `build-push-action`,
set the `call` input parameter to `check`. With this set, the workflow fails if
any check warnings are detected for your build's configuration.
@z

% snip code...

@x
## Run checks with `docker/bake-action`
@y
## Run checks with `docker/bake-action`
@z

@x
If you're using Bake and `docker/bake-action` to run your builds, you don't
need to specify any special inputs in your GitHub Actions workflow
configuration. Instead, define a Bake target that calls the `check` method,
and invoke that target in your CI.
@y
If you're using Bake and `docker/bake-action` to run your builds, you don't
need to specify any special inputs in your GitHub Actions workflow
configuration. Instead, define a Bake target that calls the `check` method,
and invoke that target in your CI.
@z

% snip code...

@x
### Using the `call` input directly
@y
### Using the `call` input directly
@z

@x
You can also set the build method with the `call` input which is equivalent to using the `--call` flag with `docker buildx bake`
@y
You can also set the build method with the `call` input which is equivalent to using the `--call` flag with `docker buildx bake`
@z

@x
For example, to run a check without defining `call` in your Bake file:
@y
For example, to run a check without defining `call` in your Bake file:
@z

% snip code...
