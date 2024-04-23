%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応。

@x
title: Use containers for Node.js development
keywords: node, node.js, development
description: Learn how to develop your Node.js application locally using containers.
@y
title: コンテナーを利用した Node.js 開発
keywords: node, node.js, development
description: Learn how to develop your Node.js application locally using containers.
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
Complete [Containerize a Node.js application](containerize.md).
@y
[Node.js アプリケーションのコンテナー化](containerize.md) を完了していること。
@z

@x
## Overview
@y
## 概要 {#overview}
@z

@x
In this section, you'll learn how to set up a development environment for your containerized application. This includes:
 - Adding a local database and persisting data
 - Configuring your container to run a development environment
 - Debugging your containerized application
@y
本節ではコンテナー化したアプリケーションに対する開発環境の構築方法を学びます。
ここでは以下を行います。
 - ローカルデータベースを追加して、そのデータを維持します。
 - 開発環境として実行するためにコンテナー設定を行います。
 - コンテナー化したアプリケーションのデバッグを行います。
@z

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
Open the `compose.yaml` file in an IDE or text editor. You'll notice it
already contains commented-out instructions for a Postgres database and volume.
@y
IDE またはテキストエディターを使って `compose.yaml` ファイルを開きます。
中身を見ればわかりますが、そこには Postgres データベースとボリュームに関する命令がコメントアウトされているはずです。
@z

@x
Open `src/persistence/postgres.js` in an IDE or text editor. You'll notice that
this application uses a Postgres database and requires some environment
variables in order to connect to the database. The `compose.yaml` file doesn't
have these variables defined.
@y
Open `src/persistence/postgres.js` in an IDE or text editor. You'll notice that
this application uses a Postgres database and requires some environment
variables in order to connect to the database. The `compose.yaml` file doesn't
have these variables defined.
@z

@x
You need to update the following items in the `compose.yaml` file:
 - Uncomment all of the database instructions.
 - Add the environment variables under the server service.
 - Add `secrets` to the server service for the database password.
@y
You need to update the following items in the `compose.yaml` file:
 - Uncomment all of the database instructions.
 - Add the environment variables under the server service.
 - Add `secrets` to the server service for the database password.
@z

@x
The following is the updated `compose.yaml` file.
@y
The following is the updated `compose.yaml` file.
@z

% snip code...

@x
> **Note**
>
> To learn more about the instructions in the Compose file, see [Compose file
> reference](/compose/compose-file/).
@y
> **Note**
>
> To learn more about the instructions in the Compose file, see [Compose file
> reference](__SUBDIR__/compose/compose-file/).
@z

@x
Before you run the application using Compose, notice that this Compose file uses
`secrets` and specifies a `password.txt` file to hold the database's password.
You must create this file as it's not included in the source repository.
@y
Before you run the application using Compose, notice that this Compose file uses
`secrets` and specifies a `password.txt` file to hold the database's password.
You must create this file as it's not included in the source repository.
@z

@x
In the cloned repository's directory, create a new directory named `db`. Inside the `db` directory, create a file named `password.txt`. Open `password.txt` in an IDE or text editor and add a password of your choice. The password must be on a single line with no additional lines in the file.
@y
In the cloned repository's directory, create a new directory named `db`. Inside the `db` directory, create a file named `password.txt`. Open `password.txt` in an IDE or text editor and add a password of your choice. The password must be on a single line with no additional lines in the file.
@z

@x
You should now have the following contents in your `docker-nodejs-sample`
directory.
@y
You should now have the following contents in your `docker-nodejs-sample`
directory.
@z

@x
```text
├── docker-nodejs-sample/
│ ├── db/
│ │ └── password.txt
│ ├── spec/
│ ├── src/
│ ├── .dockerignore
│ ├── .gitignore
│ ├── compose.yaml
│ ├── Dockerfile
│ ├── package-lock.json
│ ├── package.json
│ ├── README.Docker.md
│ └── README.md
```
@y
```text
├── docker-nodejs-sample/
│ ├── db/
│ │ └── password.txt
│ ├── spec/
│ ├── src/
│ ├── .dockerignore
│ ├── .gitignore
│ ├── compose.yaml
│ ├── Dockerfile
│ ├── package-lock.json
│ ├── package.json
│ ├── README.Docker.md
│ └── README.md
```
@z

