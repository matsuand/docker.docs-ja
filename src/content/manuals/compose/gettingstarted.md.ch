%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

@x
description: Follow this hands-on tutorial to learn how to use Docker Compose from defining application
  dependencies to experimenting with commands.
keywords: docker compose example, docker compose tutorial, how to use docker compose,
  running docker compose, how to run docker compose, docker compose build image, docker
  compose command example, run docker compose file, how to create a docker compose
  file, run a docker compose file
@y
description: Follow this hands-on tutorial to learn how to use Docker Compose from defining application
  dependencies to experimenting with commands.
keywords: docker compose example, docker compose tutorial, how to use docker compose,
  running docker compose, how to run docker compose, docker compose build image, docker
  compose command example, run docker compose file, how to create a docker compose
  file, run a docker compose file
@z

@x
title: Docker Compose Quickstart
linkTitle: Quickstart
@y
title: Docker Compose クィックスタート
linkTitle: クィックスタート
@z

@x
This tutorial aims to introduce fundamental concepts of Docker Compose by guiding you through the development of a basic Python web application. 
@y
このチュートリアルでは Docker Compose の基本的な考え方について説明します。
簡単な Python ウェブアプリケーションの開発を通じてガイドを進めていきます。
@z

@x
Using the Flask framework, the application features a hit counter in Redis, providing a practical example of how Docker Compose can be applied in web development scenarios. 
@y
このアプリケーションは Flask フレームワークを利用し Redis によりアクセスカウンターを管理します。
このアプリを通じて Docker Compose をウェブ開発シーンにどのように適用するのか、という実践的な例を示すものです。
@z

@x
The concepts demonstrated here should be understandable even if you're not familiar with Python. 
@y
ここで示す考え方は Python に不慣れな方でも理解できるようにしています。
@z

@x
This is a non-normative example that demonstrates core Compose functionality. 
@y
これは標準的な例というわけではないため、Compose のコアな機能を実現するものではありません。
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
Make sure you have:
@y
以下を行っておくことが必要です。
@z

@x
- [Installed the latest version of Docker Compose](/manuals/compose/install/_index.md)
- A basic understanding of Docker concepts and how Docker works
@y
- [Docker Compose の最新版をインストールしていること](manuals/compose/install/_index.md)
- Docker の考え方や Docker がどのようにして動作しているのかの基本を理解していること
@z

@x
## Step 1: Set up
@y
## 手順 1: セットアップ {#step-1-set-up}
@z

@x
1. Create a directory for the project:
@y
1. プロジェクト用のディレクトリを生成します。
@z

% snip command...

@x
2. Create a file called `app.py` in your project directory and paste the following code in:
@y
2. プロジェクトディレクトリ内に `app.py` というファイルを生成して、以下のコードを記述します。
@z

% snip code...

@x
   In this example, `redis` is the hostname of the redis container on the
   application's network and the default port, `6379` is used.
@y
   この例において `redis` とは、このアプリケーションネットワーク上の redis コンテナーのホスト名です。
   redis のデフォルトポートとして `6379` を利用します。
@z

@x
   > [!NOTE]
   >
   > Note the way the `get_hit_count` function is written. This basic retry
   > loop attempts the request multiple times if the Redis service is
   > not available. This is useful at startup while the application comes
   > online, but also makes the application more resilient if the Redis
   > service needs to be restarted anytime during the app's lifetime. In a
   > cluster, this also helps handling momentary connection drops between
   > nodes.
@y
   > [!NOTE]
   >
   > `get_hit_count` という関数がどのように書かれているかを見てください。
   > この単純なリトライのループにより、redis サービスが起動していなかったとしても、リクエストを何度でも送信できます。
   > アプリケーションの起動時にはこの方法が適していますが、さらにはこのアプリの動作中に redis サービスを再起動する必要が発生した場合も、アプリが柔軟に対応できる方法です。
   > クラスターを構成している場合、ノード間でのネットワークの瞬断を制御することもできます。
@z

