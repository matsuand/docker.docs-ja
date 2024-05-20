%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 (workaround?)

@x
title: Run multi-container applications
keywords: get started, quick start, intro, concepts
description: Learn how to use Docker to run multi-container applications
@y
title: マルチコンテナーアプリの実行
keywords: get started, quick start, intro, concepts
description: Learn how to use Docker to run multi-container applications
@z

@x
If you've already completed the [How do I run a container?](./run-a-container.md) walkthrough, you learned that you must start each container individually. Imagine how great it would be if a tool could start multiple containers with a single command. That tool is Docker Compose.
@y
[どうやってコンテナーを実行するのか](__SUBDIR__/guides/walkthroughs/run-a-container/) についてのウォークスルーをすでに読み終えているなら、各コンテナーは個別に実行するべきものと学んだはずです。
では複数のコンテナーの実行を、たった一つのコマンドで実現できるツールがあるとしたら便利ではないですか。
Docker Compose とはそういうツールなのです。
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
$ git clone https://github.com/docker/multi-container-app
```
@y
```console
$ git clone https://github.com/docker/multi-container-app
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
{{< button url="https://github.com/docker/multi-container-app/archive/refs/heads/main.zip" text="Download the source" >}}
@y
{{< button url="https://github.com/docker/multi-container-app/archive/refs/heads/main.zip" text="ソースのダウンロード" >}}
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
The sample application is a simple todo application built using ExpressJS and Node.js. The application saves all todos in a MongoDB database. You don't need to know any of these technologies to continue with the walkthrough.
@y
このサンプルアプリケーションは単純な todo アプリケーションであり ExpressJS と Node.js を使ってビルドされています。
アプリケーションは MongoDB データベースに、各 todo を保存します。
このウォークスルーを進めるにあたって、それらの技術を知っておく必要はありません。
@z

@x
![The sample app architecture](images/getting-started-multi-container.webp?w=450&border=true)
@y
![サンプルアプリのアーキテクチャー](images/getting-started-multi-container.webp?w=450&border=true)
@z

@x
## Step 2: Dig into the Compose file
@y
## 手順 2: Compose ファイルへ {#step-2-dig-into-the-compose-file}
@z

@x
View the files of the sample application. Notice that it has a `compose.yaml` file. This file tells Docker how to run your application. Open the `compose.yaml` file in a code or text editor to view what it contains.
@y
サンプルアプリケーションのファイルを確認してみてください。
そこに `compose.yaml` というファイルがあります。
このファイルこそが Docker に対してアプリケーションの実行方法を指示するものです。
コードエディターあるいはテキストエディターを使ってこの `compose.yaml` ファイルを開き、中身を確認してください。
@z

@x
## Step 3: Run the application
@y
## 手順 3: アプリケーションの実行 {#step-3-run-the-application}
@z

@x
To run the multi-container application, open a terminal and run the following commands. Replace `/path/to/multi-container-app/` with the path to your application's directory.
@y
マルチコンテナーアプリケーションを実行するには、端末画面を開いて以下のコマンドを実行します。
`/path/to/multi-container-app/` の部分は実際のアプリケーションディレクトリに置き換えてください。
@z

@x
{{< include "open-terminal.md" >}}
@y
{{< include "open-terminal.md" >}}
@z

@x
```console
$ cd /path/to/multi-container-app/
```
```console
$ docker compose up -d
```
@y
```console
$ cd /path/to/multi-container-app/
```
```console
$ docker compose up -d
```
@z

@x
In the previous command, the `-d` flag tells Docker Compose to run in detached mode.
@y
上のコマンドに指定した `-d` フラグは、Docker Compose に対してデタッチモードでの実行を指示するものです。
@z

@x
## Step 4: View the frontend and add todos
@y
## 手順 4: フロントエンドの確認と todo の追加 {#step-4-view-the-frontend-and-add-todos}
@z

@x
In the **Containers** tab of Docker Desktop, you should now have an application stack with two containers running (the todo-app, and todo-database).
@y
Docker Desktop の **Containers**（コンテナー）タブにおいては、アプリケーションスタックが表示されていて、そこには 2 つのコンテナー（todo-app と todo-database）が実行されています。
@z

@x
To view the frontend:
@y
フロントエンドを確認するには、以下を行います。
@z

