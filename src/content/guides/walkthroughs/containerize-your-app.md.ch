%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応。

@x
---
title: Containerize your application
keywords: get started, quick start, intro, concepts
description: Learn how to containerize your application.
---
@y
---
title: アプリケーションのコンテナー化
keywords: get started, quick start, intro, concepts
description: アプリケーションをコンテナー化する方法を学びます。
---
@z

@x
When working with containers, you typically need to create a `Dockerfile` to define your image and a `compose.yaml` file to define how to run it.
@y
コンテナーでの作業を行う際には、`Dockerfile` を生成してイメージ内容を定義し、`compose.yaml` を生成してその実行方法を定義していきます。
@z

@x
To help you create these files, Docker Desktop has the `docker init` command. Run this command in a terminal within your project folder. `docker init` creates all the required files to containerize your application. This walkthrough shows you how this works.
@y
このようなファイル生成をサポートするものとして Docker Desktop には `docker init` コマンドがあります。
端末画面にてプロジェクトフォルダーからこのコマンドを実行してみてください。
アプリケーションをコンテナー化するために必要となるファイルを `docker init` が生成してくれます。
このウォークスルーでは、どのようにして処理が行われるかを示していきます。
@z

@x
{{< include "guides-get-docker.md" >}}
@y
{{< include "guides-get-docker.md" >}}
@z

@x
## Step 1: Run the command to create Docker assets
@y
## 手順 1: Docker アセット生成コマンドの実行 {#step-1-run-the-command-to-create-docker-assets}
@z

@x
Choose one of your own applications that you would like to containerize, and in a terminal, run the following commands. Replace `/path/to/your/project/` with the directory containing your project.
@y
コンテナー化を行いたい自分のアプリケーションを取り決めます。
そして端末画面から以下のコマンドを実行します。
`/path/to/your/project/` の部分は、実際のプロジェクトがあるディレクトリに置き換えてください。
@z

@x
{{< include "open-terminal.md" >}}
@y
{{< include "open-terminal.md" >}}
@z

@x
```console
$ cd /path/to/your/project/
```
```console
$ docker init
```
@y
```console
$ cd /path/to/your/project/
```
```console
$ docker init
```
@z

@x
## Step 2: Follow the on-screen prompts
@y
## 手順 2: 画面上のプロンプトへの入力 {#step-2-follow-the-on-screen-prompts}
@z

@x
`docker init` walks you through a few questions to configure your project with sensible defaults. Specify your answers and press `Enter`.
@y
`docker init` ではいくつかの質問をしてきます。
これによって適切なデフォルト値を用いたプロジェクト設定を行います。
質問に対する答えを入力して `Enter` を押下します。
@z

@x
## Step 3: Try to run your application
@y
## 手順 3: アプリケーションの実行テスト {#step-3-try-to-run-your-application}
@z

@x
Once you have answered all the questions, run the following commands in a terminal to run your project. Replace `/path/to/your/project/` with the directory containing your project.
@y
質問にすべて答えたら、端末画面から以下のコマンドを入力して、プロジェクトを実行します。
`/path/to/your/project/` の部分は、実際のプロジェクトがあるディレクトリに置き換えてください。
@z

@x
```console
$ cd /path/to/your/project/
```
```console
$ docker compose up
```
@y
```console
$ cd /path/to/your/project/
```
```console
$ docker compose up
```
@z

@x
## Step 4: Update the Docker assets
@y
## 手順 4: Docker アセットの更新 {#step-4-update-the-docker-assets}
@z

@x
The `docker init` command tries its best to do the heavy lifting for you, but sometimes there's some assembly required. In this case, you can refer to the [Dockerfile reference⁠](/engine/reference/builder/) and [Compose file reference](/compose/compose-file/)⁠ to learn how to update the files created by `docker init`.
@y
`docker init` コマンドは、できる限り最適な設定を行うようにしています。
ただし時には再構築が必要となることもあります。
そういった場合は [Dockerfile リファレンス](__SUBDIR__/engine/reference/builder/) や [Compose ファイルリファレンス](__SUBDIR__/compose/compose-file/) を参照して、`docker init` により生成されたファイルの更新方法を学んでください。
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this walkthrough, you learned how to containerize your own application.
@y
このウォークスルーでは、自分のアプリケーションをコンテナー化する方法を学びました。
@z

@x
Related information:
@y
関連項目
@z

@x
- Read more about [docker init](../../engine/reference/commandline/init.md)
- Learn more about Docker assets in the [Dockerfile reference⁠](/engine/reference/builder/) and [Compose file reference](/compose/compose-file/)
@y
- [docker init](__SUBDIR__/engine/reference/commandline/init.md) の詳細を読んでください。
- Docker アセットについては [Dockerfile リファレンス](__SUBDIR__/engine/reference/builder/) と [Compose ファイルリファレンス](__SUBDIR__/compose/compose-file/) を確認してください。
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
Continue to the next walkthrough to learn how to publish an application as an image on Docker Hub.
@y
次のウォークスルーに進んでください。
アプリケーションをイメージとして Docker Hub に公開する方法について学びます。
@z

@x
{{< button url="./publish-your-image.md" text="Publish your image" >}}
@y
{{< button url="./publish-your-image.md" text="イメージの公開" >}}
@z
