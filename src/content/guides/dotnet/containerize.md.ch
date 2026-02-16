%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Containerize a .NET application
linkTitle: Containerize your app
@y
title: .NET アプリケーションのコンテナー化
linkTitle: アプリのコンテナー化
@z

@x
keywords: .net, containerize, initialize
description: Learn how to containerize an ASP.NET application.
@y
keywords: .net, containerize, initialize
description: ASP.NET アプリケーションのコンテナー化について学びます。
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
* You have installed the latest version of [Docker
  Desktop](/get-started/get-docker.md).
* You have a [git client](https://git-scm.com/downloads). The examples in this
  section use a command-line based git client, but you can use any client.
@y
* [Docker Desktop](get-started/get-docker.md) の最新バージョンをインストールしていること。
* [git クライアント](https://git-scm.com/downloads) が利用可能であること。
  本節の利用例ではコマンドラインベースの git クライアントを用いていきますが、別のクライアントを用いてもかまいません。
@z

@x
## Overview
@y
## 概要 {#overview}
@z

@x
This section walks you through containerizing and running a .NET
application.
@y
本節では .NET アプリケーションをコンテナー化して実行する手順を示していきます。
@z

@x
## Get the sample applications
@y
## サンプルアプリケーションの入手 {#get-the-sample-application}
@z

@x
In this guide, you will use a pre-built .NET application. The application is
similar to the application built in the Docker Blog article, [Building a
Multi-Container .NET App Using Docker
Desktop](https://www.docker.com/blog/building-multi-container-net-app-using-docker-desktop/).
@y
このガイドでは、あらかじめビルドされている .NET アプリケーションを利用します。
このアプリケーションは、Docker Blog 記事 [Building a
Multi-Container .NET App Using Docker
Desktop](https://www.docker.com/blog/building-multi-container-net-app-using-docker-desktop/) においてビルドしているアプリケーションと同等のものです。
.
@z

@x
Open a terminal, change directory to a directory that you want to work in, and
run the following command to clone the repository.
@y
端末画面を開いて、作業を行うディレクトリに移動します。
そして以下のコマンドを実行してリポジトリをクローンします。
@z

% snip command...

@x
## Initialize Docker assets
@y
## Docker アセットの初期化 {#initialize-docker-assets}
@z

@x
Now that you have an application, you can create the necessary Docker assets to containerize it. You can choose between using the official .NET images or Docker Hardened Images (DHI).
@y
アプリケーションを入手できたので、必要な Docker アセットを生成してコンテナー化を行います。
方法として 公式 .NET イメージと Docker Hardened イメージ (DHI) のいずれかを用います。
@z

@x
> [Docker Hardened Images (DHIs)](https://docs.docker.com/dhi/) are minimal, secure, and production-ready container base and application images maintained by Docker. DHI images are recommended for better security—they are designed to reduce vulnerabilities and simplify compliance.
@y
> [Docker Hardened イメージ (DHI)](https://docs.docker.com/dhi/) are minimal, secure, and production-ready container base and application images maintained by Docker. DHI images are recommended for better security—they are designed to reduce vulnerabilities and simplify compliance.
@z

@x
{{< tabs >}}
{{< tab name="Using Docker Hardened Images" >}}
@y
{{< tabs >}}
{{< tab name="Using Docker Hardened Images" >}}
@z

@x
Docker Hardened Images (DHIs) for .NET are available in the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog/dhi/aspnetcore). Docker Hardened Images are freely available to everyone with no subscription required. You can pull and use them like any other Docker image after signing in to the DHI registry. For more information, see the [DHI quickstart](/dhi/get-started/) guide.
@y
Docker Hardened Images (DHIs) for .NET are available in the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog/dhi/aspnetcore). Docker Hardened Images are freely available to everyone with no subscription required. You can pull and use them like any other Docker image after signing in to the DHI registry. For more information, see the [DHI quickstart](/dhi/get-started/) guide.
@z

@x
1. Sign in to the DHI registry:
@y
1. DHI レジストリにサインインします。
@z

% snip command...

@x
2. Pull the .NET SDK DHI (check the catalog for available versions):
@y
2. .NET SDK DHI をプルします (利用可能なバージョンについてはカタログを確認してください)。
@z

% snip command...

@x
3. Pull the ASP.NET Core runtime DHI (check the catalog for available versions):
@y
3. ASP.NET コアランタイム DHI をプルします (利用可能なバージョンについてはカタログを確認してください)。
@z

% snip command...

@x
You can use `docker init` to generate Docker assets, then modify the Dockerfile to use DHI images:
@y
You can use `docker init` to generate Docker assets, then modify the Dockerfile to use DHI images:
@z

% snip command...

@x
In the following Dockerfile, the `FROM` instructions use `dhi.io/dotnet:10-sdk` and `dhi.io/aspnetcore:10` as the base images.
@y
In the following Dockerfile, the `FROM` instructions use `dhi.io/dotnet:10-sdk` and `dhi.io/aspnetcore:10` as the base images.
@z

% snip code...

@x
> [!NOTE]
>
> DHI runtime images already run as a non-root user (`nonroot`, UID 65532), so there's no need to create a user or specify `USER` in your Dockerfile. This reduces the attack surface and simplifies your configuration.
@y
> [!NOTE]
>
> DHI runtime images already run as a non-root user (`nonroot`, UID 65532), so there's no need to create a user or specify `USER` in your Dockerfile. This reduces the attack surface and simplifies your configuration.
@z

@x
{{< /tab >}}
{{< tab name="Using the official .NET 10 image" >}}
@y
{{< /tab >}}
{{< tab name="Using the official .NET 10 image" >}}
@z

@x
You can use `docker init` to create the necessary Docker assets. Inside the `docker-dotnet-sample` directory, run the `docker init` command in a terminal. `docker init` provides some default configuration, but you'll need to answer a few questions about your application. Refer to the following example to answer the prompts from `docker init` and use the same answers for your prompts.
@y
You can use `docker init` to create the necessary Docker assets. Inside the `docker-dotnet-sample` directory, run the `docker init` command in a terminal. `docker init` provides some default configuration, but you'll need to answer a few questions about your application. Refer to the following example to answer the prompts from `docker init` and use the same answers for your prompts.
@z

% snip command...

@x
This generates a Dockerfile using the official .NET 10 images from Microsoft Container Registry:
@y
This generates a Dockerfile using the official .NET 10 images from Microsoft Container Registry:
@z

% snip code...

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
You should now have the following contents in your `docker-dotnet-sample`
directory.
@y
上により `docker-dotnet-sample` ディレクトリ内は以下の内容となるはずです。
@z

% snip text...

@x
To learn more about the files, see the following:
@y
各ファイルについての詳細は以下を参照してください。
@z

@x
 - [Dockerfile](/reference/dockerfile.md)
 - [.dockerignore](/reference/dockerfile.md#dockerignore-file)
 - [compose.yaml](/reference/compose-file/_index.md)
@y
 - [Dockerfile](reference/dockerfile.md)
 - [.dockerignore](reference/dockerfile.md#dockerignore-file)
 - [compose.yaml](reference/compose-file/_index.md)
@z

@x
## Run the application
@y
## アプリケーションの実行 {#run-the-application}
@z

@x
Inside the `docker-dotnet-sample` directory, run the following command in a
terminal.
@y
端末画面内の `docker-dotnet-sample` ディレクトリから以下のコマンドを実行します。
@z

% snip command...

@x
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see a simple web application.
@y
ブラウザーを開いて [http://localhost:8080](http://localhost:8080) にアクセスしてアプリケーションを確認します。
単純なウェブアプリケーションが表示されたはずです。
@z

@x
In the terminal, press `ctrl`+`c` to stop the application.
@y
端末画面から `ctrl`+`c` を押下してアプリケーションを停止します。
@z

@x
### Run the application in the background
@y
### バックグラウンドでのアプリケーション実行 {#run-the-application-in-the-background}
@z

@x
You can run the application detached from the terminal by adding the `-d`
option. Inside the `docker-dotnet-sample` directory, run the following command
in a terminal.
@y
アプリケーションは端末から切り離して実行することができます。
それには `-d` オプションをつけます。
端末画面内の `docker-dotnet-sample` ディレクトリから以下のコマンドを実行します。
@z

% snip command...

@x
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see a simple web application.
@y
ブラウザーを開いて [http://localhost:8080](http://localhost:8080) にアクセスしてアプリケーションを確認します。
単純なウェブアプリケーションが表示されたはずです。
@z

@x
In the terminal, run the following command to stop the application.
@y
端末画面から以下のコマンドを実行してアプリケーションを停止します。
@z

% snip command...

@x
For more information about Compose commands, see the [Compose CLI
reference](/reference/cli/docker/compose/_index.md).
@y
Compose コマンドの詳細は [Compose CLI リファレンス](reference/cli/docker/compose/_index.md) を参照してください。
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this section, you learned how you can containerize and run your .NET
application using Docker.
@y
本節では Docker を使って .NET アプリケーションをコンテナー化して実行する方法について学びました。
@z

@x
Related information:
@y
関連情報
@z

@x
 - [Dockerfile reference](/reference/dockerfile.md)
 - [.dockerignore file reference](/reference/dockerfile.md#dockerignore-file)
 - [Docker Compose overview](/manuals/compose/_index.md)
 - [Docker Hardened Images](/dhi/)
@y
 - [Dockerfile リファレンス](reference/dockerfile.md)
 - [.dockerignore ファイルリファレンス](reference/dockerfile.md#dockerignore-file)
 - [Docker Compose 概要](manuals/compose/_index.md)
 - [Docker Hardened イメージ](__SUBDIR__/dhi/)
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
In the next section, you'll learn how you can develop your application using
Docker containers.
@y
次の節では、Docker コンテナーを使ってアプリケーションの開発を行う方法を学びます。
@z
