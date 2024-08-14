%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応。
% snip 対応 / .md リンクへの (no slash) 対応

@x
title: Use containers for Node.js development
keywords: node, node.js, development
description: Learn how to develop your Node.js application locally using containers.
@y
title: コンテナーを利用した Node.js 開発
keywords: node, node.js, development
description: Learn how to develop your Node.js application locally using containers.
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
Complete [Containerize a Node.js application](containerize.md).
@y
[Node.js アプリケーションのコンテナー化](containerize.md) を完了していること。
@z

@x
## Overview
@y
## 概要 {#overview}
@z

@x
In this section, you'll learn how to set up a development environment for your containerized application. This includes:
 - Adding a local database and persisting data
 - Configuring your container to run a development environment
 - Debugging your containerized application
@y
本節ではコンテナー化したアプリケーションに対する開発環境の構築方法を学びます。
ここでは以下を行います。
 - ローカルデータベースを追加して、そのデータを維持します。
 - 開発環境として実行するためにコンテナー設定を行います。
 - コンテナー化したアプリケーションのデバッグを行います。
@z

@x
## Add a local database and persist data
@y
## ローカルデータベースの追加とデータ維持 {#add-a-local-database-and-persist-data}
@z

@x
You can use containers to set up local services, like a database. In this section, you'll update the `compose.yaml` file to define a database service and a volume to persist data.
@y
コンテナーでは、ローカルサービスとしてたとえばデータベースを構築することができます。
本節では `compose.yaml` ファイルを編集して、データベースサービスを追加してデータ保存のためのボリュームを定義します。
@z

@x
1. Open your `compose.yaml` file in an IDE or text editor.
@y
1. IDE またはテキストエディターを使って `compose.yaml` ファイルを開きます。
@z

@x
2. Uncomment the database related instructions. The following is the updated
   `compose.yaml` file.
@y
2. データベースに関する命令部分のコメントを解除します。
   書き換えた `compose.yaml` ファイルは以下のようになります。
@z

@x
   > **Important**
   >
   > For this section, don't run `docker compose up` until you are instructed to. Running the command at intermediate points may incorrectly initialize your database.
   { .important }
@y
   > **重要**
   >
   > 本節においては、指示があるまで `docker compose up` は実行しないでください。
   > 作業の途中においてコマンド実行してしまうと、データベースが誤って初期化されてしまう場合があります。
   { .important }
@z

@x within code
   # Comments are provided throughout this file to help you get started.
   # If you need more help, visit the Docker Compose reference guide at
   # https://docs.docker.com/go/compose-spec-reference/
@y
   # Comments are provided throughout this file to help you get started.
   # If you need more help, visit the Docker Compose reference guide at
   # https://docs.docker.com/go/compose-spec-reference/
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
   > **Note**
   >
   > To learn more about the instructions in the Compose file, see [Compose file
   > reference](/compose/compose-file/).
@y
   > **メモ**
   >
   > Compose ファイル内の命令について詳しく学ぶには [Compose ファイルリファレンス](__SUBDIR__/compose/compose-file/) を参照してください。
@z

@x
3. Open `src/persistence/postgres.js` in an IDE or text editor. You'll notice
that this application uses a Postgres database and requires some environment
variables in order to connect to the database. The `compose.yaml` file doesn't
have these variables defined yet.
@y
3. IDE またはテキストエディターを使って `src/persistence/postgres.js` を開きます。
   中を覗いてみると、このアプリケーションは Postgres データベースを利用しており、データベースへの接続に環境変数を利用していることがすぐにわかります。
   `compose.yaml` ファイルでは、まだそれらの環境変数を定義していません。
@z

@x
4. Add the environment variables that specify the database configuration. The
   following is the updated `compose.yaml` file.
@y
4. データベースの設定を行う環境変数を追加します。
   書き換えた `compose.yaml` ファイルは以下のようになります。
@z

@x within code
   # Comments are provided throughout this file to help you get started.
   # If you need more help, visit the Docker Compose reference guide at
   # https://docs.docker.com/go/compose-spec-reference/
