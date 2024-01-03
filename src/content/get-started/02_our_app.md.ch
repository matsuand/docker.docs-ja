%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Containerize an application
keywords: dockerfile example, Containerize an application, run docker file, running
  docker file, how to run dockerfile, example dockerfile, how to create a docker container,
  create dockerfile, simple dockerfile, creating containers
description: Follow this step-by-step guide to learn how to create and run a containerized
  application using Docker
aliases:
- /get-started/part2/
---
@y
---
title: アプリケーションのコンテナー化
keywords: dockerfile example, Containerize an application, run docker file, running
  docker file, how to run dockerfile, example dockerfile, how to create a docker container,
  create dockerfile, simple dockerfile, creating containers
description: Follow this step-by-step guide to learn how to create and run a containerized
  application using Docker
aliases:
- /get-started/part2/
---
@z

@x
For the rest of this guide, you'll be working with a simple todo
list manager that runs on Node.js. If you're not familiar with Node.js,
don't worry. This guide doesn't require any prior experience with JavaScript.
@y
ここからのガイドでは、Node.js において稼動する単純な ToDo リストマネージャーを作っていくことにします。
Node.js をよくわかっていなくても心配ありません。
JavaScript の知識などなくてもかまいません。
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
- You have installed the latest version of [Docker Desktop](../get-docker.md).
- You have installed a [Git client](https://git-scm.com/downloads).
- You have an IDE or a text editor to edit files. Docker recommends using [Visual Studio Code](https://code.visualstudio.com/).
@y
- You have installed the latest version of [Docker Desktop](../get-docker.md).
- You have installed a [Git client](https://git-scm.com/downloads).
- You have an IDE or a text editor to edit files. Docker recommends using [Visual Studio Code](https://code.visualstudio.com/).
@z

@x
## Get the app
@y
## アプリの入手 {#get-the-app}
@z

@x
Before you can run the application, you need to get the application source code onto your machine.
@y
アプリケーションを実行するために、アプリケーションのソースコードを入手してマシン上におくことが必要です。
@z

@x
1. Clone the [getting-started-app repository](https://github.com/docker/getting-started-app/tree/main) using the following command:
@y
1. Clone the [getting-started-app repository](https://github.com/docker/getting-started-app/tree/main) using the following command:
@z

@x
   ```console
   $ git clone https://github.com/docker/getting-started-app.git
   ```
@y
   ```console
   $ git clone https://github.com/docker/getting-started-app.git
   ```
@z

@x
2. View the contents of the cloned repository. You should see the following files and sub-directories.
@y
2. View the contents of the cloned repository. You should see the following files and sub-directories.
@z

@x
   ```text
   ├── getting-started-app/
   │ ├── package.json
   │ ├── README.md
   │ ├── spec/
   │ ├── src/
   │ └── yarn.lock
   ```
@y
   ```text
   ├── getting-started-app/
   │ ├── package.json
   │ ├── README.md
   │ ├── spec/
   │ ├── src/
   │ └── yarn.lock
   ```
@z

@x
## Build the app's image
@y
## アプリイメージのビルド {#build-the-apps-image}
@z

@x
To build the image, you'll need to use a Dockerfile. A Dockerfile is simply a text-based file with no file extension that contains a script of instructions. Docker uses this script to build a container image.
@y
To build the image, you'll need to use a Dockerfile. A Dockerfile is simply a text-based file with no file extension that contains a script of instructions. Docker uses this script to build a container image.
@z

@x
1. In the `getting-started-app` directory, the same location as the `package.json` file, create a file named `Dockerfile`. You can use the following commands to create a Dockerfile based on your operating system.
@y
1. In the `getting-started-app` directory, the same location as the `package.json` file, create a file named `Dockerfile`. You can use the following commands to create a Dockerfile based on your operating system.
@z

@x
   {{< tabs >}}
   {{< tab name="Mac / Linux" >}}
@y
   {{< tabs >}}
   {{< tab name="Mac / Linux" >}}
@z

@x
   In the terminal, run the following commands.
@y
   In the terminal, run the following commands.
@z

@x
   Make sure you're in the `getting-started-app` directory. Replace `/path/to/getting-started-app` with the path to your `getting-started-app` directory.
@y
   Make sure you're in the `getting-started-app` directory. Replace `/path/to/getting-started-app` with the path to your `getting-started-app` directory.
@z

@x
   ```console
   $ cd /path/to/getting-started-app
   ```
@y
   ```console
   $ cd /path/to/getting-started-app
   ```
@z

@x
   Create an empty file named `Dockerfile`.
@y
   Create an empty file named `Dockerfile`.
@z

@x
   ```console
   $ touch Dockerfile
   ```
@y
   ```console
   $ touch Dockerfile
   ```
@z

@x
   {{< /tab >}}
   {{< tab name="Windows" >}}
@y
   {{< /tab >}}
   {{< tab name="Windows" >}}
@z

@x
   In the Windows Command Prompt, run the following commands.
@y
   In the Windows Command Prompt, run the following commands.
@z

@x
   Make sure you're in the `getting-started-app` directory. Replace `\path\to\getting-started-app` with the path to your `getting-started-app` directory.
@y
   Make sure you're in the `getting-started-app` directory. Replace `\path\to\getting-started-app` with the path to your `getting-started-app` directory.
@z

@x
   ```console
   $ cd \path\to\getting-started-app
   ```
@y
   ```console
   $ cd \path\to\getting-started-app
   ```
@z

@x
   Create an empty file named `Dockerfile`.
@y
   Create an empty file named `Dockerfile`.
@z

@x
   ```console
   $ type nul > Dockerfile
   ```
@y
   ```console
   $ type nul > Dockerfile
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
2. Using a text editor or code editor, add the following contents to the Dockerfile:
@y
2. Using a text editor or code editor, add the following contents to the Dockerfile:
@z

@x
   ```dockerfile
   # syntax=docker/dockerfile:1
@y
   ```dockerfile
   # syntax=docker/dockerfile:1
@z

@x
   FROM node:18-alpine
   WORKDIR /app
   COPY . .
   RUN yarn install --production
   CMD ["node", "src/index.js"]
   EXPOSE 3000
   ```
@y
   FROM node:18-alpine
   WORKDIR /app
   COPY . .
   RUN yarn install --production
   CMD ["node", "src/index.js"]
   EXPOSE 3000
   ```
@z

@x
3. Build the image using the following commands:
@y
3. Build the image using the following commands:
@z

@x
   In the terminal, make sure you're in the `getting-started-app` directory. Replace `/path/to/getting-started-app` with the path to your `getting-started-app` directory.
@y
   In the terminal, make sure you're in the `getting-started-app` directory. Replace `/path/to/getting-started-app` with the path to your `getting-started-app` directory.
@z

@x
   ```console
   $ cd /path/to/getting-started-app
   ```
@y
   ```console
   $ cd /path/to/getting-started-app
   ```
@z

@x
   Build the image.
   ```console
   $ docker build -t getting-started .
   ```
@y
   Build the image.
   ```console
   $ docker build -t getting-started .
   ```
@z

@x
   The `docker build` command uses the Dockerfile to build a new image. You might have noticed that Docker downloaded a lot of "layers". This is because you instructed the builder that you wanted to start from the `node:18-alpine` image. But, since you didn't have that on your machine, Docker needed to download the image.
@y
   The `docker build` command uses the Dockerfile to build a new image. You might have noticed that Docker downloaded a lot of "layers". This is because you instructed the builder that you wanted to start from the `node:18-alpine` image. But, since you didn't have that on your machine, Docker needed to download the image.
@z

@x
   After Docker downloaded the image, the instructions from the Dockerfile copied in your application and used `yarn` to install your application's dependencies. The `CMD` directive specifies the default command to run when starting a container from this image.
@y
   After Docker downloaded the image, the instructions from the Dockerfile copied in your application and used `yarn` to install your application's dependencies. The `CMD` directive specifies the default command to run when starting a container from this image.
@z

@x
   Finally, the `-t` flag tags your image. Think of this as a human-readable name for the final image. Since you named the image `getting-started`, you can refer to that image when you run a container.
@y
   Finally, the `-t` flag tags your image. Think of this as a human-readable name for the final image. Since you named the image `getting-started`, you can refer to that image when you run a container.
@z

@x
   The `.` at the end of the `docker build` command tells Docker that it should look for the `Dockerfile` in the current directory.
@y
   The `.` at the end of the `docker build` command tells Docker that it should look for the `Dockerfile` in the current directory.
@z

@x
## Start an app container
@y
## アプリコンテナーの起動 {#start-an-app-container}
@z

@x
Now that you have an image, you can run the application in a container using the `docker run` command.
@y
Now that you have an image, you can run the application in a container using the `docker run` command.
@z

@x
1. Run your container using the `docker run` command and specify the name of the image you just created:
@y
1. Run your container using the `docker run` command and specify the name of the image you just created:
@z

@x
   ```console
   $ docker run -dp 127.0.0.1:3000:3000 getting-started
   ```
@y
   ```console
   $ docker run -dp 127.0.0.1:3000:3000 getting-started
   ```
@z

@x
   The `-d` flag (short for `--detach`) runs the container in the background.
   This means that Docker starts your container and returns you to the terminal
   prompt. You can verify that a container is running by viewing it in Docker
   Dashboard under **Containers**, or by running `docker ps` in the terminal.
@y
   The `-d` flag (short for `--detach`) runs the container in the background.
   This means that Docker starts your container and returns you to the terminal
   prompt. You can verify that a container is running by viewing it in Docker
   Dashboard under **Containers**, or by running `docker ps` in the terminal.
@z

@x
   The `-p` flag (short for `--publish`) creates a port mapping between the host
   and the container. The `-p` flag takes a string value in the format of
   `HOST:CONTAINER`, where `HOST` is the address on the host, and `CONTAINER` is
   the port on the container. The command publishes the container's port 3000 to
   `127.0.0.1:3000` (`localhost:3000`) on the host. Without the port mapping,
   you wouldn't be able to access the application from the host.
@y
   The `-p` flag (short for `--publish`) creates a port mapping between the host
   and the container. The `-p` flag takes a string value in the format of
   `HOST:CONTAINER`, where `HOST` is the address on the host, and `CONTAINER` is
   the port on the container. The command publishes the container's port 3000 to
   `127.0.0.1:3000` (`localhost:3000`) on the host. Without the port mapping,
   you wouldn't be able to access the application from the host.
@z

@x
2. After a few seconds, open your web browser to [http://localhost:3000](http://localhost:3000).
   You should see your app.
@y
2. After a few seconds, open your web browser to [http://localhost:3000](http://localhost:3000).
   You should see your app.
@z

@x
   ![Empty todo list](images/todo-list-empty.webp)
@y
   ![Empty todo list](images/todo-list-empty.webp)
@z

@x
3. Add an item or two and see that it works as you expect. You can mark items as complete and remove them. Your frontend is successfully storing items in the backend.
@y
3. Add an item or two and see that it works as you expect. You can mark items as complete and remove them. Your frontend is successfully storing items in the backend.
@z

@x
At this point, you have a running todo list manager with a few items.
@y
At this point, you have a running todo list manager with a few items.
@z

@x
If you take a quick look at your containers, you should see at least one container running that's using the `getting-started` image and on port `3000`. To see your containers, you can use the CLI or Docker Desktop's graphical interface.
@y
If you take a quick look at your containers, you should see at least one container running that's using the `getting-started` image and on port `3000`. To see your containers, you can use the CLI or Docker Desktop's graphical interface.
@z

@x
{{< tabs >}}
{{< tab name="CLI" >}}
@y
{{< tabs >}}
{{< tab name="CLI" >}}
@z

@x
Run the following `docker ps` command in a terminal to list your containers.
@y
Run the following `docker ps` command in a terminal to list your containers.
@z

@x
```console
$ docker ps
```
Output similar to the following should appear.
```console
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                      NAMES
df784548666d        getting-started     "docker-entrypoint.s…"   2 minutes ago       Up 2 minutes        127.0.0.1:3000->3000/tcp   priceless_mcclintock
```
@y
```console
$ docker ps
```
Output similar to the following should appear.
```console
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                      NAMES
df784548666d        getting-started     "docker-entrypoint.s…"   2 minutes ago       Up 2 minutes        127.0.0.1:3000->3000/tcp   priceless_mcclintock
```
@z

@x
{{< /tab >}}
{{< tab name="Docker Desktop" >}}
@y
{{< /tab >}}
{{< tab name="Docker Desktop" >}}
@z

@x
In Docker Desktop, select the **Containers** tab to see a list of your containers.
@y
In Docker Desktop, select the **Containers** tab to see a list of your containers.
@z

@x
![Docker Desktop with get-started container running](images/dashboard-two-containers.webp)
@y
![Docker Desktop with get-started container running](images/dashboard-two-containers.webp)
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you learned the basics about creating a Dockerfile to build an image. Once you built an image, you started a container and saw the running app.
@y
In this section, you learned the basics about creating a Dockerfile to build an image. Once you built an image, you started a container and saw the running app.
@z

@x
Related information:
@y
Related information:
@z

@x
 - [Dockerfile reference](../engine/reference/builder.md)
 - [docker CLI reference](/engine/reference/commandline/cli/)
 - [Build with Docker guide](../build/guide/index.md)
@y
 - [Dockerfile reference](../engine/reference/builder.md)
 - [docker CLI reference](/engine/reference/commandline/cli/)
 - [Build with Docker guide](../build/guide/index.md)
@z

@x
## Next steps
@y
## Next steps
@z

@x
Next, you're going to make a modification to your app and learn how to update your running application with a new image. Along the way, you'll learn a few other useful commands.
@y
Next, you're going to make a modification to your app and learn how to update your running application with a new image. Along the way, you'll learn a few other useful commands.
@z

@x
{{< button text="Update the application" url="03_updating_app.md" >}}
@y
{{< button text="Update the application" url="03_updating_app.md" >}}
@z
