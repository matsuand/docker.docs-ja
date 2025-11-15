%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

@x
title: Containerize a Ruby on Rails application
linkTitle: Containerize your app
@y
title: Ruby on Rails アプリケーションのコンテナー化
linkTitle: アプリのコンテナー化
@z

@x
keywords: ruby, flask, containerize, initialize
description: Learn how to containerize a Ruby on Rails application.
@y
keywords: ruby, flask, containerize, initialize
description: Learn how to containerize a Ruby on Rails application.
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
- You have installed the latest version of [Docker Desktop](/get-started/get-docker.md).
- You have a [Git client](https://git-scm.com/downloads). The examples in this section show the Git CLI, but you can use any client.
@y
- You have installed the latest version of [Docker Desktop](get-started/get-docker.md).
- You have a [Git client](https://git-scm.com/downloads). The examples in this section show the Git CLI, but you can use any client.
@z

@x
## Overview
@y
## 概要 {#overview}
@z

@x
This section walks you through containerizing and running a [Ruby on Rails](https://rubyonrails.org/) application.
@y
This section walks you through containerizing and running a [Ruby on Rails](https://rubyonrails.org/) application.
@z

@x
Starting from Rails 7.1 [Docker is supported out of the box](https://guides.rubyonrails.org/7_1_release_notes.html#generate-dockerfiles-for-new-rails-applications). This means that you will get a `Dockerfile`, `.dockerignore` and `bin/docker-entrypoint` files generated for you when you create a new Rails application.
@y
Starting from Rails 7.1 [Docker is supported out of the box](https://guides.rubyonrails.org/7_1_release_notes.html#generate-dockerfiles-for-new-rails-applications). This means that you will get a `Dockerfile`, `.dockerignore` and `bin/docker-entrypoint` files generated for you when you create a new Rails application.
@z

@x
If you have an existing Rails application, you will need to create the Docker assets manually. Unfortunately `docker init` command does not yet support Rails. This means that if you are working with Rails, you'll need to copy Dockerfile and other related configurations manually from the examples below.
@y
If you have an existing Rails application, you will need to create the Docker assets manually. Unfortunately `docker init` command does not yet support Rails. This means that if you are working with Rails, you'll need to copy Dockerfile and other related configurations manually from the examples below.
@z

@x
## 1. Initialize Docker assets
@y
## 1. Docker アセットの初期化 {#1-initialize-docker-assets}
@z

@x
Rails 7.1 and newer generates multistage Dockerfile out of the box. Following are two versions of such a file: one using Docker Hardened Images (DHI) and another using the official Docker image.
@y
Rails 7.1 and newer generates multistage Dockerfile out of the box. Following are two versions of such a file: one using Docker Hardened Images (DHI) and another using the official Docker image.
@z

@x
> [Docker Hardened Images (DHIs)](https://docs.docker.com/dhi/) are minimal, secure, and production-ready container base and application images maintained by Docker.
@y
> [Docker Hardened Images (DHIs)](https://docs.docker.com/dhi/) are minimal, secure, and production-ready container base and application images maintained by Docker.
@z

@x
DHI images are recommended whenever it is possible for better security. They are designed to reduce vulnerabilities and simplify compliance.
@y
DHI images are recommended whenever it is possible for better security. They are designed to reduce vulnerabilities and simplify compliance.
@z

@x
> Multistage Dockerfiles help create smaller, more efficient images by separating build and runtime dependencies, ensuring only necessary components are included in the final image. Read more in the [Multi-stage builds guide](/get-started/docker-concepts/building-images/multi-stage-builds/).
@y
> Multistage Dockerfiles help create smaller, more efficient images by separating build and runtime dependencies, ensuring only necessary components are included in the final image. Read more in the [Multi-stage builds guide](__SUBDIR__/get-started/docker-concepts/building-images/multi-stage-builds/).
@z

@x
Although the Dockerfile is generated automatically, understanding its purpose and functionality is important. Reviewing the following example is highly recommended.
@y
Although the Dockerfile is generated automatically, understanding its purpose and functionality is important. Reviewing the following example is highly recommended.
@z

@x
{{< tabs >}}
{{< tab name="Using Docker Hardened Images" >}}
@y
{{< tabs >}}
{{< tab name="Using Docker Hardened Images" >}}
@z

@x within code
# This Dockerfile is designed for production, not development.
@y
# This Dockerfile is designed for production, not development.
@z
% ...

@x
{{< /tab >}}
{{< tab name="Using the official Docker image" >}}
@y
{{< /tab >}}
{{< tab name="Using the official Docker image" >}}
@z

@x
This Dockerfile uses a script at `./bin/docker-entrypoint` as the container's entrypoint. This script prepares the database and runs the application server. Below is an example of such a script.
@y
This Dockerfile uses a script at `./bin/docker-entrypoint` as the container's entrypoint. This script prepares the database and runs the application server. Below is an example of such a script.
@z

@x
Besides the two files above you will also need a `.dockerignore` file. This file is used to exclude files and directories from the context of the build. Below is an example of a `.dockerignore` file.
@y
Besides the two files above you will also need a `.dockerignore` file. This file is used to exclude files and directories from the context of the build. Below is an example of a `.dockerignore` file.
@z

@x
The last optional file that you may want is the `compose.yaml` file, which is used by Docker Compose to define the services that make up the application. Since SQLite is being used as the database, there is no need to define a separate service for the database. The only service required is the Rails application itself.
@y
The last optional file that you may want is the `compose.yaml` file, which is used by Docker Compose to define the services that make up the application. Since SQLite is being used as the database, there is no need to define a separate service for the database. The only service required is the Rails application itself.
@z

@x
You should now have the following files in your application folder:
@y
You should now have the following files in your application folder:
@z

@x
- `.dockerignore`
- `compose.yaml`
- `Dockerfile`
- `bin/docker-entrypoint`
@y
- `.dockerignore`
- `compose.yaml`
- `Dockerfile`
- `bin/docker-entrypoint`
@z

@x
To learn more about the files, see the following:
@y
To learn more about the files, see the following:
@z

@x
- [Dockerfile](/reference/dockerfile)
- [.dockerignore](/reference/dockerfile#dockerignore-file)
- [compose.yaml](/reference/compose-file/_index.md)
- [docker-entrypoint](/reference/dockerfile/#entrypoint)
@y
- [Dockerfile](reference/dockerfile)
- [.dockerignore](reference/dockerfile#dockerignore-file)
- [compose.yaml](reference/compose-file/_index.md)
- [docker-entrypoint](reference/dockerfile/#entrypoint)
@z

@x
## 2. Run the application
@y
## 2. Run the application
@z

@x
To run the application, run the following command in a terminal inside the application's directory.
@y
To run the application, run the following command in a terminal inside the application's directory.
@z

% snip command...

@x
Open a browser and view the application at [http://localhost:3000](http://localhost:3000). You should see a simple Ruby on Rails application.
@y
Open a browser and view the application at [http://localhost:3000](http://localhost:3000). You should see a simple Ruby on Rails application.
@z

@x
In the terminal, press `ctrl`+`c` to stop the application.
@y
In the terminal, press `ctrl`+`c` to stop the application.
@z

@x
## 3. Run the application in the background
@y
## 3. Run the application in the background
@z

@x
You can run the application detached from the terminal by adding the `-d`
option. Inside the `docker-ruby-on-rails` directory, run the following command
in a terminal.
@y
You can run the application detached from the terminal by adding the `-d`
option. Inside the `docker-ruby-on-rails` directory, run the following command
in a terminal.
@z

@x
```console
$ docker compose up --build -d
```
@y
```console
$ docker compose up --build -d
```
@z

@x
Open a browser and view the application at [http://localhost:3000](http://localhost:3000).
@y
Open a browser and view the application at [http://localhost:3000](http://localhost:3000).
@z

@x
You should see a simple Ruby on Rails application.
@y
You should see a simple Ruby on Rails application.
@z

@x
In the terminal, run the following command to stop the application.
@y
In the terminal, run the following command to stop the application.
@z

@x
```console
$ docker compose down
```
@y
```console
$ docker compose down
```
@z

@x
For more information about Compose commands, see the [Compose CLI
reference](/reference/cli/docker/compose/_index.md).
@y
For more information about Compose commands, see the [Compose CLI
reference](reference/cli/docker/compose/_index.md).
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you learned how you can containerize and run your Ruby
application using Docker.
@y
In this section, you learned how you can containerize and run your Ruby
application using Docker.
@z

@x
Related information:
@y
Related information:
@z

@x
- [Docker Compose overview](/manuals/compose/_index.md)
@y
- [Docker Compose overview](manuals/compose/_index.md)
@z

@x
## Next steps
@y
## Next steps
@z

@x
In the next section, you'll take a look at how to set up a CI/CD pipeline using GitHub Actions.
@y
In the next section, you'll take a look at how to set up a CI/CD pipeline using GitHub Actions.
@z
