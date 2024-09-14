%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: What's next 
keywords: concepts, build, images, container, docker desktop
description: Explore step-by-step guides to hep you understand core Docker concepts, building images, and running containers.
@y
title: 次は何？
keywords: concepts, build, images, container, docker desktop
description: Explore step-by-step guides to hep you understand core Docker concepts, building images, and running containers.
@z

@x
summary: |
  Now that you have set up Docker Desktop, developed with containers, and built
  and pushed your first image, you are ready to take the next step and dive
  deep into what a container is and how it works.
@y
summary: |
  ここまでに Docker Desktop の設定を行い、コンテナーの開発、イメージをはじめてビルドしてプッシュを行いました。
  ここからは次のステップへと進んでいきます。
  コンテナーとは何であるのか、それがどのように動作するのかを学んでいきます。
@z

% the-basics:

@x
- title: What is a container?
  description: Learn how to run your first container.
  link: /get-started/docker-concepts/the-basics/what-is-a-container/
@y
- title: コンテナーとは？
  description: コンテナーをはじめて実行してみます。
  link: __SUBDIR__/get-started/docker-concepts/the-basics/what-is-a-container/
@z

@x
- title: What is an image?
  description: Learn the basics of image layers. 
  link: /get-started/docker-concepts/the-basics/what-is-an-image/
@y
- title: イメージとは？
  description: イメージレイヤーの基本を学びます。
  link: __SUBDIR__/get-started/docker-concepts/the-basics/what-is-an-image/
@z

@x
- title: What is a registry?
  description: Learn about container registries, explore their interoperability, and interact with registries. 
  link: /get-started/docker-concepts/the-basics/what-is-a-registry/
@y
- title: レジストリとは？
  description: コンテナーレジストリについて学び、情報のやり取りやレジストリ間での対話的処理について探っていきます。
  link: __SUBDIR__/get-started/docker-concepts/the-basics/what-is-a-registry/
@z

@x
- title: What is Docker Compose?
  description: Gain a better understanding of Docker Compose.
  link: /get-started/docker-concepts/the-basics/what-is-docker-compose/
@y
- title: Docker Compose とは？
  description: Docker Compose を的確に理解していきます。
  link: __SUBDIR__/get-started/docker-concepts/the-basics/what-is-docker-compose/
@z

% building-images:

@x
- title: Understanding image layers 
  description: Learn about the layers of container images.
  link: /get-started/docker-concepts/building-images/understanding-image-layers/
@y
- title: イメージレイヤーの理解
  description: コンテナーイメージのレイヤーについて学びます。
  link: __SUBDIR__/get-started/docker-concepts/building-images/understanding-image-layers/
@z

@x
- title: Writing a Dockerfile
  description: Learn how to create an image using a Dockerfile.
  link: /get-started/docker-concepts/building-images/writing-a-dockerfile/
@y
- title: Dockerfile の記述
  description: Dockerfile を記述してイメージ生成する方法について学びます。
  link: __SUBDIR__/get-started/docker-concepts/building-images/writing-a-dockerfile/
@z

@x
- title: Build, tag and publish an image
  description: Learn how to build, tag, and publish an image to Docker Hub or any other registry.
  link: /get-started/docker-concepts/building-images/build-tag-and-publish-an-image/
@y
- title: イメージのビルド、タグづけ、公開
  description: イメージのビルドやタグづけを行い Docker Hub や他のレジストリに公開する方法について学びます。
  link: __SUBDIR__/get-started/docker-concepts/building-images/build-tag-and-publish-an-image/
@z

@x
- title: Using the build cache
  description: Learn about the build cache, what changes invalidate the cache, and how to effectively use the build cache.
  link: /get-started/docker-concepts/building-images/using-the-build-cache/
@y
- title: ビルドキャッシュの利用
  description: ビルドキャッシュについて、どのようにしてキャッシュが無効になるのか、どのようにすればキャッシュが有効に利用できるのかについて学びます。
  link: __SUBDIR__/get-started/docker-concepts/building-images/using-the-build-cache/
