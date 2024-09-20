%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: Use containers for Python development
linkTitle: Develop your app
@y
title: コンテナーを利用した Python 開発
linkTitle: Develop your app
@z

@x
keywords: python, local, development
description: Learn how to develop your Python application locally.
@y
keywords: python, local, development
description: Learn how to develop your Python application locally.
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
Complete [Containerize a Python application](containerize.md).
@y
[Python アプリケーションのコンテナー化](containerize.md)を完了していること。
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
- Configuring Compose to automatically update your running Compose services as you edit and save your code
@z

@x
## Get the sample application
@y
## サンプルアプリケーションの入手 {#get-the-sample-application}
@z

@x
You'll need to clone a new repository to get a sample application that includes logic to connect to the database.
@y
You'll need to clone a new repository to get a sample application that includes logic to connect to the database.
@z

@x
1. Change to a directory where you want to clone the repository and run the following command.
@y
1. Change to a directory where you want to clone the repository and run the following command.
@z

% snip command...

@x
2. In the cloned repository's directory, manually create the Docker assets or run `docker init` to create the necessary Docker assets.
@y
2. In the cloned repository's directory, manually create the Docker assets or run `docker init` to create the necessary Docker assets.
@z

% snip command...

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
In the cloned repository's directory, open the `compose.yaml` file in an IDE or text editor. `docker init` handled creating most of the instructions, but you'll need to update it for your unique application.
@y
In the cloned repository's directory, open the `compose.yaml` file in an IDE or text editor. `docker init` handled creating most of the instructions, but you'll need to update it for your unique application.
@z

@x
In the `compose.yaml` file, you need to uncomment all of the database instructions. In addition, you need to add the database password file as an environment variable to the server service and specify the secret file to use .
@y
In the `compose.yaml` file, you need to uncomment all of the database instructions. In addition, you need to add the database password file as an environment variable to the server service and specify the secret file to use .
@z

@x
The following is the updated `compose.yaml` file.
@y
書き換えた `compose.yaml` ファイルは以下のようになります。
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
> To learn more about the instructions in the Compose file, see [Compose file
> reference](__SUBDIR__/reference/compose-file/).
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

% snip text...

@x
Save and close the `password.txt` file.
@y
Save and close the `password.txt` file.
@z

@x
You should now have the following contents in your `python-docker-dev-example`
directory.
@y
You should now have the following contents in your `python-docker-dev-example`
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
Now test your API endpoint. Open a new terminal then make a request to the server using the curl commands:
@y
Now test your API endpoint. Open a new terminal then make a request to the server using the curl commands:
@z

% snip command...

@x
You should receive the following response:
@y
You should receive the following response:
@z

% snip code...

@x
Let's make a get request with the next curl command:
@y
Let's make a get request with the next curl command:
@z

% snip code...

@x
You should receive the same response as above because it's the only one object we have in database.
@y
You should receive the same response as above because it's the only one object we have in database.
@z

% snip code...

@x
Press `ctrl+c` in the terminal to stop your application.
@y
Press `ctrl+c` in the terminal to stop your application.
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
Open your `compose.yaml` file in an IDE or text editor and then add the Compose
Watch instructions. The following is the updated `compose.yaml` file.
@y
Open your `compose.yaml` file in an IDE or text editor and then add the Compose
Watch instructions. The following is the updated `compose.yaml` file.
@z

% snip code...

@x
Run the following command to run your application with Compose Watch.
@y
Run the following command to run your application with Compose Watch.
@z

% snip command...

@x
In a terminal, curl the application to get a response.
@y
In a terminal, curl the application to get a response.
@z

% snip command...

@x
Any changes to the application's source files on your local machine will now be immediately reflected in the running container.
@y
Any changes to the application's source files on your local machine will now be immediately reflected in the running container.
@z

@x
Open `python-docker-dev-example/app.py` in an IDE or text editor and update the `Hello, Docker!` string by adding a few more exclamation marks.
@y
Open `python-docker-dev-example/app.py` in an IDE or text editor and update the `Hello, Docker!` string by adding a few more exclamation marks.
@z

% snip code...

@x
Save the changes to `app.py` and then wait a few seconds for the application to rebuild. Curl the application again and verify that the updated text appears.
@y
Save the changes to `app.py` and then wait a few seconds for the application to rebuild. Curl the application again and verify that the updated text appears.
@z

% snip command...

@x
Press `ctrl+c` in the terminal to stop your application.
@y
Press `ctrl+c` in the terminal to stop your application.
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
