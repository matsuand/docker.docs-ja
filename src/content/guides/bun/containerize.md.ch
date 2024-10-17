%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

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
In the Dockerfile, you'll notice that the `FROM` instruction uses `oven/bun`
as the base image. This is the official image for Bun created by Oven, the
company behind Bun. This image is [available on the Docker Hub](https://hub.docker.com/r/oven/bun).
@y
Dockerfile では `FROM` 命令において、ベースイメージとして `oven/bun` を指定しています。
これは Bun の開発元である企業 Oven によって生成されている Bun の公式イメージです。
このイメージは [Docker Hub から入手](https://hub.docker.com/r/oven/bun) が可能です。
@z

@x
# Use the Bun image as the base image
@y
# ベースイメージとして Bun イメージを利用
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
Aside from specifying `oven/bun` as the base image, this Dockerfile also:
@y
ベースイメージとして `oven/bun` を指定している他にも Dockerfile では以下の内容が示されています。
@z

@x
- Sets the working directory in the container to `/app`
- Copies the contents of the current directory to the `/app` directory in the container
- Exposes port 3000, where the API is listening for requests
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
@y
 - [Dockerfile リファレンス](reference/dockerfile.md)
 - [.dockerignore ファイル](reference/dockerfile.md#dockerignore-file)
 - [Docker Compose 概要](manuals/compose/_index.md)
 - [Compose ファイルリファレンス](reference/compose-file/_index.md)
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
