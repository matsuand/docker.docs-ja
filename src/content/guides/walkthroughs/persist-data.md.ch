%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Persist container data
keywords: get started, quick start, intro, concepts
description: Learn how to persist container data
---
@y
---
title: コンテナーデータの保存
keywords: get started, quick start, intro, concepts
description: コンテナーデータの保存方法について学びます。
---
@z

@x
This walkthrough shows you how to persist data between containers. To better understand some concepts in this walkthrough, complete the [Run multi-container applications](./multi-container-apps.md) walkthrough first.
@y
このウォークスルーでは、コンテナー間においてデータを保存する方法について示します。
ウォークスルーにおいて説明する考え方をより深く理解するためには、[マルチコンテナーアプリケーションの実行](./multi-container-apps.md) をまずはよくお読みください。
@z

@x
Docker isolates all content, code, and data in a container from your local filesystem. When you delete a container, Docker deletes all the content within that container.
@y
Docker はあらゆる内容、コード、データをコンテナーの中に保持し、ローカルのファイルシステムから切り離して管理します。
コンテナーを削除すると、Docker はコンテナー内にある内容をすべて削除します。
@z

@x
![Data isolation diagram](images/getting-started-isolation.webp?w=400)
@y
![データが切り離されている様子](images/getting-started-isolation.webp?w=400)
@z

@x
Sometimes, you may want to persist the data that a container generates. To do this, you can use volumes.
@y
コンテナーが生成したデータを保存しておきたい場合があります。
これを行うにはボリュームを利用します。
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
## Step 2: Add a volume to persist data
@y
## 手順 2: 保存データへのボリューム追加 {#step-2-add-a-volume-to-persist-data}
@z

@x
To persist data after you delete a container, use a volume. A volume is a location in your local filesystem, automatically managed by Docker Desktop.
@y
コンテナーを削除した後でもデータを保存しておくためにはボリュームを利用します。
ボリュームとは、ローカルファイルシステム内の特定の場所のことです。
これは Docker Desktop により自動的に管理されるものです。
@z

@x
![Volume diagram](images/getting-started-volume.webp?w=400)
@y
![ボリュームの概要](images/getting-started-volume.webp?w=400)
@z

@x
To add a volume to this project, open the `compose.yaml` file in a code or text editor, and then uncomment the following lines.
@y
本プロジェクトにボリュームを追加するには、コードエディターまたはテキストエディターを使って `compose.yaml` ファイルを開き、以下のコメント行のコメント記号を取り除きます。
@z

@x
```yaml
todo-database:
    # ...
    volumes:
      - database:/data/db
@y
```yaml
todo-database:
    # ...
    volumes:
      - database:/data/db
@z

@x
# ...
volumes:
  database:
```
@y
# ...
volumes:
  database:
```
@z

@x
The `volumes` element that is nested under `todo-database` tells Compose to mount the volume named `database` to `/data/db` in the container for the todo-database service.
@y
`volumes` という記述要素は `todo-database` の元に段下げされていますが、これはこの todo-database サービスのコンテナーにおいて、`database` という名前のボリュームを `/data/db` にマウントすることを Compose に指示するものです。
@z

@x
The top-level `volumes` element defines and configures a volume named `database` that can be used by any of the services in the Compose file.
@y
トップレベルに記述された `volumes` 要素は `database` という名前のボリュームを定義するものであり、Compose ファイルのどのサービスにおいても利用することができます。
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
To view the frontend and add todos:
@y
フロントエンドの確認と todo の追加は、以下のようにして行います。
@z

@x
1. In Docker Desktop, expand the application stack in **Containers**.
2. Select the link to port **3000** in the **Port(s)** column or open [https://localhost:3000](https://localhost:3000)⁠.
3. Add some todo tasks in the frontend.
@y
1. Docker Desktop において **Containers**（コンテナー）タブ内のアプリケーションスタックを展開します。
2. **Port(s)**（ポート）カラムにあるポート **3000** というリンクをクリックするか、あるいは  [https://localhost:3000](https://localhost:3000) にアクセスします。
3. フロントエンド画面から todo タスクを追加します。
@z

@x
## Step 5: Delete the application stack and run new containers
@y
## 手順 5: アプリケーションスタックの削除と新たなコンテナーの実行 {#step-5-delete-the-application-stack-and-run-new-containers}
@z

@x
Now, no matter how often you delete and recreate the containers, Docker Desktop persists your data and it's accessible to any container on your system by mounting the `database` volume. Docker Desktop looks for the `database` volume and creates it if it doesn't exist.
@y
ここまでの作業により、コンテナーの削除と再生成は何度繰り返したとしても、Docker Desktop がデータを保存してくれるようになり、また `database` ボリュームをマウントしているコンテナーであれば、そのデータへのアクセスが可能になります。
Docker Desktop が `database` ボリュームを探し出し、もしなければこれを生成します。
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
that when you delete the containers and run them again, Docker Desktop persists any todos that you created.
@y
アプリケーションスタックを削除した後に、[手順 3: アプリケーションの実行](#step-3-run-the-application) を進めれば、アプリケーションを再度実行することができます。
つまりコンテナーを削除した上で再実行するとしても、生成した todo データは Docker Desktop が保存しているということです。
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this walkthrough, you persisted data between containers using a volume. You can use this to persist and share data among isolated and ephemeral containers.
@y
このウォークスルーでは、ボリュームを使ってコンテナー間でのデータ保存を行いました。
この方法を利用すれば、独立したエフェメラルな（ephemeral; はかない）コンテナー間にて、データを保存して共有することができます。
@z

@x
Related information:
@y
関連情報
@z

@x
- Deep dive into [volumes](../../storage/volumes.md)
- Learn about using volumes in Compose in the [Compose file reference](../../compose/compose-file/_index.md)
- Explore using volumes via the CLI in the [docker volume CLI reference](../../engine/reference/commandline/volume_create.md) and [Docker run reference](/reference/run/)
@y
- 詳しくは [ボリューム](../../storage/volumes.md) を参照してください。
- Compose ファイルにおけるボリュームの利用方法については [Compose ファイルリファレンス](../../compose/compose-file/_index.md) を参照してください。
- CLI を通じてボリュームを利用する方法については [docker volume CLI リファレンス](../../engine/reference/commandline/volume_create.md) や [Docker run リファレンス](__SUBDIR__/reference/run/) を確認してください。
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
Continue to the next walkthrough to learn how you can access a local directory from a container.
@y
次のウォークスルーに進んでください。
コンテナーからローカルディレクトリにアクセスする方法について学びます。
@z

@x
{{< button url="./access-local-folder.md" text="Access a local folder" >}}
@y
{{< button url="./access-local-folder.md" text="ローカルフォルダーへのアクセス" >}}
@z
