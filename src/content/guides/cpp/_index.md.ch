%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: C++ language-specific guide
linkTitle: C++
description: Containerize and develop C++ applications using Docker.
keywords: getting started, c++
@y
title: C++ 向けガイド
linkTitle: C++
description: Containerize and develop C++ applications using Docker.
linkTitle: C++
keywords: getting started, c++
@z

@x
summary: |
  This guide explains how to containerize C++ applications using Docker.
@y
summary: |
  このガイドでは Docker を使って C++ アプリケーションのコンテナー化を行う方法について説明します。
@z

@x
languages: [cpp]
@y
languages: [cpp]
@z

% params:
@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
The C++ getting started guide teaches you how to create a containerized C++ application using Docker. In this guide, you'll learn how to:
@y
言語別ガイド C++ 向けでは、Docker を使った C++ アプリケーションのコンテナー化についての説明をはじめます。
このガイドでは以下について学んでいきます。
@z

@x
> **Acknowledgment**
>
> Docker would like to thank [Pradumna Saraf](https://twitter.com/pradumna_saraf) and [Mohammad-Ali A'râbi](https://twitter.com/MohammadAliEN) for their contribution to this guide.

@y
> **謝辞**
>
> Docker では、このガイドを提供してくれた [Pradumna Saraf](https://twitter.com/pradumna_saraf) と [Mohammad-Ali A'râbi](https://twitter.com/MohammadAliEN) に感謝します。
@z

@x
- Containerize and run a C++ application using a multi-stage Docker build
- Build and run a C++ application using Docker Compose
- Set up a local environment to develop a C++ application using containers
- Configure a CI/CD pipeline for a containerized C++ application using GitHub Actions
- Deploy your containerized application locally to Kubernetes to test and debug your deployment
- Use BuildKit to generate SBOM attestations during the build process
@y
- マルチステージビルドにより C++ アプリケーションをコンテナー化して実行します。
- Docker Compose を使って C++ アプリケーションをビルドして実行します。
- コンテナーを利用して C++ アプリケーションを開発するローカル環境を構築します。
- GitHub アクションを使って、コンテナー化した C++ アプリケーションの CI/CD パイプラインを設定します。
- コンテナー化した C++ アプリケーションをローカルな Kubernetes にデプロイして、テストおよびデバッグを行います。
- ビルドの過程で BuildKit を使って SBOM 認証を生成します。
@z

@x
After completing the C++ getting started modules, you should be able to containerize your own C++ application based on the examples and instructions provided in this guide.
@y
この C++ 向けガイドのモジュール実行を完了させれば、このガイドの示す例や手順に基づいて、独自の C++ アプリケーションのコンテナー化ができるようになるはずです。
@z

@x
Start by containerizing an existing C++ application.
@y
では手元にある C++ アプリケーションのコンテナー化からはじめます。
@z
