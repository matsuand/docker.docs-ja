%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Introduction to GitHub Actions
linkTitle: GitHub Actions
@y
title: GitHub Actions について
linkTitle: GitHub Actions
@z

@x
description: Docker maintains a set of official GitHub Actions for building Docker images.
keywords: ci, github actions, gha,  build, introduction, tutorial
@y
description: Docker では Docker イメージをビルドする公式の GitHub Actions を提供しています。
keywords: ci, github actions, gha,  build, introduction, tutorial
@z

@x
GitHub Actions is a popular CI/CD platform for automating your build, test, and
deployment pipeline. Docker provides a set of official GitHub Actions for you to
use in your workflows. These official actions are reusable, easy-to-use
components for building, annotating, and pushing images.
@y
GitHub Actions はビルド、テスト、デプロイの連携作業を自動化する、一般的な CI/CD プラットフォームです。
Docker では、開発ワークフロー内で利用可能な GitHub Actions を公式に提供しています。
この Actions は、イメージのビルド、アノテーション、プッシュを行うための、再利用可能で使い方も簡単なコンポーネントです。
@z

@x
The following GitHub Actions are available:
@y
以下のような GitHub Actions が利用できます。
@z

@x
- [Build and push Docker images](https://github.com/marketplace/actions/build-and-push-docker-images):
  build and push Docker images with BuildKit.
- [Docker Login](https://github.com/marketplace/actions/docker-login):
  sign in to a Docker registry.
- [Docker Setup Buildx](https://github.com/marketplace/actions/docker-setup-buildx):
  initiates a BuildKit builder.
- [Docker Metadata action](https://github.com/marketplace/actions/docker-metadata-action):
  extracts metadata from Git reference and GitHub events.
- [Docker Setup QEMU](https://github.com/marketplace/actions/docker-setup-qemu):
  installs [QEMU](https://github.com/qemu/qemu) static binaries for multi-arch
  builds.
- [Docker Buildx Bake](https://github.com/marketplace/actions/docker-buildx-bake):
  enables using high-level builds with [Bake](../../bake/_index.md).
- [Docker Scout](https://github.com/docker/scout-action):
  analyze Docker images for security vulnerabilities.
@y
- [Build and push Docker images](https://github.com/marketplace/actions/build-and-push-docker-images):
  BuildKit を利用して Docker イメージのビルドとプッシュを行います。
- [Docker Login](https://github.com/marketplace/actions/docker-login):
  Docker レジストリへのサインインを行います。
- [Docker Setup Buildx](https://github.com/marketplace/actions/docker-setup-buildx):
  BuildKit ビルダーの初期化を行います。
- [Docker Metadata action](https://github.com/marketplace/actions/docker-metadata-action):
  Git リファレンスや GitHub イベントからメタデータを抽出します。
- [Docker Setup QEMU](https://github.com/marketplace/actions/docker-setup-qemu):
  マルチアーキテクチャービルド向けに [QEMU](https://github.com/qemu/qemu) のスタティックバイナリをインストールします。
- [Docker Buildx Bake](https://github.com/marketplace/actions/docker-buildx-bake):
  [Bake](../../bake/_index.md) を使った高度なビルドを可能にします。
- [Docker Scout](https://github.com/docker/scout-action):
  Docker イメージのセキュリティぜい弱性を分析します。
@z

@x
Using Docker's actions provides an easy-to-use interface, while still allowing
flexibility for customizing build parameters.
@y
Docker のアクションでは簡単なインターフェースを提供します。
それでもビルドパラメーターをカスタマイズできる機能は十分に維持しています。
@z

@x
## Examples
@y
## 利用例 {#examples}
@z

@x
If you're looking for examples on how to use the Docker GitHub Actions,
refer to the following sections:
@y
Docker GitHub Actions を使った利用例を確認したい場合は、以下の節を参照してください。
@z

@x
{{% sectionlinks %}}
@y
{{% sectionlinks %}}
@z

@x
## Get started with GitHub Actions
@y
## GitHub Actions を使ってみよう {#get-started-with-gitHub-actions}
@z

@x
{{< include "gha-tutorial.md" >}}
@y
{{< include "gha-tutorial.md" >}}
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
This tutorial has shown you how to create a simple GitHub Actions workflow,
using the official Docker actions, to build and push an image to Docker Hub.
@y
This tutorial has shown you how to create a simple GitHub Actions workflow,
using the official Docker actions, to build and push an image to Docker Hub.
@z

@x
There are many more things you can do to customize your workflow to better suit
your needs. To learn more about some of the more advanced use cases, take a look
at the advanced examples, such as [building multi-platform images](multi-platform.md),
or [using cache storage backends](cache.md) and also how to [configure your builder](configure-builder.md).
@y
There are many more things you can do to customize your workflow to better suit
your needs. To learn more about some of the more advanced use cases, take a look
at the advanced examples, such as [building multi-platform images](multi-platform.md),
or [using cache storage backends](cache.md) and also how to [configure your builder](configure-builder.md).
@z
