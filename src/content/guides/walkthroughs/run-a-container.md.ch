%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 (workaround?)

@x
---
title: How do I run a container?
keywords: get started, quick start, intro, concepts
description: Learn how to build your own image and run it as a container
aliases:
- /get-started/run-your-own-container/
---
@y
---
title: コンテナーの実行
keywords: get started, quick start, intro, concepts
description: Learn how to build your own image and run it as a container
aliases:
- /get-started/run-your-own-container/
---
@z

@x
In this walkthrough, you'll learn the basic steps of building an image and running your own container. This walkthrough uses a sample Node.js application, but it's not necessary to know Node.js.
@y
このウォークスルーでは、イメージのビルドとそのコンテナー実行についての基本的なステップについて学びます。
このウォークスルーは、サンプルとなる Node.js アプリケーションを利用しますが、Node.js について知っておく必要はありません。
@z

@x
![Running an image in Docker Desktop](images/getting-started-run-intro.webp?w=450&border=true)
@y
![Docker Desktop でのイメージの起動](images/getting-started-run-intro.webp?w=450&border=true)
@z

@x
{{< include "guides-get-docker.md" >}}
@y
{{< include "guides-get-docker.md" >}}
@z

@x
## Step 1: Get the sample application
@y
## 手順 1: サンプルアプリケーションの入手 {#step-1-get-the-sample-application}
@z

@x
If you have git, you can clone the repository for the sample application. Otherwise, you can download the sample application. Choose one of the following options.
@y
git がある場合は、サンプルアプリケーションのリポジトリをクローン入手します。
git がない場合はサンプルアプリケーションをダウンロードしてください。
以下のオプションのいずれかを選択してください。
@z

@x
{{< tabs >}}
{{< tab name="Clone with git" >}}
@y
{{< tabs >}}
{{< tab name="git の clone" >}}
@z

@x
Use the following command in a terminal to clone the sample application repository.
@y
端末画面から以下のコマンドを実行して、サンプルアプリケーションのリポジトリのクローンを取得します。
@z

@x
```console
$ git clone https://github.com/docker/welcome-to-docker
```
@y
```console
$ git clone https://github.com/docker/welcome-to-docker
```
@z

@x
{{< /tab >}}
{{< tab name="Download" >}}
@y
{{< /tab >}}
{{< tab name="ダウンロード" >}}
@z

@x
Download the source and extract it.
@y
ソースをダウンロードして展開します。
@z

@x
{{< button url="https://github.com/docker/welcome-to-docker/archive/refs/heads/main.zip" text="Download the source" >}}
@y
{{< button url="https://github.com/docker/welcome-to-docker/archive/refs/heads/main.zip" text="ソースのダウンロード" >}}
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Step 2: View the Dockerfile in your project folder
@y
## 手順 2: プロジェクトフォルダー内の Dockerfile の確認 {#step-2-view-the-dockerfile-in-your-project-folder}
@z

@x
To run your code in a container, the most fundamental thing you need is a
Dockerfile. A Dockerfile describes what goes into a container. This sample already contains a `Dockerfile`. For your own projects, you'll need to create your own `Dockerfile`. You can open the `Dockerfile` in a code or text editor and explore its contents.
@y
コンテナー内にてコード実行を行うのに、もっとも重要になるのが Dockerfile です。
Dockerfile というものは、コンテナーに何をさせるのかを記述するものです。
このサンプルにはすでに `Dockerfile` が用意されています。
自分のプロジェクトを作る際には、独自の `Dockerfile` を生成する必要があります。
コードエディターやテキストエディターを使って `Dockerfile` を開き、中身を確認してください。
@z

@x
## Step 3: Build your first image
@y
## 手順 3: はじめてのイメージビルド {#step-3-build-your-first-image}
@z

