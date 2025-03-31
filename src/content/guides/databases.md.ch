%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: Learn how to run, connect to, and persist data in a local containerized database.
keywords: database, mysql
title: Use containerized databases
summary: |
  Learn how to effectively run and manage databases as containers.
@y
description: Learn how to run, connect to, and persist data in a local containerized database.
keywords: database, mysql
title: コンテナー化データベースの利用
summary: |
  データベースをコンテナーとして効果的に実行および管理する手法について学びます。
@z

@x
tags: [databases]
@y
tags: [databases]
@z

% params:
@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
Using a local containerized database offers flexibility and ease of setup,
letting you mirror production environments closely without the overhead of
traditional database installations. Docker simplifies this process, enabling you
to deploy, manage, and scale databases in isolated containers with just a few
commands.
@y
Using a local containerized database offers flexibility and ease of setup,
letting you mirror production environments closely without the overhead of
traditional database installations. Docker simplifies this process, enabling you
to deploy, manage, and scale databases in isolated containers with just a few
commands.
@z

@x
In this guide, you'll learn how to:
@y
このガイドでは以下について学びます。
@z

@x
- Run a local containerized database
- Access the shell of a containerized database
- Connect to a containerized database from your host
- Connect to a containerized database from another container
- Persist database data in a volume
- Build a customized database image
- Use Docker Compose to run a database
@y
- ローカルでのコンテナー化データベースの実行
- コンテナー化データベースへのシェルアクセス
- ホストからのコンテナー化データベースへの接続
- 別コンテナーからのコンテナー化データベースへの接続
- ボリューム内のデータベースデータの保存
- カスタマイズしたデータベースイメージのビルド
- Docker Compose を利用したデータベース実行
@z

@x
This guide uses the MySQL image for examples, but the concepts can be applied to other database images.
@y
このガイドでは例として MySQL イメージを用います。
ただしその考え方は他のデータベースイメージにも適用することができます。
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
To follow along with this guide, you must have Docker installed. To install Docker, see [Get Docker](/get-started/get-docker.md).
@y
このガイドの作業を進めるには Docker をすでにインストールしていることが必要です。
Docker のインストールについては [Docker の入手](get-started/get-docker.md) を参照してください。
@z

@x
## Run a local containerized database
@y
## ローカルでのコンテナー化データベースの実行 {#run-a-local-containerized-database}
@z

