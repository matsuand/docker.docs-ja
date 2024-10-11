%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

@x
title: Use containers for .NET development
linkTitle: Develop your app
@y
title: コンテナーを利用した .NET 開発
linkTitle: アプリの開発
@z

@x
keywords: .net, development
description: Learn how to develop your .NET application locally using containers.
@y
keywords: .net, development
description: ローカル環境においてコンテナーを使って .NET アプリケーションを開発する方法を学びます。
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
Complete [Containerize a .NET application](containerize.md).
@y
[.NET アプリケーションのコンテナー化](containerize.md) を完了していること。
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
- Configuring Compose to automatically update your running Compose services as you edit and save your code
- Creating a development container that contains the .NET Core SDK tools and dependencies
@y
- ローカルデータベースを追加してデータを保存します。
- Compose の設定を通じて、コード編集および保存とともに、実行中の Compose サービスが自動的に更新されるようにします。
- .NET コア SDK ツールとその依存パッケージを含んだ開発用コンテナーを生成します。
@z

@x
## Update the application
@y
## アプリケーションの更新 {#update-the-application}
@z

@x
This section uses a different branch of the `docker-dotnet-sample` repository
that contains an updated .NET application. The updated application is on the
`add-db` branch of the repository you cloned in [Containerize a .NET
application](containerize.md).
@y
この節では `docker-dotnet-sample` リポジトリ内の別ブランチを利用します。
そこには修正された .NET アプリケーションが含まれています。
その修正アプリケーションとは、[.NET アプリケーションのコンテナー化](containerize.md) にてクローンしたリポジトリ内の `add-db` ブランチにあります。
@z

@x
To get the updated code, you need to checkout the `add-db` branch. For the changes you made in [Containerize a .NET application](containerize.md), for this section, you can stash them. In a terminal, run the following commands in the `docker-dotnet-sample` directory.
@y
修正されたコードを入手するために、`add-db` ブランチをチェックアウトします。
[.NET アプリケーションのコンテナー化](containerize.md) において加えた修正は、ここでスタッシュしておきます。
端末上から `docker-dotnet-sample` ディレクトリに移動して以下のコマンドを実行します。
@z

@x
1. Stash any previous changes.
@y
1. それまでの変更をスタッシュします。
@z

% snip command...

@x
2. Check out the new branch with the updated application.
@y
2. 修正アプリケーションが含まれている新たなブランチをチェックアウトします。
@z

% snip command...

@x
In the `add-db` branch, only the .NET application has been updated. None of the Docker assets have been updated yet.
@y
`add-db` ブランチにおいて修正されているのは .NET アプリケーションのみです。
Docker アセットについてはまだ修正されていません。
@z

@x
You should now have the following in your `docker-dotnet-sample` directory.
@y
`docker-dotnet-sample` ディレクトリにて以下を実行します。
@z

% snip text...

@x
## Add a local database and persist data
@y
## ローカルデータベースの追加とデータ保存 {#add-a-local-database-and-persist-data}
@z

@x
You can use containers to set up local services, like a database. In this section, you'll update the `compose.yaml` file to define a database service and a volume to persist data.
@y
コンテナーでは、ローカルサービスとしてたとえばデータベースを構築することができます。
本節では `compose.yaml` ファイルを編集して、データベースサービスを追加してデータ保存のためのボリュームを定義します
@z

@x
Open the `compose.yaml` file in an IDE or text editor. You'll notice it
already contains commented-out instructions for a PostgreSQL database and volume.
@y
IDE またはテキストエディターを使って `compose.yaml` ファイルを開きます。
中身を見てみれば PostgreSQL データベースとボリュームに関する命令文が、すでにコメントアウトされて書かれているのがわかります。
@z

@x
Open `docker-dotnet-sample/src/appsettings.json` in an IDE or text editor. You'll
notice the connection string with all the database information. The
`compose.yaml` already contains this information, but it's commented out.
Uncomment the database instructions in the `compose.yaml` file.
@y
IDE またはテキストエディターを使って `docker-dotnet-sample/src/appsettings.json` ファイルを開きます。
そこにはデータベース情報に関する接続文字列が示されています。
`compose.yaml` ファイルにはその情報がすでにあるのですが、それはコメントアウトされています。
そこで `compose.yaml` ファイル内のそのデータベース命令文のコメントをはずします。
@z

@x
The following is the updated `compose.yaml` file.
@y
修正した `compose.yaml` ファイルは以下です。
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
> Compose ファイル内の各命令文の詳細は [Compose ファイルリファレンス](reference/compose-file/) を参照してください。
@z

