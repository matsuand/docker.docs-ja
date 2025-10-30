%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: What is Docker Compose?
@y
title: Docker Compose とは？
@z

@x
keywords: concepts, build, images, container, docker desktop
description: What is Docker Compose?
@y
keywords: concepts, build, images, container, docker desktop
description: Docker Compose とは？
@z

@x
{{< youtube-embed xhcUIK4fGtY >}}
@y
{{< youtube-embed xhcUIK4fGtY >}}
@z

@x
## Explanation
@y
## 説明 {#explanation}
@z

@x
If you've been following the guides so far, you've been working with single container applications. But, now you're wanting to do something more complicated - run databases, message queues, caches, or a variety of other services. Do you install everything in a single container? Run multiple containers? If you run multiple, how do you connect them all together?
@y
ここまでのガイドを読み進めながら、コンテナー一つからなるアプリケーションの作業を行ってきました。
実際にはもっと複雑なものが必要になるはずです。
それはデータベース、メッセージキュー、キャッシュといった多くのサービスです。
そのすべてを一つのコンテナーに押し込んでインストールしますか？
複数のコンテナーを起動させますか？
複数のコンテナーとするなら、それらを接続するのはどうやって行いますか？
@z

@x
One best practice for containers is that each container should do one thing and do it well. While there are exceptions to this rule, avoid the tendency to have one container do multiple things.
@y
コンテナーに関してのベストプラクティスは、1 つのコンテナーでは 1 つのことだけを行わせること。
これがうまくいくコツです。
このルールには例外がいくつかありますが、1 つのコンテナーにたくさんの仕事をさせることだけは避けるようにしてください。
@z

@x
You can use multiple `docker run` commands to start multiple containers. But, you'll soon realize you'll need to manage networks, all of the flags needed to connect containers to those networks, and more. And when you're done, cleanup is a little more complicated.
@y
複数のコンテナーを起動させるというので `docker run` コマンドを複数分だけ実行するという方法もあります。
ただしすぐに気づくことになるでしょうが、そこではネットワークの管理が必要となり、さらにはそのネットワークにコンテナーを接続させるためのフラグ類をすべて管理していくなど、さまざまなことをしなければなりません。
それを実現したとしても、今度はそれをきれいに戻すにはさらに複雑な作業となっていきます。
@z

@x
With Docker Compose, you can define all of your containers and their configurations in a single YAML file. If you include this file in your code repository, anyone that clones your repository can get up and running with a single command.
@y
Docker Compose を使うとコンテナーやその設定は、たった一つの YAML ファイル内において定義することができます。
コードリポジトリにこのファイルを置いてさえいれば、そのリポジトリをクローンするユーザーは単純なコマンド一つで実行できるものとなります。
@z

@x
It's important to understand that Compose is a declarative tool - you simply define it and go. You don't always need to recreate everything from scratch. If you make a change, run `docker compose up` again and Compose will reconcile the changes in your file and apply them intelligently.
@y
Compose を理解する上で重要なことは、これが宣言タイプのツールであるという点です。
みなさんは単に定義をするだけです。
始めるたびに一から作り出す必要はありません。
修正を行ったなら `docker compose up` を再度実行するだけで、変更されたファイルの調整を賢く行ってくれます。
@z

@x
> **Dockerfile versus Compose file**
>
> A Dockerfile provides instructions to build a container image while a Compose file defines your running containers. Quite often, a Compose file references a Dockerfile to build an image to use for a particular service.
@y
> **Dockerfile 対 Compose ファイル**
>
> Dockerfile というものは 1 つのコンテナーイメージをビルドする手順を提供します。
> 一方 Compose ファイルは実行するコンテナーを定義します。
> Compose ファイルはたいていは Dockerfile を参照して、イメージをビルドし所定のサービスを実現するために利用します。
@z

@x
## Try it out 
@y
## ためしてみよう {#try-it-out}
@z

@x
In this hands-on, you will learn how to use a Docker Compose to run a multi-container application. You'll use a simple to-do list app built with Node.js and MySQL as a database server.
@y
このチュートリアルでは、Docker Compose を使って複数コンテナーによるアプリケーションの実行方法について学びます。