@x
3. Create another file called `requirements.txt` in your project directory and
   paste the following code in:
@y
3. プロジェクト用のディレクトリにもう一つ `requirements.txt` という名称のファイルを作成し、次のコードを記述します。
@z

% snip text...

@x
4. Create a `Dockerfile` and paste the following code in:
@y
4. `Dockerfile` を生成し、次のコードを記述します。
@z

% snip code...

@x
   {{< accordion title="Understand the Dockerfile" >}}
@y
   {{< accordion title="Dockerfile の理解" >}}
@z

@x
   This tells Docker to:
@y
   これは Docker に対して以下の指示を行います。
@z

@x
   * Build an image starting with the Python 3.10 image.
   * Set the working directory to `/code`.
   * Set environment variables used by the `flask` command.
   * Install gcc and other dependencies
   * Copy `requirements.txt` and install the Python dependencies.
   * Add metadata to the image to describe that the container is listening on port 5000
   * Copy the current directory `.` in the project to the workdir `.` in the image.
   * Set the default command for the container to `flask run --debug`.
@y
   * Python 3.10 イメージを使ってこのイメージをビルドします。
   * ワーキングディレクトリを `/code` に設定します。
   * `flask` コマンドが利用する環境変数を設定します。
   * gcc やその依存パッケージをインストールします。
   * `requirements.txt` をコピーして Python 依存パッケージをインストールします。
   * イメージにメタデータを追加して、コンテナーがポート 5000 をリッスンするようにします。
   * このプロジェクトのカレントディレクトリ `.` をイメージ内のワークディレクトリ `.` にコピーします。
   * コンテナーのデフォルトコマンドを `flask run --debug` にします。
@z

@x
   {{< /accordion >}}
@y
   {{< /accordion >}}
@z

@x
   > [!IMPORTANT]
   >
   >Check that the `Dockerfile` has no file extension like `.txt`. Some editors may append this file extension automatically which results in an error when you run the application.
@y
   > [!IMPORTANT]
   >
   >`Dockerfile` には `.txt` などのような拡張子がないことを確認してください。
   >エディターの中には自動的に拡張子をつけてしまうものがあり、その場合にはアプリケーション実行時にエラーとなってしまいます。
@z

@x
   For more information on how to write Dockerfiles, see the [Dockerfile reference](/reference/dockerfile/).
@y
   Dockerfile の書き方の詳細は [Dockerfile リファレンス](__SUBDIR__/reference/dockerfile/) を参照してください。
@z

@x
## Step 2: Define services in a Compose file
@y
## 手順 2: Compose ファイルでのサービス定義 {#step-2-define-services-in-a-compose-file}
@z

@x
Compose simplifies the control of your entire application stack, making it easy to manage services, networks, and volumes in a single, comprehensible YAML configuration file.
@y
Compose はアプリケーションスタック全体の制御を単純化します。
つまりサービス、ネットワーク、ボリュームを、分かりやすいただ一つの YAML 設定ファイルを使って管理できます。
@z

@x
Create a file called `compose.yaml` in your project directory and paste
the following:
@y
プロジェクト用のディレクトリ内で `compose.yaml` という名称のファイルを作成し、次の内容にします。
@z

% snip code...

@x
This Compose file defines two services: `web` and `redis`. 
@y
この Compose ファイルは 2 つのサービス `web` と `redis` を定義しています。
@z

@x
The `web` service uses an image that's built from the `Dockerfile` in the current directory.
It then binds the container and the host machine to the exposed port, `8000`. This example service uses the default port for the Flask web server, `5000`.
@y
`web` サービスは、カレントディレクトリ内の `Dockerfile` からビルドされたイメージを利用します。
そしてコンテナーとホストマシンを、公開用ポート `8000` でつなぎます。
このサービス例では Flask ウェブサーバーのデフォルトポートである `5000` を利用するものです。
@z

