%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: Check out this tutorial on how to use Docker Compose from defining application
  dependencies to experimenting with commands.
keywords: docker compose example, docker compose tutorial, how to use docker compose,
  running docker compose, how to run docker compose, docker compose build image, docker
  compose command example, run docker compose file, how to create a docker compose
  file, run a docker compose file
@y
description: Check out this tutorial on how to use Docker Compose from defining application
  dependencies to experimenting with commands.
keywords: docker compose example, docker compose tutorial, how to use docker compose,
  running docker compose, how to run docker compose, docker compose build image, docker
  compose command example, run docker compose file, how to create a docker compose
  file, run a docker compose file
@z

@x
title: Docker Compose Quickstart
@y
title: Docker Compose クィックスタート
@z

@x
This tutorial aims to introduce fundamental concepts of Docker Compose by guiding you through the development of a basic Python web application. 
@y
This tutorial aims to introduce fundamental concepts of Docker Compose by guiding you through the development of a basic Python web application. 
@z

@x
Using the Flask framework, the application features a hit counter in Redis, providing a practical example of how Docker Compose can be applied in web development scenarios. 
@y
Using the Flask framework, the application features a hit counter in Redis, providing a practical example of how Docker Compose can be applied in web development scenarios. 
@z

@x
The concepts demonstrated here should be understandable even if you're not familiar with Python. 
@y
The concepts demonstrated here should be understandable even if you're not familiar with Python. 
@z

@x
This is a non-normative example that just highlights the key things you can do with Compose.
@y
This is a non-normative example that just highlights the key things you can do with Compose.
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
- Installed the latest version of Docker Compose
- A basic understanding of Docker concepts and how Docker works
@y
- Docker Compose の最新版をインストールしていること。
- Docker の考え方や Docker がどのようにして動作しているのかの基本を理解していること。
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
   > Note the way the `get_hit_count` function is written. This basic retry
   > loop attempts the request multiple times if the Redis service is
   > not available. This is useful at startup while the application comes
   > online, but also makes the application more resilient if the Redis
   > service needs to be restarted anytime during the app's lifetime. In a
   > cluster, this also helps handling momentary connection drops between
   > nodes.
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
Compose simplifies the control of your entire application stack, making it easy to manage services, networks, and volumes in a single, comprehensible YAML configuration file.
@z

@x
Create a file called `compose.yaml` in your project directory and paste
the following:
@y
Create a file called `compose.yaml` in your project directory and paste
the following:
@z

% snip code...

@x
This Compose file defines two services: `web` and `redis`. 
@y
This Compose file defines two services: `web` and `redis`. 
@z

@x
The `web` service uses an image that's built from the `Dockerfile` in the current directory.
It then binds the container and the host machine to the exposed port, `8000`. This example service uses the default port for the Flask web server, `5000`.
@y
The `web` service uses an image that's built from the `Dockerfile` in the current directory.
It then binds the container and the host machine to the exposed port, `8000`. This example service uses the default port for the Flask web server, `5000`.
@z

