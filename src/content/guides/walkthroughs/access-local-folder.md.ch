%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Access a local folder from a container
keywords: get started, quick start, intro, concepts
description: Learn how to access a local folder from a container
---
@y
---
title: Access a local folder from a container
keywords: get started, quick start, intro, concepts
description: Learn how to access a local folder from a container
---
@z

@x
This walkthrough shows you how to access a local folder from a container. To better understand some concepts in this walkthrough, complete the [Run multi-container applications](./multi-container-apps.md) walkthrough first.
@y
This walkthrough shows you how to access a local folder from a container. To better understand some concepts in this walkthrough, complete the [Run multi-container applications](./multi-container-apps.md) walkthrough first.
@z

@x
Docker isolates all content, code, and data in a container from your local filesystem. By default, containers can't access directories in your local filesystem.
@y
Docker isolates all content, code, and data in a container from your local filesystem. By default, containers can't access directories in your local filesystem.
@z

@x
![Data isolation diagram](images/getting-started-isolation.webp?w=400)
@y
![Data isolation diagram](images/getting-started-isolation.webp?w=400)
@z

@x
Sometimes, you may want to access a directory from your local filesystem. To do this, you can use bind mounts.
@y
Sometimes, you may want to access a directory from your local filesystem. To do this, you can use bind mounts.
@z

@x
{{< include "guides-get-docker.md" >}}
@y
{{< include "guides-get-docker.md" >}}
@z

@x
## Step 1: Get the sample application
@y
## Step 1: Get the sample application
@z

@x
If you have git, you can clone the repository for the sample application. Otherwise, you can download the sample application. Choose one of the following options.
@y
If you have git, you can clone the repository for the sample application. Otherwise, you can download the sample application. Choose one of the following options.
@z

@x
{{< tabs >}}
{{< tab name="Clone with git" >}}
@y
{{< tabs >}}
{{< tab name="Clone with git" >}}
@z

@x
Use the following command in a terminal to clone the sample application repository.
@y
Use the following command in a terminal to clone the sample application repository.
@z

@x
```console
$ git clone https://github.com/docker/bindmount-apps
```
@y
```console
$ git clone https://github.com/docker/bindmount-apps
```
@z

@x
{{< /tab >}}
{{< tab name="Download" >}}
@y
{{< /tab >}}
{{< tab name="Download" >}}
@z

@x
Download the source and extract it.
@y
Download the source and extract it.
@z

@x
{{< button url="https://github.com/docker/bindmount-apps/archive/refs/heads/main.zip" text="Download the source" >}}
@y
{{< button url="https://github.com/docker/bindmount-apps/archive/refs/heads/main.zip" text="Download the source" >}}
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Step 2: Add a bind mount using Compose
@y
## Step 2: Add a bind mount using Compose
@z

@x
Add a bind mount to access data on your system from a container. A bind mount lets you share a directory from your host's filesystem into the container.
@y
Add a bind mount to access data on your system from a container. A bind mount lets you share a directory from your host's filesystem into the container.
@z

@x
![Bind mount diagram](images/getting-started-bindmount.webp?w=400)
@y
![Bind mount diagram](images/getting-started-bindmount.webp?w=400)
@z

@x
To add a bind mount to this project, open the `compose.yaml` file in a code or text editor, and then uncomment the following lines.
@y
To add a bind mount to this project, open the `compose.yaml` file in a code or text editor, and then uncomment the following lines.
@z

@x
```yaml
todo-app:
    # ...
    volumes:
      - ./app:/usr/src/app
      - /usr/src/app/node_modules
@y
```yaml
todo-app:
    # ...
    volumes:
      - ./app:/usr/src/app
      - /usr/src/app/node_modules
@z

@x
```
@y
```
@z

@x
The `volumes` element tells Compose to mount the local folder `./app` to `/usr/src/app` in the container for the `todo-app` service. This particular bind mount overwrites the static contents of the `/usr/src/app` directory in the container and creates what is known as a development container. The second instruction, `/usr/src/app/node_modules`, prevents the bind mount from overwriting the container's `node_modules` directory to preserve the packages installed in the container.
@y
The `volumes` element tells Compose to mount the local folder `./app` to `/usr/src/app` in the container for the `todo-app` service. This particular bind mount overwrites the static contents of the `/usr/src/app` directory in the container and creates what is known as a development container. The second instruction, `/usr/src/app/node_modules`, prevents the bind mount from overwriting the container's `node_modules` directory to preserve the packages installed in the container.
@z

@x
## Step 3: Run the application
@y
## Step 3: Run the application
@z

@x
In a terminal, run the follow commands to bring up your application. Replace `/path/to/bindmount-apps/` with the path to your application's directory.
@y
In a terminal, run the follow commands to bring up your application. Replace `/path/to/bindmount-apps/` with the path to your application's directory.
@z

@x
{{< include "open-terminal.md" >}}
@y
{{< include "open-terminal.md" >}}
@z

@x
```console
$ cd /path/to/bindmount-apps/
```
```console
$ docker compose up -d
```
@y
```console
$ cd /path/to/bindmount-apps/
```
```console
$ docker compose up -d
```
@z

@x
## Step 4: Develop the application
@y
## Step 4: Develop the application
@z

@x
Now, you can take advantage of the container’s environment while you develop the application on your local system. Any changes you make to the application on your local system are reflected in the container. In your local directory, open `app/views/todos.ejs` in an code or text editor, update the `Enter your task` string, and save the file. Visit or refresh [localhost:3001](https://localhost:3001)⁠ to view the changes.
@y
Now, you can take advantage of the container’s environment while you develop the application on your local system. Any changes you make to the application on your local system are reflected in the container. In your local directory, open `app/views/todos.ejs` in an code or text editor, update the `Enter your task` string, and save the file. Visit or refresh [localhost:3001](https://localhost:3001)⁠ to view the changes.
@z

@x
## Summary
@y
## Summary
@z

@x
In this walkthrough, you added a bind mount to access a local folder from a container. You can use this to develop faster without having to rebuild your container when updating your code.
@y
In this walkthrough, you added a bind mount to access a local folder from a container. You can use this to develop faster without having to rebuild your container when updating your code.
@z

@x
Related information:
@y
Related information:
@z

@x
- Deep dive into [bind mounts](../../storage/bind-mounts.md)
- Learn about using bind mounts in Compose in the [Compose file reference](../../compose/compose-file/_index.md)
- Explore using bind mounts via the CLI in the [Docker run reference](/engine/reference/run/#volume-shared-filesystems)
@y
- Deep dive into [bind mounts](../../storage/bind-mounts.md)
- Learn about using bind mounts in Compose in the [Compose file reference](../../compose/compose-file/_index.md)
- Explore using bind mounts via the CLI in the [Docker run reference](/engine/reference/run/#volume-shared-filesystems)
@z

@x
## Next steps
@y
## Next steps
@z

@x
Continue to the next walkthrough to learn how you can containerize your own application.
@y
Continue to the next walkthrough to learn how you can containerize your own application.
@z

@x
{{< button url="./containerize-your-app.md" text="Containerize your app" >}}
@y
{{< button url="./containerize-your-app.md" text="Containerize your app" >}}
@z
