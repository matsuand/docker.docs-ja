%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Containerize a Bun application
linkTitle: Containerize your app
@y
title: Bun アプリケーションのコンテナー化
linkTitle: アプリのコンテナー化
@z

@x
keywords: bun, containerize, initialize
description: Learn how to containerize a Bun application.
@y
keywords: bun, containerize, initialize
description: Bun アプリケーションのコンテナー化について学びます。
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
* You have a [Git client](https://git-scm.com/downloads). The examples in this section use a command-line based Git client, but you can use any client.
@y
- [git クライアント](https://git-scm.com/downloads) が利用可能であること。
  本節の利用例ではコマンドラインベースの git クライアントを用いていきますが、別のクライアントを用いてもかまいません。
@z

@x
## Overview
@y
## 概要 {#overview}
@z

@x
For a long time, Node.js has been the de-facto runtime for server-side
JavaScript applications. Recent years have seen a rise in new alternative
runtimes in the ecosystem, including [Bun website](https://bun.sh/). Like
Node.js, Bun is a JavaScript runtime. Bun is a comparatively lightweight
runtime that is designed to be fast and efficient.
@y
サーバーサイドの JavaScript アプリケーションとしては、長らく Node.js がデファクトスタンダードのランタイムとなっていました。
しかし最近では [Bun ウェブサイト](https://bun.sh/) のように、エコシステムでの新しいランタイムが代わりに登場してきています。
Node.js と同じく Bun も JavaScript のランタイムですが、比較的軽量であり、高速化と効率化を目指して設計されています。
@z

@x
Why develop Bun applications with Docker? Having multiple runtimes to choose
from is great. But as the number of runtimes increases, it becomes challenging
to manage the different runtimes and their dependencies consistently across
environments. This is where Docker comes in. Creating and destroying containers
on demand is a great way to manage the different runtimes and their
dependencies. Also, as it's fairly a new runtime, getting a consistent
development environment for Bun can be challenging. Docker can help you set up
a consistent development environment for Bun.
@y
Docker を使って Bun アプリケーションを開発するのはなぜでしょう？
複数のランタイムが選択肢としてあるのは好ましいことです。
しかしランタイム数が増えるたびに、複数の異なるランタイムとその依存パッケージを常時管理し続けなければならなくなります。
これだからこそ Docker の登場となります。
必要に応じてコンテナーの生成と削除が行えるのは、たくさんのランタイムとその依存パッケージを管理する方法として適しています。
さらに Bun は新しいランタイムであるため、Bun による一貫した開発環境を整えることは実にやりがいがあります。
Docker はそのような一貫した Bun 開発環境を構築する助けとなります。
@z

@x
## Get the sample application
@y
## サンプルアプリケーションの入手 {#get-the-sample-application}
@z

@x
Clone the sample application to use with this guide. Open a terminal, change
directory to a directory that you want to work in, and run the following
command to clone the repository:
@y
本ガイドにおいて利用するサンプルアプリケーションをクローンします。
端末画面を開いて、作業を行うディレクトリに移動します。
そして以下のコマンドを実行してリポジトリをクローンします。
@z

% snip command...

@x
You should now have the following contents in your `bun-docker` directory.
@y
上により `bun-docker` ディレクトリ内は以下の内容となるはずです。
@z

% snip text...

@x
## Create a Dockerfile
@y
## Dockerfile の生成 {#create-a-dockerfile}
@z

@x
Before creating a Dockerfile, you need to choose a base image. You can either use the [Bun Docker Official Image](https://hub.docker.com/r/oven/bun) or a Docker Hardened Image (DHI) from the [Hardened Image catalog](https://hub.docker.com/hardened-images/catalog).
@y
Dockerfile を生成するには、まずベースイメージを決定する必要があります。
[Bun 用の Docker 公式イメージ](https://hub.docker.com/r/oven/bun) を利用することが出来ますし、[Hardened イメージカタログ](https://hub.docker.com/hardened-images/catalog) から Docker Hardened イメージ (DHI) を選ぶこともできます。
@z

@x
Choosing DHI offers the advantage of a production-ready image that is lightweight and secure. For more information, see [Docker Hardened Images](https://docs.docker.com/dhi/).
@y
DHI を選ぶと、軽量でセキュアなイメージを本番環境向けにすぐ活用できます。
詳しくは [Docker Hardened イメージ](https://docs.docker.com/dhi/) を参照してください。
@z

@x
{{< tabs >}}
{{< tab name="Using Docker Hardened Images" >}}
@y
{{< tabs >}}
{{< tab name="Docker Hardened イメージの利用" >}}
@z

@x
Docker Hardened Images (DHIs) are available for Bun in the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog/dhi/bun). You can pull DHIs directly from the `dhi.io` registry.
@y
Bun 向けの Docker Hardened イメージ (DHI) は [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog/dhi/bun) から入手します。
DHI は `dhi.io` レジストリから直接プルすることができます。
@z

@x
1. Sign in to the DHI registry:
@y
1. DHI レジストリにサインインします。
@z

% snip command...

@x
2. Pull the Bun DHI as `dhi.io/bun:1`. The tag (`1`) in this example refers to the version to the latest 1.x version of Bun.
@y
2. Bun DHI を `dhi.io/bun:1` としてプルします。
   この例に示すタグ (`1`) は、Bun の最新 1.x バージョンを指します。
@z

% snip command...

@x
For other available versions, refer to the [catalog](https://hub.docker.com/hardened-images/catalog/dhi/bun).
@y
上以外に利用可能なバージョンについては [カタログ](https://hub.docker.com/hardened-images/catalog/dhi/bun) を参照してください。
@z

@x
# Use the DHI Bun image as the base image
@y
# ベースイメージとして DHI Bun イメージを利用
@z
@x
# Set the working directory in the container
@y
# コンテナー内でのワーキングディレクトリの設定
@z
@x
# Copy the current directory contents into the container at /app
@y
# カレントディレクトリ内のコンテンツをコンテナー内の /app にコピー
@z
@x
# Expose the port on which the API will listen
@y
# API が利用するポートを開放
@z
@x
# Run the server when the container launches
@y
# コンテナー起動時にサーバーを実行
@z

@x
{{< /tab >}}
{{< tab name="Using the official image" >}}
@y
{{< /tab >}}
{{< tab name="公式イメージの利用" >}}
@z

@x
Using the Docker Official Image is straightforward. In the following Dockerfile, you'll notice that the `FROM` instruction uses `oven/bun` as the base image.
@y
Docker 公式イメージを用いるのが一番簡単です。
以下の Dockerfile では `FROM` 命令のベースイメージに `oven/bun` を指定しています。
@z

@x
You can find the image on [Docker Hub](https://hub.docker.com/r/oven/bun). This is the Docker Official Image for Bun created by Oven, the company behind Bun, and it's available on Docker Hub.

@y
このイメージは [Docker Hub](https://hub.docker.com/r/oven/bun) にあります。
これは Bun 向けの Docker 公式イメージであり、Bun に関係する企業 Oven により生成されています。
これは Docker Hub から利用できるものではありません。
@z

@x within code
# Use the official Bun image
@y
# 公式 Bun イメージの利用
@z
@x
# Set the working directory in the container
@y
# コンテナー内でのワーキングディレクトリの設定
@z
@x
# Copy the current directory contents into the container at /app
@y
# カレントディレクトリ内のコンテンツをコンテナー内の /app にコピー
@z
@x
# Expose the port on which the API will listen
@y
# API が利用するポートを開放
@z
@x
# Run the server when the container launches
@y
# コンテナー起動時にサーバーを実行
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
In addition to specifying the base image, the Dockerfile also:
@y
ベースイメージの指定に続けて Dockerfile では以下も行っています。
@z

@x
- Sets the working directory in the container to `/app`.
- Copies the content of the current directory to the `/app` directory in the container.
- Exposes port 3000, where the API is listening for requests.
- And finally, starts the server when the container launches with the command `bun server.js`.
@y
- コンテナー内のワーキングディレクトリを `/app` に設定しています。
- カレントディレクトリ内の内容を、コンテナー内の `/app` ディレクトリにコピーします。
- ポート 3000 番を開放します。API がこのポートからリクエストを受け付けます。
- コマンド `bun server.js` の実行によってコンテナー起動が行われた際に、サーバーを実行します。
@z

@x
## Run the application
@y
## アプリケーションの実行 {#run-the-application}
@z

@x
Inside the `bun-docker` directory, run the following command in a terminal.
@y
端末画面内の `bun-docker` ディレクトリから以下のコマンドを実行します。
@z

% snip command...

@x
Open a browser and view the application at [http://localhost:3000](http://localhost:3000). You will see a message `{"Status" : "OK"}` in the browser.
@y
ブラウザーを開いて [http://localhost:3000](http://localhost:3000) にアクセスしてアプリケーションを確認します。
ブラウザー上には `{"Status" : "OK"}` というメッセージが表示されるはずです。
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
option. Inside the `bun-docker` directory, run the following command
in a terminal.
@y
アプリケーションは端末から切り離して実行することができます。
それには `-d` オプションをつけます。
端末画面内の `bun-docker` ディレクトリから以下のコマンドを実行します。
@z

% snip command...

@x
Open a browser and view the application at [http://localhost:3000](http://localhost:3000).
@y
ブラウザーを開いて [http://localhost:3000](http://localhost:3000) にアクセスしてアプリケーションを確認します。
@z

@x
In the terminal, run the following command to stop the application.
@y
端末画面から以下のコマンドを実行してアプリケーションを停止します。
@z

% snip command...

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this section, you learned how you can containerize and run your Bun
application using Docker.
@y
本節では Docker を使って Bun アプリケーションをコンテナー化して実行する方法について学びました。
@z

@x
Related information:
@y
関連情報
@z

@x
 - [Dockerfile reference](/reference/dockerfile.md)
 - [.dockerignore file](/reference/dockerfile.md#dockerignore-file)
 - [Docker Compose overview](/manuals/compose/_index.md)
 - [Compose file reference](/reference/compose-file/_index.md)
 - [Docker Hardened Images](/dhi/)
@y
 - [Dockerfile リファレンス](reference/dockerfile.md)
 - [.dockerignore ファイル](reference/dockerfile.md#dockerignore-file)
 - [Docker Compose 概要](manuals/compose/_index.md)
 - [Compose ファイルリファレンス](reference/compose-file/_index.md)
 - [Docker Hardened イメージ](__SUBDIR__/dhi/)
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
In the next section, you'll learn how you can develop your application using
containers.
@y
次の節では、コンテナーを使ってアプリケーションの開発を行う方法を学びます。
@z
