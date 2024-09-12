%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Copy image between registries with GitHub Actions
linkTitle: Copy image between registries
@y
title: GitHub Actions を使ったレジストリ間のイメージコピー
linkTitle: Copy image between registries
@z

@x
description: Build multi-platform images and copy them between registries with GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx, registry
@y
description: Build multi-platform images and copy them between registries with GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx, registry
@z

@x
[Multi-platform images](../../building/multi-platform.md) built using Buildx can
be copied from one registry to another using the [`buildx imagetools create` command](/reference/cli/docker/buildx/imagetools/create.md):
@y
Buildx を用いてビルドした [マルチプラットフォームイメージ](../../building/multi-platform.md) は、[`buildx imagetools create`](reference/cli/docker/buildx/imagetools/create.md) コマンドによりレジストリ間でコピーすることができます。
@z

% snip code...
