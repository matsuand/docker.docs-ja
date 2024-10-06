%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

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
description: Learn how to containerize a PHP application.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- You have installed the latest version of [Docker
  Desktop](/get-started/get-docker.md).
- You have a [git client](https://git-scm.com/downloads). The examples in this
  section use a command-line based git client, but you can use any client.
@y
- You have installed the latest version of [Docker
  Desktop](get-started/get-docker.md).
- You have a [git client](https://git-scm.com/downloads). The examples in this
  section use a command-line based git client, but you can use any client.
@z

@x
## Overview
@y
## Overview
@z

@x
This section walks you through containerizing and running a PHP
application.
@y
This section walks you through containerizing and running a PHP
application.
@z

@x
## Get the sample applications
@y
## Get the sample applications
@z

@x
In this guide, you will use a pre-built PHP application. The application uses Composer for library dependency management. You'll serve the application via an Apache web server.
@y
In this guide, you will use a pre-built PHP application. The application uses Composer for library dependency management. You'll serve the application via an Apache web server.
@z

@x
Open a terminal, change directory to a directory that you want to work in, and
run the following command to clone the repository.
@y
Open a terminal, change directory to a directory that you want to work in, and
run the following command to clone the repository.
@z

@x
```console
$ git clone https://github.com/docker/docker-php-sample
```
@y
```console
$ git clone https://github.com/docker/docker-php-sample
```
@z

@x
The sample application is a basic hello world application and an application that increments a counter in a database. In addition, the application uses PHPUnit for testing.
@y
The sample application is a basic hello world application and an application that increments a counter in a database. In addition, the application uses PHPUnit for testing.
@z

@x
## Initialize Docker assets
@y
## Initialize Docker assets
@z

@x
Now that you have an application, you can use `docker init` to create the
necessary Docker assets to containerize your application. Inside the
`docker-php-sample` directory, run the `docker init` command in a terminal.
`docker init` provides some default configuration, but you'll need to answer a
few questions about your application. For example, this application uses PHP
version 8.2. Refer to the following `docker init` example and use the same
answers for your prompts.
@y
Now that you have an application, you can use `docker init` to create the
necessary Docker assets to containerize your application. Inside the
`docker-php-sample` directory, run the `docker init` command in a terminal.
`docker init` provides some default configuration, but you'll need to answer a
few questions about your application. For example, this application uses PHP
version 8.2. Refer to the following `docker init` example and use the same
answers for your prompts.
@z

@x
```console
$ docker init
Welcome to the Docker Init CLI!
@y
```console
$ docker init
Welcome to the Docker Init CLI!
@z

@x
This utility will walk you through creating the following files with sensible defaults for your project:
  - .dockerignore
  - Dockerfile
  - compose.yaml
  - README.Docker.md
@y
This utility will walk you through creating the following files with sensible defaults for your project:
  - .dockerignore
  - Dockerfile
  - compose.yaml
  - README.Docker.md
@z

@x
Let's get started!
@y
Let's get started!
@z

@x
? What application platform does your project use? PHP with Apache
? What version of PHP do you want to use? 8.2
? What's the relative directory (with a leading .) for your app? ./src
? What local port do you want to use to access your server? 9000
```
@y
? What application platform does your project use? PHP with Apache
? What version of PHP do you want to use? 8.2
? What's the relative directory (with a leading .) for your app? ./src
? What local port do you want to use to access your server? 9000
```
@z

@x
You should now have the following contents in your `docker-php-sample`
directory.
@y
You should now have the following contents in your `docker-php-sample`
directory.
@z

@x
```text
├── docker-php-sample/
│ ├── .git/
│ ├── src/
│ ├── tests/
│ ├── .dockerignore
│ ├── .gitignore
│ ├── compose.yaml
│ ├── composer.json
│ ├── composer.lock
│ ├── Dockerfile
│ ├── README.Docker.md
│ └── README.md
```
@y
```text
├── docker-php-sample/
│ ├── .git/
│ ├── src/
│ ├── tests/
│ ├── .dockerignore
│ ├── .gitignore
│ ├── compose.yaml
│ ├── composer.json
│ ├── composer.lock
│ ├── Dockerfile
│ ├── README.Docker.md
│ └── README.md
```
@z

@x
To learn more about the files that `docker init` added, see the following:
@y
To learn more about the files that `docker init` added, see the following:
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
## Run the application
@z

@x
Inside the `docker-php-sample` directory, run the following command in a
terminal.
@y
Inside the `docker-php-sample` directory, run the following command in a
terminal.
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
Open a browser and view the application at [http://localhost:9000/hello.php](http://localhost:9000/hello.php). You should see a simple hello world application.
@y
Open a browser and view the application at [http://localhost:9000/hello.php](http://localhost:9000/hello.php). You should see a simple hello world application.
@z

@x
In the terminal, press `ctrl`+`c` to stop the application.
@y
In the terminal, press `ctrl`+`c` to stop the application.
@z

@x
### Run the application in the background
@y
### Run the application in the background
@z

@x
You can run the application detached from the terminal by adding the `-d`
option. Inside the `docker-php-sample` directory, run the following command
in a terminal.
@y
You can run the application detached from the terminal by adding the `-d`
option. Inside the `docker-php-sample` directory, run the following command
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
Open a browser and view the application at [http://localhost:9000/hello.php](http://localhost:9000/hello.php). You should see a simple hello world application.
@y
Open a browser and view the application at [http://localhost:9000/hello.php](http://localhost:9000/hello.php). You should see a simple hello world application.
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
In this section, you learned how you can containerize and run a simple PHP
application using Docker.
@y
In this section, you learned how you can containerize and run a simple PHP
application using Docker.
@z

@x
Related information:
@y
Related information:
@z

@x
- [docker init reference](/reference/cli/docker/init.md)
@y
- [docker init reference](reference/cli/docker/init.md)
@z

@x
## Next steps
@y
## Next steps
@z

@x
In the next section, you'll learn how you can develop your application using
Docker containers.
@y
In the next section, you'll learn how you can develop your application using
Docker containers.
@z
