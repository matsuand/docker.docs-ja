%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応。

@x
title: Use containers for R development
linkTitle: Develop your app
@y
title: コンテナーを利用した R 言語開発
linkTitle: Develop your app
@z

@x
keywords: R, local, development
description: Learn how to develop your R application locally.
@y
keywords: R, local, development
description: Learn how to develop your R application locally.
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
Complete [Containerize a R application](containerize.md).
@y
[R 言語アプリケーションのコンテナー化](containerize.md) を完了していること。
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
@y
- ローカルデータベースを追加して、そのデータを維持します。
- Compose の設定を通じて、コード編集および保存とともに、実行中の Compose サービスが自動的に更新されるようにします。
@z

@x
## Get the sample application
@y
## サンプルアプリケーションの入手 {#get-the-sample-application}
@z

@x
You'll need to clone a new repository to get a sample application that includes logic to connect to the database.
@y
サンプルアプリケーションを入手するため、新たなリポジトリをクローンすることが必要です。
この中に、データベースに接続するためのロジックが含まれています。
@z

@x
Change to a directory where you want to clone the repository and run the following command.
@y
リポジトリのクローンを行うディレクトリに移動して、以下のコマンドを実行します。
@z

% snip command...

@x
## Configure the application to use the database
@y
## データベース利用のためのアプリケーション設定 {#configure-the-application-to-use-the-database}
@z

@x
To try the connection between the Shiny application and the local database you have to modify the `Dockerfile` changing the `COPY` instruction:
@y
Shiny アプリケーションとローカルデータベースの間の接続を実現するため、`Dockerfile` 内の `COPY` 命令を修正する必要があります。
@z

% snip code...

@x
## Add a local database and persist data
@y
## ローカルデータベースの追加とデータ維持 {#add-a-local-database-and-persist-data}
@z

@x
You can use containers to set up local services, like a database. In this section, you'll update the `compose.yaml` file to define a database service and a volume to persist data.
@y
コンテナーにおいては、データベースなどのローカルサービスを設定します。
本節では `compose.yaml` ファイルを修正してデータベースサービスを定義し、データを維持するためのボリュームも定義します。
@z

@x
In the cloned repository's directory, open the `compose.yaml` file in an IDE or text editor. 
@y
クローンを行ったリポジトリのディレクトリにある `compose.yaml` ファイルを IDE またはテキストエディターで開きます。
@z

@x
In the `compose.yaml` file, you need to un-comment the properties for configuring the database. You must also mount the database password file and set an environment variable on the `shiny-app` service pointing to the location of the file in the container.
@y
`compose.yaml` ファイルでは、データベース設定を行うためのプロパティ記述がコメント化されているので、コメントを解除します。
You must also mount the database password file and set an environment variable on the `shiny-app` service pointing to the location of the file in the container.
@z

@x
The following is the updated `compose.yaml` file.
@y
The following is the updated `compose.yaml` file.
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
> Compose ファイル内の命令に関する詳細は [Compose ファイルリファレンス](__SUBDIR__/reference/compose-file/) を参照してください。
@z

@x
Before you run the application using Compose, notice that this Compose file specifies a `password.txt` file to hold the database's password. You must create this file as it's not included in the source repository.
@y
Before you run the application using Compose, notice that this Compose file specifies a `password.txt` file to hold the database's password. You must create this file as it's not included in the source repository.
@z

@x
In the cloned repository's directory, create a new directory named `db` and inside that directory create a file named `password.txt` that contains the password for the database. Using your favorite IDE or text editor, add the following contents to the `password.txt` file.
@y
In the cloned repository's directory, create a new directory named `db` and inside that directory create a file named `password.txt` that contains the password for the database. Using your favorite IDE or text editor, add the following contents to the `password.txt` file.
@z

% snip code...

@x
Save and close the `password.txt` file.
@y
Save and close the `password.txt` file.
@z

@x
You should now have the following contents in your `r-docker-dev`
directory.
@y
You should now have the following contents in your `r-docker-dev`
directory.
@z

% snip text...

@x
Now, run the following `docker compose up` command to start your application.
@y
Now, run the following `docker compose up` command to start your application.
@z

% snip command...

@x
Now test your DB connection opening a browser at:
@y
Now test your DB connection opening a browser at:
@z

% snip code...

@x
You should see a pop-up message:
@y
以下のようなポップアップメッセージが表示されます。
@z

% snip code...

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
Use Compose Watch to automatically update your running Compose services as you
edit and save your code. For more details about Compose Watch, see [Use Compose
Watch](/manuals/compose/how-tos/file-watch.md).
@y
Use Compose Watch to automatically update your running Compose services as you
edit and save your code. For more details about Compose Watch, see [Use Compose
Watch](manuals/compose/how-tos/file-watch.md).
@z

@x
Lines 15 to 18 in the `compose.yaml` file contain properties that trigger Docker
to rebuild the image when a file in the current working directory is changed:
@y
`compose.yaml` ファイルの 15 行めから 18 行めに記述されているプロパティは、カレントワーキングディレクトリ内にあるファイルに変更があった場合に、Docker に対してイメージの再ビルドを指示するものです。
@z

% snip code...

@x
Run the following command to run your application with Compose Watch.
@y
Run the following command to run your application with Compose Watch.
@z

% snip command...

@x
Now, if you modify your `app.R` you will see the changes in real time without re-building the image!
@y
Now, if you modify your `app.R` you will see the changes in real time without re-building the image!
@z

@x
Press `ctrl+c` in the terminal to stop your application.
@y
端末画面から `ctrl`+`c` を押下してアプリケーションを停止します。
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this section, you took a look at setting up your Compose file to add a local
database and persist data. You also learned how to use Compose Watch to automatically rebuild and run your container when you update your code.
@y
In this section, you took a look at setting up your Compose file to add a local
database and persist data. You also learned how to use Compose Watch to automatically rebuild and run your container when you update your code.
@z

@x
Related information:
 - [Compose file reference](/reference/compose-file/)
 - [Compose file watch](/manuals/compose/how-tos/file-watch.md)
 - [Multi-stage builds](/manuals/build/building/multi-stage.md)
@y
関連情報
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
In the next section, you'll take a look at how to set up a CI/CD pipeline using GitHub Actions.
@y
In the next section, you'll take a look at how to set up a CI/CD pipeline using GitHub Actions.
@z

@x
{{< button text="Configure CI/CD" url="configure-ci-cd.md" >}}
@y
{{< button text="CI/CD の設定" url="configure-ci-cd.md" >}}
@z
