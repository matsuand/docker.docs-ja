%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Building images
@y
title: イメージのビルド
@z

@x
keywords: build images, Dockerfile, layers, tag, push, cache, multi-stage
description: |
  Learn how to build Docker images from a Dockerfile. You'll understand the
  structure of a Dockerfile, how to build an image, and how to customize the
  build process.
summary: |
  Building container images is both technical and an art. You want to keep the
  image small and focused to increase your security posture, but also need to
  balance potential tradeoffs, such as caching impacts. In this series, you’ll
  deep dive into the secrets of images, how they are built and best practices.
@y
keywords: build images, Dockerfile, layers, tag, push, cache, multi-stage
description: |
  Learn how to build Docker images from a Dockerfile. You'll understand the
  structure of a Dockerfile, how to build an image, and how to customize the
  build process.
summary: |
  コンテナーイメージのビルドは、技術的でもありアートでもあります。
  イメージ作りにあたっては常にサイズを小さく、しかもセキュリティ対応をより適切に保ちたいと思うはずです。
  とは言っても、そこにはキャッシュの影響といった潜在的なトレードオフのバランスを考慮する必要もあります。
  本シリーズでは Docker イメージの謎に迫ります。
  そしてビルド方法やベストプラクティスについて学びます。
@z

% params:
@x
  skill: Beginner
  time: 25 minutes
  prereq: None
@y
  skill: 初心者向け
  time: 25 分
  prereq: なし
@z

@x
## About this series
@y
## 本シリーズについて {#about-this-series}
@z

@x
Learn how to build production-ready images that are lean and efficient Docker
images, essential for minimizing overhead and enhancing deployment in
production environments.
@y
本番環境向けの Docker イメージとして、無駄のない効率的なものを作り出す方法について学びます。
特にオーバーヘッドを最小限に抑え、本番環境へのデプロイを強化するものを目指します。
@z

@x
## What you'll learn
@y
## ここから学んでいくこと {#what-youll-learn}
@z

@x
- Understanding image layers
- Writing a Dockerfile
- Build, tag and publish an image
- Using the build cache
- Multi-stage builds
@y
- イメージレイヤーの理解
- Dockerfile の記述方法
- イメージのビルド、タグづけ、公開方法
- ビルドキャッシュの利用
- マルチステージビルド
@z
