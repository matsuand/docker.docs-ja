%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Containerize a Deno application
linkTitle: Containerize your app
@y
title: Containerize a Deno application
linkTitle: Containerize your app
@z

@x
keywords: deno, containerize, initialize
description: Learn how to containerize a Deno application.
@y
keywords: deno, containerize, initialize
description: Learn how to containerize a Deno application.
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
For a long time, Node.js has been the go-to runtime for server-side JavaScript applications. However, recent years have introduced new alternative runtimes, including [Deno](https://deno.land/). Like Node.js, Deno is a JavaScript and TypeScript runtime, but it takes a fresh approach with modern security features, a built-in standard library, and native support for TypeScript.
@y
For a long time, Node.js has been the go-to runtime for server-side JavaScript applications. However, recent years have introduced new alternative runtimes, including [Deno](https://deno.land/). Like Node.js, Deno is a JavaScript and TypeScript runtime, but it takes a fresh approach with modern security features, a built-in standard library, and native support for TypeScript.
@z

@x
Why develop Deno applications with Docker? Having a choice of runtimes is exciting, but managing multiple runtimes and their dependencies consistently across environments can be tricky. This is where Docker proves invaluable. Using containers to create and destroy environments on demand simplifies runtime management and ensures consistency. Additionally, as Deno continues to grow and evolve, Docker helps establish a reliable and reproducible development environment, minimizing setup challenges and streamlining the workflow.
@y
Why develop Deno applications with Docker? Having a choice of runtimes is exciting, but managing multiple runtimes and their dependencies consistently across environments can be tricky. This is where Docker proves invaluable. Using containers to create and destroy environments on demand simplifies runtime management and ensures consistency. Additionally, as Deno continues to grow and evolve, Docker helps establish a reliable and reproducible development environment, minimizing setup challenges and streamlining the workflow.
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
$ git clone https://github.com/dockersamples/docker-deno.git && cd docker-deno
```
@y
```console
$ git clone https://github.com/dockersamples/docker-deno.git && cd docker-deno
```
@z

@x
You should now have the following contents in your `deno-docker` directory.
@y
You should now have the following contents in your `deno-docker` directory.
@z

@x
```text
├── deno-docker/
│ ├── compose.yml
│ ├── Dockerfile
│ ├── LICENSE
│ ├── server.ts
│ └── README.md
```
@y
```text
├── deno-docker/
│ ├── compose.yml
│ ├── Dockerfile
│ ├── LICENSE
│ ├── server.ts
│ └── README.md
```
@z

@x
## Understand the sample application
@y
## Understand the sample application
@z

@x
The sample application is a simple Deno application that uses the Oak framework to create a simple API that returns a JSON response. The application listens on port 8000 and returns a message `{"Status" : "OK"}` when you access the application in a browser.
@y
The sample application is a simple Deno application that uses the Oak framework to create a simple API that returns a JSON response. The application listens on port 8000 and returns a message `{"Status" : "OK"}` when you access the application in a browser.
@z

@x
```typescript
// server.ts
import { Application, Router } from "https://deno.land/x/oak@v12.0.0/mod.ts";
@y
```typescript
// server.ts
import { Application, Router } from "https://deno.land/x/oak@v12.0.0/mod.ts";
@z

@x
const app = new Application();
const router = new Router();
@y
const app = new Application();
const router = new Router();
@z

@x
// Define a route that returns JSON
router.get("/", (context) => {
  context.response.body = { Status: "OK" };
  context.response.type = "application/json";
});
@y
// Define a route that returns JSON
router.get("/", (context) => {
  context.response.body = { Status: "OK" };
  context.response.type = "application/json";
});
@z

@x
app.use(router.routes());
app.use(router.allowedMethods());
@y
app.use(router.routes());
app.use(router.allowedMethods());
@z

@x
console.log("Server running on http://localhost:8000");
await app.listen({ port: 8000 });
```
@y
console.log("Server running on http://localhost:8000");
await app.listen({ port: 8000 });
```
@z

@x
## Create a Dockerfile
@y
## Create a Dockerfile
@z

@x
Before creating a Dockerfile, you need to choose a base image. You can either use the [Deno Docker Official Image](https://hub.docker.com/r/denoland/deno) or a Docker Hardened Image (DHI) from the [Hardened Image catalog](https://hub.docker.com/hardened-images/catalog).
@y
Before creating a Dockerfile, you need to choose a base image. You can either use the [Deno Docker Official Image](https://hub.docker.com/r/denoland/deno) or a Docker Hardened Image (DHI) from the [Hardened Image catalog](https://hub.docker.com/hardened-images/catalog).
@z

@x
Choosing DHI offers the advantage of a production-ready image that is lightweight and secure. For more information, see [Docker Hardened Images](https://docs.docker.com/dhi/).
@y
Choosing DHI offers the advantage of a production-ready image that is lightweight and secure. For more information, see [Docker Hardened Images](https://docs.docker.com/dhi/).
@z

@x
{{< tabs >}}
{{< tab name="Using Docker Hardened Images" >}}
Docker Hardened Images (DHIs) are available for Deno on [Docker Hub](https://hub.docker.com/hardened-images/catalog/dhi/deno). Unlike using the Docker Official Image, you must first mirror the Deno image into your organization and then use it as your base image. Follow the instructions in the [DHI quickstart](/dhi/get-started/) to create a mirrored repository for Deno.
@y
{{< tabs >}}
{{< tab name="Using Docker Hardened Images" >}}
Docker Hardened Images (DHIs) are available for Deno on [Docker Hub](https://hub.docker.com/hardened-images/catalog/dhi/deno). Unlike using the Docker Official Image, you must first mirror the Deno image into your organization and then use it as your base image. Follow the instructions in the [DHI quickstart](__SUBDIR__/dhi/get-started/) to create a mirrored repository for Deno.
@z

@x
Mirrored repositories must start with `dhi-`, for example: `FROM <your-namespace>/dhi-deno:<tag>`. In the following Dockerfile, the `FROM` instruction uses `<your-namespace>/dhi-deno:2` as the base image.
@y
Mirrored repositories must start with `dhi-`, for example: `FROM <your-namespace>/dhi-deno:<tag>`. In the following Dockerfile, the `FROM` instruction uses `<your-namespace>/dhi-deno:2` as the base image.
@z

@x
```dockerfile
# Use the DHI Deno image as the base image
FROM <your-namespace>/dhi-deno:2
@y
```dockerfile
# Use the DHI Deno image as the base image
FROM <your-namespace>/dhi-deno:2
@z

@x
# Set the working directory
WORKDIR /app
@y
# Set the working directory
WORKDIR /app
@z

@x
# Copy server code into the container
COPY server.ts .
@y
# Copy server code into the container
COPY server.ts .
@z

@x
# Set permissions (optional but recommended for security)
USER deno
@y
# Set permissions (optional but recommended for security)
USER deno
@z

@x
# Expose port 8000
EXPOSE 8000
@y
# Expose port 8000
EXPOSE 8000
@z

@x
# Run the Deno server
CMD ["run", "--allow-net", "server.ts"]
```
@y
# Run the Deno server
CMD ["run", "--allow-net", "server.ts"]
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
Using the Docker Official Image is straightforward. In the following Dockerfile, you'll notice that the `FROM` instruction uses `denoland/deno:latest` as the base image.
@y
Using the Docker Official Image is straightforward. In the following Dockerfile, you'll notice that the `FROM` instruction uses `denoland/deno:latest` as the base image.
@z

@x
This is the official image for Deno. This image is [available on the Docker Hub](https://hub.docker.com/r/denoland/deno).
@y
This is the official image for Deno. This image is [available on the Docker Hub](https://hub.docker.com/r/denoland/deno).
@z

@x
```dockerfile
# Use the official Deno image
FROM denoland/deno:latest
@y
```dockerfile
# Use the official Deno image
FROM denoland/deno:latest
@z

@x
# Set the working directory
WORKDIR /app
@y
# Set the working directory
WORKDIR /app
@z

@x
# Copy server code into the container
COPY server.ts .
@y
# Copy server code into the container
COPY server.ts .
@z

@x
# Set permissions (optional but recommended for security)
USER deno
@y
# Set permissions (optional but recommended for security)
USER deno
@z

@x
# Expose port 8000
EXPOSE 8000
@y
# Expose port 8000
EXPOSE 8000
@z

@x
# Run the Deno server
CMD ["run", "--allow-net", "server.ts"]
```
@y
# Run the Deno server
CMD ["run", "--allow-net", "server.ts"]
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
- Copies `server.ts` into the container.
- Sets the user to `deno` to run the application as a non-root user.
- Exposes port 8000 to allow traffic to the application.
- Runs the Deno server using the `CMD` instruction.
- Uses the `--allow-net` flag to allow network access to the application. The `server.ts` file uses the Oak framework to create a simple API that listens on port 8000.
@y
- Sets the working directory in the container to `/app`.
- Copies `server.ts` into the container.
- Sets the user to `deno` to run the application as a non-root user.
- Exposes port 8000 to allow traffic to the application.
- Runs the Deno server using the `CMD` instruction.
- Uses the `--allow-net` flag to allow network access to the application. The `server.ts` file uses the Oak framework to create a simple API that listens on port 8000.
@z

@x
## Run the application
@y
## Run the application
@z

@x
Make sure you are in the `deno-docker` directory. Run the following command in a terminal to build and run the application.
@y
Make sure you are in the `deno-docker` directory. Run the following command in a terminal to build and run the application.
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
Open a browser and view the application at [http://localhost:8000](http://localhost:8000). You will see a message `{"Status" : "OK"}` in the browser.
@y
Open a browser and view the application at [http://localhost:8000](http://localhost:8000). You will see a message `{"Status" : "OK"}` in the browser.
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
option. Inside the `deno-docker` directory, run the following command
in a terminal.
@y
You can run the application detached from the terminal by adding the `-d`
option. Inside the `deno-docker` directory, run the following command
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
Open a browser and view the application at [http://localhost:8000](http://localhost:8000).
@y
Open a browser and view the application at [http://localhost:8000](http://localhost:8000).
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
In this section, you learned how you can containerize and run your Deno
application using Docker.
@y
In this section, you learned how you can containerize and run your Deno
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
 - [Docker Hardened Images](/dhi/)
@y
 - [Dockerfile reference](reference/dockerfile.md)
 - [.dockerignore file](reference/dockerfile.md#dockerignore-file)
 - [Docker Compose overview](manuals/compose/_index.md)
 - [Compose file reference](reference/compose-file/_index.md)
 - [Docker Hardened Images](__SUBDIR__/dhi/)
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
