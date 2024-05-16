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
1. Open your `compose.yaml` file in an IDE or text editor.
@y
1. IDE またはテキストエディターを使って `compose.yaml` ファイルを開きます。
@z

@x
2. Uncomment the database related instructions. The following is the updated
   `compose.yaml` file.
@y
2. Uncomment the database related instructions. The following is the updated
   `compose.yaml` file.
@z

@x
   > **Important**
   >
   > For this section, don't run `docker compose up` until you are instructed to. Running the command at intermediate points may incorrectly initialize your database.
   { .important }
@y
   > **Important**
   >
   > For this section, don't run `docker compose up` until you are instructed to. Running the command at intermediate points may incorrectly initialize your database.
   { .important }
@z

@x within code
   # Comments are provided throughout this file to help you get started.
   # If you need more help, visit the Docker Compose reference guide at
   # https://docs.docker.com/go/compose-spec-reference/
@y
   # Comments are provided throughout this file to help you get started.
   # If you need more help, visit the Docker Compose reference guide at
   # https://docs.docker.com/go/compose-spec-reference/
@z
@x
   # Here the instructions define your application as a service called "server".
   # This service is built from the Dockerfile in the current directory.
   # You can add other services your application may depend on here, such as a
   # database or a cache. For examples, see the Awesome Compose repository:
   # https://github.com/docker/awesome-compose
@y
   # Here the instructions define your application as a service called "server".
   # This service is built from the Dockerfile in the current directory.
   # You can add other services your application may depend on here, such as a
   # database or a cache. For examples, see the Awesome Compose repository:
   # https://github.com/docker/awesome-compose
@z
@x
   # The commented out section below is an example of how to define a PostgreSQL
   # database that your application can use. `depends_on` tells Docker Compose to
   # start the database before your application. The `db-data` volume persists the
   # database data between container restarts. The `db-password` secret is used
   # to set the database password. You must create `db/password.txt` and add
   # a password of your choosing to it before running `docker-compose up`.
@y
   # The commented out section below is an example of how to define a PostgreSQL
   # database that your application can use. `depends_on` tells Docker Compose to
   # start the database before your application. The `db-data` volume persists the
   # database data between container restarts. The `db-password` secret is used
   # to set the database password. You must create `db/password.txt` and add
   # a password of your choosing to it before running `docker-compose up`.
@z

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
3. Open `src/persistence/postgres.js` in an IDE or text editor. You'll notice
that this application uses a Postgres database and requires some environment
variables in order to connect to the database. The `compose.yaml` file doesn't
have these variables defined yet.
@y
3. Open `src/persistence/postgres.js` in an IDE or text editor. You'll notice
that this application uses a Postgres database and requires some environment
variables in order to connect to the database. The `compose.yaml` file doesn't
have these variables defined yet.
@z

@x
4. Add the environment variables that specify the database configuration. The
   following is the updated `compose.yaml` file.
@y
4. Add the environment variables that specify the database configuration. The
   following is the updated `compose.yaml` file.
@z

@x within code
   # Comments are provided throughout this file to help you get started.
   # If you need more help, visit the Docker Compose reference guide at
   # https://docs.docker.com/go/compose-spec-reference/
@y
   # Comments are provided throughout this file to help you get started.
   # If you need more help, visit the Docker Compose reference guide at
   # https://docs.docker.com/go/compose-spec-reference/
@z
@x
   # Here the instructions define your application as a service called "server".
   # This service is built from the Dockerfile in the current directory.
   # You can add other services your application may depend on here, such as a
   # database or a cache. For examples, see the Awesome Compose repository:
   # https://github.com/docker/awesome-compose
@y
   # Here the instructions define your application as a service called "server".
   # This service is built from the Dockerfile in the current directory.
   # You can add other services your application may depend on here, such as a
   # database or a cache. For examples, see the Awesome Compose repository:
   # https://github.com/docker/awesome-compose
@z
@x
   # The commented out section below is an example of how to define a PostgreSQL
   # database that your application can use. `depends_on` tells Docker Compose to
   # start the database before your application. The `db-data` volume persists the
   # database data between container restarts. The `db-password` secret is used
   # to set the database password. You must create `db/password.txt` and add
   # a password of your choosing to it before running `docker-compose up`.
@y
   # The commented out section below is an example of how to define a PostgreSQL
   # database that your application can use. `depends_on` tells Docker Compose to
   # start the database before your application. The `db-data` volume persists the
   # database data between container restarts. The `db-password` secret is used
   # to set the database password. You must create `db/password.txt` and add
   # a password of your choosing to it before running `docker-compose up`.