ここでは、Node.js を使った簡単な ToDo リストアプリを用いていくことにします。
データベースサーバーには MySQL を使います。
@z

@x
### Start the application
@y
### アプリケーションの起動 {#start-the-application}
@z

@x
Follow the instructions to run the to-do list app on your system.
@y
以下の手順に従って ToDo リストアプリを実行します。
@z

@x
1. [Download and install](https://www.docker.com/products/docker-desktop/) Docker Desktop.
2. Open a terminal and [clone this sample application](https://github.com/dockersamples/todo-list-app).
@y
1. Docker Desktop を [ダウンロードおよびインストール](https://www.docker.com/products/docker-desktop/) します。
2. 端末画面を開いて [サンプルアプリケーションのクローン](https://github.com/dockersamples/todo-list-app) を取得します。
@z

% snip command...

@x
3. Navigate into the `todo-list-app` directory:
@y
3. `todo-list-app` ディレクトリに移動します。
@z

% snip command...

@x
    Inside this directory, you'll find a file named `compose.yaml`. This YAML file is where all the magic happens! It defines all the services that make up your application, along with their configurations. Each service specifies its image, ports, volumes, networks, and any other settings necessary for its functionality. Take some time to explore the YAML file and familiarize yourself with its structure. 
@y
    このディレクトリ内には `compose.yaml` というファイルがあります。
    これは YAML ファイルであり、あらゆるものを実現する玉手箱です。
    アプリケーションを構成するサービスすべてについて、その定義と設定を行います。
    各サービスにおいては、そのイメージ、ポート、ボリューム、ネットワークといった、機能実現に必要となる設定が行われます。
    YAML ファイルをしっかりと確認して、この記述形式を覚えてください。
@z

@x
4. Use the [`docker compose up`](/reference/cli/docker/compose/up/) command to start the application:
@y
4. [`docker compose up`](__SUBDIR__/reference/cli/docker/compose/up/) コマンドを使ってアプリケーションを実行します。
@z

% snip command...

@x
    When you run this command, you should see an output like this:
@y
    コマンドを実行すると以下のような出力が得られます。
@z

% snip output...

@x
    A lot happened here! A couple of things to call out:
@y
    いろいろな出力が行われます。
    ここでは以下のような処理が示されています。
@z

@x
    - Two container images were downloaded from Docker Hub - node and MySQL
    - A network was created for your application
    - A volume was created to persist the database files between container restarts
    - Two containers were started with all of their necessary config
@y
    - 2 つのコンテナーイメージ、つまり node と MySQL が Docker Hub からダウンロードされました。
    - アプリケーション向けに 1 つのネットワークが生成されました。
    - ボリュームが 1 つ生成されました。
      これによりコンテナーが再起動されても、データベースファイルが保持されることになります。
    - 必要となる設定に基づいて 2 つのコンテナーが起動します。
@z

@x
    If this feels overwhelming, don't worry! You'll get there!
@y
    情報が多すぎると思っても心配無用です。
    これからマスターしていきましょう。
@z

@x
5. With everything now up and running, you can open [http://localhost:3000](http://localhost:3000) in your browser to see the site. Note that the application may take 10-15 seconds to fully start. If the page doesn't load right away, wait a moment and refresh. Feel free to add items to the list, check them off, and remove them.
@y
5. すべてが出そろい起動が行われたら、ブラウザーから [http://localhost:3000](http://localhost:3000) にアクセスしてサイトを確認します。
アプリケーションは完全に起動するまでに 10 から 15 秒かかります。
ページロードがすぐに行われなかったら、しばらく待ってから表示更新してみてください。
アイテムの追加、確認、削除をさまざまに行ってみてください。
@z

@x
    ![A screenshot of a webpage showing the todo-list application running on port 3000](images/todo-list-app.webp?border=true&w=950&h=400)
@y
    ![ポート 3000 で動作する ToDo リストアプリケーションウェブページのスクリーンショット](images/todo-list-app.webp?border=true&w=950&h=400)
@z

@x
6. If you look at the Docker Desktop GUI, you can see the containers and dive deeper into their configuration.
@y
6. Docker Desktop GUI 画面を確認してみると、コンテナーが一覧に表示されていて、その設定も細かく確認することができます。
@z

@x
    ![A screenshot of Docker Desktop dashboard showing the list of containers running todo-list app](images/todo-list-containers.webp?border=true&w=950&h=400)
@y
    ![A screenshot of Docker Desktop dashboard showing the list of containers running todo-list app](images/todo-list-containers.webp?border=true&w=950&h=400)
@z

@x
### Tear it down
@y
### アプリケーションの停止 {#tear-it-down}
@z

@x
Since this application was started using Docker Compose, it's easy to tear it all down when you're done.
@y
アプリケーションを Docker Compose を使って起動したので、作業を終えたらアプリケーション停止も簡単に行うことができます。
@z

@x
1. In the CLI, use the [`docker compose down`](/reference/cli/docker/compose/down/) command to remove everything:
@y
1. CLI の中から [`docker compose down`](__SUBDIR__/reference/cli/docker/compose/down/) コマンドを使います。
   これを使ってすべてを削除します。
@z

% snip command...

@x
    You'll see output similar to the following:
@y
    以下のようなメッセージが出力されるはずです。
@z

% snip output...

@x
    > **Volume persistence**
    >
    > By default, volumes _aren't_ automatically removed when you tear down a Compose stack. The idea is that you might want the data back if you start the stack again.
    >
    > If you do want to remove the volumes, add the `--volumes` flag when running the `docker compose down` command:
@y
    > **ボリュームの永続性**
    >
    > Compose 関連コンテナー類をダウンさせたとしても、ボリュームはデフォルトでは自動的に削除_されません_。
    > 再度 Compose コンテナー類を再度立ち上げた際には、データを再利用したいと思うはずだからです。
    > ボリュームも同時に削除したいのであれば、`docker compose down` コマンドを実行する際に `--volumes` フラグをつけてください。
@z

% snip command...

@x
2. Alternatively, you can use the Docker Desktop GUI to remove the containers by selecting the application stack and selecting the **Delete** button.
@y
2. 別の方法として Docker Desktop GUI を使うなら、画面上のアプリケーションを選択した上で **Delete** (削除) ボタンを押せば、コンテナー類を削除することができます。
@z

@x
    ![A screenshot of the Docker Desktop GUI showing the containers view with an arrow pointing to the "Delete" button](images/todo-list-delete.webp?w=930&h=400)
@y
    ![Docker Desktop GUI におけるコンテナー一覧と "Delete" ボタンにマウスカーソルが当たったスクリーンショット](images/todo-list-delete.webp?w=930&h=400)
@z

@x
    > **Using the GUI for Compose stacks**
    >
    > Note that if you remove the containers for a Compose app in the GUI, it's removing only the containers. You'll have to manually remove the network and volumes if you want to do so.
@y
    > **GUI で操作する Compose コンテナー類**
    >
    > GUI を使って Compose アプリのコンテナーを削除する場合、削除されるのはコンテナーのみとなります。
    > それ以外のネットワークやボリュームは、必要なら手動で削除しなければなりません。
@z

@x
In this walkthrough, you learned how to use Docker Compose to start and stop a multi-container application.
@y
このウォークスルーを通じて Docker Compose を使った、マルチコンテナーアプリケーションの起動と停止の仕方を学びました。
@z

@x
## Additional resources
@y
## さらなる情報 {#additional-resources}
@z

@x
This page was a brief introduction to Compose. In the following resources, you can dive deeper into Compose and how to write Compose files.
@y
このページでは Compose について簡単に説明しました。
以下の項目を見れば、Compose への理解をさらに深めることができ、Compose ファイルの書き方を学ぶことができます。
@z

@x
* [Overview of Docker Compose](/compose/)
* [Overview of Docker Compose CLI](/compose/reference/)
* [How Compose works](/compose/intro/compose-application-model/)
@y
* [Docker Compose 概要](__SUBDIR__/compose/)
* [Docker Compose CLI 概要](__SUBDIR__/compose/reference/)
* [Compose はどう動くのか](__SUBDIR__/compose/intro/compose-application-model/)
@z
