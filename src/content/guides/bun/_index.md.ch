%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Containerize and develop Bun applications using Docker.
keywords: getting started, bun
title: Bun language-specific guide
summary: |
  Learn how to containerize JavaScript applications with the Bun runtime.
linkTitle: Bun
@y
description: Docker を使って Bun アプリケーションのコンテナー化と開発を行います。
keywords: getting started, bun
title: Bun ランタイム向けガイド
summary: |
  Bun ランタイムを使った JavaScript アプリケーションのコンテナー化を行う方法について学びます。
linkTitle: Bun
@z

@x
languages: [js]
@y
languages: [js]
@z

% params:
@x
  time: 10 minutes
@y
  time: 10 分
@z

@x
The Bun getting started guide teaches you how to create a containerized Bun application using Docker.
@y
Bun 向けのこの言語別ガイドでは、Docker を使った Bun アプリケーションのコンテナー化についての説明をはじめます。
@z

@x
> **Acknowledgment**
>
> Docker would like to thank [Pradumna Saraf](https://twitter.com/pradumna_saraf) for his contribution to this guide.
@y
> **謝辞**
>
> Docker では、このガイドを提供してくれた [Pradumna Saraf](https://twitter.com/pradumna_saraf) に感謝します。
e.
@z

@x
## What will you learn?
@y
## 何について学ぶか {#what-will-you-learn}
@z

@x
* Containerize and run a Bun application using Docker
* Set up a local environment to develop a Bun application using containers
* Configure a CI/CD pipeline for a containerized Bun application using GitHub Actions
* Deploy your containerized application locally to Kubernetes to test and debug your deployment
@y
- Docker を使って Bun アプリケーションをコンテナー化して実行します。
- コンテナーを利用して Bun アプリケーションを開発するローカル環境を構築します。
- GitHub アクションを使って、コンテナー化した Bun アプリケーションの CI/CD パイプラインを設定します。
- コンテナー化したアプリケーションをローカルな Kubernetes にデプロイして、テストおよびデバッグを行います。
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
- Basic understanding of JavaScript is assumed.
- You must have familiarity with Docker concepts like containers, images, and Dockerfiles. If you are new to Docker, you can start with the [Docker basics](/get-started/docker-concepts/the-basics/what-is-a-container.md) guide.
@y
- JavaScript の基本を理解していることを想定しています。
- コンテナー、イメージ、Dockerfile など、Docker の考え方について理解している必要があります。
  Docker の初心者の方は、[Docker の基本](get-started/docker-concepts/the-basics/what-is-a-container.md) ガイドに進んでください。
@z

@x
After completing the Bun getting started modules, you should be able to containerize your own Bun application based on the examples and instructions provided in this guide.
@y
Bun を用いたはじめてのモジュール作りを終えたら、本ガイドが示した利用例や手順を参考にして、独自の Bun アプリケーションのコンテナー化が可能となるはずです。
@z

@x
Start by containerizing an existing Bun application.
@y
では Bun アプリケーションをコンテナー化するところからはじめます。
@z
