%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Containerize a .NET application
linkTitle: Containerize your app
@y
title: .NET アプリケーションのコンテナー化
linkTitle: アプリのコンテナー化
@z

@x
keywords: .net, containerize, initialize
description: Learn how to containerize an ASP.NET application.
@y
keywords: .net, containerize, initialize
description: Learn how to containerize an ASP.NET application.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
* You have installed the latest version of [Docker
  Desktop](/get-started/get-docker.md).
* You have a [git client](https://git-scm.com/downloads). The examples in this
  section use a command-line based git client, but you can use any client.
@y
* You have installed the latest version of [Docker
  Desktop](get-started/get-docker.md).
* You have a [git client](https://git-scm.com/downloads). The examples in this
  section use a command-line based git client, but you can use any client.
@z

@x
## Overview
@y
## Overview
@z

@x
This section walks you through containerizing and running a .NET
application.
@y
This section walks you through containerizing and running a .NET
application.
@z

@x
## Get the sample applications
@y
## Get the sample applications
@z

@x
In this guide, you will use a pre-built .NET application. The application is
similar to the application built in the Docker Blog article, [Building a
Multi-Container .NET App Using Docker
Desktop](https://www.docker.com/blog/building-multi-container-net-app-using-docker-desktop/).
@y
In this guide, you will use a pre-built .NET application. The application is
similar to the application built in the Docker Blog article, [Building a
Multi-Container .NET App Using Docker
Desktop](https://www.docker.com/blog/building-multi-container-net-app-using-docker-desktop/).
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
$ git clone https://github.com/docker/docker-dotnet-sample
```
@y
```console
$ git clone https://github.com/docker/docker-dotnet-sample
```
@z

@x
## Initialize Docker assets
@y
## Initialize Docker assets
@z

@x
Now that you have an application, you can use `docker init` to create the
necessary Docker assets to containerize your application. Inside the
`docker-dotnet-sample` directory, run the `docker init` command in a terminal.
`docker init` provides some default configuration, but you'll need to answer a
few questions about your application. Refer to the following example to answer
the prompts from `docker init` and use the same answers for your prompts.
@y
Now that you have an application, you can use `docker init` to create the
necessary Docker assets to containerize your application. Inside the
`docker-dotnet-sample` directory, run the `docker init` command in a terminal.
`docker init` provides some default configuration, but you'll need to answer a
few questions about your application. Refer to the following example to answer
the prompts from `docker init` and use the same answers for your prompts.
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
? What application platform does your project use? ASP.NET Core
? What's the name of your solution's main project? myWebApp
? What version of .NET do you want to use? 6.0
? What local port do you want to use to access your server? 8080
```
@y
? What application platform does your project use? ASP.NET Core
? What's the name of your solution's main project? myWebApp
? What version of .NET do you want to use? 6.0
? What local port do you want to use to access your server? 8080
```
@z

@x
You should now have the following contents in your `docker-dotnet-sample`
directory.
@y
You should now have the following contents in your `docker-dotnet-sample`
directory.
@z

@x
```text
├── docker-dotnet-sample/
│ ├── .git/
│ ├── src/
│ ├── .dockerignore
│ ├── compose.yaml
│ ├── Dockerfile
│ ├── README.Docker.md
│ └── README.md
```
@y
```text
├── docker-dotnet-sample/
│ ├── .git/
│ ├── src/
│ ├── .dockerignore
│ ├── compose.yaml
│ ├── Dockerfile
│ ├── README.Docker.md
│ └── README.md
```
@z

@x
To learn more about the files that `docker init` added, see the following:
 - [Dockerfile](/reference/dockerfile.md)
 - [.dockerignore](/reference/dockerfile.md#dockerignore-file)
 - [compose.yaml](/reference/compose-file/_index.md)
@y
To learn more about the files that `docker init` added, see the following:
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
Inside the `docker-dotnet-sample` directory, run the following command in a
terminal.
@y
Inside the `docker-dotnet-sample` directory, run the following command in a
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
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see a simple web application.
@y
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see a simple web application.
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
option. Inside the `docker-dotnet-sample` directory, run the following command
in a terminal.
@y
You can run the application detached from the terminal by adding the `-d`
option. Inside the `docker-dotnet-sample` directory, run the following command
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
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see a simple web application.
@y
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see a simple web application.
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
In this section, you learned how you can containerize and run your .NET
application using Docker.
@y
In this section, you learned how you can containerize and run your .NET
application using Docker.
@z

@x
Related information:
 - [Dockerfile reference](/reference/dockerfile.md)
 - [.dockerignore file reference](/reference/dockerfile.md#dockerignore-file)
 - [Docker Compose overview](/manuals/compose/_index.md)
@y
Related information:
 - [Dockerfile reference](reference/dockerfile.md)
 - [.dockerignore file reference](reference/dockerfile.md#dockerignore-file)
 - [Docker Compose overview](manuals/compose/_index.md)
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