@x
The `redis` service uses a public [Redis](https://registry.hub.docker.com/_/redis/) 
image pulled from the Docker Hub registry.
@y
`redis` サービスには Docker Hub レジストリに公開されている [Redis](https://registry.hub.docker.com/_/redis/) イメージを取得して利用します。
@z

@x
For more information on the `compose.yaml` file, see [How Compose works](compose-application-model.md).
@y
`compose.yaml` ファイルの詳細については [Compose はどのように動作するか](manuals/compose/intro/compose-application-model.md) を参照してください。
@z

@x
## Step 3: Build and run your app with Compose
@y
## 手順 3: Compose によるアプリのビルドと実行 {#step-3-build-and-run-your-app-with-compose}
@z

@x
With a single command, you create and start all the services from your configuration file.
@y
たった 1 つのコマンドを使うだけで、設定ファイルに基づいたサービスのすべてを生成して起動します。
@z

@x
1. From your project directory, start up your application by running `docker compose up`.
@y
1.  プロジェクト用のディレクトリで `docker-compose up` を実行してアプリケーションを起動します。
@z

% snip command...

@x
   Compose pulls a Redis image, builds an image for your code, and starts the
   services you defined. In this case, the code is statically copied into the image at build time.
@y
   Compose は Redis イメージを取得し、コードを動作させるイメージを構築した上で、定義されているサービスを開始します。
   この例ではビルド時において、コードがイメージ内に静的にコピーされます。
@z

@x
2. Enter `http://localhost:8000/` in a browser to see the application running.
@y
2. ブラウザーから `http://localhost:8000/` を開き、アプリケーションの動作を確認します。
@z

@x
   If this doesn't resolve, you can also try `http://127.0.0.1:8000`.
@y
   うまくいかなかったら `http://127.0.0.1:8000` も試してみてください。
@z

@x
   You should see a message in your browser saying:
@y
   ブラウザーには以下のメッセージが表示されます。
@z

% snip text...

@x
   ![hello world in browser](images/quick-hello-world-1.png)
@y
   ![ブラウザー上の hello world](images/quick-hello-world-1.png)
@z

@x
3. Refresh the page.
@y
3. ページを更新します。
@z

@x
   The number should increment.
@y
   数値が更新されたはずです。
@z

% snip text...

@x
   ![hello world in browser](images/quick-hello-world-2.png)
@y
   ![ブラウザー上の hello world](images/quick-hello-world-2.png)
@z

@x
4. Switch to another terminal window, and type `docker image ls` to list local images.
@y
4. 別の端末画面を開いて `docker image ls` を実行し、ローカルのイメージ一覧を表示します。
@z

@x
   Listing images at this point should return `redis` and `web`.
@y
   この時点で一覧表示されるイメージに `redis` と `web` が含まれます。
@z

% snip command...

@x
   You can inspect images with `docker inspect <tag or id>`.
@y
   `docker inspect <tag または id>`によってイメージを確認することもできます。
@z

@x
5. Stop the application, either by running `docker compose down`
   from within your project directory in the second terminal, or by
   hitting `CTRL+C` in the original terminal where you started the app.
@y
5. アプリケーションを停止させます。
   2 つめに開いた端末画面上のプロジェクトディレクトリにおいて `docker-compose down` を実行します。
   またはアプリを開始したはじめの端末画面上において `CTRL+C` を入力します。
@z

@x
## Step 4: Edit the Compose file to use Compose Watch
@y
## 手順 4: Compose Watch 利用のための Compose ファイル修正 {#step-4-edit-the-compose-file-to-use-compose-watch}
@z

@x
Edit the `compose.yaml` file in your project directory to use `watch` so you can preview your running Compose services which are automatically updated as you edit and save your code:
@y
プロジェクトディレクトリにある `compose.yaml` ファイルを修正して `watch` を利用するようにします。
ソースコードの編集や保存を行った際に、起動中の Compose サービスが自動的に更新される様子を見ることができます。
@z

% snip code...

@x
Whenever a file is changed, Compose syncs the file to the corresponding location under `/code` inside the container. Once copied, the bundler updates the running application without a restart.
@y
ファイルを変更したら、コンテナー内部の `/code` 配下のファイルとの同期が行われます。
コピーを行えば bundler が実行中のアプリケーションを再起動することなく更新します。
@z

@x
For more information on how Compose Watch works, see [Use Compose Watch](/manuals/compose/how-tos/file-watch.md). Alternatively, see [Manage data in containers](/manuals/engine/storage/volumes.md) for other options.
@y
Compose Watch がどのようにして動作するのかについては [Compose Watch の利用](manuals/compose/how-tos/file-watch.md) を参照してください。
数々のオプションについては [コンテナーでのデータ管理](manuals/engine/storage/volumes.md) にも説明があります。
@z

@x
> [!NOTE]
>
> For this example to work, the `--debug` option is added to the `Dockerfile`. The `--debug` option in Flask enables automatic code reload, making it possible to work on the backend API without the need to restart or rebuild the container.
> After changing the `.py` file, subsequent API calls will use the new code, but the browser UI will not automatically refresh in this small example. Most frontend development servers include native live reload support that works with Compose.
@y
> [!NOTE]
>
> この例においては `Dockerfile` に `--debug` オプションをつけています。
> Flask に対して `--debug` オプションを設定すると、コードの再ロードが自動化され、再起動やコンテナーの再ビルドをしなくても、バックエンド API を動作させることができます。
> `.py` ファイルを編集した後は、その後の API 呼出は新たなコードを用いるようになります。
> ただしこの単純な例においては、ブラウザー上の UI は自動更新が行われません。
> たいていのフロントエンド開発サーバーでは、Compose を使って動作する、ネイティブのライブリロード機能がサポートされています。
@z

@x
## Step 5: Re-build and run the app with Compose
@y
## 手順 5: Compose を使ったアプリの再ビルドと実行 {#step-5-re-build-and-run-the-app-with-compose}
@z

@x
From your project directory, type `docker compose watch` or `docker compose up --watch` to build and launch the app and start the file watch mode.
@y
プロジェクトディレクトリにおいて `docker compose watch` または `docker compose up --watch` と入力してください。
アプリのビルドと起動を行い、ファイル監視モード (watch mode) がスタートします。
@z

% snip command...

@x
Check the `Hello World` message in a web browser again, and refresh to see the
count increment.
@y
もう一度ウェブブラウザー上の `Hello World` メッセージを確認してください。
画面更新を行うと、カウンターが更新されるはずです。
@z

@x
## Step 6: Update the application
@y
## 手順 6: アプリケーションのアップデート {#step-6-update-the-application}
@z

@x
To see Compose Watch in action:
@y
Compose Watch の動作を確認するには以下を行います。
@z

@x
1. Change the greeting in `app.py` and save it. For example, change the `Hello World!`
message to `Hello from Docker!`:
@y
1. `app.py` 内にあるあいさつ文を変更して保存します。
   たとえば `Hello World!` を `Hello from Docker!` とします。
@z

% snip code...

@x
2. Refresh the app in your browser. The greeting should be updated, and the
counter should still be incrementing.
@y
2. ブラウザー上のアプリをリフレッシュします。
   あいさつ文が更新されます。
   さらにカウンターも更新されるはずです。
@z

@x
   ![hello world in browser](images/quick-hello-world-3.png)
@y
   ![ブラウザー上の hello world](images/quick-hello-world-3.png)
@z

@x
3. Once you're done, run `docker compose down`.
@y
3. すべてを終えたら `docker compose down` を実行します。
@z

@x
## Step 7: Split up your services
@y
## 手順 7: サービスの分割 {#step-7-split-up-your-services}
@z

@x
Using multiple Compose files lets you customize a Compose application for different environments or workflows. This is useful for large applications that may use dozens of containers, with ownership distributed across multiple teams. 
@y
Compose ファイルを複数に分けると、さまざまな環境やワークフロー向けに Compose アプリケーションをカスタマイズできます。
これは何十ものコンテナーを利用するような大きなアプリケーションにとって非常に便利です。
その管理を複数チームに分かれて行うことができます。
@z

@x
1. In your project folder, create a new Compose file called `infra.yaml`.
@y
1. プロジェクトフォルダーにおいて `infra.yaml` という Compose ファイルを新規生成します。
@z

@x
2. Cut the Redis service from your `compose.yaml` file and paste it into your new `infra.yaml` file. Make sure you add the `services` top-level attribute at the top of your file. Your `infra.yaml` file should now look like this:
@y
2. `compose.yaml` ファイル内の Redis サービスの部分を切り取って、新ファイル `infra.yaml` の中に貼り付けます。
   ファイルの最上段にはトップレベル属性である `services` をつけます。
   `infra.yaml` ファイルは以下となります。
@z

% snip code...

@x
3. In your `compose.yaml` file, add the `include` top-level attribute along with the path to the `infra.yaml` file.
@y
3. `compose.yaml` ファイルにはトップレベル属性 `include` を用いて `infra.yaml` ファイルへのパスを記述します。
@z

% snip code...

@x
4. Run `docker compose up` to build the app with the updated Compose files, and run it. You should see the `Hello world` message in your browser. 
@y
4. 作り替えた Compose ファイルを使って `docker compose up` によりアプリをビルドおよび実行します。
   ブラウザー上に `Hello world` メッセージが表示されます。
@z

@x
This is a simplified example, but it demonstrates the basic principle of `include` and how it can make it easier to modularize complex applications into sub-Compose files. For more information on `include` and working with multiple Compose files, see [Working with multiple Compose files](/manuals/compose/how-tos/multiple-compose-files/_index.md).
@y
これは単純化した例にすぎません。
それでも `include` の基本的な考え方を示していて、複雑なアプリケーションを Compose サブファイルに分割し、簡単にモジュラー化する方法を紹介しています。
`include` を使った複数 Compose ファイルの利用に関する詳細は [複数 Compose ファイルの利用](manuals/compose/how-tos/multiple-compose-files/_index.md) を参照してください。
@z

@x
## Step 8: Experiment with some other commands
@y
## 手順 8: 他のコマンドを試す {#step-8-experiment-with-some-other-commands}
@z

@x
- If you want to run your services in the background, you can pass the `-d` flag (for "detached" mode) to `docker compose up` and use `docker compose ps` to see what is currently running:
@y
- サービスをバックグランド実行したい場合は `docker compose up` に対して `-d` フラグ (「デタッチ detached」モードの意味) をつけて実行します。
`docker compose ps` を実行すれば、今動いているものが何かを確認できます。
@z

% snip command...

@x
- Run `docker compose --help` to see other available commands.
@y
- `docker compose --help` の実行によって、これ以外に利用できるコマンドを確認できます。
@z

@x
- If you started Compose with `docker compose up -d`, stop your services once you've finished with them:
@y
- `docker compose up -d` を使って Compose を起動した場合は、作業終了の後は以下によりサービスを終了します。
@z

% snip command...

@x
- You can bring everything down, removing the containers entirely, with the `docker compose down` command. 
@y
- `docker compose down` コマンドによって、すべてを停止させコンテナーの完全削除までを行います。
@z

@x
## Where to go next
@y
## 次に読むものは {#where-to-go-next}
@z

@x
- Try the [Sample apps with Compose](https://github.com/docker/awesome-compose)
- [Explore the full list of Compose commands](/reference/cli/docker/compose.md)
- [Explore the Compose file reference](/reference/compose-file/_index.md)
- [Check out the Learning Docker Compose video on LinkedIn Learning](https://www.linkedin.com/learning/learning-docker-compose/)
@y
- [Compose を使ったサンプルアプリ](https://github.com/docker/awesome-compose) を試してみてください。
- [Compose コマンドの全一覧](reference/cli/docker/compose.md)
- [Compose ファイルリファレンス](reference/compose-file/_index.md)
- [Check out the Learning Docker Compose video on LinkedIn Learning](https://www.linkedin.com/learning/learning-docker-compose/)
@z
