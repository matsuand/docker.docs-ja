%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: Containerize and develop Bun applications using Docker.
keywords: getting started, bun
title: Bun language-specific guide
summary: |
  Learn how to containerize JavaScript applications with the Bun runtime.
linkTitle: Bun
@y
description: Containerize and develop Bun applications using Docker.
keywords: getting started, bun
title: Bun language-specific guide
summary: |
  Learn how to containerize JavaScript applications with the Bun runtime.
linkTitle: Bun
@z

@x
  time: 10 minutes
@y
  time: 10 分
@z

@x
The Bun getting started guide teaches you how to create a containerized Bun application using Docker.
@y
The Bun getting started guide teaches you how to create a containerized Bun application using Docker.
@z

@x
> **Acknowledgment**
>
> Docker would like to thank [Pradumna Saraf](https://twitter.com/pradumna_saraf) for his contribution to this guide.
@y
> **Acknowledgment**
>
> Docker would like to thank [Pradumna Saraf](https://twitter.com/pradumna_saraf) for his contribution to this guide.
@z

@x
## What will you learn?
@y
## What will you learn?
@z

@x
- Containerize and run a Bun application using Docker
- Set up a local environment to develop a Bun application using containers
@y
- Containerize and run a Bun application using Docker
- Set up a local environment to develop a Bun application using containers
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Basic understanding of JavaScript is assumed.
- You must have familiarity with Docker concepts like containers, images, and Dockerfiles. If you are new to Docker, you can start with the [Docker basics](/get-started/docker-concepts/the-basics/what-is-a-container.md) guide.
@y
- Basic understanding of JavaScript is assumed.
- You must have familiarity with Docker concepts like containers, images, and Dockerfiles. If you are new to Docker, you can start with the [Docker basics](get-started/docker-concepts/the-basics/what-is-a-container.md) guide.
@z

@x
After completing the Bun getting started modules, you should be able to containerize your own Bun application based on the examples and instructions provided in this guide.
@y
After completing the Bun getting started modules, you should be able to containerize your own Bun application based on the examples and instructions provided in this guide.
@z

@x
Start by containerizing an existing Bun application.
@y
Start by containerizing an existing Bun application.
@z

@x
## Containerize a Bun application
@y
## Containerize a Bun application
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
- You have a [Git client](https://git-scm.com/downloads). The examples in this section use a command-line based Git client, but you can use any client.
@y
- You have a [Git client](https://git-scm.com/downloads). The examples in this section use a command-line based Git client, but you can use any client.
@z

@x
### Overview
@y
### Overview
@z

@x
For a long time, Node.js has been the de-facto runtime for server-side
JavaScript applications. Recent years have seen a rise in new alternative
runtimes in the ecosystem, including [Bun website](https://bun.sh/). Like
Node.js, Bun is a JavaScript runtime. Bun is a comparatively lightweight
runtime that is designed to be fast and efficient.
@y
For a long time, Node.js has been the de-facto runtime for server-side
JavaScript applications. Recent years have seen a rise in new alternative
runtimes in the ecosystem, including [Bun website](https://bun.sh/). Like
Node.js, Bun is a JavaScript runtime. Bun is a comparatively lightweight
runtime that is designed to be fast and efficient.
@z

@x
Why develop Bun applications with Docker? Having multiple runtimes to choose
from is great. But as the number of runtimes increases, it becomes challenging
to manage the different runtimes and their dependencies consistently across
environments. This is where Docker comes in. Creating and destroying containers
on demand is a great way to manage the different runtimes and their
dependencies. Also, as it's fairly a new runtime, getting a consistent
development environment for Bun can be challenging. Docker can help you set up
a consistent development environment for Bun.
@y
Why develop Bun applications with Docker? Having multiple runtimes to choose
from is great. But as the number of runtimes increases, it becomes challenging
to manage the different runtimes and their dependencies consistently across
environments. This is where Docker comes in. Creating and destroying containers
on demand is a great way to manage the different runtimes and their
dependencies. Also, as it's fairly a new runtime, getting a consistent
development environment for Bun can be challenging. Docker can help you set up
a consistent development environment for Bun.
@z

@x
### Get the sample application
@y
### Get the sample application
@z

@x
Clone the sample application to use with this guide. Open a terminal, change
directory to a directory that you want to work in, and run the following
command to clone the repository:
@y
Clone the sample application to use with this guide. Open a terminal, change
directory to a directory that you want to work in, and run the following
command to clone the repository:
@z

@x
```console
$ git clone https://github.com/dockersamples/bun-docker.git && cd bun-docker
```
@y
```console
$ git clone https://github.com/dockersamples/bun-docker.git && cd bun-docker
```
@z

@x
You should now have the following contents in your `bun-docker` directory.
@y
You should now have the following contents in your `bun-docker` directory.
@z

@x
```text
├── bun-docker/
│ ├── compose.yml
│ ├── Dockerfile
│ ├── LICENSE
│ ├── server.js
│ └── README.md
```
@y
```text
├── bun-docker/
│ ├── compose.yml
│ ├── Dockerfile
│ ├── LICENSE
│ ├── server.js
│ └── README.md
```
@z

@x
### Create a Dockerfile
@y
### Create a Dockerfile
@z

@x
Before creating a Dockerfile, you need to choose a base image. You can either use the [Bun Docker Official Image](https://hub.docker.com/r/oven/bun) or a Docker Hardened Image (DHI) from the [Hardened Image catalog](https://hub.docker.com/hardened-images/catalog).
@y
Before creating a Dockerfile, you need to choose a base image. You can either use the [Bun Docker Official Image](https://hub.docker.com/r/oven/bun) or a Docker Hardened Image (DHI) from the [Hardened Image catalog](https://hub.docker.com/hardened-images/catalog).
@z

@x
Choosing DHI offers the advantage of a production-ready image that is lightweight and secure. For more information, see [Docker Hardened Images](https://docs.docker.com/dhi/).
@y
Choosing DHI offers the advantage of a production-ready image that is lightweight and secure. For more information, see [Docker Hardened Images](https://docs.docker.com/dhi/).
@z

@x
{{< tabs >}}
{{< tab name="Using Docker Hardened Images" >}}
@y
{{< tabs >}}
{{< tab name="Using Docker Hardened Images" >}}
@z

@x
Docker Hardened Images (DHIs) are available for Bun in the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog/dhi/bun). You can pull DHIs directly from the `dhi.io` registry.
@y
Docker Hardened Images (DHIs) are available for Bun in the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog/dhi/bun). You can pull DHIs directly from the `dhi.io` registry.
@z

@x
1. Sign in to the DHI registry:
@y
1. Sign in to the DHI registry:
@z

@x
   ```console
   $ docker login dhi.io
   ```
@y
   ```console
   $ docker login dhi.io
   ```
@z

@x
2. Pull the Bun DHI as `dhi.io/bun:1`. The tag (`1`) in this example refers to the version to the latest 1.x version of Bun.
@y
2. Pull the Bun DHI as `dhi.io/bun:1`. The tag (`1`) in this example refers to the version to the latest 1.x version of Bun.
@z

@x
   ```console
   $ docker pull dhi.io/bun:1
   ```
@y
   ```console
   $ docker pull dhi.io/bun:1
   ```
@z

@x
For other available versions, refer to the [catalog](https://hub.docker.com/hardened-images/catalog/dhi/bun).
@y
For other available versions, refer to the [catalog](https://hub.docker.com/hardened-images/catalog/dhi/bun).
@z

@x
```dockerfile
# Use the DHI Bun image as the base image
FROM dhi.io/bun:1
@y
```dockerfile
# Use the DHI Bun image as the base image
FROM dhi.io/bun:1
@z

@x
# Set the working directory in the container
WORKDIR /app
@y
# Set the working directory in the container
WORKDIR /app
@z

@x
# Copy the current directory contents into the container at /app
COPY . .
@y
# Copy the current directory contents into the container at /app
COPY . .
@z

@x
# Expose the port on which the API will listen
EXPOSE 3000
@y
# Expose the port on which the API will listen
EXPOSE 3000
@z

@x
# Run the server when the container launches
CMD ["bun", "server.js"]
```
@y
# Run the server when the container launches
CMD ["bun", "server.js"]
```
@z

@x
{{< /tab >}}
{{< tab name="Using the official image" >}}
@y
{{< /tab >}}
{{< tab name="Using the official image" >}}
@z

@x
Using the Docker Official Image is straightforward. In the following Dockerfile, you'll notice that the `FROM` instruction uses `oven/bun` as the base image.
@y
Using the Docker Official Image is straightforward. In the following Dockerfile, you'll notice that the `FROM` instruction uses `oven/bun` as the base image.
@z

@x
You can find the image on [Docker Hub](https://hub.docker.com/r/oven/bun). This is the Docker Official Image for Bun created by Oven, the company behind Bun, and it's available on Docker Hub.
@y
You can find the image on [Docker Hub](https://hub.docker.com/r/oven/bun). This is the Docker Official Image for Bun created by Oven, the company behind Bun, and it's available on Docker Hub.
@z

@x
```dockerfile
# Use the official Bun image
FROM oven/bun:latest
@y
```dockerfile
# Use the official Bun image
FROM oven/bun:latest
@z

@x
# Set the working directory in the container
WORKDIR /app
@y
# Set the working directory in the container
WORKDIR /app
@z

@x
# Copy the current directory contents into the container at /app
COPY . .
@y
# Copy the current directory contents into the container at /app
COPY . .
@z

@x
# Expose the port on which the API will listen
EXPOSE 3000
@y
# Expose the port on which the API will listen
EXPOSE 3000
@z

@x
# Run the server when the container launches
CMD ["bun", "server.js"]
```
@y
# Run the server when the container launches
CMD ["bun", "server.js"]
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
In addition to specifying the base image, the Dockerfile also:
@y
In addition to specifying the base image, the Dockerfile also:
@z

@x
- Sets the working directory in the container to `/app`.
- Copies the content of the current directory to the `/app` directory in the container.
- Exposes port 3000, where the API is listening for requests.
- And finally, starts the server when the container launches with the command `bun server.js`.
@y
- Sets the working directory in the container to `/app`.
- Copies the content of the current directory to the `/app` directory in the container.
- Exposes port 3000, where the API is listening for requests.
- And finally, starts the server when the container launches with the command `bun server.js`.
@z

@x
### Run the application
@y
### Run the application
@z

@x
Inside the `bun-docker` directory, run the following command in a terminal.
@y
Inside the `bun-docker` directory, run the following command in a terminal.
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
Open a browser and view the application at [http://localhost:3000](http://localhost:3000). You will see a message `{"Status" : "OK"}` in the browser.
@y
Open a browser and view the application at [http://localhost:3000](http://localhost:3000). You will see a message `{"Status" : "OK"}` in the browser.
@z

@x
In the terminal, press `ctrl`+`c` to stop the application.
@y
In the terminal, press `ctrl`+`c` to stop the application.
@z

@x
#### Run the application in the background
@y
#### Run the application in the background
@z

@x
You can run the application detached from the terminal by adding the `-d`
option. Inside the `bun-docker` directory, run the following command
in a terminal.
@y
You can run the application detached from the terminal by adding the `-d`
option. Inside the `bun-docker` directory, run the following command
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
## Use containers for Bun development
@y
## Use containers for Bun development
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Complete [Containerize a Bun application](#containerize-a-bun-application).
@y
Complete [Containerize a Bun application](#containerize-a-bun-application).
@z

@x
### Overview
@y
### Overview
@z

@x
In this section, you'll learn how to set up a development environment for your containerized application. This includes:
@y
In this section, you'll learn how to set up a development environment for your containerized application. This includes:
@z

@x
- Configuring Compose to automatically update your running Compose services as you edit and save your code
@y
- Configuring Compose to automatically update your running Compose services as you edit and save your code
@z

@x
### Get the sample application
@y
### Get the sample application
@z

@x
Clone the sample application to use with this guide. Open a terminal, change directory to a directory that you want to work in, and run the following command to clone the repository:
@y
Clone the sample application to use with this guide. Open a terminal, change directory to a directory that you want to work in, and run the following command to clone the repository:
@z

@x
```console
$ git clone https://github.com/dockersamples/bun-docker.git && cd bun-docker
```
@y
```console
$ git clone https://github.com/dockersamples/bun-docker.git && cd bun-docker
```
@z

@x
### Automatically update services
@y
### Automatically update services
@z

@x
Use Compose Watch to automatically update your running Compose services as you
edit and save your code. For more details about Compose Watch, see [Use Compose
Watch](/manuals/compose/how-tos/file-watch.md).
@y
Use Compose Watch to automatically update your running Compose services as you
edit and save your code. For more details about Compose Watch, see [Use Compose
Watch](manuals/compose/how-tos/file-watch.md).
@z

@x
Open your `compose.yml` file in an IDE or text editor and then add the Compose Watch instructions. The following example shows how to add Compose Watch to your `compose.yml` file.
@y
Open your `compose.yml` file in an IDE or text editor and then add the Compose Watch instructions. The following example shows how to add Compose Watch to your `compose.yml` file.
@z

@x
```yaml {hl_lines="9-12",linenos=true}
services:
  server:
    image: bun-server
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "3000:3000"
    develop:
      watch:
        - action: rebuild
          path: .
```
@y
```yaml {hl_lines="9-12",linenos=true}
services:
  server:
    image: bun-server
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "3000:3000"
    develop:
      watch:
        - action: rebuild
          path: .
```
@z

@x
Run the following command to run your application with Compose Watch.
@y
Run the following command to run your application with Compose Watch.
@z

@x
```console
$ docker compose watch
```
@y
```console
$ docker compose watch
```
@z

@x
Now, if you modify your `server.js` you will see the changes in real time without re-building the image.
@y
Now, if you modify your `server.js` you will see the changes in real time without re-building the image.
@z

@x
To test it out, open the `server.js` file in your favorite text editor and change the message from `{"Status" : "OK"}` to `{"Status" : "Updated"}`. Save the file and refresh your browser at `http://localhost:3000`. You should see the updated message.
@y
To test it out, open the `server.js` file in your favorite text editor and change the message from `{"Status" : "OK"}` to `{"Status" : "Updated"}`. Save the file and refresh your browser at `http://localhost:3000`. You should see the updated message.
@z

@x
Press `ctrl+c` in the terminal to stop your application.
@y
Press `ctrl+c` in the terminal to stop your application.
@z

@x
### Summary
@y
### Summary
@z

@x
In this section, you also learned how to use Compose Watch to automatically rebuild and run your container when you update your code.
@y
In this section, you also learned how to use Compose Watch to automatically rebuild and run your container when you update your code.
@z

@x
Related information:
@y
Related information:
@z

@x
- [Compose file reference](/reference/compose-file/)
- [Compose file watch](/manuals/compose/how-tos/file-watch.md)
- [Multi-stage builds](/manuals/build/building/multi-stage.md)
@y
- [Compose file reference](__SUBDIR__/reference/compose-file/)
- [Compose file watch](manuals/compose/how-tos/file-watch.md)
- [Multi-stage builds](manuals/build/building/multi-stage.md)
@z
