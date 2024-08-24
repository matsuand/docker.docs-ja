%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Add image annotations with GitHub Actions
description: Add OCI annotations to image components using GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx, annotations, oci
@y
title: GitHub Actions を使ったイメージアノテーションの追加
description: Add OCI annotations to image components using GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx, annotations, oci
@z

@x
Annotations let you specify arbitrary metadata for OCI image components, such
as manifests, indexes, and descriptors.
@y
アノテーション (annotation) は、OCI イメージコンポーネントに対して任意のメタデータを指定できるものです。
たとえばマニフェスト、インデックス、内容説明などが利用されます。
@z

@x
To add annotations when building images with GitHub Actions, use the
[metadata-action] to automatically create OCI-compliant annotations. The
metadata action creates an `annotations` output that you can reference, both
with [build-push-action] and [bake-action].
@y
GitHub Actions を用いてイメージのビルド時にアノテーションを追加するには、[メタデータアクション][metadata-action] を利用します。
これによって自動的に OCI 互換のアノテーションが生成されます。
メタデータアクション [build-push-action]、[bake-action] のいずれにおいても、参照する `annotations` をアノテーションとして生成します。
@z

% snip links...

@x
{{< tabs >}}
{{< tab name="build-push-action" >}}
@y
{{< tabs >}}
{{< tab name="build-push-action" >}}
@z

% snip code...

@x
{{< /tab >}}
{{< tab name="bake-action" >}}
@y
{{< /tab >}}
{{< tab name="bake-action" >}}
@z

% snip code...

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Configure annotation level
@y
## アノテーションレベルの設定 {#configure-annotation-level}
@z

@x
By default, annotations are placed on image manifests. To configure the
[annotation level](../../metadata/annotations.md#specify-annotation-level), set
the `DOCKER_METADATA_ANNOTATIONS_LEVELS` environment variable on the
`metadata-action` step to a comma-separated list of all the levels that you
want to annotate. For example, setting `DOCKER_METADATA_ANNOTATIONS_LEVELS` to
`index` results in annotations on the image index instead of the manifests.
@y
デフォルトでアノテーションは、イメージマニフェストに置かれます。
[アノテーションレベル](../../metadata/annotations.md#specify-annotation-level) (annotation level) を設定するには、`metadata-action` ステップ内において環境変数 `DOCKER_METADATA_ANNOTATIONS_LEVELS` を用います。
指定したいアノテーションのレベルをカンマ区切りのリストとして指定します。
たとえば `DOCKER_METADATA_ANNOTATIONS_LEVELS` に `index` を指定すると、そのアノテーションはイメージマニフェスト内ではなくイメージインデックス内に置かれます。
@z

@x
The following example creates annotations on both the image index and
manifests.
@y
以下の例は、アノテーション生成をイメージインデックスとイメージマニフェストの両方に生成するものです。
@z

% snip code...
