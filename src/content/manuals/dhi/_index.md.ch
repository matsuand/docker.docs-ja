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
    - title: Quickstart
      description: Follow a step-by-step guide to explore and run a Docker Hardened Image.
      icon: rocket-launch
      link: /dhi/get-started/
@y
    - title: クィックスタート
      description: ガイドを通じて Docker Hardened イメージを実行し確認します。
      icon: rocket-launch
      link: __SUBDIR__/dhi/get-started/
@z

@x
    - title: Explore
      description: Learn what Docker Hardened Images are, how they're built, and what sets them apart from typical base images.
      icon: information-circle
      link: /dhi/explore/
@y
    - title: Explore
      description: Docker Hardened イメージとは何か、どのようにしてビルドされているか、他のベースイメージjとはどのように違うのかについて学びます。
      icon: information-circle
      link: __SUBDIR__/dhi/explore/
@z

@x
    - title: How-tos
      description: Step-by-step guides for using, verifying, scanning, and migrating to Docker Hardened Images.
      icon: play
      link: /dhi/how-to/
@y
    - title: ハウツー
      description: Docker Hardened イメージの利用、検証、スキャン、移行といった手順を一つずつガイド説明していきます。
      icon: play
      link: __SUBDIR__/dhi/how-to/
@z

@x
    - title: Security concepts
      description: Understand the secure supply chain principles that make Docker Hardened Images production-ready.
      icon: clipboard-document-check
      link: /dhi/explore/security-concepts/
@y
    - title: Security concepts
      description: Understand the secure supply chain principles that make Docker Hardened Images production-ready.
      icon: clipboard-document-check
      link: __SUBDIR__/dhi/explore/security-concepts/
@z

@x
    - title: Tools
      description: Browse and manage Docker Hardened Images using Docker Hub, the CLI, MCP server, or Terraform.
      icon: wrench-screwdriver
      link: /dhi/tools/
@y
    - title: Tools
      description: Browse and manage Docker Hardened Images using Docker Hub, the CLI, MCP server, or Terraform.
      icon: wrench-screwdriver
      link: __SUBDIR__/dhi/tools/
@z

@x
    - title: Resources and feedback
      description: Guides, GitHub repositories, community channels, and how to give feedback.
      icon: link
      link: /dhi/resources/
@y
    - title: Resources and feedback
      description: Guides, GitHub repositories, community channels, and how to give feedback.
      icon: link
      link: __SUBDIR__/dhi/resources/
@z

@x
    - title: Release notes
      description: New features, improvements, and changes in Docker Hardened Images.
      icon: newspaper
      link: /dhi/release-notes/platform/
@y
    - title: Release notes
      description: New features, improvements, and changes in Docker Hardened Images.
      icon: newspaper
      link: __SUBDIR__/dhi/release-notes/platform/
@z

@x
Docker Hardened Images (DHI) provide minimal, secure, and production-ready
container images, Helm charts, and system packages maintained by Docker.
Designed to reduce vulnerabilities and simplify compliance, DHI integrates
easily into your existing Docker-based workflows with little to no retooling
required.
@y
Docker Hardened イメージ (DHI) は、コンパクトにまとめられたセキュアで実運用向けコンテナーイメージ、Helm チャート、システムパッケージを提供するものであり、Docker がメンテナンスを行っているものです。
ぜい弱性を軽減し、コンプライアンスを簡素化するように設計されています。
このため DHI は既存の Docker ベースのワークフローへの統合が容易となり、ツールの再構築はほとんど必要がありません。
@z

@x
DHI is available in the following three subscriptions.
@y
DHI は以下の 3 つのサブスクリプションから選ぶことができます。
@z

@x
| Feature | Community | Select | Enterprise |
|---|---|---|---|
| Hardened, minimal images | ✅ | ✅ | ✅ |
| Near-zero CVEs | ✅ | ✅ | ✅ |
| Verifiable SBOMs & SLSA Build L3 provenance | ✅ | ✅ | ✅ |
| Full, unsuppressed CVE visibility | ✅ | ✅ | ✅ |
| Drop-in adoption, no workflow changes | ✅ | ✅ | ✅ |
| Full catalog of open source images under Apache 2.0 | ✅ | ✅ | ✅ |
| Built with Docker Hardened System Packages | ✅ | ✅ | ✅ |
| Upstream cadence for Docker-released patches | ✅ | ✅ | ✅ |
| FIPS/STIG variants | ❌ | ✅ | ✅ |
| Critical CVE fixes < 7 days with SLA-backed continuous patching | ❌ | ✅ | ✅ |
| Customizations | ❌ | ✅ Up to 5 | ✅ Unlimited |
| Access to Hardened System Packages repository | ❌ | ❌ | ✅ |
| Full catalog access available | ❌ | ❌ | ✅ |
| Extended Lifecycle Support add-on available | ❌ | ❌ | ✅ +5 years of hardened updates |
@y
| Feature | Community | Select | Enterprise |
|---|---|---|---|
| Hardened, minimal images | ✅ | ✅ | ✅ |
| Near-zero CVEs | ✅ | ✅ | ✅ |
| Verifiable SBOMs & SLSA Build L3 provenance | ✅ | ✅ | ✅ |
| Full, unsuppressed CVE visibility | ✅ | ✅ | ✅ |
| Drop-in adoption, no workflow changes | ✅ | ✅ | ✅ |
| Full catalog of open source images under Apache 2.0 | ✅ | ✅ | ✅ |
| Built with Docker Hardened System Packages | ✅ | ✅ | ✅ |
| Upstream cadence for Docker-released patches | ✅ | ✅ | ✅ |
| FIPS/STIG variants | ❌ | ✅ | ✅ |
| Critical CVE fixes < 7 days with SLA-backed continuous patching | ❌ | ✅ | ✅ |
| Customizations | ❌ | ✅ Up to 5 | ✅ Unlimited |
| Access to Hardened System Packages repository | ❌ | ❌ | ✅ |
| Full catalog access available | ❌ | ❌ | ✅ |
| Extended Lifecycle Support add-on available | ❌ | ❌ | ✅ +5 years of hardened updates |
@z

@x
For pricing and more details, see the [Docker Hardened Images subscription
comparison](https://www.docker.com/products/hardened-images/#compare).
@y
価格やその他の詳細は [Docker Hardened イメージのサブスクリプション比較](https://www.docker.com/products/hardened-images/#compare) を参照してください。
@z

@x
Explore the sections below to get started with Docker Hardened Images, integrate
them into your workflow, and learn what makes them secure and enterprise-ready.
@y
以下の項目を参照して Docker Hardened イメージ利用をはじめてみてください。
ワークフローに統合することで、いかにセキュアでエンタープライズ用途に適しているかを学んでください。
@z
