%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: Containerize a R application
keywords: R, containerize, initialize
description: Learn how to containerize a R application.
@y
title: R 言語アプリケーションのコンテナー化
keywords: R, containerize, initialize
description: R 言語アプリケーションのコンテナー化について学びます。
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
* You have a [git client](https://git-scm.com/downloads). The examples in this section use a command-line based git client, but you can use any client.
@y
* [git クライアント](https://git-scm.com/downloads) が利用可能であること。
  本節の利用例ではコマンドラインベースの git クライアントを用いていきますが、別のクライアントを用いてもかまいません。
@z

@x
## Overview
@y
## 概要 {#overview}
@z

@x
This section walks you through containerizing and running a R application.
@y
本節では R 言語アプリケーションをコンテナー化して実行する手順を示していきます。
@z

@x
## Get the sample application
@y
## サンプルアプリケーションの入手 {#get-the-sample-application}
@z

@x
The sample application uses the popular [Shiny](https://shiny.posit.co/) framework.
@y
サンプルアプリケーションでは、人気の [Shiny](https://shiny.posit.co/) フレームワークを利用しています。
@z

@x
Clone the sample application to use with this guide. Open a terminal, change directory to a directory that you want to work in, and run the following command to clone the repository:
@y
本ガイドにおいて利用するサンプルアプリケーションをクローンします。
端末画面を開いて、作業を行うディレクトリに移動します。
そして以下のコマンドを実行してリポジトリをクローンします。
@z

% snip code...

@x
You should now have the following contents in your `r-docker-dev`
directory.
@y
上の結果として `r-docker-dev` ディレクトリの中には以下の内容が生成されたはずです。
@z

% snip text...

@x
To learn more about the files in the repository, see the following:
 - [Dockerfile](../../reference/dockerfile.md)
 - [.dockerignore](../../reference/dockerfile.md#dockerignore-file)
 - [compose.yaml](../../compose/compose-file/_index.md)
@y
リポジトリ内のファイルについての詳細は、以下を参照してください。
 - [Dockerfile](../../reference/dockerfile.md)
 - [.dockerignore](../../reference/dockerfile.md#dockerignore-file)
 - [compose.yaml](../../compose/compose-file/_index.md)
@z

@x
## Run the application
@y
## アプリケーションの実行 {#run-the-application}
@z

@x
Inside the `r-docker-dev` directory, run the following command in a
terminal.
@y
端末画面内の `r-docker-dev` ディレクトリから以下のコマンドを実行します。
@z

% snip command...

@x
Open a browser and view the application at [http://localhost:3838](http://localhost:3838). You should see a simple Shiny application.
@y
ブラウザーを開いて [http://localhost:3838](http://localhost:3838) にアクセスし、アプリケーションを確認します。
シンプルな Shiny アプリケーションが表示されたはずです。
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
option. Inside the `r-docker-dev` directory, run the following command
in a terminal.
@y
アプリケーションは端末から切り離して実行することができます。
それには `-d` オプションをつけます。
端末画面内の `r-docker-dev` ディレクトリから以下のコマンドを実行します。
@z

% snip command...

@x
Open a browser and view the application at [http://localhost:3838](http://localhost:3838).
@y
ブラウザーを開いて [http://localhost:3838](http://localhost:3838) にアクセスし、アプリケーションを確認します。
@z

@x
You should see a simple Shiny application.
@y
シンプルな Shiny アプリケーションが表示されたはずです。
@z

@x
In the terminal, run the following command to stop the application.
@y
端末画面から以下のコマンドを実行してアプリケーションを停止します。
@z

% snip command...

@x
For more information about Compose commands, see the [Compose CLI
reference](../../compose/reference/_index.md).
@y
Compose コマンドの詳細は [Compose CLI リファレンス](../../compose/reference/_index.md) を参照してください。
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this section, you learned how you can containerize and run your R
application using Docker.
@y
本節では Docker を使って R 言語アプリケーションをコンテナー化して実行する方法について学びました。
@z

@x
Related information:
 - [Build with Docker guide](../../build/guide/index.md)
 - [Docker Compose overview](../../compose/_index.md)
@y
関連情報
 - [Docker ガイドを使ったビルド](../../build/guide/index.md)
 - [Docker Compose 概要](../../compose/_index.md)
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

@x
{{< button text="Develop your application" url="develop.md" >}}
@y
{{< button text="アプリケーションの開発" url="develop.md" >}}
@z
