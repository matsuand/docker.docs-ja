%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

@x
description: Follow this hands-on tutorial to learn how to use Docker Compose from defining application
  dependencies to experimenting with commands.
keywords: docker compose example, docker compose tutorial, how to use docker compose,
  running docker compose, how to run docker compose, docker compose build image, docker
  compose command example, run docker compose file, how to create a docker compose
  file, run a docker compose file
@y
description: Follow this hands-on tutorial to learn how to use Docker Compose from defining application
  dependencies to experimenting with commands.
keywords: docker compose example, docker compose tutorial, how to use docker compose,
  running docker compose, how to run docker compose, docker compose build image, docker
  compose command example, run docker compose file, how to create a docker compose
  file, run a docker compose file
@z

@x
title: Docker Compose Quickstart
linkTitle: Quickstart
@y
title: Docker Compose クィックスタート
linkTitle: クィックスタート
@z

@x
This tutorial aims to introduce fundamental concepts of Docker Compose by guiding you through the development of a basic Python web application. 
@y
このチュートリアルでは Docker Compose の基本的な考え方について説明します。
簡単な Python ウェブアプリケーションの開発を通じてガイドを進めていきます。
@z

@x
Using the Flask framework, the application features a hit counter in Redis, providing a practical example of how Docker Compose can be applied in web development scenarios. The concepts demonstrated here should be understandable even if you're not familiar with Python.
@y
このアプリケーションは Flask フレームワークを利用し Redis によりアクセスカウンターを管理します。
このアプリを通じて Docker Compose をウェブ開発シーンにどのように適用するのか、という実践的な例を示すものです。
ここで示す考え方は Python に不慣れな方でも理解できるようにしています。
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
- [Installed the latest version of Docker Compose](/manuals/compose/install/_index.md)
- A basic understanding of Docker concepts and how Docker works
@y
- [Docker Compose の最新版をインストールしていること](manuals/compose/install/_index.md)
- Docker の考え方や Docker がどのようにして動作しているのかの基本を理解していること
@z

@x
## Step 1: Set up the project
@y
## 手順 1: プロジェクトのセットアップ {#step-1-set-up-the-project}
@z

@x
1. Create a directory for the project:
@y
1. プロジェクト用のディレクトリを生成します。
@z

% snip command...

@x
2. Create `app.py` in your project directory and add the following:
@y
2. プロジェクトディレクトリ内に `app.py` というファイルを生成して、以下のコードを記述します。
@z

% snip code...

@x
   The app reads its Redis connection details from environment variables, with sensible defaults so it works out of the box.
@y
   The app reads its Redis connection details from environment variables, with sensible defaults so it works out of the box.
@z

@x
3. Create `requirements.txt` in your project directory and add the following:
@y
3. プロジェクト用のディレクトリに `requirements.txt` というファイルを作成し、次のコードを記述します。
@z

% snip text...

@x
4. Create a `Dockerfile`:
@y
4. 以下のような `Dockerfile` を生成します。
@z

% snip code...

@x
   > [!IMPORTANT]
   >
   > Make sure the file is named `Dockerfile` with no extension. Some editors add `.txt`
   > automatically, which causes the build to fail.
@y
   > [!IMPORTANT]
   >
   > Make sure the file is named `Dockerfile` with no extension. Some editors add `.txt`
   > automatically, which causes the build to fail.
@z

@x
   For more information on how to write Dockerfiles, see the [Dockerfile reference](/reference/dockerfile/).
@y
   For more information on how to write Dockerfiles, see the [Dockerfile reference](/reference/dockerfile/).
@z

@x
5. Create a `.env` file to hold configuration values:
@y
5. Create a `.env` file to hold configuration values:
@z

% snip text...

@x
   Compose automatically reads `.env` and makes these values available for interpolation
   in your `compose.yaml`. For this example the gains are modest, but in practice,
   keeping configuration out of the Compose file makes it easier to:
   - Change values across environments without editing YAML
   - Avoid committing secrets to version control
   - Reuse values across multiple services
@y
   Compose automatically reads `.env` and makes these values available for interpolation
   in your `compose.yaml`. For this example the gains are modest, but in practice,
   keeping configuration out of the Compose file makes it easier to:
   - Change values across environments without editing YAML
   - Avoid committing secrets to version control
   - Reuse values across multiple services
@z

@x
6. Create a `.dockerignore` file to keep unnecessary files out of your build context:
@y
6. Create a `.dockerignore` file to keep unnecessary files out of your build context:
@z

% snip text...

