%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Containerize an application
@y
title: アプリケーションのコンテナー化
@z

@x
linkTitle: "Part 1: Containerize an application"
keywords: |
  dockerfile example, Containerize an application, run docker file, running
  docker file, how to run dockerfile, example dockerfile, how to create a docker container,
  create dockerfile, simple dockerfile, creating containers
description: |
  Follow this step-by-step guide to learn how to create and run a containerized
  application using Docker
@y
linkTitle: "1部: アプリケーションのコンテナー化"
keywords: |
  dockerfile example, Containerize an application, run docker file, running
  docker file, how to run dockerfile, example dockerfile, how to create a docker container,
  create dockerfile, simple dockerfile, creating containers
description: |
  Follow this step-by-step guide to learn how to create and run a containerized
  application using Docker
@z

@x
For the rest of this guide, you'll be working with a simple todo
list manager that runs on Node.js. If you're not familiar with Node.js,
don't worry. This guide doesn't require any prior experience with JavaScript.
@y
ここからのガイドでは、Node.js において稼動する単純な ToDo リストマネージャーを作っていくことにします。
Node.js をよくわかっていなくても心配ありません。
JavaScript の知識などなくてもかまいません。
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
- You have installed the latest version of [Docker Desktop](/get-started/get-docker.md).
- You have installed a [Git client](https://git-scm.com/downloads).
- You have an IDE or a text editor to edit files. Docker recommends using [Visual Studio Code](https://code.visualstudio.com/).
@y
- 最新バージョンの [Docker Desktop](get-started/get-docker.md) をインストールしていること。
- [Git クライアント](https://git-scm.com/downloads) をインストールしていること。
- ファイル編集のために IDE あるいはテキストエディターを用意していること。
  Docker では [Visual Studio Code](https://code.visualstudio.com/) の利用を推奨。
@z

@x
## Get the app
@y
## アプリの入手 {#get-the-app}
@z

@x
Before you can run the application, you need to get the application source code onto your machine.
@y
アプリケーションを実行するために、アプリケーションのソースコードを入手してマシン上におくことが必要です。
@z

@x
1. Clone the [getting-started-app repository](https://github.com/docker/getting-started-app/tree/main) using the following command:
@y
1. 以下のコマンドを実行して [getting-started-app リポジトリ](https://github.com/docker/getting-started-app/tree/main) のクローンを行います。
@z

% snip command...

@x
2. View the contents of the cloned repository. You should see the following files and sub-directories.
@y
2. クローンを行ったリポジトリの内容を確認します。
   以下のようなファイルやサブディレクトリが確認できます。
@z

% snip text...

@x
## Build the app's image
@y
## アプリイメージのビルド {#build-the-apps-image}
@z

@x
To build the image, you'll need to use a Dockerfile. A Dockerfile is simply a text-based file with no file extension that contains a script of instructions. Docker uses this script to build a container image.
@y
イメージをビルドするには Dockerfile を用いる必要があります。
Dockerfile とは単純なテキストファイルであって、拡張子を持ちません。
そこにはさまざまな命令がスクリプトとして記述されます。
Docker はこのスクリプトを使ってコンテナーイメージをビルドします。
@z

@x
1. In the `getting-started-app` directory, the same location as the
   `package.json` file, create a file named `Dockerfile` with the following contents:
@y
1. `getting-started-app` ディレクトリには `package.json` というファイルがあります。
   そのファイルと同じ並びに `Dockerfile` という名前のファイルを生成します。
   そしてその内容は以下のようにします。
@z

@x
   This Dockerfile starts off with a `node:lts-alpine` base image, a
   light-weight Linux image that comes with Node.js and the Yarn package
   manager pre-installed. It copies all of the source code into the image,
   installs the necessary dependencies, and starts the application.
@y
   この Dockerfile はベースイメージ `node:lts-alpine` の記述から始まります。
   これは Node.js とYarn パッケージマネージャーがあらかじめインストールされている、軽量な Linux イメージです。
   イメージに対しては全ソースコードがコピーされ、必要な依存パッケージがインストールされた上で、アプリケーションが起動します。
@z

@x
2. Build the image using the following commands:
@y
2. 以下のコマンドを実行してイメージをビルドします。
@z

@x
   In the terminal, make sure you're in the `getting-started-app` directory. Replace `/path/to/getting-started-app` with the path to your `getting-started-app` directory.
@y
   端末内ではカレントディレクトリを `getting-started-app` とします。
   `/path/to/getting-started-app` の部分は、実際の `getting-started-app` ディレクトリに置き換えてください。
@z

% snip command...

@x
   Build the image.
@y
   イメージをビルドします。
@z

% snip command...

@x
   The `docker build` command uses the Dockerfile to build a new image. You might have noticed that Docker downloaded a lot of "layers". This is because you instructed the builder that you wanted to start from the `node:lts-alpine` image. But, since you didn't have that on your machine, Docker needed to download the image.
@y
   `docker build` コマンドは Dockerfile を利用して新たなイメージをビルドします。
   実行すればわかることですが、Docker は数々の「レイヤー」をダウンロードします。
   そうなるのは、ビルド処理に対して指示を行ったからであり、`node:lts-alpine` イメージから処理を始めることを伝えたためです。
   マシン内にそのイメージがなかったので、Docker がダウンロードする必要があったということになります。
@z

@x
   After Docker downloaded the image, the instructions from the Dockerfile copied in your application and used `yarn` to install your application's dependencies. The `CMD` directive specifies the default command to run when starting a container from this image.
@y
   Docker がイメージをダウンロードした後は、Dockerfile に示された命令に従って、アプリケーションがコピーされ、さらに `yarn` によってアプリケーションの依存パッケージがインストールされます。
   `CMD` ディレクティブがデフォルトコマンドを指定しているので、このイメージから生成されるコンテナーが起動した際にそれが実行されます。
@z

@x
   Finally, the `-t` flag tags your image. Think of this as a human-readable name for the final image. Since you named the image `getting-started`, you can refer to that image when you run a container.
@y
   なお `-t` フラグはイメージにタグづけを行うものです。
   これは最終生成されるイメージに対して、わかりやすい名前をつけたと考えればよいでしょう。
   ここでは `getting-started` という名前をつけたので、コンテナー起動の際にイメージを特定する名前として利用できます。
@z

@x
   The `.` at the end of the `docker build` command tells Docker that it should look for the `Dockerfile` in the current directory.
@y
   `docker build` コマンドの最後にある `.` は、Dockerfile を探し出す先はカレントディレクトリであることを Docker に指示しています。
@z

@x
## Start an app container
@y
## アプリコンテナーの起動 {#start-an-app-container}
@z

@x
Now that you have an image, you can run the application in a container using the `docker run` command.
@y
イメージが出来上がったので、`docker run` コマンドを使ってコンテナー内のアプリケーションを実行します。
@z

@x
1. Run your container using the `docker run` command and specify the name of the image you just created:
@y
1. `docker run` コマンドを実行してコンテナーを起動します。
   実行にあたっては、上で生成したイメージの名前を指定します。
@z

% snip command...

@x
   The `-d` flag (short for `--detach`) runs the container in the background.
   This means that Docker starts your container and returns you to the terminal
   prompt. Also, it does not display logs in the terminal.
@y
   `-d` フラグ (`--detach` の短縮形) は、コンテナーをバックグラウンドで実行します。
   これを行うと、Docker がコンテナーを起動した後に、端末上のプロンプトに戻ります。
   またその場合、端末上にはログが表示されなくなります。
@z

@x
   The `-p` flag (short for `--publish`) creates a port mapping between the
   host and the container. The `-p` flag takes a string value in the format of
   `HOST:CONTAINER`, where `HOST` is the address on the host, and `CONTAINER`
   is the port on the container. The command publishes the container's port
   3000 to `127.0.0.1:3000` (`localhost:3000`) on the host. Without the port
   mapping, you wouldn't be able to access the application from the host.
@y
   `-p` フラグ (`--publish` の短縮形) は、ホストとコンテナーの間でのポートマッピングを生成します。
   `-p` フラグには `HOST:CONTAINER` という書式の文字列を与えます。
   ここで `HOST` はホストのアドレス、`CONTAINER` はコンテナー上のポートを表します。
   このコマンドは、コンテナーのポート 3000 をホスト上の `127.0.0.1:3000` (`localhost:3000`) にマッピングするものです。
   このポートマッピングがなかったとしたら、アプリケーションへのアクセスがホストからはできないことになります。
@z

@x
2. After a few seconds, open your web browser to [http://localhost:3000](http://localhost:3000).
   You should see your app.
@y
2. しばらくしてウェブブラウザーから [http://localhost:3000](http://localhost:3000) にアクセスします。
   アプリケーションが確認できます。
@z

@x
   ![Empty todo list](images/todo-list-empty.webp)
@y
   ![空の todo リスト](images/todo-list-empty.webp)
@z

@x
3. Add an item or two and see that it works as you expect. You can mark items as complete and remove them. Your frontend is successfully storing items in the backend.
@y
3. 1 つ、2 つとアイテムを追加します。
   そして期待どおりに追加できていることを確認します。
   アイテムには完了マークをつけることができます。
   これを行ってからアイテムを削除してください。
   このフロントエンド処理から、バックエンド内にアイテムを保存する処理がうまく動作していることがわかります。
@z

@x
At this point, you have a running todo list manager with a few items.
@y
ここまで todo リストマネージャーを実行し、いくつかアイテム操作を行ってみました。
@z

@x
If you take a quick look at your containers, you should see at least one container running that's using the `getting-started` image and on port `3000`. To see your containers, you can use the CLI or Docker Desktop's graphical interface.
@y
コンテナーに目を向けてみると、少なくとも 1 つのコンテナーが動作していて、それは `getting-started` イメージとポート `3000` を利用するものであることがわかるはずです。
コンテナーを確認するには CLI から、または Docker Desktop のグラフィックインターフェースから確認できます。
@z

@x
{{< tabs >}}
{{< tab name="CLI" >}}
@y
{{< tabs >}}
{{< tab name="CLI" >}}
@z

@x
Run the `docker ps` command in a terminal to list your containers.
@y
端末画面から `docker ps` コマンドを実行すると、コンテナーを一覧表示できます。
@z

% snip command...

@x
Output similar to the following should appear.
@y
出力結果は以下のようなものになるはずです。
@z

% snip output...

@x
{{< /tab >}}
{{< tab name="Docker Desktop" >}}
@y
{{< /tab >}}
{{< tab name="Docker Desktop" >}}
@z

@x
In Docker Desktop, select the **Containers** tab to see a list of your containers.
@y
Docker Desktop 画面にて **Containers** (コンテナー) タブをクリックしてコンテナー一覧を確認します。
@z

@x
![Docker Desktop with get-started container running](images/dashboard-two-containers.webp)
@y
![Docker Desktop と get-started コンテナーの実行確認](images/dashboard-two-containers.webp)
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this section, you learned the basics about creating a Dockerfile to build an image. Once you built an image, you started a container and saw the running app.
@y
本節では Dockerfile を生成してイメージをビルドする基本操作を学びました。
イメージをビルドした後は、コンテナーを起動してアプリケーションが起動することを確認しました。
@z

@x
Related information:
@y
関連情報
@z

@x
- [Dockerfile reference](/reference/dockerfile/)
- [docker CLI reference](/reference/cli/docker/)
@y
- [Dockerfile リファレンス](__SUBDIR__/reference/dockerfile/)
- [docker CLI リファレンス](__SUBDIR__/reference/cli/docker/)
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
Next, you're going to make a modification to your app and learn how to update your running application with a new image. Along the way, you'll learn a few other useful commands.
@y
次ではアプリケーションの修正を行います。
そして新たなイメージを使って起動中のアプリケーションを更新する方法について学びます。
その際には他の便利なコマンドについてもいろいろ学んでいきます。
@z

@x
{{< button text="Update the application" url="03_updating_app.md" >}}
@y
{{< button text="アプリケーションの更新" url="03_updating_app.md" >}}
@z