@y
   # Comments are provided throughout this file to help you get started.
   # If you need more help, visit the Docker Compose reference guide at
   # https://docs.docker.com/go/compose-spec-reference/
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
5. Add the `secrets` section under the `server` service so that your application securely handles the database password. The following is the updated `compose.yaml` file.
@y
5. `server` サービス配下に `secrets` セクションを追加します。
   これにより、アプリケーションが利用するデータベースパスワードを安全に取り扱います。
   書き換えた `compose.yaml` ファイルは以下のようになります。
@z

@x within code
   # Comments are provided throughout this file to help you get started.
   # If you need more help, visit the Docker Compose reference guide at
   # https://docs.docker.com/go/compose-spec-reference/
@y
   # Comments are provided throughout this file to help you get started.
   # If you need more help, visit the Docker Compose reference guide at
   # https://docs.docker.com/go/compose-spec-reference/
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
6. In the `docker-nodejs-sample` directory, create a directory named `db`.
@y
6. `docker-nodejs-sample` ディレクトリ内に `db` という名前のディレクトリを生成します。
@z

@x
7. In the `db` directory, create a file named `password.txt`. This file will
   contain your database password.
@y
7. `db` ディレクトリ内に `password.txt` という名前のファイルを生成します。
   このファイルにデータベースパスワードを記述します。
@z

@x
   You should now have at least the following contents in your
   `docker-nodejs-sample` directory.
@y
   ここまでにより `docker-nodejs-sample` ディレクトリ内は少なくとも以下のようになっているはずです。
@z

% snip text...

@x
8. Open the `password.txt` file in an IDE or text editor, and specify a password
   of your choice. Your password must be on a single line with no additional
   lines. Ensure that the file doesn't contain any newline characters or other
   hidden characters.
@y
8. IDE またはテキストエディターを使って `password.txt` ファイルを開きます。
   そしてパスワードを任意に取り決めて記述します。
   このパスワードは 1 行内に記述し、これ以外の行を記述してはなりません。
   改行文字や隠し文字などは一切含めないようにしてください。
@z

@x
9. Ensure that you save your changes to all the files that you have modified.
@y
9. ここまでに修正したファイルは、すべて適切に保存したことを確認します。
@z

@x
10. Run the following command to start your application.
@y
10. 以下のコマンドを実行してアプリケーションを起動します。
@z

% snip command...

