%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Rust language-specific guide
linkTitle: Rust
@y
title: Rust 向けガイド
linkTitle: Rust
@z

@x
description: Containerize Rust apps using Docker
keywords: Docker, getting started, Rust, language
@y
description: Containerize Rust apps using Docker
keywords: Docker, getting started, Rust, language
@z

@x
summary: |
  This guide covers how to containerize Rust applications using Docker,
  focusing on building images, managing dependencies, employing multi-stage
  builds, and optimizing for efficient deployment in containers.
@y
summary: |
  This guide covers how to containerize Rust applications using Docker,
  focusing on building images, managing dependencies, employing multi-stage
  builds, and optimizing for efficient deployment in containers.
@z

@x
languages: [rust]
levels: [beginner]
@y
languages: [rust]
levels: [初心者向け]
@z

% params:
@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
The Rust language-specific guide teaches you how to create a containerized Rust application using Docker. In this guide, you'll learn how to:
@y
言語別ガイド Rust 向けでは、Docker を使ってコンテナー化した Rust アプリケーションの生成方法について説明をはじめます。
このガイドでは以下について学んでいきます。
@z

@x
- Containerize a Rust application
- Build an image and run the newly built image as a container
- Set up volumes and networking
- Orchestrate containers using Compose
- Use containers for development
- Configure a CI/CD pipeline for your application using GitHub Actions
- Deploy your containerized Rust application locally to Kubernetes to test and debug your deployment
@y
- Containerize a Rust application
- Build an image and run the newly built image as a container
- Set up volumes and networking
- Orchestrate containers using Compose
- Use containers for development
- Configure a CI/CD pipeline for your application using GitHub Actions
- Deploy your containerized Rust application locally to Kubernetes to test and debug your deployment
@z

@x
After completing the Rust modules, you should be able to containerize your own Rust application based on the examples and instructions provided in this guide.
@y
この Rust 向けガイドのモジュール実行を完了させれば、このガイドの示す例や手順に基づいて、独自の Rust アプリケーションのコンテナー化ができるようになるはずです。
@z

@x
Start with building your first Rust image.
@y
では手元にある Rust イメージのビルドからはじめます。
@z