@x
   Docker sends everything in your project directory to the daemon when it builds an image.
   Without `.dockerignore`, that includes your `.env` file (which may contain secrets) and
   any cached Python bytecode. Excluding them keeps builds fast and avoids accidentally
   baking sensitive values into an image layer.
@y
   Docker sends everything in your project directory to the daemon when it builds an image.
   Without `.dockerignore`, that includes your `.env` file (which may contain secrets) and
   any cached Python bytecode. Excluding them keeps builds fast and avoids accidentally
   baking sensitive values into an image layer.
@z

@x
## Step 2: Define and start your services
@y
## 手順 2: サービスの定義と起動 {#step-2-define-and-start-your-services}
@z

@x
Compose simplifies the control of your entire application stack, making it easy to manage services, networks, and volumes in a single YAML configuration file.
@y
Compose はアプリケーションスタック全体の制御を単純化します。
つまりサービス、ネットワーク、ボリュームをただ一つの YAML 設定ファイルを使って管理できます。
@z

@x
1. Create `compose.yaml` in your project directory and paste the following:
@y
1. プロジェクト用のディレクトリ内で `compose.yaml` ファイルを作成し、次の内容にします。
@z

% snip code...

@x
   This Compose file defines two services:
@y
   This Compose file defines two services:
@z

@x
   - The `web` service uses an image that's built from the `Dockerfile` in the current directory. It maps port `8000` on the host to port `5000` on the container where Flask listens by default.
@y
   - `web` サービスは、カレントディレクトリ内の `Dockerfile` からビルドされたイメージを利用します。
     そしてホスト上のポート `8000` をコンテナー上のポート `5000` にマッピングします。
     これはデフォルトで Flask が利用するポートです。
@z

