%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Containerize a Node.js application
keywords: node.js, node, containerize, initialize
description: Learn how to containerize a Node.js application.
@y
title: Node.js アプリケーションのコンテナー化
keywords: node.js, node, containerize, initialize
description: Node.js アプリケーションのコンテナー化について学びます。
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
* You have installed the latest version of [Docker
  Desktop](../../get-docker.md).
* You have a [git client](https://git-scm.com/downloads). The examples in this
  section use a command-line based git client, but you can use any client.
@y
* [Docker Desktop](../../get-docker.md) の最新版をインストールしていること。
* [git クライアント](https://git-scm.com/downloads) が利用可能であること。
  本節の利用例ではコマンドラインベースの git クライアントを用いていきますが、別のクライアントを用いてもかまいません。
@z

@x
## Overview
@y
## 概要 {#overview}
@z

@x
This section walks you through containerizing and running a Node.js
application.
@y
本節では Node.js アプリケーションをコンテナー化して実行する手順を示していきます。
@z

@x
## Get the sample application
@y
## サンプルアプリケーションの入手 {#get-the-sample-application}
@z

@x
Clone the sample application to use with this guide. Open a terminal, change
directory to a directory that you want to work in, and run the following command
to clone the repository:
@y
本ガイドにおいて利用するサンプルアプリケーションをクローンします。
端末画面を開いて、作業を行うディレクトリに移動します。
そして以下のコマンドを実行してリポジトリをクローンします。
@z

@x
```console
$ git clone https://github.com/docker/docker-nodejs-sample
```
@y
```console
$ git clone https://github.com/docker/docker-nodejs-sample
```
@z

@x
## Initialize Docker assets
@y
## Docker アセットの初期化 {#initialize-docker-assets}
@z

@x
Now that you have an application, you can use `docker init` to create the
necessary Docker assets to containerize your application. Inside the
`docker-nodejs-sample` directory, run the `docker init` command in a terminal.
`docker init` provides some default configuration, but you'll need to answer a
few questions about your application. Refer to the following example to answer
the prompts from `docker init` and use the same answers for your prompts.
@y
アプリケーションの入手はできました。
次に `docker init` を実行して、アプリケーションのコンテナー化に必要となる Docker アセットを生成します。
端末画面内の `docker-nodejs-sample` ディレクトリにおいて `docker init` コマンドを実行します。
`docker init` はデフォルトの設定をいくつか行いますが、アプリケーション内容についていくつか質問が行われるので、それに答えます。
以下の利用例において `docker init` の質問への答えを示しているので、これを参考に同様の入力を行ってください。
@z

@x
```console
$ docker init
Welcome to the Docker Init CLI!
@y
```console
$ docker init
Welcome to the Docker Init CLI!
@z

@x
This utility will walk you through creating the following files with sensible defaults for your project:
  - .dockerignore
  - Dockerfile
  - compose.yaml
  - README.Docker.md
@y
This utility will walk you through creating the following files with sensible defaults for your project:
  - .dockerignore
  - Dockerfile
  - compose.yaml
  - README.Docker.md
@z

@x
Let's get started!
@y
Let's get started!
@z

@x
? What application platform does your project use? Node
? What version of Node do you want to use? 18.0.0
? Which package manager do you want to use? npm
? What command do you want to use to start the app: node src/index.js
? What port does your server listen on? 3000
```
@y
? What application platform does your project use? Node
? What version of Node do you want to use? 18.0.0
? Which package manager do you want to use? npm
? What command do you want to use to start the app: node src/index.js
? What port does your server listen on? 3000
```
@z

@x
You should now have the following contents in your `docker-nodejs-sample`
directory.
@y
上により `docker-nodejs-sample` ディレクトリ内は以下の構成となるはずです。
@z

@x
```text
├── docker-nodejs-sample/
│ ├── spec/
│ ├── src/
│ ├── .dockerignore
│ ├── .gitignore
│ ├── compose.yaml
│ ├── Dockerfile
│ ├── package-lock.json
│ ├── package.json
│ ├── README.Docker.md
│ └── README.md
```
@y
```text
├── docker-nodejs-sample/
│ ├── spec/
│ ├── src/
│ ├── .dockerignore
│ ├── .gitignore
│ ├── compose.yaml
│ ├── Dockerfile
│ ├── package-lock.json
│ ├── package.json
│ ├── README.Docker.md
│ └── README.md
```
@z

@x
To learn more about the files that `docker init` added, see the following:
 - [Dockerfile](../../reference/dockerfile.md)
 - [.dockerignore](../../reference/dockerfile.md#dockerignore-file)
 - [compose.yaml](../../compose/compose-file/_index.md)
@y
`docker init` が追加したファイルについての詳細は、以下を参照してください。
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
Inside the `docker-nodejs-sample` directory, run the following command in a
terminal.
@y
端末画面内の `docker-nodejs-sample` ディレクトリから以下のコマンドを実行します。
@z

@x
```console
$ docker compose up --build
```
@y
```console
$ docker compose up --build
```
@z

@x
Open a browser and view the application at [http://localhost:3000](http://localhost:3000). You should see a simple todo application.
@y
ブラウザーを開いて [http://localhost:3000](http://localhost:3000) にアクセスし、アプリケーションを確認します。
シンプルな todo アプリケーションが表示されたはずです。
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
option. Inside the `docker-nodejs-sample` directory, run the following command
in a terminal.
@y
アプリケーションは端末から切り離して実行することができます。
それには `-d` オプションをつけます。
端末画面内の `docker-nodejs-sample` ディレクトリから以下のコマンドを実行します。
@z

@x
```console
$ docker compose up --build -d
```
@y
```console
$ docker compose up --build -d
```
@z

@x
Open a browser and view the application at [http://localhost:3000](http://localhost:3000).
@y
ブラウザーを開いて [http://localhost:3000](http://localhost:3000) にアクセスし、アプリケーションを確認します。
@z

@x
You should see a simple todo application.
@y
シンプルな todo アプリケーションが表示されたはずです。
@z

@x
In the terminal, run the following command to stop the application.
@y
端末画面から以下のコマンドを実行してアプリケーションを停止します。
@z

@x
```console
$ docker compose down
```
@y
```console
$ docker compose down
```
@z

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
In this section, you learned how you can containerize and run your Node.js
application using Docker.
@y
本節では Docker を使って Node.js アプリケーションをコンテナー化して実行する方法について学びました。
@z

@x
Related information:
 - [Dockerfile reference](../../reference/dockerfile.md)
 - [Build with Docker guide](../../build/guide/index.md)
 - [.dockerignore file reference](../../reference/dockerfile.md#dockerignore-file)
 - [Docker Compose overview](../../compose/_index.md)
@y
関連情報
 - [Dockerfile リファレンス](../../reference/dockerfile.md)
 - [Docker ガイドを使ったビルド](../../build/guide/index.md)
 - [.dockerignore ファイルリファレンス](../../reference/dockerfile.md#dockerignore-file)
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
