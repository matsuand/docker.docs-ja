%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
@x
---
title: Overview of Docker Build
description: Introduction and overview of Docker Build
keywords: build, buildx, buildkit
grid:
- title: Packaging your software
  description: 'Build and package your application to run it anywhere: locally or
    in the cloud.'
  icon: inventory_2
  link: /build/building/packaging
- title: Multi-stage builds
  description: Keep your images small and secure with minimal dependencies.
  icon: stairs
  link: /build/building/multi-stage
- title: Multi-platform images
  description: Build, push, pull, and run images seamlessly on different computer
    architectures.
  icon: content_copy
  link: /build/building/multi-platform/
- title: Architecture
  description: Explore BuildKit, the open source build engine.
  icon: construction
  link: /build/buildkit/
- title: Build drivers
  description: Configure where and how you run your builds.
  icon: engineering
  link: /build/drivers/
- title: Exporters
  description: Export any artifact you like, not just Docker images.
  icon: output
  link: /build/exporters
- title: Build caching
  description: Avoid unnecessary repetitions of costly operations, such as package
    installs.
  icon: cycle
  link: /build/cache
- title: Bake
  description: Orchestrate your builds with Bake.
  icon: cake
  link: /build/bake
aliases:
- /buildx/working-with-buildx/
- /develop/develop-images/build_enhancements/
---
@y
---
title: Docker Build 概要
description: Docker Build の導入と概要です。
keywords: build, buildx, buildkit
grid:
- title: ソフトウェアのパッケージング
  description: 'Build and package your application to run it anywhere: locally or
    in the cloud.'
  icon: inventory_2
  link: __SUBDIR__/build/building/packaging
- title: マルチステージビルド
  description: Keep your images small and secure with minimal dependencies.
  icon: stairs
  link: __SUBDIR__/build/building/multi-stage
- title: マルチプラットフォームイメージ
  description: Build, push, pull, and run images seamlessly on different computer
    architectures.
  icon: content_copy
  link: __SUBDIR__/build/building/multi-platform/
- title: アーキテクチャー
  description: Explore BuildKit, the open source build engine.
  icon: construction
  link: __SUBDIR__/build/buildkit/
- title: Build ドライバー
  description: Configure where and how you run your builds.
  icon: engineering
  link: __SUBDIR__/build/drivers/
- title: Exporters
  description: Export any artifact you like, not just Docker images.
  icon: output
  link: __SUBDIR__/build/exporters
- title: Build キャッシュ処理
  description: Avoid unnecessary repetitions of costly operations, such as package
    installs.
  icon: cycle
  link: __SUBDIR__/build/cache
- title: Bake
  description: Orchestrate your builds with Bake.
  icon: cake
  link: __SUBDIR__/build/bake
aliases:
- /buildx/working-with-buildx/
- /develop/develop-images/build_enhancements/
---
@z

@x
Docker Build is one of Docker Engine's most used features. Whenever you are
creating an image you are using Docker Build. Build is a key part of your
software development life cycle allowing you to package and bundle your code and
ship it anywhere.
@y
Docker Build is one of Docker Engine's most used features. Whenever you are
creating an image you are using Docker Build. Build is a key part of your
software development life cycle allowing you to package and bundle your code and
ship it anywhere.
@z

@x
Docker Build is more than a command for building images, and it's not only about
packaging your code. It's a whole ecosystem of tools and features that support
not only common workflow tasks but also provides support for more complex and
advanced scenarios.
@y
Docker Build is more than a command for building images, and it's not only about
packaging your code. It's a whole ecosystem of tools and features that support
not only common workflow tasks but also provides support for more complex and
advanced scenarios.
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
