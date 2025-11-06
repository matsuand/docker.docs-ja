%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Supply-chain security for C++ Docker images
linkTitle: Supply-chain security
@y
title: C++ Docker イメージに対するサプライチェーンセキュリティ
linkTitle: サプライチェーンのセキュリティ
@z

@x
keywords: C++, security, multi-stage
description: Learn how to extract SBOMs from C++ Docker images.
@y
keywords: C++, security, multi-stage
description: C++ Docker イメージから SBOM を抽出する方法について学びます。
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
- You have a [Git client](https://git-scm.com/downloads). The examples in this section use a command-line based Git client, but you can use any client.
- You have a Docker Desktop installed, with containerd enabled for pulling and storing images (it's a checkbox in **Settings** > **General**). Otherwise, if you use Docker Engine:
@y
- [git クライアント](https://git-scm.com/downloads) を持っていること。
  本節における例では、コマンドラインベースの git クライアントを用いることにします。
  クライアントはどのようなものでも利用可能です。
- Docker Desktop がインストールされていること。
  イメージのプルと保存のため containerd を有効化する必要があります (チェックボックスの **Settings** > **General** にあります)。
  Docker Desktop ではなく Docker Engine を利用する場合であれば以下です。
@z

@x
  - You have the [Docker SBOM CLI plugin](https://github.com/docker/sbom-cli-plugin) installed. To install it on Docker Engine, use the following command:
@y
  - [Docker SBOM CLI プラグイン](https://github.com/docker/sbom-cli-plugin) がインストール済であること。
    Docker Engine に対してこれをインストールするには以下のコマンドを実行します。
@z

% snip command...

@x
  - You have the [Docker Scout CLI plugin](https://docs.docker.com/scout/install/) installed. To install it on Docker Engine, use the following command:
@y
  - [Docker Scout CLI プラグイン](__SUBDIR__/scout/install/) がインストール済であること。
    Docker Engine に対してこれをインストールするには以下のコマンドを実行します。
@z

% snip command...

@x
  - You have [containerd enabled](https://docs.docker.com/engine/storage/containerd/) for Docker Engine.
@y
  - Docker Engine において [containerd の有効化](__SUBDIR__/engine/storage/containerd/) を行っていること。
@z

@x
## Overview
@y
## 概要 {#overview}
@z

@x
This section walks you through extracting Software Bill of Materials (SBOMs) from a C++ Docker image using the Docker SBOM CLI plugin. SBOMs provide a detailed list of all the components in a software package, including their versions and licenses. You can use SBOMs to track the provenance of your software and ensure that it complies with your organization's security and licensing policies.
@y
本節では Docker SBOM CLI プラグインを利用して C++ Docker イメージから SBOM (Software Bill of Materials; ソフトウエア部品表) の抽出方法を示します。
SBOM はソフトウェアパッケージ内にあるコンポーネントすべてを一覧表示するものです。
そこにはバージョン情報やライセンスなどが含まれます。
SBOM を利用することで、利用するソフトウェアの出どころを追跡することができ、所属する組織のセキュリティやライセンス規則に準拠しているかどうかを確認することができます。
@z

@x
## Generate an SBOM
@y
## SBOM の生成 {#generate-an-sbom}
@z

@x
Here we will use the Docker image that we built in the [Create a multi-stage build for your C++ application](/guides/language/cpp/multistage/) guide. If you haven't already built the image, follow the steps in that guide to build the image.
The image is named `hello`. To generate an SBOM for the `hello` image, run the following command:
@y
ここで利用する Docker イメージは、[C++ アプリケーションに対してのマルチステージビルドの生成](__SUBDIR__/guides/language/cpp/multistage/) においてビルドしたものです。
イメージをまだビルドしていない場合は、上のガイドの手順に従ってイメージをビルドしてください。
このイメージの名前は `hello` です。
`hello` イメージに対して SBOM を生成するには以下のコマンドを実行します。
@z

% snip command...

@x
The command will say "No packages discovered". This is because the final image is a scratch image and doesn't have any packages.
Let's try again with Docker Scout:
@y
コマンドを実行すると "No packages discovered" (パッケージが見つかりません) と出力されます。
最終イメージがスクラッチイメージなので、パッケージを何も持っていないからです。
Docker Scout を使ってもう一度以下を実行します。
@z

% snip command...

@x
This command will tell you the same thing.
@y
このコマンドの出力も同様となるはずです。
@z

@x
## Generate an SBOM attestation
@y
## SBOM 証明書の生成 {#generate-an-sbom-attestation}
@z

@x
The SBOM can be generated during the build process and "attached" to the image. This is called an SBOM attestation.
To generate an SBOM attestation for the `hello` image, first let's change the Dockerfile:
@y
SBOM はビルドプロセスにおいて生成可能であり、その際にイメージに「アタッチ」することができます。
これを SBOM 証明書 (SBOM attestation) と呼びます。
`hello` イメージに対しての SBOM 証明書を生成するには、まず Dockerfile を以下のように修正します。
@z

% snip code...

@x
The first line `ARG BUILDKIT_SBOM_SCAN_STAGE=true` enables SBOM scanning in the build stage.
Now, build the image with the following command:
@y
第 1 行めの `ARG BUILDKIT_SBOM_SCAN_STAGE=true` は、ビルドステージにおいて SBOM スキャンを有効にするものです。
そこで以下のコマンドを実行してイメージをビルドします。
@z

% snip command...

@x
This command will build the image and generate an SBOM attestation. You can verify that the SBOM is attached to the image by running the following command:
@y
コマンド実行によってイメージがビルドされ、SBOM 証明書も生成されます。
SBOM がアタッチされたことを確認するため、以下のコマンドを実行します。
@z

% snip command...

@x
Note that the normal `docker sbom` command will not load the SBOM attestation.
@y
なお単純な `docker sbom` コマンド実行では、SBOM 証明書はロードされません。
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this section, you learned how to generate SBOM attestation for a C++ Docker image during the build process.
The normal image scanners will not be able to generate SBOMs from scratch images.
@y
本節では C++ Docker イメージのビルドプロセスにおいて SBOM 証明書を生成する方法について学びました。
普通のイメージスキャンを行うだけでは、スクラッチイメージから SBOM を生成することはできません。
@z
