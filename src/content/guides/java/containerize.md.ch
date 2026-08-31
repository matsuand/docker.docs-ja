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
@y
- You have installed the latest version of [Docker Desktop](get-started/get-docker.md).
  Docker adds new features regularly and some parts of this guide may
  work only with the latest version of Docker Desktop.
@z

@x
* You have a [Git client](https://git-scm.com/downloads). The examples in this
  section use a command-line based Git client, but you can use any client.
@y
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
## Create Docker assets
@y
## Create Docker assets
@z

@x
Now that you have an application, you can create the necessary Docker assets to
containerize your application.
@y
Now that you have an application, you can create the necessary Docker assets to
containerize your application.
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
Create a file named `Dockerfile` with the following contents.
@y
Create a file named `Dockerfile` with the following contents.
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
# Create a stage for resolving and downloading dependencies.
@y
# Create a stage for resolving and downloading dependencies.
@z
@x
# Copy the mvnw wrapper with executable permissions.
@y
# Copy the mvnw wrapper with executable permissions.
@z
@x
# Download dependencies as a separate step to take advantage of Docker's caching.
# Leverage a cache mount to /root/.m2 so that subsequent builds don't have to
# re-download packages.
@y
# Download dependencies as a separate step to take advantage of Docker's caching.
# Leverage a cache mount to /root/.m2 so that subsequent builds don't have to
# re-download packages.
@z
@x
# Create a stage for building the application based on the stage with downloaded dependencies.
# This Dockerfile is optimized for Java applications that output an uber jar, which includes
# all the dependencies needed to run your app inside a JVM. If your app doesn't output an uber
# jar and instead relies on an application server like Apache Tomcat, you'll need to update this
# stage with the correct filename of your package and update the base image of the "final" stage
# use the relevant app server, e.g., using tomcat (https://hub.docker.com/_/tomcat/) as a base image.
@y
# Create a stage for building the application based on the stage with downloaded dependencies.
# This Dockerfile is optimized for Java applications that output an uber jar, which includes
# all the dependencies needed to run your app inside a JVM. If your app doesn't output an uber
# jar and instead relies on an application server like Apache Tomcat, you'll need to update this
# stage with the correct filename of your package and update the base image of the "final" stage
# use the relevant app server, e.g., using tomcat (https://hub.docker.com/_/tomcat/) as a base image.
@z
@x
# Create a stage for extracting the application into separate layers.
# Take advantage of Spring Boot's layer tools and Docker's caching by extracting
# the packaged application into separate layers that can be copied into the final stage.
# See Spring's docs for reference:
# https://docs.spring.io/spring-boot/docs/current/reference/html/container-images.html
@y
# Create a stage for extracting the application into separate layers.
# Take advantage of Spring Boot's layer tools and Docker's caching by extracting
# the packaged application into separate layers that can be copied into the final stage.
# See Spring's docs for reference:
# https://docs.spring.io/spring-boot/docs/current/reference/html/container-images.html
@z
@x
# Create a new stage for running the application that contains the minimal
# runtime dependencies for the application. This often uses a different base
# image from the install or build stage where the necessary files are copied
# from the install stage.
#
# The example below uses eclipse-turmin's JRE image as the foundation for running the app.
# By specifying the "17-jre-jammy" tag, it will also use whatever happens to be the
# most recent version of that tag when you build your Dockerfile.
# If reproducibility is important, consider using a specific digest SHA, like
# eclipse-temurin@sha256:99cede493dfd88720b610eb8077c8688d3cca50003d76d1d539b0efc8cca72b4.
@y
# Create a new stage for running the application that contains the minimal
# runtime dependencies for the application. This often uses a different base
# image from the install or build stage where the necessary files are copied
# from the install stage.
#
# The example below uses eclipse-turmin's JRE image as the foundation for running the app.
# By specifying the "17-jre-jammy" tag, it will also use whatever happens to be the
# most recent version of that tag when you build your Dockerfile.
# If reproducibility is important, consider using a specific digest SHA, like
# eclipse-temurin@sha256:99cede493dfd88720b610eb8077c8688d3cca50003d76d1d539b0efc8cca72b4.
@z
@x
# Create a non-privileged user that the app will run under.
# See https://docs.docker.com/go/dockerfile-user-best-practices/
@y
# Create a non-privileged user that the app will run under.
# See https://docs.docker.com/go/dockerfile-user-best-practices/
@z
@x
# Copy the executable from the "package" stage.
@y
# Copy the executable from the "package" stage.
@z

@x
> [!NOTE]
> The sample repository includes a `docker-compose.yml` file. The following instructions use the preferred `compose.yaml` filename — both are supported by Docker Compose.
@y
> [!NOTE]
> The sample repository includes a `docker-compose.yml` file. The following instructions use the preferred `compose.yaml` filename — both are supported by Docker Compose.
@z

@x
Create a file named `compose.yaml` with the following contents.
@y
Create a file named `compose.yaml` with the following contents.
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
Create a file named `.dockerignore` with the following contents.
@y
Create a file named `.dockerignore` with the following contents.
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
You should now have the following three files in your `spring-petclinic`
directory.
@y
You should now have the following three files in your `spring-petclinic`
directory.
@z

@x
- [Dockerfile](/reference/dockerfile/)
- [.dockerignore](/reference/dockerfile/#dockerignore-file)
- [compose.yaml](/reference/compose-file/_index.md)
@y
- [Dockerfile](__SUBDIR__/reference/dockerfile/)
- [.dockerignore](__SUBDIR__/reference/dockerfile/#dockerignore-file)
- [compose.yaml](reference/compose-file/_index.md)
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
[Compose CLI reference](/reference/cli/docker/compose/).
@y
For more information about Compose commands, see the
[Compose CLI reference](__SUBDIR__/reference/cli/docker/compose/).
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