@x
11. Open a browser and verify that the application is running at
    [http://localhost:3000](http://localhost:3000).
@y
11. ブラウザーを開きます。
    アプリケーションが起動していることを確認するため [http://localhost:3000](http://localhost:3000) にアクセスします。
@z

@x
12. Add some items to the todo list to test data persistence.
@y
12. データが保持されることを確認するため、todo リストにアイテムをいくつか追加します。
@z

@x
13. After adding some items to the todo list, press `ctrl+c` in the terminal to
    stop your application.
@y
13. todo リストへの追加をある程度行ったら、端末上において `ctrl+c` を入力してアプリケーションを停止します。
@z

@x
14. In the terminal, run `docker compose rm` to remove your containers.
@y
14. 端末上において `docker compose rm` を実行してコンテナーを削除します。
@z

% snip command...

@x
15. Run `docker compose up` to run your application again.
@y
15. `docker compose up` を実行してアプリケーションを再度起動します。
@z

% snip command...

@x
16. Refresh [http://localhost:3000](http://localhost:3000) in your browser and verify that the todo items persisted, even after the containers were removed and ran again.
@y
16. ブラウザーにおいて [http://localhost:3000](http://localhost:3000) の表示を更新します。
    todo リスト内のアイテムが保持されていることを確認します。
    コンテナーを削除した後の再起動であってもデータが保持されているはずです。
@z

@x
## Configure and run a development container
@y
## 開発用コンテナーの設定と起動 {#configure-and-run-a-development-container}
@z

@x
You can use a bind mount to mount your source code into the container. The container can then see the changes you make to the code immediately, as soon as you save a file. This means that you can run processes, like nodemon, in the container that watch for filesystem changes and respond to them. To learn more about bind mounts, see [Storage overview](/engine/storage/index.md).
@y
バインドマウントを利用すれば、ソースコードをコンテナー内にマウントすることができます。
コードに対して変更を行って保存すれば、即座にコンテナー側でそれを利用することができます。
これはつまり、ファイルシステム内の変更を監視しそれに反応する処理を行う、nodemon のようなプロセスでも実行できるということです。
バインドマウントに関する詳細は [ストレージ概要](engine/storage/_index.md) を参照してください。
@z

@x
In addition to adding a bind mount, you can configure your Dockerfile and `compose.yaml` file to install development dependencies and run development tools.
@y
バインドマウントの追加に加えて、Dockerfile と `compose.yaml` ファイルにおいて、開発のための依存パッケージのインストール設定を行い、また開発ツールを実行します。
@z

@x
### Update your Dockerfile for development
@y
### 開発向けの Dockerfile 修正 {#update-your-dockerfile-for-development}
@z

@x
Open the Dockerfile in an IDE or text editor. Note that the Dockerfile doesn't
install development dependencies and doesn't run nodemon. You'll
need to update your Dockerfile to install the development dependencies and run
nodemon.
@y
IDE またはテキストエディターを使って Dockerfile を開きます。
Dockerfile にはこの時点で開発用の依存パッケージをインストールするものでなく、nodemon も実行していません。
ここからは Dockerfile を修正して、開発用依存パッケージのインストールと nodemon の実行を行うようにします。
@z

@x
Rather than creating one Dockerfile for production, and another Dockerfile for
development, you can use one multi-stage Dockerfile for both.
@y
ここでは本番環境向けの Dockerfile、開発向けの Dockerfile をそれぞれ作成するのではなく、1 つの Dockerfile をマルチステージにより両方に利用するものとします。
@z

@x
Update your Dockerfile to the following multi-stage Dockerfile.
@y
Dockerfile を以下のように修正して、以下のようなマルチステージの Dockerfile とします。
@z

% snip code...

@x
In the Dockerfile, you first add a label `as base` to the `FROM
node:${NODE_VERSION}-alpine` statement. This lets you refer to this build stage
in other build stages. Next, you add a new build stage labeled `dev` to install
your development dependencies and start the container using `npm run dev`.
Finally, you add a stage labeled `prod` that omits the dev dependencies and runs
your application using `node src/index.js`. To learn more about multi-stage
builds, see [Multi-stage builds](../../build/building/multi-stage.md).
@y
この Dockerfile においては `FROM node:${NODE_VERSION}-alpine` ステートメントに `as base` としてラベルをつけています。
こうすることで、このビルドステージを別のビルドステージにて参照できるようになります。
そして新たなビルドステージに対しては `dev` というラベルをつけて、開発向けの依存パッケージのインストールを行い、`npm run dev` を使ってコンテナーを起動させます。
最終的に `prod` というラベルのステージを作り出し、開発用依存パッケージは持たずに、`node src/index.js` を使ってアプリケーションを起動します。
マルチビルドステージの詳細については [マルチステージビルド](../../build/building/multi-stage.md) を参照してください。
@z

@x
Next, you'll need to update your Compose file to use the new stage.
@y
次は Compose ファイルを修正して、新たなビルドステージを用いるようにします。
@z

@x
### Update your Compose file for development
@y
### 開発向けの Compose ファイル修正 {#update-your-compose-file-for-development}
@z

@x
To run the `dev` stage with Compose, you need to update your `compose.yaml`
file. Open your `compose.yaml` file in an IDE or text editor, and then add the
`target: dev` instruction to target the `dev` stage from your multi-stage
Dockerfile.
@y
`dev` ステージを Compose から実行するには `compose.yaml` ファイルの変更が必要です。
IDE またはテキストエディターを使って `compose.yaml` ファイルを開きます。
そして `target: dev` 命令を加えることで、マルチステージ Dockerfile 内の `dev` ステージを用いるように指定します。
@z

@x
Also, add a new volume to the server service for the bind mount. For this application, you'll mount `./src` from your local machine to `/usr/src/app/src` in the container.
@y
また server サービスへのバインドマウントを行うためのボリュームを新たに追加します。
このアプリケーションでは、ローカルマシンの `./src` を、コンテナー内の `/usr/src/app/src` にマウントします。
@z

@x
Lastly, publish port `9229` for debugging.
@y
そしてデバッグ用にポート `9229` を開放します。
@z

@x
The following is the updated Compose file. All comments have been removed.
@y
以下が修正を行った Compose jファイルです。
コメントはすべて解除されています。
@z

% snip code...

@x
### Run your development container and debug your application
@y
### 開発用コンテナーの実行とアプリケーションのデバッグ {#run-your-development-container-and-debug-your-application}
@z

@x
Run the following command to run your application with the new changes to the `Dockerfile` and `compose.yaml` file.
@y
以下のコマンドを実行して、修正した `Dockerfile` と `compose.yaml` ファイルを使ったアプリケーションを実行します。
@z

% snip command...

@x
Open a browser and verify that the application is running at [http://localhost:3000](http://localhost:3000).
@y
ブラウザーを開きます。
アプリケーションが起動していることを確認するため [http://localhost:3000](http://localhost:3000) にアクセスします。
@z

@x
Any changes to the application's source files on your local machine will now be
immediately reflected in the running container.
@y
ローカルマシン内にあるアプリケーションのソースファイルは、変更すると同時に実行コンテナー内にも即座に反映されることになります。
@z

@x
Open `docker-nodejs-sample/src/static/js/app.js` in an IDE or text editor and update the button text on line 109 from `Add Item` to `Add`.
@y
IDE またはテキストエディターを使って `docker-nodejs-sample/src/static/js/app.js` を開きます。
そして 109 行めにあるボタンテキストを `Add Item` から `Add` に変更します。
@z

% snip code...

@x
Refresh [http://localhost:3000](http://localhost:3000) in your browser and verify that the updated text appears.
@y
ブラウザーにおいて [http://localhost:3000](http://localhost:3000) の表示を更新します。
更新したボタンテキストが変更されていることを確認します。
@z

@x
You can now connect an inspector client to your application for debugging. For
more details about inspector clients, see the [Node.js
documentation](https://nodejs.org/en/docs/guides/debugging-getting-started).
@y
アプリケーションに対してインスペクタークライアントを接続して、デバッグを行うことができます。
インスペクタークライアントの詳細については [Node.js ドキュメント](https://nodejs.org/en/docs/guides/debugging-getting-started) を参照してください。
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this section, you took a look at setting up your Compose file to add a mock
database and persist data. You also learned how to create a multi-stage
Dockerfile and set up a bind mount for development.
@y
本節では Compose ファイルの設定を通じて、簡単なデータベースを追加しデータの保持を行う方法を見てきました。
またマルチステージ Dockerfile の生成方法と、開発向けのバインドマウントの設定方法について学びました。
@z

@x
Related information:
 - [Volumes top-level element](/compose/compose-file/07-volumes/)
 - [Services top-level element](/compose/compose-file/05-services/)
 - [Multi-stage builds](../../build/building/multi-stage.md)
@y
関連情報
 - [ボリュームの最上位項目](__SUBDIR__/compose/compose-file/07-volumes/)
 - [サービスの最上位項目](__SUBDIR__/compose/compose-file/05-services/)
 - [マルチステージビルド](../../build/building/multi-stage.md)
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
In the next section, you'll learn how to run unit tests using Docker.
@y
次の節では、Docker を用いたユニットテストの実行方法について学びます。
@z

@x
{{< button text="Run your tests" url="run-tests.md" >}}
@y
{{< button text="テストの実行" url="run-tests.md" >}}
@z