@z

@x
- title: Multi-stage builds
  description: Get a better understanding of multi-stage builds and their benefits.
  link: /get-started/docker-concepts/building-images/multi-stage-builds/
@y
- title: マルチステージビルド
  description: マルチステージビルドとそのメリットについて深く理解します。
  link: __SUBDIR__/get-started/docker-concepts/building-images/multi-stage-builds/
@z

% running-containers:

@x
- title: Publishing ports
  description: Understand the significance of publishing and exposing ports in Docker.
  link: /get-started/docker-concepts/running-containers/publishing-ports/
@y
- title: 公開ポート
  description: Docker においてポート公開の重要性について理解します。
  link: __SUBDIR__/get-started/docker-concepts/running-containers/publishing-ports/
@z

@x
- title: Overriding container defaults
  description: Learn how to override the container defaults using the `docker run` command.
  link: /get-started/docker-concepts/running-containers/overriding-container-defaults/
@y
- title: コンテナーデフォルトのオーバーライド
  description: "`docker run` コマンドを使って、コンテナーのデフォルト値をオーバーライドする方法について学びます。"
  link: __SUBDIR__/get-started/docker-concepts/running-containers/overriding-container-defaults/
@z

@x
- title: Persisting container data
  description: Learn the significance of data persistence in Docker.
  link: /get-started/docker-concepts/running-containers/persisting-container-data/
@y
- title: コンテナーデータの保存
  description: Docker においてのデータ保存の重要性について学びます。
  link: __SUBDIR__/get-started/docker-concepts/running-containers/persisting-container-data/
@z

@x
- title: Sharing local files with containers
  description: Explore the various storage options available in Docker and their common usage.
  link: /get-started/docker-concepts/running-containers/sharing-local-files/
@y
- title: コンテナーにおけるローカルファイルの共有
  description: Docker において利用可能なデータ保存とその共通的な利用方法について学びます。
  link: __SUBDIR__/get-started/docker-concepts/running-containers/sharing-local-files/
@z

@x
- title: Multi-container applications
  description: Learn the significance of multi-container applications and how they're different from single-container applications.
  link: /get-started/docker-concepts/running-containers/multi-container-applications/
@y
- title: マルチコンテナーによるアプリケーション
  description: マルチアプリケーションの重要性と、これが単一のコンテナーアプリケーションとどのような違いがあるのかについて学びます。
  link: __SUBDIR__/get-started/docker-concepts/running-containers/multi-container-applications/
@z

@x
The following sections provide step-by-step guides to help you understand core Docker concepts, building images, and running containers.
@y
以下に示す節では、Docker の基本的な考え方、イメージビルド、コンテナー実行について理解するためのガイドを順に説明しています。
@z

@x
## The basics
@y
## 基本 {#the-basics}
@z

@x
Get started learning the core concepts of containers, images, registries, and Docker Compose.
@y
コンテナー、イメージ、レジストリ、Docker Compose の基本的な考え方について学んでいきます。
@z

@x
{{< grid items="the-basics" >}}
@y
{{< grid items="the-basics" >}}
@z

@x
## Building images
@y
## イメージのビルド {#building-images}
@z

@x
Craft optimized container images with Dockerfiles, build cache, and multi-stage builds.
@y
Dockerfile、ビルドキャッシュ、マルチステージビルドを使った、コンテナーイメージの最適化方法について学びます。
@z

@x
{{< grid items="building-images" >}}
@y
{{< grid items="building-images" >}}
@z

@x
## Running containers
@y
## コンテナーの実行 {#running-containers}
@z

@x
Master essential techniques for exposing ports, overriding defaults, persisting data, sharing files, and managing multi-container applications.
@y
ポート公開、デフォルトのオーバーライド、データ保存、ファイル共有、マルチコンテナーアプリケーションの管理といった重要な技術について学びます。
@z

@x
{{< grid items="running-containers" >}}
@y
{{< grid items="running-containers" >}}
@z
