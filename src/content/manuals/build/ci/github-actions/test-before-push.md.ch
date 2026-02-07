%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: Test before push with GitHub Actions
linkTitle: Test before push
description: Here's how you can validate an image, before pushing it to a registry
keywords: ci, github actions, gha, buildkit, buildx, test
@y
title: Test before push with GitHub Actions
linkTitle: Test before push
description: Here's how you can validate an image, before pushing it to a registry
keywords: ci, github actions, gha, buildkit, buildx, test
@z

@x
In some cases, you might want to validate that the image works as expected
before pushing it. The following workflow implements several steps to achieve
this:
@y
In some cases, you might want to validate that the image works as expected
before pushing it. The following workflow implements several steps to achieve
this:
@z

@x
1. Build and export the image to Docker
2. Test your image
3. Multi-platform build and push the image
@y
1. Build and export the image to Docker
2. Test your image
3. Multi-platform build and push the image
@z

% snip code...

@x
> [!NOTE]
>
> The `linux/amd64` image is only built once in this workflow. The image is
> built once, and the following steps use the internal cache from the first
> `Build and push` step. The second `Build and push` step only builds
> `linux/arm64`.
@y
> [!NOTE]
>
> The `linux/amd64` image is only built once in this workflow. The image is
> built once, and the following steps use the internal cache from the first
> `Build and push` step. The second `Build and push` step only builds
> `linux/arm64`.
@z
