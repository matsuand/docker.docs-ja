%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: Build cache invalidation
description: Dig into the details abouw how cache invalidation works for Docker's build cache
keywords: build, buildx, buildkit, cache, invalidation, cache miss
@y
title: Build cache invalidation
description: Dig into the details abouw how cache invalidation works for Docker's build cache
keywords: build, buildx, buildkit, cache, invalidation, cache miss
@z

@x
When building an image, Docker steps through the instructions in your
Dockerfile, executing each in the order specified. For each instruction, Docker
checks whether it can reuse the instruction from the build cache.
@y
When building an image, Docker steps through the instructions in your
Dockerfile, executing each in the order specified. For each instruction, Docker
checks whether it can reuse the instruction from the build cache.
@z

@x
## General rules
@y
## 一般的ルール {#General-rules}
@z

@x
The basic rules of build cache invalidation are as follows:
@y
The basic rules of build cache invalidation are as follows:
@z

@x
- Starting with a parent image that's already in the cache, the next
  instruction is compared against all child images derived from that base
  image to see if one of them was built using the exact same instruction. If
  not, the cache is invalidated.
@y
- Starting with a parent image that's already in the cache, the next
  instruction is compared against all child images derived from that base
  image to see if one of them was built using the exact same instruction. If
  not, the cache is invalidated.
@z

@x
- In most cases, simply comparing the instruction in the Dockerfile with one
  of the child images is sufficient. However, certain instructions require more
  examination and explanation.
@y
- In most cases, simply comparing the instruction in the Dockerfile with one
  of the child images is sufficient. However, certain instructions require more
  examination and explanation.
@z

@x
- For the `ADD` and `COPY` instructions, the modification time and size file
  metadata is used to determine whether cache is valid. During cache lookup,
  cache is invalidated if the file metadata has changed for any of the files
  involved.
@y
- For the `ADD` and `COPY` instructions, the modification time and size file
  metadata is used to determine whether cache is valid. During cache lookup,
  cache is invalidated if the file metadata has changed for any of the files
  involved.
@z

@x
- Aside from the `ADD` and `COPY` commands, cache checking doesn't look at the
  files in the container to determine a cache match. For example, when processing
  a `RUN apt-get -y update` command the files updated in the container
  aren't examined to determine if a cache hit exists. In that case just
  the command string itself is used to find a match.
@y
- Aside from the `ADD` and `COPY` commands, cache checking doesn't look at the
  files in the container to determine a cache match. For example, when processing
  a `RUN apt-get -y update` command the files updated in the container
  aren't examined to determine if a cache hit exists. In that case just
  the command string itself is used to find a match.
@z

@x
Once the cache is invalidated, all subsequent Dockerfile commands generate new
images and the cache isn't used.
@y
Once the cache is invalidated, all subsequent Dockerfile commands generate new
images and the cache isn't used.
@z

@x
If your build contains several layers and you want to ensure the build cache is
reusable, order the instructions from less frequently changed to more
frequently changed where possible.
@y
If your build contains several layers and you want to ensure the build cache is
reusable, order the instructions from less frequently changed to more
frequently changed where possible.
@z

@x
## RUN instructions
@y
## RUN 命令 {#run-instructions}
@z

@x
The cache for `RUN` instructions isn't invalidated automatically between builds.
Suppose you have a step in your Dockerfile to install `curl`:
@y
The cache for `RUN` instructions isn't invalidated automatically between builds.
Suppose you have a step in your Dockerfile to install `curl`:
@z

% snip code...

@x
This doesn't mean that the version of `curl` in your image is always up-to-date.
Rebuilding the image one week later will still get you the same packages as before.
To force a re-execution of the `RUN` instruction, you can:
@y
This doesn't mean that the version of `curl` in your image is always up-to-date.
Rebuilding the image one week later will still get you the same packages as before.
To force a re-execution of the `RUN` instruction, you can:
@z

@x
- Make sure that a layer before it has changed
- Clear the build cache ahead of the build using
  [`docker builder prune`](../../reference/cli/docker/builder/prune.md)
- Use the `--no-cache` or `--no-cache-filter` options
@y
- Make sure that a layer before it has changed
- Clear the build cache ahead of the build using
  [`docker builder prune`](../../reference/cli/docker/builder/prune.md)
- Use the `--no-cache` or `--no-cache-filter` options
@z

@x
The `--no-cache-filter` option lets you specify a specific build stage to
invalidate the cache for:
@y
The `--no-cache-filter` option lets you specify a specific build stage to
invalidate the cache for:
@z

% snip command...

@x
## Build secrets
@y
## Build secrets
@z

@x
The contents of build secrets are not part of the build cache.
Changing the value of a secret doesn't result in cache invalidation.
@y
The contents of build secrets are not part of the build cache.
Changing the value of a secret doesn't result in cache invalidation.
@z

@x
If you want to force cache invalidation after changing a secret value,
you can pass a build argument with an arbitrary value that you also change when changing the secret.
Build arguments do result in cache invalidation.
@y
If you want to force cache invalidation after changing a secret value,
you can pass a build argument with an arbitrary value that you also change when changing the secret.
Build arguments do result in cache invalidation.
@z

% snip code...
% snip command...

@x
Properties of secrets such as IDs and mount paths do participate in the cache
checksum, and result in cache invalidation if changed.
@y
Properties of secrets such as IDs and mount paths do participate in the cache
checksum, and result in cache invalidation if changed.
@z
