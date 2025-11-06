%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Create a multi-stage build for your C++ application
linkTitle: Containerize your app using a multi-stage build
@y
title: C++ アプリケーションに対してのマルチステージビルドの生成
linkTitle: マルチステージビルドを使ったアプリのコンテナー化
@z

@x
keywords: C++, containerize, multi-stage
description: Learn how to create a multi-stage build for a C++ application.
@y
keywords: C++, containerize, multi-stage
description: C++ アプリケーションに対してマルチステージビルドの生成方法を学びます。
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
- You have a [Git client](https://git-scm.com/downloads). The examples in this section use a command-line based Git client, but you can use any client.
@y
- [git クライアント](https://git-scm.com/downloads) を持っていること。
  本節における例では、コマンドラインベースの Git クライアントを用いることにします。
  クライアントはどのようなものでも利用可能です。
@z

@x
## Overview
@y
## 概要 {#overview}
@z

@x
This section walks you through creating a multi-stage Docker build for a C++ application.
A multi-stage build is a Docker feature that allows you to use different base images for different stages of the build process,
so you can optimize the size of your final image and separate build dependencies from runtime dependencies.
@y
この節では C++ アプリケーション用のマルチステージ Docker ビルドの生成について説明しています。
マルチステージビルドは、ビルド過程でのさまざまなステージにおいて、さまざまなベースイメージを使用できるようにする Docker 機能です。
これにより最終イメージのサイズを最適化し、ビルド時の依存関係を実行時の依存関係から分離できます。
@z

@x
The standard practice for compiled languages like C++ is to have a build stage that compiles the code and a runtime stage that runs the compiled binary,
because the build dependencies are not needed at runtime.
@y
C++ などのようなコンパイル言語における標準的な方法として、コードをコンパイルするためのビルドステージと、コンパイル済みバイナリを実行するためのランタイムステージの 2 つを用意します。
こうするのは、実行時にはビルド時の依存パッケージが必要ないからです。
@z

@x
## Get the sample application
@y
## サンプルアプリケーションの入手 {#get-the-sample-application}
@z

@x
Let's use a simple C++ application that prints `Hello, World!` to the terminal. To do so, clone the sample repository to use with this guide:
@y
端末に `Hello, World!` を出力する単純な C++ アプリケーションを用いていきます。
これ行うために、本ガイドで利用するサンプルリポジトリをクローンします。
@z

% snip command...

@x
The example for this section is under the `hello` directory in the repository. Get inside it and take a look at the files:
@y
ここに示す例は、リポジトリ内の `hello` ディレクトリ配下にあります。
そのディレクトリに入って、ファイルを見てみます。
@z

% snip command...

@x
You should see the following files:
@y
以下のようなファイルが表示されます。
@z

% snip output...

@x
## Check the Dockerfile
@y
## Dockerfile の確認 {#check-the-dockerfile}
@z

@x
Open the `Dockerfile` in an IDE or text editor. The `Dockerfile` contains the instructions for building the Docker image.
@y
IDE またはテキストエディターを使って `Dockerfile` を開きます。
`Dockerfile` には Docker イメージをビルドする命令が含まれています。
@z

@x within code
# Stage 1: Build stage
@y
# ステージ 1: ビルドステージ
@z
@x
# Install build-essential for compiling C++ code
@y
# C++ コードコンパイルのための build-essential インストール
@z
@x
# Set the working directory
@y
# ワーキングディレクトリの設定
@z
@x
# Copy the source code into the container
@y
# コンテナーへのソースコードコピー
@z
@x
# Compile the C++ code statically to ensure it doesn't depend on runtime libraries
@y
# C++ コードをスタティックコンパイルし、ランタイムライブラリへの依存をなくす
@z
@x
# Stage 2: Runtime stage
@y
# ステージ 2: ランタイムステージ
@z
@x
# Copy the static binary from the build stage
@y
# ビルドステージからのスタティックバイナリのコピー
@z
@x
# Command to run the binary
@y
# バイナリを実行するコマンド
@z

@x
The `Dockerfile` has two stages:
@y
`Dockerfile` にはステージが 2 つあります。
@z

@x
1. **Build stage**: This stage uses the `ubuntu:latest` image to compile the C++ code and create a static binary.
2. **Runtime stage**: This stage uses the `scratch` image, which is an empty image, to copy the static binary from the build stage and run it.
@y
1. **ビルドステージ**: このステージはイメージとして `ubuntu:latest` を利用し、C++ コードをコンパイルしてスタティックバイナリを生成します。
2. **ランタイムステージ**: このステージは `scratch` イメージを利用しますが、これは空のイメージです。
   ビルドステージからスタティックバイナリをコピーしてそれを実行します。
@z

@x
## Build the Docker image
@y
## Docker イメージのビルド {#build-the-docker-image}
@z

@x
To build the Docker image, run the following command in the `hello` directory:
@y
Docker イメージをビルドするため、`hello` ディレクトリに入って以下のコマンドを実行します。
@z

% snip command...

@x
The `-t` flag tags the image with the name `hello`.
@y
`-t` フラグはこのイメージに対して `hello` という名前をつけるものです。
@z

@x
## Run the Docker container
@y
## Docker コンテナーの実行 {#run-the-docker-container}
@z

@x
To run the Docker container, use the following command:
@y
Docker コンテナーを起動するため、以下のコマンドを実行します。
@z

% snip command...

@x
You should see the output `Hello, World!` in the terminal.
@y
端末に `Hello, World!` が出力されます。
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this section, you learned how to create a multi-stage build for a C++ application. Multi-stage builds help you optimize the size of your final image and separate build dependencies from runtime dependencies.
In this example, the final image only contains the static binary and doesn't include any build dependencies.
@y
本節では C++ アプリケーション向けにマルチステージビルドの生成方法について学びました。
マルチステージビルドは最終イメージのサイズを最適化し、ランタイムの依存パッケージからビルド時の依存パッケージを切り離します。
本例における最終イメージにはスタティックイメージしか含まれず、ビルド時の依存パッケージは含まれていません。
@z

@x
As the image has an empty base, the usual OS tools are also absent. So, for example, you can't run a simple `ls` command in the container:
@y
イメージとして空のイメージをベースとしたため、普通にあるような OS ツールが含まれていません。
したがってコンテナー内では、たとえば `ls` といった単純なコマンドすら実行することはできません。
@z

% snip command...

@x
This makes the image very lightweight and secure.
@y
こうしてイメージを軽量にそしてセキュアに作り出します。
@z
