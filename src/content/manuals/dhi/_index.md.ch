%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Docker Hardened Images
description: Secure, minimal, and production-ready base images
@y
title: Docker Hardened イメージ
description: Secure, minimal, and production-ready base images
@z

@x
      text: New
@y
      text: New
@z

% grid_sections:

@x
    - title: Quickstart
      description: Follow a step-by-step guide to explore and run a Docker Hardened Image.
      icon: rocket_launch
      link: /dhi/get-started/
@y
    - title: クィックスタート
      description: ガイドを通じて Docker Hardened イメージを実行し確認します。
      icon: rocket_launch
      link: __SUBDIR__/dhi/get-started/
@z

@x
    - title: Explore
      description: Learn what Docker Hardened Images are, how they're built, and what sets them apart from typical base images.
      icon: info
      link: /dhi/explore/
@y
    - title: Explore
      description: Docker Hardened イメージとは何か、どのようにしてビルドされているか、他のベースイメージjとはどのように違うのかについて学びます。
      icon: info
      link: __SUBDIR__/dhi/explore/
@z

@x
    - title: Features
      description: Discover the security, compliance, and enterprise-readiness features built into Docker Hardened Images.
      icon: lock
      link: /dhi/features/
@y
    - title: 機能
      description: Docker Hardened イメージ内にビルドされているセキュリティ、コンプライアンス、エンタープライズ向けといった各機能について探っていきます。
      icon: lock
      link: __SUBDIR__/dhi/features/
@z

@x
    - title: How-tos
      description: Step-by-step guides for using, verifying, scanning, and migrating to Docker Hardened Images.
      icon: play_arrow
      link: /dhi/how-to/
@y
    - title: ハウツー
      description: Docker Hardened イメージの利用、検証、スキャン、移行といった手順を一つずつガイド説明していきます。
      icon: play_arrow
      link: __SUBDIR__/dhi/how-to/
@z

@x
    - title: Core concepts
      description: Understand the secure supply chain principles that make Docker Hardened Images production-ready.
      icon: fact_check
      link: /dhi/core-concepts/
@y
    - title: 基本となる考え方
      description: Docker Hardened イメージが運用環境向けとして即時の利用を可能とする、セキュアサプライチェーンの考え方について学びます。
      icon: fact_check
      link: __SUBDIR__/dhi/core-concepts/
@z

@x
    - title: Troubleshoot
      description: Resolve common issues with building, running, or debugging Docker Hardened Images.
      icon: help_center
      link: /dhi/troubleshoot/
@y
    - title: トラブルシューティング
      description: Docker Hardened イメージのビルド、実行、デバッグに関する一般的な問題を解決します。
      icon: help_center
      link: __SUBDIR__/dhi/troubleshoot/
@z

@x
Docker Hardened Images (DHI) are minimal, secure, and production-ready container
base and application images maintained by Docker. Designed to reduce
vulnerabilities and simplify compliance, DHI integrates easily into your
existing Docker-based workflows with little to no retooling required.
@y
Docker Hardened イメージ (DHI) は、コンパクトにまとめられたセキュアな実運用向けコンテナーベースのアプリケーションイメージであり、Docker がメンテナンスを行っているものです。
ぜい弱性を軽減し、コンプライアンスを簡素化するように設計されています。
このため DHI は既存の Docker ベースのワークフローへの統合が容易となり、ツールの再構築はほとんど必要がありません。
@z

@x
DHI is available in two tiers: **DHI Free** provides core security features at
no cost, while **DHI Enterprise** adds SLA-backed support, compliance variants,
customization, and Extended Lifecycle Support for organizations with advanced
requirements.
@y
DHI は 2 つのカテゴリーから選ぶことができます。
一つは **DHI Free** であり、無償により基本的でセキュアな機能を提供します。
もう一つは **DHI Enterprise** であり、さらに以下の機能が加わります。
つまり組織における応用的な要件に応じた、SLA ベースのサポート、コンプライアンスへの適用、カスタマイズ、拡張ライフサイクルサポートなどです。
@z

@x
![DHI Subscription](./images/dhi-subscription.png)
@y
![DHI サブスクリプション](./images/dhi-subscription.png)
@z

@x
Explore the sections below to get started with Docker Hardened Images, integrate
them into your workflow, and learn what makes them secure and enterprise-ready.
@y
以下の項目を参照して Docker Hardened イメージ利用をはじめてみてください。
ワークフローに統合することで、いかにセキュアでエンタープライズ用途に適しているかを学んでください。
@z

@x
{{< grid
  items="grid_sections"
>}}
@y
{{< grid
  items="grid_sections"
>}}
@z
