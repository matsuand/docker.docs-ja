%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Use containers for PHP development
linkTitle: Develop your app
@y
title: コンテナーを利用した PHP 開発
linkTitle: アプリの開発
@z

@x
keywords: php, development
description: Learn how to develop your PHP application locally using containers.
@y
keywords: php, development
description: コンテナーを使ってローカル環境にて PHP アプリケーションを開発する方法を学びます。
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
Complete [Containerize a PHP application](containerize.md).
@y
[PHP アプリケーションのコンテナー化](containerize.md) を完了していること。
@z

@x
## Overview
@y
## 概要 {#overview}
@z

@x
In this section, you'll learn how to set up a development environment for your containerized application. This includes:
@y
本節ではコンテナー化したアプリケーションに対する開発環境の構築方法を学びます。
ここでは以下を行います。
@z

@x
- Adding a local database and persisting data
- Adding phpMyAdmin to interact with the database
- Configuring Compose to automatically update your running Compose services as
  you edit and save your code
- Creating a development container that contains the dev dependencies
@y
- ローカルデータベースを追加してデータを保存します。
- データベースとの処理のため phpMyAdmin を追加します。
- Compose の設定を通じて、コード編集および保存とともに、実行中の Compose サービスが自動的に更新されるようにします。
- dev 依存パッケージを含んだ開発用コンテナーを生成します。
@z

@x
## Add a local database and persist data
@y
## ローカルデータベースの追加とデータ保存 {#add-a-local-database-and-persist-data}
@z

@x
You can use containers to set up local services, like a database.
To do this for the sample application, you'll need to do the following:
@y
コンテナーでは、ローカルサービスとしてたとえばデータベースを構築することができます。
サンプルアプリケーションにおいてそれを実現するためには、以下を行っていくことが必要です。
@z

@x
- Update the `Dockerfile` to install extensions to connect to the database
- Update the `compose.yaml` file to add a database service and volume to persist data
@y
- `Dockerfile` を修正して、データベース接続を行う拡張モジュールをインストールします。
- `compose.yaml` ファイルを修正して、データベースサービスの追加、およびデータ保存のためのボリューム追加を行います。
@z

@x
### Update the Dockerfile to install extensions
@y
### 拡張モジュールインストールのための Dockerfile 更新 {#update-the-dockerfile-to-install-extensions}
@z

@x
To install PHP extensions, you need to update the `Dockerfile`. Open your
Dockerfile in an IDE or text editor and then update the contents. The following
`Dockerfile` includes one new line that installs the `pdo` and `pdo_mysql`
extensions. All comments have been removed.
@y
PHP 拡張をインストールするには `Dockerfile` を修正する必要があります。
IDE またはテキストエディターを使って Dockerfile を開き、内容を修正します。
以下の `Dockerfile` では新たな行を挿入し、そこで `pdo` および `pdo_mysql` 拡張モジュールをインストールします。
コメントはすべて削除しています。
@z

% snip code...

