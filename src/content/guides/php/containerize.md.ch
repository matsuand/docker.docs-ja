%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Containerize a PHP application
linkTitle: Containerize your app
@y
title: PHP アプリケーションのコンテナー化
linkTitle: アプリのコンテナー化
@z

@x
keywords: php, containerize, initialize, apache, composer
description: Learn how to containerize a PHP application.
@y
keywords: php, containerize, initialize, apache, composer
description: PHP アプリケーションのコンテナー化について学びます。
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
- You have installed the latest version of [Docker
  Desktop](/get-started/get-docker.md).
- You have a [git client](https://git-scm.com/downloads). The examples in this
  section use a command-line based git client, but you can use any client.
@y
- [Docker Desktop](get-started/get-docker.md) の最新バージョンをインストールしていること。
- [git クライアント](https://git-scm.com/downloads) が利用可能であること。
  本節の利用例ではコマンドラインベースの git クライアントを用いていきますが、別のクライアントを用いてもかまいません。
@z

@x
## Overview
@y
## 概要 {#overview}
@z

@x
This section walks you through containerizing and running a PHP
application.
@y
本節では PHP アプリケーションをコンテナー化して実行する手順を示していきます。
@z

@x
## Get the sample applications
@y
## サンプルアプリケーションの入手 {#get-the-sample-application}
@z

@x
In this guide, you will use a pre-built PHP application. The application uses Composer for library dependency management. You'll serve the application via an Apache web server.
@y
このガイドでは、あらかじめビルドされている PHP アプリケーションを使っていきます。
このアプリケーションは依存パッケージの管理に Composer を使っています。
アプリケーションは Apache ウェブサーバーを使って提供されます。
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
The sample application is a basic hello world application and an application that increments a counter in a database. In addition, the application uses PHPUnit for testing.
@y
サンプルアプリケーションは単純な hello world アプリケーションです。
そしてデータベース内に保存しているカウンターを加算します。
またテスト実行のため PHPUnit を用いています。
@z

@x
## Initialize Docker assets
@y
## Docker アセットの初期化 {#initialize-docker-assets}
@z

@x
Now that you have an application, you can use `docker init` to create the
necessary Docker assets to containerize your application. Inside the
`docker-php-sample` directory, run the `docker init` command in a terminal.
`docker init` provides some default configuration, but you'll need to answer a
few questions about your application. For example, this application uses PHP
version 8.2. Refer to the following `docker init` example and use the same
answers for your prompts.
@y
アプリケーションを入手できたので、アプリケーションのコンテナー化に向けて `docker init` を実行し、必要な Docker アセットを生成します。
端末上から `docker-php-sample` ディレクトリに移動して `docker init` コマンドを実行します。
`docker init` はデフォルトの設定を生成していくものであり、アプリケーションに対する質問が出されるのでこれに答えていきます。
たとえばこのアプリケーションは PHP バージョン 8.2 を使っています。
以下の例における `docker init` への回答プロンプトを参考にして、同様の回答を行ってください。
@z

% snip command...

@x
You should now have the following contents in your `docker-php-sample`
directory.
@y
上により `docker-php-sample` ディレクトリ内は以下の内容となるはずです。
@z

% snip text...

@x
To learn more about the files that `docker init` added, see the following:
@y
`docker init` が追加した各ファイルについての詳細は以下を参照してください。
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
Inside the `docker-php-sample` directory, run the following command in a
terminal.
@y
端末画面内の `docker-php-sample` ディレクトリから以下のコマンドを実行します。
@z

% snip command...

@x
Open a browser and view the application at [http://localhost:9000/hello.php](http://localhost:9000/hello.php). You should see a simple hello world application.
@y
ブラウザーを開いて [http://localhost:9000/hello.php](http://localhost:9000/hello.php) にアクセスしてアプリケーションを確認します。
単純な hello world アプリケーションが表示されたはずです。
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
option. Inside the `docker-php-sample` directory, run the following command
in a terminal.
@y
アプリケーションは端末から切り離して実行することができます。
それには `-d` オプションをつけます。
端末画面内の `docker-php-sample` ディレクトリから以下のコマンドを実行します。
@z

% snip command...

@x
Open a browser and view the application at [http://localhost:9000/hello.php](http://localhost:9000/hello.php). You should see a simple hello world application.
@y
ブラウザーを開いて [http://localhost:9000/hello.php](http://localhost:9000/hello.php) にアクセスしてアプリケーションを確認します。
単純な hello world アプリケーションが表示されたはずです。
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
In this section, you learned how you can containerize and run a simple PHP
application using Docker.
@y
本節では Docker を使って、単純な PHP アプリケーションをコンテナー化して実行する方法について学びました。
@z

@x
Related information:
@y
関連情報
@z

@x
- [docker init reference](/reference/cli/docker/init.md)
@y
- [docker init リファレンス](reference/cli/docker/init.md)
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
