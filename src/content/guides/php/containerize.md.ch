%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Containerize a PHP application
linkTitle: Containerize your app
@y
title: PHP アプリケーションのコンテナー化
linkTitle: アプリのコンテナー化
@z

@x
keywords: php, containerize, initialize, apache, composer
description: Learn how to containerize a PHP application.
@y
keywords: php, containerize, initialize, apache, composer
description: PHP アプリケーションのコンテナー化について学びます。
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
- You have installed the latest version of [Docker
  Desktop](/get-started/get-docker.md).
- You have a [git client](https://git-scm.com/downloads). The examples in this
  section use a command-line based git client, but you can use any client.
@y
- [Docker Desktop](get-started/get-docker.md) の最新バージョンをインストールしていること。
- [git クライアント](https://git-scm.com/downloads) が利用可能であること。
  本節の利用例ではコマンドラインベースの git クライアントを用いていきますが、別のクライアントを用いてもかまいません。
@z

@x
## Overview
@y
## 概要 {#overview}
@z

@x
This section walks you through containerizing and running a PHP
application.
@y
本節では PHP アプリケーションをコンテナー化して実行する手順を示していきます。
@z

@x
## Get the sample applications
@y
## サンプルアプリケーションの入手 {#get-the-sample-application}
@z

@x
In this guide, you will use a pre-built PHP application. The application uses Composer for library dependency management. You'll serve the application via an Apache web server.
@y
このガイドでは、あらかじめビルドされている PHP アプリケーションを使っていきます。
このアプリケーションは依存パッケージの管理に Composer を使っています。
アプリケーションは Apache ウェブサーバーを使って提供されます。
@z

@x
Open a terminal, change directory to a directory that you want to work in, and
run the following command to clone the repository.
@y
端末画面を開いて、作業を行うディレクトリに移動します。
そして以下のコマンドを実行してリポジトリをクローンします。
@z

% snip command...

@x
The sample application is a basic hello world application and an application that increments a counter in a database. In addition, the application uses PHPUnit for testing.
@y
サンプルアプリケーションは単純な hello world アプリケーションです。
そしてデータベース内に保存しているカウンターを加算します。
またテスト実行のため PHPUnit を用いています。
@z

@x
## Create Docker assets
@y
## Docker アセットの生成 {#create-docker-assets}
@z

@x
Now that you have an application, you can create the necessary Docker assets to
containerize it.
@y
Now that you have an application, you can create the necessary Docker assets to
containerize it.
@z

@x
> [!TIP]
>
> [Gordon](/ai/gordon/), Docker's AI assistant, can generate Docker assets for your project. Ask Gordon to create a Dockerfile, Compose file, and `.dockerignore` tailored to your application.
@y
> [!TIP]
>
> [Gordon](__SUBDIR__/ai/gordon/), Docker's AI assistant, can generate Docker assets for your project. Ask Gordon to create a Dockerfile, Compose file, and `.dockerignore` tailored to your application.
@z

@x
Create the following files in your `docker-php-sample` directory.
@y
Create the following files in your `docker-php-sample` directory.
@z

@x within code
# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/go/dockerfile-reference/
@y
# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/go/dockerfile-reference/
@z
@x
# Create a stage for installing app dependencies defined in Composer.
@y
# Create a stage for installing app dependencies defined in Composer.
@z
@x
# If your composer.json file defines scripts that run during dependency installation and
# reference your application source files, uncomment the line below to copy all the files
# into this layer.
# COPY . .
@y
# If your composer.json file defines scripts that run during dependency installation and
# reference your application source files, uncomment the line below to copy all the files
# into this layer.
# COPY . .
@z
@x
# Download dependencies as a separate step to take advantage of Docker's caching.
# Leverage a bind mounts to composer.json and composer.lock to avoid having to copy them
# into this layer.
# Leverage a cache mount to /tmp/cache so that subsequent builds don't have to re-download packages.
@y
# Download dependencies as a separate step to take advantage of Docker's caching.
# Leverage a bind mounts to composer.json and composer.lock to avoid having to copy them
# into this layer.
# Leverage a cache mount to /tmp/cache so that subsequent builds don't have to re-download packages.
@z
@x
# Create a new stage for running the application that contains the minimal
# runtime dependencies for the application. This often uses a different base
# image from the install or build stage where the necessary files are copied
# from the install stage.
#
# The example below uses the PHP Apache image as the foundation for running the app.
# By specifying the "8.2-apache" tag, it will also use whatever happens to be the
# most recent version of that tag when you build your Dockerfile.
# If reproducibility is important, consider using a specific digest SHA, like
# php@sha256:99cede493dfd88720b610eb8077c8688d3cca50003d76d1d539b0efc8cca72b4.
@y
# Create a new stage for running the application that contains the minimal
# runtime dependencies for the application. This often uses a different base
# image from the install or build stage where the necessary files are copied
# from the install stage.
#
# The example below uses the PHP Apache image as the foundation for running the app.
# By specifying the "8.2-apache" tag, it will also use whatever happens to be the
# most recent version of that tag when you build your Dockerfile.
# If reproducibility is important, consider using a specific digest SHA, like
# php@sha256:99cede493dfd88720b610eb8077c8688d3cca50003d76d1d539b0efc8cca72b4.
@z

@x
# Your PHP application may require additional PHP extensions to be installed
# manually. For detailed instructions for installing extensions can be found, see
# https://github.com/docker-library/docs/tree/master/php#how-to-install-more-php-extensions
# The following code blocks provide examples that you can edit and use.
#
# Add core PHP extensions, see
# https://github.com/docker-library/docs/tree/master/php#php-core-extensions
# This example adds the apt packages for the 'gd' extension's dependencies and then
# installs the 'gd' extension. For additional tips on running apt-get, see
# https://docs.docker.com/go/dockerfile-aptget-best-practices/
# RUN apt-get update && apt-get install -y \
#     libfreetype-dev \
#     libjpeg62-turbo-dev \
#     libpng-dev \
# && rm -rf /var/lib/apt/lists/* \
#     && docker-php-ext-configure gd --with-freetype --with-jpeg \
#     && docker-php-ext-install -j$(nproc) gd
#
# Add PECL extensions, see
# https://github.com/docker-library/docs/tree/master/php#pecl-extensions
# This example adds the 'redis' and 'xdebug' extensions.
# RUN pecl install redis-5.3.7 \
#    && pecl install xdebug-3.2.1 \
#    && docker-php-ext-enable redis xdebug
@y
# Your PHP application may require additional PHP extensions to be installed
# manually. For detailed instructions for installing extensions can be found, see
# https://github.com/docker-library/docs/tree/master/php#how-to-install-more-php-extensions
# The following code blocks provide examples that you can edit and use.
#
# Add core PHP extensions, see
# https://github.com/docker-library/docs/tree/master/php#php-core-extensions
# This example adds the apt packages for the 'gd' extension's dependencies and then
# installs the 'gd' extension. For additional tips on running apt-get, see
# https://docs.docker.com/go/dockerfile-aptget-best-practices/
# RUN apt-get update && apt-get install -y \
#     libfreetype-dev \
#     libjpeg62-turbo-dev \
#     libpng-dev \
# && rm -rf /var/lib/apt/lists/* \
#     && docker-php-ext-configure gd --with-freetype --with-jpeg \
#     && docker-php-ext-install -j$(nproc) gd
#
# Add PECL extensions, see
# https://github.com/docker-library/docs/tree/master/php#pecl-extensions
# This example adds the 'redis' and 'xdebug' extensions.
# RUN pecl install redis-5.3.7 \
#    && pecl install xdebug-3.2.1 \
#    && docker-php-ext-enable redis xdebug
@z
@x
# Use the default production configuration for PHP runtime arguments, see
# https://github.com/docker-library/docs/tree/master/php#configuration
@y
# Use the default production configuration for PHP runtime arguments, see
# https://github.com/docker-library/docs/tree/master/php#configuration
@z
@x
# Copy the app dependencies from the previous install stage.
@y
# Copy the app dependencies from the previous install stage.
@z
@x
# Copy the app files from the app directory.
@y
# Copy the app files from the app directory.
@z
@x
# Switch to a non-privileged user (defined in the base image) that the app will run under.
# See https://docs.docker.com/go/dockerfile-user-best-practices/
@y
# Switch to a non-privileged user (defined in the base image) that the app will run under.
# See https://docs.docker.com/go/dockerfile-user-best-practices/
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
# a password of your choosing to it before running `docker compose up`.
#     depends_on:
#       db:
#         condition: service_healthy
#   db:
#     image: postgres
#     restart: always
#     user: postgres
#     secrets:
#       - db-password
#     volumes:
#       - db-data:/var/lib/postgresql/data
#     environment:
#       - POSTGRES_DB=example
#       - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
#     expose:
#       - 5432
#     healthcheck:
#       test: [ "CMD", "pg_isready" ]
#       interval: 10s
#       timeout: 5s
#       retries: 5
# volumes:
#   db-data:
# secrets:
#   db-password:
#     file: db/password.txt
@y
# The commented out section below is an example of how to define a PostgreSQL
# database that your application can use. `depends_on` tells Docker Compose to
# start the database before your application. The `db-data` volume persists the
# database data between container restarts. The `db-password` secret is used
# to set the database password. You must create `db/password.txt` and add
# a password of your choosing to it before running `docker compose up`.
#     depends_on:
#       db:
#         condition: service_healthy
#   db:
#     image: postgres
#     restart: always
#     user: postgres
#     secrets:
#       - db-password
#     volumes:
#       - db-data:/var/lib/postgresql/data
#     environment:
#       - POSTGRES_DB=example
#       - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
#     expose:
#       - 5432
#     healthcheck:
#       test: [ "CMD", "pg_isready" ]
#       interval: 10s
#       timeout: 5s
#       retries: 5
# volumes:
#   db-data:
# secrets:
#   db-password:
#     file: db/password.txt
@z

@x within code
# Include any files or directories that you don't want to be copied to your
# container here (e.g., local build artifacts, temporary files, etc.).
#
# For more help, visit the .dockerignore file reference guide at
# https://docs.docker.com/go/build-context-dockerignore/
@y
# Include any files or directories that you don't want to be copied to your
# container here (e.g., local build artifacts, temporary files, etc.).
#
# For more help, visit the .dockerignore file reference guide at
# https://docs.docker.com/go/build-context-dockerignore/
@z

@x
You should now have the following contents in your `docker-php-sample`
directory.
@y
上により `docker-php-sample` ディレクトリ内は以下の内容となるはずです。
@z

% snip text...

@x
To learn more about these files, see the following:
@y
各ファイルについての詳細は以下を参照してください。
@z

@x
- [Dockerfile](/reference/dockerfile.md)
- [.dockerignore](/reference/dockerfile.md#dockerignore-file)
- [compose.yaml](/reference/compose-file/_index.md)
@y
- [Dockerfile](reference/dockerfile.md)
- [.dockerignore](reference/dockerfile.md#dockerignore-file)
- [compose.yaml](reference/compose-file/_index.md)
@z

@x
## Run the application
@y
## アプリケーションの実行 {#run-the-application}
@z

@x
Inside the `docker-php-sample` directory, run the following command in a
terminal.
@y
端末画面内の `docker-php-sample` ディレクトリから以下のコマンドを実行します。
@z

% snip command...

@x
Open a browser and view the application at [http://localhost:9000/hello.php](http://localhost:9000/hello.php). You should see a simple hello world application.
@y
ブラウザーを開いて [http://localhost:9000/hello.php](http://localhost:9000/hello.php) にアクセスしてアプリケーションを確認します。
単純な hello world アプリケーションが表示されたはずです。
@z

@x
In the terminal, press `ctrl`+`c` to stop the application.
@y
端末画面から `ctrl`+`c` を押下してアプリケーションを停止します。
@z

@x
### Run the application in the background
@y
### バックグラウンドでのアプリケーション実行 {#run-the-application-in-the-background}
@z

@x
You can run the application detached from the terminal by adding the `-d`
option. Inside the `docker-php-sample` directory, run the following command
in a terminal.
@y
アプリケーションは端末から切り離して実行することができます。
それには `-d` オプションをつけます。
端末画面内の `docker-php-sample` ディレクトリから以下のコマンドを実行します。
@z

% snip command...

@x
Open a browser and view the application at [http://localhost:9000/hello.php](http://localhost:9000/hello.php). You should see a simple hello world application.
@y
ブラウザーを開いて [http://localhost:9000/hello.php](http://localhost:9000/hello.php) にアクセスしてアプリケーションを確認します。
単純な hello world アプリケーションが表示されたはずです。
@z

@x
In the terminal, run the following command to stop the application.
@y
端末画面から以下のコマンドを実行してアプリケーションを停止します。
@z

% snip command...

@x
For more information about Compose commands, see the [Compose CLI
reference](/reference/cli/docker/compose/).
@y
Compose コマンドの詳細は [Compose CLI リファレンス](__SUBDIR__/reference/cli/docker/compose/) を参照してください。
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this section, you learned how you can containerize and run a simple PHP
application using Docker.
@y
本節では Docker を使って、単純な PHP アプリケーションをコンテナー化して実行する方法について学びました。
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
In the next section, you'll learn how you can develop your application using
Docker containers.
@y
次の節では、Docker コンテナーを使ってアプリケーションの開発を行う方法を学びます。
@z
