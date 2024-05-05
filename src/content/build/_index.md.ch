%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Overview of Docker Build
description: Get an overview of Docker Build to package and bundle your code and ship it anywhere
keywords: build, buildx, buildkit
@y
title: Docker Build 概要
description: Get an overview of Docker Build to package and bundle your code and ship it anywhere
keywords: build, buildx, buildkit
@z

% grid:

@x
- title: Packaging your software
  description: 'Build and package your application to run it anywhere: locally or
    in the cloud.'
  icon: inventory_2
  link: /build/building/packaging
@y
- title: ソフトウェアのパッケージング
  description: 'Build and package your application to run it anywhere: locally or
    in the cloud.'
  icon: inventory_2
  link: __SUBDIR__/build/building/packaging
@z

@x
- title: Multi-stage builds
  description: Keep your images small and secure with minimal dependencies.
  icon: stairs
  link: /build/building/multi-stage
@y
- title: マルチステージビルド
  description: Keep your images small and secure with minimal dependencies.
  icon: stairs
  link: __SUBDIR__/build/building/multi-stage
@z

@x
- title: Multi-platform images
  description: Build, push, pull, and run images seamlessly on different computer
    architectures.
  icon: content_copy
  link: /build/building/multi-platform/
@y
- title: マルチプラットフォームイメージ
  description: Build, push, pull, and run images seamlessly on different computer
    architectures.
  icon: content_copy
  link: __SUBDIR__/build/building/multi-platform/
@z

@x
- title: Architecture
  description: Explore BuildKit, the open source build engine.
  icon: construction
  link: /build/buildkit/
@y
- title: アーキテクチャー
  description: オープンソースのビルドエンジンである BuildKit を見ていきます。
  icon: construction
  link: __SUBDIR__/build/buildkit/
@z

@x
- title: Build drivers
  description: Configure where and how you run your builds.
  icon: engineering
  link: /build/drivers/
@y
- title: Build ドライバー
  description: ビルド実行をどこでどのように行うのかを設定します。
  icon: engineering
  link: __SUBDIR__/build/drivers/
@z

@x
- title: Exporters
  description: Export any artifact you like, not just Docker images.
  icon: output
  link: /build/exporters
@y
- title: Exporters
  description: Docker イメージだけではなく、お望みの成果をエクスポートします。
  icon: output
  link: __SUBDIR__/build/exporters
@z

@x
- title: Build caching
  description: Avoid unnecessary repetitions of costly operations, such as package
    installs.
  icon: cycle
  link: /build/cache
@y
- title: Build キャッシュ処理
  description: パッケージインストールなどコストを要する不要な繰り返し操作をなくします。
  icon: cycle
  link: __SUBDIR__/build/cache
@z

@x
- title: Bake
  description: Orchestrate your builds with Bake.
  icon: cake
  link: /build/bake
@y
- title: Bake
  description: Bake を使ってビルドをオーケストレートします。
  icon: cake
  link: __SUBDIR__/build/bake
@z

% snip aliases...

@x
Docker Build is one of Docker Engine's most used features. Whenever you are
creating an image you are using Docker Build. Build is a key part of your
software development life cycle allowing you to package and bundle your code and
ship it anywhere.
@y
Docker Build は Docker Engine において最もよく使われている機能です。
イメージを生成する際には、必ず Docker Build が使われています。
Docker Build はソフトウェア開発のライフサイクルにおける重要な位置づけとなるものであり、生成したコードをパッケージングし、どこにでも提供できるようにしてくれます。
@z

@x
Docker Build is more than a command for building images, and it's not only about
packaging your code. It's a whole ecosystem of tools and features that support
not only common workflow tasks but also provides support for more complex and
advanced scenarios.
@y
Docker Build はイメージのビルドコマンド以上の働きをになっています。
また単純にコードをパッケージングするだけのものでもありません。
これは、ごく普通のワークフロータスクをサポートするだけでなく、より複雑で高度なシナリオをサポートするツールおよび機能を提供する包括的なエコシステムなのです。
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
