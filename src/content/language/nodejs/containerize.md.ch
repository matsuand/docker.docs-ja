%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

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

% snip command...

@x
## Initialize Docker assets
@y
## Docker アセットの初期化 {#initialize-docker-assets}
@z

@x
Now that you have an application, you can create the necessary Docker assets to
containerize your application. You can use Docker Desktop's built-in Docker Init
feature to help streamline the process, or you can manually create the assets.

@y
アプリケーションの入手はできました。
次はアプリケーションのコンテナー化に必要となる Docker アセットを生成します。
Docker Desktop にはビルトインの Docker Init 機能があるので、効率的に作業を進められます。
あるいは手動でアセットを生成することもできます。
@z

@x
{{< tabs >}}
{{< tab name="Use Docker Init" >}}
@y
{{< tabs >}}
{{< tab name="Docker Init の利用" >}}
@z

@x
Inside the `docker-nodejs-sample` directory, run
the `docker init` command in a terminal. `docker init` provides some default
configuration, but you'll need to answer a few questions about your application.
Refer to the following example to answer the prompts from `docker init` and use
the same answers for your prompts.
@y
端末画面内の `docker-nodejs-sample` ディレクトリにおいて `docker init` コマンドを実行します。
`docker init` はデフォルトの設定をいくつか行いますが、アプリケーション内容についていくつか質問が行われるので、それに答えます。
以下の利用例において `docker init` の質問への答えを示しているので、これを参考に同様の入力を行ってください。
@z

% snip command...

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
{{< /tab >}}
{{< tab name="Manually create assets" >}}
@y
{{< /tab >}}
{{< tab name="手動によるアセット生成" >}}
@z

@x
If you don't have Docker Desktop installed or prefer creating the assets manually, you can create the following files in your project directory.
@y
If you don't have Docker Desktop installed or prefer creating the assets manually, you can create the following files in your project directory.
@z

@x
Create a file named `Dockerfile` with the following contents.
@y
Create a file named `Dockerfile` with the following contents.
@z

@x within code
# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
@y
# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
@z
@x
# Want to help us make this template better? Share your feedback here: https://forms.gle/ybq9Krt8jtBL3iCk7
@y
# Want to help us make this template better? Share your feedback here: https://forms.gle/ybq9Krt8jtBL3iCk7
@z
@x
# Use production node environment by default.
@y
# Use production node environment by default.
@z
@x
# Download dependencies as a separate step to take advantage of Docker's caching.
# Leverage a cache mount to /root/.npm to speed up subsequent builds.
# Leverage a bind mounts to package.json and package-lock.json to avoid having to copy them into
# into this layer.
@y
# Download dependencies as a separate step to take advantage of Docker's caching.
# Leverage a cache mount to /root/.npm to speed up subsequent builds.
# Leverage a bind mounts to package.json and package-lock.json to avoid having to copy them into
# into this layer.
@z
@x
# Run the application as a non-root user.
@y
# Run the application as a non-root user.
@z
@x
# Copy the rest of the source files into the image.
@y
# Copy the rest of the source files into the image.
@z
@x
# Expose the port that the application listens on.
@y
# Expose the port that the application listens on.
@z
@x
# Run the application.
@y
# Run the application.
@z

@x
Create a file named `compose.yaml` with the following contents.
@y
Create a file named `compose.yaml` with the following contents.
@z

@x within code
# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Docker Compose reference guide at
@y
# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Docker Compose reference guide at
@z
@x
# Here the instructions define your application as a service called "server".
# This service is built from the Dockerfile in the current directory.
# You can add other services your application may depend on here, such as a
# database or a cache. For examples, see the Awesome Compose repository:
# https://github.com/docker/awesome-compose
@y
# Here the instructions define your application as a service called "server".
# This service is built from the Dockerfile in the current directory.
# You can add other services your application may depend on here, such as a
# database or a cache. For examples, see the Awesome Compose repository:
# https://github.com/docker/awesome-compose
@z
@x
# The commented out section below is an example of how to define a PostgreSQL
# database that your application can use. `depends_on` tells Docker Compose to
# start the database before your application. The `db-data` volume persists the
# database data between container restarts. The `db-password` secret is used
# to set the database password. You must create `db/password.txt` and add
# a password of your choosing to it before running `docker-compose up`.
@y
# The commented out section below is an example of how to define a PostgreSQL
# database that your application can use. `depends_on` tells Docker Compose to
# start the database before your application. The `db-data` volume persists the
# database data between container restarts. The `db-password` secret is used
# to set the database password. You must create `db/password.txt` and add
# a password of your choosing to it before running `docker-compose up`.
@z

@x
Create a file named `.dockerignore` with the following contents.
@y
Create a file named `.dockerignore` with the following contents.
@z

@x within code
# Include any files or directories that you don't want to be copied to your
# container here (e.g., local build artifacts, temporary files, etc.).
@y
# Include any files or directories that you don't want to be copied to your
# container here (e.g., local build artifacts, temporary files, etc.).
@z
@x
# For more help, visit the .dockerignore file reference guide at
@y
# For more help, visit the .dockerignore file reference guide at
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
You should now have at least the following contents in your
`docker-nodejs-sample` directory.
@y
上により `docker-nodejs-sample` ディレクトリ内は、最低でも以下の構成となるはずです。
@z

% snip text...

@x
To learn more about the files, see the following:
 - [Dockerfile](../../reference/dockerfile.md)
 - [.dockerignore](../../reference/dockerfile.md#dockerignore-file)
 - [compose.yaml](../../compose/compose-file/_index.md)
@y
各ファイルについての詳細は以下を参照してください。
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

% snip command...

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

% snip command...

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