@x
Before you run the application using Compose, notice that this Compose file uses
`secrets` and specifies a `password.txt` file to hold the database's password.
You must create this file as it's not included in the source repository.
@y
Compose を使ってアプリケーションを実行するにあたって、まずこの Compose ファイルが `secrets` を利用しており、データベースパスワードを `password.txt` というファイルに指定している点を確認してください。
そのファイルはソースリポジトリには含まれていないため、ここで生成する必要があります。
@z

@x
In the `docker-dotnet-sample` directory, create a new directory named `db` and
inside that directory create a file named `password.txt`. Open `password.txt` in an IDE or text editor and add the following password. The password must be on a single line, with no additional lines in the file.
@y
`docker-dotnet-sample` ディレクトリにおいて新たに `db` というディレクトリを生成し、さらにその中に `password.txt` という名前のファイルを IDE またはテキストエディターを使って生成します。
そして以下のようなパスワードを記述します。
パスワードは 1 行内に記述する必要があり、これ以外の行を含めてはなりません。
@z

% snip code...

@x
Save and close the `password.txt` file.
@y
`password.txt` ファイルを保存して閉じます。
@z

@x
You should now have the following in your `docker-dotnet-sample` directory.
@y
`docker-dotnet-sample` ディレクトリ内は以下のようになったはずです。
@z

% snip text...

@x
Run the following command to start your application.
@y
以下のコマンドを実行してアプリケーションを起動します。
@z

% snip command...