@x
You always need an image to run a container. In a terminal, run the following commands to build the image. Replace `/path/to/welcome-to-docker/` with the path to your `welcome-to-docker` directory.
@y
コンテナーを実行するには必ずイメージが必要です。
端末画面から以下のコマンドを実行してイメージをビルドします。
`/path/to/welcome-to-docker/` の部分は実際の `welcome-to-docker` があるディレクトリに置き換えてください。
@z

@x
{{< include "open-terminal.md" >}}
@y
{{< include "open-terminal.md" >}}
@z

@x
```console
$ cd /path/to/welcome-to-docker/
```
```console
$ docker build -t welcome-to-docker .
```
@y
```console
$ cd /path/to/welcome-to-docker/
```
```console
$ docker build -t welcome-to-docker .
```
@z

@x
In the previous command, the `-t` flag tags your image with a name,
`welcome-to-docker` in this case. And the `.` lets Docker know where it can find
the Dockerfile.
@y
上のコマンドに指定した `-t` フラグは、イメージに対する名前を指定するものです。
上では `welcome-to-docker` としました。
また `.` は、Docker に対してDockerfile のありかを指示するものです。
@z

@x
Building the image may take some time. After your image is built, you can view your image in the **Images** tab in Docker Desktop.
@y
イメージのビルドには、ある程度の時間がかかります。
イメージのビルドが終わると、Docker Desktop の **Images**（イメージ）タブからイメージを確認することができます。
@z

@x
## Step 4: Run your container
@y
## 手順 4: コンテナーの実行 {#step-4-run-your-container}
@z

@x
To run your image as a container:
@y
イメージをコンテナーとして実行します。
@z

@x
1. In Docker Desktop, go to the **Images** tab.
2. Next to your image, select **Run**.
3. Expand the **Optional settings**.
4. In **Host port**, specify `8089`.
   ![Specifying host port 8089](images/getting-started-run-image.webp?w=500&border=true)
5. Select **Run**.
@y
1. Docker Desktop において **Images**（イメージ）タブを開きます。
2. 目的のイメージの横にある **Run** をクリックします。
3. **Optional settings**（オプション選択）を展開します。
4. **Host port**（ホストポート欄）に `8089` を入力します。
   ![ホストポート 8089 の指定](images/getting-started-run-image.webp?w=500&border=true)
5. **Run** をクリックします。
@z

@x
## Step 5: View the frontend
@y
## 手順 5: フロントエンドの確認 {#step-5-view-the-frontend}
@z

@x
You can use Docker Desktop to access your running container. Select the link next to your container in Docker Desktop or go to [http://localhost:8089](http://localhost:8089) to view the frontend.
@y
実行中のコンテナーは Docker Desktop を使ってアクセスします。
Docker Desktop 内のコンテナーの内にあるリンクをクリックするか、あるいは [http://localhost:8089](http://localhost:8089) にアクセスすることで、フロントエンドを確認することができます。
@z

@x
![Selecting the container link](images/getting-started-frontend-2.webp?border=true)
@y
![コンテナーリンクのクリック](images/getting-started-frontend-2.webp?border=true)
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this walkthrough, you built your own image and ran it as a container. In addition to building and running your own images, you can run images from Docker Hub.
@y
このウォークスルーでは自分のイメージをビルドして、それをコンテナーとして実行しました。
自分のイメージをビルドして実行することができれば、Docker Hub から取得したイメージを実行することもできるようになります。
@z

@x
Related information:
@y
関連情報
@z

@x
- Deep dive into building images in the [Build with Docker guide](../../build/guide/_index.md)
@y
- イメージビルドの詳細は [Docker を使ったビルドガイド](__SUBDIR__/build/guide/) を参照してください。
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
Continue to the next walkthrough to learn how you can run one of over 100,000 pre-made images from Docker Hub.
@y
次のウォークスルーに進んでください。
Docker Hub に 100,000  もある、すでにできあがったイメージを実行していきます。 
@z

@x
{{< button url="./run-hub-images.md" text="Run Docker Hub images" >}}
@y
{{< button url="./run-hub-images.md" text="Docker Hub イメージの実行" >}}
@z
