%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

@x
title: Containerize a Java application
linkTitle: Containerize your app
@y
title: Java アプリケーションのコンテナー化
linkTitle: アプリのコンテナー化
@z

@x
keywords: java, containerize, initialize, maven, build
description: Learn how to containerize a Java application.
@y
keywords: java, containerize, initialize, maven, build
description: Learn how to containerize a Java application.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- You have installed the latest version of [Docker Desktop](/get-started/get-docker.md).
  Docker adds new features regularly and some parts of this guide may
  work only with the latest version of Docker Desktop.

* You have a [Git client](https://git-scm.com/downloads). The examples in this
  section use a command-line based Git client, but you can use any client.
@y
- You have installed the latest version of [Docker Desktop](get-started/get-docker.md).
  Docker adds new features regularly and some parts of this guide may
  work only with the latest version of Docker Desktop.

* You have a [Git client](https://git-scm.com/downloads). The examples in this
  section use a command-line based Git client, but you can use any client.
@z

@x
## Overview
@y
## Overview
@z

@x
This section walks you through containerizing and running a Java
application.
@y
This section walks you through containerizing and running a Java
application.
@z

@x
## Get the sample applications
@y
## Get the sample applications
@z

@x
Clone the sample application that you'll be using to your local development machine. Run the following command in a terminal to clone the repository.
@y
Clone the sample application that you'll be using to your local development machine. Run the following command in a terminal to clone the repository.
@z

% snip command...

@x
The sample application is a Spring Boot application built using Maven. For more details, see `readme.md` in the repository.
@y
The sample application is a Spring Boot application built using Maven. For more details, see `readme.md` in the repository.
@z

@x
## Initialize Docker assets
@y
## Initialize Docker assets
@z

@x
Now that you have an application, you can create the necessary Docker assets to
containerize your application. You can use Docker Desktop's built-in Docker Init
feature to help streamline the process, or you can manually create the assets.
@y
Now that you have an application, you can create the necessary Docker assets to
containerize your application. You can use Docker Desktop's built-in Docker Init
feature to help streamline the process, or you can manually create the assets.
@z

@x
{{< tabs >}}
{{< tab name="Use Docker Init" >}}
@y
{{< tabs >}}
{{< tab name="Use Docker Init" >}}
@z

@x
The sample application already contains Docker assets. You'll be prompted to overwrite the existing Docker assets. To continue with this guide, select `y` to overwrite them.
@y
The sample application already contains Docker assets. You'll be prompted to overwrite the existing Docker assets. To continue with this guide, select `y` to overwrite them.
@z

% snip command...

@x
In the previous example, notice the `WARNING`. `docker-compose.yaml` already
exists, so `docker init` overwrites that file rather than creating a new
`compose.yaml` file. This prevents having multiple Compose files in the
directory. Both names are supported, but Compose prefers the canonical
`compose.yaml`.
@y
In the previous example, notice the `WARNING`. `docker-compose.yaml` already
exists, so `docker init` overwrites that file rather than creating a new
`compose.yaml` file. This prevents having multiple Compose files in the
directory. Both names are supported, but Compose prefers the canonical
`compose.yaml`.
@z

@x
{{< /tab >}}
{{< tab name="Manually create assets" >}}
@y
{{< /tab >}}
{{< tab name="Manually create assets" >}}
@z

@x
If you don't have Docker Desktop installed or prefer creating the assets
manually, you can create the following files in your project directory. 
@y
If you don't have Docker Desktop installed or prefer creating the assets
manually, you can create the following files in your project directory. 
@z

@x
Create a file named `Dockerfile` with the following contents.
@y
Create a file named `Dockerfile` with the following contents.
@z

@x
The sample already contains a Compose file. Overwrite this file to follow along with the guide. Update the`docker-compose.yaml` with the following contents.
@y
The sample already contains a Compose file. Overwrite this file to follow along with the guide. Update the`docker-compose.yaml` with the following contents.
@z

@x
Create a file named `.dockerignore` with the following contents.
@y
Create a file named `.dockerignore` with the following contents.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
You should now have the following three files in your `spring-petclinic`
directory.
@y
You should now have the following three files in your `spring-petclinic`
directory.
@z

@x
- [Dockerfile](/reference/dockerfile/)
- [.dockerignore](/reference/dockerfile/#dockerignore-file)
- [docker-compose.yaml](/reference/compose-file/_index.md)
@y
- [Dockerfile](__SUBDIR__/reference/dockerfile/)
- [.dockerignore](__SUBDIR__/reference/dockerfile/#dockerignore-file)
- [docker-compose.yaml](reference/compose-file/_index.md)
@z

@x
## Run the application
@y
## Run the application
@z

@x
Inside the `spring-petclinic` directory, run the following command in a
terminal.
@y
Inside the `spring-petclinic` directory, run the following command in a
terminal.
@z

% snip command...

@x
The first time you build and run the app, Docker downloads dependencies and builds the app. It may take several minutes depending on your network connection.
@y
The first time you build and run the app, Docker downloads dependencies and builds the app. It may take several minutes depending on your network connection.
@z

@x
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see a simple app for a pet clinic.
@y
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see a simple app for a pet clinic.
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
option. Inside the `spring-petclinic` directory, run the following command
in a terminal.
@y
You can run the application detached from the terminal by adding the `-d`
option. Inside the `spring-petclinic` directory, run the following command
in a terminal.
@z

% snip command...

@x
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see a simple app for a pet clinic.
@y
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see a simple app for a pet clinic.
@z

@x
In the terminal, run the following command to stop the application.
@y
In the terminal, run the following command to stop the application.
@z

% snip command...

@x
For more information about Compose commands, see the
[Compose CLI reference](/reference/cli/docker/compose/_index.md).
@y
For more information about Compose commands, see the
[Compose CLI reference](reference/cli/docker/compose/_index.md).
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you learned how you can containerize and run a Java
application using Docker.
@y
In this section, you learned how you can containerize and run a Java
application using Docker.
@z

@x
Related information:
@y
Related information:
@z

@x
- [docker init reference](/reference/cli/docker/init/)
@y
- [docker init reference](__SUBDIR__/reference/cli/docker/init/)
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
