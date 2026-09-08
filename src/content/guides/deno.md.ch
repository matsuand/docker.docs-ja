%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: Containerize and develop Deno applications using Docker.
keywords: getting started, deno
title: Deno language-specific guide
summary: |
  Learn how to containerize JavaScript applications with the Deno runtime using Docker.
linkTitle: Deno
@y
description: Containerize and develop Deno applications using Docker.
keywords: getting started, deno
title: Deno language-specific guide
summary: |
  Learn how to containerize JavaScript applications with the Deno runtime using Docker.
linkTitle: Deno
@z

@x
  time: 10 minutes
@y
  time: 10 分
@z

@x
The Deno getting started guide teaches you how to create a containerized Deno application using Docker.
@y
The Deno getting started guide teaches you how to create a containerized Deno application using Docker.
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
- Containerize and run a Deno application using Docker
- Set up a local environment to develop a Deno application using containers
- Use Docker Compose to run the application.
@y
- Containerize and run a Deno application using Docker
- Set up a local environment to develop a Deno application using containers
- Use Docker Compose to run the application.
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
After completing the Deno getting started modules, you should be able to containerize your own Deno application based on the examples and instructions provided in this guide.
@y
After completing the Deno getting started modules, you should be able to containerize your own Deno application based on the examples and instructions provided in this guide.
@z

@x
Start by containerizing an existing Deno application.
@y
Start by containerizing an existing Deno application.
@z

@x
## Containerize a Deno application
@y
## Containerize a Deno application
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
### Understand the sample application
@y
### Understand the sample application
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
### Create a Dockerfile
@y
### Create a Dockerfile
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
@y
{{< tabs >}}
{{< tab name="Using Docker Hardened Images" >}}
@z

@x
Docker Hardened Images (DHIs) are available for Deno in the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog/dhi/deno). You can pull DHIs directly from the `dhi.io` registry.
@y
Docker Hardened Images (DHIs) are available for Deno in the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog/dhi/deno). You can pull DHIs directly from the `dhi.io` registry.
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
2. Pull the Deno DHI as `dhi.io/deno:2`. The tag (`2`) in this example refers to the version to the latest 2.x version of Deno.
@y
2. Pull the Deno DHI as `dhi.io/deno:2`. The tag (`2`) in this example refers to the version to the latest 2.x version of Deno.
@z

@x
   ```console
   $ docker pull dhi.io/deno:2
   ```
@y
   ```console
   $ docker pull dhi.io/deno:2
   ```
@z

@x
For other available versions, refer to the [catalog](https://hub.docker.com/hardened-images/catalog/dhi/deno).
@y
For other available versions, refer to the [catalog](https://hub.docker.com/hardened-images/catalog/dhi/deno).
@z

@x
```dockerfile
# Use the DHI Deno image as the base image
FROM dhi.io/deno:2
@y
```dockerfile
# Use the DHI Deno image as the base image
FROM dhi.io/deno:2
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
### Run the application
@y
### Run the application
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
#### Run the application in the background
@y
#### Run the application in the background
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
## Use containers for Deno development
@y
## Use containers for Deno development
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Complete [Containerize a Deno application](#containerize-a-deno-application).
@y
Complete [Containerize a Deno application](#containerize-a-deno-application).
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
$ git clone https://github.com/dockersamples/docker-deno.git && cd docker-deno
```
@y
```console
$ git clone https://github.com/dockersamples/docker-deno.git && cd docker-deno
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
    image: deno-server
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "8000:8000"
    develop:
      watch:
        - action: rebuild
          path: .
```
@y
```yaml {hl_lines="9-12",linenos=true}
services:
  server:
    image: deno-server
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "8000:8000"
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
Now, if you modify your `server.ts` you will see the changes in real time without re-building the image.
@y
Now, if you modify your `server.ts` you will see the changes in real time without re-building the image.
@z

@x
To test it out, open the `server.ts` file in your favorite text editor and change the message from `{"Status" : "OK"}` to `{"Status" : "Updated"}`. Save the file and refresh your browser at `http://localhost:8000`. You should see the updated message.
@y
To test it out, open the `server.ts` file in your favorite text editor and change the message from `{"Status" : "OK"}` to `{"Status" : "Updated"}`. Save the file and refresh your browser at `http://localhost:8000`. You should see the updated message.
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
