%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Build and share a containerized application
linkTitle: Containerize an application
description: Run a container and an application stack, build an image, and share it through Docker Hub.
keywords: Docker, get started, containerize application, containers, Docker Compose, images, Docker Hub
@y
title: Build and share a containerized application
linkTitle: Containerize an application
description: Run a container and an application stack, build an image, and share it through Docker Hub.
keywords: Docker, get started, containerize application, containers, Docker Compose, images, Docker Hub
@z

@x
An application can depend on a particular runtime, libraries, database, and
supporting tools. Docker packages these dependencies with the application so
you can run it consistently without preparing each machine by hand.
@y
An application can depend on a particular runtime, libraries, database, and
supporting tools. Docker packages these dependencies with the application so
you can run it consistently without preparing each machine by hand.
@z

@x
In this 15-minute tutorial, you'll run a container, start a multi-container
application, package the application as an image, and share the image through
Docker Hub.
@y
In this 15-minute tutorial, you'll run a container, start a multi-container
application, package the application as an image, and share the image through
Docker Hub.
@z

@x
## Before you start
@y
## Before you start
@z

@x
- [Install Docker Desktop](../get-docker.md) and start it
- Install [Git](https://git-scm.com/downloads)
- Create a [Docker account](https://app.docker.com/signup)
@y
- [Install Docker Desktop](../get-docker.md) and start it
- Install [Git](https://git-scm.com/downloads)
- Create a [Docker account](https://app.docker.com/signup)
@z

@x
## Run a container
@y
## Run a container
@z

@x
Start with a small web application that someone else has packaged for Docker.
Docker distributes applications in images. An image is a ready-to-run package
that contains an application and everything it needs. A container is a running
instance of an image.
@y
Start with a small web application that someone else has packaged for Docker.
Docker distributes applications in images. An image is a ready-to-run package
that contains an application and everything it needs. A container is a running
instance of an image.
@z

@x
Download the image from Docker Hub:
@y
Download the image from Docker Hub:
@z

@x
```console
$ docker pull docker/welcome-to-docker
```
@y
```console
$ docker pull docker/welcome-to-docker
```
@z

@x
Start a container from the image:
@y
Start a container from the image:
@z

@x
```console
$ docker run --detach --name welcome --publish 8080:80 docker/welcome-to-docker
```
@y
```console
$ docker run --detach --name welcome --publish 8080:80 docker/welcome-to-docker
```
@z

@x
This command runs the container in the background (`--detach`), names it
`welcome` (`--name`), and makes its web server available at port 8080 on your
machine (`--publish 8080:80`). The final argument identifies the image to run.
@y
This command runs the container in the background (`--detach`), names it
`welcome` (`--name`), and makes its web server available at port 8080 on your
machine (`--publish 8080:80`). The final argument identifies the image to run.
@z

@x
Open [http://localhost:8080](http://localhost:8080) to see the application.
You downloaded an image and started one container from it.
@y
Open [http://localhost:8080](http://localhost:8080) to see the application.
You downloaded an image and started one container from it.
@z

@x
Remove the container before continuing:
@y
Remove the container before continuing:
@z

@x
```console
$ docker rm --force welcome
```
@y
```console
$ docker rm --force welcome
```
@z

@x
This removes the running application. The image remains available locally, so
Docker can create another container from it later.
@y
This removes the running application. The image remains available locally, so
Docker can create another container from it later.
@z

@x
## Run an application stack
@y
## Run an application stack
@z

@x
The first application needed only one container. Applications often have
several parts, such as a frontend, an API, and a database. You could start each
part with a separate `docker run` command, but you would also need to keep their
configuration and connections in sync.
@y
The first application needed only one container. Applications often have
several parts, such as a frontend, an API, and a database. You could start each
part with a separate `docker run` command, but you would also need to keep their
configuration and connections in sync.
@z

@x
Docker Compose describes all the parts of an application in a `compose.yaml`
file and manages them together. Compose is included with Docker Desktop.
@y
Docker Compose describes all the parts of an application in a `compose.yaml`
file and manages them together. Compose is included with Docker Desktop.
@z

@x
Try it with a prepared to-do application. Clone the project and open its
directory:
@y
Try it with a prepared to-do application. Clone the project and open its
directory:
@z

@x
```console
$ git clone https://github.com/docker/getting-started-todo-app
$ cd getting-started-todo-app
```
@y
```console
$ git clone https://github.com/docker/getting-started-todo-app
$ cd getting-started-todo-app
```
@z

@x
The project's `compose.yaml` file defines five services: a frontend, an API, a
database, a database management interface, and a proxy. A service represents
one part of the application and runs in its own container.
@y
The project's `compose.yaml` file defines five services: a frontend, an API, a
database, a database management interface, and a proxy. A service represents
one part of the application and runs in its own container.
@z

@x
Start the complete development stack:
@y
Start the complete development stack:
@z

@x
```console
$ docker compose up --build --detach
```
@y
```console
$ docker compose up --build --detach
```
@z

@x
The `docker compose up` command reads `compose.yaml` and starts its services.
The `--build` option builds the frontend and API images from the project, and
`--detach` leaves the containers running in the background. Compose also pulls
the images for the supporting services and connects the containers.
@y
The `docker compose up` command reads `compose.yaml` and starts its services.
The `--build` option builds the frontend and API images from the project, and
`--detach` leaves the containers running in the background. Compose also pulls
the images for the supporting services and connects the containers.
@z

@x
Open [http://localhost](http://localhost), then add an item to the to-do list.
@y
Open [http://localhost](http://localhost), then add an item to the to-do list.
@z

@x
See the containers that Compose started:
@y
See the containers that Compose started:
@z

@x
```console
$ docker compose ps
```
@y
```console
$ docker compose ps
```
@z

@x
Each row represents a container for one of the application's services. Instead
of preserving a collection of commands, the project keeps the complete stack
in one version-controlled definition.
@y
Each row represents a container for one of the application's services. Instead
of preserving a collection of commands, the project keeps the complete stack
in one version-controlled definition.
@z

@x
## Build an image
@y
## Build an image
@z

@x
So far, you have run a published image and used Compose to build and manage a
development stack. Next, build an image of your own that packages the to-do
application's frontend and API together.
@y
So far, you have run a published image and used Compose to build and manage a
development stack. Next, build an image of your own that packages the to-do
application's frontend and API together.
@z

@x
The repository contains a `Dockerfile`, which is a set of instructions for
building the image. Replace `<YOUR_DOCKER_USERNAME>` with your Docker username,
then run:
@y
The repository contains a `Dockerfile`, which is a set of instructions for
building the image. Replace `<YOUR_DOCKER_USERNAME>` with your Docker username,
then run:
@z

@x
```console
$ docker build --tag <YOUR_DOCKER_USERNAME>/getting-started-todo-app .
```
@y
```console
$ docker build --tag <YOUR_DOCKER_USERNAME>/getting-started-todo-app .
```
@z

@x
The `--tag` option gives the image a name. The username prefix identifies where
the image will be stored on Docker Hub. The final `.` tells Docker to find the
`Dockerfile` and application source in the current directory.
@y
The `--tag` option gives the image a name. The username prefix identifies where
the image will be stored on Docker Hub. The final `.` tells Docker to find the
`Dockerfile` and application source in the current directory.
@z

@x
Create a container from your image, as you did with the welcome image:
@y
Create a container from your image, as you did with the welcome image:
@z

@x
```console
$ docker run --detach --name todo --publish 8080:3000 <YOUR_DOCKER_USERNAME>/getting-started-todo-app
```
@y
```console
$ docker run --detach --name todo --publish 8080:3000 <YOUR_DOCKER_USERNAME>/getting-started-todo-app
```
@z

@x
Open [http://localhost:8080](http://localhost:8080). This time, the frontend and
API are running together from the image you built.
@y
Open [http://localhost:8080](http://localhost:8080). This time, the frontend and
API are running together from the image you built.
@z

@x
## Share the image
@y
## Share the image
@z

@x
Images can be shared through a registry. Docker Hub is a registry for storing
images and making them available to other machines and deployment systems.
@y
Images can be shared through a registry. Docker Hub is a registry for storing
images and making them available to other machines and deployment systems.
@z

@x
In [Docker Home](https://app.docker.com), create a public repository named
`getting-started-todo-app` under your Docker username.
@y
In [Docker Home](https://app.docker.com), create a public repository named
`getting-started-todo-app` under your Docker username.
@z

@x
Sign in from the command line, then push the image:
@y
Sign in from the command line, then push the image:
@z

@x
```console
$ docker login
$ docker push <YOUR_DOCKER_USERNAME>/getting-started-todo-app
```
@y
```console
$ docker login
$ docker push <YOUR_DOCKER_USERNAME>/getting-started-todo-app
```
@z

@x
The `docker push` command uploads the image to Docker Hub. Open the repository
in Docker Home to see it. Another machine or deployment system can pull and run
the same image.
@y
The `docker push` command uploads the image to Docker Hub. Open the repository
in Docker Home to see it. Another machine or deployment system can pull and run
the same image.
@z

@x
## Clean up
@y
## Clean up
@z

@x
Remove the standalone container and the development stack:
@y
Remove the standalone container and the development stack:
@z

@x
```console
$ docker rm --force todo
$ docker compose down --volumes
```
@y
```console
$ docker rm --force todo
$ docker compose down --volumes
```
@z

@x
## What you learned
@y
## What you learned
@z

@x
You ran software packaged by someone else, started a multi-container
application with Compose, built your own image, and published it. An image
packages an application, a container runs that image, Compose coordinates
multiple containers, and a registry makes images available beyond one machine.
@y
You ran software packaged by someone else, started a multi-container
application with Compose, built your own image, and published it. An image
packages an application, a container runs that image, Compose coordinates
multiple containers, and a registry makes images available beyond one machine.
@z

@x
## What's next
@y
## What's next
@z

@x
Explore the concepts from this tutorial in more detail:
@y
Explore the concepts from this tutorial in more detail:
@z

@x
- [What is a container?](../docker-concepts/the-basics/what-is-a-container.md)
- [What is an image?](../docker-concepts/the-basics/what-is-an-image.md)
- [What is Docker Compose?](../docker-concepts/the-basics/what-is-docker-compose.md)
- [What is a registry?](../docker-concepts/the-basics/what-is-a-registry.md)
@y
- [What is a container?](../docker-concepts/the-basics/what-is-a-container.md)
- [What is an image?](../docker-concepts/the-basics/what-is-an-image.md)
- [What is Docker Compose?](../docker-concepts/the-basics/what-is-docker-compose.md)
- [What is a registry?](../docker-concepts/the-basics/what-is-a-registry.md)
@z

@x
Choose a language-specific [Docker guide](/guides/) to containerize an
application of your own.
@y
Choose a language-specific [Docker guide](__SUBDIR__/guides/) to containerize an
application of your own.
@z