@x
Run the following command to start your application.
@y
Run the following command to start your application.
@z

% snip command...

@x
Open a browser and verify that the application is running at [http://localhost:3000](http://localhost:3000).
@y
Open a browser and verify that the application is running at [http://localhost:3000](http://localhost:3000).
@z

@x
Add some items to the todo list to test data persistence.
@y
Add some items to the todo list to test data persistence.
@z

@x
After adding some items to the todo list, press `ctrl+c` in the terminal to stop your application.
@y
After adding some items to the todo list, press `ctrl+c` in the terminal to stop your application.
@z

@x
In the terminal, run `docker compose rm` to remove your containers and then run `docker compose up` to run your application again.
@y
In the terminal, run `docker compose rm` to remove your containers and then run `docker compose up` to run your application again.
@z

% snip command...

@x
Refresh [http://localhost:3000](http://localhost:3000) in your browser and verify that the todo items persisted, even after the containers were removed and ran again.
@y
Refresh [http://localhost:3000](http://localhost:3000) in your browser and verify that the todo items persisted, even after the containers were removed and ran again.
@z

@x
## Configure and run a development container
@y
## Configure and run a development container
@z

@x
You can use a bind mount to mount your source code into the container. The container can then see the changes you make to the code immediately, as soon as you save a file. This means that you can run processes, like nodemon, in the container that watch for filesystem changes and respond to them. To learn more about bind mounts, see [Storage overview](../../storage/index.md).
@y
You can use a bind mount to mount your source code into the container. The container can then see the changes you make to the code immediately, as soon as you save a file. This means that you can run processes, like nodemon, in the container that watch for filesystem changes and respond to them. To learn more about bind mounts, see [Storage overview](../../storage/index.md).
@z

@x
In addition to adding a bind mount, you can configure your Dockerfile and `compose.yaml` file to install development dependencies and run development tools.
@y
In addition to adding a bind mount, you can configure your Dockerfile and `compose.yaml` file to install development dependencies and run development tools.
@z

@x
### Update your Dockerfile for development
@y
### Update your Dockerfile for development
@z

@x
Open the Dockerfile in an IDE or text editor. Note that the Dockerfile doesn't
install development dependencies and doesn't run nodemon. You'll
need to update your Dockerfile to install the development dependencies and run
nodemon.
@y
Open the Dockerfile in an IDE or text editor. Note that the Dockerfile doesn't
install development dependencies and doesn't run nodemon. You'll
need to update your Dockerfile to install the development dependencies and run
nodemon.
@z

@x
Rather than creating one Dockerfile for production, and another Dockerfile for
development, you can use one multi-stage Dockerfile for both.
@y
Rather than creating one Dockerfile for production, and another Dockerfile for
development, you can use one multi-stage Dockerfile for both.
@z

@x
Update your Dockerfile to the following multi-stage Dockerfile.
@y
Update your Dockerfile to the following multi-stage Dockerfile.
@z

% snip code...

@x
In the Dockerfile, you first add a label `as base` to the `FROM
node:${NODE_VERSION}-alpine` statement. This lets you refer to this build stage
in other build stages. Next, you add a new build stage labeled `dev` to install
your development dependencies and start the container using `npm run dev`.
Finally, you add a stage labeled `prod` that omits the dev dependencies and runs
your application using `node src/index.js`. To learn more about multi-stage
builds, see [Multi-stage builds](../../build/building/multi-stage.md).
@y
In the Dockerfile, you first add a label `as base` to the `FROM
node:${NODE_VERSION}-alpine` statement. This lets you refer to this build stage
in other build stages. Next, you add a new build stage labeled `dev` to install
your development dependencies and start the container using `npm run dev`.
Finally, you add a stage labeled `prod` that omits the dev dependencies and runs
your application using `node src/index.js`. To learn more about multi-stage
builds, see [Multi-stage builds](../../build/building/multi-stage.md).
@z

@x
Next, you'll need to update your Compose file to use the new stage.
@y
Next, you'll need to update your Compose file to use the new stage.
@z

@x
### Update your Compose file for development
@y
### Update your Compose file for development
@z

@x
To run the `dev` stage with Compose, you need to update your `compose.yaml`
file. Open your `compose.yaml` file in an IDE or text editor, and then add the
`target: dev` instruction to target the `dev` stage from your multi-stage
Dockerfile.
@y
To run the `dev` stage with Compose, you need to update your `compose.yaml`
file. Open your `compose.yaml` file in an IDE or text editor, and then add the
`target: dev` instruction to target the `dev` stage from your multi-stage
Dockerfile.
@z

@x
Also, add a new volume to the server service for the bind mount. For this application, you'll mount `./src` from your local machine to `/usr/src/app/src` in the container.
@y
Also, add a new volume to the server service for the bind mount. For this application, you'll mount `./src` from your local machine to `/usr/src/app/src` in the container.
@z

@x
Lastly, publish port `9229` for debugging.
@y
Lastly, publish port `9229` for debugging.
@z

@x
The following is the updated Compose file.
@y
The following is the updated Compose file.
@z

% snip code...

@x
### Run your development container and debug your application
@y
### Run your development container and debug your application
@z

@x
Run the following command to run your application with the new changes to the `Dockerfile` and `compose.yaml` file.
@y
Run the following command to run your application with the new changes to the `Dockerfile` and `compose.yaml` file.
@z

@x
```console
$ docker compose up --build
```
@y
```console
$ docker compose up --build
```
@z

@x
Open a browser and verify that the application is running at [http://localhost:3000](http://localhost:3000).
@y
Open a browser and verify that the application is running at [http://localhost:3000](http://localhost:3000).
@z

@x
Any changes to the application's source files on your local machine will now be
immediately reflected in the running container.
@y
Any changes to the application's source files on your local machine will now be
immediately reflected in the running container.
@z

@x
Open `docker-nodejs-sample/src/static/js/app.js` in an IDE or text editor and update the button text on line 109 from `Add Item` to `Add`.
@y
Open `docker-nodejs-sample/src/static/js/app.js` in an IDE or text editor and update the button text on line 109 from `Add Item` to `Add`.
@z

@x
```diff
+                         {submitting ? 'Adding...' : 'Add'}
-                         {submitting ? 'Adding...' : 'Add Item'}
```
@y
```diff
+                         {submitting ? 'Adding...' : 'Add'}
-                         {submitting ? 'Adding...' : 'Add Item'}
```
@z

@x
Refresh [http://localhost:3000](http://localhost:3000) in your browser and verify that the updated text appears.
@y
Refresh [http://localhost:3000](http://localhost:3000) in your browser and verify that the updated text appears.
@z

@x
You can now connect an inspector client to your application for debugging. For
more details about inspector clients, see the [Node.js
documentation](https://nodejs.org/en/docs/guides/debugging-getting-started).
@y
You can now connect an inspector client to your application for debugging. For
more details about inspector clients, see the [Node.js
documentation](https://nodejs.org/en/docs/guides/debugging-getting-started).
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you took a look at setting up your Compose file to add a mock
database and persist data. You also learned how to create a multi-stage
Dockerfile and set up a bind mount for development.
@y
In this section, you took a look at setting up your Compose file to add a mock
database and persist data. You also learned how to create a multi-stage
Dockerfile and set up a bind mount for development.
@z

@x
Related information:
 - [Volumes top-level element](/compose/compose-file/07-volumes/)
 - [Services top-level element](/compose/compose-file/05-services/)
 - [Multi-stage builds](../../build/building/multi-stage.md)
@y
Related information:
 - [Volumes top-level element](__SUBDIR__/compose/compose-file/07-volumes/)
 - [Services top-level element](__SUBDIR__/compose/compose-file/05-services/)
 - [Multi-stage builds](../../build/building/multi-stage.md)
@z

@x
## Next steps
@y
## Next steps
@z

@x
In the next section, you'll learn how to run unit tests using Docker.
@y
In the next section, you'll learn how to run unit tests using Docker.
@z

@x
{{< button text="Run your tests" url="run-tests.md" >}}
@y
{{< button text="Run your tests" url="run-tests.md" >}}
@z