@x
1. In Docker Desktop, expand the application stack in **Containers**.
2. Select the link to port **3000** in the **Port(s)** column or open [http://localhost:3000](http://localhost:3000)⁠.
@y
1. Docker Desktop において **Containers**（コンテナー）タブ内のアプリケーションスタックを展開します。
2. **Port(s)**（ポート）カラムにあるポート **3000** というリンクをクリックするか、あるいは  [http://localhost:3000](http://localhost:3000) にアクセスします。
@z

@x
Add some todo tasks in the frontend, and then open [http://localhost:3000](http://localhost:3000) in a new browser tab. Notice that the tasks are still visible.
@y
フロントエンド画面にて todo タスクを追加してください。
そしてブラウザーの新たなタブを使って [http://localhost:3000](http://localhost:3000) を開いてください。
追加したタスクがそのまま表示されるはずです。
@z

@x
## Step 5: Develop in your containers
@y
## 手順 5: コンテナーでの開発 {#step-5-develop-in-your-containers}
@z

@x
When developing with Docker, you may need to automatically update and preview your running services as you edit and save your code. You can use Docker Compose Watch for this.
@y
Docker をつかった開発を行う場合、コードの編集と保存を行ったら、自動的に実行中サービスが更新されプレビューされて欲しいところでしょう。
これを行うのが Docker Compose Watch です。
@z

@x
To run Compose Watch and see the real-time changes:
@y
Compose Watch を実行してリアルタイムに変更を確認します。
@z

@x
1. Open a terminal and run the following commands. Replace `/path/to/multi-container-app/` with the path to your application's directory.
@y
1. 端末画面を開いて以下のコマンドを実行します。
@z

% snip command...

@x
2. Open `app/views/todos.ejs` in a text or code editor, then change the text on line 21.
@y
2. コードエディターあるいはテキストエディターを使って `app/views/todos.ejs` を開きます。
   そして 21 行めのテキストを変更します。
@z

@x
3. Save the changes in `app/views/todos.ejs`.
@y
3. `app/views/todos.ejs` の変更を保存します。
@z

@x
4. View your application at [http://localhost:3000](http://localhost:3000) to see the changes in real-time.
@y
4. [http://localhost:3000](http://localhost:3000) においてアプリケーションを参照します。
   リアルタイムに変更を確認することができます。
@z

@x
## Step 6: Delete everything and start over
@y
## 手順 6: 全削除とやり直し {#step-6-delete-everything-and-start-over}
@z

@x
Having your configuration stored in a Compose file has another advantage, you can easily delete everything and start over.
@y
Compose ファイルに設定内容を保存することは、別の意味もあります。
それはすべてを削除した上で、簡単にやり直しができるということです。
@z

@x
To delete the application stack:
@y
アプリケーションスタックを削除するには以下を行います。
@z

@x
1. Open the **Containers** tab of Docker Desktop
2. Select the Delete icon next to your application stack.
@y
1. Docker Desktop において **Containers**（コンテナー）タブを開きます。
2. アプリケーションスタックの横にある Delete（削除）アイコンをクリックします。
@z

@x
![Deleting the application stack](images/getting-started-delete-stack.webp?border=true)
@y
![アプリケーションスタックの削除](images/getting-started-delete-stack.webp?border=true)
@z

@x
After you delete the application stack, follow the steps from [Step 3: Run the
application](#step-3-run-the-application) to run the application again. Note
that when you delete the containers and run them again, any todos that you
created don't persist.
@y
アプリケーションスタックを削除した後に、[手順 3: アプリケーションの実行](#step-3-run-the-application) を進めれば、アプリケーションを再度実行することができます。
つまりコンテナーを削除した上で再実行するということは、生成した todo データは保存されないということです。
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this walkthrough, you ran a multi-container application with Docker Compose. You also learned how to develop in containers and how to delete the application stack along with all of the data.
@y
このウォークスルーでは、Docker Compose を使ってマルチコンテナーアプリケーションを実行しました。
またコンテナーでの開発方法と、アプリケーションスタックおよびそのデータの削除方法について学びました。
@z

@x
Related information:
@y
関連情報
@z

@x
- Deep dive into the [Docker Compose manual](../../compose/_index.md)
- Reference Compose commands in the [Docker Compose CLI reference](../../compose/reference/_index.md)
- Explore samples in the [Awesome Compose GitHub repository](https://github.com/docker/awesome-compose)
- Learn how to implement Compose Watch for your projects in [Use Compose Watch](../../compose/file-watch.md)
@y
- 詳しくは [Docker Compose マニュアル](__SUBDIR__/compose/) を参照してください。
- Compose コマンドについては [Docker Compose CLI リファレンス](__SUBDIR__/compose/reference/) を参照してください。
- 数々のサンプルを [Awesome Compose GitHub repository](https://github.com/docker/awesome-compose) の中から確認してください。
- 開発するプロジェクトにおいて Compose Watch を実装する方法については [Compose Watch の利用](__SUBDIR__/compose/file-watch/) を確認してください。
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
Continue to the next walkthrough to learn how to persist data even after deleting the application stack.
@y
次のウォークスルーに進んでください。
アプリケーションスタックを削除した後であっても、データを保存しておく方法について学びます。
@z

@x
{{< button url="./persist-data.md" text="Persist container data" >}}
@y
{{< button url="./persist-data.md" text="コンテナーデータの保存" >}}
@z
