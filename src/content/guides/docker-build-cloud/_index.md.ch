%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Docker Build Cloud: Reclaim your time with fast, multi-architecture builds"
linkTitle: Docker Build Cloud
description: |
  Learn how to build and deploy Docker images to the cloud with Docker Build
  Cloud.
@y
title: "Docker Build Cloud: 高速なマルチアーキテクチャービルドを通じた時間短縮"
linkTitle: Docker Build Cloud
description: |
  Docker Build Cloud を使って Docker イメージのビルドとクラウドへのデプロイ方法について学びます。
@z

@x
summary: |
  Build applications up to 39x faster using cloud-based resources, shared team
  cache, and native multi-architecture support.
@y
summary: |
  クラウドベースのリソース、チームキャッシュの共有、ネイティブなマルチアーキテクチャーサポートを通じて、アプリケーションのビルドを 39 倍まですばやく行います。
@z

@x
levels: [beginner]
products: [dbc]
@y
levels: [初心者向け]
products: [dbc]
@z

% params:
@x
  time: 10 minutes
@y
  time: 10 分
@z

$ resource_links:
@x
    - title: Product page
      url: https://www.docker.com/products/build-cloud/
    - title: Docker Build Cloud overview
      url: /build-cloud/
    - title: Subscriptions and features
      url: /subscription/build-cloud/build-details/
    - title: Using Docker Build Cloud
      url: /build-cloud/usage/
@y
    - title: 製品ページ
      url: https://www.docker.com/products/build-cloud/
    - title: Docker Build Cloud 概要
      url: __SUBDIR__/build-cloud/
    - title: サブスクリプションと機能
      url: __SUBDIR__/subscription/build-cloud/build-details/
    - title: Docker Build Cloud の利用
      url: __SUBDIR__/build-cloud/usage/
@z

@x
98% of developers spend up to an hour every day waiting for builds to finish
([Incredibuild: 2022 Big Dev Build Times](https://www.incredibuild.com/survey-report-2022)).
Heavy, complex builds can become a major roadblock for development teams,
slowing down both local development and CI/CD pipelines.
@y
開発者の実に 98% は毎日、ビルド完了までに 1 時間くらいは要しています ([Incredibuild: 2022 Big Dev Build Times](https://www.incredibuild.com/survey-report-2022))。
ビルドが重くなり複雑化してくると、開発チームにとっては大きな障害となっていきます。
それはローカル開発でも CI/CD パイプラインでも、その作業効率を低下させます。
@z

@x
Docker Build Cloud speeds up image build times to improve developer
productivity, reduce frustrations, and help you shorten the release cycle.
@y
Docker Build Cloud はイメージビルドの時間を早めるものであり、開発生産性の向上、フラストレーションの軽減、リリースサイクルの短縮を実現します。
@z

@x
## Who’s this for?
@y
## 誰のためのもの？ {#whos-this-for}
@z

@x
- Anyone who wants to tackle common causes of slow image builds: limited local
  resources, slow emulation, and lack of build collaboration across a team.
- Developers working on older machines who want to build faster.
- Development teams working on the same repository who want to cut wait times
  with a shared cache.
- Developers performing multi-architecture builds who don’t want to spend hours
  configuring and rebuilding for emulators.
@y
- イメージビルドに時間を要する原因を解消したいと思っている方ならどなたでも。
  上限のあるローカルリソース、低速なエミュレーター、開発チーム内での共同ビルド手法を持ち合わせていない方。
- 旧式のマシン上での作業を通じてビルドを早めたいと思う開発者。
- 同一リポジトリ上で作業を行う開発チームにおいて、共有キャッシュを利用して待機時間を解消したい方。
- マルチアーキテクチャービルドを実施していて、エミュレーター向けの設定や再ビルドに余計な時間を割きたくない開発者。
@z

@x
## What you’ll learn
@y
## 学べることは {#what-youll-learn}
@z

@x
- Building container images faster locally and in CI
- Accelerating builds for multi-platform images
- Reusing pre-built images to expedite workflows
@y
- ローカルや CI でのコンテナーイメージビルドを高速に実現できます。
- マルチプラットフォームイメージのビルドを加速します。
- プレビルドイメージの再利用によりワークフローを促進します。
@z

@x
## Tools integration
@y
## ツールとのインテグレーション {#tools-integration}
@z

@x
Works well with Docker Compose, GitHub Actions, and other CI solutions
@y
Docker Compose、GitHub Actions、この他の CI ソリューションと連携して適切に動作します。
@z

@x
<div id="dbc-lp-survey-anchor"></div>
@y
<div id="dbc-lp-survey-anchor"></div>
@z
