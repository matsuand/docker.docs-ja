%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Containerize a Bun application
linkTitle: Containerize your app
@y
title: Containerize a Bun application
linkTitle: Containerize your app
@z

@x
keywords: bun, containerize, initialize
description: Learn how to containerize a Bun application.
@y
keywords: bun, containerize, initialize
description: Learn how to containerize a Bun application.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
* You have a [Git client](https://git-scm.com/downloads). The examples in this section use a command-line based Git client, but you can use any client.
@y
* You have a [Git client](https://git-scm.com/downloads). The examples in this section use a command-line based Git client, but you can use any client.
@z

@x
## Overview
@y
## Overview
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
## Get the sample application
@y
## Get the sample application
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
$ git clone https://github.com/Pradumnasaraf/bun-docker.git
```
@y
```console
$ git clone https://github.com/Pradumnasaraf/bun-docker.git
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
In the Dockerfile, you'll notice that the `FROM` instruction uses `oven/bun`
as the base image. This is the official image for Bun created by Oven, the
company behind Bun. This image is [available on the Docker Hub](https://hub.docker.com/r/oven/bun).
@y
In the Dockerfile, you'll notice that the `FROM` instruction uses `oven/bun`
as the base image. This is the official image for Bun created by Oven, the
company behind Bun. This image is [available on the Docker Hub](https://hub.docker.com/r/oven/bun).
@z

@x
```dockerfile
# Use the Bun image as the base image
FROM oven/bun:latest
@y
```dockerfile
# Use the Bun image as the base image
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
Aside from specifying `oven/bun` as the base image, this Dockerfile also:
@y
Aside from specifying `oven/bun` as the base image, this Dockerfile also:
@z

@x
- Sets the working directory in the container to `/app`
- Copies the contents of the current directory to the `/app` directory in the container
- Exposes port 3000, where the API is listening for requests
- And finally, starts the server when the container launches with the command `bun server.js`.
@y
- Sets the working directory in the container to `/app`
- Copies the contents of the current directory to the `/app` directory in the container
- Exposes port 3000, where the API is listening for requests
- And finally, starts the server when the container launches with the command `bun server.js`.
@z

@x
## Run the application
@y
## Run the application
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
### Run the application in the background
@y
### Run the application in the background
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
## Summary
@y
## Summary
@z

@x
In this section, you learned how you can containerize and run your Bun
application using Docker.
@y
In this section, you learned how you can containerize and run your Bun
application using Docker.
@z

@x
Related information:
@y
Related information:
@z

@x
 - [Dockerfile reference](/reference/dockerfile.md)
 - [.dockerignore file](/reference/dockerfile.md#dockerignore-file)
 - [Docker Compose overview](/manuals/compose/_index.md)
 - [Compose file reference](/reference/compose-file/_index.md)
@y
 - [Dockerfile reference](reference/dockerfile.md)
 - [.dockerignore file](reference/dockerfile.md#dockerignore-file)
 - [Docker Compose overview](manuals/compose/_index.md)
 - [Compose file reference](reference/compose-file/_index.md)
@z

@x
## Next steps
@y
## Next steps
@z

@x
In the next section, you'll learn how you can develop your application using
containers.
@y
In the next section, you'll learn how you can develop your application using
containers.
@z