@x
Most popular database systems, including MySQL, PostgreSQL, and MongoDB, have a
Docker Official Image available on Docker Hub. These images are a curated set
images that follow best practices, ensuring that you have access to the latest
features and security updates. To get started, visit
[Docker Hub](https://hub.docker.com) and search for the database you're
interested in. Each image's page provides detailed instructions on how to run
the container, customize your setup, and configure the database according to
your needs. For more information about the MySQL image used in this guide, see the Docker Hub [MySQL image](https://hub.docker.com/_/mysql) page.
@y
MySQL、PostgreSQL、MongoDB といった人気のデータベースシステムについては、そのほとんどが Docker Hub 上に Docker 公式イメージがあります。
そういったイメージはベストプラクティスを実現するものとして提供されており、最新機能やセキュリティアップデートが行われたものを利用することができます。
作業を進めるには [Docker Hub](https://hub.docker.com) にアクセスして、利用したいデータベースを検索します。
検索された各ページには、そのコンテナーを起動する手順、カスタマイズ方法、必要に応じたデータベース設定方法が詳細に示されています。
このガイドに示す MySQ についての情報は Docker Hub の [MySQL イメージ](https://hub.docker.com/_/mysql) ページを参照してください。
@z

@x
To run a database container, you can use either the Docker Desktop GUI or
CLI.
@y
データベースコンテナーを起動するには Docker Desktop GUI か CLI を利用します。
@z

@x
{{< tabs group="ui" >}}
{{< tab name="CLI" >}}
@y
{{< tabs group="ui" >}}
{{< tab name="CLI" >}}
@z

@x
To run a container using the CLI, run the following command in a terminal:
@y
CLI を使ってコンテナーを起動するには、端末から以下のコマンドを実行します。
@z

% snip command...

@x
In this command:
@y
このコマンドは以下を行ないます。
@z

@x
- `--name my-mysql` assigns the name my-mysql to your container for easier
  reference.
- `-e MYSQL_ROOT_PASSWORD=my-secret-pw` sets the root password for MySQL to
  my-secret-pw. Replace my-secret-pw with a secure password of your choice.
- `-e MYSQL_DATABASE=mydb` optionally creates a database named mydb. You can
  change mydb to your desired database name.
- `-d` runs the container in detached mode, meaning it runs in the background.
- `mysql:latest` specifies that you want to use the latest version of the MySQL
  image.
@y
- `--name my-mysql` はコンテナーに対して my-mysql という名前をつけることで参照しやすくします。
- `-e MYSQL_ROOT_PASSWORD=my-secret-pw` は MySQL の root パスワードを my-secret-pw に設定します。
   my-secret-pw の部分は、環境に応じたセキュアなパスワードに置き換えてください。
- `-e MYSQL_DATABASE=mydb` の利用は任意であり、mydb という名前のデータベースを生成します。
   mydb という名前は適宜変更してください。
- `-d` はコンテナーをデタッチモードで起動します。
  これはつまりバックグラウンドで起動することです。
- `mysql:latest` は、MySQL イメージの最新バージョンを利用することを指示します。
@z

@x
To verify that you container is running, run `docker ps` in a terminal
@y
コンテナーが起動しているかどうかは、端末から `docker ps` を実行して確認します。
@z

@x
{{< /tab >}}
{{< tab name="GUI" >}}
@y
{{< /tab >}}
{{< tab name="GUI" >}}
@z

@x
To run a container using the GUI:
@y
GUI を使う場合、コンテナーの起動は以下のようにします。
@z

@x
1. In the Docker Desktop Dashboard, select the global search at the top of the window.
2. Specify `mysql` in the search box, and select the `Images` tab if not already
   selected.
3. Hover over the `mysql` image and select `Run`.
   The **Run a new container** modal appears.
4. Expand **Optional settings**.
5. In the optional settings, specify the following:
@y
1. Docker Desktop Dashboard において、画面最上段のグローバル検索欄を選びます。
2. 検索欄に `mysql` を入力します。
   `Images` (イメージ) タブが選択されていない場合は選択します。
3. `mysql` イメージ上にマウスカーソルを移動させて `Run` (実行) を選びます。
   **Run a new container** (新規コンテナーの実行) 画面が開きます。
4. **Optional settings** (オプション設定) を展開します。
5. オプションの設定において以下を指定します。
@z

@x
   - **Container name**: `my-mysql`
   - **Environment variables**:
     - `MYSQL_ROOT_PASSWORD`:`my-secret-pw`
     - `MYSQL_DATABASE`:`mydb`
@y
   - **Container name** (コンテナー名): `my-mysql`
   - **Environment variables** (環境変数):
     - `MYSQL_ROOT_PASSWORD`: `my-secret-pw`
     - `MYSQL_DATABASE`: `mydb`
@z

@x
   ![The optional settings screen with the options specified.](images/databases-1.webp)
@y
   ![オプション設定画面にてオプションを設定](images/databases-1.webp)
@z

@x
6. Select `Run`.
7. Open the **Container** view in the Docker Desktop Dashboard to verify that your
   container is running.
@y
6. `Run` (実行) を選びます。
7. Docker Dashboard Dashboard の **Container** (コンテナー) 画面を開いて、対象コンテナーが起動していることを確認します。
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Access the shell of a containerized database
@y
## コンテナー化データベースへのシェルアクセス {#access-the-shell-of-a-containerized-database}
@z

@x
When you have a database running inside a Docker container, you may need to
access its shell to manage the database, execute commands, or perform
administrative tasks. Docker provides a straightforward way to do this using the
`docker exec` command. Additionally, if you prefer a graphical interface, you
can use Docker Desktop's GUI.
@y
Docker コンテナー内部でデータベースを起動したら、データベースの管理、コマンド実行、管理タスクの実現のため、データベースにアクセスするシェルの実行が必要になってきます。
Docker ではこれを行う簡単な方法として `docker exec` コマンドを提供しています。
またグラフィカルインターフェースを好むのであれば Docker Desktop GUI を利用することもできます。
@z

@x
If you don't yet have a database container running, see
[Run a local containerized database](#run-a-local-containerized-database).
@y
データベースコンテナーをまだ起動していない場合は [ローカルでのコンテナー化データベースの実行](#run-a-local-containerized-database) を参照してください。
@z

@x
{{< tabs group="ui" >}}
{{< tab name="CLI" >}}
@y
{{< tabs group="ui" >}}
{{< tab name="CLI" >}}
@z

@x
To access the terminal of a MySQL container using the CLI, you can use the
following `docker exec` command.
@y
CLI を使って MySQL コンテナーの画面にアクセスするには、以下のような `docker exec` コマンドを実行します。
@z

% snip command...

@x
In this command:
@y
このコマンドは以下を行ないます。
@z

@x
- `docker exec` tells Docker you want to execute a command in a running
  container.
- `-it` ensures that the terminal you're accessing is interactive, so you can
  type commands into it.
- `my-mysql` is the name of your MySQL container. If you named your container
  differently when you ran it, use that name instead.
- `bash` is the command you want to run inside the container. It opens up a bash
  shell that lets you interact with the container's file system and installed
  applications.
@y
- `docker exec` は、起動しているコンテナー内においてコマンド実行を行うために利用します。
- `-it` はアクセスするターミナルを対話モードとします。
  そうすることでコマンド入力を行えるようにします。
- `my-mysql` は MySQL コンテナー名です。
  コンテナー実行時に別の名前としていた場合は、その名前に書き換えてください。
- `bash` はコンテナー内部で実行するコマンドです。
  これによって bash シェルが開くので、コンテナー内のファイルシステムやインストール済アプリケーションとの対話的処理を行うことができます。
@z

@x
After executing this command, you will be given access to the bash shell inside
your MySQL container, from which you can manage your MySQL server directly. You
can run `exit` to return to your terminal.
@y
このコマンドの実行により、MySQL コンテナー内での bash シェルへのアクセスが可能となります。
そこから MySQL サーバーを直接管理できます。
`exit` を実行すれば、元のターミナル画面に戻ります。
@z

@x
{{< /tab >}}
{{< tab name="GUI" >}}
@y
{{< /tab >}}
{{< tab name="GUI" >}}
@z

@x
1. Open the Docker Desktop Dashboard and select the **Containers** view.
2. In the **Actions** column for your container, select **Show container
   actions** and then select **Open in terminal**.
@y
1. Docker Desktop Dashboard を開いて **Containers** (コンテナー) 画面を選びます。
2. 対象コンテナーの **Actions** (動作) カラムにおいて **Show container actions** (コンテナー動作の確認) を選択します。
   そして **Open in terminal** (端末を開く) を選びます。
@z

@x
In this terminal you can access to the shell inside your MySQL container, from
which you can manage your MySQL server directly.
@y
この端末画面内において、MySQL コンテナー内部のシェルにアクセスすることができます。
そこから MySQL サーバーを直接管理できます。
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
Once you've accessed the container's terminal, you can run any tools available
in that container. The following example shows using `mysql` in the container to
list the databases.
@y
コンテナーの端末にアクセスできたら、あとはコンテナー内で利用可能なツール類は何でも利用できます。
以下に示す例では、コンテナー内の `mysql` を使ってデータベースの一覧を表示しています。
@z

% snip command...

@x
## Connect to a containerized database from your host
@y
## ホストからのコンテナー化データベースへの接続 {#connect-to-a-containerized-database-from-your-host}
@z

@x
Connecting to a containerized database from your host machine involves mapping a
port inside the container to a port on your host machine. This process ensures
that the database inside the container is accessible via the host machine's
network. For MySQL, the default port is 3306. By exposing this port, you can use
various database management tools or applications on your host machine to
interact with your MySQL database.
@y
コンテナー化したデータベースにホストから接続するには、コンテナー内部のポートとホストマシン上のポートをマッピングする必要があります。
そのプロセスを実現することで、コンテナー内にあるデータベースはホストマシンのネットワークからアクセス可能となります。
MySQL の場合、デフォルトのポートは 3306 です。
このポートを公開すれば、ホストマシン上にあるさまざまなデータベース管理ツールやアプリケーションが MySQL データベースとやり取りできるようになります。
@z

@x
Before you begin, you must remove any containers you previously ran for this
guide. To stop and remove a container, either:
@y
作業を進めるにあたっては、本ガイドを通じて実行させてきた以前のコンテナーは削除してください。
コンテナーを停止させ削除するには、以下のいずれかを行います。
@z

@x
- In a terminal, run `docker remove --force my-mysql` to remove the container
  named `my-mysql`.
- Or, in the Docker Desktop Dashboard, select the **Delete** icon next to your
  container in the **Containers** view.
@y
- 端末から `docker remove --force my-mysql` を実行して `my-mysql` という名前のコンテナーを削除します。
- または Docker Desktop Dashboard の **Containers** (コンテナー) 画面にて、対象コンテナーの横にある  **Delete** (削除) アイコンをクリックします。
@z

@x
Next, you can use either the Docker Desktop GUI or CLI to run the container with a volume.
@y
そこで Docker Desktop GUI または CUI を使って、ボリュームを使ったコンテナーを起動します。
@z

@x
{{< tabs group="ui" >}}
{{< tab name="CLI" >}}
@y
{{< tabs group="ui" >}}
{{< tab name="CLI" >}}
@z

@x
To run your database container with a volume attached, include the `-v` option
with your `docker run` command, specifying a volume name and the path where the
database stores its data inside the container. If the volume doesn't exist,
Docker automatically creates it for you.
@y
To run your database container with a volume attached, include the `-v` option
with your `docker run` command, specifying a volume name and the path where the
database stores its data inside the container. If the volume doesn't exist,
Docker automatically creates it for you.
@z

@x
To run a database container with a volume attached, and then verify that the
data persists:
@y
To run a database container with a volume attached, and then verify that the
data persists:
@z

@x
1. Run the container and attach the volume.
@y
1. Run the container and attach the volume.
@z

% snip command...

@x
   This command mounts the volume named `my-db-volume` to the `/var/lib/mysql` directory in the container.
@y
   This command mounts the volume named `my-db-volume` to the `/var/lib/mysql` directory in the container.
@z

@x
2. Create some data in the database. Use the `docker exec` command to run
   `mysql` inside the container and create a table.
@y
2. Create some data in the database. Use the `docker exec` command to run
   `mysql` inside the container and create a table.
@z

% snip command...

@x
   This command uses the `mysql` tool in the container to create a table named
   `mytable` with a column named `column_name`, and finally inserts a value of
   `value`.
@y
   This command uses the `mysql` tool in the container to create a table named
   `mytable` with a column named `column_name`, and finally inserts a value of
   `value`.
@z

@x
3. Stop and remove the container. Without a volume, the table you created would
   be lost when removing the container.
@y
3. Stop and remove the container. Without a volume, the table you created would
   be lost when removing the container.
@z

% snip command...

@x
4. Start a new container with the volume attached. This time, you don't need to
   specify any environment variables as the configuration is saved in the
   volume.
@y
4. Start a new container with the volume attached. This time, you don't need to
   specify any environment variables as the configuration is saved in the
   volume.
@z

% snip command...

@x
5. Verify that the table you created still exists. Use the `docker exec` command
   again to run `mysql` inside the container.
@y
5. Verify that the table you created still exists. Use the `docker exec` command
   again to run `mysql` inside the container.
@z

% snip command...

@x
   This command uses the `mysql` tool in the container to select all the
   records from the `mytable` table.
@y
   This command uses the `mysql` tool in the container to select all the
   records from the `mytable` table.
@z

@x
   You should see output like the following.
@y
   その出力結果は以下のようになるはずです。
@z

% snip output...

@x
{{< /tab >}}
{{< tab name="GUI" >}}
@y
{{< /tab >}}
{{< tab name="GUI" >}}
@z

@x
To run a database container with a volume attached, and then verify that the
data persists:
@y
To run a database container with a volume attached, and then verify that the
data persists:
@z

@x
1. Run a container with a volume attached.
@y
1. Run a container with a volume attached.
@z

@x
   1. In the Docker Desktop Dashboard, select the global search at the top of the window.
   2. Specify `mysql` in the search box, and select the **Images** tab if not
      already selected.
   3. Hover over the **mysql** image and select **Run**.
      The **Run a new container** modal appears.
   4. Expand **Optional settings**.
   5. In the optional settings, specify the following:
@y
   1. Docker Desktop Dashboard において、画面最上段のグローバル検索欄を選びます。
   2. 検索欄に `mysql` を入力します。
      **Images** (イメージ) タブが選択されていない場合は選択します。
   3. **msyql** イメージ上にマウスカーソルを移動させて **Run** (実行) を選びます。
      **Run a new container** (新規コンテナーの実行) 画面が開きます。
   4. **Optional settings** (オプション設定) を展開します。
   5. オプションの設定において以下を指定します。
@z

@x
      - **Container name**: `my-mysql`
      - **Environment variables**:
        - `MYSQL_ROOT_PASSWORD`:`my-secret-pw`
        - `MYSQL_DATABASE`:`mydb`
      - **Volumes**:
        - `my-db-volume`:`/var/lib/mysql`
@y
      - **Container name** (コンテナー名): `my-mysql`
      - **Environment variables** (環境変数):
        - `MYSQL_ROOT_PASSWORD`:`my-secret-pw`
        - `MYSQL_DATABASE`:`mydb`
      - **Volumes**:
        - `my-db-volume`:`/var/lib/mysql`
@z

@x
      ![The optional settings screen with the options specified.](images/databases-3.webp)
@y
      ![オプション設定画面にてオプションを設定](images/databases-3.webp)
@z

@x
   6. Select `Run`.
@y
   6. `Run` (実行) を選びます。
@z

@x
2. Create some data in the database.
@y
2. Create some data in the database.
@z

@x
   1. In the **Containers** view, next to your container select the **Show
      container actions** icon, and then select **Open in terminal**.
   2. Run the following command in the container's terminal to add a table.
@y
   1. In the **Containers** view, next to your container select the **Show
      container actions** icon, and then select **Open in terminal**.
   2. Run the following command in the container's terminal to add a table.
@z

% snip command...

@x
      This command uses the `mysql` tool in the container to create a table
      named `mytable` with a column named `column_name`, and finally inserts a
      value of value`.
@y
      This command uses the `mysql` tool in the container to create a table
      named `mytable` with a column named `column_name`, and finally inserts a
      value of value`.
@z

@x
3. In the **Containers** view, select the **Delete** icon next to your
   container, and then select **Delete forever**. Without a volume, the table
   you created would be lost when deleting the container.
4. Run a container with a volume attached.
@y
3. In the **Containers** view, select the **Delete** icon next to your
   container, and then select **Delete forever**. Without a volume, the table
   you created would be lost when deleting the container.
4. Run a container with a volume attached.
@z

@x
   1. In the Docker Desktop Dashboard, select the global search at the top of the window.
   2. Specify `mysql` in the search box, and select the **Images** tab if not
      already selected.
   3. Hover over the **mysql** image and select **Run**.
      The **Run a new container** modal appears.
   4. Expand **Optional settings**.
   5. In the optional settings, specify the following:
@y
   1. In the Docker Desktop Dashboard, select the global search at the top of the window.
   2. Specify `mysql` in the search box, and select the **Images** tab if not
      already selected.
   3. Hover over the **mysql** image and select **Run**.
      The **Run a new container** modal appears.
   4. Expand **Optional settings**.
   5. In the optional settings, specify the following:
@z

@x
      - **Container name**: `my-mysql`
      - **Environment variables**:
        - `MYSQL_ROOT_PASSWORD`:`my-secret-pw`
        - `MYSQL_DATABASE`:`mydb`
      - **Volumes**:
        - `my-db-volume`:`/var/lib/mysql`
@y
      - **Container name**: `my-mysql`
      - **Environment variables**:
        - `MYSQL_ROOT_PASSWORD`:`my-secret-pw`
        - `MYSQL_DATABASE`:`mydb`
      - **Volumes**:
        - `my-db-volume`:`/var/lib/mysql`
@z

@x
      ![The optional settings screen with the options specified.](images/databases-3.webp)
@y
      ![The optional settings screen with the options specified.](images/databases-3.webp)
@z

@x
   6. Select `Run`.
@y
   6. Select `Run`.
@z

@x
5. Verify that the table you created still exists.
@y
5. Verify that the table you created still exists.
@z

@x
   1. In the **Containers** view, next to your container select the **Show
      container actions** icon, and then select **Open in terminal**.
   2. Run the following command in the container's terminal to verify that table
      you created still exists.
@y
   1. In the **Containers** view, next to your container select the **Show
      container actions** icon, and then select **Open in terminal**.
   2. Run the following command in the container's terminal to verify that table
      you created still exists.
@z

% snip command...

@x
      This command uses the `mysql` tool in the container to select all the
      records from the `mytable` table.
@y
      This command uses the `mysql` tool in the container to select all the
      records from the `mytable` table.
@z

@x
      You should see output like the following.
@y
      You should see output like the following.
@z

% snip command...

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
At this point, any MySQL container that mounts the `my-db-volume` will be able
to access and save persisted data.
@y
At this point, any MySQL container that mounts the `my-db-volume` will be able
to access and save persisted data.
@z

@x
## Build a customized database image
@y
## Build a customized database image
@z

@x
Customizing your database image lets you include additional configuration,
scripts, or tools alongside the base database server. This is particularly
useful for creating a Docker image that matches your specific development or
production environment needs. The following example outlines how to build and
run a custom MySQL image that includes a table initialization script.
@y
Customizing your database image lets you include additional configuration,
scripts, or tools alongside the base database server. This is particularly
useful for creating a Docker image that matches your specific development or
production environment needs. The following example outlines how to build and
run a custom MySQL image that includes a table initialization script.
@z

@x
Before you begin, you must remove any containers you previously ran for this
guide. To stop and remove a container, either:
@y
Before you begin, you must remove any containers you previously ran for this
guide. To stop and remove a container, either:
@z

@x
- In a terminal, run `docker remove --force my-mysql` to remove the container
  named `my-mysql`.
- Or, in the Docker Desktop Dashboard, select the **Delete** icon next to your
  container in the **Containers** view.
@y
- In a terminal, run `docker remove --force my-mysql` to remove the container
  named `my-mysql`.
- Or, in the Docker Desktop Dashboard, select the **Delete** icon next to your
  container in the **Containers** view.
@z

@x
To build and run your custom image:
@y
To build and run your custom image:
@z

@x
1. Create a Dockerfile.
@y
1. Create a Dockerfile.
@z

@x
   1. Create a file named `Dockerfile` in your project directory. For this
      example, you can create the `Dockerfile` in an empty directory of your
      choice. This file will define how to build your custom MySQL image.
   2. Add the following content to the `Dockerfile`.
@y
   1. Create a file named `Dockerfile` in your project directory. For this
      example, you can create the `Dockerfile` in an empty directory of your
      choice. This file will define how to build your custom MySQL image.
   2. Add the following content to the `Dockerfile`.
@z

@x
      ```dockerfile
      # syntax=docker/dockerfile:1
@y
      ```dockerfile
      # syntax=docker/dockerfile:1
@z

@x
      # Use the base image mysql:latest
      FROM mysql:latest
@y
      # Use the base image mysql:latest
      FROM mysql:latest
@z

@x
      # Set environment variables
      ENV MYSQL_DATABASE mydb
@y
      # Set environment variables
      ENV MYSQL_DATABASE mydb
@z

@x
      # Copy custom scripts or configuration files from your host to the container
      COPY ./scripts/ /docker-entrypoint-initdb.d/
      ```
@y
      # Copy custom scripts or configuration files from your host to the container
      COPY ./scripts/ /docker-entrypoint-initdb.d/
      ```
@z

@x
      In this Dockerfile, you've set the environment variable for the MySQL
      database name. You can also use the `COPY` instruction to add custom
      configuration files or scripts into the container. In this
      example, files from your host's `./scripts/` directory are copied into the
      container's `/docker-entrypoint-initdb.d/` directory. In this directory,
      `.sh`, `.sql`, and `.sql.gz` scripts are executed when the container is
      started for the first time. For more details about Dockerfiles, see the
      [Dockerfile reference](/reference/dockerfile/).
@y
      In this Dockerfile, you've set the environment variable for the MySQL
      database name. You can also use the `COPY` instruction to add custom
      configuration files or scripts into the container. In this
      example, files from your host's `./scripts/` directory are copied into the
      container's `/docker-entrypoint-initdb.d/` directory. In this directory,
      `.sh`, `.sql`, and `.sql.gz` scripts are executed when the container is
      started for the first time. For more details about Dockerfiles, see the
      [Dockerfile reference](/reference/dockerfile/).
@z

@x
   3. Create a script file to initialize a table in the database. In the
      directory where your `Dockerfile` is located, create a subdirectory named
      `scripts`, and then create a file named `create_table.sql` with the
      following content.
@y
   3. Create a script file to initialize a table in the database. In the
      directory where your `Dockerfile` is located, create a subdirectory named
      `scripts`, and then create a file named `create_table.sql` with the
      following content.
@z

@x
   ```text
   CREATE TABLE IF NOT EXISTS mydb.myothertable (
     column_name VARCHAR(255)
   );
@y
   ```text
   CREATE TABLE IF NOT EXISTS mydb.myothertable (
     column_name VARCHAR(255)
   );
@z

@x
   INSERT INTO mydb.myothertable (column_name) VALUES ('other_value');
   ```
@y
   INSERT INTO mydb.myothertable (column_name) VALUES ('other_value');
   ```
@z

@x
   You should now have the following directory structure.
@y
   You should now have the following directory structure.
@z

@x
   ```text
   ├── your-project-directory/
   │ ├── scripts/
   │ │ └── create_table.sql
   │ └── Dockerfile
   ```
@y
   ```text
   ├── your-project-directory/
   │ ├── scripts/
   │ │ └── create_table.sql
   │ └── Dockerfile
   ```
@z

@x
2. Build your image.
@y
2. Build your image.
@z

@x
   1. In a terminal, change directory to the directory where your `Dockerfile`
      is located.
   2. Run the following command to build the image.
@y
   1. In a terminal, change directory to the directory where your `Dockerfile`
      is located.
   2. Run the following command to build the image.
@z

@x
      ```console
      $ docker build -t my-custom-mysql .
      ```
@y
      ```console
      $ docker build -t my-custom-mysql .
      ```
@z

@x
      In this command, `-t my-custom-mysql` tags (names) your new image as
      `my-custom-mysql`. The period (.) at the end of the command specifies the
      current directory as the context for the build, where Docker looks for the
      Dockerfile and any other files needed for the build.
@y
      In this command, `-t my-custom-mysql` tags (names) your new image as
      `my-custom-mysql`. The period (.) at the end of the command specifies the
      current directory as the context for the build, where Docker looks for the
      Dockerfile and any other files needed for the build.
@z

@x
3. Run your image as you did in [Run a local containerized
   database](#run-a-local-containerized-database). This time, specify your
   image's name instead of `mysql:latest`. Also, you no longer need to specify
   the `MYSQL_DATABASE` environment variable as it's now defined by your
   Dockerfile.
@y
3. Run your image as you did in [Run a local containerized
   database](#run-a-local-containerized-database). This time, specify your
   image's name instead of `mysql:latest`. Also, you no longer need to specify
   the `MYSQL_DATABASE` environment variable as it's now defined by your
   Dockerfile.
@z

@x
   ```console
   $ docker run --name my-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d my-custom-mysql
   ```
@y
   ```console
   $ docker run --name my-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d my-custom-mysql
   ```
@z

@x
4. Verify that your container is running with the following command.
@y
4. Verify that your container is running with the following command.
@z

@x
   ```console
   $ docker ps
   ```
@y
   ```console
   $ docker ps
   ```
@z

@x
   You should see output like the following.
@y
   You should see output like the following.
@z

@x
   ```console
   CONTAINER ID   IMAGE              COMMAND                  CREATED        STATUS          PORTS                 NAMES
   f74dcfdb0e59   my-custom-mysql   "docker-entrypoint.s…"    2 hours ago    Up 51 minutes   3306/tcp, 33060/tcp   my-mysql
   ```
@y
   ```console
   CONTAINER ID   IMAGE              COMMAND                  CREATED        STATUS          PORTS                 NAMES
   f74dcfdb0e59   my-custom-mysql   "docker-entrypoint.s…"    2 hours ago    Up 51 minutes   3306/tcp, 33060/tcp   my-mysql
   ```
@z

@x
5. Verify that your initialization script was ran. Run the following command in
   a terminal to show the contents of the `myothertable` table.
@y
5. Verify that your initialization script was ran. Run the following command in
   a terminal to show the contents of the `myothertable` table.
@z

@x
   ```console
   $ docker exec my-mysql mysql -u root -pmy-secret-pw -e "SELECT * FROM mydb.myothertable;"
   ```
@y
   ```console
   $ docker exec my-mysql mysql -u root -pmy-secret-pw -e "SELECT * FROM mydb.myothertable;"
   ```
@z

@x
   You should see output like the following.
@y
   You should see output like the following.
@z

@x
   ```console
   column_name
   other_value
   ```
@y
   ```console
   column_name
   other_value
   ```
@z

@x
Any container ran using your `my-custom-mysql` image will have the table
initialized when first started.
@y
Any container ran using your `my-custom-mysql` image will have the table
initialized when first started.
@z

@x
## Use Docker Compose to run a database
@y
## Use Docker Compose to run a database
@z

@x
Docker Compose is a tool for defining and running multi-container Docker
applications. With a single command, you can configure all your application's
services (like databases, web apps, etc.) and manage them. In this example,
you'll create a Compose file and use it to run a MySQL database container and a phpMyAdmin container.
@y
Docker Compose is a tool for defining and running multi-container Docker
applications. With a single command, you can configure all your application's
services (like databases, web apps, etc.) and manage them. In this example,
you'll create a Compose file and use it to run a MySQL database container and a phpMyAdmin container.
@z

@x
To run your containers with Docker Compose:
@y
To run your containers with Docker Compose:
@z

@x
1. Create a Docker Compose file.
@y
1. Create a Docker Compose file.
@z

@x
   1. Create a file named `compose.yaml` in your project directory. This file
      will define the services, networks, and volumes.
   2. Add the following content to the `compose.yaml` file.
@y
   1. Create a file named `compose.yaml` in your project directory. This file
      will define the services, networks, and volumes.
   2. Add the following content to the `compose.yaml` file.
@z

@x
      ```yaml
      services:
        db:
          image: mysql:latest
          environment:
            MYSQL_ROOT_PASSWORD: my-secret-pw
            MYSQL_DATABASE: mydb
          ports:
            - 3307:3306
          volumes:
            - my-db-volume:/var/lib/mysql
@y
      ```yaml
      services:
        db:
          image: mysql:latest
          environment:
            MYSQL_ROOT_PASSWORD: my-secret-pw
            MYSQL_DATABASE: mydb
          ports:
            - 3307:3306
          volumes:
            - my-db-volume:/var/lib/mysql
@z

@x
        phpmyadmin:
          image: phpmyadmin/phpmyadmin:latest
          environment:
            PMA_HOST: db
            PMA_PORT: 3306
            MYSQL_ROOT_PASSWORD: my-secret-pw
          ports:
            - 8080:80
          depends_on:
            - db
@y
        phpmyadmin:
          image: phpmyadmin/phpmyadmin:latest
          environment:
            PMA_HOST: db
            PMA_PORT: 3306
            MYSQL_ROOT_PASSWORD: my-secret-pw
          ports:
            - 8080:80
          depends_on:
            - db
@z

@x
      volumes:
        my-db-volume:
      ```
@y
      volumes:
        my-db-volume:
      ```
@z

@x
      For the database service:
@y
      For the database service:
@z

@x
      - `db` is the name of the service.
      - `image: mysql:latest` specifies that the service uses the latest MySQL
        image from Docker Hub.
      - `environment` lists the environment variables used by MySQL to
        initialize the database, such as the root password and the database
        name.
      - `ports` maps port 3307 on the host to port 3306 in the container,
        allowing you to connect to the database from your host machine.
      - `volumes` mounts `my-db-volume` to `/var/lib/mysql` inside the container
        to persist database data.
@y
      - `db` is the name of the service.
      - `image: mysql:latest` specifies that the service uses the latest MySQL
        image from Docker Hub.
      - `environment` lists the environment variables used by MySQL to
        initialize the database, such as the root password and the database
        name.
      - `ports` maps port 3307 on the host to port 3306 in the container,
        allowing you to connect to the database from your host machine.
      - `volumes` mounts `my-db-volume` to `/var/lib/mysql` inside the container
        to persist database data.
@z

@x
      In addition to the database service, there is a phpMyAdmin service. By
      default Compose sets up a single network for your app. Each container for
      a service joins the default network and is both reachable by other
      containers on that network, and discoverable by the service's name.
      Therefore, in the `PMA_HOST` environment variable, you can specify the
      service name, `db`, in order to connect to the database service. For more details about Compose, see the [Compose file reference](/reference/compose-file/).
@y
      In addition to the database service, there is a phpMyAdmin service. By
      default Compose sets up a single network for your app. Each container for
      a service joins the default network and is both reachable by other
      containers on that network, and discoverable by the service's name.
      Therefore, in the `PMA_HOST` environment variable, you can specify the
      service name, `db`, in order to connect to the database service. For more details about Compose, see the [Compose file reference](/reference/compose-file/).
@z

@x
2. Run Docker Compose.
@y
2. Run Docker Compose.
@z

@x
   1. Open a terminal and change directory to the directory where your
      `compose.yaml` file is located.
   2. Run Docker Compose using the following command.
@y
   1. Open a terminal and change directory to the directory where your
      `compose.yaml` file is located.
   2. Run Docker Compose using the following command.
@z

@x
      ```console
      $ docker compose up
      ```
@y
      ```console
      $ docker compose up
      ```
@z

@x
      You can now access phpMyAdmin at
      [http://localhost:8080](http://localhost:8080) and connect to your
      database using `root` as the username and `my-secret-pw` as the password.
@y
      You can now access phpMyAdmin at
      [http://localhost:8080](http://localhost:8080) and connect to your
      database using `root` as the username and `my-secret-pw` as the password.
@z

@x
   3. To stop the containers, press `ctrl`+`c` in the terminal.
@y
   3. To stop the containers, press `ctrl`+`c` in the terminal.
@z

@x
Now, with Docker Compose you can start your database and app, mount volumes,
configure networking, and more, all with a single command.
@y
Now, with Docker Compose you can start your database and app, mount volumes,
configure networking, and more, all with a single command.
@z

@x
## Summary
@y
## Summary
@z

@x
This guide introduced you to the essentials of using containerized databases,
specifically focusing on MySQL, to enhance flexibility, ease of setup, and
consistency across your development environments. The use-cases covered in
this guide not only streamline your development workflows but also prepare you
for more advanced database management and deployment scenarios, ensuring your
data-driven applications remain robust and scalable.
@y
This guide introduced you to the essentials of using containerized databases,
specifically focusing on MySQL, to enhance flexibility, ease of setup, and
consistency across your development environments. The use-cases covered in
this guide not only streamline your development workflows but also prepare you
for more advanced database management and deployment scenarios, ensuring your
data-driven applications remain robust and scalable.
@z

@x
Related information:
@y
Related information:
@z

@x
- [Docker Hub database images](https://hub.docker.com/search?q=database&type=image)
- [Dockerfile reference](/reference/dockerfile/)
- [Compose file reference](/reference/compose-file/)
- [CLI reference](/reference/cli/docker/)
- [Database samples](../../reference/samples/_index.md#databases)
@y
- [Docker Hub database images](https://hub.docker.com/search?q=database&type=image)
- [Dockerfile reference](/reference/dockerfile/)
- [Compose file reference](/reference/compose-file/)
- [CLI reference](/reference/cli/docker/)
- [Database samples](../../reference/samples/_index.md#databases)
@z
