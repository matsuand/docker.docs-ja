%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Persist container data
keywords: get started, quick start, intro, concepts
description: Learn how to persist container data
---
@y
---
title: Persist container data
keywords: get started, quick start, intro, concepts
description: Learn how to persist container data
---
@z

@x
This walkthrough shows you how to persist data between containers. To better understand some concepts in this walkthrough, complete the [Run multi-container applications](./multi-container-apps.md) walkthrough first.
@y
This walkthrough shows you how to persist data between containers. To better understand some concepts in this walkthrough, complete the [Run multi-container applications](./multi-container-apps.md) walkthrough first.
@z

@x
Docker isolates all content, code, and data in a container from your local filesystem. When you delete a container, Docker deletes all the content within that container.
@y
Docker isolates all content, code, and data in a container from your local filesystem. When you delete a container, Docker deletes all the content within that container.
@z

@x
![Data isolation diagram](images/getting-started-isolation.webp?w=400)
@y
![Data isolation diagram](images/getting-started-isolation.webp?w=400)
@z

@x
Sometimes, you may want to persist the data that a container generates. To do this, you can use volumes.
@y
Sometimes, you may want to persist the data that a container generates. To do this, you can use volumes.
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
$ git clone https://github.com/docker/multi-container-app
```
@y
```console
$ git clone https://github.com/docker/multi-container-app
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
{{< button url="https://github.com/docker/multi-container-app/archive/refs/heads/main.zip" text="Download the source" >}}
@y
{{< button url="https://github.com/docker/multi-container-app/archive/refs/heads/main.zip" text="Download the source" >}}
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Step 2: Add a volume to persist data
@y
## Step 2: Add a volume to persist data
@z

@x
To persist data after you delete a container, use a volume. A volume is a location in your local filesystem, automatically managed by Docker Desktop.
@y
To persist data after you delete a container, use a volume. A volume is a location in your local filesystem, automatically managed by Docker Desktop.
@z

@x
![Volume diagram](images/getting-started-volume.webp?w=400)
@y
![Volume diagram](images/getting-started-volume.webp?w=400)
@z

@x
To add a volume to this project, open the `compose.yaml` file in a code or text editor, and then uncomment the following lines.
@y
To add a volume to this project, open the `compose.yaml` file in a code or text editor, and then uncomment the following lines.
@z

@x
```yaml
todo-database:
    # ...
    volumes:
      - database:/data/db
@y
```yaml
todo-database:
    # ...
    volumes:
      - database:/data/db
@z

@x
# ...
volumes:
  database:
```
@y
# ...
volumes:
  database:
```
@z

@x
The `volumes` element that is nested under `todo-database` tells Compose to mount the volume named `database` to `/data/db` in the container for the todo-database service.
@y
The `volumes` element that is nested under `todo-database` tells Compose to mount the volume named `database` to `/data/db` in the container for the todo-database service.
@z

@x
The top-level `volumes` element defines and configures a volume named `database` that can be used by any of the services in the Compose file.
@y
The top-level `volumes` element defines and configures a volume named `database` that can be used by any of the services in the Compose file.
@z

@x
## Step 3: Run the application
@y
## Step 3: Run the application
@z

@x
To run the multi-container application, open a terminal and run the following commands. Replace `/path/to/multi-container-app/` with the path to your application's directory.
@y
To run the multi-container application, open a terminal and run the following commands. Replace `/path/to/multi-container-app/` with the path to your application's directory.
@z

@x
{{< include "open-terminal.md" >}}
@y
{{< include "open-terminal.md" >}}
@z

@x
```console
$ cd /path/to/multi-container-app/
```
```console
$ docker compose up -d
```
@y
```console
$ cd /path/to/multi-container-app/
```
```console
$ docker compose up -d
```
@z

@x
## Step 4: View the frontend and add todos
@y
## Step 4: View the frontend and add todos
@z

@x
In the **Containers** tab of Docker Desktop, you should now have an application stack with two containers running (the todo-app, and todo-database).
@y
In the **Containers** tab of Docker Desktop, you should now have an application stack with two containers running (the todo-app, and todo-database).
@z

@x
To view the frontend and add todos:
@y
To view the frontend and add todos:
@z

@x
1. In Docker Desktop, expand the application stack in **Containers**.
2. Select the link to port **3000** in the **Port(s)** column or open [https://localhost:3000](https://localhost:3000)⁠.
3. Add some todo tasks in the frontend.
@y
1. In Docker Desktop, expand the application stack in **Containers**.
2. Select the link to port **3000** in the **Port(s)** column or open [https://localhost:3000](https://localhost:3000)⁠.
3. Add some todo tasks in the frontend.
@z

@x
## Step 5: Delete the application stack and run new containers
@y
## Step 5: Delete the application stack and run new containers
@z

@x
Now, no matter how often you delete and recreate the containers, Docker Desktop persists your data and it's accessible to any container on your system by mounting the `database` volume. Docker Desktop looks for the `database` volume and creates it if it doesn't exist.
@y
Now, no matter how often you delete and recreate the containers, Docker Desktop persists your data and it's accessible to any container on your system by mounting the `database` volume. Docker Desktop looks for the `database` volume and creates it if it doesn't exist.
@z

@x
To delete the application stack:
@y
To delete the application stack:
@z

@x
1. Open the **Containers** tab of Docker Desktop
2. Select the Delete icon next to your application stack.
@y
1. Open the **Containers** tab of Docker Desktop
2. Select the Delete icon next to your application stack.
@z

@x
![Deleting the application stack](images/getting-started-delete-stack.webp?border=true)
@y
![Deleting the application stack](images/getting-started-delete-stack.webp?border=true)
@z

@x
After you delete the application stack, follow the steps from [Step 3: Run the
application](#step-3-run-the-application) to run the application again. Note
that when you delete the containers and run them again, Docker Desktop persists any todos that you created.
@y
After you delete the application stack, follow the steps from [Step 3: Run the
application](#step-3-run-the-application) to run the application again. Note
that when you delete the containers and run them again, Docker Desktop persists any todos that you created.
@z

@x
## Summary
@y
## Summary
@z

@x
In this walkthrough, you persisted data between containers using a volume. You can use this to persist and share data among isolated and ephemeral containers.
@y
In this walkthrough, you persisted data between containers using a volume. You can use this to persist and share data among isolated and ephemeral containers.
@z

@x
Related information:
@y
Related information:
@z

@x
- Deep dive into [volumes](../../storage/volumes.md)
- Learn about using volumes in Compose in the [Compose file reference](../../compose/compose-file/_index.md)
- Explore using volumes via the CLI in the [docker volume CLI reference](../../engine/reference/commandline/volume_create.md) and [Docker run reference](/reference/run/)
@y
- Deep dive into [volumes](../../storage/volumes.md)
- Learn about using volumes in Compose in the [Compose file reference](../../compose/compose-file/_index.md)
- Explore using volumes via the CLI in the [docker volume CLI reference](../../engine/reference/commandline/volume_create.md) and [Docker run reference](/reference/run/)
@z

@x
## Next steps
@y
## Next steps
@z

@x
Continue to the next walkthrough to learn how you can access a local directory from a container.
@y
Continue to the next walkthrough to learn how you can access a local directory from a container.
@z

@x
{{< button url="./access-local-folder.md" text="Access a local folder" >}}
@y
{{< button url="./access-local-folder.md" text="Access a local folder" >}}
@z