@x
   - The `redis` service uses a public [Redis](https://registry.hub.docker.com/_/redis/) image pulled from the Docker Hub registry.
@y
   - `redis` サービスには Docker Hub レジストリに公開されている [Redis](https://registry.hub.docker.com/_/redis/) イメージを取得して利用します。
@z

@x
   For more information on the `compose.yaml` file, see [How Compose works](compose-application-model.md).
@y
   `compose.yaml` ファイルの詳細については [Compose はどのように動作するか](manuals/compose/intro/compose-application-model.md) を参照してください。
@z

@x
2. Start up your application: 
@y
2. Start up your application: 
@z

% snip command...

@x
   With a single command, you create and start all the services from your configuration file. Compose builds your web image, pulls the Redis image, and starts both containers. 
@y
   With a single command, you create and start all the services from your configuration file. Compose builds your web image, pulls the Redis image, and starts both containers. 
@z

@x
3. Open `http://localhost:8000`. You should see:
@y
3. `http://localhost:8000` を開きます。
   以下のような結果が得られます。
@z

% snip output...

@x
   Refresh the page — the counter increments on each visit.
@y
   ページを表示更新します。
   カウンターが更新されたはずです。
@z

@x
   This minimal setup works, but it has two problems you'll fix in the next steps:
@y
   This minimal setup works, but it has two problems you'll fix in the next steps:
@z

@x
   - Startup race: `web` starts at the same time as `redis`. If Redis isn't ready yet,
   the Flask app fails to connect and crashes.
   - No persistence: If you run `docker compose down` followed by `docker compose up`, the
   counter resets to zero. `docker compose down` removes the containers, and with them
   any data written to the container's writable layer. `docker compose stop` preserves
   the containers so data survives, but you can't rely on that in production where
   containers are regularly replaced.
@y
   - Startup race: `web` starts at the same time as `redis`. If Redis isn't ready yet,
   the Flask app fails to connect and crashes.
   - No persistence: If you run `docker compose down` followed by `docker compose up`, the
   counter resets to zero. `docker compose down` removes the containers, and with them
   any data written to the container's writable layer. `docker compose stop` preserves
   the containers so data survives, but you can't rely on that in production where
   containers are regularly replaced.
@z

@x
4. Stop the stack before moving on:
@y
4. Stop the stack before moving on:
@z

% snip command...

@x
## Step 3: Fix the startup race with health checks
@y
## Step 3: Fix the startup race with health checks
@z

@x
To fix the startup race, Compose needs to wait until `redis` is confirmed healthy before
starting `web`.
@y
To fix the startup race, Compose needs to wait until `redis` is confirmed healthy before
starting `web`.
@z

@x
1. Update `compose.yaml`:
@y
1. Update `compose.yaml`:
@z

% snip code...

@x
   The `healthcheck` block tells Compose how to test whether Redis is ready:
@y
   The `healthcheck` block tells Compose how to test whether Redis is ready:
@z

@x
   - `test` is the command Compose runs inside the container to check its health.
     `redis-cli ping` connects to Redis and expects a `PONG` response — if it gets one,
     the container is healthy.
   - `start_period` gives Redis 10 seconds to initialize before health checks begin.
     Any failures during this window don't count toward the retry limit.
   - `interval` runs the check every 5 seconds after the start period has elapsed.
   - `timeout` gives each check 3 seconds to respond before treating it as a failure.
   - `retries` sets how many consecutive failures are allowed before Compose marks the
     container as unhealthy. With `interval: 5s` and `retries: 5`, Compose will wait up
     to 25 seconds before giving up.
@y
   - `test` is the command Compose runs inside the container to check its health.
     `redis-cli ping` connects to Redis and expects a `PONG` response — if it gets one,
     the container is healthy.
   - `start_period` gives Redis 10 seconds to initialize before health checks begin.
     Any failures during this window don't count toward the retry limit.
   - `interval` runs the check every 5 seconds after the start period has elapsed.
   - `timeout` gives each check 3 seconds to respond before treating it as a failure.
   - `retries` sets how many consecutive failures are allowed before Compose marks the
     container as unhealthy. With `interval: 5s` and `retries: 5`, Compose will wait up
     to 25 seconds before giving up.
@z

@x
2. Start the stack to confirm the ordering is fixed:
@y
2. Start the stack to confirm the ordering is fixed:
@z

% snip command...

@x
   You should see something similar to:
@y
   You should see something similar to:
@z

% snip output...

@x
3. Open `http://localhost:8000` to confirm the app is still working, then stop the stack before moving on:
@y
3. Open `http://localhost:8000` to confirm the app is still working, then stop the stack before moving on:
@z

% snip command...

@x
## Step 4: Enable Compose Watch for live updates
@y
## Step 4: Enable Compose Watch for live updates
@z

@x
Without Compose Watch, every code change requires you to stop the stack, rebuild the image, and restart the containers. Compose Watch eliminates that cycle by automatically syncing changes into your running container as you save files.
@y
Without Compose Watch, every code change requires you to stop the stack, rebuild the image, and restart the containers. Compose Watch eliminates that cycle by automatically syncing changes into your running container as you save files.
@z

@x
1. Update `compose.yaml` to add the `develop.watch` block to the `web` service:
@y
1. Update `compose.yaml` to add the `develop.watch` block to the `web` service:
@z

% snip code...

@x
   The `watch` block defines two rules:
   - The `sync+restart` action watches your project directory (`.`) on the host. When a file changes, Compose copies any changed files into `/code` inside the running container, then restarts the container. Because the container restarts with the updated files already in place, Flask starts up reading the new code directly — no manual rebuild or restart needed. 
   - The `rebuild` action on `requirements.txt` triggers a full image rebuild whenever you add a new dependency, since installing packages requires rebuilding the image, not just syncing files.
@y
   The `watch` block defines two rules:
   - The `sync+restart` action watches your project directory (`.`) on the host. When a file changes, Compose copies any changed files into `/code` inside the running container, then restarts the container. Because the container restarts with the updated files already in place, Flask starts up reading the new code directly — no manual rebuild or restart needed. 
   - The `rebuild` action on `requirements.txt` triggers a full image rebuild whenever you add a new dependency, since installing packages requires rebuilding the image, not just syncing files.
@z

@x
2. Start the stack with Watch enabled:
@y
2. Start the stack with Watch enabled:
@z

% snip command...

@x
3. Make a live change. Open `app.py` and update the greeting:
@y
3. Make a live change. Open `app.py` and update the greeting:
@z

% snip code...

@x
4. Save the file. Compose Watch detects the change and syncs it immediately:
@y
4. Save the file. Compose Watch detects the change and syncs it immediately:
@z

% snip output...

@x
5. Refresh `http://localhost:8000`. The updated greeting appears without any restart
   and the counter should still be incrementing.
@y
5. Refresh `http://localhost:8000`. The updated greeting appears without any restart
   and the counter should still be incrementing.
@z

@x
6. Stop the stack before moving on:
@y
6. Stop the stack before moving on:
@z

% snip command...

@x
   For more information on how Compose Watch works, see [Use Compose Watch](/manuals/compose/how-tos/file-watch.md).
@y
   For more information on how Compose Watch works, see [Use Compose Watch](/manuals/compose/how-tos/file-watch.md).
@z

@x
## Step 5: Persist data with named volumes
@y
## Step 5: Persist data with named volumes
@z

@x
Each time you stop and restart the stack the visit counter resets to zero. Redis data
lives inside the container, so it disappears when the container is removed. A named
volume fixes this by storing the data on the host, outside the container lifecycle.
@y
Each time you stop and restart the stack the visit counter resets to zero. Redis data
lives inside the container, so it disappears when the container is removed. A named
volume fixes this by storing the data on the host, outside the container lifecycle.
@z

@x
1. Update `compose.yaml`:
@y
1. Update `compose.yaml`:
@z

% snip code...

@x
   The `redis-data:/data` entry under `redis.volumes` mounts the named volume at `/data`, the path where Redis
   writes its data files. The top-level `volumes` key registers it with Docker so it
   persists between `compose down` and `compose up` cycles.
@y
   The `redis-data:/data` entry under `redis.volumes` mounts the named volume at `/data`, the path where Redis
   writes its data files. The top-level `volumes` key registers it with Docker so it
   persists between `compose down` and `compose up` cycles.
@z

@x
2. Start the stack with `docker compose up --watch` and refresh `http://localhost:8000` a few times to build up a count.
@y
2. Start the stack with `docker compose up --watch` and refresh `http://localhost:8000` a few times to build up a count.
@z

@x
3. Tear down the stack with `docker compose down` and then bring it back up again with `docker compose up --watch`.
@y
3. Tear down the stack with `docker compose down` and then bring it back up again with `docker compose up --watch`.
@z

@x
4. Open `http://localhost:8000` — the counter continues from where it left off.
@y
4. Open `http://localhost:8000` — the counter continues from where it left off.
@z

@x
5. Now reset the counter with `docker compose down -v`. 
@y
5. Now reset the counter with `docker compose down -v`. 
@z

@x
   The `-v` flag removes named volumes along with the containers. Use this intentionally — it permanently deletes the stored data.
@y
   The `-v` flag removes named volumes along with the containers. Use this intentionally — it permanently deletes the stored data.
@z

@x
## Step 6: Structure your project with multiple Compose files
@y
## Step 6: Structure your project with multiple Compose files
@z

@x
As applications grow, a single `compose.yaml` becomes harder to maintain. The `include`
top-level element lets you split services across multiple files while keeping them part of the
same application.
@y
As applications grow, a single `compose.yaml` becomes harder to maintain. The `include`
top-level element lets you split services across multiple files while keeping them part of the
same application.
@z

@x
This is especially useful when different teams own different parts of the stack, or when
you want to reuse infrastructure definitions across projects.
@y
This is especially useful when different teams own different parts of the stack, or when
you want to reuse infrastructure definitions across projects.
@z

@x
1. Create a new file in your project directory called `infra.yaml` and move the Redis service and volume into it:
@y
1. Create a new file in your project directory called `infra.yaml` and move the Redis service and volume into it:
@z

% snip code...

@x
2. Update `compose.yaml` to include `infra.yaml`:
@y
2. Update `compose.yaml` to include `infra.yaml`:
@z

% snip code...

@x
3. Run the application to confirm everything still works:
@y
3. Run the application to confirm everything still works:
@z

% snip command...

@x
   Compose merges both files at startup. The `web` service can still reference `redis`
   by name because all included services share the same default network.
@y
   Compose merges both files at startup. The `web` service can still reference `redis`
   by name because all included services share the same default network.
@z

@x
   This is a simplified example, but it demonstrates the basic principle of `include` and how it can make it easier to modularize complex applications into sub-Compose files. For more information on `include` and working with multiple Compose files, see [Working with multiple Compose files](/manuals/compose/how-tos/multiple-compose-files/_index.md).
@y
   This is a simplified example, but it demonstrates the basic principle of `include` and how it can make it easier to modularize complex applications into sub-Compose files. For more information on `include` and working with multiple Compose files, see [Working with multiple Compose files](/manuals/compose/how-tos/multiple-compose-files/_index.md).
@z

@x
4. Stop the stack before moving on:
@y
4. Stop the stack before moving on:
@z

% snip command...

@x
## Step 7: Inspect and debug your running stack
@y
## Step 7: Inspect and debug your running stack
@z

@x
With a fully configured stack, you can observe what's happening inside your containers
without stopping anything. This step covers the core commands for inspecting the resolved configuration, streaming logs, and running commands
inside a running container.
@y
With a fully configured stack, you can observe what's happening inside your containers
without stopping anything. This step covers the core commands for inspecting the resolved configuration, streaming logs, and running commands
inside a running container.
@z

@x
Before starting the stack, verify that Compose has resolved your `.env` variables and
merged all files correctly:
@y
Before starting the stack, verify that Compose has resolved your `.env` variables and
merged all files correctly:
@z

% snip command...

@x
`docker compose config` doesn't require the stack to be running — it works purely from
your files. A few things worth noting in the output:
@y
`docker compose config` doesn't require the stack to be running — it works purely from
your files. A few things worth noting in the output:
@z

@x
- `${APP_PORT}`, `${REDIS_HOST}`, and `${REDIS_PORT}` have all been replaced with the
  values from your `.env` file.
- Short-form port notation (`"8000:5000"`) is expanded into its canonical fields
  (`target`, `published`, `protocol`).
- The default network and volume names are made explicit, prefixed with the project name
  `compose-demo`.
- The output is the fully resolved configuration, with any files
  brought in via `include` merged into a single view.
@y
- `${APP_PORT}`, `${REDIS_HOST}`, and `${REDIS_PORT}` have all been replaced with the
  values from your `.env` file.
- Short-form port notation (`"8000:5000"`) is expanded into its canonical fields
  (`target`, `published`, `protocol`).
- The default network and volume names are made explicit, prefixed with the project name
  `compose-demo`.
- The output is the fully resolved configuration, with any files
  brought in via `include` merged into a single view.
@z

@x
Use `docker compose config` any time you want to confirm what Compose will actually
apply, especially when debugging variable substitution or working with multiple Compose files.
@y
Use `docker compose config` any time you want to confirm what Compose will actually
apply, especially when debugging variable substitution or working with multiple Compose files.
@z

@x
Now start the stack in detached mode so the terminal stays free for the commands that
follow:
@y
Now start the stack in detached mode so the terminal stays free for the commands that
follow:
@z

% snip command...

@x
### Stream logs from all services
@y
### Stream logs from all services
@z

% snip command...

@x
The `-f` flag follows the log stream in real time, interleaving output from both
containers with color-coded service name prefixes. Refresh `http://localhost:8000` a
few times and watch the Flask request logs appear. To follow logs for a single service,
pass its name:
@y
The `-f` flag follows the log stream in real time, interleaving output from both
containers with color-coded service name prefixes. Refresh `http://localhost:8000` a
few times and watch the Flask request logs appear. To follow logs for a single service,
pass its name:
@z

% snip command...

@x
Press `Ctrl+C` to stop following logs. The containers keep running.
@y
Press `Ctrl+C` to stop following logs. The containers keep running.
@z

@x
### Run commands inside a running container
@y
### Run commands inside a running container
@z

@x
`docker compose exec` runs a command inside an already-running container without
starting a new one. This is the primary tool for live debugging.
@y
`docker compose exec` runs a command inside an already-running container without
starting a new one. This is the primary tool for live debugging.
@z

@x
#### Verify environment variables are set correctly
@y
#### Verify environment variables are set correctly
@z

% snip command...
% snip text...

@x
#### Test that the `web` container can reach Redis using the service name as the hostname
@y
#### Test that the `web` container can reach Redis using the service name as the hostname
@z

% snip command...
% snip text...

@x
This uses the same `redis` library your app uses, so a `True` response confirms that
service discovery, networking, and the Redis connection are all working end to end.
@y
This uses the same `redis` library your app uses, so a `True` response confirms that
service discovery, networking, and the Redis connection are all working end to end.
@z

@x
#### Inspect the live value of the hit counter in Redis
@y
#### Inspect the live value of the hit counter in Redis
@z

% snip command...

@x
## Where to go next
@y
## 次に読むものは {#where-to-go-next}
@z

@x
- [Explore the full list of Compose commands](/reference/cli/docker/compose/)
- [Explore the Compose file reference](/reference/compose-file/_index.md)
- [Check out the Learning Docker Compose video on LinkedIn Learning](https://www.linkedin.com/learning/learning-docker-compose/)
- [Learn how to set environment variables in Compose](/compose/how-tos/environment-variables/set-environment-variables/)
- [Learn how to package and distribute your Compose app](/compose/how-tos/oci-artifact/)
@y
- [Compose コマンドの全一覧](__SUBDIR__/reference/cli/docker/compose/)
- [Compose ファイルリファレンス](reference/compose-file/_index.md)
- [Check out the Learning Docker Compose video on LinkedIn Learning](https://www.linkedin.com/learning/learning-docker-compose/)
- [Learn how to set environment variables in Compose](/compose/how-tos/environment-variables/set-environment-variables/)
- [Learn how to package and distribute your Compose app](/compose/how-tos/oci-artifact/)
@z