@x
For more details about installing PHP extensions, see the [Official Docker Image for PHP](https://hub.docker.com/_/php).
@y
PHP 拡張モジュールのインストールについては [PHP 向け公式 Docker イメージ](https://hub.docker.com/_/php) を参照してください。
@z

@x
### Update the compose.yaml file to add a db and persist data
@y
### DB およびデータ追加のための compose.yaml ファイル更新 {#update-the-composeyaml-file-to-add-a-db-and-persist-data}
@z

@x
Open the `compose.yaml` file in an IDE or text editor. You'll notice it
already contains commented-out instructions for a PostgreSQL database and volume. For this application, you'll use MariaDB. For more details about MariaDB, see the [MariaDB Official Docker image](https://hub.docker.com/_/mariadb).
@y
IDE またはテキストエディターを使って `compose.yaml` ファイルを開きます。
中を見てみれば分かるように、PostgreSQL データベースとボリュームに関する命令が、コメントアウトされて既に記述されています。
このアプリケーションでは MariaDB を用いることにしています。
MariaDB に関する詳細は [MariaDB 公式 Docker イメージ](https://hub.docker.com/_/mariadb) を参照してください。
@z

@x
Open the `src/database.php` file in an IDE or text editor. You'll notice that it reads environment variables in order to connect to the database.
@y
IDE またはテキストエディターを使って `src/database.php` ファイルを開きます。
これを見れば、データベース接続を行うために環境変数を読み込んでいることが分かります。
@z

@x
In the `compose.yaml` file, you'll need to update the following:
@y
`compose.yaml` ファイルでは以下の修正を行います。
@z

@x
1. Uncomment and update the database instructions for MariaDB.
2. Add a secret to the server service to pass in the database password.
3. Add the database connection environment variables to the server service.
4. Uncomment the volume instructions to persist data.
@y
1. MariaDB 用のデータベース命令のコメントをはずします。
2. データベースパスワードを受け渡すため、サーバーサービスに secret を加えます。
3. サーバーサービスにデータベース接続のための環境変数を加えます。
4. データ保存を行うためにボリューム命令のコメントをはずします。
@z

@x
The following is the updated `compose.yaml` file. All comments have been removed.
@y
以下が修正後の `compose.yaml` ファイルです。
コメントはすべて削除しています。
@z

% snip code...

@x
> [!NOTE]
>
> To learn more about the instructions in the Compose file, see [Compose file
> reference](/reference/compose-file/).
@y
> [!NOTE]
>
> Compose ファイル内の命令についての詳細は [Compose ファイルリファレンス](__SUBDIR__/reference/compose-file/) を参照してください。
@z

@x
Before you run the application using Compose, notice that this Compose file uses
`secrets` and specifies a `password.txt` file to hold the database's password.
You must create this file as it's not included in the source repository.
@y
Compose を使ったこのアプリケーションを実行する前に確認しておきますが、この Compose ファイルは `secrets` を用いており、データベースパスワードを保持した `password.txt` ファイルを指定しています。
このファイルはソースリポジトリには存在していないため、各自で生成してください。
@z

@x
In the `docker-php-sample` directory, create a new directory named `db` and
inside that directory create a file named `password.txt`. Open `password.txt` in an IDE or text editor and add the following password. The password must be on a single line, with no additional lines in the file.
@y
`docker-php-sample` ディレクトリに `db` という名前の新たなディレクトリを生成します。
そしてそのディレクトリ内に `password.txt` という名前のファイルを生成します。
IDE またはテキストエディターを使って `password.txt` を開き、以下のパスワードを入力します。
パスワードは 1 行内に収める必要があり、余計な行を加えてはなりません。
@z

% snip code...

@x
Save and close the `password.txt` file.
@y
`password.txt` ファイルを保存して閉じます。
@z

@x
You should now have the following in your `docker-php-sample` directory.
@y
ここまでに `docker-php-sample` ディレクトリは以下のようになります。
@z

% snip text...

@x
Run the following command to start your application.
@y
以下のコマンドを実行してアプリケーションを起動します。
@z

% snip command...

@x
Open a browser and view the application at [http://localhost:9000/database.php](http://localhost:9000/database.php). You should see a simple web application with text and a counter that increments every time you refresh.
@y
ブラウザーを開いて [http://localhost:9000/database.php](http://localhost:9000/database.php) にアクセスし、アプリケーションを確認します。
シンプルなウェブアプリケーションにテキストが表示され、また表示更新のたびに加算されるカウンターが表示されたはずです。
@z

@x
Press `ctrl+c` in the terminal to stop your application.
@y
端末画面から `ctrl+c` を押下してアプリケーションを停止します。
@z

@x
## Verify that data persists in the database
@y
## データベース内のデータ確認 {#verify-that-data-persists-in-the-database}
@z

@x
In the terminal, run `docker compose rm` to remove your containers and then run `docker compose up` to run your application again.
@y
端末画面から `docker compose rm` コマンドを実行してコンテナーを削除します。
もう一度 `docker compose up` を実行すればアプリケーションを再起動することができます。
@z

% snip command...

@x
Refresh [http://localhost:9000/database.php](http://localhost:9000/database.php) in your browser and verify that the previous count still exists. Without a volume, the database data wouldn't persist after you remove the container.
@y
[http://localhost:9000/database.php](http://localhost:9000/database.php) にアクセスしているブラウザーを更新してみると、以前のカウンターがそのまま表示されることが分かります。
ボリュームが存在してなかったら、コンテナーを削除した後はデータベースデータが残っていないはずでした。
@z

@x
Press `ctrl+c` in the terminal to stop your application.
@y
端末画面から `ctrl`+`c` を押下してアプリケーションを停止します。
@z

@x
## Add phpMyAdmin to interact with the database
@y
## データベース制御のための phpMyAdmin 追加 {#add-phpmyadmin-to-interact-with-the-database}
@z

@x
You can easily add services to your application stack by updating the `compose.yaml` file.
@y
`compose.yaml` を書き換えるだけで、サービスをアプリケーションスタックに加えることが簡単にできます。
@z

@x
Update your `compose.yaml` to add a new service for phpMyAdmin. For more details, see the [phpMyAdmin Official Docker Image](https://hub.docker.com/_/phpmyadmin). The following is the updated `compose.yaml` file.
@y
`compose.yaml` を修正して phpMyAdmin 用のサービスを新たに追加します。
詳しくは [phpMyAdmin 公式 Docker イメージ](https://hub.docker.com/_/phpmyadmin) を参照してください。
修正した `compose.yaml` ファイルは以下のとおりです。
@z

% snip code...

@x
In the terminal, run `docker compose up` to run your application again.
@y
端末画面から `docker compose up` を実行してアプリケーションを起動します。
@z

% snip command...

@x
Open [http://localhost:8080](http://localhost:8080) in your browser to access phpMyAdmin. Log in using `root` as the username and `example` as the password. You can now interact with the database through phpMyAdmin.
@y
ブラウザーから [http://localhost:8080](http://localhost:8080) を開いて phpMyAdmin にアクセスします。
ユーザー名に `root`、パスワードに `example` を入力してログインします。
phpMyAdmin を通じてデータベースの制御ができるようになりました。
@z

@x
Press `ctrl+c` in the terminal to stop your application.
@y
端末画面から `ctrl`+`c` を押下してアプリケーションを停止します。
@z

@x
## Automatically update services
@y
## サービスの自動更新 {#automatically-update-services}
@z

@x
Use Compose Watch to automatically update your running Compose services as you edit and save your code. For more details about Compose Watch, see [Use Compose Watch](/manuals/compose/how-tos/file-watch.md).
@y
Compose Watch を利用すると、自分が作成して実行している Compose サービスを自動的に更新できるようになります。
Compose Watch に関する詳細は [Use Compose Watch](manuals/compose/how-tos/file-watch.md) を参照してください。
@z

@x
Open your `compose.yaml` file in an IDE or text editor and then add the Compose Watch instructions. The following is the updated `compose.yaml` file.
@y
IDE またはテキストエディターを使って `compose.yaml` ファイルを開きます。
そして Compose Watch 命令を追加します。
以下は修正した `compose.yaml` ファイルです。
@z

% snip code...

@x
Run the following command to run your application with Compose Watch.
@y
以下のコマンドを実行して Compose Watch を利用したアプリケーションを起動します。
@z

% snip command...

@x
Open a browser and verify that the application is running at [http://localhost:9000/hello.php](http://localhost:9000/hello.php).
@y
ブラウザーを開いて [http://localhost:9000/hello.php](http://localhost:9000/hello.php) にアクセスし、アプリケーションが動作していることを確認します。
@z

@x
Any changes to the application's source files on your local machine will now be
immediately reflected in the running container.
@y
ローカルマシン上にあるアプリケーションのソースコードを変更したら、その内容は実行中のコンテナーに即座に反映されます。
@z

@x
Open `hello.php` in an IDE or text editor and update the string `Hello, world!` to `Hello, Docker!`.
@y
IDE またはテキストエディターを使って `hello.php` を開きます。
`Hello, world!` の文字列を `Hello, Docker!` に変更します。
@z

@x
Save the changes to `hello.php` and then wait a few seconds for the application to sync. Refresh [http://localhost:9000/hello.php](http://localhost:9000/hello.php) in your browser and verify that the updated text appears.
@y
`hello.php` への変更を保存します。
しばらく待つとアプリケーションへの同期が行われます。
[http://localhost:9000/hello.php](http://localhost:9000/hello.php) にアクセスしているブラウザーを更新してみると、修正した文字列が確認できます。
@z

@x
Press `ctrl+c` in the terminal to stop Compose Watch. Run `docker compose down` in the terminal to stop the application.
@y
端末画面から `ctrl+c` を押下して Compose Watch を停止します。
そして `docker compose down` を実行してアプリケーションを停止します。
@z

@x
## Create a development container
@y
## 開発用コンテナーの生成 {#create-a-development-container}
@z

@x
At this point, when you run your containerized application, Composer isn't installing the dev dependencies. While this small image is good for production, it lacks the tools and dependencies you may need when developing and it doesn't include the `tests` directory. You can use multi-stage builds to build stages for both development and production in the same Dockerfile. For more details, see [Multi-stage builds](/manuals/build/building/multi-stage.md).
@y
ここまでは、コンテナー化したアプリケーションの実行時に Compose は開発依存パッケージはインストールしていません。
このイメージは本番環境向けとしては非常に小さくできています。
しかし開発作業を行う際に必要となるツールや依存パッケージは含まれておらず、`tests` ディレクトリもありません。
そこで同じ Dockerfile 内に開発用と本番用という双方向けのステージをビルドするマルチステージビルドを用いることにします。
詳しくは [マルチステージビルド](manuals/build/building/multi-stage.md) を参照してください。
@z

@x
In the `Dockerfile`, you'll need to update the following:
@y
`Dockerfile` を以下のように修正します。
@z

@x
1. Split the `deps` staged into two stages. One stage for production
   (`prod-deps`) and one stage (`dev-deps`) to install development dependencies.
2. Create a common `base` stage.
3. Create a new `development` stage for development.
4. Update the `final` stage to copy dependencies from the new `prod-deps` stage.
@y
1. `deps` ステージを 2 つのステージに分けます。
   1 つは本番環境用 (`prod-deps`) であり、もう一つは開発依存パッケージ類をインストールするステージ (`dev-deps`) です。
2. 共通の `base` ステージを作ります。
3. 開発用として新たに `development` ステージを作ります。
4. `final` ステージを修正して、`prod-deps` ステージから依存パッケージをコピーします。
@z

@x
The following is the `Dockerfile` before and after the changes.
@y
以下に `Dockerfile` の編集前と編集後を示します。
@z

@x
{{< tabs >}}
{{< tab name="Before" >}}
@y
{{< tabs >}}
{{< tab name="編集前" >}}
@z

% snip code...

@x
{{< /tab >}}
{{< tab name="After" >}}
@y
{{< /tab >}}
{{< tab name="編集後" >}}
@z

% snip code...

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
Update your `compose.yaml` file by adding an instruction to target the
development stage.
@y
`compose.yaml` ファイルに開発ステージをターゲットとする命令を加えます。
@z

@x
The following is the updated section of the `compose.yaml` file.
@y
以下は `compose.yaml` ファイルの更新した一部分です。
@z

% snip code...

@x
Your containerized application will now install the dev dependencies.
@y
コンテナー化アプリケーションは、このようにして開発依存パッケージをインストールするようになります。
@z

@x
Run the following command to start your application.
@y
以下のコマンドを実行してアプリケーションを起動します。
@z

% snip command...

@x
Open a browser and view the application at [http://localhost:9000/hello.php](http://localhost:9000/hello.php). You should still see the simple "Hello, Docker!" application.
@y
ブラウザーを開いて [http://localhost:9000/hello.php](http://localhost:9000/hello.php) にアクセスし、アプリケーションを確認します。
"Hello, Docker!" アプリケーションが今回も表示されます。
@z

@x
Press `ctrl+c` in the terminal to stop your application.
@y
端末画面から `ctrl`+`c` を押下してアプリケーションを停止します。
@z

@x
While the application appears the same, you can now make use of the dev dependencies. Continue to the next section to learn how you can run tests using Docker.
@y
アプリケーションの様子は同じであっても、開発依存パッケージを利用する形を作り出しました。
続けて次の節では Docker を使ったテスト実行方法について学びます。
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this section, you took a look at setting up your Compose file to add a local
database and persist data. You also learned how to use Compose Watch to automatically sync your application when you update your code. And finally, you learned how to create a development container that contains the dependencies needed for development.
@y
この節では Compose ファイルに対してローカルデータベースとそのデータ保存についての設定を見てきました。
またソースコードの更新とともにアプリケーションの自動同期を行う Compose Watch の利用方法についても学びました。
そして開発環境向けに必要となる依存パッケージを含んだ開発コンテナーを生成する方法について学びました。
@z

@x
Related information:
@y
関連情報
@z

@x
- [Compose file reference](/reference/compose-file/)
- [Compose file watch](/manuals/compose/how-tos/file-watch.md)
- [Dockerfile reference](/reference/dockerfile.md)
- [Official Docker Image for PHP](https://hub.docker.com/_/php)
@y
- [Compose ファイルリファレンス](__SUBDIR__/reference/compose-file/)
- [Compose file watch](manuals/compose/how-tos/file-watch.md)
- [Dockerfile リファレンス](reference/dockerfile.md)
- [PHP 公式 Docker イメージ](https://hub.docker.com/_/php)
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
In the next section, you'll learn how to run unit tests using Docker.
@y
次の節では Docker を使ったユニットテストの実行方法について学びます。
@z
