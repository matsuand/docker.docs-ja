%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
title: Containerize a C++ application
linkTitle: Build and run a C++ application using Docker Compose
@y
title: C++ アプリケーションのコンテナー化
linkTitle: Docker Compose を使った C++ アプリケーションのビルドと実行
@z

@x
keywords: C++, containerize, initialize
description: Learn how to use Docker Compose to build and run a C++ application.
@y
keywords: C++, containerize, initialize
description: Docker Compose を使って C++ アプリケーションのビルドと実行について学びます。
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
- You have a [Git client](https://git-scm.com/downloads). The examples in this section use a command-line based Git client, but you can use any client.
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
This section walks you through containerizing and running a C++ application, using Docker Compose.
@y
本節では Docker Compose を使って C++ アプリケーションをコンテナー化し実行する手順を示していきます。
@z

@x
## Get the sample application
@y
## サンプルアプリケーションの入手 {#get-the-sample-application}
@z

@x
We're using the same sample repository that you used in the previous sections of this guide. If you haven't already cloned the repository, clone it now:
@y
ここでは本ガイドの前節にて利用したサンプルリポジトリを再度利用します。
リポジトリのクローンを取得していない場合は、ここでクローンを取得します。
@z

% snip command...

@x
You should now have the following contents in your `c-plus-plus-docker` (root)
directory.
@y
上により `c-plus-plus-docker` (ルート) ディレクトリ内は以下の内容となるはずです。
@z

% snip text...

@x
To learn more about the files in the repository, see the following:
@y
リポジトリ内の各ファイルについての詳細は以下を参照してください。
@z

@x
- [Dockerfile](/reference/dockerfile.md)
- [.dockerignore](/reference/dockerfile.md#dockerignore-file)
- [compose.yml](/reference/compose-file/_index.md)
@y
- [Dockerfile](reference/dockerfile.md)
- [.dockerignore](reference/dockerfile.md#dockerignore-file)
- [compose.yml](reference/compose-file/_index.md)
@z

@x
## Run the application
@y
## アプリケーションの実行 {#run-the-application}
@z

@x
Inside the `c-plus-plus-docker` directory, run the following command in a
terminal.
@y
端末画面内の `c-plus-plus-docker` ディレクトリから以下のコマンドを実行します。
@z

% snip command...

@x
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You will see a message `{"Status" : "OK"}` in the browser.
@y
ブラウザーを開いて [http://localhost:8080](http://localhost:8080) にアクセスしてアプリケーションを確認します。
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
option. Inside the `c-plus-plus-docker` directory, run the following command
in a terminal.
@y
アプリケーションは端末から切り離して実行することができます。
それには `-d` オプションをつけます。
端末画面内の `c-plus-plus-docker` ディレクトリから以下のコマンドを実行します。
@z

% snip command...

@x
Open a browser and view the application at [http://localhost:8080](http://localhost:8080).
@y
ブラウザーを開いて [http://localhost:8080](http://localhost:8080) にアクセスしてアプリケーションを確認します。
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
In this section, you learned how you can containerize and run your C++
application using Docker.
@y
本節では Docker を使って C++ アプリケーションをコンテナー化して実行する方法について学びました。
@z

@x
Related information:
@y
関連情報
@z

@x
- [Docker Compose overview](/manuals/compose/_index.md)
@y
- [Docker Compose 概要](manuals/compose/_index.md)
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
