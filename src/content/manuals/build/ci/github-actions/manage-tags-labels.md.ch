%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: Manage tags and labels with GitHub Actions
linkTitle: Tags and labels
description: Assign tags and labels to images automatically with GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx, tags, labels
@y
title: Manage tags and labels with GitHub Actions
linkTitle: Tags and labels
description: Assign tags and labels to images automatically with GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx, tags, labels
@z

@x
If you want an "automatic" tag management and [OCI Image Format Specification](https://github.com/opencontainers/image-spec/blob/master/annotations.md)
for labels, you can do it in a dedicated setup step. The following workflow
will use the [Docker Metadata Action](https://github.com/docker/metadata-action)
to handle tags and labels based on GitHub Actions events and Git metadata:
@y
If you want an "automatic" tag management and [OCI Image Format Specification](https://github.com/opencontainers/image-spec/blob/master/annotations.md)
for labels, you can do it in a dedicated setup step. The following workflow
will use the [Docker Metadata Action](https://github.com/docker/metadata-action)
to handle tags and labels based on GitHub Actions events and Git metadata:
@z

% snip code...
