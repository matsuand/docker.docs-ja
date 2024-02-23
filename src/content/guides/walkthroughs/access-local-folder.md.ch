%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Access a local folder from a container
keywords: get started, quick start, intro, concepts
description: Learn how to access a local folder from a container
@y
title: コンテナーからローカルフォルダーへのアクセス
keywords: get started, quick start, intro, concepts
description: コンテナーからローカルフォルダーへのアクセスする方法を学びます。
@z

@x
This walkthrough shows you how to access a local folder from a container. To better understand some concepts in this walkthrough, complete the [Run multi-container applications](./multi-container-apps.md) walkthrough first.
@y
このウォークスルーでは、コンテナーからローカルフォルダーにアクセスする方法について示します。
ウォークスルーにおいて説明する考え方をより深く理解するためには、[マルチコンテナーアプリの実行](./multi-container-apps.md) をまずはよくお読みください。
@z

@x
Docker isolates all content, code, and data in a container from your local filesystem. By default, containers can't access directories in your local filesystem.
@y
Docker はコンテナー内にあるコンテンツ、コード、データを、ローカルファイルシステムからは切り離して管理します。
デフォルトでコンテナーは、ローカルファイルシステムにアクセスすることはできません。
@z

@x
![Data isolation diagram](images/getting-started-isolation.webp?w=400)
@y
![データ分離の様子](images/getting-started-isolation.webp?w=400)
@z

@x
Sometimes, you may want to access a directory from your local filesystem. To do this, you can use bind mounts.
@y
時にはローカルファイルシステムから、どこかのディレクトリにアクセスしたい場合があるでしょう。
これを実現するにはバインドマウントを利用します。
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
$ git clone https://github.com/docker/bindmount-apps
```
@y
```console
$ git clone https://github.com/docker/bindmount-apps
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
{{< button url="https://github.com/docker/bindmount-apps/archive/refs/heads/main.zip" text="Download the source" >}}
@y
{{< button url="https://github.com/docker/bindmount-apps/archive/refs/heads/main.zip" text="Download the source" >}}
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Step 2: Add a bind mount using Compose
@y
## 手順 2: Compose を使ったバインドマウントの追加 {#step-2-add-a-bind-mount-using-compose}
@z

@x
Add a bind mount to access data on your system from a container. A bind mount lets you share a directory from your host's filesystem into the container.
@y
バインドマウントを追加して、コンテナー内からシステム上のデータにアクセスします。
バインドマウントとは、ホストのファイルシステム内のディレクトリを、コンテナーに共有させるものです。
@z

@x
![Bind mount diagram](images/getting-started-bindmount.webp?w=400)
@y
![バインドマウントの様子](images/getting-started-bindmount.webp?w=400)
@z

@x
To add a bind mount to this project, open the `compose.yaml` file in a code or text editor, and then uncomment the following lines.
@y
このプロジェクトにバインドマウントを追加するために、コードエディターまたはテキストエディターを使って `compose.yaml` ファイルを開き、以下のコメント行のコメント記号を取り除きます。
@z

@x
```yaml
todo-app:
    # ...
    volumes:
      - ./app:/usr/src/app
      - /usr/src/app/node_modules
@y
```yaml
todo-app:
    # ...
    volumes:
      - ./app:/usr/src/app
      - /usr/src/app/node_modules
@z

@x
```
@y
```
@z

@x
The `volumes` element tells Compose to mount the local folder `./app` to `/usr/src/app` in the container for the `todo-app` service. This particular bind mount overwrites the static contents of the `/usr/src/app` directory in the container and creates what is known as a development container. The second instruction, `/usr/src/app/node_modules`, prevents the bind mount from overwriting the container's `node_modules` directory to preserve the packages installed in the container.
@y
`volumes` の記述は `todo-app` サービスに対する Compose に対して、ローカルフォルダー `./app` をコンテナー内の `/usr/src/app` にマウントすることを指示しています。
こうして指定したバインドマウントは、コンテナー内の `/usr/src/app` ディレクトリにあるデータ内容を上書きし、開発用コンテナーとして構成します。
2 行めにある `/usr/src/app/node_modules` の記述は、上のバインドマウントを行っても、コンテナー内の `node_modules` ディレクトリは上書きせず、コンテナー内においてインストールされた内容を維持するようにするものです。
@z

@x
## Step 3: Run the application
@y
## 手順 3: アプリケーションの実行 {#step-3-run-the-application}
@z

@x
In a terminal, run the following commands to bring up your application. Replace `/path/to/bindmount-apps/` with the path to your application's directory.
@y
端末から以下のコマンドを実行して、アプリケーションを実行します。
`/path/to/bindmount-apps/` の部分は実際のアプリケーションディレクトリに置き換えてください。
@z

@x
{{< include "open-terminal.md" >}}
@y
{{< include "open-terminal.md" >}}
@z

@x
```console
$ cd /path/to/bindmount-apps/
```
```console
$ docker compose up -d
```
@y
```console
$ cd /path/to/bindmount-apps/
```
```console
$ docker compose up -d
```
@z

@x
## Step 4: Develop the application
@y
## 手順 4: アプリケーションの開発 {#step-4-develop-the-application}
@z

@x
Now, you can take advantage of the container’s environment while you develop the application on your local system. Any changes you make to the application on your local system are reflected in the container. In your local directory, open `app/views/todos.ejs` in an code or text editor, update the `Enter your task` string, and save the file. Visit or refresh [localhost:3001](http://localhost:3001)⁠ to view the changes.
@y
ここまでの作業により、コンテナー環境を使いこなせるようになりました。
アプリケーションの開発はローカルシステム上にて行うことができます。
ローカルシステム上においてアプリケーションへの変更を行ったら、それがコンテナーに反映されます。
コードエディターまたはテキストエディターを使って、ローカルディレクトリ上の `app/views/todos.ejs` を開きます。
そして `Enter your task` という文字列を書き加えてからファイルを保存します。
[localhost:3001](https://localhost:3001) へアクセスして、変更が反映されたことを確認してください。
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this walkthrough, you added a bind mount to access a local folder from a container. You can use this to develop faster without having to rebuild your container when updating your code.
@y
このウォークスルーでは、コンテナーからローカルフォルダーにアクセスするためのバインドマウントの追加を行いました。
これを使うことにより開発作業をより早くに行うことができます。
コードの編集を行ったからといって、コンテナーを再生成する必要はありません。
@z

@x
Related information:
@y
関連情報
@z

@x
- Deep dive into [bind mounts](../../storage/bind-mounts.md)
- Learn about using bind mounts in Compose in the [Compose file reference](../../compose/compose-file/_index.md)
- Explore using bind mounts via the CLI in the [Docker run reference](/reference/cli/docker/container/run/#mount)
@y
- より詳しくは [バインドマウント](../../storage/bind-mounts.md) を参照してください。
- Compose にてバインドマウントを利用する方法は [Compose ファイルリファレンス](../../compose/compose-file/_index.md) を確認してください。
- CLI からバインドマウントを利用する方法は [Docker run リファレンス](__SUBDIR__/reference/cli/docker/container/run/#mount) を確認してください。
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
Continue to the next walkthrough to learn how you can containerize your own application.
@y
次のウォークスルーに進んでください。
自分のアプリケーションをコンテナー化する方法について学びます。
@z

@x
{{< button url="./containerize-your-app.md" text="Containerize your app" >}}
@y
{{< button url="./containerize-your-app.md" text="アプリのコンテナー化" >}}
@z
