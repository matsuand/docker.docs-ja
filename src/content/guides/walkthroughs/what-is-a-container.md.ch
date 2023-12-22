%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: What is a container?
keywords: get started, quick start, intro, concepts
description: Learn what a container is by seeing and inspecting a running container.
aliases:
- /get-started/what-is-a-container/
---
@y
---
title: コンテナーとは何か
keywords: get started, quick start, intro, concepts
description: Learn what a container is by seeing and inspecting a running container.
aliases:
- /get-started/what-is-a-container/
---
@z

@x
A container is an isolated environment for your code. This means that a
container has no knowledge of your operating system, or your files. It runs on
the environment provided to you by Docker Desktop. Containers have everything
that your code needs in order to run, down to a base operating system. You can
use Docker Desktop to manage and explore your containers.
@y
コンテナーとは、開発コードに対しての独立した環境のことです。
これが何を意味するかと言えば、コンテナーにとってオペレーティングシステムやファイルなどは、何も知らないということです。
コンテナーは Docker Desktop を通じて、その環境が実行されます。
コンテナーには、コードから基本オペレーティングシステムに至るまでの、実行に必要なものがすべて含まれます。
Docker Desktop を使えば、コンテナーの管理や操作がすべて可能です。
@z

@x
In this walkthrough, you'll view and explore an actual container in Docker
Desktop.
@y
このウォークスルーでは、Docker Desktop 内に実際にコンテナーを作って、それを見ていくことにしましょう。
@z

@x
{{< include "guides-get-docker.md" >}}
@y
{{< include "guides-get-docker.md" >}}
@z

@x
## Step 1: Set up the walkthrough
@y
## 手順 1: ウォークスルーの準備 {#step-1-set-up-the-walkthrough }
@z

@x
The first thing you need is a running container. Use the following instructions to run a container.
@y
はじめに必要となるのはコンテナーを起動することです。
以下の手順に従ってコンテナーを起動します。
@z

@x
1. Open Docker Desktop and select the search.
2. Specify `docker/welcome-to-docker` in the search and then select **Run**.
3. Expand the **Optional settings**.
4. In **Container name**, specify `welcome-to-docker`.
5. In **Host port**, specify `8088`.
   ![Specifying host port 8088](images/getting-started-setup.webp?w=500&border=true)
6. Select **Run**.
@y
1. Docker Desktop を開いて検索欄をクリックします。
2. 検索欄に `docker/welcome-to-docker` を入力して **Run** をクリックします。
3. **Optional settings**（オプション選択）を展開します。
4. **Container name**（コンテナー名）欄に `welcome-to-docker` を入力します。
5. **Host port**（ホストポート欄）に `8088` を入力します。
   ![ホストポート 8088 の指定](images/getting-started-setup.webp?w=500&border=true)
6. **Run** をクリックします。
@z

@x
## Step 2: View containers on Docker Desktop
@y
## 手順 2: Docker Desktop 上でのコンテナー参照 {#step-2-view-containers-on-docker-desktop}
@z

@x
You just ran a container! You can view it in the **Containers** tab of Docker
Desktop. This container runs a simple web server that displays a simple website.
When working with more complex projects, you'll run different parts in different
containers. For example, a different container for the frontend, backend, and
database. In this walkthrough, you only have a simple frontend container.
@y
コンテナーの起動ができました！
Docker Desktop の **Containers**（コンテナー）タブに、そのコンテナーが表示されます。
このコンテナーはかんたんなウェブサーバーを起動して、単純なウェブサイトを表示するものです。
もっと複雑なプロジェクトで作業を行う場合は、さまざまなコンテナーをさまざまに実行することになります。
たとえばフロントエンド、バックエンド、データベースのためのコンテナーなどがあります。
このウォークスルーでは、単純なフロントエンドコンテナーを用いるだけにします。
@z

@x
## Step 3: View the frontend
@y
## 手順 3: フロントエンドの参照 {#step-3-view-the-frontend}
@z

@x
The frontend is accessible on port 8088 of your local host. Select the link in
the **Port(s)** column of your container, or visit
[http://localhost:8088](http://localhost:8088) in your browser to view it.
@y
フロントエンドは、お手元のローカルホストのポート 8088 からアクセスできます。
コンテナーの **Port(s)**（ポート）にあるリンクをクリックするか、ブラウザーを使って [http://localhost:8088](http://localhost:8088) にアクセスすることが見ることができます。
@z

@x
![Accessing container frontend from Docker Desktop](images/getting-started-frontend.webp?border=true)
@y
![Docker Desktop からコンテナーフロントエンドにアクセス](images/getting-started-frontend.webp?border=true)
@z

@x
## Step 4: Explore your container
@y
## 手順 4: コンテナーの確認 {#step-4-explore-your-container}
@z

@x
Docker Desktop lets you easily view and interact with different aspects of your
container. Try it out yourself. Select your container and then select **Files**
to explore your container's isolated file system.
@y
Docker Desktop では、コンテナーのさまざまな機能などに関して、かんたんに参照したり指示したりすることができます。
試してみてください。
コンテナーを選択した上で **Files** をクリックすると、コンテナー内の独自のファイルシステムを参照することができます。
@z

@x
![Viewing container details in Docker Desktop](images/getting-started-explore-container.webp?border=true)
@y
![Docker Desktop からのコンテナーの詳細確認](images/getting-started-explore-container.webp?border=true)
@z

@x
## Step 5: Stop your container
@y
## 手順 5: コンテナーの停止 {#step-5-stop-your-container}
@z

@x
The `welcome-to-docker` container continues to run until you stop it. To stop
the container in Docker Desktop, go to the **Containers** tab and select the
**Stop** icon in the **Actions** column of your container.
@y
`welcome-to-docker` コンテナーは、停止させるまで動作し続けます。
Docker Desktop 内からコンテナーを停止させるには、**Containers**（コンテナー）タブをクリックした上で、**Actions** の中の **Stop**（停止）アイコンをクリックします。
@z

@x
![Stopping a container in Docker Desktop](images/getting-started-stop.webp?border=true)
@y
![Docker Desktop からのコンテナー停止](images/getting-started-stop.webp?border=true)
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this walkthrough, you ran a pre-made image and explored a container. In addition to running pre-made images, you can build and run your own application as container.
@y
このウォークスルーでは、あらかじめ用意されているイメージを実行させて、コンテナーの確認を行いました。
イメージの実行によってコンテナーがビルドされ、独自のアプリケーションが起動されました。
@z

@x
Related information:
@y
関連情報
@z

@x
- Read more about containers in [Use containers to Build, Share and Run your applications](https://www.docker.com/resources/what-container/)
- Deep dive in Liz Rice's [Containers from Scratch](https://www.youtube.com/watch?v=8fi7uSYlOdc&t=1s) video presentation
@y
- コンテナーについての詳細は以下を参照してください。[Use containers to Build, Share and Run your applications](https://www.docker.com/resources/what-container/)
- より深く理解するには Liz Rice 氏のビデオプレゼンテーションを参照してください。 [Containers from Scratch](https://www.youtube.com/watch?v=8fi7uSYlOdc&t=1s)
@z

@x
## Next steps
@y
## 次のステップ {#next-step}
@z

@x
Continue to the next walkthrough to learn what you need to create your own image
and run it as container.
@y
次のウォークスルーに進んでください。
独自のイメージを生成するためには何が必要なのかを学び、それをコンテナーとして実行していきます。
@z

@x
{{< button url="./run-a-container.md" text="How do I run a container?" >}}
@y
{{< button url="./run-a-container.md" text="コンテナーの起動方法" >}}
@z