@x
The `redis` service uses a public [Redis](https://registry.hub.docker.com/_/redis/) 
image pulled from the Docker Hub registry.
@y
The `redis` service uses a public [Redis](https://registry.hub.docker.com/_/redis/) 
image pulled from the Docker Hub registry.
@z

@x
For more information on the `compose.yaml` file, see [How Compose works](compose-application-model.md).
@y
For more information on the `compose.yaml` file, see [How Compose works](compose-application-model.md).
@z

@x
## Step 3: Build and run your app with Compose
@y
## 手順 3: Compose によるアプリのビルドと実行 {#step-3-build-and-run-your-app-with-compose}
@z

@x
With a single command, you create and start all the services from your configuration file.
@y
With a single command, you create and start all the services from your configuration file.
@z

@x
1. From your project directory, start up your application by running `docker compose up`.
@y
1. From your project directory, start up your application by running `docker compose up`.
@z

% snip command...

@x
   Compose pulls a Redis image, builds an image for your code, and starts the
   services you defined. In this case, the code is statically copied into the image at build time.
@y
   Compose pulls a Redis image, builds an image for your code, and starts the
   services you defined. In this case, the code is statically copied into the image at build time.
@z

@x
2. Enter `http://localhost:8000/` in a browser to see the application running.
@y
2. Enter `http://localhost:8000/` in a browser to see the application running.
@z

@x
   If this doesn't resolve, you can also try `http://127.0.0.1:8000`.
@y
   If this doesn't resolve, you can also try `http://127.0.0.1:8000`.
@z

@x
   You should see a message in your browser saying:
@y
   You should see a message in your browser saying:
@z

@x
   ```text
   Hello World! I have been seen 1 times.
   ```
@y
   ```text
   Hello World! I have been seen 1 times.
   ```
@z

@x
   ![hello world in browser](images/quick-hello-world-1.png)
@y
   ![hello world in browser](images/quick-hello-world-1.png)
@z

@x
3. Refresh the page.
@y
3. Refresh the page.
@z

@x
   The number should increment.
@y
   The number should increment.
@z

@x
   ```text
   Hello World! I have been seen 2 times.
   ```
@y
   ```text
   Hello World! I have been seen 2 times.
   ```
@z

@x
   ![hello world in browser](images/quick-hello-world-2.png)
@y
   ![hello world in browser](images/quick-hello-world-2.png)
@z

@x
4. Switch to another terminal window, and type `docker image ls` to list local images.
@y
4. Switch to another terminal window, and type `docker image ls` to list local images.
@z

@x
   Listing images at this point should return `redis` and `web`.
@y
   Listing images at this point should return `redis` and `web`.
@z

% snip command...

@x
   You can inspect images with `docker inspect <tag or id>`.
@y
   You can inspect images with `docker inspect <tag or id>`.
@z

@x
5. Stop the application, either by running `docker compose down`
   from within your project directory in the second terminal, or by
   hitting `CTRL+C` in the original terminal where you started the app.
@y
5. Stop the application, either by running `docker compose down`
   from within your project directory in the second terminal, or by
   hitting `CTRL+C` in the original terminal where you started the app.
@z

@x
## Step 4: Edit the Compose file to use Compose Watch
@y
## 手順 4: Compose Watch 利用のための Compose ファイル修正 {#step-4-edit-the-compose-file-to-use-compose-watch}
@z

@x
Edit the `compose.yaml` file in your project directory to use `watch` so you can preview your running Compose services which are automatically updated as you edit and save your code:
@y
Edit the `compose.yaml` file in your project directory to use `watch` so you can preview your running Compose services which are automatically updated as you edit and save your code:
@z

% snip code...

@x
Whenever a file is changed, Compose syncs the file to the corresponding location under `/code` inside the container. Once copied, the bundler updates the running application without a restart.
@y
Whenever a file is changed, Compose syncs the file to the corresponding location under `/code` inside the container. Once copied, the bundler updates the running application without a restart.
@z

@x
For more information on how Compose Watch works, see [Use Compose Watch](file-watch.md). Alternatively, see [Manage data in containers](/manuals/engine/storage/volumes.md) for other options.
@y
For more information on how Compose Watch works, see [Use Compose Watch](file-watch.md). Alternatively, see [Manage data in containers](manuals/engine/storage/volumes.md) for other options.
@z

@x
> [!NOTE]
>
> For this example to work, the `--debug` option is added to the `Dockerfile`. The `--debug` option in Flask enables automatic code reload, making it possible to work on the backend API without the need to restart or rebuild the container.
> After changing the `.py` file, subsequent API calls will use the new code, but the browser UI will not automatically refresh in this small example. Most frontend development servers include native live reload support that works with Compose.
@y
> [!NOTE]
>
> For this example to work, the `--debug` option is added to the `Dockerfile`. The `--debug` option in Flask enables automatic code reload, making it possible to work on the backend API without the need to restart or rebuild the container.
> After changing the `.py` file, subsequent API calls will use the new code, but the browser UI will not automatically refresh in this small example. Most frontend development servers include native live reload support that works with Compose.
@z

@x
## Step 5: Re-build and run the app with Compose
@y
## 手順 5: Compose を使ったアプリの再ビルドと実行 {#step-5-re-build-and-run-the-app-with-compose}
@z

@x
From your project directory, type `docker compose watch` or `docker compose up --watch` to build and launch the app and start the file watch mode.
@y
From your project directory, type `docker compose watch` or `docker compose up --watch` to build and launch the app and start the file watch mode.
@z

% snip command...

@x
Check the `Hello World` message in a web browser again, and refresh to see the
count increment.
@y
Check the `Hello World` message in a web browser again, and refresh to see the
count increment.
@z

@x
## Step 6: Update the application
@y
## 手順 6: アプリケーションのアップデート {#step-6-update-the-application}
@z

@x
To see Compose Watch in action:
@y
To see Compose Watch in action:
@z

@x
1. Change the greeting in `app.py` and save it. For example, change the `Hello World!`
message to `Hello from Docker!`:
@y
1. Change the greeting in `app.py` and save it. For example, change the `Hello World!`
message to `Hello from Docker!`:
@z

@x
   ```python
   return 'Hello from Docker! I have been seen {} times.\n'.format(count)
   ```
@y
   ```python
   return 'Hello from Docker! I have been seen {} times.\n'.format(count)
   ```
@z

@x
2. Refresh the app in your browser. The greeting should be updated, and the
counter should still be incrementing.
@y
2. Refresh the app in your browser. The greeting should be updated, and the
counter should still be incrementing.
@z

@x
   ![hello world in browser](images/quick-hello-world-3.png)
@y
   ![hello world in browser](images/quick-hello-world-3.png)
@z

@x
3. Once you're done, run `docker compose down`.
@y
3. Once you're done, run `docker compose down`.
@z

@x
## Step 7: Split up your services
@y
## 手順 7: サービスの分割 {#step-7-split-up-your-services}
@z

@x
Using multiple Compose files lets you customize a Compose application for different environments or workflows. This is useful for large applications that may use dozens of containers, with ownership distributed across multiple teams. 
@y
Using multiple Compose files lets you customize a Compose application for different environments or workflows. This is useful for large applications that may use dozens of containers, with ownership distributed across multiple teams. 
@z

@x
1. In your project folder, create a new Compose file called `infra.yaml`.
@y
1. In your project folder, create a new Compose file called `infra.yaml`.
@z

@x
2. Cut the Redis service from your `compose.yaml` file and paste it into your new `infra.yaml` file. Make sure you add the `services` top-level attribute at the top of your file. Your `infra.yaml` file should now look like this:
@y
2. Cut the Redis service from your `compose.yaml` file and paste it into your new `infra.yaml` file. Make sure you add the `services` top-level attribute at the top of your file. Your `infra.yaml` file should now look like this:
@z

% snip code...

@x
3. In your `compose.yaml` file, add the `include` top-level attribute along with the path to the `infra.yaml` file.
@y
3. In your `compose.yaml` file, add the `include` top-level attribute along with the path to the `infra.yaml` file.
@z

% snip code...

@x
4. Run `docker compose up` to build the app with the updated Compose files, and run it. You should see the `Hello world` message in your browser. 
@y
4. Run `docker compose up` to build the app with the updated Compose files, and run it. You should see the `Hello world` message in your browser. 
@z

@x
This is a simplified example, but it demonstrates the basic principle of `include` and how it can make it easier to modularize complex applications into sub-Compose files. For more information on `include` and working with multiple Compose files, see [Working with multiple Compose files](multiple-compose-files/_index.md).
@y
This is a simplified example, but it demonstrates the basic principle of `include` and how it can make it easier to modularize complex applications into sub-Compose files. For more information on `include` and working with multiple Compose files, see [Working with multiple Compose files](multiple-compose-files/_index.md).
@z

@x
## Step 8: Experiment with some other commands
@y
## 手順 8: Experiment with some other commands {#step-8-experiment-with-some-other-commands}
@z

@x
- If you want to run your services in the background, you can pass the `-d` flag (for "detached" mode) to `docker compose up` and use `docker compose ps` to see what is currently running:
@y
- If you want to run your services in the background, you can pass the `-d` flag (for "detached" mode) to `docker compose up` and use `docker compose ps` to see what is currently running:
@z

% snip command...

@x
- Run `docker compose --help` to see other available commands.
@y
- Run `docker compose --help` to see other available commands.
@z

@x
- If you started Compose with `docker compose up -d`, stop your services once you've finished with them:
@y
- If you started Compose with `docker compose up -d`, stop your services once you've finished with them:
@z

% snip command...

@x
- You can bring everything down, removing the containers entirely, with the `docker compose down` command. 
@y
- You can bring everything down, removing the containers entirely, with the `docker compose down` command. 
@z

@x
## Where to go next
@y
## 次に読むものは {#where-to-go-next}
@z

@x
- Try the [Sample apps with Compose](https://github.com/docker/awesome-compose)
- [Explore the full list of Compose commands](reference/index.md)
- [Explore the Compose file reference](/reference/compose-file/index.md)
- [Check out the Learning Docker Compose video on LinkedIn Learning](https://www.linkedin.com/learning/learning-docker-compose/)
@y
- Try the [Sample apps with Compose](https://github.com/docker/awesome-compose)
- [Explore the full list of Compose commands](reference/index.md)
- [Explore the Compose file reference](reference/compose-file/index.md)
- [Check out the Learning Docker Compose video on LinkedIn Learning](https://www.linkedin.com/learning/learning-docker-compose/)
@z