@z

@x
5. Add the `secrets` section under the `server` service so that your application securely handles the database password. The following is the updated `compose.yaml` file.
@y
5. Add the `secrets` section under the `server` service so that your application securely handles the database password. The following is the updated `compose.yaml` file.
@z

@x within code
   # Comments are provided throughout this file to help you get started.
   # If you need more help, visit the Docker Compose reference guide at
   # https://docs.docker.com/go/compose-spec-reference/
@y
   # Comments are provided throughout this file to help you get started.
   # If you need more help, visit the Docker Compose reference guide at
   # https://docs.docker.com/go/compose-spec-reference/
@z
@x
   # Here the instructions define your application as a service called "server".
   # This service is built from the Dockerfile in the current directory.
   # You can add other services your application may depend on here, such as a
   # database or a cache. For examples, see the Awesome Compose repository:
   # https://github.com/docker/awesome-compose
@y
   # Here the instructions define your application as a service called "server".
   # This service is built from the Dockerfile in the current directory.
   # You can add other services your application may depend on here, such as a
   # database or a cache. For examples, see the Awesome Compose repository:
   # https://github.com/docker/awesome-compose
@z
@x
   # The commented out section below is an example of how to define a PostgreSQL
   # database that your application can use. `depends_on` tells Docker Compose to
   # start the database before your application. The `db-data` volume persists the
   # database data between container restarts. The `db-password` secret is used
   # to set the database password. You must create `db/password.txt` and add
   # a password of your choosing to it before running `docker-compose up`.
@y
   # The commented out section below is an example of how to define a PostgreSQL
   # database that your application can use. `depends_on` tells Docker Compose to
   # start the database before your application. The `db-data` volume persists the
   # database data between container restarts. The `db-password` secret is used
   # to set the database password. You must create `db/password.txt` and add
   # a password of your choosing to it before running `docker-compose up`.
@z

@x
6. In the `docker-nodejs-sample` directory, create a directory named `db`.
@y
6. In the `docker-nodejs-sample` directory, create a directory named `db`.
@z

@x
7. In the `db` directory, create a file named `password.txt`. This file will
   contain your database password.
@y
7. In the `db` directory, create a file named `password.txt`. This file will
   contain your database password.
@z

@x
   You should now have at least the following contents in your
   `docker-nodejs-sample` directory.
@y
   You should now have at least the following contents in your
   `docker-nodejs-sample` directory.
@z

% snip text...

@x
8. Open the `password.txt` file in an IDE or text editor, and specify a password
   of your choice. Your password must be on a single line with no additional
   lines. Ensure that the file doesn't contain any newline characters or other
   hidden characters.
@y
8. Open the `password.txt` file in an IDE or text editor, and specify a password
   of your choice. Your password must be on a single line with no additional
   lines. Ensure that the file doesn't contain any newline characters or other
   hidden characters.
@z

@x
9. Ensure that you save your changes to all the files that you have modified.
@y
9. Ensure that you save your changes to all the files that you have modified.
@z

@x
10. Run the following command to start your application.
@y
10. Run the following command to start your application.
@z

% snip command...

@x
11. Open a browser and verify that the application is running at
    [http://localhost:3000](http://localhost:3000).
@y
11. Open a browser and verify that the application is running at
    [http://localhost:3000](http://localhost:3000).
@z

@x
12. Add some items to the todo list to test data persistence.
@y
12. Add some items to the todo list to test data persistence.
@z

@x
13. After adding some items to the todo list, press `ctrl+c` in the terminal to
    stop your application.
@y
13. After adding some items to the todo list, press `ctrl+c` in the terminal to
    stop your application.
@z

@x
14. In the terminal, run `docker compose rm` to remove your containers.
@y
14. In the terminal, run `docker compose rm` to remove your containers.
@z

% snip command...

@x
15. Run `docker compose up` to run your application again.
@y
15. Run `docker compose up` to run your application again.
@z

% snip command...

@x
16. Refresh [http://localhost:3000](http://localhost:3000) in your browser and verify that the todo items persisted, even after the containers were removed and ran again.
@y
16. Refresh [http://localhost:3000](http://localhost:3000) in your browser and verify that the todo items persisted, even after the containers were removed and ran again.
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
The following is the updated Compose file. All comments have been removed.
@y
The following is the updated Compose file. All comments have been removed.
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