@x
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see a simple web application with the text `Student name is`.
@y
ブラウザーを開いて [http://localhost:8080](http://localhost:8080) にアクセスしてアプリケーションを確認します。
単純なウェブアプリケーションが起動し、`Student name is` という文字列が表示されたはずです。
@z

@x
The application doesn't display a name because the database is empty. For this application, you need to access the database and then add records.
@y
アプリケーションは名前を表示していません。
単純にデータベースの中身が空だからです。
このアプリケーションでは、データベースにアクセスしてレコードを追加しておくことが必要であったわけです。
@z

@x
## Add records to the database
@y
## データベースへのレコード追加 {#add-records-to-the-database}
@z

@x
For the sample application, you must access the database directly to create sample records.
@y
このサンプルアプリケーションにおいては、データベースに直接アクセスしてサンプルレコードを生成することが必要です。
@z

@x
You can run commands inside the database container using the `docker exec`
command. Before running that command, you must get the ID of the database
container. Open a new terminal window and run the following command to list all
your running containers.
@y
データベースコンテナー内にてコマンド実行するには `docker exec` コマンドを利用します。
このコマンドを実行する前に、まずデータベースコンテナーの ID を取得します。
新たな端末画面を開いて、以下のコマンドを実行し起動中のコンテナー一覧を確認します。
@z

% snip command...

@x
You should see output like the following.
@y
以下のような出力が得られます。
@z

% snip output...

@x
In the previous example, the container ID is `39fdcf0aff7b`. Run the following command to connect to the postgres database in the container. Replace the container ID with your own container ID.
@y
上の例でコンテナー ID は `39fdcf0aff7b` となっています。
以下のコマンドを実行して、コンテナー内の postgres データベースに接続します。
コンテナー ID 部分は、各自のコンテナー ID に置き換えてください。
@z

% snip command...

@x
And finally, insert a record into the database.
@y
そしてデータベースに対してレコードをインサートします。
@z

% snip command...

@x
You should see output like the following.
@y
以下のような出力が得られます。
@z

% snip output...

@x
Close the database connection and exit the container shell by running `exit`.
@y
データベースへの接続を閉じ、`exit` を実行してコンテナーシェルから抜け出ます。
@z

% snip command...

@x
## Verify that data persists in the database
@y
## データベース内のデータ確認 {#verify-that-data-persists-in-the-database}
@z

@x
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see a simple web application with the text `Student name is Whale Moby`.
@y
ブラウザーを開いて [http://localhost:8080](http://localhost:8080) にアクセスしてアプリケーションを確認します。
単純なウェブアプリケーションが起動し、`Student name is Whale Moby` という文字列が表示されたはずです。
@z

@x
Press `ctrl+c` in the terminal to stop your application.
@y
端末画面から `ctrl`+`c` を押下してアプリケーションを停止します。
@z

@x
In the terminal, run `docker compose rm` to remove your containers and then run `docker compose up` to run your application again.
@y
端末から `docker compose rm` を実行してコンテナーを削除します。
そして再度 `docker compose up` を入力して、もう一度アプリケーションを実行します。
@z

% snip command...

@x
Refresh [http://localhost:8080](http://localhost:8080) in your browser and verify that the student name persisted, even after the containers were removed and ran again.
@y
ブラウザーにて [http://localhost:8080](http://localhost:8080) の表示を更新します。
そして student name (生徒の名前) が残っているのを確認してください。
つまりコンテナーをいったん削除してから起動し直した後でも、データは残っていたことになります。
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
以下のコマンドを実行して Compose Watch を使ったアプリケーション起動を行います。
@z

% snip command...

@x
Open a browser and verify that the application is running at [http://localhost:8080](http://localhost:8080).
@y
ブラウザーを開き、[http://localhost:8080](http://localhost:8080) へのアクセスによってアプリケーションが動作していることを確認します。
@z

@x
Any changes to the application's source files on your local machine will now be
immediately reflected in the running container.
@y
ローカルマシン内のアプリケーションソースファイルに加えた変更は、起動中のコンテナーに即座に反映されています。
@z

@x
Open `docker-dotnet-sample/src/Pages/Index.cshtml` in an IDE or text editor and update the student name text on line 13 from `Student name is` to `Student name:`.
@y
IDE またはテキストエディターを使って `docker-dotnet-sample/src/Pages/Index.cshtml` を開きます。
おっして 13 行目にある student name (学生名) の文字列部分を `Student name is` から `Student name:` に変えます。
@z

% snip diff...

@x
Save the changes to `Index.cshmtl` and then wait a few seconds for the application to rebuild. Refresh [http://localhost:8080](http://localhost:8080) in your browser and verify that the updated text appears.
@y
`Index.cshmtl` への変更を保存します。
アプリケーションが再ビルドされるまでしばらく待ちます。
ブラウザー上の [http://localhost:8080](http://localhost:8080) を再表示して、文字列が更新されたことを確認します。
@z

@x
Press `ctrl+c` in the terminal to stop your application.
@y
端末画面から `ctrl`+`c` を押下してアプリケーションを停止します。
@z

@x
## Create a development container
@y
## 開発用コンテナーの生成 {#create-a-development-container}
@z

@x
At this point, when you run your containerized application, it's using the .NET runtime image. While this small image is good for production, it lacks the SDK tools and dependencies you may need when developing. Also, during development, you may not need to run `dotnet publish`. You can use multi-stage builds to build stages for both development and production in the same Dockerfile. For more details, see [Multi-stage builds](/manuals/build/building/multi-stage.md).
@y
ところでコンテナー化されたアプリケーションを起動したときには .NET ランタイムイメージが利用されています。
イメージが小さければ本番環境として適当かもしれませんが、開発時には SDK ツールやその依存パッケージが必要となるのに、それが含まれていません。
また開発中には、おそらく `dotnet publish` を実行する必要もまたありません。
そこで開発環境用、本番環境用のいずれに対しても同一の Dockerfile を使って、マルチステージビルドによってステージをビルドするということを行います。
詳しくは [マルチステージビルド](manuals/build/building/multi-stage.md) を参照してください。
@z

@x
Add a new development stage to your Dockerfile and update your `compose.yaml` file to use this stage for local development.
@y
Dockerfile に新たに開発用ステージを追加します。
そしてローカル開発環境用として、このステージを利用できるように `compose.yaml` ファイルを修正します。
@z

@x
The following is the updated Dockerfile.
@y
以下は修正した Dockerfile ファイルです。
@z

% snip code...

@x
The following is the updated `compose.yaml` file.
@y
以下は修正した `compose.yaml` ファイルです。
@z

% snip code...

@x
Your containerized application will now use the `mcr.microsoft.com/dotnet/sdk:6.0-alpine` image, which includes development tools like `dotnet test`. Continue to the next section to learn how you can run `dotnet test`.
@y
コンテナー化したアプリケーションは、今は `mcr.microsoft.com/dotnet/sdk:6.0-alpine` イメージを用いるようになりました。
ここには `dotnet test` のような開発ツールが含まれています。
続けて次の節では `dotnet test` の実行方法について学びます。
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this section, you took a look at setting up your Compose file to add a local
database and persist data. You also learned how to use Compose Watch to automatically rebuild and run your container when you update your code. And finally, you learned how to create a development container that contains the SDK tools and dependencies needed for development.
@y
この節では Compose ファイルに対してローカルデータベースを追加し、データ保存を行うための設定を見てきました。
またソースコードの更新時には Compose Watch を利用した、コンテナーの自動再ビルドと実行方法について学びました。
そして開発作業において必要となる SDK ツールとその依存パッケージを含んだ開発用コンテナーを生成する方法について学びました。
@z

@x
Related information:
@y
関連情報
@z

@x
- [Compose file reference](/reference/compose-file/)
- [Compose file watch](/manuals/compose/how-tos/file-watch.md)
- [Multi-stage builds](/manuals/build/building/multi-stage.md)
@y
- [Compose ファイルリファレンス](__SUBDIR__/reference/compose-file/)
- [Compose file watch](manuals/compose/how-tos/file-watch.md)
- [マルチステージビルド](manuals/build/building/multi-stage.md)
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
